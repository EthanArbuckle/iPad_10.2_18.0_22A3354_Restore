@implementation DTGPUAPSCounterSource

- (DTGPUAPSCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6 profile:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  DTGPUAPSCounterSource *v16;
  DTGPUAPSCounterSource *v17;
  DTGPUAPSConfig *v18;
  DTGPUAPSConfig *apsConfig;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DTGPUAPSCounterSource;
  v16 = -[DTGPUAPSCounterSource init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_source, a3);
    objc_storeStrong((id *)&v17->_sourceGroup, a4);
    objc_storeStrong((id *)&v17->_selects, a5);
    v17->_sourceIndex = a6;
    v18 = objc_alloc_init(DTGPUAPSConfig);
    apsConfig = v17->_apsConfig;
    v17->_apsConfig = v18;

    v17->_profile = a7;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[DTGPUAPSCounterSource stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)DTGPUAPSCounterSource;
  -[DTGPUAPSCounterSource dealloc](&v3, sel_dealloc);
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLock *v17;
  NSLock *pullLock;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *pullQueue;
  dispatch_source_t v21;
  OS_dispatch_source **p_pullTimer;
  OS_dispatch_source *pullTimer;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id location;
  uint8_t buf[16];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (self->_source && self->_sourceGroup)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_selects);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ShaderProfiler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = 2;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Enabled Clique Tracing", buf, 2u);
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {
      v9 = 0;
    }
    -[DTGPUAPSConfig setCliqueTraceLevel:](self->_apsConfig, "setCliqueTraceLevel:", v9);
    -[DTGPUAPSConfig setNRingBuffers:](self->_apsConfig, "setNRingBuffers:", -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("APSConfig"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTGPUAPSConfig readConfig:](self->_apsConfig, "readConfig:", v11);
    if (self->_profile == 14)
      -[DTGPUAPSConfig setCountPeriod:](self->_apsConfig, "setCountPeriod:", 4096);
    v12 = (void *)MEMORY[0x24BE38F68];
    -[DTGPUAPSConfig grcTrigger](self->_apsConfig, "grcTrigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectWithName:options:", CFSTR("KickAndStateTracing"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[GPURawCounterSource requestTriggers:firstErrorIndex:](self->_source, "requestTriggers:firstErrorIndex:", v15, 0) & 1) != 0&& (-[DTGPUAPSConfig grcOptions](self->_apsConfig, "grcOptions"), v16 = (void *)objc_claimAutoreleasedReturnValue(), -[GPURawCounterSource setOptions:](self->_source, "setOptions:", v16), v16, *(_QWORD *)buf = 0, (-[GPURawCounterSource requestCounters:firstErrorIndex:](self->_source, "requestCounters:firstErrorIndex:", v6, buf) & 1) != 0)&& -[GPURawCounterSource setEnabled:](self->_source, "setEnabled:", 1))
    {
      sub_222B75EFC((uint64_t *)&self->_counterBuffers, -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"));
      v17 = (NSLock *)objc_opt_new();
      pullLock = self->_pullLock;
      self->_pullLock = v17;

      objc_initWeak(&location, self);
      v19 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gpu.rawcounters.pull", 0);
      pullQueue = self->_pullQueue;
      self->_pullQueue = v19;

      v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_pullQueue);
      pullTimer = self->_pullTimer;
      p_pullTimer = &self->_pullTimer;
      *p_pullTimer = (OS_dispatch_source *)v21;

      v24 = *p_pullTimer;
      v25 = dispatch_time(0, 50000000);
      dispatch_source_set_timer(v24, v25, 0x2FAF080uLL, 0x2FAF080uLL);
      v26 = *p_pullTimer;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_222B99058;
      v28[3] = &unk_24EB29FE0;
      objc_copyWeak(&v29, &location);
      dispatch_source_set_event_handler(v26, v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_pullTimer);
}

- (void)stop
{
  NSObject *pullTimer;
  OS_dispatch_source *v4;
  OS_dispatch_queue *pullQueue;
  NSLock *pullLock;

  -[NSLock lock](self->_pullLock, "lock");
  pullTimer = self->_pullTimer;
  if (pullTimer)
  {
    dispatch_source_cancel(pullTimer);
    v4 = self->_pullTimer;
    self->_pullTimer = 0;

    pullQueue = self->_pullQueue;
    self->_pullQueue = 0;

  }
  -[NSLock unlock](self->_pullLock, "unlock");
  -[DTGPUAPSCounterSource pullAndDrainCounters](self, "pullAndDrainCounters");
  -[GPURawCounterSource setEnabled:](self->_source, "setEnabled:", 0);
  pullLock = self->_pullLock;
  self->_pullLock = 0;

}

- (void)pullAndDrainCounters
{
  uint64_t v3;
  unint64_t i;
  char *begin;
  unsigned int v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  size_t v10;
  char *v11;
  _DWORD v12[3];
  void *__src;

  if (self->_pullQueue
    && self->_pullTimer
    && -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
  {
    v3 = 0;
    for (i = 0; i < -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"); ++i)
    {
      __src = 0;
      memset(v12, 0, sizeof(v12));
      if (-[GPURawCounterSource ringBufferInfoAtIndex:base:size:dataOffset:dataSize:](self->_source, "ringBufferInfoAtIndex:base:size:dataOffset:dataSize:", i, &__src, &v12[2], &v12[1], v12)&& 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3) > i)
      {
        -[NSLock lock](self->_pullLock, "lock");
        begin = (char *)self->_counterBuffers.__begin_;
        if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)begin) >> 3) <= i)
        {
          __break(1u);
          return;
        }
        v6 = v12[0];
        if (v12[0])
        {
          v7 = (unint64_t *)&begin[v3];
          v8 = *(_QWORD *)&begin[v3 + 8] - *(_QWORD *)&begin[v3];
          if (v8 >= v8 + v12[0])
          {
            if (v8 > v8 + v12[0])
              v7[1] += v12[0];
          }
          else
          {
            sub_222B77C64(v7, v12[0]);
            v6 = v12[0];
          }
          v9 = (void *)(*v7 + v8);
          if (v6 + v12[1] >= v12[2])
          {
            memcpy(v9, (char *)__src + v12[1], (v12[2] - v12[1]));
            v9 = (void *)(*v7 + (v12[2] - v12[1]) + v8);
            v11 = (char *)__src;
            v10 = (v12[1] - v12[2] + v12[0]);
          }
          else
          {
            v10 = v6;
            v11 = (char *)__src + v12[1];
          }
          memcpy(v9, v11, v10);
        }
        -[GPURawCounterSource drainRingBufferAtIndex:dataSize:](self->_source, "drainRingBufferAtIndex:dataSize:", i, v12[0]);
        -[NSLock unlock](self->_pullLock, "unlock");
      }
      v3 += 24;
    }
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  void (**v5)(_QWORD);
  _QWORD *begin;
  _QWORD *end;
  uint64_t v8;
  unint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;

  v5 = (void (**)(_QWORD))a4;
  -[NSLock lock](self->_pullLock, "lock");
  v10 = 0;
  v11 = 0;
  v12 = 0;
  sub_222B77D8C(&v10, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  -[NSLock unlock](self->_pullLock, "unlock");
  v8 = 0;
  for (i = 0; ; ++i)
  {
    if (i >= -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
    {
      v13 = (void **)&v10;
      sub_222B78004(&v13);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3) <= i)
      break;
    v5[2](v5);
    v8 += 24;
  }
  __break(1u);
}

- (void)sampleAPS:(id)a3
{
  id v4;
  _QWORD *begin;
  _QWORD *end;
  uint64_t v7;
  unint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;

  v4 = a3;
  -[NSLock lock](self->_pullLock, "lock");
  v9 = 0;
  v10 = 0;
  v11 = 0;
  sub_222B77D8C(&v9, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  -[NSLock unlock](self->_pullLock, "unlock");
  v7 = 0;
  for (i = 0; ; ++i)
  {
    if (i >= -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
    {
      v12 = (void **)&v9;
      sub_222B78004(&v12);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v10 - v9) >> 3) <= i)
      break;
    (*((void (**)(id, _QWORD, _QWORD, uint64_t, unint64_t, _QWORD))v4 + 2))(v4, *(_QWORD *)(v9 + v7), *(_QWORD *)(v9 + v7 + 8) - *(_QWORD *)(v9 + v7), 2, i, self->_sourceIndex);
    v7 += 24;
  }
  __break(1u);
}

- (DTGPUAPSConfig)apsConfig
{
  return self->_apsConfig;
}

- (GPURawCounterSource)source
{
  return self->_source;
}

- (GPURawCounterSourceGroup)sourceGroup
{
  return self->_sourceGroup;
}

- (unsigned)sourceIndex
{
  return self->_sourceIndex;
}

- (NSArray)selects
{
  return self->_selects;
}

- (void).cxx_destruct
{
  vector<std::vector<unsigned char>, std::allocator<std::vector<unsigned char>>> *p_counterBuffers;

  objc_storeStrong((id *)&self->_selects, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_apsConfig, 0);
  p_counterBuffers = &self->_counterBuffers;
  sub_222B78004((void ***)&p_counterBuffers);
  objc_storeStrong((id *)&self->_pullLock, 0);
  objc_storeStrong((id *)&self->_pullTimer, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end

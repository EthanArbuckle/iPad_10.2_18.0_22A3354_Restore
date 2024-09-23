@implementation DTGPUAGXCounterSource

- (DTGPUAGXCounterSource)initWithSource:(id)a3 sourceGroup:(id)a4 selects:(id)a5 sourceIndex:(unsigned int)a6
{
  id v11;
  id v12;
  id v13;
  DTGPUAGXCounterSource *v14;
  DTGPUAGXCounterSource *v15;
  OS_dispatch_source *pullTimer;
  OS_dispatch_queue *pullQueue;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DTGPUAGXCounterSource;
  v14 = -[DTGPUAGXCounterSource init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    objc_storeStrong((id *)&v15->_sourceGroup, a4);
    objc_storeStrong((id *)&v15->_selects, a5);
    v15->_sourceIndex = a6;
    pullTimer = v15->_pullTimer;
    v15->_pullTimer = 0;

    pullQueue = v15->_pullQueue;
    v15->_pullQueue = 0;

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[DTGPUAGXCounterSource stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)DTGPUAGXCounterSource;
  -[DTGPUAGXCounterSource dealloc](&v3, sel_dealloc);
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  BOOL v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GPURawCounterSource *source;
  void *v33;
  uint64_t v34;
  NSLock *pullLock;
  char *begin;
  dispatch_queue_t v37;
  OS_dispatch_queue *pullQueue;
  dispatch_source_t v39;
  OS_dispatch_source *pullTimer;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  unint64_t v45;
  void *v46;
  DTGPUAGXCounterSource *val;
  id v48;
  _QWORD handler[4];
  id v50;
  id location[2];
  char *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v48 = a4;
  if (self->_source && self->_sourceGroup)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_selects);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = a3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", &unk_24EB4EED0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[GPURawCounterSource name](self->_source, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    val = self;
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("RDE")) & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("ShaderProfiler"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      if (v9)
      {
        v10 = (void *)objc_opt_new();
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[GPURawCounterSource availableCounters](self->_source, "availableCounters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v59 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(v15, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("GRC_SHADER_PROFILER_DATA_")) == 0;

              if (v17)
              {
                objc_msgSend(v15, "name");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v18);

              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v12);
        }

        if (objc_msgSend(v10, "count"))
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v19 = v10;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v55 != v21)
                  objc_enumerationMutation(v19);
                objc_msgSend(MEMORY[0x24BE38F60], "selectWithName:options:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j), &unk_24EB4EEF8);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v23);

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
            }
            while (v20);
          }

        }
        else
        {
          objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_24EB4EAF8, CFSTR("ShaderProfiler"));
        }

        self = val;
      }
    }
    else
    {

    }
    -[GPURawCounterSource setOptions:](self->_source, "setOptions:", v46);
    -[GPURawCounterSource name](self->_source, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsString:", CFSTR("BMPR"));

    if (v26)
    {
      v27 = (void *)MEMORY[0x24BE38F68];
      v65 = CFSTR("Period");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)((double)v45 / 125.0 * 3.0));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "selectWithName:options:", CFSTR("TimerNClock"), v29);
    }
    else
    {
      v30 = (void *)MEMORY[0x24BE38F68];
      v63 = CFSTR("Period");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v45);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "selectWithName:options:", CFSTR("TimerFixed"), v29);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    source = val->_source;
    v62 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(source) = -[GPURawCounterSource requestTriggers:firstErrorIndex:](source, "requestTriggers:firstErrorIndex:", v33, 0);

    if ((source & 1) != 0
      && (v53 = 0,
          (-[GPURawCounterSource requestCounters:firstErrorIndex:](val->_source, "requestCounters:firstErrorIndex:", v6, &v53) & 1) != 0)&& -[GPURawCounterSource setEnabled:](val->_source, "setEnabled:", 1))
    {
      sub_222B75EFC((uint64_t *)&val->_counterBuffers, -[GPURawCounterSource ringBufferNum](val->_source, "ringBufferNum"));
      v34 = objc_opt_new();
      pullLock = val->_pullLock;
      val->_pullLock = (NSLock *)v34;

      sub_222B77BB4(location, 0x2000000uLL);
      begin = val->_tmpOutBuffer.__begin_;
      if (begin)
      {
        val->_tmpOutBuffer.__end_ = begin;
        operator delete(begin);
        val->_tmpOutBuffer.__begin_ = 0;
        val->_tmpOutBuffer.__end_ = 0;
        val->_tmpOutBuffer.__end_cap_.__value_ = 0;
      }
      *(_OWORD *)&val->_tmpOutBuffer.__begin_ = *(_OWORD *)location;
      val->_tmpOutBuffer.__end_cap_.__value_ = v52;
      objc_initWeak(location, val);
      v37 = dispatch_queue_create("com.apple.gpu.rawcounters.pull", 0);
      pullQueue = val->_pullQueue;
      val->_pullQueue = (OS_dispatch_queue *)v37;

      v39 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)val->_pullQueue);
      pullTimer = val->_pullTimer;
      val->_pullTimer = (OS_dispatch_source *)v39;

      v41 = val->_pullTimer;
      v42 = dispatch_time(0, 100000000);
      dispatch_source_set_timer(v41, v42, 0x5F5E100uLL, 0x5F5E100uLL);
      v43 = val->_pullTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = sub_222B75F90;
      handler[3] = &unk_24EB29FE0;
      objc_copyWeak(&v50, location);
      dispatch_source_set_event_handler(v43, handler);
      objc_destroyWeak(&v50);
      objc_destroyWeak(location);
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
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
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  size_t v12;
  char *v13;
  _DWORD v14[3];
  void *__src;

  if (-[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
  {
    v3 = 0;
    for (i = 0; i < -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"); ++i)
    {
      __src = 0;
      memset(v14, 0, sizeof(v14));
      if (-[GPURawCounterSource ringBufferInfoAtIndex:base:size:dataOffset:dataSize:](self->_source, "ringBufferInfoAtIndex:base:size:dataOffset:dataSize:", i, &__src, &v14[2], &v14[1], v14)&& 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3) > i)
      {
        -[NSLock lock](self->_pullLock, "lock");
        begin = (char *)self->_counterBuffers.__begin_;
        if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)begin) >> 3) <= i)
        {
          __break(1u);
          return;
        }
        v6 = v14[0];
        if (v14[0])
        {
          v7 = (unint64_t *)&begin[v3];
          v8 = *(_QWORD *)&begin[v3];
          v9 = v7[1] - v8;
          v10 = v9 + v14[0];
          if (!(v10 >> 27))
          {
            if (v9 >= v10)
            {
              if (v9 > v10)
                v7[1] = v8 + v10;
            }
            else
            {
              sub_222B77C64(v7, v14[0]);
              v6 = v14[0];
            }
            v11 = (void *)(*v7 + v9);
            if (v6 + v14[1] >= v14[2])
            {
              memcpy(v11, (char *)__src + v14[1], (v14[2] - v14[1]));
              v11 = (void *)(*v7 + (v14[2] - v14[1]) + v9);
              v13 = (char *)__src;
              v12 = (v14[1] - v14[2] + v14[0]);
            }
            else
            {
              v12 = v6;
              v13 = (char *)__src + v14[1];
            }
            memcpy(v11, v13, v12);
          }
        }
        -[GPURawCounterSource drainRingBufferAtIndex:dataSize:](self->_source, "drainRingBufferAtIndex:dataSize:", i, v14[0]);
        -[NSLock unlock](self->_pullLock, "unlock");
      }
      v3 += 24;
    }
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  _QWORD *begin;
  _QWORD *end;
  uint64_t i;
  unint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  size_t __n;
  uint64_t v32;
  void *__p;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v30 = a4;
  -[NSLock lock](self->_pullLock, "lock");
  v36 = 0;
  v37 = 0;
  v38 = 0;
  sub_222B77D8C(&v36, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  -[NSLock unlock](self->_pullLock, "unlock");
  for (i = 0; ; i = (i + 1))
  {
    if (i >= -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
    {
      __p = &v36;
      sub_222B78004((void ***)&__p);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v37 - v36) >> 3) <= i)
      break;
    v8 = (unint64_t *)(v36 + 24 * i);
    __p = 0;
    v34 = 0;
    v35 = 0;
    v9 = (uint64_t *)(v8 + 1);
    sub_222B42AEC((unint64_t *)&__p, 2 * (v8[1] - *v8));
    __n = 0;
    v32 = 0;
    v10 = v8[1];
    v11 = *v8;
    -[GPURawCounterSource resetRawDataPostProcessor](self->_source, "resetRawDataPostProcessor");
    v12 = *v8;
    if (v8[1] == *v8)
      goto LABEL_36;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = v10 - v11;
    while (1)
    {
      LOBYTE(v29) = 0;
      -[GPURawCounterSource postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:](self->_source, "postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:", v12 + v15, v16 + v13, &v32, self->_tmpOutBuffer.__begin_, self->_tmpOutBuffer.__end_ - self->_tmpOutBuffer.__begin_, &__n, v29);
      v17 = v32;
      if (!v32)
        break;
      if (__n && __n + v14 < v35 - (uint64_t)__p)
      {
        memcpy((char *)__p + v14, self->_tmpOutBuffer.__begin_, __n);
        v14 += __n;
      }
      v15 += v17;
      v13 = -(uint64_t)v15;
      v18 = *v9;
      v12 = *v8;
      if (v15 >= *v9 - *v8)
        goto LABEL_16;
    }
    v18 = *v9;
    v12 = *v8;
LABEL_16:
    v19 = v18 - v12;
    v20 = v18 - v12 >= v15;
    v21 = v18 - v12 - v15;
    if (v20)
    {
      if (v19 > v21)
        *v9 = v12 + v21;
    }
    else
    {
      sub_222B77C64(v8, v13);
    }
    v22 = (char *)__p;
    if (v14 >= 1)
    {
      v23 = (char *)__p + v14;
      do
      {
        do
        {
          v24 = *(_QWORD *)v22;
          if (v24 == -[GPURawCounterSourceGroup sampleMarker](self->_sourceGroup, "sampleMarker"))
            break;
          v22 += 8;
        }
        while (v22 < v23);
        v25 = v22 + 8;
        if (v22 + 8 >= v23)
          break;
        v26 = 0;
        while (1)
        {
          v27 = v25[v26];
          if (v27 == -[GPURawCounterSourceGroup sampleMarker](self->_sourceGroup, "sampleMarker"))
            break;
          if (&v25[++v26] >= (_QWORD *)v23)
            goto LABEL_36;
        }
        if ((unint64_t)v26 >= 5)
        {
          v28 = *((_QWORD *)v22 + 5);
          if (v28 > 6)
          {
            if (v28 == 7)
              (*((void (**)(id, _QWORD *, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))v30 + 2))(v30, (_QWORD *)v22 + 6, (v26 * 8 - 40) >> 3, *((_QWORD *)v22 + 1), 1, i, self->_sourceIndex);
          }
          else if ((v26 * 8) >> 3 == -[NSArray count](self->_selects, "count"))
          {
            (*((void (**)(id, _QWORD *, NSUInteger, _QWORD, _QWORD, uint64_t, _QWORD))v30 + 2))(v30, (_QWORD *)v22 + 1, -[NSArray count](self->_selects, "count"), *v25, 0, i, self->_sourceIndex);
          }
        }
        v22 = (char *)&v25[v26];
      }
      while (&v25[v26] < (_QWORD *)v23);
LABEL_36:
      v22 = (char *)__p;
    }
    if (v22)
    {
      v34 = v22;
      operator delete(v22);
    }
  }
  __break(1u);
}

- (void)sampleAPS:(id)a3
{
  id v4;
  _QWORD *begin;
  _QWORD *end;
  uint64_t i;
  unint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *__p;
  _BYTE *v31;
  uint64_t v32;
  size_t __n;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  -[NSLock lock](self->_pullLock, "lock");
  v38 = 0;
  v39 = 0;
  v40 = 0;
  sub_222B77D8C(&v38, (uint64_t)self->_counterBuffers.__begin_, (uint64_t)self->_counterBuffers.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_counterBuffers.__end_ - (char *)self->_counterBuffers.__begin_) >> 3));
  begin = self->_counterBuffers.__begin_;
  end = self->_counterBuffers.__end_;
  while (begin != end)
  {
    begin[1] = *begin;
    begin += 3;
  }
  -[NSLock unlock](self->_pullLock, "unlock");
  for (i = 0; ; i = (i + 1))
  {
    if (i >= -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
    {
      v35 = &v38;
      sub_222B78004((void ***)&v35);

      return;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3) <= i)
      break;
    v8 = (unint64_t *)(v38 + 24 * i);
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v9 = (uint64_t *)(v8 + 1);
    sub_222B42AEC((unint64_t *)&v35, 2 * (v8[1] - *v8));
    __n = 0;
    v34 = 0;
    v10 = v8[1];
    v11 = *v8;
    -[GPURawCounterSource resetRawDataPostProcessor](self->_source, "resetRawDataPostProcessor");
    v12 = v10 - v11;
    v13 = *v8;
    if (v8[1] == *v8)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      while (1)
      {
        LOBYTE(v29) = 0;
        -[GPURawCounterSource postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:](self->_source, "postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:", v13 + v15, v12 - v15, &v34, self->_tmpOutBuffer.__begin_, self->_tmpOutBuffer.__end_ - self->_tmpOutBuffer.__begin_, &__n, v29);
        v16 = v34;
        if (!v34)
          break;
        if (__n && __n + v14 < v37 - (uint64_t)v35)
        {
          memcpy((char *)v35 + v14, self->_tmpOutBuffer.__begin_, __n);
          v14 += __n;
        }
        v15 += v16;
        v17 = *v9;
        v13 = *v8;
        if (v15 >= *v9 - *v8)
          goto LABEL_17;
      }
      v17 = *v9;
      v13 = *v8;
LABEL_17:
      v18 = v17 - v13;
      v19 = v17 - v13 >= v15;
      v20 = v17 - v13 - v15;
      if (v19)
      {
        if (v18 > v20)
          *v9 = v13 + v20;
      }
      else
      {
        sub_222B77C64(v8, -(uint64_t)v15);
      }
    }
    __p = 0;
    v31 = 0;
    v32 = 0;
    sub_222B69CB0(&__p, v12 >> 3);
    if (v14 >= 1)
    {
      v21 = (char *)v35;
      v22 = (char *)v35 + v14;
      do
      {
        do
        {
          v23 = *(_QWORD *)v21;
          if (v23 == -[GPURawCounterSourceGroup sampleMarker](self->_sourceGroup, "sampleMarker"))
            break;
          v21 += 8;
        }
        while (v21 < v22);
        v24 = v21 + 8;
        if (v21 + 8 >= v22)
          break;
        v25 = 0;
        while (1)
        {
          v26 = *(_QWORD *)&v24[v25];
          if (v26 == -[GPURawCounterSourceGroup sampleMarker](self->_sourceGroup, "sampleMarker"))
            break;
          v25 += 8;
          if (&v24[v25] >= v22)
            goto LABEL_35;
        }
        if ((unint64_t)v25 >= 0x28
          && *((_QWORD *)v21 + 5) <= 6uLL
          && v25 >> 3 == -[NSArray count](self->_selects, "count"))
        {
          v27 = (uint64_t)v31;
          v28 = -[NSArray count](self->_selects, "count");
          sub_222B78098((uint64_t)&__p, v27, v21 + 8, &v24[8 * v28], v28);
        }
        v21 = &v24[v25];
      }
      while (&v24[v25] < v22);
    }
LABEL_35:
    (*((void (**)(id, void *, int64_t, uint64_t, uint64_t, _QWORD))v4 + 2))(v4, __p, v31 - (_BYTE *)__p, 3, i, self->_sourceIndex);
    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }
  }
  __break(1u);
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
  char *begin;
  vector<std::vector<unsigned char>, std::allocator<std::vector<unsigned char>>> *p_counterBuffers;

  objc_storeStrong((id *)&self->_selects, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
  objc_storeStrong((id *)&self->_source, 0);
  begin = self->_tmpOutBuffer.__begin_;
  if (begin)
  {
    self->_tmpOutBuffer.__end_ = begin;
    operator delete(begin);
  }
  p_counterBuffers = &self->_counterBuffers;
  sub_222B78004((void ***)&p_counterBuffers);
  objc_storeStrong((id *)&self->_pullLock, 0);
  objc_storeStrong((id *)&self->_pullTimer, 0);
  objc_storeStrong((id *)&self->_pullQueue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end

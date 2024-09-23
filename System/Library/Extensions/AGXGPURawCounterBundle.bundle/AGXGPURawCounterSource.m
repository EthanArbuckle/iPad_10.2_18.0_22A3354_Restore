@implementation AGXGPURawCounterSource

- (AGXGPURawCounterSource)initWithSourceGroup:(id)a3 impl:(Source *)a4
{
  void *v7;
  uint64_t v8;
  AGXGPURawCounterSource *v9;
  AGXGPURawCounterSource *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  id v21;
  char v22;
  char v23;
  void *v25;
  void *v26;
  objc_super v27;

  v7 = (void *)(*((uint64_t (**)(Source *, SEL))a4->var0 + 3))(a4, a2);
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  free(v7);
  v27.receiver = self;
  v27.super_class = (Class)AGXGPURawCounterSource;
  v9 = -[_GPURawCounterSource initWithSourceGroup:name:](&v27, sel_initWithSourceGroup_name_, a3, v8);
  v10 = v9;
  if (v9)
  {
    v9->_impl = a4;
    v11 = (void *)MEMORY[0x2348CE920]();
    v26 = 0;
    v12 = (*((uint64_t (**)(Source *, void **))v10->_impl->var0 + 4))(v10->_impl, &v26);
    if (v12)
    {
      v13 = v12;
      v25 = v11;
      v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v12);
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = (char *)v26 + v15;
        v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)((char *)v26 + v15));
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)v17 + 1));
        -[NSArray setObject:atIndexedSubscript:](v14, "setObject:atIndexedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F70]), "initWithName:description:valueType:", v18, v19, *((_DWORD *)v17 + 4) != 0), v16++);
        v15 += 24;
      }
      while (v13 != v16);
      v10->_counterList = v14;
      free(v26);
      v11 = v25;
    }
    v20 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 1) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("TimerNClock")));
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 2) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("TimerFixed")));
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 4) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("KickBoundary")));
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 8) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("CPMS")));
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 0x10) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("KickTracing")));
    if (((*((uint64_t (**)(Source *))v10->_impl->var0 + 9))(v10->_impl) & 0x20) != 0)
      -[NSArray addObject:](v20, "addObject:", objc_msgSend((id)sSourceGroupTriggerList, "objectForKeyedSubscript:", CFSTR("KickAndStateTracing")));
    v10->_triggerList = v20;
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v22 = (*((uint64_t (**)(Source *))v10->_impl->var0 + 14))(v10->_impl);
    v23 = v22;
    if ((v22 & 1) != 0)
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_ShaderProfiler"));
      v23 &= ~1u;
      if ((v23 & 2) == 0)
      {
LABEL_20:
        if ((v23 & 4) == 0)
          goto LABEL_21;
        goto LABEL_28;
      }
    }
    else if ((v22 & 2) == 0)
    {
      goto LABEL_20;
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_KickTimestamp"));
    v23 &= ~2u;
    if ((v23 & 4) == 0)
    {
LABEL_21:
      if ((v23 & 8) == 0)
        goto LABEL_22;
      goto LABEL_29;
    }
LABEL_28:
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_SWResetOnRead"));
    v23 &= ~4u;
    if ((v23 & 8) == 0)
    {
LABEL_22:
      if ((v23 & 0x10) == 0)
      {
LABEL_24:
        *(Class *)((char *)&v10->super.super.isa + (int)*MEMORY[0x24BE38F80]) = (Class)v21;
        objc_autoreleasePoolPop(v11);
        return v10;
      }
LABEL_23:
      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_CliqueAdvanceReason"));
      goto LABEL_24;
    }
LABEL_29:
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_APSOptions"));
    if ((v23 & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AGXGPURawCounterSource;
  -[_GPURawCounterSource dealloc](&v3, sel_dealloc);
}

- (void)setOptions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AGXGPURawCounterSource;
  -[_GPURawCounterSource setOptions:](&v4, sel_setOptions_, a3);
  (*((void (**)(Source *, _QWORD))self->_impl->var0 + 13))(self->_impl, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE38F88]));
}

- (BOOL)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  BOOL v6;

  v3 = a3;
  v5 = (*((uint64_t (**)(Source *, BOOL))self->_impl->var0 + 5))(self->_impl, a3);
  if (v5)
    v6 = !v3;
  else
    v6 = 1;
  if (!v6)
    -[AGXGPURawCounterSource resetRawDataPostProcessor](self, "resetRawDataPostProcessor");
  return v5;
}

- (BOOL)isEnabled
{
  return (*((uint64_t (**)(Source *))self->_impl->var0 + 6))(self->_impl);
}

- (id)availableTriggers
{
  return self->_triggerList;
}

- (id)selectedTriggers
{
  return self->_selectedTriggerList;
}

- (BOOL)requestTriggers:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  self->_selectedTriggerList = 0;
  (*((void (**)(Source *))self->_impl->var0 + 10))(self->_impl);
  if (!objc_msgSend(a3, "count"))
    return 1;
  if (!objc_msgSend(a3, "count"))
    goto LABEL_23;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("TimerNClock")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("TimerFixed")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("KickBoundary")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("CPMS")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("KickTracing")) & 1) != 0)
    {
      v9 = 4;
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "name"), "isEqualToString:", CFSTR("KickAndStateTracing")))break;
      v9 = 5;
    }
    if (!(*((unsigned int (**)(Source *, _QWORD, uint64_t))self->_impl->var0 + 11))(self->_impl, *((unsigned int *)&sSourceTriggerNameToTypeMap + 4 * v9 + 2), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "options")))break;
    v7 = ++v8;
    if (objc_msgSend(a3, "count") <= (unint64_t)v8)
      goto LABEL_23;
  }
  if (v8 == -1)
  {
LABEL_23:
    self->_selectedTriggerList = (NSArray *)objc_msgSend(a3, "copy");
    return 1;
  }
  if (a4)
    *a4 = v8;
  (*((void (**)(Source *))self->_impl->var0 + 10))(self->_impl);
  return 0;
}

- (id)availableCounters
{
  return self->_counterList;
}

- (id)selectedCounters
{
  return self->_selectedCounterList;
}

- (BOOL)requestCounter:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Width")))
    v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Width")), "unsignedIntValue");
  else
    v5 = 32;
  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Partition")))
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Partition")), "unsignedLongValue");
  else
    v6 = 0xFFFFFFFFLL;
  if (objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Select")))
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("Select")), "unsignedLongLongValue");
  else
    v7 = -1;
  HIDWORD(v8) = v5;
  LODWORD(v8) = v5 - 16;
  if ((v8 >> 4) <= 3 && ((_DWORD)v6 != -1 || v7 == -1) && ((_DWORD)v6 == -1 || v7 != -1))
    return (*((uint64_t (**)(Source *, uint64_t, uint64_t, uint64_t, uint64_t))self->_impl->var0 + 8))(self->_impl, objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String"), v5, v6, v7);
  else
    return 0;
}

- (BOOL)requestCounters:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  uint64_t v7;
  unsigned int v8;
  BOOL result;

  (*((void (**)(Source *, SEL))self->_impl->var0 + 7))(self->_impl, a2);

  self->_selectedCounterList = 0;
  if (!objc_msgSend(a3, "count"))
    goto LABEL_9;
  v7 = 0;
  v8 = 0;
  while (-[AGXGPURawCounterSource requestCounter:](self, "requestCounter:", objc_msgSend(a3, "objectAtIndexedSubscript:", v7)))
  {
    v7 = ++v8;
    if (objc_msgSend(a3, "count") <= (unint64_t)v8)
      goto LABEL_9;
  }
  if (v8 == -1)
  {
LABEL_9:
    self->_selectedCounterList = (NSArray *)objc_msgSend(a3, "copy");
    return 1;
  }
  else
  {
    result = 0;
    if (a4)
      *a4 = v8;
  }
  return result;
}

- (unsigned)ringBufferNum
{
  return (*((uint64_t (**)(Source *))self->_impl->var0 + 22))(self->_impl);
}

- (BOOL)ringBufferInfoAtIndex:(unsigned int)a3 base:(char *)a4 size:(unsigned int *)a5 dataOffset:(unsigned int *)a6 dataSize:(unsigned int *)a7
{
  uint64_t v11;
  uint64_t v12;

  v11 = (*((uint64_t (**)(Source *, _QWORD))self->_impl->var0 + 21))(self->_impl, *(_QWORD *)&a3);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
  if (v12)
  {
    *a4 = (char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    *a5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
    LOBYTE(v12) = (*(uint64_t (**)(uint64_t, unsigned int *, unsigned int *))(*(_QWORD *)v11 + 32))(v11, a6, a7);
  }
  return v12;
}

- (unsigned)drainRingBufferAtIndex:(unsigned int)a3 dataSize:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = (*((uint64_t (**)(Source *, _QWORD))self->_impl->var0 + 21))(self->_impl, *(_QWORD *)&a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 40))(v5, v4);
}

- (void)flushRingBuffers
{
  (*((void (**)(Source *))self->_impl->var0 + 23))(self->_impl);
}

- (void)resetRawDataPostProcessor
{
  NSMutableArray *pollPostProcessBufferList;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  (*((void (**)(Source *, _QWORD))self->_impl->var0 + 26))(self->_impl, 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  pollPostProcessBufferList = self->_pollPostProcessBufferList;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pollPostProcessBufferList, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(pollPostProcessBufferList);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reset");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pollPostProcessBufferList, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9
{
  return (*((uint64_t (**)(Source *, _QWORD, char *, unint64_t, unint64_t *, char *, unint64_t, unint64_t *))self->_impl->var0
          + 24))(self->_impl, 0, a3, a4, a5, a6, a7, a8);
}

- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11
{
  return (*((uint64_t (**)(Source *, _QWORD, char *, unint64_t, unint64_t *, unint64_t, char *, unint64_t))self->_impl->var0
          + 25))(self->_impl, 0, a3, a4, a5, a6, a7, a8);
}

- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12
{
  return (*((uint64_t (**)(Source *, _QWORD, char *, unint64_t, unint64_t *, unint64_t, char *, unint64_t, unint64_t, unint64_t *))self->_impl->var0
          + 25))(self->_impl, *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (BOOL)pollCountersAtBufferIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v5;
  NSMutableArray *pollPostProcessBufferList;
  unsigned int v8;
  PollPostProcessBuffer *v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  int v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unsigned int v41;
  uint64_t v42;

  v5 = *(_QWORD *)&a3;
  v42 = *MEMORY[0x24BDAC8D0];
  if (-[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum") <= a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", "AGXGPURawCounterSourceGroup.mm", 564, "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]", v5, -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum"));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterSourceGroup.mm";
      v34 = 1024;
      v35 = 564;
      v36 = 2080;
      v37 = "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]";
      v38 = 1024;
      v39 = v5;
      v40 = 1024;
      v41 = -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum");
      _os_log_error_impl(&dword_23103D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", buf, 0x28u);
    }
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (v14)
    {
      v24 = -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AGXGPURawCounterSourceGroup.mm";
      v34 = 1024;
      v35 = 564;
      v36 = 2080;
      v37 = "-[AGXGPURawCounterSource pollCountersAtBufferIndex:withBlock:]";
      v38 = 1024;
      v39 = v5;
      v40 = 1024;
      v41 = v24;
      _os_log_impl(&dword_23103D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGXGRC:AGXGRC:%s:%d:%s: *** Error, buffer index is out of range! (%u > %u)\n\n", buf, 0x28u);
LABEL_27:
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    pollPostProcessBufferList = self->_pollPostProcessBufferList;
    if (!pollPostProcessBufferList)
    {
      self->_pollPostProcessBufferList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum"));
      if (-[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum"))
      {
        v8 = 0;
        do
        {
          v9 = objc_alloc_init(PollPostProcessBuffer);
          -[NSMutableArray addObject:](self->_pollPostProcessBufferList, "addObject:", v9);

          ++v8;
        }
        while (v8 < -[AGXGPURawCounterSource ringBufferNum](self, "ringBufferNum"));
      }
      -[AGXGPURawCounterSource resetRawDataPostProcessor](self, "resetRawDataPostProcessor");
      pollPostProcessBufferList = self->_pollPostProcessBufferList;
    }
    v10 = v5;
    v11 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](pollPostProcessBufferList, "objectAtIndexedSubscript:", v5), "srcBufferPrevOffset");
    v12 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v5), "srcBufferPrevSize");
    v32 = 0;
    *(_QWORD *)buf = 0;
    v31 = 0;
    v13 = -[AGXGPURawCounterSource ringBufferInfoAtIndex:base:size:dataOffset:dataSize:](self, "ringBufferInfoAtIndex:base:size:dataOffset:dataSize:", v5, buf, (char *)&v32 + 4, &v32, &v31);
    LOBYTE(v14) = 0;
    if (v13)
    {
      if (v31)
      {
        v28 = v5;
        v27 = v12;
        v15 = *(_QWORD *)buf;
        v16 = HIDWORD(v32);
        v30 = v32;
        v17 = (v32 + v31) % HIDWORD(v32);
        v18 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "dstBuffer"), "mutableBytes");
        v19 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "dstBuffer"), "length");
        v21 = (_DWORD)v32 == v11 && v31 == v27;
        while (1)
        {
          v29 = 0;
          LOBYTE(v26) = v21;
          v14 = (*((uint64_t (**)(Source *, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, _QWORD, unint64_t *, int))self->_impl->var0
                 + 25))(self->_impl, v28, v15, v16, &v30, v17, v18, v19, 0, &v29, v26);
          if (!v14)
            break;
          if (v29)
          {
            (*((void (**)(id, uint64_t, unint64_t, _QWORD))a4 + 2))(a4, v18, v29 >> 3, 0);
            if (v29)
              continue;
          }
          v22 = v30 + HIDWORD(v32) - v32;
          v23 = v22 % HIDWORD(v32);
          if (v23
            && -[AGXGPURawCounterSource drainRingBufferAtIndex:dataSize:](self, "drainRingBufferAtIndex:dataSize:", v28, v22 % HIDWORD(v32)) != v23)
          {
            goto LABEL_27;
          }
          v14 = -[AGXGPURawCounterSource ringBufferInfoAtIndex:base:size:dataOffset:dataSize:](self, "ringBufferInfoAtIndex:base:size:dataOffset:dataSize:", v28, buf, (char *)&v32 + 4, &v32, &v31);
          if (!v14)
            return v14;
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "setSrcBufferPrevOffset:", v32);
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_pollPostProcessBufferList, "objectAtIndexedSubscript:", v10), "setSrcBufferPrevSize:", v31);
          goto LABEL_22;
        }
      }
      else
      {
LABEL_22:
        LOBYTE(v14) = 1;
      }
    }
  }
  return v14;
}

@end

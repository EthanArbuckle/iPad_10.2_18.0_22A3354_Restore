@implementation MTLCountersCommandQueue

- (MTLCountersCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4
{
  MTLCountersCommandQueue *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  const char *v13;
  void *v14;
  void *v15;
  char *v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)MTLCountersCommandQueue;
  v5 = -[MTLToolsCommandQueue initWithBaseObject:parent:](&v33, sel_initWithBaseObject_parent_, a3);
  if (v5)
  {
    v6 = getenv("MTL_XML_DUMP_COUNTERS");
    if (!v6)
      v6 = "1";
    v7 = strtol(v6, 0, 0);
    v8 = getenv("MTL_XML_SYNC_BEFORE_SAMPLE");
    if (!v8)
      v8 = "0";
    v9 = strtol(v8, 0, 0);
    v10 = (void *)MEMORY[0x22E309364]();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = getenv("MTL_XML_TRACE_PATH");
    if (v12)
      v13 = v12;
    else
      v13 = "";
    v14 = (void *)objc_msgSend(v11, "stringWithUTF8String:", v13);
    v5->_tracePath = (NSString *)(id)objc_msgSend((id)objc_msgSend(v14, "stringByStandardizingPath"), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("xml_trace_%p"), a4));
    objc_autoreleasePoolPop(v10);
    v32 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5->_tracePath, 1, 0, &v32) & 1) == 0)NSLog(CFSTR("Error creating directory '%@' (%@)"), v5->_tracePath, objc_msgSend(v32, "localizedDescription"));
    if (v7)
    {
      -[MTLToolsCommandQueue setStatEnabled:](v5, "setStatEnabled:", 1);
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = getenv("MTL_XML_COUNTER_NAMES");
      if (v16)
        v17 = v16;
      else
        v17 = "MTLStat_nSec";
      v18 = (void *)objc_msgSend((id)objc_msgSend(v15, "stringWithUTF8String:", v17), "componentsSeparatedByString:", CFSTR(","));
      v19 = -[MTLToolsCommandQueue availableCounters](v5, "availableCounters");
      v20 = (void *)objc_opt_new();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v18);
            v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (objc_msgSend(v19, "containsObject:", v25))
              objc_msgSend(v20, "addObject:", v25);
            else
              NSLog(CFSTR("Unsupported counter: %@"), v25);
          }
          v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v22);
      }
      if (-[MTLToolsCommandQueue requestCounters:](v5, "requestCounters:", v20))
        NSLog(CFSTR("Failed to request counters"));
      -[MTLToolsCommandQueue setStatLocations:](v5, "setStatLocations:", 63);
      if (v9)
        -[MTLToolsCommandQueue setStatOptions:](v5, "setStatOptions:", 1);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __55__MTLCountersCommandQueue_initWithCommandQueue_device___block_invoke;
      v27[3] = &unk_24F794580;
      v27[4] = v20;
      -[MTLToolsCommandQueue addPerfSampleHandler:](v5, "addPerfSampleHandler:", v27);
    }
  }
  return v5;
}

uint64_t __55__MTLCountersCommandQueue_initWithCommandQueue_device___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend(a2, "traceBuffer"), "appendSamples:length:", objc_msgSend(a3, "bytes"), 8 * a4 * objc_msgSend(*(id *)(a1 + 32), "count"));
}

- (id)commandBuffer
{
  void *v3;
  uint64_t v4;
  MTLCountersCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4)
  {
    v5 = -[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLCountersCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)commandBufferWithUnretainedReferences
{
  void *v3;
  uint64_t v4;
  MTLCountersCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4)
  {
    v5 = -[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLCountersCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)commandBufferWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersCommandBuffer *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6)
  {
    v7 = -[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLCountersCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

@end

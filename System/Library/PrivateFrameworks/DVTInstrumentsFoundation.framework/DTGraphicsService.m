@implementation DTGraphicsService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.opengl"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.opengl.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.opengl.deferred"), 1, a1);

}

- (DTGraphicsService)initWithChannel:(id)a3
{
  DTGraphicsService *v3;
  DTGraphicsService *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *stopSamplingSemaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTGraphicsService;
  v3 = -[DTXService initWithChannel:](&v8, sel_initWithChannel_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_samplingRate = 1000000;
    v5 = dispatch_semaphore_create(0);
    stopSamplingSemaphore = v4->_stopSamplingSemaphore;
    v4->_stopSamplingSemaphore = (OS_dispatch_semaphore *)v5;

    v4->_globalService = 0;
    v4->_perProcessService = 0;
    v4->_capFPS = 1;
    v4->_maxFPS = 60;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[DTGraphicsService _releaseIOServices](self, "_releaseIOServices");
  v3.receiver = self;
  v3.super_class = (Class)DTGraphicsService;
  -[DTGraphicsService dealloc](&v3, sel_dealloc);
}

- (id)queryGlobalStatistics
{
  io_registry_entry_t globalService;
  kern_return_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  CFMutableDictionaryRef properties;

  globalService = self->_globalService;
  if (globalService)
  {
    properties = 0;
    v3 = IORegistryEntryCreateCFProperties(globalService, &properties, 0, 0);
    if (v3)
    {
      printf("%s:%d: kernel error %d\n", "-[DTGraphicsService queryGlobalStatistics]", 90, v3);
      abort();
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", CFDictionaryGetValue(properties, CFSTR("PerformanceStatistics")));
    CFDictionaryGetValue(properties, CFSTR("IOGLBundleName"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = XRVideoCardIdentifier;
      v7 = v4;
      v8 = v5;
    }
    else
    {
      v8 = XRVideoCardBuiltIn;
      v6 = XRVideoCardIdentifier;
      v7 = v4;
    }
    objc_msgSend(v7, "setObject:forKey:", v8, v6);
    CFRelease(properties);

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTGraphicsServiceException"), CFSTR("Global statics not found"));
    return 0;
  }
}

- (id)queryPidStatistics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  kern_return_t v8;
  void *v9;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  _OWORD v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_perProcessService)
  {
    v3 = (void *)objc_opt_new();
    iterator = 0;
    MEMORY[0x227678CA8](self->_perProcessService, "IOService", &iterator);
    v4 = IOIteratorNext(iterator);
    if ((_DWORD)v4)
    {
      v5 = v4;
      do
      {
        memset(v13, 0, sizeof(v13));
        MEMORY[0x227678CB4](v5, v13);
        if (*(_QWORD *)&v13[0] == 0x58424D656C707041
          && *((_QWORD *)&v13[0] + 1) == 0x65696C4372657355
          && *(_QWORD *)((char *)v13 + 11) == 0x746E65696C4372)
        {
          properties = 0;
          v8 = IORegistryEntryCreateCFProperties(v5, &properties, 0, 0);
          if (v8)
          {
            printf("%s:%d: kernel error %d\n", "-[DTGraphicsService queryPidStatistics]", 126, v8);
            abort();
          }
          CFDictionaryGetValue(properties, CFSTR("PerformanceStatistics"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);
          CFRelease(properties);

        }
        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
      }
      while ((_DWORD)v5);
    }
    IOObjectRelease(iterator);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTGraphicsServiceException"), CFSTR("Per process statics not found"));
    v3 = 0;
  }
  return v3;
}

- (void)_setupIOServices
{
  const __CFDictionary *v3;
  mach_port_t v4;
  kern_return_t MatchingServices;
  io_object_t v6;
  const char *v7;
  const __CFDictionary *v8;
  kern_return_t v9;
  io_object_t v10;
  const __CFDictionary *v11;
  kern_return_t v12;
  io_iterator_t existing;

  if (!self->_globalService)
  {
    v3 = IOServiceMatching("IOAcceleratorES");
    if (!v3)
    {
      v3 = IOServiceMatching("IOAcceleratorESLegacy");
      if (!v3)
        v3 = IOServiceMatching("AppleMBXDevice");
    }
    existing = 0;
    v4 = *MEMORY[0x24BDD8B18];
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v3, &existing);
    if (MatchingServices)
    {
      printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 188, MatchingServices);
      goto LABEL_19;
    }
    v6 = IOIteratorNext(existing);
    self->_globalService = v6;
    if (v6)
    {
      v7 = "IOAcceleratorES";
    }
    else
    {
      v8 = IOServiceMatching("AppleMBXDevice");
      v9 = IOServiceGetMatchingServices(v4, v8, &existing);
      if (v9)
      {
        printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 195, v9);
        goto LABEL_19;
      }
      v10 = IOIteratorNext(existing);
      self->_globalService = v10;
      if (!v10)
        return;
      v7 = "AppleMBXDevice";
    }
    IOObjectRelease(existing);
    v11 = IOServiceMatching(v7);
    if (!v11)
      v11 = IOServiceMatching("IOAcceleratorESLegacy");
    v12 = IOServiceGetMatchingServices(v4, v11, &existing);
    if (!v12)
    {
      self->_perProcessService = IOIteratorNext(existing);
      IOObjectRelease(existing);
      return;
    }
    printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 215, v12);
LABEL_19:
    abort();
  }
}

- (void)_releaseIOServices
{
  io_object_t perProcessService;
  io_object_t globalService;

  perProcessService = self->_perProcessService;
  if (perProcessService)
  {
    IOObjectRelease(perProcessService);
    self->_perProcessService = 0;
  }
  globalService = self->_globalService;
  if (globalService)
  {
    IOObjectRelease(globalService);
    self->_globalService = 0;
  }
}

- (void)queryCards
{
  NSMutableArray *v3;
  NSMutableArray *availableGlobalStatistics;
  NSMutableArray *v5;
  NSMutableArray *availableProcessStatistics;
  NSMutableArray *v7;
  NSMutableArray *driverNames;
  void *v9;
  size_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD context[2];

  context[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_availableGlobalStatistics)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    availableGlobalStatistics = self->_availableGlobalStatistics;
    self->_availableGlobalStatistics = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    availableProcessStatistics = self->_availableProcessStatistics;
    self->_availableProcessStatistics = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    driverNames = self->_driverNames;
    self->_driverNames = v7;

    -[DTGraphicsService _setupIOServices](self, "_setupIOServices");
    -[DTGraphicsService queryGlobalStatistics](self, "queryGlobalStatistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableArray addObject:](self->_driverNames, "addObject:", XRVideoCardBuiltIn);
      v10 = objc_msgSend(v9, "count");
      v11 = (_QWORD *)((char *)context - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v11, 8 * v10);
      context[0] = v11;
      CFDictionaryApplyFunction((CFDictionaryRef)v9, (CFDictionaryApplierFunction)sub_222B6E3B0, context);
      qsort(v11, v10, 8uLL, (int (__cdecl *)(const void *, const void *))sub_222B6E3E4);
      for (; v10; --v10)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), *v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableArray containsObject:](self->_availableGlobalStatistics, "containsObject:", v12) & 1) == 0)
          -[NSMutableArray addObject:](self->_availableGlobalStatistics, "addObject:", v12);

        ++v11;
      }
    }

  }
}

- (id)availableStatistics
{
  NSMutableArray *availableGlobalStatistics;
  NSMutableArray *availableProcessStatistics;
  NSDictionary *v5;
  NSDictionary *availableStatistics;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_availableGlobalStatistics)
  {
    -[DTGraphicsService queryCards](self, "queryCards");
    -[NSMutableArray addObject:](self->_availableGlobalStatistics, "addObject:", CFSTR("CoreAnimationFramesPerSecond"));
    availableGlobalStatistics = self->_availableGlobalStatistics;
    v8[0] = CFSTR("global");
    v8[1] = CFSTR("process");
    availableProcessStatistics = self->_availableProcessStatistics;
    v9[0] = availableGlobalStatistics;
    v9[1] = availableProcessStatistics;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    availableStatistics = self->_availableStatistics;
    self->_availableStatistics = v5;

  }
  return self->_availableStatistics;
}

- (id)driverNames
{
  NSMutableArray *driverNames;

  driverNames = self->_driverNames;
  if (!driverNames)
  {
    -[DTGraphicsService queryCards](self, "queryCards");
    driverNames = self->_driverNames;
  }
  return driverNames;
}

- (void)setSamplingRate:(id)a3
{
  self->_samplingRate = (unint64_t)(float)((float)((float)objc_msgSend(a3, "integerValue") / 10.0) * 1000000.0);
}

- (void)startSamplingAtTimeInterval:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_startSamplingAtTimeInterval_processIdentifier_);
}

- (void)startSamplingAtTimeInterval:(id)a3 processIdentifier:(id)a4
{
  id v5;
  double v6;
  int v7;

  v5 = a4;
  self->_capFPS = CARenderServerGetDebugOption() ^ 1;
  self->_maxFPS = 60;
  -[DTGraphicsService _setupIOServices](self, "_setupIOServices");
  self->_doCollectData = 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_lastTimeStampInSeconds = v6;
  self->_startTime = v6;
  v7 = objc_msgSend(v5, "intValue");

  self->_targetPid = v7;
  MEMORY[0x24BEDD108](MEMORY[0x24BDD17F0], sel_detachNewThreadSelector_toTarget_withObject_);
}

- (void)stopSampling
{
  if (self->_doCollectData)
  {
    self->_doCollectData = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stopSamplingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[DTGraphicsService _releaseIOServices](self, "_releaseIOServices");
  }
}

- (id)valueForSwitch:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
}

- (id)_collectSampleForService
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int targetPid;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  DTGraphicsService *v32;
  uint64_t v33;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v5 = v4 - self->_startTime;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)(v5 * 1000000.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, XRVideoCardRunTimeStamp);
  -[DTGraphicsService queryGlobalStatistics](self, "queryGlobalStatistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  if (self->_targetPid >= 1)
  {
    v28 = v6;
    v29 = v3;
    -[DTGraphicsService queryPidStatistics](self, "queryPidStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "count");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v31 = v8;
      v32 = self;
      v30 = v10;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("OwningPID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");
        targetPid = self->_targetPid;

        if (v15 == targetPid)
        {
          if (objc_msgSend(v9, "count"))
          {
            v33 = v12;
            objc_msgSend(v9, "allKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");
            if (v18)
            {
              v19 = v18;
              for (i = 0; i != v19; ++i)
              {
                objc_msgSend(v17, "objectAtIndex:", i);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKey:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v23, "intValue") + objc_msgSend(v22, "intValue"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKey:", v24, v21);

                }
              }
            }

            v8 = v31;
            self = v32;
            v11 = v30;
            v12 = v33;
          }
          else
          {
            objc_msgSend(v9, "addEntriesFromDictionary:", v13);
          }
        }

        ++v12;
      }
      while (v12 != v11);
    }
    v3 = v29;
    objc_msgSend(v29, "addEntriesFromDictionary:", v9);

    v6 = v28;
  }
  -[DTGraphicsService currentFramesPerSecond:](self, "currentFramesPerSecond:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("CoreAnimationFramesPerSecond"));
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)_collectData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  self->_lastFPSCount = CARenderServerGetFrameCounter();
  if (self->_doCollectData)
  {
    v3 = MEMORY[0x24BDAC760];
    do
    {
      v4 = (void *)MEMORY[0x227679C5C]();
      -[DTGraphicsService _collectSampleForService](self, "_collectSampleForService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[DTXService channel](self, "channel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = v3;
        v7[1] = 3221225472;
        v7[2] = sub_222B6EA70;
        v7[3] = &unk_24EB2A1F0;
        v7[4] = self;
        objc_msgSend(v6, "sendMessage:replyHandler:", v5, v7);

      }
      objc_autoreleasePoolPop(v4);
      usleep(self->_samplingRate);
    }
    while (self->_doCollectData);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stopSamplingSemaphore);
}

- (id)currentFramesPerSecond:(double)a3
{
  unsigned int FrameCounter;
  double v6;
  uint64_t maxFPS;

  FrameCounter = CARenderServerGetFrameCounter();
  v6 = (float)(FrameCounter - self->_lastFPSCount) / (a3 - self->_lastTimeStampInSeconds);
  self->_lastFPSCount = FrameCounter;
  self->_lastTimeStampInSeconds = a3;
  if (!self->_capFPS || (maxFPS = self->_maxFPS, maxFPS >= v6))
    maxFPS = v6;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", maxFPS);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopSamplingSemaphore, 0);
  objc_storeStrong((id *)&self->_driverNames, 0);
  objc_storeStrong((id *)&self->_availableStatistics, 0);
  objc_storeStrong((id *)&self->_availableProcessStatistics, 0);
  objc_storeStrong((id *)&self->_availableGlobalStatistics, 0);
}

@end

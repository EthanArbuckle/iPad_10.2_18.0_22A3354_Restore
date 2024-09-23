@implementation DTGPUDataSource

- (DTGPUDataSource)initWithMTLDevice:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  DTGPUDataSource *v8;
  DTGPUDataSource *v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  DTGPUPerformanceStateControl *perfStateControl;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DTGPUDataSource;
  v8 = -[DTGPUDataSource init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_device, v6);
    while (1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v9->_device);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
        break;
      v12 = objc_loadWeakRetained((id *)&v9->_device);
      objc_msgSend(v12, "baseObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v9->_device, v13);

    }
    v9->_isAGXDevice = objc_msgSend(v6, "supportsFamily:", 1001);
    sub_222B24A28(v6);
    v14 = objc_claimAutoreleasedReturnValue();
    perfStateControl = v9->_perfStateControl;
    v9->_perfStateControl = (DTGPUPerformanceStateControl *)v14;

    v9->_isAPS = 0;
  }

  return v9;
}

- (DTGPUDataSource)initWithImportAPSDataPath:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  DTGPUDataSource *v8;
  DTGPUDataSource *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *supportedCounterProfiles;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTGPUDataSource;
  v8 = -[DTGPUDataSource init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_device, 0);
    *(_WORD *)&v9->_isAGXDevice = 257;
    v9->_isAPS = 1;
    +[DTGPUCounterProfile_GPURawCountersImport create:](DTGPUCounterProfile_GPURawCountersImport, "create:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v16[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      supportedCounterProfiles = v9->_supportedCounterProfiles;
      v9->_supportedCounterProfiles = (NSArray *)v12;
    }
    else
    {
      supportedCounterProfiles = v9->_supportedCounterProfiles;
      v9->_supportedCounterProfiles = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  return v9;
}

- (NSArray)supportedCounterProfiles
{
  NSArray *supportedCounterProfiles;
  id *p_supportedCounterProfiles;
  NSArray *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  MTLDevice **p_device;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t i;
  id v26;
  void *v27;
  id v28;

  p_supportedCounterProfiles = (id *)&self->_supportedCounterProfiles;
  supportedCounterProfiles = self->_supportedCounterProfiles;
  if (supportedCounterProfiles)
  {
LABEL_28:
    v5 = supportedCounterProfiles;
    return v5;
  }
  v5 = (NSArray *)objc_opt_new();
  if (!self->_isAGXDevice
    || (v6 = objc_loadWeakRetained((id *)&self->_device),
        +[DTGPUCounterProfile_GPURawCountersAPS create:profile:](DTGPUCounterProfile_GPURawCountersAPS, "create:profile:", v6, 13), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    p_device = &self->_device;
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    +[DTGPUCounterProfile_GPUStats create:](DTGPUCounterProfile_GPUStats, "create:", WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[NSArray addObject:](v5, "addObject:", v12);
    v13 = objc_loadWeakRetained((id *)&self->_device);
    +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v13, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[NSArray addObject:](v5, "addObject:", v14);

    v15 = objc_loadWeakRetained((id *)&self->_device);
    +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v15, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[NSArray addObject:](v5, "addObject:", v16);

    if (self->_isAGXDevice)
    {
      v17 = objc_loadWeakRetained((id *)p_device);
      +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        -[NSArray addObject:](v5, "addObject:", v18);

      v19 = objc_loadWeakRetained((id *)p_device);
      +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v19, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[NSArray addObject:](v5, "addObject:", v20);
    }
    else
    {
      -[DTGPUDataSource device](self, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "vendorName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lowercaseString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "rangeOfString:", CFSTR("intel")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v20, "rangeOfString:", CFSTR("amd")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = objc_loadWeakRetained((id *)p_device);
          +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v23, 12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            -[NSArray addObject:](v5, "addObject:", v24);

        }
      }
      else
      {
        for (i = 5; i != 12; ++i)
        {
          v26 = objc_loadWeakRetained((id *)p_device);
          +[DTGPUCounterProfile_GPURawCounters create:profile:](DTGPUCounterProfile_GPURawCounters, "create:profile:", v26, i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            -[NSArray addObject:](v5, "addObject:", v27);

        }
      }
    }

    v28 = *p_supportedCounterProfiles;
    *p_supportedCounterProfiles = v5;

    supportedCounterProfiles = (NSArray *)*p_supportedCounterProfiles;
    goto LABEL_28;
  }
  -[NSArray addObject:](v5, "addObject:", v7);
  v8 = objc_loadWeakRetained((id *)&self->_device);
  +[DTGPUCounterProfile_GPURawCountersAPS create:profile:](DTGPUCounterProfile_GPURawCountersAPS, "create:profile:", v8, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[NSArray addObject:](v5, "addObject:", v9);
  self->_isAPS = 1;
  objc_storeStrong(p_supportedCounterProfiles, v5);

  return v5;
}

- (void)setAPSCounterConfig:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_supportedCounterProfiles;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v12 = v11;
          if (!v5
            || (v13 = objc_msgSend(v11, "profile", (_QWORD)v14),
                v13 == objc_msgSend(v5, "unsignedIntValue")))
          {
            objc_msgSend(v12, "setAPSCounterConfig:", v4, (_QWORD)v14);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (unint64_t)minSampleInterval
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_supportedCounterProfiles;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
  {

    return 50000;
  }
  v4 = *(_QWORD *)v10;
  v5 = -1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v10 != v4)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "defaultSampleInterval", (_QWORD)v9);
      if (v5 >= v7)
        v5 = v7;
    }
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v3);

  if (v5 == -1)
    return 50000;
  return v5;
}

- (unint64_t)windowLimit
{
  return self->_windowLimit;
}

- (NSString)deviceName
{
  __CFString *v2;
  _BOOL4 isAGXDevice;
  id WeakRetained;
  void *v5;

  if (self->_isImportAPS)
  {
    v2 = CFSTR("Import Device");
  }
  else
  {
    isAGXDevice = self->_isAGXDevice;
    WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    v5 = WeakRetained;
    if (isAGXDevice)
      objc_msgSend(WeakRetained, "familyName");
    else
      objc_msgSend(WeakRetained, "name");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (NSDictionary)deviceInfoDict
{
  MTLDevice **p_device;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *CFProperty;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  id *location;
  id *locationa;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[16];
  _QWORD v38[16];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  p_device = &self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (!WeakRetained)
    return (NSDictionary *)MEMORY[0x24BDBD1B8];
  v32 = objc_loadWeakRetained((id *)p_device);
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[DTGPUDataSource supportedCounterProfiles](self, "supportedCounterProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)p_device;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "profile"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        objc_msgSend(v11, "counterProfileForHost");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v32, "sharedMemorySize"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(objc_msgSend(v32, "acceleratorPort"), CFSTR("AGXTraceCodeVersion"), 0, 0);
  v15 = CFSTR("0");
  if (CFProperty)
    v15 = CFProperty;
  v28 = (__CFString *)v15;
  v37[0] = CFSTR("accelerator-id");
  v16 = (void *)MEMORY[0x24BDD16E0];
  locationa = (id *)objc_loadWeakRetained(location);
  objc_msgSend(v16, "numberWithUnsignedLongLong:", objc_msgSend(locationa, "registryID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v27;
  v37[1] = CFSTR("vendor-name");
  objc_msgSend(v32, "vendorName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v25;
  v37[2] = CFSTR("family-name");
  objc_msgSend(v32, "familyName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  v37[3] = CFSTR("product-name");
  objc_msgSend(v32, "productName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  v37[4] = CFSTR("device-name");
  -[DTGPUDataSource deviceName](self, "deviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v18;
  v38[5] = v5;
  v37[5] = CFSTR("supported-counter-profiles");
  v37[6] = CFSTR("counter-profile-configs");
  v38[6] = v6;
  v37[7] = CFSTR("min-collection-interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[DTGPUDataSource minSampleInterval](self, "minSampleInterval"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v19;
  v38[8] = MEMORY[0x24BDBD1C0];
  v37[8] = CFSTR("headless");
  v37[9] = CFSTR("removable");
  v38[9] = MEMORY[0x24BDBD1C0];
  v38[10] = MEMORY[0x24BDBD1C0];
  v37[10] = CFSTR("low-power");
  v37[11] = CFSTR("recommended-max-working-set-size");
  v38[11] = v29;
  v37[12] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAGXDevice);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[12] = v20;
  v37[13] = CFSTR("displays");
  -[DTGPUDataSource _queryDisplayInfoDict](self, "_queryDisplayInfoDict");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[13] = v21;
  v38[14] = v28;
  v37[14] = CFSTR("agx-tracecode-version");
  v37[15] = CFSTR("perf-state");
  -[DTGPUDataSource currentConsistentGPUPerformanceState](self, "currentConsistentGPUPerformanceState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[15] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v23;
}

- (DTGPUCounterProfile)collectingProfile
{
  return self->_collectingProfile;
}

- (id)configure:(unsigned int)a3 interval:(unint64_t)a4 windowLimit:(unint64_t)a5
{
  DTGPUCounterProfile **p_collectingProfile;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  DTGPUCounterProfile *collectingProfile;
  unint64_t windowLimit;
  unint64_t v23;
  uint64_t v24;
  void **begin;
  void **end;
  DTGPUCounterProfile *v27;
  DTGPUCounterProfile *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t *p_sampleBuffers;
  void **v38[4];
  void *v39;
  void *v40;
  uint64_t v41;
  void *__p;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  p_collectingProfile = &self->_collectingProfile;
  if (self->_collectingProfile)
    return 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_supportedCounterProfiles;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v48;
    v13 = a3;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend(v15, "profile") == v13)
        {
          objc_storeStrong((id *)p_collectingProfile, v15);
          goto LABEL_13;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  v16 = -[DTGPUCounterProfile prepare](*p_collectingProfile, "prepare");
  v17 = *p_collectingProfile;
  if (v16)
  {
    -[DTGPUCounterProfile ringBufferCounts](*p_collectingProfile, "ringBufferCounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTGPUCounterProfile sampleSizes](*p_collectingProfile, "sampleSizes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count")
      && objc_msgSend(v17, "count")
      && (v19 = objc_msgSend(v17, "count"), v19 == objc_msgSend(v18, "count")))
    {
      self->_windowLimit = a5;
      v20 = -[DTGPUCounterProfile defaultSampleInterval](self->_collectingProfile, "defaultSampleInterval");
      self->_sampleInterval = v20;
      collectingProfile = self->_collectingProfile;
      if (collectingProfile)
      {
        windowLimit = 1000000000;
        if (self->_windowLimit + 1 >= 2)
          windowLimit = self->_windowLimit;
        v23 = windowLimit / v20;
        if (v23 >= 0x4E20)
          v23 = 20000;
        if (v23 <= 1)
          v24 = 1;
        else
          v24 = v23;
        begin = (void **)self->_sampleBuffers.__begin_;
        p_sampleBuffers = (uint64_t *)&self->_sampleBuffers;
        end = (void **)self->_sampleBuffers.__end_;
        while (end != begin)
        {
          end -= 3;
          v38[0] = end;
          sub_222B6A014(v38);
        }
        v29 = 0;
        self->_sampleBuffers.__end_ = begin;
        while (v29 < objc_msgSend(v17, "count", p_sampleBuffers))
        {
          v44 = 0;
          v45 = 0;
          v46 = 0;
          objc_msgSend(v17, "objectAtIndexedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "unsignedIntegerValue");

          for (; v31; --v31)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            sub_222B69C44((uint64_t)v38, objc_msgSend(v32, "unsignedIntValue"), v24);
            sub_222B69C44((uint64_t)&v41, 4, v24);

            v33 = v45;
            if (v45 >= v46)
            {
              v34 = sub_222B6A0DC(&v44, (uint64_t)v38);
            }
            else
            {
              sub_222B6A200((uint64_t)&v46, v45, (uint64_t)v38);
              v34 = v33 + 112;
            }
            v45 = v34;
            if (__p)
            {
              v43 = __p;
              operator delete(__p);
            }
            if (v39)
            {
              v40 = v39;
              operator delete(v39);
            }
          }
          v35 = (char *)self->_sampleBuffers.__end_;
          if (v35 >= self->_sampleBuffers.__end_cap_.__value_)
          {
            v36 = (void *)sub_222B6A644(p_sampleBuffers, &v44);
          }
          else
          {
            sub_222B6A5E0((uint64_t)p_sampleBuffers, &v44);
            v36 = v35 + 24;
          }
          self->_sampleBuffers.__end_ = v36;
          v38[0] = (void **)&v44;
          sub_222B6A014(v38);
          ++v29;
        }
        collectingProfile = *p_collectingProfile;
      }
      v27 = collectingProfile;
    }
    else
    {
      v28 = *p_collectingProfile;
      *p_collectingProfile = 0;

      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
    *p_collectingProfile = 0;
  }

  return v27;
}

- (void)enableShaderProfiler:(BOOL)a3
{
  self->_enableShaderProfiler = a3;
}

- (void)enableCliquePositionTracing:(BOOL)a3
{
  self->_enableCliquePositionTracing = a3;
}

- (void)overideAPSConfig:(id)a3
{
  objc_storeStrong((id *)&self->_apsConfig, a3);
}

- (BOOL)run
{
  void *v3;
  void *v4;
  NSDictionary *apsConfig;
  BOOL v6;
  NSObject *workQueue;
  _QWORD block[5];
  id v10;
  id location;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_enableShaderProfiler)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24EB4EA68, CFSTR("ShaderProfiler"));
  apsConfig = self->_apsConfig;
  if (apsConfig)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", apsConfig, CFSTR("APSConfig"));
  v6 = -[DTGPUCounterProfile start:vendorFeatures:](self->_collectingProfile, "start:vendorFeatures:", self->_sampleInterval, v4);
  if (v6)
  {
    self->_stopTime = 0;
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B68394;
    block[3] = &unk_24EB2A008;
    objc_copyWeak(&v10, &location);
    block[4] = self;
    dispatch_async(workQueue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DTGPUCounterProfile stop](self->_collectingProfile, "stop");
  }

  return v6;
}

- (void)stop
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B68638;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)getRemainingData:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B68718;
  block[3] = &unk_24EB2A080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

- (void)reset
{
  NSObject *workQueue;
  id v4;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B68B04;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_sync(workQueue, block);
  v4 = -[DTGPUDataSource disableConsistentGPUPerformanceState](self, "disableConsistentGPUPerformanceState");
}

- (void)_sampleCounters
{
  _BOOL4 isAPS;
  DTGPUCounterProfile *collectingProfile;
  unint64_t sampleInterval;
  _QWORD v6[5];
  _QWORD v7[5];

  isAPS = self->_isAPS;
  collectingProfile = self->_collectingProfile;
  if (isAPS)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B68C10;
    v7[3] = &unk_24EB2A0A8;
    v7[4] = self;
    -[DTGPUCounterProfile sampleAPS:](collectingProfile, "sampleAPS:", v7);
  }
  else
  {
    sampleInterval = self->_sampleInterval;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_222B68CA0;
    v6[3] = &unk_24EB2A0F8;
    v6[4] = self;
    -[DTGPUCounterProfile sampleCounters:callback:](collectingProfile, "sampleCounters:callback:", sampleInterval, v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DTGPUDataSource device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)timestampOfFirstSample
{
  _QWORD *begin;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v6;
  unint64_t windowLimit;
  uint64_t v8;
  unint64_t v10;
  unint64_t *v11;

  begin = self->_sampleBuffers.__begin_;
  if (begin == self->_sampleBuffers.__end_)
    return 0;
  v3 = (_QWORD *)*begin;
  v4 = (_QWORD *)begin[1];
  if ((_QWORD *)*begin == v4)
    return -1;
  v6 = -1;
  do
  {
    v10 = 0;
    v11 = 0;
    windowLimit = self->_windowLimit;
    v8 = mach_absolute_time();
    sub_222B693C4(v3, windowLimit, v8, &v11, &v10);
    if (v11 && *v11 < v6)
      v6 = *v11;
    v3 += 14;
  }
  while (v3 != v4);
  return v6;
}

- (id)_queryDisplayInfoDict
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  double v15;
  int v16;
  const __CFString *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  uint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[10];
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v32 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDE5660], "displays");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v51 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isSupported") & 1) != 0 && objc_msgSend(v5, "displayType") != 3)
        {
          objc_msgSend(v5, "bounds");
          if (v6 != 0.0)
          {
            objc_msgSend(v5, "bounds");
            if (v7 != 0.0)
            {
              v8 = objc_msgSend(v5, "displayId");
              if (objc_msgSend(v5, "displayId"))
                v9 = objc_msgSend(v5, "displayId") - 1;
              else
                v9 = objc_msgSend(v5, "displayId");
              v44 = objc_msgSend(v5, "displayType");
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              objc_msgSend(v5, "availableModes");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
              v42 = v9;
              v12 = 0;
              if (v11)
              {
                v13 = *(_QWORD *)v47;
                do
                {
                  for (j = 0; j != v11; ++j)
                  {
                    if (*(_QWORD *)v47 != v13)
                      objc_enumerationMutation(v10);
                    objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "refreshRate");
                    v16 = vcvtpd_s64_f64(v15);
                    if ((int)v12 <= v16)
                      v12 = v16;
                    else
                      v12 = v12;
                  }
                  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
                }
                while (v11);
              }

              v55[0] = CFSTR("accelerator-id");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v40;
              v55[1] = CFSTR("display-id");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
              v57 = objc_claimAutoreleasedReturnValue();
              v55[2] = CFSTR("device-name");
              v41 = (void *)v57;
              if (v44)
              {
                objc_msgSend(v5, "deviceName");
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v17 = v33;
              }
              else
              {
                v17 = CFSTR("Built-In Display");
              }
              v58 = v17;
              v55[3] = CFSTR("framebuffer-index");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v43;
              v55[4] = CFSTR("pixel-width");
              v18 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v5, "bounds");
              objc_msgSend(v18, "numberWithDouble:", v19);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v39;
              v55[5] = CFSTR("pixel-height");
              v20 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v5, "bounds");
              objc_msgSend(v20, "numberWithDouble:", v21);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = v37;
              v55[6] = CFSTR("resolution");
              v22 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v5, "currentMode");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "numberWithUnsignedLong:", objc_msgSend(v38, "width"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v54[0] = v35;
              v23 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v5, "currentMode");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "numberWithUnsignedLong:", objc_msgSend(v36, "height"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v54[1] = v34;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v24;
              v55[7] = CFSTR("built-in");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v44 == 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v25;
              v55[8] = CFSTR("max-refresh-rate");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v26;
              v55[9] = CFSTR("is-main-display");
              v27 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "numberWithBool:", v5 == v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v29;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, v55, 10);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              objc_msgSend(v32, "addObject:", v30);

            }
          }
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    }
    while (v2);
  }

  return v32;
}

- (id)currentConsistentGPUPerformanceState
{
  void *v2;

  -[DTGPUPerformanceStateControl currentState](self->_perfStateControl, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  return v2;
}

- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3
{
  return MEMORY[0x24BEDD108](self->_perfStateControl, sel_enable_);
}

- (id)disableConsistentGPUPerformanceState
{
  return (id)-[DTGPUPerformanceStateControl disable](self->_perfStateControl, "disable");
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (DTGPUDataSourceDelegate)delegate
{
  return (DTGPUDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  vector<std::vector<DTGPUCounterSampleBuffer>, std::allocator<std::vector<DTGPUCounterSampleBuffer>>> *p_sampleBuffers;

  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_perfStateControl, 0);
  objc_storeStrong((id *)&self->_supportedCounterProfiles, 0);
  p_sampleBuffers = &self->_sampleBuffers;
  sub_222B6AC58((void ***)&p_sampleBuffers);
  objc_storeStrong((id *)&self->_apsConfig, 0);
  objc_storeStrong((id *)&self->_collectingProfile, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end

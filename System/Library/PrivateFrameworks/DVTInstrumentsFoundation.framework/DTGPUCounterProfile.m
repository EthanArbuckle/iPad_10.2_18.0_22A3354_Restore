@implementation DTGPUCounterProfile

- (DTGPUCounterProfile)initWithProfile:(unint64_t)a3 device:(id)a4
{
  id v7;
  DTGPUCounterProfile *v8;
  DTGPUCounterProfile *v9;
  uint64_t v10;
  NSMutableArray *counters;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DTGPUCounterProfile;
  v8 = -[DTGPUCounterProfile init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_profile = a3;
    v10 = objc_opt_new();
    counters = v9->_counters;
    v9->_counters = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_device, a4);
  }

  return v9;
}

- (void)addCounter:(id)a3
{
  -[NSMutableArray addObject:](self->_counters, "addObject:", a3);
}

- (BOOL)prepare
{
  return 1;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  return 1;
}

- (id)counterProfileForHost
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_counters;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "infoArray", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v5);
  }

  v16 = &unk_24EB4EC48;
  v17 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sampleSizes
{
  return &unk_24EB4E900;
}

- (id)ringBufferCounts
{
  return &unk_24EB4E918;
}

- (BOOL)isAPS
{
  return 0;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (NSArray)counters
{
  return &self->_counters->super;
}

- (void)setCounters:(id)a3
{
  objc_storeStrong((id *)&self->_counters, a3);
}

- (unint64_t)defaultSampleInterval
{
  return self->_defaultSampleInterval;
}

- (void)setDefaultSampleInterval:(unint64_t)a3
{
  self->_defaultSampleInterval = a3;
}

- (NSString)derivedCounterScriptPath
{
  return self->_derivedCounterScriptPath;
}

- (void)setDerivedCounterScriptPath:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounterScriptPath, a3);
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
  objc_storeStrong((id *)&self->_profileName, a3);
}

- (void)setIsAPS:(BOOL)a3
{
  self->_isAPS = a3;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_derivedCounterScriptPath, 0);
  objc_storeStrong((id *)&self->_counters, 0);
}

@end

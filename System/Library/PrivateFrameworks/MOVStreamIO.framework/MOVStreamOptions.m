@implementation MOVStreamOptions

+ (MOVStreamOptions)sharedOptions
{
  if (sharedOptions_onceToken != -1)
    dispatch_once(&sharedOptions_onceToken, &__block_literal_global_8);
  return (MOVStreamOptions *)(id)sharedOptions_options;
}

void __33__MOVStreamOptions_sharedOptions__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedOptions_options;
  sharedOptions_options = v0;

}

- (MOVStreamOptions)init
{
  MOVStreamOptions *v2;
  MOVStreamOptions *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOVStreamOptions;
  v2 = -[MOVStreamOptions init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MOVStreamOptions registerStandardDefaults](v2, "registerStandardDefaults");
    -[MOVStreamOptions localDefaults](v3, "localDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOBossMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_debugMode = objc_msgSend(v5, "BOOLValue");

    if (v3->_debugMode)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_210675000, v6, OS_LOG_TYPE_INFO, "[WARNING] MOVStreamIO Debug Mode enabled. This could change the Framework behavior.", v8, 2u);
      }

    }
  }
  return v3;
}

- (void)checkBossMode
{
  void *v3;
  id v4;

  -[MOVStreamOptions localDefaults](self, "localDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MIOBossMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_debugMode = objc_msgSend(v3, "BOOLValue");

}

- (id)localDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)localDefaults_defaults;
  if (!localDefaults_defaults)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)localDefaults_defaults;
    localDefaults_defaults = v3;

    v2 = (void *)localDefaults_defaults;
  }
  return v2;
}

- (id)currentOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[MOVStreamOptions localDefaults](self, "localDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKey:", v14, v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (BOOL)disableVTPreSetup
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.movstreamio.framework"));
  objc_msgSend(v2, "objectForKey:", CFSTR("MIODisableVTPreSetup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)disableFrameReordering
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIODisableFrameReordering"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIODisableFrameReordering"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIODisableFrameReordering"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (double)bitrateMultiplier
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOBitrateMultiplier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOBitrateMultiplier"));
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOBitrateMultiplier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v6 = v8;

  }
  return v6;
}

- (unint64_t)bitrateOverride
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOBitrateOverride"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOBitrateOverride"));
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOBitrateOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (BOOL)forceColorLossless
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOForceColorLossless"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOForceColorLossless"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOForceColorLossless"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (BOOL)force10bitMonoByVT
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOForce10bitMonoByVT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOForce10bitMonoByVT"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOForce10bitMonoByVT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (BOOL)forceLossless8bitMonoByVT
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOForceLossless8bitMonoByVT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOForceLossless8bitMonoByVT"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOForceLossless8bitMonoByVT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (BOOL)skipSourceHint
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (self->_debugMode)
  {
    -[MOVStreamOptions localDefaults](self, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MIOSkipSourceHint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MOVStreamOptions checkHasValue:changedForKey:](self, "checkHasValue:changedForKey:", v4, CFSTR("MIOSkipSourceHint"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MIOSkipSourceHint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (id)standardDefaultValues
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[8];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)standardDefaultValues_standardDefaults;
  if (!standardDefaultValues_standardDefaults)
  {
    v6[0] = CFSTR("MIOBossMode");
    v6[1] = CFSTR("MIODisableFrameReordering");
    v7[0] = MEMORY[0x24BDBD1C0];
    v7[1] = MEMORY[0x24BDBD1C0];
    v6[2] = CFSTR("MIOBitrateMultiplier");
    v6[3] = CFSTR("MIOBitrateOverride");
    v7[2] = &unk_24CA5BDE8;
    v7[3] = &unk_24CA5BCA0;
    v6[4] = CFSTR("MIOForceColorLossless");
    v6[5] = CFSTR("MIOForce10bitMonoByVT");
    v7[4] = MEMORY[0x24BDBD1C0];
    v7[5] = MEMORY[0x24BDBD1C0];
    v6[6] = CFSTR("MIOSkipSourceHint");
    v6[7] = CFSTR("MIOForceLossless8bitMonoByVT");
    v7[6] = MEMORY[0x24BDBD1C0];
    v7[7] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)standardDefaultValues_standardDefaults;
    standardDefaultValues_standardDefaults = v3;

    v2 = (void *)standardDefaultValues_standardDefaults;
  }
  return v2;
}

- (void)checkHasValue:(id)a3 changedForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v14 = v6;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_210675000, v12, OS_LOG_TYPE_INFO, "[WARNING] Default setting for '%{public}@' was changed from '%{public}@' to '%{public}@'. This can affect your recordings!", buf, 0x20u);
    }

  }
}

- (void)registerStandardDefaults
{
  void *v3;
  id v4;

  -[MOVStreamOptions localDefaults](self, "localDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MOVStreamOptions standardDefaultValues](self, "standardDefaultValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDefaults:", v3);

}

@end

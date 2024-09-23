@implementation ADDeviceConfiguration

+ (id)stringForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v9 = v6;
LABEL_6:

  return v9;
}

+ (id)sharedConfiguration
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  if (!+[ADDeviceConfiguration sharedConfiguration]::defaults)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__ADDeviceConfiguration_sharedConfiguration__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[ADDeviceConfiguration sharedConfiguration]::onceToken != -1)
      dispatch_once(&+[ADDeviceConfiguration sharedConfiguration]::onceToken, block);
    v2 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  }
  return v2;
}

+ (id)getDeviceName
{
  return (id)MGCopyAnswer();
}

- (BOOL)createPropertyForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  objc_class *v8;
  const char *v9;
  objc_class *v10;
  const char *v11;
  objc_class *v12;
  BOOL v13;
  objc_property_attribute_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", 1, 0x20B6E5DC6, 0x20B6E5DC8, 0x20B6E5DCELL, 0x20B6E47AELL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(":"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  v8 = (objc_class *)objc_opt_class();
  v9 = NSSelectorFromString((NSString *)v3);
  if (class_addMethod(v8, v9, (IMP)getterDummy, "@@:")
    && (v10 = (objc_class *)objc_opt_class(),
        v11 = NSSelectorFromString(v7),
        class_addMethod(v10, v11, (IMP)setterDummy, "v@:@")))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = class_addProperty(v12, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), &v15, 2u);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ADDeviceConfiguration)init
{
  ADDeviceConfiguration *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *currentDefaults;
  uint64_t v6;
  NSUserDefaults *globalUserDefaults;
  uint64_t v8;
  NSUserDefaults *appleDepthUserDefaults;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSUserDefaults *v15;
  void *v16;
  ADDeviceConfiguration *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)ADDeviceConfiguration;
  v2 = -[ADDeviceConfiguration init](&v24, sel_init);
  if (v2)
  {
    +[ADDeviceConfiguration getDefaultConfiguration](ADDeviceConfiguration, "getDefaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");
    currentDefaults = v2->_currentDefaults;
    v2->_currentDefaults = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = objc_claimAutoreleasedReturnValue();
    globalUserDefaults = v2->_globalUserDefaults;
    v2->_globalUserDefaults = (NSUserDefaults *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AppleDepth"));
    appleDepthUserDefaults = v2->_appleDepthUserDefaults;
    v2->_appleDepthUserDefaults = (NSUserDefaults *)v8;

    v2->_ignoreValueUpdate = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    +[ADDeviceConfiguration getDefaultConfiguration](ADDeviceConfiguration, "getDefaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = v2->_globalUserDefaults;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AppleDepth"), v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults addObserver:forKeyPath:options:context:](v15, "addObserver:forKeyPath:options:context:", v2, v16, 7, 0);

          v2->_ignoreValueUpdate = 1;
          -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_appleDepthUserDefaults, "addObserver:forKeyPath:options:context:", v2, v14, 7, 0);
          v2->_ignoreValueUpdate = 0;
          if (!-[ADDeviceConfiguration createPropertyForKey:](v2, "createPropertyForKey:", v14))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v14;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed setting property for configuration key %{public}@", buf, 0xCu);
            }

            v17 = 0;
            goto LABEL_15;
          }
        }
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v17 = v2;
LABEL_15:

  return v17;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSUserDefaults *globalUserDefaults;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[ADDeviceConfiguration getDefaultConfiguration](ADDeviceConfiguration, "getDefaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSUserDefaults removeObserver:forKeyPath:context:](self->_appleDepthUserDefaults, "removeObserver:forKeyPath:context:", self, v7, 0);
        globalUserDefaults = self->_globalUserDefaults;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AppleDepth"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSUserDefaults removeObserver:forKeyPath:context:](globalUserDefaults, "removeObserver:forKeyPath:context:", self, v9, 0);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)ADDeviceConfiguration;
  -[ADDeviceConfiguration dealloc](&v10, sel_dealloc);
}

- (void)updateValue:(id)a3 forKey:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[ADDeviceConfiguration willChangeValueForKey:](self, "willChangeValueForKey:", v9);
  v10 = v8;
  if (!v8)
  {
    +[ADDeviceConfiguration getDefaultConfiguration](ADDeviceConfiguration, "getDefaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "copy");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDefaults, "setObject:forKeyedSubscript:", v10, v9);
  if (!v8)
  {

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDefaults, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADDeviceConfiguration: (%@)=>(%@)", (uint8_t *)&v21, 0x16u);

  }
  if (objc_msgSend(v9, "isEqualToString:", kADDeviceConfigurationKeyJasperPerformanceOverridePath))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDefaults, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE05FE0], "resetPerformanceOverrides");
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDefaults, "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE05FE0], "setPerformanceOverrides:", v15);

    }
  }
  if (objc_msgSend(v9, "isEqualToString:", kADDeviceConfigurationKeyJasperPerformanceEmulatedDevice))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDefaults, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (v18)
    {

      v16 = 0;
    }
    objc_msgSend(MEMORY[0x24BE05FE0], "setEmulatedDevice:", v16);

  }
  if (objc_msgSend(v9, "isEqualToString:", kADDeviceConfigurationKeyVerboseLogs))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDefaults, "objectForKeyedSubscript:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 67109120;
      LODWORD(v22) = v20;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "setting verboseLogs: %d", (uint8_t *)&v21, 8u);
    }
    ADDebugUtilsADVerboseLogsEnabled = v20;

  }
  -[ADDeviceConfiguration didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  NSUserDefaults *v10;
  id v11;
  NSUserDefaults *globalUserDefaults;
  id v13;
  void *v14;
  NSUserDefaults *appleDepthUserDefaults;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (NSUserDefaults *)a4;
  v11 = a5;
  if (self->_ignoreValueUpdate)
    goto LABEL_23;
  globalUserDefaults = self->_globalUserDefaults;
  if (self->_appleDepthUserDefaults != v10)
  {
    if (globalUserDefaults != v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error getting defaults key", buf, 2u);
      }
      goto LABEL_23;
    }
    goto LABEL_8;
  }
  if (globalUserDefaults == v10)
  {
LABEL_8:
    v13 = v9;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.AppleDepth"), v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14 = v13;
  appleDepthUserDefaults = self->_appleDepthUserDefaults;
  v16 = v9;
  v17 = v16;
  v18 = v16;
  if (appleDepthUserDefaults != v10)
  {
    if (objc_msgSend(v16, "hasPrefix:", CFSTR("com.apple.AppleDepth")))
    {
      objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.AppleDepth"), "length") + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  -[NSUserDefaults objectForKey:](self->_globalUserDefaults, "objectForKey:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_appleDepthUserDefaults, "objectForKey:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && v20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot set configuration. %{public}@ is set in both global domain and in com.apple.appleDepth. please only use one.", buf, 0xCu);
    }
  }
  else
  {
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v19;
    -[ADDeviceConfiguration updateValue:forKey:](self, "updateValue:forKey:", v22, v18);
  }

LABEL_23:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDefaults, 0);
  objc_storeStrong((id *)&self->_appleDepthUserDefaults, 0);
  objc_storeStrong((id *)&self->_globalUserDefaults, 0);
}

+ (id)getDefaultConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[25];
  _QWORD v19[26];

  v19[25] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
  if (!+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    objc_msgSend(v6, "UTF8String");
    if (os_variant_allows_internal_security_policies())
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 2uLL, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v9;
    }
    v18[0] = kADDeviceConfigurationKeyJasperColorInFieldForceAngularVelocityLogic;
    v18[1] = kADDeviceConfigurationKeyJasperColorInFieldAngularVelocityThreshold;
    v19[0] = &unk_24C434F20;
    v19[1] = &unk_24C434F38;
    v18[2] = kADDeviceConfigurationKeyJasperColorInFieldForceRun;
    v18[3] = kADDeviceConfigurationKeyJasperColorInFieldDisableSDF;
    v19[2] = &unk_24C434F20;
    v19[3] = &unk_24C434F20;
    v18[4] = kADDeviceConfigurationKeyJasperColorInFieldOperationMode;
    v18[5] = kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames;
    v19[4] = &unk_24C434F50;
    v19[5] = &unk_24C434F68;
    v18[6] = kADDeviceConfigurationKeyJasperColorIsfCapacity;
    v18[7] = kADDeviceConfigurationKeyJasperColorIsfOutliers;
    v19[6] = &unk_24C434F80;
    v19[7] = &unk_24C434F98;
    v18[8] = kADDeviceConfigurationKeyJasperColorInfieldFrequency;
    v18[9] = kADDeviceConfigurationKeyPearlColorInFieldOperationMode;
    v19[8] = &unk_24C434F50;
    v19[9] = &unk_24C434F50;
    v18[10] = kADDeviceConfigurationKeyPearlColorInFieldMinRotationBetweenFrames;
    v18[11] = kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS;
    v19[10] = &unk_24C434F68;
    v19[11] = &unk_24C434FB0;
    v18[12] = kADDeviceConfigurationKeyPearlColorIsfOutliers_iOS;
    v18[13] = kADDeviceConfigurationKeyPearlColorIsfCapacity;
    v19[12] = &unk_24C434F68;
    v19[13] = &unk_24C434FC8;
    v18[14] = kADDeviceConfigurationKeyPearlColorIsfOutliers;
    v18[15] = kADDeviceConfigurationKeyPearlColorMinimumLuxLevel;
    v19[14] = &unk_24C434FE0;
    v19[15] = &unk_24C434FF8;
    v19[16] = &unk_24C435248;
    v18[16] = kADDeviceConfigurationKeyPearlColorStdThreshold_iOS;
    v18[17] = kADDeviceConfigurationKeyJasperPerformanceOverridePath;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[17] = v10;
    v18[18] = kADDeviceConfigurationKeyJasperPerformanceEmulatedDevice;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[18] = v11;
    v19[19] = v3;
    v18[19] = kADDeviceConfigurationKeyModelConfigurationFolder;
    v18[20] = kADDeviceConfigurationKeyEnabledLoggers;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[20] = v12;
    v18[21] = kADDeviceConfigurationKeyLoggingHostName;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[21] = v13;
    v18[22] = kADDeviceConfigurationKeyLogFolder;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[22] = v14;
    v19[23] = MEMORY[0x24BDBD1C0];
    v18[23] = kADDeviceConfigurationKeyLoggingPriorityForceAll;
    v18[24] = kADDeviceConfigurationKeyVerboseLogs;
    v19[24] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 25);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
    +[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems = v15;

    v2 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
  }
  return v2;
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "BOOLValue");

  return v9;
}

+ (int64_t)integerForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  int64_t v9;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "integerValue");

  return v9;
}

+ (float)floatForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  float v9;
  float v10;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  v9 = 0.0;
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v6, "floatValue");
    v9 = v10;
  }

  return v9;
}

+ (double)doubleForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  v9 = 0.0;
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v10;
  }

  return v9;
}

+ (id)numberForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

+ (id)listForKey:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "sharedConfiguration");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5[3], "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

+ (BOOL)deviceList:(id)a3 containsDeviceName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (unint64_t)getLidarType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[ADDeviceConfiguration getLidarType:]::supportedJasperDevices)
    +[ADDeviceConfiguration getLidarType:]::supportedJasperDevices = (uint64_t)&unk_24C4351A0;
  v5 = (void *)+[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices;
  if (!+[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices)
  {
    v5 = &unk_24C4351B8;
    +[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices = (uint64_t)&unk_24C4351B8;
  }
  if (+[ADDeviceConfiguration deviceList:containsDeviceName:](ADDeviceConfiguration, "deviceList:containsDeviceName:", v5, v4))
  {
    v6 = 2;
  }
  else
  {
    v6 = +[ADDeviceConfiguration deviceList:containsDeviceName:](ADDeviceConfiguration, "deviceList:containsDeviceName:", +[ADDeviceConfiguration getLidarType:]::supportedJasperDevices, v4);
  }

  return v6;
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

void __44__ADDeviceConfiguration_sharedConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  int v14;
  const __CFDictionary *v15;
  io_service_t MatchingService;
  void *CFProperty;
  int v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = AppleDepthRuntimeVersionString;
    objc_msgSend((id)objc_opt_class(), "getDeviceName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = (const __CFString *)v2;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Initializing default configuration for AppleDepth-%@ for device %@", (uint8_t *)&v24, 0x16u);

  }
  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  +[ADDeviceConfiguration sharedConfiguration]::defaults = (uint64_t)v4;

  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "getDeviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "getLidarType:", v7);
    v24 = 134217984;
    v25 = (const __CFString *)v8;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "lidar type: %lu", (uint8_t *)&v24, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BuildInformationString"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v11;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "AppleDepth build information: %@", (uint8_t *)&v24, 0xCu);
  }
  if ((-[__CFString hasSuffix:](v11, "hasSuffix:", CFSTR("(AppleDepth-)")) & 1) != 0)
  {
    v12 = CFSTR("official");
  }
  else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("unknown")))
  {
    v12 = CFSTR("local build");
  }
  else
  {
    v12 = CFSTR("root");
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v12;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "AppleDepth source: %@", (uint8_t *)&v24, 0xCu);
  }
  objc_msgSend(v9, "bundleIdentifier");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "UTF8String");
  v14 = os_variant_allows_internal_security_policies();

  if (v14)
  {
    v15 = IOServiceNameMatching("options");
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v15);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("boot-args"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v18 = objc_msgSend(CFProperty, "containsString:", CFSTR("enforceModelSignatureChecks=0"));
    if (((-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("official")) | v18) & 1) != 0)
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (MatchingService && CFProperty)
      {
        if (v19)
        {
          v20 = CFSTR("not ");
          if (v18)
            v20 = &stru_24C421AD8;
          v24 = 138412546;
          v25 = CFSTR("enforceModelSignatureChecks=0");
          v26 = 2112;
          v27 = v20;
          v21 = MEMORY[0x24BDACB70];
          v22 = "%@ is %@set";
          v23 = 22;
          goto LABEL_27;
        }
LABEL_28:
        IOObjectRelease(MatchingService);

        goto LABEL_29;
      }
      if (!v19)
        goto LABEL_28;
      LOWORD(v24) = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "Unable to verify boot-args";
      v23 = 2;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v24 = 138412290;
      v25 = CFSTR("enforceModelSignatureChecks=0");
      v21 = MEMORY[0x24BDACB70];
      v22 = "Missing required boot-arg: %@";
      v23 = 12;
    }
LABEL_27:
    _os_log_impl(&dword_20B62B000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v24, v23);
    goto LABEL_28;
  }
LABEL_29:

}

@end

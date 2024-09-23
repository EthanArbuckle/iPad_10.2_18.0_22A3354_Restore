@implementation AXTapticChimeAsset

+ (id)_assetPathForChimeSoundType:(int64_t)a3 fileName:(id)a4
{
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v6 = a4;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AXTapticChimeAsset__assetPathForChimeSoundType_fileName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_assetPathForChimeSoundType_fileName__onceToken != -1)
      dispatch_once(&_assetPathForChimeSoundType_fileName__onceToken, block);
    v7 = CFSTR("Birds");
    if (a3 != 2)
      v7 = 0;
    if (a3 == 1)
      v8 = CFSTR("Bells");
    else
      v8 = v7;
    objc_msgSend((id)_assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __59__AXTapticChimeAsset__assetPathForChimeSoundType_fileName___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("ChimeAssets"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory;
  _assetPathForChimeSoundType_fileName__baseChimeAssetsDirectory = v2;

}

+ (id)hourAssetForType:(int64_t)a3 hour:(unint64_t)a4
{
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;

  if (a3 == 2)
  {
    if (a4 % 0xC)
      v9 = a4 % 0xC;
    else
      v9 = 12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bird%02d.caf"), v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bird%02d.plist"), v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      v7 = CFSTR("Bell.plist");
    else
      v7 = 0;
    if (a3 == 1)
      v8 = CFSTR("Bell.caf");
    else
      v8 = 0;
  }
  objc_msgSend(a1, "_assetPathForChimeSoundType:fileName:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assetPathForChimeSoundType:fileName:", a3, v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    v13 = -[AXTapticChimeAsset _initWithChimeSoundType:audioFilePath:hapticsFilePath:]([AXTapticChimeAsset alloc], "_initWithChimeSoundType:audioFilePath:hapticsFilePath:", a3, v10, v11);
  }
  else
  {
    AXLogTapticTime();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[AXTapticChimeAsset hourAssetForType:hour:].cold.1(a3, a4, v14);

    v13 = 0;
  }

  return v13;
}

+ (id)quarterHourAssetForType:(int64_t)a3
{
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = CFSTR("QuarterBell.plist");
  if (a3 != 1)
    v5 = 0;
  if (a3 == 2)
    v6 = CFSTR("QuarterBird.plist");
  else
    v6 = v5;
  objc_msgSend(a1, "_assetPathForChimeSoundType:fileName:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_assetPathForChimeSoundType:fileName:", a3, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    v10 = -[AXTapticChimeAsset _initWithChimeSoundType:audioFilePath:hapticsFilePath:]([AXTapticChimeAsset alloc], "_initWithChimeSoundType:audioFilePath:hapticsFilePath:", a3, v7, v8);
  }
  else
  {
    AXLogTapticTime();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[AXTapticChimeAsset quarterHourAssetForType:].cold.1(a3, v11, v12, v13, v14, v15, v16, v17);

    v10 = 0;
  }

  return v10;
}

- (id)_initWithChimeSoundType:(int64_t)a3 audioFilePath:(id)a4 hapticsFilePath:(id)a5
{
  id v8;
  id v9;
  AXTapticChimeAsset *v10;
  float v11;
  uint64_t v12;
  NSDictionary *hapticDictionary;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)AXTapticChimeAsset;
  v10 = -[AXTapticChimeAsset init](&v26, sel_init);
  AXSVoiceOverTapticChimesVolumeForSoundType();
  v10->_volume = v11;
  objc_storeStrong((id *)&v10->_audioFilePath, a4);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  hapticDictionary = v10->_hapticDictionary;
  v10->_hapticDictionary = (NSDictionary *)v12;

  if (!v10->_hapticDictionary)
  {
    AXLogTapticTime();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[AXTapticChimeAsset _initWithChimeSoundType:audioFilePath:hapticsFilePath:].cold.1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

  }
  v10->_prePlayTimeInterval = 0.0;
  -[AXTapticChimeAsset hapticAtomEntries](v10, "hapticAtomEntries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "objectForKey:", CFSTR("StartTime"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "doubleValue");
      v10->_prePlayTimeInterval = v24;
    }

  }
  return v10;
}

- (NSArray)hapticAtomEntries
{
  void *v2;
  void *v3;
  id v4;

  -[AXTapticChimeAsset hapticDictionary](self, "hapticDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Atoms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (unsigned)createSystemSoundIDForStartTime:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AXTapticChimeAsset hapticAtomEntries](self, "hapticAtomEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("StartTime"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v13, "numberWithDouble:", v14 + a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("StartTime"));

        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v8);
  }

  v16 = (void *)MEMORY[0x24BDBCED8];
  -[AXTapticChimeAsset hapticDictionary](self, "hapticDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, CFSTR("Atoms"));
  v29 = *MEMORY[0x24BDB6D28];
  v30 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  AudioServicesCreateSystemSoundIDWithOptions();
  AXLogTapticTime();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v26 = 0;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_22701A000, v19, OS_LOG_TYPE_INFO, "created system sound id: %u, with haptic dictionary: %@", buf, 0x12u);
  }

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTapticChimeAsset audioFilePath](self, "audioFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTapticChimeAsset volume](self, "volume");
  v8 = v7;
  -[AXTapticChimeAsset prePlayTimeInterval](self, "prePlayTimeInterval");
  v10 = v9;
  -[AXTapticChimeAsset hapticDictionary](self, "hapticDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; audioFilePath = \"%@\", volume = \"%f\", prePlayTimeInterval = \"%f\" hapticDictionary = \"%@\">"),
    v5,
    self,
    v6,
    *(_QWORD *)&v8,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)audioFilePath
{
  return self->_audioFilePath;
}

- (double)prePlayTimeInterval
{
  return self->_prePlayTimeInterval;
}

- (float)volume
{
  return self->_volume;
}

- (NSDictionary)hapticDictionary
{
  return self->_hapticDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticDictionary, 0);
  objc_storeStrong((id *)&self->_audioFilePath, 0);
}

+ (void)hourAssetForType:(os_log_t)log hour:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl(&dword_22701A000, log, OS_LOG_TYPE_FAULT, "failed to find asset for sound type: %li, hour: %lu", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

+ (void)quarterHourAssetForType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_22701A000, a2, a3, "failed to find quarter hour asset for sound type: %li", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_initWithChimeSoundType:(uint64_t)a3 audioFilePath:(uint64_t)a4 hapticsFilePath:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_22701A000, a2, a3, "empty haptic dictionary at path: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end

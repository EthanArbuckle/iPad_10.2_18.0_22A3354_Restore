@implementation AXSDSettings(AXSoundDetectionUIAdditions)

- (id)decodedKShotDetectors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "kShotDetectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeKShotDetectors:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)decodeKShotDetectors:()AXSoundDetectionUIAdditions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint64_t v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

    v8 = objc_alloc(MEMORY[0x24BDBCF20]);
    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v7, v10, v3, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    v13 = v12;
    if (v11)
    {
      v14 = v11;
    }
    else
    {
      if (v12)
      {
        AXLogUltron();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[AXSDSettings(AXSoundDetectionUIAdditions) decodeKShotDetectors:].cold.1((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);

      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

  }
  return v15;
}

- (void)addKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v4, v6);

  objc_msgSend(a1, "encodeAndSaveKShotDetectors:", v7);
}

- (void)updateKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v4, v6);

  objc_msgSend(a1, "encodeAndSaveKShotDetectors:", v7);
}

- (void)removeKShotDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v6);

  objc_msgSend(a1, "deleteTrainingFilesForDetector:", v4);
  objc_msgSend(a1, "deleteModelForDetector:", v4);

  objc_msgSend(a1, "encodeAndSaveKShotDetectors:", v7);
}

- (void)removeAllKShotDetectors
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeKShotDetectors:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setKShotDetectors:", v3);
}

- (void)enableDetector:()AXSoundDetectionUIAdditions
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isCustom"))
  {
    objc_msgSend(a1, "setKShotDetectorIsEnabled:isEnabled:", v5, 1);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "addSoundDetectionType:", v4);
    v5 = (id)v4;
  }

}

- (void)disableDetector:()AXSoundDetectionUIAdditions
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isCustom"))
  {
    objc_msgSend(a1, "setKShotDetectorIsEnabled:isEnabled:", v5, 1);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "addSoundDetectionType:", v4);
    v5 = (id)v4;
  }

}

- (void)setDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isCustom"))
  {
    objc_msgSend(a1, "setKShotDetectorIsEnabled:isEnabled:", v7, a4);
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a4)
      objc_msgSend(a1, "addSoundDetectionType:", v6);
    else
      objc_msgSend(a1, "removeSoundDetectionType:", v6);

  }
}

- (void)setKShotDetectorIsEnabled:()AXSoundDetectionUIAdditions isEnabled:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a1, "enabledKShotDetectorIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v9, "addObject:", v8);
  else
    objc_msgSend(v9, "removeObject:", v8);

  objc_msgSend(a1, "setEnabledKShotDetectorIdentifiers:", v9);
}

- (void)setKShotDetectorModelFailed:()AXSoundDetectionUIAdditions modelFailed:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModelFailed:", a4);

  objc_msgSend(a1, "encodeAndSaveKShotDetectors:", v10);
}

- (void)editKShotDetectorName:()AXSoundDetectionUIAdditions newName:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", v6);

  objc_msgSend(a1, "encodeAndSaveKShotDetectors:", v11);
}

- (id)encodeKShotDetectors:()AXSoundDetectionUIAdditions
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    AXLogUltron();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSDSettings(AXSoundDetectionUIAdditions) encodeKShotDetectors:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

- (void)encodeAndSaveKShotDetectors:()AXSoundDetectionUIAdditions
{
  id v2;

  objc_msgSend(a1, "encodeKShotDetectors:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setKShotDetectors:", v2);

}

- (id)kShotSoundRecordingsForDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "kShotSoundRecordings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)kShotCategoryForDetectionType:()AXSoundDetectionUIAdditions
{
  id v3;
  id *v4;
  id v5;
  char v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1D8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF218]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDFF150];
  }
  else
  {
    v7 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF220]);
    v4 = (id *)MEMORY[0x24BDFF140];
    if ((v7 & 1) == 0 && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF260]))
      v4 = (id *)MEMORY[0x24BDFF158];
  }
  v5 = *v4;

  return v5;
}

- (id)detectorForIdentifier:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "decodedKShotDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hasCustomToneForKshotDetector:()AXSoundDetectionUIAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultToneIdentifierForAlertType:topic:", 29, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentToneIdentifierForAlertType:topic:", 29, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

  }
  else
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSDSettings(AXSoundDetectionUIAdditions) hasCustomToneForKshotDetector:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }

  return v10;
}

- (uint64_t)hasCustomHapticForKshotDetector:()AXSoundDetectionUIAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultVibrationIdentifierForAlertType:topic:", 29, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentVibrationIdentifierForAlertType:topic:", 29, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

  }
  else
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSDSettings(AXSoundDetectionUIAdditions) hasCustomHapticForKshotDetector:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }

  return v10;
}

- (void)deleteRecordingLinksForDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "kShotSoundRecordings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v6, v7);
  objc_msgSend(a1, "setKShotSoundRecordings:", v8);

}

- (uint64_t)deleteTrainingFilesForDetector:()AXSoundDetectionUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v20 = 0;
    v11 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v20);
    v12 = v20;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(a1, "deleteRecordingLinksForDetector:", v4);
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v5;
        v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_INFO, "Deleted training files at path: %@ for detector: %@", buf, 0x16u);

      }
      v16 = 1;
    }
    else
    {
      if (!v12)
      {
        v16 = 1;
        goto LABEL_13;
      }
      AXLogUltron();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXSDSettings(AXSoundDetectionUIAdditions) deleteTrainingFilesForDetector:].cold.1(v4);

      v16 = 0;
    }
  }
  else
  {
    AXLogUltron();
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_21ACD4000, v13, OS_LOG_TYPE_INFO, "No need to delete training files for detector: %@, since the directory does not exist", buf, 0xCu);

    }
  }

LABEL_13:
  return v16;
}

- (uint64_t)deleteModelForDetector:()AXSoundDetectionUIAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *MEMORY[0x24BDFF180]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".mlmodel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v20 = 0;
    v11 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v20);
    v12 = v20;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_INFO, "Deleted model at path: %@ for detector: %@", buf, 0x16u);

      }
      v16 = 1;
    }
    else
    {
      if (!v12)
      {
        v16 = 1;
        goto LABEL_13;
      }
      AXLogUltron();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXSDSettings(AXSoundDetectionUIAdditions) deleteModelForDetector:].cold.1(v3);

      v16 = 0;
    }
  }
  else
  {
    AXLogUltron();
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_21ACD4000, v13, OS_LOG_TYPE_INFO, "No need to delete model for detector: %@, since the model does not exist", buf, 0xCu);

    }
  }

LABEL_13:
  return v16;
}

- (void)decodeKShotDetectors:()AXSoundDetectionUIAdditions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, a2, a3, "Error decoding KShot detectors: %@", a5, a6, a7, a8, 2u);
}

- (void)encodeKShotDetectors:()AXSoundDetectionUIAdditions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, a2, a3, "Error encoding KShot detectors: %@", a5, a6, a7, a8, 2u);
}

- (void)hasCustomToneForKshotDetector:()AXSoundDetectionUIAdditions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Trying to check custom tone for detector identifier that doesn't exist!", a5, a6, a7, a8, 0);
}

- (void)hasCustomHapticForKshotDetector:()AXSoundDetectionUIAdditions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Trying to check custom haptic for detector identifier that doesn't exist!", a5, a6, a7, a8, 0);
}

- (void)deleteTrainingFilesForDetector:()AXSoundDetectionUIAdditions .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "Error deleting training directory for detector: %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)deleteModelForDetector:()AXSoundDetectionUIAdditions .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "Error deleting model for detector: %@ error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

@end

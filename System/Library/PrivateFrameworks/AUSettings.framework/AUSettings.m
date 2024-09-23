id InternalStorageDirectoryPath()
{
  if (InternalStorageDirectoryPath_onceToken != -1)
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global);
  return (id)InternalStorageDirectoryPath_path;
}

id UARPStringDynamicAssetsFilepath()
{
  if (UARPStringDynamicAssetsFilepath_onceToken != -1)
    dispatch_once(&UARPStringDynamicAssetsFilepath_onceToken, &__block_literal_global_0);
  return (id)UARPStringDynamicAssetsFilepath_path;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (UARPStringSupplementalAssetsFilepath_onceToken != -1)
    dispatch_once(&UARPStringSupplementalAssetsFilepath_onceToken, &__block_literal_global_496);
  return (id)UARPStringSupplementalAssetsFilepath_path;
}

id UARPStringTempFilesFilepath()
{
  if (UARPStringTempFilesFilepath_onceToken != -1)
    dispatch_once(&UARPStringTempFilesFilepath_onceToken, &__block_literal_global_497);
  return (id)UARPStringTempFilesFilepath_path;
}

id UARPStringPcapFilesFilepath()
{
  if (UARPStringPcapFilesFilepath_onceToken != -1)
    dispatch_once(&UARPStringPcapFilesFilepath_onceToken, &__block_literal_global_498);
  return (id)UARPStringPcapFilesFilepath_path;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-256")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-384")))
    {
      v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-512"));
      v3 = (void *)MEMORY[0x24BDD16E0];
      if (v2)
        v4 = 0;
      else
        v4 = 3;
    }
    else
    {
      v3 = (void *)MEMORY[0x24BDD16E0];
      v4 = 2;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = 1;
  }
  objc_msgSend(v3, "numberWithUnsignedShort:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id UARPStringTmapDirectoryPath()
{
  if (UARPStringTmapDirectoryPath_onceToken != -1)
    dispatch_once(&UARPStringTmapDirectoryPath_onceToken, &__block_literal_global_587);
  return (id)UARPStringTmapDirectoryPath_path;
}

id UARPStringTmapDatabaseFilePath()
{
  if (UARPStringTmapDatabaseFilePath_onceToken != -1)
    dispatch_once(&UARPStringTmapDatabaseFilePath_onceToken, &__block_literal_global_588);
  return (id)UARPStringTmapDatabaseFilePath_path;
}

id UARPStringTapToRadarFilePath()
{
  if (UARPStringTapToRadarFilePath_onceToken != -1)
    dispatch_once(&UARPStringTapToRadarFilePath_onceToken, &__block_literal_global_591);
  return (id)UARPStringTapToRadarFilePath_path;
}

id UARPStringLogsDirectoryFilePath()
{
  if (UARPStringLogsDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringLogsDirectoryFilePath_onceToken, &__block_literal_global_594);
  return (id)UARPStringLogsDirectoryFilePath_path;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (UARPStringCrashAnalyticsDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringCrashAnalyticsDirectoryFilePath_onceToken, &__block_literal_global_597);
  return (id)UARPStringCrashAnalyticsDirectoryFilePath_path;
}

id UARPStringCmapDirectoryPath()
{
  if (UARPStringCmapDirectoryPath_onceToken != -1)
    dispatch_once(&UARPStringCmapDirectoryPath_onceToken, &__block_literal_global_644);
  return (id)UARPStringCmapDirectoryPath_path;
}

id UARPStringCmapDatabaseFilePath()
{
  if (UARPStringCmapDatabaseFilePath_onceToken != -1)
    dispatch_once(&UARPStringCmapDatabaseFilePath_onceToken, &__block_literal_global_645);
  return (id)UARPStringCmapDatabaseFilePath_path;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (UARPStringSysdiagnoseDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringSysdiagnoseDirectoryFilePath_onceToken, &__block_literal_global_650);
  return (id)UARPStringSysdiagnoseDirectoryFilePath_path;
}

id UARPStringPifMetricsFilePath()
{
  if (UARPStringPifMetricsFilePath_onceToken != -1)
    dispatch_once(&UARPStringPifMetricsFilePath_onceToken, &__block_literal_global_653);
  return (id)UARPStringPifMetricsFilePath_path;
}

const __CFString *MapPreferenceSuiteToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("com.apple.accessoryupdaterd");
  if (a1)
    v1 = 0;
  if (a1 == 1)
    return CFSTR("com.apple.AUDeveloperSettings");
  else
    return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_235CB4E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

const char *AUDeveloperSettingsAccessoryFusingTypeToString(unint64_t a1)
{
  if (a1 > 3)
    return "unrecognized";
  else
    return off_250711330[a1];
}

uint64_t AUDeveloperSettingsAccessoryFusingStringToType(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Dev");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Prod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unfused");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqualToString:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Pending");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqualToString:", v9);

        if (v10)
          v4 = 3;
        else
          v4 = 4;
      }
    }
  }

  return v4;
}

const char *AUDeveloperSettingsURLTypeToString(unint64_t a1)
{
  if (a1 > 6)
    return "unrecognized";
  else
    return off_250711350[a1];
}

uint64_t AUDeveloperSettingsURLStringToType(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Livability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Internal Seed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Customer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqualToString:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Public Seed");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqualToString:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = 3;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Basejumper");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v1, "isEqualToString:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = 4;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Custom Basejumper");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v1, "isEqualToString:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = 5;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Mesu Staging");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v1, "isEqualToString:", v15);

              if (v16)
                v4 = 6;
              else
                v4 = 7;
            }
          }
        }
      }
    }
  }

  return v4;
}

id getInfoForAccessory(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoriesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL configuredToDefaultAssetLocationForAccessory(void *a1)
{
  id v1;
  void *v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("fusing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (AUDeveloperSettingsAccessoryFusingStringToType(v2) & 5) != 0;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("assetLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = AUDeveloperSettingsURLStringToType(v4);
  return v5 == 2 * v3;
}

__CFString *getURLForAssetURLType(unint64_t a1)
{
  __CFString *v1;

  if (a1 <= 6 && ((0x75u >> a1) & 1) != 0)
    v1 = *(&off_250711388)[a1];
  else
    v1 = 0;
  return v1;
}

void cleanupPersonalizedUpdateAvailable(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v1 = a1;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoriesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("downloadedVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("personalizationRequired"));
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAccessoryWithSerialNumber:info:", v1, v6);

}

id findPartnerSerialNumbersInDatabase(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoriesDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __findPartnerSerialNumbersInDatabase_block_invoke;
  v12 = &unk_250711310;
  v13 = v1;
  v14 = v2;
  v5 = v2;
  v6 = v1;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __findPartnerSerialNumbersInDatabase_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("partnerSerialNumbers"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", *(_QWORD *)(a1 + 32), (_QWORD)v11)&& (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

id findPartnerSerialNumberForAccessory(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id obj;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "partnerSerialNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(v1, "serialNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    findPartnerSerialNumbersInDatabase(v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  objc_msgSend(v1, "hwFusingType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(v20, "accessoriesDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKey:", CFSTR("fusing"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v1, "serialNumber");
          v13 = v1;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v9, "isEqualToString:", v14);

          v1 = v13;
          if ((v15 & 1) == 0
            && (!objc_msgSend(v12, "caseInsensitiveCompare:", v19)
             || (objc_msgSend(v19, "isEqualToString:", CFSTR("prod")) & 1) == 0
             && objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("prod"))))
          {
            v16 = v9;

            goto LABEL_17;
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

id getAccessoryDatabaseKeyForAccessoryID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BE28A18];
  objc_msgSend(v1, "modelNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findByAppleModelNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "supportsInternalSettings")
    && (objc_msgSend(v1, "serialNumber"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoriesDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v1, "serialNumber");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      findPartnerSerialNumberForAccessory(v1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessoriesDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v10 = v12;
      else
        v10 = 0;

    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t isOTAUpdateDisabledForAccessoryID(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  getAccessoryDatabaseKeyForAccessoryID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoriesDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOTADisabled"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void dropboxFileUpdateForAccessoryID(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  getAccessoryDatabaseKeyForAccessoryID(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoriesDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("dropboxVersion"));
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAccessoryWithSerialNumber:info:", v3, v8);

    }
  }

}

void updateReachabilityForAccessoryID(void *a1, unsigned int a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    getAccessoryDatabaseKeyForAccessoryID(v2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessoriesDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryReachable"));

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addAccessoryWithSerialNumber:info:", v6, v12);

      }
    }
  }
  else
  {
    objc_msgSend(v3, "accessoriesDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v4, "accessoriesDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("accessoryReachable"));

            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addAccessoryWithSerialNumber:info:", v20, v25);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }

    v2 = 0;
  }

}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}


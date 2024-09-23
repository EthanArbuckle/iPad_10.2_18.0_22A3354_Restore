@implementation AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt

void ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[10];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v35 = *(id *)(a1 + 32);
  buf[0] = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/Accessibility/DataCollection/SoundFiles"), buf) & 1) == 0)
  {
    AXLogUltron();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke_cold_1(v2);

    objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Accessibility/DataCollection/SoundFiles"), 1, 0, 0);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", CFSTR("/var/mobile/Library/Accessibility/DataCollection/SoundFiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(CFSTR("/var/mobile/Library/Accessibility/DataCollection/SoundFiles"), "stringByAppendingPathComponent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, &v37);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v37;
      objc_msgSend(v9, "fileCreationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        AXLogUltron();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v7;
          v41 = 2112;
          v42 = v10;
          _os_log_error_impl(&dword_213CB2000, v12, OS_LOG_TYPE_ERROR, "filesNearestDate: failed to find creation date for file %@. Skipping. error: %@", buf, 0x16u);
        }

      }
      else
      {
        objc_msgSend(v11, "timeIntervalSinceDate:", v35);
        if (fabs(v13) < 15.0)
          objc_msgSend(v34, "addObject:", v7);
      }

      objc_msgSend(v4, "nextObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    while (v14);
  }

  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v31, "setHost:", CFSTR("new"));
  v15 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AX Sound Recognition False Positive: %@"), *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("Title"), v16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), CFSTR("[Add any details about where you were or what you were doing when the false positive occured. Thanks!]"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Performance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Accessibility Sound Detection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1074027"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("All"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v34, "componentsJoinedByString:", CFSTR(","));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "queryItemWithName:value:", CFSTR("Attachments"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("0"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("DeviceClasses"), CFSTR("iPhone,iPad"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v36;
  v38[1] = v33;
  v38[2] = v17;
  v38[3] = v30;
  v38[4] = v18;
  v38[5] = v19;
  v38[6] = v20;
  v38[7] = v23;
  v26 = (void *)v20;
  v38[8] = v24;
  v38[9] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setQueryItems:", v27);

  objc_msgSend(v31, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "openURL:withOptions:", v28, 0);

}

void ___AXSDSoundDetectionGatherFilesAndGenerateRadarForNotificationAt_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_213CB2000, log, OS_LOG_TYPE_DEBUG, "Creating Ultron Directory", v1, 2u);
}

@end

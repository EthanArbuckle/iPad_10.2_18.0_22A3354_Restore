@implementation SBSyncControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSyncController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSyncController"), CFSTR("resetService:willBeginDataResetWithMode:"), "v", "@", "q", 0);
}

- (void)_accessibilityWriteOutDataResetForAXSettings:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  DIR *v14;
  DIR *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_232A0A000, v4, OS_LOG_TYPE_DEFAULT, "Begin right out of ax settings data", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement")) & 1) == 0&& (objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Accessibility")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDD0CF8], *MEMORY[0x24BDD0CF0], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Accessibility"), 1, v6, &v20);
    v7 = v20;
    AXLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.5();

LABEL_32:
      goto LABEL_35;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232A0A000, v9, OS_LOG_TYPE_DEFAULT, "Made directory to store data", buf, 2u);
    }

  }
  v10 = open((const char *)objc_msgSend(CFSTR("/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement"), "fileSystemRepresentation"), 1793, 384);
  AXLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if ((v10 & 0x80000000) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = CFSTR("/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement");
      _os_log_impl(&dword_232A0A000, v7, OS_LOG_TYPE_DEFAULT, "Opened file to store data: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDD0CF8], *MEMORY[0x24BDD0CF0], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v6, CFSTR("/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement"), &v19);
    v7 = v19;
    if (v7)
    {
      AXLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.4();

    }
    v13 = objc_retainAutorelease(v3);
    write(v10, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    fcntl(v10, 51, 0);
    close(v10);
    v14 = opendir((const char *)objc_msgSend(CFSTR("/var/mobile/Library/Accessibility"), "fileSystemRepresentation"));
    v15 = v14;
    if (!v14 || dirfd(v14) == -1)
    {
      AXLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.2(v17);

      if (!v15)
        goto LABEL_29;
    }
    else if (fcntl(v10, 51, 0) == -1)
    {
      AXLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.3(v16);

    }
    closedir(v15);
LABEL_29:
    AXLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = CFSTR("/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement");
      _os_log_impl(&dword_232A0A000, v18, OS_LOG_TYPE_DEFAULT, "Finished writing data: %@", buf, 0xCu);
    }

    goto LABEL_32;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.1(v7);
LABEL_35:

}

- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  int v8;
  _BOOL8 v9;
  int v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  objc_super v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[4];
  uint8_t buf[4];
  _BYTE v27[10];
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((unint64_t)(a4 - 3) <= 1)
  {
    if (MEMORY[0x23491F6CC](*MEMORY[0x24BED2968], 0))
      v7 = 1;
    else
      v7 = _AXSVoiceOverTouchEnabled() != 0;
    v8 = MEMORY[0x23491F6CC](*MEMORY[0x24BED29B8], 0);
    if (_AXSAssistiveTouchEnabled())
      v9 = _AXSAssistiveTouchHardwareEnabled() != 0;
    else
      v9 = 0;
    v10 = _AXSAssistiveTouchScannerEnabled();
    AXLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v27 = v7;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v8 != 0;
      v28 = 1024;
      v29 = v9;
      v30 = 1024;
      v31 = v10 != 0;
      _os_log_impl(&dword_232A0A000, v11, OS_LOG_TYPE_DEFAULT, "AX options will stay enabled: VO:%d, Zoom:%d, AST:%d, SC: %d", buf, 0x1Au);
    }
    v12 = v8 != 0;

    v24[0] = CFSTR("VoiceOverTouch");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v24[1] = CFSTR("ZoomTouch");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    v24[2] = CFSTR("AssistiveTouch");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    v24[3] = CFSTR("SwitchControl");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    if (v19)
    {
      AXMediaLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SBSyncControllerAccessibility resetService:willBeginDataResetWithMode:].cold.1();

    }
    AXLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v27 = v17;
      _os_log_impl(&dword_232A0A000, v21, OS_LOG_TYPE_DEFAULT, "Writing out ax settings: %@", buf, 0xCu);
    }

    -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:](self, "_accessibilityWriteOutDataResetForAXSettings:", v18);
  }
  v22.receiver = self;
  v22.super_class = (Class)SBSyncControllerAccessibility;
  -[SBSyncControllerAccessibility resetService:willBeginDataResetWithMode:](&v22, sel_resetService_willBeginDataResetWithMode_, v6, a4);

}

- (void)_accessibilityWriteOutDataResetForAXSettings:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, a1, v3, "Failed to open data reset State file. errno: %{public}s", v4);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityWriteOutDataResetForAXSettings:(NSObject *)a1 .cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, a1, v3, "Failed to open data reset state directory: %{public}s", v4);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityWriteOutDataResetForAXSettings:(NSObject *)a1 .cold.3(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, a1, v3, "failed to F_FULLSYNC data reset state directory: %{public}s", v4);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, v0, v1, "Failed to set protection class on data reset State file: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, v0, v1, "Failed to create dir for reset state file: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)resetService:willBeginDataResetWithMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_232A0A000, v0, v1, "Failed to archive data: %@", v2);
  OUTLINED_FUNCTION_4();
}

@end

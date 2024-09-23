@implementation CLFSystemShellSwitcher

- (BOOL)isClarityBoardEnabled
{
  return _AXSClarityBoardEnabled() != 0;
}

+ (CLFSystemShellSwitcher)sharedSystemShellSwitcher
{
  if (sharedSystemShellSwitcher_onceToken != -1)
    dispatch_once(&sharedSystemShellSwitcher_onceToken, &__block_literal_global);
  return (CLFSystemShellSwitcher *)(id)sharedSystemShellSwitcher_SharedSystemShellSwitcher;
}

void __51__CLFSystemShellSwitcher_sharedSystemShellSwitcher__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedSystemShellSwitcher_SharedSystemShellSwitcher;
  sharedSystemShellSwitcher_SharedSystemShellSwitcher = v0;

}

- (BOOL)setClarityBoardEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  _BOOL4 v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  +[CLFLog commonLog](CLFLog, "commonLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v20 = v5;
    _os_log_impl(&dword_20D4E9000, v7, OS_LOG_TYPE_DEFAULT, "Set ClarityBoard enabled: %i", buf, 8u);
  }

  if (v5)
  {
    +[CLFSettings_GeneratedCode sharedInstance](CLFSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRestartReason:", CFSTR("enableClarityBoard"));

    +[CLFSettings_GeneratedCode sharedInstance](CLFSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldShowTripleClickInstructions:", 1);

    if (!-[CLFSystemShellSwitcher _createFileWithError:](self, "_createFileWithError:", a4))
    {
LABEL_12:
      LOBYTE(v10) = 0;
      return v10;
    }
LABEL_7:
    v11 = reboot3();
    if (!(_DWORD)v11)
    {
      LOBYTE(v10) = 1;
      return v10;
    }
    v12 = v11;
    +[CLFLog commonLog](CLFLog, "commonLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CLFSystemShellSwitcher setClarityBoardEnabled:error:].cold.1(v12, v13);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12, CFSTR("RebootErrorCode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 5, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  v10 = -[CLFSystemShellSwitcher _removeFileWithError:](self, "_removeFileWithError:", a4);
  if (v10)
    goto LABEL_7;
  return v10;
}

- (BOOL)_createFileWithError:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CLFSystemShellSwitcher _directoryURL](self, "_directoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v17);
    v7 = v17;
    if (!v6)
    {
      +[CLFLog commonLog](CLFLog, "commonLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[CLFSystemShellSwitcher _createFileWithError:].cold.2();

      if (a3)
      {
        if (v7)
        {
          v18 = *MEMORY[0x24BDD1398];
          v19 = v7;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 3, 0);
        LOBYTE(v10) = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      goto LABEL_25;
    }
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ClarityBoardEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v10 = objc_msgSend(v9, "writeToURL:options:error:", v8, 0x10000000, &v16);
    v11 = v16;

    +[CLFLog commonLog](CLFLog, "commonLog");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_20D4E9000, v13, OS_LOG_TYPE_DEFAULT, "Created file at %@.", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[CLFSystemShellSwitcher _createFileWithError:].cold.1();

      if (!a3)
        goto LABEL_24;
      if (v11)
      {
        v20 = *MEMORY[0x24BDD1398];
        v21 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 2, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 1, 0);
    LOBYTE(v10) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_26:

  return v10;
}

- (BOOL)_removeFileWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[CLFSystemShellSwitcher _directoryURL](self, "_directoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ClarityBoardEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v15);
    v8 = v15;
    v9 = v8;
    if (v7)
    {
      +[CLFLog commonLog](CLFLog, "commonLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_20D4E9000, v10, OS_LOG_TYPE_DEFAULT, "Removed file at %@.", buf, 0xCu);
      }
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v12 = objc_msgSend(v9, "code");

      if (v12 == 4)
      {
        LOBYTE(v7) = 1;
        goto LABEL_21;
      }
    }
    else
    {

    }
    +[CLFLog commonLog](CLFLog, "commonLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[CLFSystemShellSwitcher _removeFileWithError:].cold.1();

    if (a3)
    {
      if (v9)
      {
        v16 = *MEMORY[0x24BDD1398];
        v17 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 4, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    LOBYTE(v7) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CLFSystemShellSwitcher"), 1, 0);
    LOBYTE(v7) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_22:

  return v7;
}

- (void)signalSiriAvailability
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  +[CLFLog commonLog](CLFLog, "commonLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D4E9000, v3, OS_LOG_TYPE_DEFAULT, "Siri is now available", buf, 2u);
  }

  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CLFSystemShellSwitcher_signalSiriAvailability__block_invoke;
  block[3] = &unk_24C71FB98;
  block[4] = self;
  dispatch_async(v4, block);

}

void __48__CLFSystemShellSwitcher_signalSiriAvailability__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isClarityBoardEnabled"))
  {
    v1 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("CLFSiriAXBundles"), CFSTR("plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("SiriAXBundles"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/AccessibilityBundles/%@.axbundle"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "load");

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)setClarityBoardEnabled:(BOOL)a3
{
  self->_clarityBoardEnabled = a3;
}

- (void)setClarityBoardEnabled:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_20D4E9000, a2, OS_LOG_TYPE_FAULT, "Unable to initiate user-space reboot. Error code: %i", (uint8_t *)v2, 8u);
}

- (void)_createFileWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4E9000, v0, v1, "Error creating file at %@: %@.");
  OUTLINED_FUNCTION_2();
}

- (void)_createFileWithError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4E9000, v0, v1, "Error creating directory at %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_removeFileWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4E9000, v0, v1, "Error removing file at %@: %@.");
  OUTLINED_FUNCTION_2();
}

@end

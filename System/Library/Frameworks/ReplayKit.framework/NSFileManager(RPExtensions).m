@implementation NSFileManager(RPExtensions)

- (uint64_t)_srTempPath
{
  return objc_msgSend(CFSTR("/private/var/mobile/Library/ReplayKit/"), "stringByExpandingTildeInPath");
}

- (void)_srSetupTempDirectory
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error creating temp directory", v0, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)dateSuffix
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v1, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm:ss"));
  objc_msgSend(v1, "stringFromDate:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outputPath:()RPExtensions bundleID:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a1, "dateSuffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_srTempPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/ClipRecording_%@.mp4"), v10, v7);
  }
  else
  {
    if (a3 != 2)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_srTempPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "_rpLocalizedAppNameFromBundleID:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@_%@.mp4"), v10, v14, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_srTempPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/ScreenRecording_%@.mp4"), v10, v7);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)trimmedOutputPath:()RPExtensions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_srTempPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "_rpLocalizedAppNameFromBundleID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@_trimmed.mp4"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)_srSizeOfTempDir:()RPExtensions
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_srTempPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "fileSize");
  return v8;
}

- (uint64_t)_srDeleteAllTempFiles
{
  return objc_msgSend(a1, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:", 0, 0.0);
}

- (uint64_t)_srDeleteAllAndSystemTempFiles
{
  return objc_msgSend(a1, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:", 1, 0.0);
}

- (uint64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:()RPExtensions deleteSystemFiles:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v43 = (int)a2;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "_srDeleteFilesOlderThanTimeToLiveInSeconds: %i", buf, 8u);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_srTempPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v8, &v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v40;

  __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v11, v10);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v12)
  {
    v13 = v12;
    v33 = 0;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((a4 & 1) != 0
          || (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "containsString:", CFSTR("ScreenRecording_")) & 1) == 0)
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(a1, "_srTempPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@"), v18, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v10;
          objc_msgSend(a1, "attributesOfItemAtPath:error:", v19, &v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v35;

          __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v22, v21);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileModificationDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceDate:", v24);
          v26 = v25;

          v27 = objc_msgSend(v20, "fileSize");
          if (a2 == 0.0 || v26 > a2)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "deleting old file", buf, 2u);
            }
            v34 = v21;
            objc_msgSend(a1, "removeItemAtPath:error:", v19, &v34);
            v28 = v34;

            __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(v29, v28);
            if (v28)
              v30 = 0;
            else
              v30 = v27;
            v33 += v30;
            v21 = v28;
          }

          v10 = v21;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v13);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)_srRemoveFile:()RPExtensions completion:
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(-32768, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke;
  block[3] = &unk_24D15D558;
  v12 = v6;
  v13 = a1;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_srMoveFileFromURL:()RPExtensions toURL:completion:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke;
  v15[3] = &unk_24D15D580;
  v15[4] = a1;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)_srDeleteFilesWithPrefix:()RPExtensions
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke;
  v7[3] = &unk_24D15D5A8;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_srGetCreationDateForFile:()RPExtensions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD0C58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording
{
  return (unint64_t)objc_msgSend(a1, "_srDeviceFreeDiskSpace") > 0x5F5E100;
}

- (uint64_t)_srDeviceFreeDiskSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_srTempPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  return v6;
}

- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording
{
  unint64_t v2;

  v2 = 2 * objc_msgSend(a1, "_srSizeOfTempDir:", 0) + 20000000;
  return v2 < objc_msgSend(a1, "_srDeviceFreeDiskSpace");
}

@end

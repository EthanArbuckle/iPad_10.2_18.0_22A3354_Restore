@implementation HDDiagnosticExtension

- (HDDiagnosticExtension)init
{
  HDDiagnosticExtension *v2;
  HDDiagnosticExtension *v3;
  NSMutableString *v4;
  NSMutableString *collectionLog;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDiagnosticExtension;
  v2 = -[DEExtensionProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DEExtensionProvider setLoggingConsent:](v2, "setLoggingConsent:", CFSTR("The attached logs may contain some of your personal information, including sensitive health information from HealthKit."));
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    collectionLog = v3->_collectionLog;
    v3->_collectionLog = v4;

    v3->_logLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  NSURL *v4;
  NSURL *temporaryDirectoryURL;
  void *v6;
  void *v7;
  NSURL *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  self->_captureStartTime = CFAbsoluteTimeGetCurrent();
  -[HDDiagnosticExtension _generateTemporaryAttachmentDirectory](self, "_generateTemporaryAttachmentDirectory");
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_captureStartTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Beginning diagnostic capture at %@"), v6);

  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_INFO))
  {
    v8 = self->_temporaryDirectoryURL;
    v9 = v7;
    -[NSURL path](v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v78 = v10;
    _os_log_impl(&dword_21CD97000, v9, OS_LOG_TYPE_INFO, "Writing diagnostics to '%@'", buf, 0xCu);

  }
  -[HDDiagnosticExtension _beginMonitoringForContentProtectionStatus](self, "_beginMonitoringForContentProtectionStatus");
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDDaemonDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v70;
    do
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v70 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v17);
        objc_msgSend(v19, "setDelegate:", self);
        if (v18)
          objc_msgSend(v19, "addDependency:", v18);
        v15 = v19;

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDCloudSyncDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDNanoSyncDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v22);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDDatabaseDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v23);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDWorkoutCondenserDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v24);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDSummarySharingDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v25);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDFeatureStatusDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v26);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDOntologyDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v27);

  +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:](HDNotificationSyncDiagnosticOperation, "operationWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v28);

  -[HDDiagnosticExtension _loadOperationsFromPluginsWithAttachmentDirectoryURL:](self, "_loadOperationsFromPluginsWithAttachmentDirectoryURL:", self->_temporaryDirectoryURL);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v29);

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v55 = v20;
  v30 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v66 != v32)
          objc_enumerationMutation(v55);
        v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v34, "setDelegate:", self);
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v35 = obj;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v62 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(v34, "addDependency:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          }
          while (v37);
        }

      }
      v31 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v31);
  }

  objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v55);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Running %ld diagnostic operations"), objc_msgSend(v40, "count"));
  v41 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v41, "addOperations:waitUntilFinished:", v40, 1);
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v43 = v40;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v58 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "attachments");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObjectsFromArray:", v48);

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v45);
  }

  v49 = objc_msgSend(v43, "count");
  v50 = objc_msgSend(v42, "count");
  v51 = objc_msgSend(v42, "count");
  v52 = "s:";
  if (v51 == 1)
    v52 = ":";
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Finished %ld diagnostic operations, producing %ld attachment%s %@"), v49, v50, v52, v42);
  -[HDDiagnosticExtension _endMonitoringForContentProtectionStatus](self, "_endMonitoringForContentProtectionStatus");
  -[HDDiagnosticExtension _captureLog](self, "_captureLog");
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C988]), "initWithPathURL:", self->_temporaryDirectoryURL);
  objc_msgSend(v42, "addObject:", v53);

  return v42;
}

- (void)diagnosticOperation:(id)a3 logMessage:(id)a4
{
  id v5;

  v5 = a4;
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("%@: %@"), objc_opt_class(), v5);

}

- (id)_currentProtectionStateString
{
  uint64_t v2;

  v2 = MKBGetDeviceLockState();
  if (v2 < 8)
    return off_24E0D8708[(int)v2];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%d)"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_beginMonitoringForContentProtectionStatus
{
  int v3;
  const char *v4;
  const char *v5;
  void *v6;
  _QWORD handler[5];

  v3 = MKBDeviceUnlockedSinceBoot();
  v4 = "has";
  if (!v3)
    v4 = "has not";
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Device %s been unlocked since boot."), v4);
  if (MKBDeviceFormattedForContentProtection())
  {
    v5 = (const char *)*MEMORY[0x24BE67240];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __67__HDDiagnosticExtension__beginMonitoringForContentProtectionStatus__block_invoke;
    handler[3] = &unk_24E0D86E8;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_contentProtectionNotifyToken, MEMORY[0x24BDAC9B8], handler);
    -[HDDiagnosticExtension _currentProtectionStateString](self, "_currentProtectionStateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Current content protection state is: %@"), v6);

  }
  else
  {
    -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Content protection not enabled on this device."));
  }
}

void __67__HDDiagnosticExtension__beginMonitoringForContentProtectionStatus__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_currentProtectionStateString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_log:", CFSTR("Content protection state changed: %@"), v2);

}

- (void)_endMonitoringForContentProtectionStatus
{
  id v3;

  -[HDDiagnosticExtension _currentProtectionStateString](self, "_currentProtectionStateString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Ending content protection state monitoring; final state is %@"),
    v3);

}

- (id)_loadOperationsFromPluginsWithAttachmentDirectoryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v21;
  HDDiagnosticExtension *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/Health/DiagnosticExtensionPlugins/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD3E10];
  v29[0] = &unk_255333288;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "loadPrincipalClassesConformingToProtocols:fromBundlesInDirectoryAtURL:skipLoadedBundles:error:", v9, v7, 0, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;

  if (v10)
  {
    v21 = v11;
    v22 = self;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_alloc_init(*(Class *)(*((_QWORD *)&v23 + 1) + 8 * v17));
          objc_msgSend(v18, "diagnosticOperationsWithAttachmentDirectoryURL:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectsFromArray:", v19);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

    -[HDDiagnosticExtension _log:](v22, "_log:", CFSTR("Loaded %ld diagnostic operations from %ld plugins"), objc_msgSend(v12, "count"), objc_msgSend(v13, "count"));
    v11 = v21;
  }
  else
  {
    -[HDDiagnosticExtension _log:](self, "_log:", CFSTR("Unable to load diagnostic operation plugin classes: %@"), v11);
    v12 = (id)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (void)_log:(id)a3
{
  id v4;
  double Current;
  void *v6;
  os_unfair_lock_s *p_logLock;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v4, &v12);

  p_logLock = &self->_logLock;
  os_unfair_lock_lock(&self->_logLock);
  -[NSMutableString appendFormat:](self->_collectionLog, "appendFormat:", CFSTR("[%0.3lf] %@\n"), Current - self->_captureStartTime, v6);
  _HKInitializeLogging();
  v8 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21CD97000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  os_unfair_lock_unlock(p_logLock);

}

- (BOOL)_captureLog
{
  void *v3;
  os_unfair_lock_s *p_logLock;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v10;

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_temporaryDirectoryURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("HDDiagnosticExtension.log"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_logLock = &self->_logLock;
  os_unfair_lock_lock(&self->_logLock);
  v5 = (void *)-[NSMutableString copy](self->_collectionLog, "copy");
  os_unfair_lock_unlock(p_logLock);
  v10 = 0;
  v6 = objc_msgSend(v5, "writeToURL:atomically:encoding:error:", v3, 1, 4, &v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      -[HDDiagnosticExtension _captureLog].cold.1(v8, v3, (uint64_t)v7);
  }

  return v6;
}

- (id)_generateTemporaryAttachmentDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "currentDeviceDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_stringByRemovingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInternalDeviceModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HealthKitDiagnostics_%@_%@_%@_%@.XXXXXX"), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = strdup((const char *)objc_msgSend(v14, "UTF8String"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mkdtemp(v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v16, 1);
  free(v15);

  return v17;
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (BOOL)allowsSensitiveAttachments
{
  return self->_allowsSensitiveAttachments;
}

- (NSMutableString)collectionLog
{
  return self->_collectionLog;
}

- (void)setCollectionLog:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionLog, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
}

- (void)_captureLog
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_21CD97000, v5, OS_LOG_TYPE_ERROR, "Error writing %@: %@", (uint8_t *)&v7, 0x16u);

}

@end

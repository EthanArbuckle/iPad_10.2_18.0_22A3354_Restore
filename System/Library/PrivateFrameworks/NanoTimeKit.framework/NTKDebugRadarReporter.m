@implementation NTKDebugRadarReporter

+ (BOOL)_archiveDirectory:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  BOMCopierNew();
  v19 = CFSTR("createPKZip");
  v20[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "fileSystemRepresentation");
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "fileSystemRepresentation");
  v10 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v10)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2048;
      v18 = v10;
      _os_log_error_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_ERROR, "Arching %@ to %@ failed %ld", (uint8_t *)&v13, 0x20u);
    }

  }
  return v10 == 0;
}

- (NTKDebugRadarReporter)initWithRadarTitle:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKDebugRadarReporter *v11;
  uint64_t v12;
  NTKDebugRadarReporter *v13;
  uint64_t v14;
  NSString *radarTitle;
  uint64_t v16;
  NSString *alertTitle;
  uint64_t v18;
  NSString *alertMessage;
  uint64_t v20;
  NSMutableArray *attachmentURLs;
  uint64_t v22;
  NSMutableArray *additionalInformationStrings;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  NSURL *temporaryDirectoryURLToCleanup;
  NSObject *v33;
  id v35[2];
  objc_super v36;
  uint64_t v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)NTKDebugRadarReporter;
  v11 = -[NTKDebugRadarReporter init](&v36, sel_init);
  v13 = v11;
  if (v11)
  {
    if (NTKInternalBuild(v11, v12))
    {
      v14 = objc_msgSend(v8, "copy");
      radarTitle = v13->_radarTitle;
      v13->_radarTitle = (NSString *)v14;

      v16 = objc_msgSend(v9, "copy");
      alertTitle = v13->_alertTitle;
      v13->_alertTitle = (NSString *)v16;

      v35[1] = &v37;
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &v37);
      alertMessage = v13->_alertMessage;
      v13->_alertMessage = (NSString *)v18;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = objc_claimAutoreleasedReturnValue();
      attachmentURLs = v13->_attachmentURLs;
      v13->_attachmentURLs = (NSMutableArray *)v20;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = objc_claimAutoreleasedReturnValue();
      additionalInformationStrings = v13->_additionalInformationStrings;
      v13->_additionalInformationStrings = (NSMutableArray *)v22;

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = objc_claimAutoreleasedReturnValue();

      NSTemporaryDirectory();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingPathComponent:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = 0;
      v29 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, v35);
      v30 = v35[0];

      if ((v29 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v27);
        v31 = objc_claimAutoreleasedReturnValue();
        temporaryDirectoryURLToCleanup = v13->_temporaryDirectoryURLToCleanup;
        v13->_temporaryDirectoryURLToCleanup = (NSURL *)v31;
      }
      else
      {
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[NTKDebugRadarReporter initWithRadarTitle:alertTitle:alertMessage:].cold.1();

        temporaryDirectoryURLToCleanup = v13->_temporaryDirectoryURLToCleanup;
        v13->_temporaryDirectoryURLToCleanup = 0;
      }

    }
    else
    {
      _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[NTKDebugRadarReporter initWithRadarTitle:alertTitle:alertMessage:].cold.2(v25);
    }

  }
  return v13;
}

- (BOOL)addAttachmentAtURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((NTKInternalBuild(v6, v7) & 1) != 0)
  {
    v8 = *MEMORY[0x1E0C99968];
    v54[0] = *MEMORY[0x1E0C99968];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v6, "resourceValuesForKeys:error:", v9, &v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v45;

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C99978]);

      if (v13)
      {
        -[NTKDebugRadarReporter temporaryDirectoryURLToCleanup](self, "temporaryDirectoryURLToCleanup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        v18 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v6, v16, &v44);
        v19 = v44;

        if ((v18 & 1) != 0)
        {
          -[NTKDebugRadarReporter attachmentURLs](self, "attachmentURLs");
          v20 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v20, "addObject:", v16);
        }
        else
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v49 = v6;
            v50 = 2112;
            v51 = v16;
            v52 = 2112;
            v53 = v19;
            _os_log_error_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_ERROR, "Couldn't copy attachment %@ to %@ - %@", buf, 0x20u);
          }
        }

LABEL_23:
        goto LABEL_24;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0C99960]);

      if (v32)
      {
        -[NTKDebugRadarReporter temporaryDirectoryURLToCleanup](self, "temporaryDirectoryURLToCleanup");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "URLByAppendingPathComponent:", v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "absoluteURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "path");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "absoluteURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringByAppendingPathExtension:", CFSTR("zip"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = +[NTKDebugRadarReporter _archiveDirectory:toFile:](NTKDebugRadarReporter, "_archiveDirectory:toFile:", v19, v38);
        if ((v18 & 1) != 0)
        {
          -[NTKDebugRadarReporter attachmentURLs](self, "attachmentURLs");
          v39 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v39, "addObject:", v16);
        }
        else
        {
          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[NTKDebugRadarReporter addAttachmentAtURL:error:].cold.1();
        }

        goto LABEL_23;
      }
      if (a4)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = *MEMORY[0x1E0CB2FE0];
        v46 = *MEMORY[0x1E0CB3308];
        v47 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 79, v42);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E0C99E08];
      v22 = v6;
      v23 = v11;
      objc_msgSend(v21, "dictionaryWithCapacity:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "copy");

      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CB3308]);
      v26 = (void *)objc_msgSend(v23, "copy");

      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CB3388]);
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = (void *)objc_msgSend(v24, "copy");
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("NTKDebugRadarReporterErrorDomain"), 102, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29;
      v18 = 0;
      *a4 = v30;
LABEL_24:

      goto LABEL_25;
    }
    v18 = 0;
    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_25:

  return v18;
}

- (void)appendInformationToDescription:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (NTKInternalBuild(v4, v5))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v8);
    -[NTKDebugRadarReporter additionalInformationStrings](self, "additionalInformationStrings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (BOOL)present
{
  __CFString *v3;
  __CFString *v4;
  CFOptionFlags v5;
  BOOL v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  NSObject *v46;
  _BOOL4 v47;
  __CFString *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  const __CFString *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CFOptionFlags v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (NTKInternalBuild(self, a2))
  {
    v59 = 0;
    -[NTKDebugRadarReporter alertTitle](self, "alertTitle");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NTKDebugRadarReporter alertMessage](self, "alertMessage");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v3, v4, CFSTR("File Bug"), CFSTR("Cancel"), 0, &v59);

    v5 = v59;
    v6 = v59 == 0;
    _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "User chose not to report bug. Removing temporary files.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NTKDebugRadarReporter temporaryDirectoryURLToCleanup](self, "temporaryDirectoryURLToCleanup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeItemAtURL:error:", v10, 0);
      goto LABEL_28;
    }
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "User chose to report bug. Submitting request to Tap to Radar.", buf, 2u);
    }

    v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v9, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v9, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Watch Faces"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("All"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("568147"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone,watch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    -[NTKDebugRadarReporter additionalInformationStrings](self, "additionalInformationStrings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[NTKDebugRadarReporter additionalInformationStrings](self, "additionalInformationStrings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Summary: \n\nSteps to Reproduce: \n\nNotes:\n\n%@"), v21);
      v22 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = CFSTR("Summary: \n\nSteps to Reproduce: ");
    }
    v53 = v22;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v23);

    v24 = (void *)MEMORY[0x1E0CB39D8];
    -[NTKDebugRadarReporter radarTitle](self, "radarTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queryItemWithName:value:", CFSTR("Title"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), CFSTR("YES"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.NanoTimeKitCompanion.NTKDiagnosticExtensionCompanion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v28);

    v29 = (void *)MEMORY[0x1E0C99DE8];
    -[NTKDebugRadarReporter attachmentURLs](self, "attachmentURLs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[NTKDebugRadarReporter attachmentURLs](self, "attachmentURLs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v56 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "absoluteURL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v34);
    }

    objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Attachments"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v40);

    }
    v41 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v9, "setQueryItems:", v41);

    objc_msgSend(v9, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v44 = objc_msgSend(v43, "openURL:withOptions:error:", v42, MEMORY[0x1E0C9AA70], &v54);
    v45 = v54;

    _NTKLoggingObjectForDomain(51, (uint64_t)"NTKLoggingDomainRadarReporter");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      v48 = (__CFString *)v53;
      if (v47)
      {
        *(_DWORD *)buf = 138412290;
        v61 = v42;
        v49 = "Successfully launched Tap-to-Radar: %@";
        v50 = v46;
        v51 = 12;
LABEL_26:
        _os_log_impl(&dword_1B72A3000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
      }
    }
    else
    {
      v48 = (__CFString *)v53;
      if (v47)
      {
        *(_DWORD *)buf = 138412546;
        v61 = v42;
        v62 = 2112;
        v63 = v45;
        v49 = "Failed to launch Tap-to-Radar: %@: %@";
        v50 = v46;
        v51 = 22;
        goto LABEL_26;
      }
    }

LABEL_28:
    return v6;
  }
  return 0;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void)setAttachmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURLs, a3);
}

- (NSMutableArray)additionalInformationStrings
{
  return self->_additionalInformationStrings;
}

- (void)setAdditionalInformationStrings:(id)a3
{
  objc_storeStrong((id *)&self->_additionalInformationStrings, a3);
}

- (NSURL)temporaryDirectoryURLToCleanup
{
  return self->_temporaryDirectoryURLToCleanup;
}

- (void)setTemporaryDirectoryURLToCleanup:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURLToCleanup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURLToCleanup, 0);
  objc_storeStrong((id *)&self->_additionalInformationStrings, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
}

- (void)initWithRadarTitle:alertTitle:alertMessage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't make directory for %@ - %@");
}

- (void)initWithRadarTitle:(os_log_t)log alertTitle:alertMessage:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKDebugRadarReporter is unavailable.", v1, 2u);
}

- (void)addAttachmentAtURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't archive directory attachment %@ to %@");
}

@end

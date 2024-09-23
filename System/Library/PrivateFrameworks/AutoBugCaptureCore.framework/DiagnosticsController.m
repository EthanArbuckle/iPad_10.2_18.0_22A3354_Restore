@implementation DiagnosticsController

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = &unk_1EA3CFAF8;
  v4[1] = &unk_1EA3CFB10;
  v5[0] = CFSTR("process");
  v5[1] = CFSTR("subsystem");
  v4[2] = &unk_1EA3CFB28;
  v5[2] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)LogSettingToString;
  LogSettingToString = v2;

}

- (DiagnosticsController)initWithConfiguration:(id)a3
{
  id v4;
  DiagnosticsController *v5;
  DiagnosticsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DiagnosticsController;
  v5 = -[DiagnosticsController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DiagnosticsController configureWithDiagnosticActions:](v5, "configureWithDiagnosticActions:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (gLoggingSupportDyLibHandle)
  {
    dlclose((void *)gLoggingSupportDyLibHandle);
    gLoggingSupportDyLibHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DiagnosticsController;
  -[DiagnosticsController dealloc](&v3, sel_dealloc);
}

- (BOOL)_loadLoggingSupport
{
  if (_loadLoggingSupport_symbolLoadOnce != -1)
    dispatch_once(&_loadLoggingSupport_symbolLoadOnce, &__block_literal_global_8);
  return _loadLoggingSupport_symbolsLoaded;
}

void __44__DiagnosticsController__loadLoggingSupport__block_invoke()
{
  Class Class;
  BOOL v1;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  __int16 v11;
  uint8_t buf[2];
  __int16 v13;

  gLoggingSupportDyLibHandle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/LoggingSupport.framework/LoggingSupport", 6);
  if (!gLoggingSupportDyLibHandle)
  {
    diagcollectLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v11 = 0;
    v7 = "Failed to load LoggingSupport.framework";
    v8 = (uint8_t *)&v11;
LABEL_21:
    v9 = v6;
    v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_22;
  }
  gOSLogPreferencesManager = (uint64_t)objc_getClass("OSLogPreferencesManager");
  gOSLogPreferencesSubsystem = (uint64_t)objc_getClass("OSLogPreferencesSubsystem");
  gOSLogPreferencesProcess = (uint64_t)objc_getClass("OSLogPreferencesProcess");
  Class = objc_getClass("OSLogPreferencesCategory");
  gOSLogPreferencesCategory = (uint64_t)Class;
  if (gOSLogPreferencesManager)
    v1 = gOSLogPreferencesSubsystem == 0;
  else
    v1 = 1;
  v4 = !v1 && gOSLogPreferencesProcess != 0 && Class != 0;
  _loadLoggingSupport_symbolsLoaded = v4;
  diagcollectLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != 1)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v7 = "Failed to load OSLogPreferences* classes from LoggingSupport.framework";
    v8 = buf;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 0;
    v7 = "Successfully loaded OSLogPreferences* classes from LoggingSupport.framework.";
    v8 = (uint8_t *)&v13;
    v9 = v6;
    v10 = OS_LOG_TYPE_INFO;
LABEL_22:
    _os_log_impl(&dword_1DBAE1000, v9, v10, v7, v8, 2u);
  }
LABEL_23:

}

- (void)configureWithDiagnosticActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *actionsDict;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *settingsDict;
  NSObject *v16;
  uint8_t v17[16];

  v4 = a3;
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "autoBugCaptureRegularPayloads");

  if (v7)
  {
    if (-[DiagnosticsController validateDiagnosticsConfiguration:](self, "validateDiagnosticsConfiguration:", v4))
    {
      v8 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DIAGNOSTIC_ACTIONS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v9);
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      actionsDict = self->_actionsDict;
      self->_actionsDict = v10;

      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DIAGNOSTIC_SETTINGS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithDictionary:", v13);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      settingsDict = self->_settingsDict;
      self->_settingsDict = v14;

    }
  }
  else
  {
    diagcollectLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "Not configuring for platforms without payloads", v17, 2u);
    }

  }
}

- (BOOL)validateDiagnosticsConfiguration:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  objc_class *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DIAGNOSTIC_ACTIONS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[DiagnosticsController validateActionsDictionary:](self, "validateActionsDictionary:", v5);
    diagcollectLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      LOWORD(v24) = 0;
      v9 = "Finished validating actions dictionary.";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      LOWORD(v24) = 0;
      v9 = "Validation Failure: Errors detected while validating actions dictionary!";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1DBAE1000, v10, v11, v9, (uint8_t *)&v24, 2u);
  }
  else
  {
    diagcollectLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v5;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Unexpected object %@ (%@) found for actions dictionary!", (uint8_t *)&v24, 0x16u);

    }
    LOBYTE(v6) = 0;
  }
LABEL_11:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DIAGNOSTIC_SETTINGS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = -[DiagnosticsController validateSettingsDictionary:](self, "validateSettingsDictionary:", v14);
    diagcollectLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        v18 = "Finished validating settings dictionary.";
        v19 = v17;
        v20 = OS_LOG_TYPE_DEBUG;
LABEL_20:
        _os_log_impl(&dword_1DBAE1000, v19, v20, v18, (uint8_t *)&v24, 2u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      v18 = "Validation Failure: Errors detected while validating settings dictionary!";
      v19 = v17;
      v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_20;
    }
  }
  else
  {
    diagcollectLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v14;
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "Unexpected object %@ (%@) found for settings dictionary!", (uint8_t *)&v24, 0x16u);

    }
    LOBYTE(v15) = 0;
  }

  return v6 && v15;
}

- (BOOL)validateActionsDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int *v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  DiagnosticsController *v17;
  int *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = 1;
    v9 = &dword_1DBAE1000;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if (-[NSObject length](v12, "length"))
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_actionsDict, "objectForKeyedSubscript:", v12);
            v13 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[DiagnosticsController validateActionsDictionaryContent:identifier:](self, "validateActionsDictionaryContent:identifier:", v13, v12);
            }
            else if (v13)
            {
              v16 = v4;
              v17 = self;
              v18 = v9;
              diagcollectLogHandle();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v20 = (objc_class *)objc_opt_class();
                NSStringFromClass(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v28 = v21;
                _os_log_impl(v18, v19, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions value: %@ (should be NSDictionary)", buf, 0xCu);

              }
              v8 = 0;
              v9 = v18;
              self = v17;
              v4 = v16;
            }
          }
          else
          {
            diagcollectLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(v9, v13, OS_LOG_TYPE_DEBUG, "Actions identifiers must not be empty", buf, 2u);
            }
            v8 = 0;
          }

        }
        else
        {
          if (!v11)
            continue;
          diagcollectLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v28 = v15;
            _os_log_impl(v9, v12, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions identifier: %@ (should be NSString)", buf, 0xCu);

          }
          v8 = 0;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (!v6)
        goto LABEL_27;
    }
  }
  v8 = 1;
LABEL_27:

  return v8 & 1;
}

- (BOOL)validateActionsDictionaryContent:(id)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  objc_class *v27;
  NSObject *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  objc_class *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  uint32_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  objc_class *v56;
  NSObject *v57;
  objc_class *v58;
  uint64_t v59;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  NSObject *v83;
  __int16 v84;
  NSObject *v85;
  __int16 v86;
  NSObject *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v67 = a4;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (!v7)
  {
    v9 = 1;
    goto LABEL_121;
  }
  v8 = v7;
  v9 = 1;
  v10 = *(_QWORD *)v78;
  v62 = v5;
  v63 = *(_QWORD *)v78;
  v61 = v6;
  do
  {
    v11 = 0;
    v64 = v8;
    do
    {
      if (*(_QWORD *)v78 != v10)
        objc_enumerationMutation(v6);
      v66 = v11;
      v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v14;
        if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("oslog")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = v13;
            v15 = v14;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            -[NSObject allKeys](v15, "allKeys");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
            if (!v17)
              goto LABEL_54;
            v18 = v17;
            v19 = *(_QWORD *)v74;
            while (1)
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v74 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v20);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v22 = v21;
                  v23 = v15;
                  -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("level")))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v25 = v24;
                      if (-[NSObject length](v25, "length"))
                      {
                        if ((-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("default")) & 1) == 0
                          && (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("info")) & 1) == 0
                          && (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("debug")) & 1) == 0
                          && (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("none")) & 1) == 0)
                        {
                          diagcollectLogHandle();
                          v26 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v83 = v25;
                            _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "Unknown OSLog level: %@", buf, 0xCu);
                          }
                          goto LABEL_45;
                        }
                      }
                      else
                      {
                        diagcollectLogHandle();
                        v26 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "OSLog level setting must not be empty", buf, 2u);
                        }
                        v9 = 0;
LABEL_45:

                      }
LABEL_46:

LABEL_47:
                      v15 = v23;
                      goto LABEL_48;
                    }
                    if (!v24)
                      goto LABEL_47;
                    diagcollectLogHandle();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                    {
LABEL_40:
                      v30 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v30);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413058;
                      v83 = v67;
                      v84 = 2112;
                      v85 = v68;
                      v86 = 2112;
                      v87 = v22;
                      v88 = 2112;
                      v89 = v31;
                      _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEBUG, "Found unexpected class for value of oslog settings key %@.%@.%@: %@ (should be NSString)", buf, 0x2Au);

                    }
                  }
                  else if ((-[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("process")) & 1) != 0
                         || (-[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("category")) & 1) != 0
                         || -[NSObject isEqualToString:](v22, "isEqualToString:", CFSTR("subsystem")))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v25 = v24;
                      if (!-[NSObject length](v25, "length"))
                      {
                        diagcollectLogHandle();
                        v29 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          v83 = v22;
                          _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_DEBUG, "OSLog %@ identifier must not be empty", buf, 0xCu);
                        }

                        v9 = 0;
                      }
                      goto LABEL_46;
                    }
                    diagcollectLogHandle();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                      goto LABEL_40;
                  }
                  else
                  {
                    diagcollectLogHandle();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412802;
                      v83 = v67;
                      v84 = 2112;
                      v85 = v68;
                      v86 = 2112;
                      v87 = v22;
                      _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEBUG, "Found unsupported oslog settings key: %@.%@.%@", buf, 0x20u);
                    }
                  }
                  v9 = 0;
                  goto LABEL_46;
                }
                if (!v21)
                  goto LABEL_49;
                diagcollectLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  v27 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v27);
                  v28 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v83 = v67;
                  v84 = 2112;
                  v85 = v68;
                  v86 = 2112;
                  v87 = v28;
                  _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEBUG, "Found unexpected class for oslog settings key in %@.%@: %@ (should be NSString)", buf, 0x20u);

                }
                v9 = 0;
LABEL_48:

LABEL_49:
                ++v20;
              }
              while (v18 != v20);
              v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
              v18 = v32;
              if (!v32)
              {
LABEL_54:

                v6 = v61;
                v5 = v62;
                v10 = v63;
                v8 = v64;
                goto LABEL_55;
              }
            }
          }
          if (!v14)
            goto LABEL_110;
          diagcollectLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = v13;
            v41 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v83 = v67;
            v84 = 2112;
            v85 = v40;
            v86 = 2112;
            v87 = v41;
            v42 = v15;
            v43 = "Found unexpected class for value of actions key %@.%@: %@ (should be NSDictionary)";
            goto LABEL_107;
          }
          goto LABEL_108;
        }
        if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("process")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v14, "length"))
              goto LABEL_110;
            diagcollectLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              goto LABEL_108;
            *(_WORD *)buf = 0;
            v36 = v15;
            v37 = "OSLog process identifier must not be empty";
            v38 = 2;
LABEL_103:
            _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEBUG, v37, buf, v38);
            goto LABEL_108;
          }
          if (!v14)
            goto LABEL_110;
          diagcollectLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_108;
LABEL_106:
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v40 = v13;
          v41 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v83 = v67;
          v84 = 2112;
          v85 = v40;
          v86 = 2112;
          v87 = v41;
          v42 = v15;
          v43 = "Found unexpected class for value of actions key %@.%@: %@ (should be NSString)";
LABEL_107:
          _os_log_impl(&dword_1DBAE1000, v42, OS_LOG_TYPE_DEBUG, v43, buf, 0x20u);

          v13 = v40;
LABEL_108:
          v9 = 0;
          goto LABEL_109;
        }
        if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("level")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v14)
              goto LABEL_110;
            diagcollectLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              goto LABEL_108;
            goto LABEL_106;
          }
          v15 = v14;
          if (-[NSObject length](v15, "length"))
          {
            if ((-[NSObject isEqualToString:](v15, "isEqualToString:", CFSTR("default")) & 1) != 0
              || (-[NSObject isEqualToString:](v15, "isEqualToString:", CFSTR("info")) & 1) != 0
              || (-[NSObject isEqualToString:](v15, "isEqualToString:", CFSTR("debug")) & 1) != 0
              || (-[NSObject isEqualToString:](v15, "isEqualToString:", CFSTR("none")) & 1) != 0)
            {
              goto LABEL_109;
            }
            v44 = v15;
            v45 = v13;
            diagcollectLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v44;
              v47 = v46;
              v48 = "Unsupported OSLog level: %@";
              v49 = 12;
              goto LABEL_116;
            }
          }
          else
          {
            v44 = v15;
            v45 = v13;
            diagcollectLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v47 = v46;
              v48 = "OSLog level setting must not be empty";
              v49 = 2;
LABEL_116:
              _os_log_impl(&dword_1DBAE1000, v47, OS_LOG_TYPE_DEBUG, v48, buf, v49);
            }
          }

          v9 = 0;
          v13 = v45;
          v15 = v44;
          goto LABEL_109;
        }
        if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("diagExt")))
        {
          diagcollectLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_108;
          *(_DWORD *)buf = 138412546;
          v83 = v67;
          v84 = 2112;
          v85 = v13;
          v36 = v15;
          v37 = "Found unsupported actions key: %@.%@";
          v38 = 22;
          goto LABEL_103;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v14)
            goto LABEL_110;
          diagcollectLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            goto LABEL_108;
          goto LABEL_106;
        }
        v68 = v13;
        v15 = v14;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v50 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (!v50)
          goto LABEL_55;
        v51 = v50;
        v52 = *(_QWORD *)v70;
        while (2)
        {
          v53 = 0;
LABEL_85:
          if (*(_QWORD *)v70 != v52)
            objc_enumerationMutation(v15);
          v54 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v53);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!objc_msgSend(v54, "length"))
            {
              diagcollectLogHandle();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DBAE1000, v55, OS_LOG_TYPE_DEBUG, "Diagnostic Extension identifiers must not be empty", buf, 2u);
              }
              goto LABEL_94;
            }
          }
          else if (v54)
          {
            diagcollectLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v56 = (objc_class *)objc_opt_class();
              NSStringFromClass(v56);
              v57 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v83 = v57;
              _os_log_impl(&dword_1DBAE1000, v55, OS_LOG_TYPE_DEBUG, "Found unexpected class for Diagnostic Extension identifiers: %@ (should be NSString)", buf, 0xCu);

            }
LABEL_94:

            v9 = 0;
          }
          if (v51 == ++v53)
          {
            v51 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            if (!v51)
            {
              v10 = v63;
              v8 = v64;
LABEL_55:
              v13 = v68;
LABEL_109:

              v14 = v65;
LABEL_110:

LABEL_111:
              goto LABEL_112;
            }
            continue;
          }
          goto LABEL_85;
        }
      }
      if (v12)
      {
        diagcollectLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v83 = v67;
          v84 = 2112;
          v85 = v35;
          _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "Found unexpected class for actions key %@: %@ (should be NSString)", buf, 0x16u);

        }
        v9 = 0;
        v13 = v33;
        goto LABEL_111;
      }
LABEL_112:
      v11 = v66 + 1;
    }
    while (v66 + 1 != v8);
    v59 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    v8 = v59;
  }
  while (v59);
LABEL_121:

  return v9 & 1;
}

- (BOOL)validateSettingsDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = 1;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDict, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v11, "length"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;
              v8 = -[DiagnosticsController validateSettingsNodeDictionary:identifier:isDefault:](self, "validateSettingsNodeDictionary:identifier:isDefault:", v13, v11, -[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("DEFAULTS")));
              goto LABEL_20;
            }
            if (v12)
            {
              diagcollectLogHandle();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v16 = (objc_class *)objc_opt_class();
                NSStringFromClass(v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v24 = v11;
                v25 = 2112;
                v26 = v17;
                _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Found unexpected class for settings domain node %@: %@ (should be NSDictionary)", buf, 0x16u);

              }
LABEL_19:
              v8 = 0;
LABEL_20:

            }
            goto LABEL_22;
          }
          diagcollectLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Settings domain identifier must not be empty", buf, 2u);
          }
          goto LABEL_19;
        }
        if (!v10)
          continue;
        diagcollectLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Found unexpected class for settings domain identifier: %@ (should be NSString)", buf, 0xCu);

        }
        v8 = 0;
LABEL_22:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (!v6)
        goto LABEL_27;
    }
  }
  v8 = 1;
LABEL_27:

  return v8;
}

- (BOOL)validateSettingsNodeDictionary:(id)a3 identifier:(id)a4 isDefault:(BOOL)a5
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  objc_class *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v27;
  objc_class *v28;
  id v31;
  _BOOL4 v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  _BYTE v44[128];
  uint64_t v45;

  v32 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 1;
    v11 = *(_QWORD *)v35;
    v31 = v6;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSObject length](v14, "length"))
          {
            diagcollectLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v7;
              _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEBUG, "Found empty key in node %@", buf, 0xCu);
            }
            goto LABEL_31;
          }
          if (v32)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v15)
              {
                diagcollectLogHandle();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  v17 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v17);
                  v18 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v39 = v7;
                  v40 = 2112;
                  v41 = v14;
                  v42 = 2112;
                  v43 = v18;
                  v19 = v16;
                  v20 = "Found unexpected class for value of default node key %@.%@: %@ (should be NSArray)";
                  goto LABEL_30;
                }
                goto LABEL_31;
              }
LABEL_33:

              goto LABEL_34;
            }
LABEL_25:
            v27 = (void *)MEMORY[0x1E0CB3940];
            v25 = v15;
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%@.%@"), v7, v14);
            v16 = objc_claimAutoreleasedReturnValue();
            v26 = -[DiagnosticsController validateSettingsNodeContents:identifier:](self, "validateSettingsNodeContents:identifier:", v25, v16);
LABEL_26:
            v10 = v26;

            v6 = v31;
          }
          else
          {
            if (-[NSObject isEqualToString:](v14, "isEqualToString:", CFSTR("alwaysRun")))
            {
              diagcollectLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v39 = CFSTR("alwaysRun");
                v40 = 2112;
                v41 = v7;
                v42 = 2112;
                v43 = v14;
                _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "Warning: Node key %@ is reserved for default dictionaries. (Found at %@.%@)", buf, 0x20u);
              }

              v10 = 0;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)MEMORY[0x1E0CB3940];
              v25 = v15;
              objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@"), v7, v14);
              v16 = objc_claimAutoreleasedReturnValue();
              v26 = -[DiagnosticsController validateSettingsNodeDictionary:identifier:isDefault:](self, "validateSettingsNodeDictionary:identifier:isDefault:", v25, v16, -[NSObject isEqualToString:](v14, "isEqualToString:", CFSTR("DEFAULTS")));
              goto LABEL_26;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_25;
            if (!v15)
              goto LABEL_33;
            diagcollectLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v28 = (objc_class *)objc_opt_class();
              NSStringFromClass(v28);
              v18 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v39 = v7;
              v40 = 2112;
              v41 = v14;
              v42 = 2112;
              v43 = v18;
              v19 = v16;
              v20 = "Found unexpected class for value of node key %@.%@: %@ (should be NSArray or NSDictionary)";
LABEL_30:
              _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0x20u);

              v6 = v31;
            }
LABEL_31:
            v10 = 0;
          }

          goto LABEL_33;
        }
        diagcollectLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v7;
          v40 = 2112;
          v41 = v22;
          _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Found unexpected class for key in node %@: %@ (should be NSString)", buf, 0x16u);

        }
        v10 = 0;
LABEL_34:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (!v9)
        goto LABEL_38;
    }
  }
  v10 = 1;
LABEL_38:

  return v10 & 1;
}

- (BOOL)validateSettingsNodeContents:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 1;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "length"))
            continue;
          diagcollectLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v6;
            _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Action identifiers must not be empty. (%@)", buf, 0xCu);
          }
        }
        else
        {
          diagcollectLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v6;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Found unexpected class for action identifiers in node key %@: %@ (should be NSString)", buf, 0x16u);

          }
        }

        v10 = 0;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (!v8)
        goto LABEL_17;
    }
  }
  v10 = 1;
LABEL_17:

  return v10 & 1;
}

+ (id)loggingStateCache
{
  if (loggingStateCache_m_pred != -1)
    dispatch_once(&loggingStateCache_m_pred, &__block_literal_global_88);
  return (id)loggingStateCache_stateDict;
}

void __42__DiagnosticsController_loggingStateCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)loggingStateCache_stateDict;
  loggingStateCache_stateDict = (uint64_t)v0;

}

- (id)diagExtensionCollector
{
  DiagnosticExtensionController *deCollector;
  void *v4;
  void *v5;
  DiagnosticExtensionController *v6;
  void *v7;
  DiagnosticExtensionController *v8;
  DiagnosticExtensionController *v9;

  deCollector = self->deCollector;
  if (!deCollector)
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [DiagnosticExtensionController alloc];
    objc_msgSend(v5, "logArchivePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DiagnosticExtensionController initWithDestinationDirectory:](v6, "initWithDestinationDirectory:", v7);
    v9 = self->deCollector;
    self->deCollector = v8;

    deCollector = self->deCollector;
  }
  return deCollector;
}

- (id)defaultsDictionaryWithAlwaysRunActions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("alwaysRun"));

  return v4;
}

- (id)actionsDictionaryForProcess:(id)a3 logLevel:(id)a4 diagnosticExtensions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "length");
  if (v8 && v11)
  {
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("process"));
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("level"));
  }
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("diagExt"));

  return v10;
}

- (id)consolidatedLogLevelSetsFromActions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  __CFString *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  objc_class *v36;
  __CFString *v37;
  char isKindOfClass;
  __CFString *v39;
  objc_class *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  __CFString *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  const __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DiagnosticsController actionsDict](self, "actionsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  diagcollectLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v63 = (const __CFString *)objc_msgSend(v4, "count");
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Consolidating log levels from %ld actions", buf, 0xCu);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    v52 = v5;
    v54 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      v53 = v8;
      do
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("process"));
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("level"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v57 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (id)v14;
              v16 = (id)v13;
              objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("process"));
              v17 = objc_claimAutoreleasedReturnValue();
              if (!v17)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v17, CFSTR("process"));
              }
              -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "maximumLogLevelString:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, v16);
              v5 = v52;
              v8 = v53;
              v14 = v57;
              goto LABEL_20;
            }
          }
          if (v13 | v14)
          {
            diagcollectLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v63 = CFSTR("process");
              v64 = 2112;
              v65 = CFSTR("level");
              v66 = 2112;
              v67 = v23;
              v68 = 2112;
              v69 = v25;
              _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEBUG, "Found unexpected class for keys %@,%@ in the action dictionary (should be NSString): %@,%@", buf, 0x2Au);

              v8 = v53;
            }
LABEL_20:

          }
          -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("oslog"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v26)
            {
              diagcollectLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v36 = (objc_class *)objc_opt_class();
                NSStringFromClass(v36);
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v63 = CFSTR("oslog");
                v64 = 2112;
                v65 = v37;
                _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ in the action dictionary (should be NSDictionary): %@", buf, 0x16u);

              }
              goto LABEL_54;
            }
LABEL_55:

            v9 = v54;
            goto LABEL_56;
          }
          v27 = v26;
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("level"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("process"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("category"));
          v30 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("subsystem"));
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          v56 = (void *)v30;
          if (!v28)
          {
            diagcollectLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              goto LABEL_53;
            *(_WORD *)buf = 0;
            v34 = v33;
            v35 = "OSLog setting requires a level to be specified.";
LABEL_36:
            _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 2u);
            goto LABEL_53;
          }
          if (v29 && v31)
          {
            diagcollectLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v34 = v33;
              v35 = "OSLog setting should identify a process or subsystem, not both.";
              goto LABEL_36;
            }
LABEL_53:

            v5 = v52;
            v8 = v53;
LABEL_54:

            v14 = v57;
            goto LABEL_55;
          }
          if (v30 && !v31)
          {
            diagcollectLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              goto LABEL_53;
            *(_WORD *)buf = 0;
            v34 = v33;
            v35 = "OSLog setting requires a subsystem identifier when specifying a category.";
            goto LABEL_36;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = v28;
            if (v29)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if (v56)
              {
                if ((isKindOfClass & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v32)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_53;
                    }
                  }
                }
              }
            }
            v46 = v29;
            v39 = v29;
            v47 = v56;
            v48 = v32;
            v50 = v39;
            if (-[__CFString length](v39, "length"))
            {
              objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("process"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v49)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:");
              }
              objc_msgSend(v49, "objectForKeyedSubscript:", v39);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:");
              v29 = v46;
              goto LABEL_48;
            }
            v29 = v46;
            if (objc_msgSend(v48, "length"))
            {
              if (objc_msgSend(v47, "length"))
              {
                objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("category"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v49)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setObject:forKeyedSubscript:");
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v47, v48);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", v45);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setObject:forKeyedSubscript:", v43, v45);

              }
              else
              {
                objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("subsystem"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v49)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setObject:forKeyedSubscript:");
                }
                objc_msgSend(v49, "objectForKeyedSubscript:", v48);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject maximumLogLevelString:](v33, "maximumLogLevelString:");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setObject:forKeyedSubscript:");
              }
LABEL_48:

            }
          }
          else
          {
            diagcollectLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              goto LABEL_53;
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v63 = CFSTR("level");
            v64 = 2112;
            v65 = v50;
            _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ in the oslog settings dictionary (should be NSString): %@", buf, 0x16u);
          }

          goto LABEL_53;
        }
        if (!v11)
          goto LABEL_57;
        diagcollectLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = v21;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "Found unexpected class in actions (should be NSDictionary): %@", buf, 0xCu);

        }
LABEL_56:

LABEL_57:
        ++v10;
      }
      while (v8 != v10);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      v8 = v41;
    }
    while (v41);
  }

  return v51;
}

- (id)diagActionsForSignature:(id)a3
{
  return -[DiagnosticsController diagActionsForSignature:commonActions:](self, "diagActionsForSignature:commonActions:", a3, 0);
}

- (id)diagActionsForSignature:(id)a3 commonActions:(id)a4
{
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  __CFString *v16;
  __int128 v17;
  __CFString *v18;
  char *v19;
  __CFString *v20;
  NSObject *v21;
  const __CFString *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint32_t v41;
  objc_class *v42;
  __CFString *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  const char *v51;
  uint32_t v52;
  objc_class *v53;
  __CFString *v54;
  char isKindOfClass;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  const char *v60;
  uint32_t v61;
  objc_class *v62;
  NSObject *v63;
  uint64_t v64;
  __int128 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  __CFString *v72;
  id v73;
  char v74;
  void *v75;
  uint8_t buf[4];
  const __CFString *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  NSObject *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v71 = a4;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("type"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("subtype"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("additional");
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("additional"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("detected"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = &stru_1EA3B8F58;
  v69 = v7;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UIPerformance")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("Performance"))
    && objc_msgSend(v70, "isEqualToString:", CFSTR("MemoryResourceException")))
  {
    diagcollectLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Will skip evaluating common diagnostic extension actions based on signature match", buf, 2u);
    }

    LOBYTE(v12) = 0;
    v7 = v69;
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (v71)
  {
    LODWORD(v12) = objc_msgSend(v71, "BOOLValue");
    diagcollectLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = "not ";
      if ((_DWORD)v12)
        v14 = "";
      *(_DWORD *)buf = 136315138;
      v77 = (const __CFString *)v14;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Will %sevaluate common diagnostic extension actions based on client request", buf, 0xCu);
    }

    v7 = v69;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && objc_msgSend(v70, "length"))
  {
    objc_msgSend(v75, "setObject:forKeyedSubscript:", CFSTR("type"), CFSTR("domain"));
    if (objc_msgSend(v70, "length") && objc_msgSend(v68, "length"))
    {
      objc_msgSend(v75, "setObject:forKeyedSubscript:", CFSTR("subtype"), CFSTR("type"));
      if (!objc_msgSend(v68, "length"))
        goto LABEL_32;
      if (!objc_msgSend(v67, "length"))
        goto LABEL_32;
      objc_msgSend(v75, "setObject:forKeyedSubscript:", CFSTR("additional"), CFSTR("subtype"));
      if (!objc_msgSend(v67, "length") || !-[__CFString length](v10, "length"))
        goto LABEL_32;
LABEL_31:
      objc_msgSend(v75, "setObject:forKeyedSubscript:", CFSTR("detected"), v8);
      goto LABEL_32;
    }
    if (objc_msgSend(v70, "length"))
    {
      v8 = CFSTR("type");
      if (-[__CFString length](v10, "length"))
        goto LABEL_31;
    }
  }
  else if (objc_msgSend(v7, "length"))
  {
    v8 = CFSTR("domain");
    if (-[__CFString length](v10, "length"))
      goto LABEL_31;
  }
LABEL_32:
  v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[DiagnosticsController settingsDict](self, "settingsDict");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("domain");
  v18 = v16;
  v19 = "aysonpcap";
  if (v15)
  {
    v20 = 0;
    *(_QWORD *)&v17 = 134218242;
    v66 = v17;
    v72 = v10;
    v74 = v12;
    while (1)
    {
      diagcollectLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = CFSTR("Top Level");
        if (v20)
          v22 = v20;
        *(_DWORD *)buf = 138412290;
        v77 = v22;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEBUG, "Processing actions for [%@]", buf, 0xCu);
      }

      v23 = v20 ? 1 : v12;
      if ((v23 & 1) != 0)
        break;
      diagcollectLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v77 = v6;
        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_INFO, "Skipped evaluating common diagnostic extension actions for signature: %@", buf, 0xCu);
      }
LABEL_72:

      -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v18);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString length](v43, "length"))
      {
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v45 = v44;

          diagcollectLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v46, OS_LOG_TYPE_DEBUG, "We have another level to look into.", buf, 2u);
          }
          goto LABEL_88;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v46 = v44;
          if (-[NSObject count](v46, "count"))
          {
            objc_msgSend(v73, "addObjectsFromArray:", v46);
            diagcollectLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              v48 = -[NSObject count](v46, "count");
              *(_DWORD *)buf = 134218498;
              v77 = (const __CFString *)v48;
              v78 = 2112;
              v79 = v10;
              v80 = 2112;
              v81 = v46;
              v49 = v47;
              v50 = OS_LOG_TYPE_DEBUG;
              v51 = "Added %ld actions for %@: %@";
              v52 = 32;
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          goto LABEL_87;
        }
        if (v44)
        {

          diagcollectLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            goto LABEL_87;
          v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          v47 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v77 = (const __CFString *)v47;
          v49 = v46;
          v50 = OS_LOG_TYPE_ERROR;
          v51 = "Found unexpected class: %@";
          goto LABEL_84;
        }
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v10);
        v45 = objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          v46 = v15;
          goto LABEL_88;
        }
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v10);
        v46 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          diagcollectLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            goto LABEL_86;
          *(_DWORD *)buf = 138412290;
          v77 = (const __CFString *)v46;
          v49 = v47;
          v50 = OS_LOG_TYPE_ERROR;
          v51 = "Unexpectedly found a dictionary instead of an array: %@";
LABEL_84:
          v52 = 12;
LABEL_85:
          _os_log_impl(&dword_1DBAE1000, v49, v50, v51, buf, v52);
LABEL_86:

LABEL_87:
          v45 = 0;
LABEL_88:

          goto LABEL_89;
        }
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v47 = v46;
          if (!-[NSObject count](v47, "count"))
            goto LABEL_86;
          objc_msgSend(v73, "addObjectsFromArray:", v47);
          diagcollectLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v57 = -[NSObject count](v47, "count");
            *(_DWORD *)buf = 134218498;
            v77 = (const __CFString *)v57;
            v78 = 2112;
            v79 = v10;
            v80 = 2112;
            v81 = v47;
            v58 = v56;
            v59 = OS_LOG_TYPE_DEBUG;
            v60 = "Added %ld actions for %@: %@";
            v61 = 32;
            goto LABEL_103;
          }
        }
        else
        {
          if (!v46)
            goto LABEL_87;
          diagcollectLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            goto LABEL_86;
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v56 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v77 = (const __CFString *)v56;
          v58 = v47;
          v59 = OS_LOG_TYPE_ERROR;
          v60 = "Found unexpected class: %@";
          v61 = 12;
LABEL_103:
          _os_log_impl(&dword_1DBAE1000, v58, v59, v60, buf, v61);
        }

        goto LABEL_86;
      }
      v45 = 0;
      v44 = v15;
LABEL_89:

      objc_msgSend(v75, "objectForKeyedSubscript:", v18);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v15 = v45;
      v18 = v54;
      v20 = v43;
      if (!v45)
      {

        v7 = v69;
        v19 = "alwaysonpcap" + 3;
        goto LABEL_106;
      }
    }
    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("DEFAULTS"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v24)
        goto LABEL_72;
      diagcollectLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = CFSTR("DEFAULTS");
        v78 = 2112;
        v79 = v33;
        _os_log_impl(&dword_1DBAE1000, (os_log_t)v12, OS_LOG_TYPE_DEBUG, "Found unexpected class for key %@ (should be NSDictionary): %@", buf, 0x16u);

      }
      goto LABEL_71;
    }
    v12 = v24;
    diagcollectLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEBUG, "Evaluating default actions.", buf, 2u);
    }

    objc_msgSend((id)v12, "objectForKeyedSubscript:", CFSTR("alwaysRun"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v26;
      if (-[NSObject count](v27, "count"))
      {
        objc_msgSend(v73, "addObjectsFromArray:", v27);
        diagcollectLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
LABEL_58:

          goto LABEL_59;
        }
        v29 = -[NSObject count](v27, "count");
        *(_DWORD *)buf = v66;
        v77 = (const __CFString *)v29;
        v78 = 2112;
        v79 = v27;
        v30 = v28;
        v31 = "Added %ld always run actions: %@";
LABEL_57:
        _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 0x16u);
        goto LABEL_58;
      }
    }
    else
    {
      if (!v26)
        goto LABEL_60;
      diagcollectLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v28 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = CFSTR("alwaysRun");
        v78 = 2112;
        v79 = v28;
        v30 = v27;
        v31 = "Found unexpected class for key %@ (should be NSArray): %@";
        goto LABEL_57;
      }
    }
LABEL_59:

LABEL_60:
    objc_msgSend((id)v12, "objectForKeyedSubscript:", v10, v66);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v35;
      if (-[NSObject count](v36, "count"))
      {
        objc_msgSend(v73, "addObjectsFromArray:", v36);
        diagcollectLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
LABEL_68:

          v10 = v72;
          goto LABEL_69;
        }
        v38 = -[NSObject count](v36, "count");
        *(_DWORD *)buf = 134218498;
        v77 = (const __CFString *)v38;
        v78 = 2112;
        v79 = v72;
        v80 = 2112;
        v81 = v36;
        v39 = v37;
        v40 = "Added %ld default actions for %@: %@";
        v41 = 32;
LABEL_67:
        _os_log_impl(&dword_1DBAE1000, v39, OS_LOG_TYPE_DEBUG, v40, buf, v41);
        goto LABEL_68;
      }
    }
    else
    {
      if (!v35)
      {
LABEL_70:

LABEL_71:
        LOBYTE(v12) = v74;
        goto LABEL_72;
      }
      diagcollectLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v37 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = v72;
        v78 = 2112;
        v79 = v37;
        v39 = v36;
        v40 = "Found unexpected class for key %@ (should be NSArray): %@";
        v41 = 22;
        goto LABEL_67;
      }
    }
LABEL_69:

    goto LABEL_70;
  }
  v54 = v16;
LABEL_106:
  diagcollectLogHandle();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    v64 = objc_msgSend(v73, "count");
    *(_DWORD *)buf = *((_QWORD *)v19 + 145);
    v77 = (const __CFString *)v64;
    v78 = 2112;
    v79 = v73;
    _os_log_impl(&dword_1DBAE1000, v63, OS_LOG_TYPE_DEBUG, "Result: Found %ld actions: %@", buf, 0x16u);
  }

  return v73;
}

- (void)consolidateLoggingLevelsIntoSet:(id)a3 withCurrentState:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          diagcollectLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v11;
            _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "sesstionState: %@", buf, 0xCu);
          }

          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke;
          v13[3] = &unk_1EA3B5900;
          v14 = v5;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

}

void __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      diagcollectLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "key: %@ object: %@", buf, 0x16u);
      }

      v8 = v6;
      if ((-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("process")) & 1) != 0
        || (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("subsystem")) & 1) != 0
        || -[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("category")))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);
        }
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke_105;
        v14[3] = &unk_1EA3B5900;
        v15 = v9;
        v10 = v9;
        -[NSObject enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v14);

      }
      else
      {
        diagcollectLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Found unsupported log set key %@", buf, 0xCu);
        }
      }
      goto LABEL_13;
    }
  }
  diagcollectLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, "Found unexpected class %@/%@ for consolidated action set (should be NSString/NSDictionary).", buf, 0x16u);

LABEL_13:
  }

}

void __74__DiagnosticsController_consolidateLoggingLevelsIntoSet_withCurrentState___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maximumLogLevelString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v5);
  }
  else
  {
    diagcollectLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Found unexpected class %@/%@ for log level setting (should be NSString/NSString).", (uint8_t *)&v16, 0x16u);

    }
  }

}

- (void)raiseLoggingForActions:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    diagcollectLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v15) = 0;
    v14 = "A valid identifier is required when raising log levels!";
LABEL_16:
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v15, 2u);
    goto LABEL_17;
  }
  if (!objc_msgSend(v6, "count"))
  {
    diagcollectLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v15) = 0;
    v14 = "No actions to raise log levels for.";
    goto LABEL_16;
  }
  +[DiagnosticsController loggingStateCache](DiagnosticsController, "loggingStateCache");
  v8 = objc_claimAutoreleasedReturnValue();
  -[DiagnosticsController consolidatedLogLevelSetsFromActions:](self, "consolidatedLogLevelSetsFromActions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  diagcollectLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134217984;
    v16 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Consolidated actions to %ld set(s) of log level adjustments", (uint8_t *)&v15, 0xCu);
  }

  if (objc_msgSend(v9, "count"))
  {
    diagcollectLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = (uint64_t)v7;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Storing logging state for session: %@", (uint8_t *)&v15, 0xCu);
    }

    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticsController consolidateLoggingLevelsIntoSet:withCurrentState:](self, "consolidateLoggingLevelsIntoSet:withCurrentState:", v12, v8);
    diagcollectLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Applying the consolidated log levels", (uint8_t *)&v15, 2u);
    }

    -[DiagnosticsController applyLogLevelSets:](self, "applyLogLevelSets:", v12);
  }

LABEL_17:
}

- (void)lowerLoggingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[DiagnosticsController loggingStateCache](DiagnosticsController, "loggingStateCache");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", 0, v4);
      diagcollectLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Removed logging state for session: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DiagnosticsController consolidateLoggingLevelsIntoSet:withCurrentState:](self, "consolidateLoggingLevelsIntoSet:withCurrentState:", v8, v5);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__DiagnosticsController_lowerLoggingForIdentifier___block_invoke;
      v11[3] = &unk_1EA3B5900;
      v12 = v8;
      v9 = v8;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
      diagcollectLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Apply the consolidated log levels", buf, 2u);
      }

      -[DiagnosticsController applyLogLevelSets:](self, "applyLogLevelSets:", v9);
    }
    else
    {
      diagcollectLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "No logging state for session: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    diagcollectLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "A valid identifier is required when lowering log levels!", buf, 2u);
    }
  }

}

void __51__DiagnosticsController_lowerLoggingForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("process")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("subsystem")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("category")))
  {
    v19 = v6;
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "allKeys", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v8, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("reset"), v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v11);
    }

    v17 = v18;
    v6 = v19;
  }
  else
  {
    diagcollectLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEBUG, "Unsupported log setting type: %@", buf, 0xCu);
    }
  }

}

- (void)applyLogLevelSets:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__DiagnosticsController_applyLogLevelSets___block_invoke;
  v3[3] = &unk_1EA3B5900;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __43__DiagnosticsController_applyLogLevelSets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  _QWORD v9[6];

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("process")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("subsystem")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("category"));
    v6 = 3;
    if (!v7)
      v6 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__DiagnosticsController_applyLogLevelSets___block_invoke_2;
  v9[3] = &unk_1EA3B5928;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

}

uint64_t __43__DiagnosticsController_applyLogLevelSets___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyLogLevel:forIdentifier:logSettingType:", a3, a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)validateOSLogPreferencesProtocol:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0;

  return v4;
}

- (void)applyLogLevel:(id)a3 forIdentifier:(id)a4 logSettingType:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[DiagnosticsController _loadLoggingSupport](self, "_loadLoggingSupport");
  diagcollectLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)LogSettingToString;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138412546;
      v47 = (unint64_t)v15;
      v48 = 2112;
      v49 = (uint64_t)v9;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, " - %@ identifier: %@", (uint8_t *)&v46, 0x16u);

    }
    switch(a5)
    {
      case 3uLL:
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count") == 2)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc((Class)gOSLogPreferencesSubsystem), "initWithName:", v18);
          v12 = objc_msgSend(objc_alloc((Class)gOSLogPreferencesCategory), "initWithName:subsystem:", v19, v20);

        }
        else
        {
          v12 = 0;
        }

        break;
      case 2uLL:
        v16 = objc_msgSend(objc_alloc((Class)gOSLogPreferencesSubsystem), "initWithName:", v9);
        goto LABEL_13;
      case 1uLL:
        v16 = objc_msgSend(objc_alloc((Class)gOSLogPreferencesProcess), "initWithBundleID:", v9);
LABEL_13:
        v12 = v16;
        break;
      default:
        diagcollectLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v46 = 134217984;
          v47 = a5;
          _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEBUG, "Unsupported log setting type: %ld", (uint8_t *)&v46, 0xCu);
        }

        v12 = 0;
        break;
    }
    v22 = -[DiagnosticsController validateOSLogPreferencesProtocol:](self, "validateOSLogPreferencesProtocol:", v12);
    diagcollectLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (!v22)
    {
      if (v24)
      {
        v46 = 138412290;
        v47 = (unint64_t)v12;
        v32 = "OSLogPreferences object %@ no longer conforms to our expected definition!";
        v33 = v23;
        v34 = 12;
LABEL_53:
        _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, v32, (uint8_t *)&v46, v34);
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v24)
    {
      if (-[NSObject isLocked](v12, "isLocked"))
        v25 = CFSTR("On");
      else
        v25 = CFSTR("Off");
      v26 = -[NSObject effectiveEnabledLevel](v12, "effectiveEnabledLevel");
      v27 = -[NSObject enabledLevel](v12, "enabledLevel");
      v28 = -[NSObject effectivePersistedLevel](v12, "effectivePersistedLevel");
      v29 = -[NSObject persistedLevel](v12, "persistedLevel");
      v46 = 138413570;
      v47 = (unint64_t)v12;
      v48 = 2112;
      v49 = (uint64_t)v25;
      v50 = 2048;
      v51 = v26;
      v52 = 2048;
      v53 = v27;
      v54 = 2048;
      v55 = v28;
      v56 = 2048;
      v57 = v29;
      _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "(Before) OSLogPreferences: %@, isLocked: %@, effectiveEnabled:%ld, enabled:%ld effectivePersisted: %ld, persisted: %ld", (uint8_t *)&v46, 0x3Eu);
    }

    if ((-[NSObject isLocked](v12, "isLocked") & 1) != 0)
    {
      diagcollectLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138412290;
        v47 = (unint64_t)v31;
        _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "No means to adjust log levels!! (%@ is locked)", (uint8_t *)&v46, 0xCu);

      }
      goto LABEL_54;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("info")) & 1) != 0)
    {
      v35 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("debug")) & 1) != 0)
    {
      v35 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v35 = 0;
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("reset")))
      {
        diagcollectLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEBUG, "Resetting log level", (uint8_t *)&v46, 2u);
        }

        -[NSObject reset](v12, "reset");
LABEL_48:
        diagcollectLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          if (-[NSObject isLocked](v12, "isLocked"))
            v41 = CFSTR("On");
          else
            v41 = CFSTR("Off");
          v42 = -[NSObject effectiveEnabledLevel](v12, "effectiveEnabledLevel");
          v43 = -[NSObject enabledLevel](v12, "enabledLevel");
          v44 = -[NSObject effectivePersistedLevel](v12, "effectivePersistedLevel");
          v45 = -[NSObject persistedLevel](v12, "persistedLevel");
          v46 = 138413570;
          v47 = (unint64_t)v12;
          v48 = 2112;
          v49 = (uint64_t)v41;
          v50 = 2048;
          v51 = v42;
          v52 = 2048;
          v53 = v43;
          v54 = 2048;
          v55 = v44;
          v56 = 2048;
          v57 = v45;
          v32 = "(After) OSLogPreferences: %@, isLocked: %@, effectiveEnabled: %ld, enabled: %ld effectivePersisted: %ld, persisted: %ld";
          v33 = v23;
          v34 = 62;
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      v35 = 1;
    }
    diagcollectLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v46 = 138412546;
      v47 = (unint64_t)v8;
      v48 = 2048;
      v49 = v35;
      _os_log_impl(&dword_1DBAE1000, v37, OS_LOG_TYPE_DEBUG, "Requesting log level change to: %@ (%ld)", (uint8_t *)&v46, 0x16u);
    }

    if (-[NSObject enabledLevel](v12, "enabledLevel") < v35 || -[NSObject persistedLevel](v12, "persistedLevel") < v35)
    {
      -[NSObject setEnabledLevel:](v12, "setEnabledLevel:", v35);
      -[NSObject setPersistedLevel:](v12, "setPersistedLevel:", v35);
      diagcollectLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v39 = -[NSObject persistedLevel](v12, "persistedLevel");
        v40 = -[NSObject enabledLevel](v12, "enabledLevel");
        v46 = 138413058;
        v47 = (unint64_t)v8;
        v48 = 2048;
        v49 = v35;
        v50 = 2048;
        v51 = v39;
        v52 = 2048;
        v53 = v40;
        _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_DEBUG, "Adjusted log level to: %@ (%ld) - p:%ld | e:%ld", (uint8_t *)&v46, 0x2Au);
      }

    }
    goto LABEL_48;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "The dynamic loading of LoggingSupport failed", (uint8_t *)&v46, 2u);
  }
LABEL_55:

}

- (void)raiseLoggingForDiagnosticCase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  diagcollectLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "caseId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "raiseLoggingForDiagnosticCase: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "caseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "count"))
  {
    -[DiagnosticsController diagActionsForSignature:](self, "diagActionsForSignature:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticsController raiseLoggingForActions:identifier:](self, "raiseLoggingForActions:identifier:", v10, v8);

  }
}

- (void)lowerLoggingForDiagnosticCase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  diagcollectLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "caseId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "lowerLoggingForDiagnosticCase: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v4, "caseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    -[DiagnosticsController lowerLoggingForIdentifier:](self, "lowerLoggingForIdentifier:", v8);

}

- (id)diagnosticExtensionsForDiagnosticCase:(id)a3 enableCommonActions:(id)a4
{
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id obj;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  os_log_t oslog;
  void *v50;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _BYTE *v58;
  __int128 *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE buf[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t v68[128];
  __int128 v69;
  uint64_t v70;
  char v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v40 = a4;
  diagcollectLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v41, "caseId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "diagnosticExtensionsForDiagnosticCase: %@", buf, 0xCu);

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(v41, "signature");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticsController actionsDict](self, "actionsDict");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "count"))
  {
    -[DiagnosticsController diagActionsForSignature:commonActions:](self, "diagActionsForSignature:commonActions:", v42, v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    diagcollectLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Looking up diagnostic extensions in %ld actions: %@", buf, 0x16u);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v9;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v61 != v47)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v43, "objectForKeyedSubscript:", v14);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v50;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              LOBYTE(v65) = 1;
              oslog = v15;
              -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("matchFilter"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v46;
                *(_QWORD *)&v69 = 0;
                *((_QWORD *)&v69 + 1) = &v69;
                v70 = 0x2020000000;
                v71 = 1;
                v56[0] = MEMORY[0x1E0C809B0];
                v56[1] = 3221225472;
                v56[2] = __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke;
                v56[3] = &unk_1EA3B5950;
                v57 = v42;
                v58 = buf;
                v59 = &v69;
                objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v56);
                if (!*(_BYTE *)(*((_QWORD *)&v69 + 1) + 24))
                  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;

                _Block_object_dispose(&v69, 8);
              }
              if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
              {
                -[NSObject objectForKeyedSubscript:](oslog, "objectForKeyedSubscript:", CFSTR("diagExt"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v17 = v45;
                  v52 = 0u;
                  v53 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v18 = v17;
                  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
                  if (!v19)
                    goto LABEL_32;
                  v20 = *(_QWORD *)v53;
                  while (1)
                  {
                    for (j = 0; j != v19; ++j)
                    {
                      if (*(_QWORD *)v53 != v20)
                        objc_enumerationMutation(v18);
                      v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v23 = v22;
                        objc_msgSend(v8, "addObject:", v23);
                      }
                      else
                      {
                        if (!v22)
                          continue;
                        diagcollectLogHandle();
                        v23 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                        {
                          v24 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v24);
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(v69) = 138412290;
                          *(_QWORD *)((char *)&v69 + 4) = v25;
                          _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSString)", (uint8_t *)&v69, 0xCu);

                        }
                      }

                    }
                    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
                    if (!v19)
                    {
LABEL_32:

                      goto LABEL_42;
                    }
                  }
                }
                if (v45)
                {
                  diagcollectLogHandle();
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    v30 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v30);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v69) = 138412290;
                    *(_QWORD *)((char *)&v69 + 4) = v31;
                    _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSArray)", (uint8_t *)&v69, 0xCu);

                  }
LABEL_42:

                }
              }
              else
              {

              }
              _Block_object_dispose(buf, 8);
LABEL_45:

            }
            else if (v50)
            {
              diagcollectLogHandle();
              oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
              {
                v28 = (objc_class *)objc_opt_class();
                NSStringFromClass(v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v29;
                _os_log_impl(&dword_1DBAE1000, oslog, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSDictionary)", buf, 0xCu);

              }
              goto LABEL_45;
            }

            goto LABEL_47;
          }
          diagcollectLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v27;
            _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Found unexpected class: %@ (expected NSString)", buf, 0xCu);

          }
LABEL_47:

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v48);
    }

  }
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "customerSeedBuild");

  if (v33)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v65 = __Block_byref_object_copy__2;
    v66 = __Block_byref_object_dispose__2;
    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke_137;
    v51[3] = &unk_1EA3B5978;
    v51[4] = buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v51);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      objc_msgSend(v8, "removeObjectsInArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      diagcollectLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
        LODWORD(v69) = 134217984;
        *(_QWORD *)((char *)&v69 + 4) = v35;
        _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_DEBUG, "Removed %ld diagnostic extensions that were not privacy approved", (uint8_t *)&v69, 0xCu);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  diagcollectLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v37 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEBUG, "Found %ld diagnostic extensions: %@", buf, 0x16u);
  }

  objc_msgSend(v8, "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

void __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  NSObject *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
      v10 = v8;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      diagcollectLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
        {
          v19 = 138412802;
          v20 = v9;
          v21 = 2112;
          v22 = v11;
          v23 = 2112;
          v24 = v10;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "Found filter key '%@' with value '%@' in signature dictionary. (Expecting to match '%@')", (uint8_t *)&v19, 0x20u);
        }

        if ((objc_msgSend(v11, "isEqualToString:", v10) & 1) != 0)
          goto LABEL_14;
        v14 = *(_QWORD *)(a1 + 40);
      }
      else
      {
        if (v13)
        {
          v19 = 138412290;
          v20 = v9;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "Did not find applicable filter key '%@' in signature dictionary. Allowing.", (uint8_t *)&v19, 0xCu);
        }

        v14 = *(_QWORD *)(a1 + 48);
      }
      *(_BYTE *)(*(_QWORD *)(v14 + 8) + 24) = 0;
      *a4 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  diagcollectLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Found unexpected class in actions filter dictionary! key: %@ (%@) value: %@ (%@)", (uint8_t *)&v19, 0x2Au);

  }
LABEL_15:

}

void __83__DiagnosticsController_diagnosticExtensionsForDiagnosticCase_enableCommonActions___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.tailspin")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.osx-tailspin")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.Microstackshot")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PowerlogCore.diagnosticextension")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.Cellular")) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    diagcollectLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "Flagging DiagnosticExtension %@ as not privacy approved", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (unint64_t)collectDiagnosticExtensionFilesForDiagnosticCase:(id)a3 parameters:(id)a4 options:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  DiagnosticsController *v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  id obj;
  id v59;
  id v60;
  _QWORD block[4];
  id v62;
  _QWORD v63[4];
  NSObject *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    diagcollectLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v13;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEBUG, "Found diagnostic extensions options dictionary: %@", buf, 0xCu);
    }

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("diagextcommon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      diagcollectLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v74 = (uint64_t)v18;
        _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEBUG, "Enable common diagnostic extensions: %@", buf, 0xCu);
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  -[DiagnosticsController diagnosticExtensionsForDiagnosticCase:enableCommonActions:](self, "diagnosticExtensionsForDiagnosticCase:enableCommonActions:", v60, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  diagcollectLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v21)
  {
    v53 = self;
    v54 = v18;
    v55 = v14;
    if (v23)
    {
      v24 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134218498;
      v74 = v24;
      v75 = 2112;
      v76 = v20;
      v77 = 2112;
      v78 = v12;
      _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEBUG, "Ready to collect from %ld diagnostic extensions (%@) with parameters: %@", buf, 0x20u);
    }
    v56 = v13;

    v52 = v20;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v25, "count");
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke;
    v70[3] = &unk_1EA3B5900;
    v59 = v26;
    v71 = v59;
    v57 = v12;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v70);
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v25;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v67 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          diagcollectLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v74 = (uint64_t)v32;
            _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "Will call Diag Extension: %@", buf, 0xCu);
          }

          objc_msgSend(v59, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = objc_msgSend(v34, "mutableCopy");
          }
          else
          {
            if (v34)
            {
              diagcollectLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = (objc_class *)objc_opt_class();
                NSStringFromClass(v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v74 = (uint64_t)v38;
                v75 = 2112;
                v76 = v34;
                _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_ERROR, "Expected NSDictionary, but found unexpected class %@ as a DE parameter: %@", buf, 0x16u);

              }
            }
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v51);
            v35 = objc_claimAutoreleasedReturnValue();
          }
          v39 = (void *)v35;

          objc_msgSend(v39, "setObject:forKeyedSubscript:", CFSTR("com.apple.symptomsd"), CFSTR("DEExtensionHostAppKey"));
          if ((objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.WiFi")) & 1) != 0
            || objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.diagnosticextensions.osx.wifi")))
          {
            objc_msgSend(v60, "signature", v51);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("subtype"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, CFSTR("trigger"));
          }
          if (objc_msgSend(v39, "count", v51))
          {
            objc_msgSend(v27, "setValue:forKey:", v39, v32);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setValue:forKey:", v42, v32);

          }
          objc_msgSend(v60, "addRequiredAttachmentType:pattern:", CFSTR("diagext"), v32);

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v29);
    }
    v43 = obj;

    -[DiagnosticsController diagExtensionCollector](v53, "diagExtensionCollector");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "caseId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_157;
    v63[3] = &unk_1EA3B59A0;
    v65 = v15;
    v14 = v55;
    v64 = v55;
    objc_msgSend(v44, "collectDEPayloadsWithIdentifier:diagnosticExtensionsWithParameters:queue:reply:", v46, v27, v64, v63);

    v13 = v56;
    v12 = v57;
    v18 = v54;
    v47 = v51;
    v20 = v52;
  }
  else
  {
    if (v23)
    {
      objc_msgSend(v60, "caseId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "UUIDString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v49;
      _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEBUG, "No matching diagnostic extensions found for the case ID %@", buf, 0xCu);

    }
    if (!v15)
    {
      v47 = 0;
      goto LABEL_42;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_160;
    block[3] = &unk_1EA3B56B0;
    v62 = v15;
    dispatch_async(v14, block);
    v47 = 0;
    v43 = v62;
  }

LABEL_42:
  return v47;
}

void __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  else
  {
    diagcollectLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v5;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Dropping unexpected content from DE parameters. key (%@): %@, value (%@): %@", (uint8_t *)&v12, 0x2Au);

    }
  }

}

void __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    diagcollectLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Collecting Diagnostic Extension payloads failed with error: %@", buf, 0xCu);
    }

  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_158;
    v10[3] = &unk_1EA3B4A28;
    v12 = v8;
    v11 = v5;
    dispatch_async(v9, v10);

  }
}

uint64_t __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __105__DiagnosticsController_collectDiagnosticExtensionFilesForDiagnosticCase_parameters_options_queue_reply___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)autoBugCapturePath
{
  return self->_autoBugCapturePath;
}

- (void)setAutoBugCapturePath:(id)a3
{
  objc_storeStrong((id *)&self->_autoBugCapturePath, a3);
}

- (NSNumber)autoBugCaptureGID
{
  return self->_autoBugCaptureGID;
}

- (void)setAutoBugCaptureGID:(id)a3
{
  objc_storeStrong((id *)&self->_autoBugCaptureGID, a3);
}

- (NSNumber)autoBugCaptureUID
{
  return self->_autoBugCaptureUID;
}

- (void)setAutoBugCaptureUID:(id)a3
{
  objc_storeStrong((id *)&self->_autoBugCaptureUID, a3);
}

- (NSMutableDictionary)actionsDict
{
  return self->_actionsDict;
}

- (void)setActionsDict:(id)a3
{
  objc_storeStrong((id *)&self->_actionsDict, a3);
}

- (NSMutableDictionary)settingsDict
{
  return self->_settingsDict;
}

- (void)setSettingsDict:(id)a3
{
  objc_storeStrong((id *)&self->_settingsDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDict, 0);
  objc_storeStrong((id *)&self->_actionsDict, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureUID, 0);
  objc_storeStrong((id *)&self->_autoBugCaptureGID, 0);
  objc_storeStrong((id *)&self->_autoBugCapturePath, 0);
  objc_storeStrong((id *)&self->deCollector, 0);
}

@end

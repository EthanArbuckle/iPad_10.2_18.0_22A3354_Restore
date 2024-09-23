@implementation CLAutoCohortUtilities

+ (BOOL)autoCohortingEnabled
{
  return qword_1EE64C750 != 0;
}

+ (void)enableAutoCohortingForProcessAtPath:(id)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_1ECE24CB0 == -1)
    {
LABEL_11:
      v4 = qword_1ECE24CA8;
      if (!os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = &unk_1A1A18FAF;
      v13 = 2114;
      v14 = (const char *)a3;
      v5 = "{\"msg%{public}.0s\":\"#Cohorting Process intended to sign up for auto cohorting but CoreLocation/CLAutoCohor"
           "t=off\", \"autoCohortEdgesDirectoryPath\":%{public, location:escape_only}@}";
      goto LABEL_13;
    }
LABEL_26:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    goto LABEL_11;
  }
  if (!a3 || !objc_msgSend(a3, "length"))
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    v6 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = &unk_1A1A18FAF;
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "path && path.length";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    }
    v7 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = &unk_1A1A18FAF;
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "path && path.length";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Invalid path while enabling auto cohorting", "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    }
    a3 = (id)qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = &unk_1A1A18FAF;
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "path && path.length";
      _os_log_impl(&dword_1A19F4000, (os_log_t)a3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    goto LABEL_26;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A1A0FC44;
  block[3] = &unk_1E45FB9C8;
  block[4] = a3;
  if (qword_1EE64C748 != -1)
    dispatch_once(&qword_1EE64C748, block);
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
  v4 = qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = &unk_1A1A18FAF;
    v13 = 2114;
    v14 = (const char *)a3;
    v5 = "{\"msg%{public}.0s\":\"#Cohorting Process successfully signed up for auto cohorting\", \"autoCohortEdgesDirecto"
         "ryPath\":%{public, location:escape_only}@}";
LABEL_13:
    _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
  }
}

+ (id)layerAssignmentForNode:(id)a3 inGraph:(id)a4 extendingLayering:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  signed int v17;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:");
  if (!v8)
  {
    objc_msgSend(a5, "setObject:forKeyedSubscript:", &unk_1E4600268, a3);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v20 = a3;
    v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", a3);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = +[CLAutoCohortUtilities layerAssignmentForNode:inGraph:extendingLayering:](CLAutoCohortUtilities, "layerAssignmentForNode:inGraph:extendingLayering:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13), a4, a5);
          if (v14 == &unk_1E4600268)
            return &unk_1E4600268;
          v15 = v14;
          v16 = (void *)MEMORY[0x1E0CB37E8];
          v17 = objc_msgSend(v8, "intValue");
          if (v17 <= (int)(objc_msgSend(v15, "intValue") + 1))
            v18 = objc_msgSend(v15, "intValue") + 1;
          else
            v18 = objc_msgSend(v8, "intValue");
          v8 = (void *)objc_msgSend(v16, "numberWithInt:", v18);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
    objc_msgSend(a5, "setObject:forKeyedSubscript:", v8, v20);
  }
  return v8;
}

+ (void)applyEdges:(id)a3 toGraph:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndex:", 0));
        if (!v11)
        {
          v13 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
          goto LABEL_12;
        }
        v12 = (void *)v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_1ECE24CB0 != -1)
              goto LABEL_26;
            while (1)
            {
              v14 = qword_1ECE24CA8;
              if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 68289539;
                v22 = 0;
                v23 = 2082;
                v24 = &unk_1A1A18FAF;
                v25 = 2082;
                v26 = "assert";
                v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
                if (qword_1ECE24CB0 != -1)
                  dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
              }
              v15 = qword_1ECE24CA8;
              if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
              {
                *(_DWORD *)buf = 68289539;
                v22 = 0;
                v23 = 2082;
                v24 = &unk_1A1A18FAF;
                v25 = 2082;
                v26 = "assert";
                v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_signpost_emit_with_name_impl(&dword_1A19F4000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}", "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
                if (qword_1ECE24CB0 != -1)
                  dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
              }
              v16 = qword_1ECE24CA8;
              if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 68289539;
                v22 = 0;
                v23 = 2082;
                v24 = &unk_1A1A18FAF;
                v25 = 2082;
                v26 = "assert";
                v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_log_impl(&dword_1A19F4000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }
              abort_report_np();
LABEL_26:
              dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v12);
LABEL_12:
          v12 = (void *)v13;
          objc_msgSend(a4, "setObject:forKeyedSubscript:", v13, objc_msgSend(v10, "objectAtIndex:", 0));
        }
        objc_msgSend(v12, "addObject:", objc_msgSend(v10, "objectAtIndex:", 1));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v7);
  }
}

+ (void)createDirectoryAtPath:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, 0, &v10);
  if (v10)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    v4 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      v5 = objc_msgSend(v10, "localizedFailureReason");
      *(_DWORD *)buf = 68290051;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2114;
      v16 = a3;
      v17 = 2114;
      v18 = v5;
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!error";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    }
    v6 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      v7 = objc_msgSend(v10, "localizedFailureReason");
      *(_DWORD *)buf = 68290051;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2114;
      v16 = a3;
      v17 = 2114;
      v18 = v7;
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!error";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Cannot create directory", "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    }
    v8 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v10, "localizedFailureReason");
      *(_DWORD *)buf = 68290051;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2114;
      v16 = a3;
      v17 = 2114;
      v18 = v9;
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!error";
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }
    abort_report_np();
  }
}

+ (id)getEdgeFilesFromDirectory:(id)a3
{
  BOOL v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t buf;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v21))v4 = v21 == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    v5 = qword_1ECE24CA8;
    if (!os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      return 0;
    buf = 68289282;
    v24 = 2082;
    v25 = &unk_1A1A18FAF;
    v26 = 2114;
    v27 = a3;
    v6 = "{\"msg%{public}.0s\":\"#Cohorting Doesnot exist or is not a directory\", \"directoryPath\":%{public, location:escape_only}@}";
    goto LABEL_15;
  }
  v20 = 0;
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, &v20);
  if (v20)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    v5 = qword_1ECE24CA8;
    if (!os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      return 0;
    buf = 68289282;
    v24 = 2082;
    v25 = &unk_1A1A18FAF;
    v26 = 2114;
    v27 = a3;
    v6 = "{\"msg%{public}.0s\":\"#Cohorting Cannot read contents of directory\", \"directoryPath\":%{public, location:escape_only}@}";
LABEL_15:
    _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&buf, 0x1Cu);
    return 0;
  }
  v10 = (void *)v7;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "hasSuffix:", CFSTR(".plist")))
          objc_msgSend(v8, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v12);
  }
  return v8;
}

+ (id)readEdges:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = +[CLAutoCohortUtilities getEdgeFilesFromDirectory:](CLAutoCohortUtilities, "getEdgeFilesFromDirectory:");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 68289026;
    v16 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = objc_msgSend(a3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), v16);
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v11);
        if (v12 && (v13 = v12, objc_msgSend(v12, "count") == 2))
        {
          objc_msgSend(v5, "addObject:", v13);
        }
        else
        {
          if (qword_1ECE24CB0 != -1)
            dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          v14 = qword_1ECE24CA8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = 0;
            v23 = 2082;
            v24 = &unk_1A1A18FAF;
            _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph edge is of unexpected type. Expects [\"\", \"\"]\"}", buf, 0x12u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }
  return v5;
}

+ (id)getUnvettedEdges
{
  return (id)MEMORY[0x1E0DE7D20](CLAutoCohortUtilities, sel_readEdges_);
}

+ (id)getSafeEdges
{
  objc_msgSend((id)qword_1EE64C750, "stringByAppendingPathComponent:", CFSTR("_safe"));
  return (id)MEMORY[0x1E0DE7D20](CLAutoCohortUtilities, sel_readEdges_);
}

+ (id)getUnsafeEdges
{
  objc_msgSend((id)qword_1EE64C750, "stringByAppendingPathComponent:", CFSTR("_unsafe"));
  return (id)MEMORY[0x1E0DE7D20](CLAutoCohortUtilities, sel_readEdges_);
}

+ (void)writeEdge:(id)a3 toDirectory:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[CLAutoCohortUtilities createDirectoryAtPath:](CLAutoCohortUtilities, "createDirectoryAtPath:", a4);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ss"));
  v7 = objc_msgSend(a4, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"))));
  v9 = 0;
  objc_msgSend(a3, "writeToURL:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7), &v9);
  if (v9)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    v8 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot write edge file\", \"edgeFilePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

+ (void)persistEdgeFrom:(id)a3 to:(id)a4
{
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v5[1] = a4;
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  +[CLAutoCohortUtilities writeEdge:toDirectory:](CLAutoCohortUtilities, "writeEdge:toDirectory:", v4, qword_1EE64C750);
}

+ (void)markUnvetted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = +[CLAutoCohortUtilities getEdgeFilesFromDirectory:](CLAutoCohortUtilities, "getEdgeFilesFromDirectory:", qword_1EE64C750);
  v5 = (void *)objc_msgSend((id)qword_1EE64C750, "stringByAppendingPathComponent:", a3);
  +[CLAutoCohortUtilities createDirectoryAtPath:](CLAutoCohortUtilities, "createDirectoryAtPath:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 68289538;
    v15 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_msgSend((id)qword_1EE64C750, "stringByAppendingPathComponent:", v11, v15);
        v13 = objc_msgSend(v5, "stringByAppendingPathComponent:", v11);
        v16 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtPath:toPath:error:", v12, v13, &v16);
        if (v16)
        {
          if (qword_1ECE24CB0 != -1)
            dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          v14 = qword_1ECE24CA8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v22 = 0;
            v23 = 2082;
            v24 = &unk_1A1A18FAF;
            v25 = 2114;
            v26 = v12;
            v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot move unvetted edge\", \"srcFilePath\":%{public, location:escape_only}@, \"dstFilePath\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v8);
  }
}

+ (void)markUnvettedSafe
{
  MEMORY[0x1E0DE7D20](CLAutoCohortUtilities, sel_markUnvetted_);
}

+ (void)markUnvettedUnsafe
{
  MEMORY[0x1E0DE7D20](CLAutoCohortUtilities, sel_markUnvetted_);
}

+ (BOOL)isEdgeKnownToCauseCycle:(id)a3
{
  void *v4;
  BOOL v5;

  if (qword_1ECE24E98 != -1)
    dispatch_once(&qword_1ECE24E98, &unk_1E45FB6E0);
  v4 = (void *)objc_msgSend((id)qword_1ECE24E90, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  if (!v4)
    return 0;
  v5 = 1;
  if ((objc_msgSend(v4, "containsObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)) & 1) == 0)
    return 0;
  return v5;
}

+ (id)computeAutoCohortMapWithStarterGraph:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char **__ptr32 *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t buf;
  __int16 v36;
  void *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  +[CLAutoCohortUtilities applyEdges:toGraph:](CLAutoCohortUtilities, "applyEdges:toGraph:", +[CLAutoCohortUtilities getSafeEdges](CLAutoCohortUtilities, "getSafeEdges"), a3);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(a3);
        if ((int)objc_msgSend(+[CLAutoCohortUtilities layerAssignmentForNode:inGraph:extendingLayering:](CLAutoCohortUtilities, "layerAssignmentForNode:inGraph:extendingLayering:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), a3, v4), "intValue") <= -2)
        {
          if (qword_1ECE24CB0 != -1)
            dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          v24 = qword_1ECE24CA8;
          v16 = &off_1A1A18000;
          v15 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCoho"
                "rtNameToCohortMapAggregateSafe].intValue";
          if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
          {
            buf = 68289539;
            v36 = 2082;
            v37 = &unk_1A1A18FAF;
            v38 = 2082;
            v39 = "assert";
            v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_log_impl(&dword_1A19F4000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
            if (qword_1ECE24CB0 != -1)
              dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          }
          v25 = qword_1ECE24CA8;
          if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
          {
            buf = 68289539;
            v36 = 2082;
            v37 = &unk_1A1A18FAF;
            v38 = 2082;
            v39 = "assert";
            v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_signpost_emit_with_name_impl(&dword_1A19F4000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Edge that was marked safe causes cycle in syncget graph", "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
            if (qword_1ECE24CB0 != -1)
              dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          }
          v4 = qword_1ECE24CA8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
          {
            buf = 68289539;
            v36 = 2082;
            v37 = &unk_1A1A18FAF;
            v38 = 2082;
            v39 = "assert";
            v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
          abort_report_np();
LABEL_39:
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
          goto LABEL_21;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = +[CLAutoCohortUtilities getUnvettedEdges](CLAutoCohortUtilities, "getUnvettedEdges");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  +[CLAutoCohortUtilities applyEdges:toGraph:](CLAutoCohortUtilities, "applyEdges:toGraph:", v9, a3);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
LABEL_13:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(a3);
      if (objc_msgSend(+[CLAutoCohortUtilities layerAssignmentForNode:inGraph:extendingLayering:](CLAutoCohortUtilities, "layerAssignmentForNode:inGraph:extendingLayering:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14), a3, v10), "intValue") == -1)break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v12)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
    +[CLAutoCohortUtilities markUnvettedUnsafe](CLAutoCohortUtilities, "markUnvettedUnsafe");
    v15 = (char *)objc_msgSend(v9, "objectAtIndex:", 0);
    v16 = (char **__ptr32 *)0x1ECE24000;
    if (qword_1ECE24CB0 != -1)
      goto LABEL_39;
LABEL_21:
    v17 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      v18 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v19 = objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      buf = 68289538;
      v36 = 2082;
      v37 = &unk_1A1A18FAF;
      v38 = 2114;
      v39 = (const char *)v18;
      v40 = 2114;
      v41 = (const char *)v19;
      _os_log_impl(&dword_1A19F4000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Cycle introduced in sync-get graph\", \"FromNode\":%{public, location:escape_only}@, \"ToNode\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (*((_QWORD *)v16 + 406) != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBAA8);
    }
    v20 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      v21 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v22 = objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      buf = 68289538;
      v36 = 2082;
      v37 = &unk_1A1A18FAF;
      v38 = 2114;
      v39 = (const char *)v21;
      v40 = 2114;
      v41 = (const char *)v22;
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Cycle introduced in sync-get graph", "{\"msg%{public}.0s\":\"#Cohorting Cycle introduced in sync-get graph\", \"FromNode\":%{public, location:escape_only}@, \"ToNode\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
    return v4;
  }
  else
  {
LABEL_19:
    +[CLAutoCohortUtilities markUnvettedSafe](CLAutoCohortUtilities, "markUnvettedSafe");
  }
  return v10;
}

@end

@implementation CLSilo

+ (id)main
{
  if (qword_1ECE24D50 != -1)
    dispatch_once(&qword_1ECE24D50, &unk_1E45FB700);
  return (id)qword_1ECE24D48;
}

- (CLSilo)initWithIdentifier:(id)a3
{
  id v5;
  CLSilo *v6;
  CLSilo *v7;
  uint64_t v8;
  NSMutableSet *idleHandlers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSilo;
  v6 = -[CLSilo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = objc_opt_new();
    idleHandlers = v7->_idleHandlers;
    v7->_idleHandlers = (NSMutableSet *)v8;

  }
  return v7;
}

- (void)prepareAndRunBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSString *identifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (self->_isIdle)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB5A0);
    v5 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      v7 = 138412290;
      v8 = identifier;
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEFAULT, "#Idleness: Silo is being resumed: %@", (uint8_t *)&v7, 0xCu);
    }
    -[CLSilo runResumeHandlers](self, "runResumeHandlers");
    self->_isIdle = 0;
  }
  self->_currentLatchedAbsoluteTimestamp = CFAbsoluteTimeGetCurrent();
  if (v4)
    v4[2](v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleHandlers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)globalConfiguration
{
  return (id)qword_1EE64C740;
}

+ (void)setGlobalConfiguration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t m;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
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
  const __CFString *v72;
  id v73;
  uint8_t v74[128];
  uint8_t buf[4];
  int v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AutoCohortEdgesDirectoryPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    +[CLAutoCohortUtilities enableAutoCohortingForProcessAtPath:](CLAutoCohortUtilities, "enableAutoCohortingForProcessAtPath:", v4);
  v48 = v4;
  v5 = (id)objc_opt_new();
  v50 = v3;
  if (+[CLAutoCohortUtilities autoCohortingEnabled](CLAutoCohortUtilities, "autoCohortingEnabled"))
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FB5A0);
    v6 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v76 = 0;
      v77 = 2082;
      v78 = &unk_1A1A18FAF;
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Using syng-get graph file if available\"}", buf, 0x12u);
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncgetGraphFile"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "open");
        v59 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v9, 0, 0, &v59);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v59;
        objc_msgSend(v9, "close");
        v12 = 0;
        if (!v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (qword_1ECE24CB0 != -1)
              dispatch_once(&qword_1ECE24CB0, &unk_1E45FB5A0);
            v13 = qword_1ECE24CA8;
            if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v76 = 0;
              v77 = 2082;
              v78 = &unk_1A1A18FAF;
              v79 = 2114;
              v80 = v7;
              _os_log_impl(&dword_1A19F4000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Successfully read sync-get graph file\", \"filePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            }
          }
          else
          {
            v12 = 0;
          }
        }

        v30 = v49;
      }
      else
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FB5A0);
        v30 = v49;
        v36 = qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          v76 = 0;
          v77 = 2082;
          v78 = &unk_1A1A18FAF;
          v79 = 2114;
          v80 = v7;
          _os_log_impl(&dword_1A19F4000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting No sync-get graph file available to read\", \"filePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        v12 = 0;
      }

    }
    else
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB5A0);
      v30 = v49;
      v35 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v76 = 0;
        v77 = 2082;
        v78 = &unk_1A1A18FAF;
        _os_log_impl(&dword_1A19F4000, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting No sync-get graph filePath supplied\"}", buf, 0x12u);
      }
      v12 = 0;
    }

    +[CLAutoCohortUtilities computeAutoCohortMapWithStarterGraph:](CLAutoCohortUtilities, "computeAutoCohortMapWithStarterGraph:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v5 = v37;
    v38 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
    if (v38)
    {
      v39 = v38;
      LODWORD(v40) = 0;
      v41 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v56 != v41)
            objc_enumerationMutation(v5);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "intValue");

          if ((int)v40 <= v44)
            v40 = v44;
          else
            v40 = v40;
        }
        v39 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
      }
      while (v39);
    }
    else
    {
      v40 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("default"));

LABEL_65:
    v26 = v50;
    goto LABEL_66;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CohortToNameMap"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v69 != v51)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKeyedSubscript:", v15, v48);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v65;
          do
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v65 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "intValue"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
          }
          while (v21);
        }

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v52);
  }

  v26 = v50;
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("NameToCohortMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v61;
    v30 = v48;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v61 != v29)
          objc_enumerationMutation(v12);
        v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * m);
        objc_msgSend(v12, "objectForKeyedSubscript:", v32, v48);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v33, "intValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, v32);

      }
      v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v28);
    goto LABEL_65;
  }
  v30 = v48;
LABEL_66:

  v72 = CFSTR("NameToCohortMap");
  v73 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)qword_1EE64C740;
  qword_1EE64C740 = v46;

}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CLSilo: %@"), self->_identifier);
}

- (void)assertInside
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)assertOutside
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)suspend
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)resume
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (BOOL)isSuspended
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (double)currentLatchedAbsoluteTimestamp
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (id)newTimer
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)async:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v5 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v6 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)sync:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v5 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v6 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)intendToSync
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v3 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)afterInterval:(double)a3 async:(id)a4
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v5 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "0";
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v6 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v7 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_1A1A18FAF;
      v12 = 2082;
      v13 = "assert";
      v14 = 2081;
      v15 = "0";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (void)heartBeat:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1EE64C240 != -1)
    goto LABEL_11;
  while (1)
  {
    v4 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v5 = qword_1EE64C238;
    if (os_signpost_enabled((os_log_t)qword_1EE64C238))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
    }
    v6 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "0";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EE64C240, &unk_1E45FB850);
  }
}

- (BOOL)shouldBeIdled
{
  double Current;
  double lastIdleCheck;
  double v5;
  double v6;
  double v7;
  BOOL result;

  Current = CFAbsoluteTimeGetCurrent();
  lastIdleCheck = self->_lastIdleCheck;
  -[CLSilo currentLatchedAbsoluteTimestamp](self, "currentLatchedAbsoluteTimestamp");
  if (lastIdleCheck <= v5)
  {
    result = 0;
  }
  else
  {
    v6 = self->_lastIdleCheck;
    -[CLSilo currentLatchedAbsoluteTimestamp](self, "currentLatchedAbsoluteTimestamp");
    result = v6 - v7 > 900.0;
  }
  self->_lastIdleCheck = Current;
  return result;
}

- (id)registerForIdleNotifications:(id)a3 onResume:(id)a4
{
  id v6;
  id v7;
  CLSiloIdleHandler *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CLSiloIdleHandler initWithIdleHandler:onResume:]([CLSiloIdleHandler alloc], "initWithIdleHandler:onResume:", v7, v6);

  os_unfair_lock_lock(&self->_idleHandlersLock);
  -[NSMutableSet addObject:](self->_idleHandlers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_idleHandlersLock);
  return v8;
}

- (void)unregisterForIdleNotifications:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "invalidate");
  os_unfair_lock_lock(&self->_idleHandlersLock);
  -[NSMutableSet removeObject:](self->_idleHandlers, "removeObject:", v4);

  os_unfair_lock_unlock(&self->_idleHandlersLock);
}

- (void)runIdleHandlers
{
  os_unfair_lock_s *p_idleHandlersLock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(void);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CLSilo assertInside](self, "assertInside");
  p_idleHandlersLock = &self->_idleHandlersLock;
  os_unfair_lock_lock(&self->_idleHandlersLock);
  v4 = (void *)-[NSMutableSet copy](self->_idleHandlers, "copy");
  os_unfair_lock_unlock(p_idleHandlersLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "onIdle", (_QWORD)v11);
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)runResumeHandlers
{
  os_unfair_lock_s *p_idleHandlersLock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(void);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CLSilo assertInside](self, "assertInside");
  p_idleHandlersLock = &self->_idleHandlersLock;
  os_unfair_lock_lock(&self->_idleHandlersLock);
  v4 = (void *)-[NSMutableSet copy](self->_idleHandlers, "copy");
  os_unfair_lock_unlock(p_idleHandlersLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "onResume", (_QWORD)v11);
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

@end

@implementation CrashReportOutlet

- (id)descriptiveFilenameWithPrefix:(id)a3 domain:(id)a4 process:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  if (objc_msgSend(v9, "length"))
  {
    v11 = v7;
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v7, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  id v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  char v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  NSObject *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "dampeningType") == -1)
  {
    diagcaseLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "Skip publishing report to CrashReporter since this is a transient case.";
LABEL_18:
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    }
  }
  else
  {
    v6 = objc_msgSend(v5, "writeIPSFile");
    diagcaseLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "caseId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, "Publishing report of case %@ to CrashReporter", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "signature");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, CFSTR("signature"));

      objc_msgSend(v5, "events");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, CFSTR("events"));

      objc_msgSend(v5, "attachments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, CFSTR("attachments"));

      v14 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v5, "caseDampeningTypeString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "caseClosureTypeString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("dampening_type"), v16, CFSTR("closure_type"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, CFSTR("case_status"));

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "caseId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v5, "caseId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v22, CFSTR("caseID"));

      }
      objc_msgSend(v5, "caseOpenedTime");
      if (v23 != 0.0)
      {
        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "caseOpenedTime");
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v25, CFSTR("triggerTime"));

      }
      -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("case_header"));
      sanitizedJSONCollectionObject(v8, 1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v26))
      {
        diagcaseLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v5;
          v41 = 2112;
          v42 = v26;
          _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_ERROR, "CrashReport content dictionary for case %@ is not JSON compatible. (content=%@)", buf, 0x16u);
        }
        v30 = 0;
        goto LABEL_27;
      }
      v38 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v26, 0, &v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v38;
      if (v28)
      {
        diagcaseLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v40 = v5;
          v41 = 2112;
          v42 = v28;
          v43 = 2112;
          v44 = v26;
          _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_ERROR, "Failed JSON serialization of CrashReport content dictionary for case %@: %@ (content=%@)", buf, 0x20u);
        }
        v30 = 0;
      }
      else
      {
        if (!v27)
        {
          v30 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v5, "signature");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("domain"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "signature");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("detected"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CrashReportOutlet descriptiveFilenameWithPrefix:domain:process:](self, "descriptiveFilenameWithPrefix:domain:process:", CFSTR("AutoBugCapture"), v32, v34);
        v29 = objc_claimAutoreleasedReturnValue();

        v37 = v27;
        v30 = OSAWriteLogForSubmission();

      }
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "Skip publishing report to CrashReporter since we surpassed the daily file count limit.";
      goto LABEL_18;
    }
  }
  v30 = 0;
LABEL_28:

  return v30;
}

uint64_t __50__CrashReportOutlet_publishReportForCase_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", *(_QWORD *)(a1 + 32));
}

@end

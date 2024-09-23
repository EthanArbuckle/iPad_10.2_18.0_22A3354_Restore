@implementation NPDiagnosticReport

+ (BOOL)logNSPDiagnosticReport:(id)a3 event:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _BYTE buffer[64];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  buffer[0] = 0;
  if (v8)
  {
    v10 = getpid();
    if (proc_name(v10, buffer, 0x40u) < 1)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown-name>[%d]"), v10);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v8;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v9;
      _os_log_debug_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEBUG, "Logging diagnostic event <%@> for %@ with context <%@>", buf, 0x20u);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
    v15 = v14;
    if (v14
      && (objc_msgSend(v14, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("Tuscany"), v7, v8, v12, 0), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = v16;
      if (v9)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DB00F0]);
      v23 = *MEMORY[0x1E0DAFF78];
      v21 = *MEMORY[0x1E0DAFF70];
      v22 = &unk_1E4151558;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "snapshotWithSignature:duration:events:payload:actions:reply:", v17, 0, 0, v19, &__block_literal_global_6, 120.0);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __59__NPDiagnosticReport_logNSPDiagnosticReport_event_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "Diagnostic report response = %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (void)logInternalError:(id)a3 context:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = +[NPDiagnosticReport logNSPDiagnosticReport:event:context:](NPDiagnosticReport, "logNSPDiagnosticReport:event:context:", CFSTR("InternalError"), v5, a4);
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "Logged %@ event", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "Failed to log %@ event", (uint8_t *)&v9, 0xCu);
  }

}

@end

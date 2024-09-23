@implementation NetworkDiagnosticsReportGenerator

- (NetworkDiagnosticsReportGenerator)initWithQueue:(id)a3
{
  NetworkDiagnosticsReportGenerator *v3;
  NetworkDiagnosticsReportGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NetworkDiagnosticsReportGenerator;
  v3 = -[DiagnosticReportGenerator initWithQueue:](&v6, sel_initWithQueue_, a3);
  v4 = v3;
  if (v3)
    -[DiagnosticReportGenerator setTimeoutSeconds:](v3, "setTimeoutSeconds:", 600.0);
  return v4;
}

- (void)setNetDiags:(id)a3
{
  NetDiagnosticsShim *v5;
  NetDiagnosticsShim *netDiags;
  NetDiagnosticsShim *v7;

  v5 = (NetDiagnosticsShim *)a3;
  netDiags = self->_netDiags;
  if (netDiags != v5)
  {
    v7 = v5;
    if (netDiags)
    {
      -[NetDiagnosticsShim setDelegate:](netDiags, "setDelegate:", 0);
      -[NetDiagnosticsShim invalidateConnections](self->_netDiags, "invalidateConnections");
      v5 = v7;
    }
    if (v5)
      -[NetDiagnosticsShim setDelegate:](v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_netDiags, a3);
    v5 = v7;
  }

}

- (NetDiagnosticsShim)netDiags
{
  NetDiagnosticsShim *netDiags;
  NetDiagnosticsShim *v4;
  void *v5;
  void *v6;
  void *v7;
  NetDiagnosticsShim *v8;

  netDiags = self->_netDiags;
  if (!netDiags)
  {
    v4 = [NetDiagnosticsShim alloc];
    -[NetworkDiagnosticsReportGenerator options](self, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("taskName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticReportGenerator queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NetDiagnosticsShim initWithTaskName:queue:](v4, "initWithTaskName:queue:", v6, v7);
    -[NetworkDiagnosticsReportGenerator setNetDiags:](self, "setNetDiags:", v8);

    netDiags = self->_netDiags;
  }
  return netDiags;
}

- (BOOL)startNetDiagnosticsTaskWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[NetworkDiagnosticsReportGenerator netDiags](self, "netDiags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__NetworkDiagnosticsReportGenerator_startNetDiagnosticsTaskWithReply___block_invoke;
  v10[3] = &unk_1EA3B7320;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v5, "startNetDiagnosticTaskWithOptions:reply:", v6, v10);

  return v8;
}

void __70__NetworkDiagnosticsReportGenerator_startNetDiagnosticsTaskWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagTaskFilePath[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filepaths"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v23;
      if (v23)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v24)
        {
          v25 = v24;
          v39 = a1;
          v40 = v7;
          v26 = 0;
          v27 = *(_QWORD *)v42;
          do
          {
            v28 = 0;
            v29 = v26;
            do
            {
              if (*(_QWORD *)v42 != v27)
                objc_enumerationMutation(v10);
              v26 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v28);

              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v26);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "absoluteString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v31);

              ++v28;
              v29 = v26;
            }
            while (v25 != v28);
            v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v25);

          v7 = v40;
          a1 = v39;
          v8 = 0x1E0CB3000;
        }
      }
    }

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("attachments"));
    objc_msgSend(*(id *)(v8 + 2368), "stringWithUTF8String:", kNetDiagStatus[0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    if (!v17)
    {
      v32 = *(_QWORD *)(a1 + 32);
      if (v32)
        (*(void (**)(uint64_t, id, _QWORD))(v32 + 16))(v32, v11, 0);
      goto LABEL_29;
    }
    if (v17 == -1)
    {
      v18 = *(_QWORD *)(a1 + 32);
      if (!v18)
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, &unk_1EA3CFA00);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);
    }
    else
    {
      diagreportLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v48 = v17;
        _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "Unknown kNetDiagStatus %lld\n", buf, 0xCu);
      }

      v34 = *(_QWORD *)(a1 + 32);
      if (!v34)
        goto LABEL_29;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2FE0];
      v45 = CFSTR("error");
      objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("Unknown kNetDiagStatus %lld\n"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 5, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, v38);

    }
    goto LABEL_29;
  }
  if (v6)
  {
    diagreportLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = (uint64_t)v21;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v22 = *(_QWORD *)(a1 + 32);
    if (v22)
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v7);
  }
LABEL_30:

}

- (BOOL)startReportGeneration
{
  NetworkDiagnosticsReportGenerator *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSDate *reportStart;
  id v7;
  _QWORD v9[4];
  id v10;
  NetworkDiagnosticsReportGenerator *v11;

  v2 = self;
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("taskName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiagnosticReportGenerator setReportGenerated:](v2, "setReportGenerated:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  reportStart = v2->_reportStart;
  v2->_reportStart = (NSDate *)v5;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__NetworkDiagnosticsReportGenerator_startReportGeneration__block_invoke;
  v9[3] = &unk_1EA3B7348;
  v10 = v4;
  v11 = v2;
  v7 = v4;
  LOBYTE(v2) = -[NetworkDiagnosticsReportGenerator startNetDiagnosticsTaskWithReply:](v2, "startNetDiagnosticsTaskWithReply:", v9);

  return (char)v2;
}

void __58__NetworkDiagnosticsReportGenerator_startReportGeneration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (!v6)
      goto LABEL_21;
    diagreportLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v11;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Start task %@ failed with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_20:
      objc_msgSend(*(id *)(a1 + 40), "setNetDiags:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setDiagCase:", 0);

      goto LABEL_21;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("reportStart"));
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("reportCreator"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("reportEnd"));

    objc_msgSend(v14, "setObject:forKey:", CFSTR("Error"), CFSTR("reportEndStatus"));
    objc_msgSend(v7, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v7, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "userInfo");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = &stru_1EA3B8F58;
      if (v24)
        v26 = (const __CFString *)v24;
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Error Domain: %@ Error Code: %ld %@"), v22, v23, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("Error"));

    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(*(id *)(a1 + 40), "completionHandler");
      v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v28)[2](v28, v14, v7);

      objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:", 0);
    }
    else
    {
      objc_msgSend(v12, "reportGeneratorEnded:reportInfo:error:", *(_QWORD *)(a1 + 40), v14, v7);
    }

    goto LABEL_20;
  }
  diagreportLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v30 = v9;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Started task %@ with info: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setNetDiagsResults:", v5);
LABEL_21:

}

- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NetworkDiagnosticsReportGenerator options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("taskName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "isEqualToString:", v8);
  if (a4 == 3 && v9)
  {
    diagreportLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[NetworkDiagnosticsReportGenerator netDiagsResults](self, "netDiagsResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "%@ changed to ending. Signaling completion with results %@", (uint8_t *)&v24, 0x16u);

    }
    -[DiagnosticReportGenerator delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticReportGenerator completionHandler](self, "completionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = 1;
    else
      v14 = objc_opt_respondsToSelector();

    -[NetworkDiagnosticsReportGenerator netDiagsResults](self, "netDiagsResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && (v14 & 1) != 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "setObject:forKey:", self->_reportStart, CFSTR("reportStart"));
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("reportCreator"));

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("reportEnd"));

      objc_msgSend(v16, "setObject:forKey:", CFSTR("Success"), CFSTR("reportEndStatus"));
      -[NetworkDiagnosticsReportGenerator netDiagsResults](self, "netDiagsResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("attachments"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("attachments"));

      -[DiagnosticReportGenerator setReportGenerated:](self, "setReportGenerated:", 1);
      -[DiagnosticReportGenerator completionHandler](self, "completionHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[DiagnosticReportGenerator completionHandler](self, "completionHandler");
        v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v23)[2](v23, v16, 0);

        -[DiagnosticReportGenerator setCompletionHandler:](self, "setCompletionHandler:", 0);
      }
      else
      {
        objc_msgSend(v12, "reportGeneratorEnded:reportInfo:error:", self, v16, 0);
      }
      -[NetworkDiagnosticsReportGenerator setNetDiagsResults:](self, "setNetDiagsResults:", 0);

    }
    -[NetworkDiagnosticsReportGenerator setNetDiags:](self, "setNetDiags:", 0);
    -[DiagnosticReportGenerator setDiagCase:](self, "setDiagCase:", 0);

  }
}

- (id)createDefaultTaskDictionaryWithTaskName:(const char *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("taskName"));

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "logArchivePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("filename"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "logArchiveUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("taskFileUserID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "logArchiveGID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("taskFileGroupID"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA3CFCF0, CFSTR("taskFileMode"));
  return v4;
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSDictionary)netDiagsResults
{
  return self->_netDiagsResults;
}

- (void)setNetDiagsResults:(id)a3
{
  objc_storeStrong((id *)&self->_netDiagsResults, a3);
}

- (NSDate)reportStart
{
  return self->_reportStart;
}

- (void)setReportStart:(id)a3
{
  objc_storeStrong((id *)&self->_reportStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportStart, 0);
  objc_storeStrong((id *)&self->_netDiagsResults, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_netDiags, 0);
}

@end

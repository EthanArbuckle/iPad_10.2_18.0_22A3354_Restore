@implementation DiagnosticReportGenerator

- (DiagnosticReportGenerator)initWithQueue:(id)a3
{
  id v5;
  DiagnosticReportGenerator *v6;
  DiagnosticReportGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DiagnosticReportGenerator;
  v6 = -[DiagnosticReportGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4
{
  return -[DiagnosticReportGenerator generateReportForCase:reportName:completion:](self, "generateReportForCase:reportName:completion:", a3, a4, 0);
}

- (BOOL)generateReportForCase:(id)a3 reportName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  double v16;
  dispatch_time_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v35;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  diagreportLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "caseId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = v12;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Generating a report for case ID %@, desired report file name %@", buf, 0x16u);

  }
  -[DiagnosticReportGenerator setDiagCase:](self, "setDiagCase:", v8);
  if (v10)
    -[DiagnosticReportGenerator setCompletionHandler:](self, "setCompletionHandler:", v10);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticReportGenerator delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DiagnosticReportGenerator startReportGeneration](self, "startReportGeneration");
  if (v15)
  {
    -[DiagnosticReportGenerator timeoutSeconds](self, "timeoutSeconds");
    v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    -[DiagnosticReportGenerator queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__DiagnosticReportGenerator_generateReportForCase_reportName_completion___block_invoke;
    block[3] = &unk_1EA3B4BB8;
    block[4] = self;
    v39 = v13;
    v40 = v14;
    dispatch_after(v17, v18, block);

  }
  else
  {
    v35 = v14;
    v36 = v9;
    v37 = v8;
    diagreportLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_INFO, "report generation did not start", buf, 2u);
    }

    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v20, "setObject:forKey:", v13, CFSTR("reportStart"));
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("reportCreator"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("reportEnd"));

    objc_msgSend(v20, "setObject:forKey:", CFSTR("Error"), CFSTR("reportEndStatus"));
    objc_msgSend(v20, "setObject:forKey:", CFSTR("Failed to start report generation."), CFSTR("reportError"));
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2FE0];
    v41 = CFSTR("error");
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ failed to start"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 5, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[DiagnosticReportGenerator completionHandler](self, "completionHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[DiagnosticReportGenerator completionHandler](self, "completionHandler");
      v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v33)[2](v33, v20, v31);

      -[DiagnosticReportGenerator setCompletionHandler:](self, "setCompletionHandler:", 0);
      v9 = v36;
      v8 = v37;
      v14 = v35;
    }
    else
    {
      v14 = v35;
      v9 = v36;
      v8 = v37;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v35, "reportGeneratorEnded:reportInfo:error:", self, v20, v31);
    }
    -[DiagnosticReportGenerator setDiagCase:](self, "setDiagCase:", 0);

  }
  return v15;
}

void __73__DiagnosticReportGenerator_generateReportForCase_reportName_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[8];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "reportGenerated") & 1) == 0)
  {
    diagreportLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "report generator timed out.", buf, 2u);
    }

    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("reportStart"));
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("reportCreator"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("reportEnd"));

    objc_msgSend(v3, "setObject:forKey:", CFSTR("Timeout"), CFSTR("reportEndStatus"));
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2FE0];
    v18 = CFSTR("error");
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ timed out"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 60, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v16)[2](v16, v3, v14);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "reportGeneratorEnded:reportInfo:error:", *(_QWORD *)(a1 + 32), v3, v14);
    }
    objc_msgSend(*(id *)(a1 + 32), "setDiagCase:", 0);

  }
}

- (BOOL)startReportGeneration
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (BOOL)reportGenerated
{
  return self->_reportGenerated;
}

- (void)setReportGenerated:(BOOL)a3
{
  self->_reportGenerated = a3;
}

- (DiagnosticReportGeneratorDelegate)delegate
{
  return (DiagnosticReportGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DiagnosticCase)diagCase
{
  return self->_diagCase;
}

- (void)setDiagCase:(id)a3
{
  objc_storeStrong((id *)&self->_diagCase, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_diagCase, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

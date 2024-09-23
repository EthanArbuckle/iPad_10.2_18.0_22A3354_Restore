@implementation EFAutoBugCaptureReporter

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EFAutoBugCaptureReporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __31__EFAutoBugCaptureReporter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

+ (EFAutoBugCaptureReporter)sharedReporter
{
  if (sharedReporter_onceToken != -1)
    dispatch_once(&sharedReporter_onceToken, &__block_literal_global_0);
  return (EFAutoBugCaptureReporter *)(id)sharedReporter_sDiagnosticReporter;
}

void __42__EFAutoBugCaptureReporter_sharedReporter__block_invoke()
{
  EFAutoBugCaptureReporter *v0;
  void *v1;

  v0 = objc_alloc_init(EFAutoBugCaptureReporter);
  v1 = (void *)sharedReporter_sDiagnosticReporter;
  sharedReporter_sDiagnosticReporter = (uint64_t)v0;

}

- (EFAutoBugCaptureReporter)init
{
  EFAutoBugCaptureReporter *v2;
  uint64_t v3;
  SDRDiagnosticReporter *diagnosticReporter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EFAutoBugCaptureReporter;
  v2 = -[EFAutoBugCaptureReporter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAFF28]), "initWithQueue:", 0);
    diagnosticReporter = v2->_diagnosticReporter;
    v2->_diagnosticReporter = (SDRDiagnosticReporter *)v3;

  }
  return v2;
}

- (void)reportIssueType:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInternal") & 1) != 0)
  {

  }
  else
  {
    v9 = EFIsSeedBuild();

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  +[EFAutoBugCaptureReporter log](EFAutoBugCaptureReporter, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[EFAutoBugCaptureReporter reportIssueType:description:].cold.1((uint64_t)v7, v10);

LABEL_7:
  -[EFAutoBugCaptureReporter diagnosticReporter](self, "diagnosticReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("MobileMail"), v6, v7, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFAutoBugCaptureReporter diagnosticReporter](self, "diagnosticReporter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke;
  v17[3] = &unk_1E62A5A80;
  v16 = v7;
  v18 = v16;
  objc_msgSend(v15, "snapshotWithSignature:duration:event:payload:reply:", v14, 0, 0, v17, 0.0);

}

void __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EFAutoBugCaptureReporter log](EFAutoBugCaptureReporter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke_cold_1((uint64_t)v3, a1, v4);

}

- (SDRDiagnosticReporter)diagnosticReporter
{
  return self->_diagnosticReporter;
}

- (void)setDiagnosticReporter:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticReporter, 0);
}

- (void)reportIssueType:(uint64_t)a1 description:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1B106E000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter response = %@, issue = %@", (uint8_t *)&v4, 0x16u);
}

@end

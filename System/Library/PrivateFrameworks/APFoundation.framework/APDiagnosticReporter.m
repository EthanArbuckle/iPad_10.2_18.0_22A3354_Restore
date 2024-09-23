@implementation APDiagnosticReporter

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(id, _QWORD);
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int isRunningTests;
  BOOL v25;
  objc_super v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0CB3898];
  v16 = (void (**)(id, _QWORD))a7;
  objc_msgSend_processInfo(v15, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v20, v21, v22, v23);

  if (isRunningTests)
  {
    v16[2](v16, MEMORY[0x1E0C9AA70]);
    v25 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)APDiagnosticReporter;
    v25 = -[SDRDiagnosticReporter snapshotWithSignature:duration:event:payload:reply:](&v27, sel_snapshotWithSignature_duration_event_payload_reply_, v12, v13, v14, v16, a4);
  }

  return v25;
}

@end

@implementation ACDAutoBugCapture

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 detectedProcess:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__onceToken != -1)
    dispatch_once(&triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__onceToken, &__block_literal_global_13);
  v13 = (void *)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter;
  if (v12)
  {
    objc_msgSend((id)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Accounts"), v9, v10, v11, v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Accounts"), v9, v10, v11, v16, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = objc_msgSend((id)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter, "snapshotWithSignature:duration:event:payload:reply:", v14, 0, 0, &__block_literal_global_14_0, 15.0);
  _ACDLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v17 & 1) != 0)
  {
    if (v19)
    {
      v21 = 138412290;
      v22 = v14;
      v20 = "\"Diagnostic Reporter sent snapshot for signature %@\";
LABEL_11:
      _os_log_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v21, 0xCu);
    }
  }
  else if (v19)
  {
    v21 = 138412290;
    v22 = v14;
    v20 = "\"Diagnostic Reporter failed to send snapshot for signature %@\";
    goto LABEL_11;
  }

}

void __90__ACDAutoBugCapture_triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BEB3478]);
  v1 = (void *)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter;
  triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter = (uint64_t)v0;

}

void __90__ACDAutoBugCapture_triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Received response from Diagnostic Reporter - %@\", (uint8_t *)&v4, 0xCu);
  }

}

@end

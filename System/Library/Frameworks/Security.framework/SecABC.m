@implementation SecABC

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4
{
  objc_msgSend(a1, "triggerAutoBugCaptureWithType:subType:subtypeContext:domain:events:payload:detectedProcess:", a3, a4, 0, CFSTR("com.apple.security.keychain"), 0, 0, 0);
}

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 domain:(id)a6 events:(id)a7 payload:(id)a8 detectedProcess:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v27 = a7;
  v18 = a8;
  v19 = a9;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    v37 = v16;
    _os_log_impl(&dword_18A900000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "TriggerABC for %{public}@/%{public}@/%{public}@", buf, 0x20u);
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v20 = (void *)getSDRDiagnosticReporterClass_softClass;
  v35 = getSDRDiagnosticReporterClass_softClass;
  if (!getSDRDiagnosticReporterClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
    v37 = &unk_1E1FD8CF0;
    v38 = &v32;
    __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
    v20 = (void *)v33[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v32, 8);
  if (v21)
  {
    v22 = objc_alloc_init(v21);
    v23 = v22;
    if (v19)
    {
      objc_msgSend(v22, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v17, v14, v15, v16, v19, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "processName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v17, v14, v15, v16, v26, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v24)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __101__SecABC_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess___block_invoke;
      v28[3] = &unk_1E1FCD810;
      v29 = v14;
      v30 = v15;
      v31 = v16;
      objc_msgSend(v23, "snapshotWithSignature:delay:events:payload:actions:reply:", v24, v27, v18, 0, v28, 5.0);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A900000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "TriggerABC signature generation failed", buf, 2u);
    }

  }
}

void __101__SecABC_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v7 = 138544130;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = a2;
    _os_log_impl(&dword_18A900000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received response from Diagnostic Reporter - %{public}@/%{public}@/%{public}@: %{public}@", (uint8_t *)&v7, 0x2Au);
  }
}

@end

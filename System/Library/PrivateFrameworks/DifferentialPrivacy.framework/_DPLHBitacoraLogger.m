@implementation _DPLHBitacoraLogger

+ (BOOL)donateEventToBitacoraForKey:(id)a3 eventPhase:(int)a4 uuid:(id)a5 succeeded:(BOOL)a6 errorCode:(int)a7 errorMessage:(id)a8 telemetryAllowed:(BOOL)a9
{
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = *(_QWORD *)&a7;
  v11 = a6;
  v13 = *(_QWORD *)&a4;
  v15 = a3;
  v16 = a5;
  v17 = a8;
  if (a9 && (objc_msgSend(v15, "hasPrefix:", CFSTR("fedstats:com.apple.insights.telemetry")) & 1) == 0)
  {
    objc_msgSend(a1, "trialIdentifiersForKey:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(a1, "bitacoraDprivacydEventWithEventPhase:uuid:succeeded:errorCode:errorMessage:", v13, v16, v11, v10, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2050000000;
        v21 = (void *)getLBFEventManagerClass_softClass;
        v32 = getLBFEventManagerClass_softClass;
        if (!getLBFEventManagerClass_softClass)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __getLBFEventManagerClass_block_invoke;
          v28[3] = &unk_1E95D9668;
          v28[4] = &v29;
          __getLBFEventManagerClass_block_invoke((uint64_t)v28);
          v21 = (void *)v30[3];
        }
        v22 = objc_retainAutorelease(v21);
        _Block_object_dispose(&v29, 8);
        objc_msgSend(v22, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v18 = objc_msgSend(v23, "addDprivacydEvent:identifiers:error:", v20, v19, &v27);
        v24 = v27;
        if ((v18 & 1) == 0)
        {
          +[_DPLog framework](_DPLog, "framework");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:].cold.1((uint64_t)v15, v24, v25);

        }
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)trialIdentifiersForKey:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 > 4)
  {
    v8 = v5;
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5 - 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v10 = v8 - 2;
    objc_msgSend(v4, "objectAtIndexedSubscript:", v8 - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberFromString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v12, "intValue");
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8 - 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v15 = (void *)getLBFTrialIdentifiersClass_softClass;
      v23 = getLBFTrialIdentifiersClass_softClass;
      if (!getLBFTrialIdentifiersClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getLBFTrialIdentifiersClass_block_invoke;
        v25 = &unk_1E95D9668;
        v26 = &v20;
        __getLBFTrialIdentifiersClass_block_invoke((uint64_t)buf);
        v15 = (void *)v21[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v20, 8);
      v17 = [v16 alloc];
      v7 = (void *)objc_msgSend(v17, "initWithExperimentID:deploymentID:treatmentID:", v6, v13, v14, v20);
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v3;
        _os_log_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_INFO, "Skipping donation to Bitacora; malformed Trial deployment ID %@ for collection ID %@. Deployment ID must be an integer",
          buf,
          0x16u);

      }
      v7 = 0;
    }

  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 5;
      _os_log_impl(&dword_1D3FAA000, v6, OS_LOG_TYPE_INFO, "Skipping donation to Bitacora; malformed collection ID %@. The number of colon separated components is less than %ld",
        buf,
        0x16u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)bitacoraDprivacydEventWithEventPhase:(int)a3 uuid:(id)a4 succeeded:(BOOL)a5 errorCode:(int)a6 errorMessage:(id)a7
{
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  objc_class *v38;
  void *v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v9 = a5;
  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v19 = (__CFString *)a7;
  if (!(_DWORD)v10)
  {
    +[_DPLog framework](_DPLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_DPLHBitacoraLogger bitacoraDprivacydEventWithEventPhase:uuid:succeeded:errorCode:errorMessage:].cold.1(v20, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_8;
  }
  if (!a6 && !v9)
  {
    +[_DPLog framework](_DPLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_DPLHBitacoraLogger bitacoraDprivacydEventWithEventPhase:uuid:succeeded:errorCode:errorMessage:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_8:
    v35 = 0;
    goto LABEL_19;
  }
  if (a6 || !v9)
  {
    if (v19)
      v36 = v19;
    else
      v36 = &stru_1E95DA470;
    +[_DPDediscoError errorWithCode:description:](_DPDediscoError, "errorWithCode:description:", a6, v36);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v37 = (void *)getLBFDprivacydEventClass_softClass;
  v45 = getLBFDprivacydEventClass_softClass;
  if (!getLBFDprivacydEventClass_softClass)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __getLBFDprivacydEventClass_block_invoke;
    v41[3] = &unk_1E95D9668;
    v41[4] = &v42;
    __getLBFDprivacydEventClass_block_invoke((uint64_t)v41, v12, v13, v14, v15, v16, v17, v18, v40);
    v37 = (void *)v43[3];
  }
  v38 = objc_retainAutorelease(v37);
  _Block_object_dispose(&v42, 8);
  v35 = (void *)objc_msgSend([v38 alloc], "initWithEventPhase:eventUUID:succeeded:error:", v10, v11, v9, v20);
LABEL_19:

  return v35;
}

+ (void)donateEventToBitacoraForKey:(NSObject *)a3 eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D3FAA000, a3, OS_LOG_TYPE_ERROR, "Failed to donate to Bitacora for key %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

+ (void)bitacoraDprivacydEventWithEventPhase:(uint64_t)a3 uuid:(uint64_t)a4 succeeded:(uint64_t)a5 errorCode:(uint64_t)a6 errorMessage:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Failed to donate to Bitacora; event phase is unknown",
    a5,
    a6,
    a7,
    a8,
    0);
}

+ (void)bitacoraDprivacydEventWithEventPhase:(uint64_t)a3 uuid:(uint64_t)a4 succeeded:(uint64_t)a5 errorCode:(uint64_t)a6 errorMessage:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Failed to donate to Bitacora; event is not succeeded but no error code provided",
    a5,
    a6,
    a7,
    a8,
    0);
}

@end

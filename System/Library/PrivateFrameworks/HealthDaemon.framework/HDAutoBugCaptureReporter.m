@implementation HDAutoBugCaptureReporter

- (HDAutoBugCaptureReporter)initWithDaemon:(id)a3
{
  id v4;
  HDAutoBugCaptureReporter *v5;
  HDAutoBugCaptureReporter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDAutoBugCaptureReporter;
  v5 = -[HDAutoBugCaptureReporter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_daemon, v4);

  return v6;
}

- (void)reportQueryDurationWithServer:(id)a3 dataCount:(int64_t)a4 duration:(double)a5
{
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%lld,%lf"), a4, *(_QWORD *)&a5);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "process");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKQuery"), CFSTR("Duration"), v11, v14, v15);

}

- (void)_reportSnapshotWithType:(void *)a3 subType:(void *)a4 context:(void *)a5 processIdentifier:(void *)a6 thresholdValues:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    v15 = _Block_copy(*(const void **)(a1 + 16));
    v16 = v15;
    if (v15)
    {
      (*((void (**)(void *, uint64_t, id, id, id, id, id))v15 + 2))(v15, a1, v19, v11, v12, v13, v14);
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
      objc_msgSend(v17, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("HealthKit"), v19, v11, v12, v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "snapshotWithSignature:duration:event:payload:reply:", v18, 0, 0, &__block_literal_global_186, 0.0);

    }
  }

}

- (void)reportDatabaseMigrationFailureWithContext:(id)a3
{
  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKDatabase"), CFSTR("Migration"), a3, (void *)*MEMORY[0x1E0CB76B8], 0);
}

- (void)reportCorruptionForDatabase:(id)a3 resultCode:(int)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), a3, *(_QWORD *)&a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKDatabase"), CFSTR("Corruption"), v5, (void *)*MEMORY[0x1E0CB76B8], 0);

}

- (void)reportDataCollectionSeriesProblem:(id)a3 quantityType:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKDataCollection"), CFSTR("Series"), v9, (void *)*MEMORY[0x1E0CB76B8], 0);
}

+ (void)reportNotFinalSeriesSampleWithClass:(Class)a3 count:(int64_t)a4 datumCount:(int64_t)a5 reason:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDAutoBugCaptureReporter *v14;

  v9 = a6;
  v14 = objc_alloc_init(HDAutoBugCaptureReporter);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld,%ld"), a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)v14, CFSTR("HKDatabase"), CFSTR("Series"), v13, (void *)*MEMORY[0x1E0CB76B8], v10);
}

- (void)reportSummarySharingInvitationFailureForOperation:(id)a3 error:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v7, "code");

  objc_msgSend(v10, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@-%@"), v8, v9, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKSummarySharing"), CFSTR("Invitation"), v13, (void *)*MEMORY[0x1E0CB76B8], 0);
}

- (void)reportMissingSource:(id)a3 duringSyncFromStore:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  if (v11)
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld-%ld-%@"), objc_msgSend(v11, "syncStoreType"), (int)objc_msgSend(v11, "protocolVersion"), v7);
  else
    objc_msgSend(v6, "stringWithFormat:", CFSTR("NoStore-%@"), v7, v9, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKSync"), CFSTR("MissingSource"), v8, (void *)*MEMORY[0x1E0CB76B8], 0);
}

- (void)reportApplyDataFailure:(Class)a3 duringSyncFromStore:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D297C0]) && objc_msgSend(v8, "code") == 2
    || (objc_msgSend(v8, "hk_isDuplicateObjectError") & 1) != 0
    || (objc_msgSend(v8, "hk_isTransactionInterruptedError") & 1) != 0
    || (objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 123) & 1) != 0)
  {
    goto LABEL_8;
  }
  v10 = objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 100);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_msgSend(v17, "syncStoreType");
    v13 = (int)objc_msgSend(v17, "protocolVersion");
    NSStringFromClass(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%ld-%ld-%@ error: %@-%@"), v12, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKSync"), CFSTR("ApplyDataFailure"), v9, (void *)*MEMORY[0x1E0CB76B8], 0);
LABEL_8:

  }
}

- (void)reportJournalFailureWithErrorDescription:(id)a3 provenance:(id)a4 error:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;

  v17 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D297C0]) && objc_msgSend(v9, "code") == 2
    || (objc_msgSend(v9, "hk_isTransactionInterruptedError") & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "hk_isHealthKitErrorWithCode:", 123);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_1E6D11BB8;
    if (v8)
      v16 = v8;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v17, v13, v14, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDAutoBugCaptureReporter _reportSnapshotWithType:subType:context:processIdentifier:thresholdValues:]((uint64_t)self, CFSTR("HKDatabase"), CFSTR("ApplyDataFailure"), v10, (void *)*MEMORY[0x1E0CB76B8], 0);
    goto LABEL_8;
  }
LABEL_9:

}

void __102__HDAutoBugCaptureReporter__reportSnapshotWithType_subType_context_processIdentifier_thresholdValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  int v21;
  _DWORD v22[7];

  *(_QWORD *)&v22[5] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogAnalytics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      *(_QWORD *)v22 = v5;
      v7 = "Diagnostic reporter snapshot accepted with sessionID %@";
      v8 = v6;
      v9 = 12;
LABEL_17:
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v21, v9);
    }
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0090]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0098]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DAFFA0];
    v13 = *MEMORY[0x1E0DAFFA8];
    v14 = *MEMORY[0x1E0DAFF98];
    v15 = *MEMORY[0x1E0DAFFC0];
    _HKInitializeLogging();
    HKLogAnalytics();
    v16 = objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v12 == v11 || v13 == v11 || v14 == v11 || v15 == v11)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 67109378;
        v22[0] = v11;
        LOWORD(v22[1]) = 2112;
        *(_QWORD *)((char *)&v22[1] + 2) = v5;
        v7 = "Diagnostic reporter snapshot rejected with expected reason %d (%@)";
        v8 = v6;
        v9 = 18;
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 67109378;
      v22[0] = v11;
      LOWORD(v22[1]) = 2112;
      *(_QWORD *)((char *)&v22[1] + 2) = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Diagnostic reporter snapshot rejected with unexpected reason %d (%@)", (uint8_t *)&v21, 0x12u);
    }
  }

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (id)unitTesting_didReportHandler
{
  return self->_unitTesting_didReportHandler;
}

- (void)setUnitTesting_didReportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didReportHandler, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end

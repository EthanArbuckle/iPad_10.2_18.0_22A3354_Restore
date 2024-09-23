@implementation HDDatabaseCorruptionTTRPrompter

- (HDDatabaseCorruptionTTRPrompter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDatabaseCorruptionTTRPrompter)initWithStore:(id)a3 behavior:(id)a4
{
  id v7;
  id v8;
  HDDatabaseCorruptionTTRPrompter *v9;
  HDDatabaseCorruptionTTRPrompter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDatabaseCorruptionTTRPrompter;
  v9 = -[HDDatabaseCorruptionTTRPrompter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_corruptionStore, a3);
    objc_storeStrong((id *)&v10->_behavior, a4);
  }

  return v10;
}

- (id)TTRAttemptRecordForProfile:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HKBehavior currentOSBuild](self->_behavior, "currentOSBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldAttemptTTRForProfileIdentier:(id)a3 component:(int64_t)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[_HKBehavior isAppleInternalInstall](self->_behavior, "isAppleInternalInstall")
    && (-[_HKBehavior isTestingDevice](self->_behavior, "isTestingDevice") & 1) == 0)
  {
    -[HDDatabaseCorruptionTTRPrompter TTRAttemptRecordForProfile:](self, "TTRAttemptRecordForProfile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDatabaseCorruptionEventStore mostRecentTTRAttemptForProfileIdentifier:component:](self->_corruptionStore, "mostRecentTTRAttemptForProfileIdentifier:component:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == v8)
    {
      LOBYTE(v7) = 0;
    }
    else if (v8)
    {
      v7 = objc_msgSend(v9, "isEqualToString:", v8) ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)promptForEvent:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  HDDatabaseCorruptionEventStore *corruptionStore;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  HDDatabaseCorruptionTTRPrompter *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDDatabaseCorruptionTTRPrompter shouldAttemptTTRForProfileIdentier:component:](self, "shouldAttemptTTRForProfileIdentier:component:", v5, objc_msgSend(v4, "component"));

  if (v6)
  {
    do
      v7 = __ldaxr(_isPresenting);
    while (__stlxr(1u, _isPresenting));
    if ((v7 & 1) == 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      HDStringFromDatabaseComponentIdentifier(objc_msgSend(v4, "component"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Database corruption in %@: %@"), v9, v10);

      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v29, "code");
      objc_msgSend(v4, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "buildDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HDStringFromDatabaseComponentIdentifier(objc_msgSend(v4, "component"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "profileIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@\n\nError(%@, %ld):\n%@\n\nBuild:%@\nComponent:%@\nProfile:%@\nDate:%@\n"), v31, v11, v12, v14, v15, v16, v17, v18);

      objc_msgSend(v4, "failedObliterationReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "failedObliterationReason");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("\n\n*** Resulted from failed obliteration attempt for reason <%@>"), v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v22;
      }
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v19;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: present database corruption alert %{public}@", buf, 0x16u);
      }
      -[HDDatabaseCorruptionTTRPrompter _popAlertWithRadarDescription:](self, "_popAlertWithRadarDescription:", v19);
      corruptionStore = self->_corruptionStore;
      objc_msgSend(v4, "profileIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDatabaseCorruptionTTRPrompter TTRAttemptRecordForProfile:](self, "TTRAttemptRecordForProfile:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "profileIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDatabaseCorruptionEventStore persistTTRAttempt:forProfileIdentifier:component:](corruptionStore, "persistTTRAttempt:forProfileIdentifier:component:", v26, v27, objc_msgSend(v4, "component"));

    }
  }

}

- (void)_popAlertWithRadarDescription:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (_HDIsUnitTesting)
  {
    v5 = _Block_copy(self->_unitTest_willPresentTTRAlertHandler);
    v6 = v5;
    if (v5)
      (*((void (**)(void *, HDDatabaseCorruptionTTRPrompter *, id))v5 + 2))(v5, self, v4);
    atomic_store(0, _isPresenting);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D298D0]);
    objc_msgSend(v6, "setTitle:", CFSTR("Corrupt Health Database"));
    objc_msgSend(v6, "setMessage:", CFSTR("Corruption has been detected in your Health database. Please file a radar with Tap-to-Radar against 'Health' and attach your Health database directory. Instructions at https://at.apple.com/CaptureHealthDB"));
    objc_msgSend(v6, "setDefaultButton:", CFSTR("Tap-to-Radar"));
    objc_msgSend(v6, "setCancelButton:", CFSTR("Not Now"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke;
    v7[3] = &unk_1E6CEEA08;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "presentWithResponseHandler:", v7);

  }
}

void __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3 == 1)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Not Now' button pressed", buf, 0xCu);
    }
  }
  else if (!a3)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Tap-to-Radar' button pressed", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", CFSTR("Corrupt Health Database"), *(_QWORD *)(a1 + 40), 2, 6, &unk_1E6DF8B28, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:configuration:completionHandler:", v11, 0, &__block_literal_global_43);

  }
  atomic_store(0, _isPresenting);

}

void __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke_206(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (id)unitTest_willPresentTTRAlertHandler
{
  return self->_unitTest_willPresentTTRAlertHandler;
}

- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_willPresentTTRAlertHandler, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_corruptionStore, 0);
}

@end

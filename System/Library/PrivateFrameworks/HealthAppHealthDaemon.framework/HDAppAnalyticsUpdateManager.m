@implementation HDAppAnalyticsUpdateManager

- (HDAppAnalyticsUpdateManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDAppAnalyticsUpdateManager)initWithProfile:(id)a3
{
  id v4;
  HDAppAnalyticsUpdateManager *v5;
  HDAppAnalyticsUpdateManager *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDAppAnalyticsUpdateManager;
  v5 = -[HDAppAnalyticsUpdateManager init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postInstallUpdateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerUpdateTaskHandler:queue:", v6, 0);

  }
  return v6;
}

- (BOOL)setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  HDAppAnalyticsUpdateManager *v28;
  _QWORD v29[5];
  id v30;
  int64_t v31;
  BOOL v32;
  id v33;

  v12 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v33 = 0;
  +[HDAppAnalyticsAcceptanceEntity acceptanceForAgreement:version:transaction:error:](HDAppAnalyticsAcceptanceEntity, "acceptanceForAgreement:version:transaction:error:", v14, a5, v16, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v33;
  v19 = v18;
  if (v17)
    v20 = 1;
  else
    v20 = v18 == 0;
  if (!v20)
  {
    if (a8)
    {
      v26 = 0;
      *a8 = objc_retainAutorelease(v18);
      goto LABEL_14;
    }
    _HKLogDroppedError();
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
  v28 = self;
  objc_msgSend(v17, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  v23 = v22;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v25 = v24;

  if (v23 < v25)
  {
    if (!+[HDAppAnalyticsAcceptanceEntity setAcceptance:agreement:version:modificationDate:transaction:error:](HDAppAnalyticsAcceptanceEntity, "setAcceptance:agreement:version:modificationDate:transaction:error:", v12, v14, a5, v15, v16, a8))goto LABEL_13;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __96__HDAppAnalyticsUpdateManager_setAccepted_agreement_version_modificationDate_transaction_error___block_invoke;
    v29[3] = &unk_250E7E370;
    v29[4] = v28;
    v30 = v14;
    v31 = a5;
    v32 = v12;
    objc_msgSend(v16, "onCommit:orRollback:", v29, 0);

  }
  v26 = 1;
LABEL_14:

  return v26;
}

uint64_t __96__HDAppAnalyticsUpdateManager_setAccepted_agreement_version_modificationDate_transaction_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateExternalStorageForAgreement:version:accepted:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)updateExternalStorageForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE3F7F0]))
  {
    if (-[HDAppAnalyticsUpdateManager currentVersionImproveHealthAgreement](self, "currentVersionImproveHealthAgreement") == a4)
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBoolValue:forSetting:", v5, *MEMORY[0x24BE63958]);
LABEL_10:

    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE3F7F8]))
  {
    if (-[HDAppAnalyticsUpdateManager currentVersionImproveHealthRecords](self, "currentVersionImproveHealthRecords") == a4)
    {
      if (v5)
        v10 = a4;
      else
        v10 = *MEMORY[0x24BDD2F48];
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInteger:forKey:", v10, *MEMORY[0x24BDD46E0]);
      goto LABEL_10;
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      -[HDAppAnalyticsUpdateManager updateExternalStorageForAgreement:version:accepted:].cold.1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (int64_t)currentVersionForAgreement:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE3F7F0]))
  {
    v5 = -[HDAppAnalyticsUpdateManager currentVersionImproveHealthAgreement](self, "currentVersionImproveHealthAgreement");
LABEL_5:
    v6 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE3F7F8]))
  {
    v5 = -[HDAppAnalyticsUpdateManager currentVersionImproveHealthRecords](self, "currentVersionImproveHealthRecords");
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v7 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    -[HDAppAnalyticsUpdateManager currentVersionForAgreement:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
  v6 = 0;
LABEL_9:

  return v6;
}

- (int64_t)currentVersionImproveHealthAgreement
{
  return HKCurrentOptInVersionOnDiskForOnBoardingBundle();
}

- (int64_t)currentVersionImproveHealthRecords
{
  return HKCurrentOptInVersionOnDiskForOnBoardingBundle();
}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = (void (**)(id, uint64_t, id))a4;
  -[HDAppAnalyticsUpdateManager profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40AB0], "contextForReading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = self;
  v12 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HDAppAnalyticsUpdateManager_performPostInstallUpdateTaskForManager_completion___block_invoke;
  v11[3] = &unk_250E7E398;
  v9 = objc_msgSend(v7, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v12, v11, 0);
  v10 = v12;

  v5[2](v5, v9, v10);
}

uint64_t __81__HDAppAnalyticsUpdateManager_performPostInstallUpdateTaskForManager_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  AllHealthAppAnalyticsAgreements();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 138543362;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(*(id *)(a1 + 32), "currentVersionForAgreement:", v9, v16);
        v18 = 0;
        +[HDAppAnalyticsAcceptanceEntity acceptanceForAgreement:version:transaction:error:](HDAppAnalyticsAcceptanceEntity, "acceptanceForAgreement:version:transaction:error:", v9, v10, v3, &v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        v13 = v12;
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "updateExternalStorageForAgreement:version:accepted:", v9, v10, objc_msgSend(v11, "accepted"));
        }
        else if (v12)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x24BDD3070];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v16;
            v24 = v9;
            _os_log_fault_impl(&dword_23DB70000, v14, OS_LOG_TYPE_FAULT, "Failed to retrieve stored version for %{public}@; not updating local state.",
              buf,
              0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  return 1;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)updateExternalStorageForAgreement:(uint64_t)a3 version:(uint64_t)a4 accepted:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23DB70000, a2, a3, "No external storage known for analytics agreement %{public}@", a5, a6, a7, a8, 2u);
}

- (void)currentVersionForAgreement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23DB70000, a2, a3, "Unknown analytics agreement %{public}@", a5, a6, a7, a8, 2u);
}

@end

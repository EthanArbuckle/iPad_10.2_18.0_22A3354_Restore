@implementation HDExampleFeatureProfileExtension

- (HDExampleFeatureProfileExtension)initWithProfile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  HDExampleFeatureProfileExtension *v10;
  void *v11;
  int v12;
  HDOTAFeatureDisableAndExpiryProvider *v13;
  void *v14;
  HDOTAFeatureDisableAndExpiryProvider *v15;
  HDLocalCountrySetAvailabilityProvider *v16;
  void *v17;
  void *v18;
  HDLocalCountrySetAvailabilityProvider *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HDFeatureAvailabilityManager *v25;
  HDFeatureAvailabilityManager *featureAvailabilityManager;
  OS_dispatch_queue *v27;
  OS_dispatch_queue *queue;
  HDNotificationSyncClient *v29;
  HDNotificationSyncClient *notificationSyncClient;
  objc_super v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CB5020];
  v5 = a3;
  HKLogInfrastructure();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v4;
  v9 = v6;
  if (self)
  {
    v32.receiver = self;
    v32.super_class = (Class)HDExampleFeatureProfileExtension;
    v10 = -[HDExampleFeatureProfileExtension init](&v32, sel_init);
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_featureIdentifier, v4);
      objc_storeWeak((id *)&self->_profile, v7);
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAppleInternalInstall");

      if (v12)
      {
        v13 = [HDOTAFeatureDisableAndExpiryProvider alloc];
        objc_msgSend(v7, "daemon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HDOTAFeatureDisableAndExpiryProvider initWithDaemon:featureIdentifier:](v13, "initWithDaemon:featureIdentifier:", v14, v8);

        v16 = [HDLocalCountrySetAvailabilityProvider alloc];
        objc_msgSend(MEMORY[0x1E0CB6538], "emptyCountrySet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "daemon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HDLocalCountrySetAvailabilityProvider initWithFeatureIdentifier:defaultCountrySet:healthDaemon:](v16, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v8, v17, v18);

        v20 = objc_alloc(MEMORY[0x1E0CB66F0]);
        v34 = *MEMORY[0x1E0CB4ED0];
        objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v20, "initWithRequirementsByContext:", v23);

        v25 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:]([HDFeatureAvailabilityManager alloc], "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v7, v8, v24, 1, 0, v19, v15, v9);
        featureAvailabilityManager = self->_featureAvailabilityManager;
        self->_featureAvailabilityManager = v25;

        HKCreateSerialDispatchQueue();
        v27 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
        queue = self->_queue;
        self->_queue = v27;

        v29 = -[HDNotificationSyncClient initWithProfile:clientIdentifier:queue:]([HDNotificationSyncClient alloc], "initWithProfile:clientIdentifier:queue:", v7, v8, self->_queue);
        notificationSyncClient = self->_notificationSyncClient;
        self->_notificationSyncClient = v29;

        -[HDNotificationSyncClient setDelegate:](self->_notificationSyncClient, "setDelegate:", self);
      }
    }
  }

  return self;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  HDFeatureAvailabilityManager *v4;

  if (objc_msgSend(a3, "isEqualToString:", self->_featureIdentifier))
    v4 = self->_featureAvailabilityManager;
  else
    v4 = 0;
  return v4;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  const char *v33;
  os_log_t v34;
  os_log_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  os_log_t v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  HDExampleFeatureProfileExtension *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB5330];
  v8 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKNotificationInstructionAction();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    v47 = 0;
    objc_msgSend(v6, "pendingNotificationDismissInstructionsWithError:", &v47);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v47;
    if (v15)
    {
      objc_msgSend(v15, "categoryIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        objc_msgSend(v14, "userNotificationCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_199;
        v42[3] = &unk_1E6CF6668;
        v43 = v14;
        v44 = v6;
        v45 = v15;
        v46 = self;
        v15 = v15;
        objc_msgSend(v28, "getDeliveredNotificationsWithCompletionHandler:", v42);

        goto LABEL_20;
      }
      _HKInitializeLogging();
      v39 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v36 = v39;
      v40 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v53 = v40;
      v38 = v40;
LABEL_19:
      _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] No valid instructions found", buf, 0xCu);

      goto LABEL_20;
    }
    _HKInitializeLogging();
    v34 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v30 = v34;
      v41 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v53 = v41;
      v54 = 2114;
      v55 = v16;
      v32 = v41;
      v33 = "[%{public}@] Error retrieving dismiss instructions: %{public}@";
      goto LABEL_23;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_20;
  }
  if (a4 == 3)
  {
    v51 = 0;
    objc_msgSend(v6, "pendingNotificationSendInstructionsWithError:", &v51);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v51;
    if (v15)
    {
      objc_msgSend(v15, "categoryIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
        objc_msgSend(v19, "setTitle:", CFSTR("Example Feature [Internal Only]"));
        objc_msgSend(v15, "categoryIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setBody:", v22);

        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke;
        v48[3] = &unk_1E6CE7DB8;
        v48[4] = self;
        v49 = v6;
        v50 = v15;
        v25 = v15;
        objc_msgSend(v14, "postNotificationWithIdentifier:content:trigger:completion:", v24, v19, 0, v48);

        v15 = v19;
LABEL_20:

        goto LABEL_21;
      }
      _HKInitializeLogging();
      v35 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v36 = v35;
      v37 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      v38 = v37;
      goto LABEL_19;
    }
    _HKInitializeLogging();
    v29 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      v31 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v53 = v31;
      v54 = 2114;
      v55 = v16;
      v32 = v31;
      v33 = "[%{public}@] Error retrieving send instructions: %{public}@";
LABEL_23:
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_21:

}

void __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t *v6;
  os_log_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  os_log_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0CB5330];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v13 = v7;
      *(_DWORD *)buf = 138543618;
      v21 = (id)objc_opt_class();
      v22 = 2114;
      v23 = v5;
      v14 = v21;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post notifications %{public}@", buf, 0x16u);

    }
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v19 = 0;
  v10 = objc_msgSend(v8, "markPendingNotificationInstructionsAsProcessed:error:", v9, &v19);
  v11 = v19;
  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v15 = v12;
      v16 = (void *)objc_opt_class();
      v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      v24 = 2114;
      v25 = v11;
      v18 = v16;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to process pending notifications: %{public}@ %{public}@", buf, 0x20u);

    }
  }

}

void __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_199(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "hk_map:", &__block_literal_global_85);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDeliveredNotificationsWithIdentifiers:", v3);

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  v7 = objc_msgSend(v5, "markPendingNotificationInstructionsAsProcessed:error:", v6, &v14);
  v8 = v14;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v8;
      v13 = v11;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to process pending notifications: %{public}@ %{public}@", buf, 0x20u);

    }
  }

}

id __91__HDExampleFeatureProfileExtension_notificationSyncClient_didReceiveInstructionWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end

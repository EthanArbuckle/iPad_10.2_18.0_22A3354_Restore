@implementation DNDSUserAvailabilityCoordinator

- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4
{
  id v6;
  id v7;
  _DNDSUserAvailabilityTCCProvider *v8;
  DNDSUserAvailabilityCoordinator *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_DNDSUserAvailabilityTCCProvider);
  v9 = -[DNDSUserAvailabilityCoordinator initWithConfigurationProvider:stateProvider:userAvailabilityTCCProvider:](self, "initWithConfigurationProvider:stateProvider:userAvailabilityTCCProvider:", v7, v6, v8);

  return v9;
}

- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4 userAvailabilityTCCProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  DNDSUserAvailabilityCoordinator *v12;
  DNDSUserAvailabilityCoordinator *v13;
  id v14;
  uint64_t v15;
  SKStatusPublishingService *statusService;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *extensionLaunchQueue;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DNDSUserAvailabilityCoordinator;
  v12 = -[DNDSUserAvailabilityCoordinator init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_active = 0;
    objc_storeStrong((id *)&v12->_configurationProvider, a3);
    objc_storeStrong((id *)&v13->_stateProvider, a4);
    objc_storeStrong((id *)&v13->_tccProvider, a5);
    v14 = objc_alloc(MEMORY[0x1E0DACA80]);
    v15 = objc_msgSend(v14, "initWithStatusTypeIdentifier:", *MEMORY[0x1E0D00580]);
    statusService = v13->_statusService;
    v13->_statusService = (SKStatusPublishingService *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.donotdisturb.server.AvailabilityCoordinator", v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.donotdisturb.server.ExtensionLaunch", v20);
    extensionLaunchQueue = v13->_extensionLaunchQueue;
    v13->_extensionLaunchQueue = (OS_dispatch_queue *)v21;

  }
  return v13;
}

- (void)resume
{
  self->_active = 1;
}

- (void)resumeUpdatingInvitationsForContacts:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, DNDSUserAvailabilityPublishResult *, _QWORD);
  NSObject *v8;
  DNDSUserAvailabilityPublishResult *v9;
  _QWORD v10[5];
  void (**v11)(id, DNDSUserAvailabilityPublishResult *, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, DNDSUserAvailabilityPublishResult *, _QWORD))a4;
  v8 = DNDSLogAvailabilityProvider;
  if (self->_active)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
      -[DNDSUserAvailabilityCoordinator resumeUpdatingInvitationsForContacts:completionHandler:].cold.1();
    v9 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
    v7[2](v7, v9, 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_INFO, "Resuming User Availability publish current availability and update invites for relevant contacts.", buf, 2u);
    }
    -[DNDSUserAvailabilityCoordinator resume](self, "resume");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke;
    v10[3] = &unk_1E86A6078;
    v10[4] = self;
    v11 = v7;
    -[DNDSUserAvailabilityCoordinator sendStatusKitInvitationsForContacts:forceAvailabilityPublish:completionHandler:](self, "sendStatusKitInvitationsForContacts:forceAvailabilityPublish:completionHandler:", v6, 1, v10);

  }
}

void __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_2;
  block[3] = &unk_1E86A6050;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[16];

  v2 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_INFO, "Notifying intent extensions of availability on User Availability coordinator resume", buf, 2u);
  }
  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[5], "lastCalculatedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_11;
  v5[3] = &unk_1E86A6028;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_queue_notifyIntentExtensionsOfUserAvailability:applicationIdentifiers:completionHandler:", v4, 0, v5);

}

uint64_t __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)suspend
{
  self->_active = 0;
}

- (void)suspendWithOverrideSetting:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  DNDSUserAvailabilityPublishResult *v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (self->_active)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke;
    v9[3] = &unk_1E86A60F0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:](self, "_publishStatusKitCurrentAvailabilityForced:override:completionHandler:", 0, a3, v9);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
      -[DNDSUserAvailabilityCoordinator suspendWithOverrideSetting:completionHandler:].cold.1();
    v8 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
    ((void (**)(_QWORD, DNDSUserAvailabilityPublishResult *, _QWORD))v7)[2](v7, v8, 0);

  }
}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  DNDSUserAvailabilityPublishResult *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  DNDSUserAvailabilityPublishResult *v16;
  _QWORD v17[5];
  DNDSUserAvailabilityPublishResult *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v10 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", v7, v8);
  v11 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", buf, 0xCu);
  }
  v12 = a1[4];
  v13 = (void *)a1[5];
  v14 = *(NSObject **)(v12 + 16);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_15;
  v17[3] = &unk_1E86A60C8;
  v17[1] = 3221225472;
  v15 = a1[6];
  v17[4] = v12;
  v20 = v15;
  v18 = v10;
  v19 = v13;
  v16 = v10;
  dispatch_async(v14, v17);

}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_INFO, "Forcing intent extensions to available on User Availability coordinator suspend.", buf, 2u);
  }
  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[5], "lastCalculatedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_16;
  v6[3] = &unk_1E86A60A0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:", v4, v5, 0, v6);

}

uint64_t __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "suspend");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)coordinateUserAvailability:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  char v27;
  DNDSUserAvailabilityPublishResult *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *queue;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  DNDSUserAvailabilityPublishResult *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  char v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  DNDSUserAvailabilityPublishResult *v57;
  void (**v58)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  if (self->_active)
  {
    if (v11 && v12)
    {
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
      v46 = v10;
      objc_msgSend(v12, "mode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v15, "isEqual:", v16);

      objc_msgSend(v12, "impactsAvailability");
      v48 = DNDResolvedImpactsAvailabilitySetting();
      objc_msgSend(v11, "impactsAvailability");
      v47 = DNDResolvedImpactsAvailabilitySetting();
      objc_msgSend(v12, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allowedApplicationIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allowedApplicationIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqual:", v20);

      objc_msgSend(v12, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deniedApplicationIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deniedApplicationIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "isEqual:", v25);

      v27 = v21 & v51 & v26 ^ 1;
      if (v48 != v47)
        v27 = 1;
      v52 = (v11 == 0) ^ (v12 == 0) | v27;
      if ((v21 & 1) != 0)
      {
        v28 = 0;
        if ((v26 & 1) == 0)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(v12, "configuration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "allowedApplicationIdentifiers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "allKeys");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configuration");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "allowedApplicationIdentifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "allKeys");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke((uint64_t)v42, (uint64_t)v39, v42);
        v28 = (DNDSUserAvailabilityPublishResult *)objc_claimAutoreleasedReturnValue();

        if ((v26 & 1) == 0)
        {
LABEL_8:
          objc_msgSend(v12, "configuration");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "deniedApplicationIdentifiers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "allObjects");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "configuration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "deniedApplicationIdentifiers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "allObjects");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke((uint64_t)v33, (uint64_t)v30, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            if (v28)
            {
              -[DNDSUserAvailabilityPublishResult setByAddingObjectsFromSet:](v28, "setByAddingObjectsFromSet:", v34);
              v35 = objc_claimAutoreleasedReturnValue();

              v28 = (DNDSUserAvailabilityPublishResult *)v35;
            }
            else
            {
              v28 = v34;
            }
          }
          v14 = v45;
          v10 = v46;

          if ((v52 & 1) == 0)
            goto LABEL_18;
LABEL_15:
          queue = self->_queue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_21;
          block[3] = &unk_1E86A6168;
          block[4] = self;
          v54 = v10;
          v55 = v11;
          v56 = v12;
          v28 = v28;
          v57 = v28;
          v58 = v14;
          dispatch_async(queue, block);

          goto LABEL_21;
        }
      }
      v14 = v45;
      v10 = v46;
      if ((v52 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v28 = 0;
      if ((v11 == 0) != (v12 == 0))
        goto LABEL_15;
    }
LABEL_18:
    v43 = DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v43, OS_LOG_TYPE_INFO, "Ignoring request to coordinate user availability; from and to configurations are the same.",
        buf,
        2u);
    }
    v44 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
    ((void (**)(_QWORD, DNDSUserAvailabilityPublishResult *, _QWORD))v14)[2](v14, v44, 0);

    goto LABEL_21;
  }
  v36 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v36, OS_LOG_TYPE_INFO, "Skipping availability coordination because User Availability is disabled.", buf, 2u);
  }
  v28 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
  ((void (**)(_QWORD, DNDSUserAvailabilityPublishResult *, _QWORD))v14)[2](v14, v28, 0);
LABEL_21:

}

id __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "countForObject:", v12, (_QWORD)v15) == 1)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    v13 = (void *)objc_msgSend(v6, "copy");
  else
    v13 = 0;

  return v13;
}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_2;
  v6[3] = &unk_1E86A6140;
  v6[4] = v3;
  v7 = v2;
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v3, "_queue_updateAvailabilityKit:fromConfiguration:toConfiguration:completionHandler:", v7, v4, v5, v6);

}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_3;
  block[3] = &unk_1E86A6118;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v14 = v3;
  v15 = v8;
  v9 = v3;
  dispatch_async(v5, block);

}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_INFO, "Checking if intent extensions need availability update", buf, 2u);
  }
  v3 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "previousState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_INFO, "update.previousState: %{public}@", buf, 0xCu);

  }
  v7 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v10;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_INFO, "update.state: %{public}@", buf, 0xCu);

  }
  v11 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_INFO, "Notifying intent extensions of availability update", buf, 2u);
  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_22;
  v15[3] = &unk_1E86A6028;
  v17 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v12, "_queue_notifyIntentExtensionsOfUserAvailability:applicationIdentifiers:completionHandler:", v13, v14, v15);

}

uint64_t __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_22(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)coordinateUserAvailabilityUpdateForApplicationIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  DNDSUserAvailabilityPublishResult *v13;
  NSObject *v14;
  NSObject *queue;
  _QWORD block[4];
  DNDSUserAvailabilityPublishResult *v17;
  DNDSUserAvailabilityCoordinator *v18;
  id v19;
  BOOL v20;
  _QWORD v21[4];
  DNDSUserAvailabilityPublishResult *v22;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (self->_active)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.MobileSMS"), 1);
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      v12 = DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_INFO, "Forcing Messages AvailabilityKit status to available on User Availability coordinator TCC revocation.", buf, 2u);
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke;
      v21[3] = &unk_1E86A6190;
      v22 = (DNDSUserAvailabilityPublishResult *)v9;
      -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:](self, "_publishStatusKitCurrentAvailabilityForced:override:completionHandler:", v6, -1, v21);
      v13 = v22;
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_27;
      block[3] = &unk_1E86A61E0;
      v20 = v6;
      v17 = (DNDSUserAvailabilityPublishResult *)v8;
      v18 = self;
      v19 = v9;
      dispatch_async(queue, block);

      v13 = v17;
    }
  }
  else
  {
    v14 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_INFO, "Skipping availability coordination because User Availability is disabled.", buf, 2u);
    }
    v13 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
    (*((void (**)(id, DNDSUserAvailabilityPublishResult *, _QWORD))v9 + 2))(v9, v13, 0);
  }

}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  DNDSUserAvailabilityPublishResult *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v10 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", v7, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_INFO, "Forcing intent extensions to available on User Availability coordinator TCC revocation. app=%{public}@", buf, 0xCu);

  }
  if (*(_BYTE *)(a1 + 56))
    v6 = 1;
  else
    v6 = -1;
  v7 = *(id **)(a1 + 40);
  objc_msgSend(v7[5], "lastCalculatedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_29;
  v10[3] = &unk_1E86A61B8;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "_queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:", v8, v6, v9, v10);

}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_29(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  DNDSUserAvailabilityPublishResult *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, uint64_t))(v3 + 16))(v3, v4, a2);

}

- (void)_queue_updateAvailabilityKit:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  DNDSUserAvailabilityPublishResult *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  id v52;
  DNDSUserAvailabilityCoordinator *v53;
  uint8_t buf[8];
  _QWORD v55[4];
  id v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v53 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.MobileSMS"), 1);
  objc_msgSend(v12, "mode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v11;
  if (v15 == v16)
  {
    v24 = 0;
  }
  else
  {
    v50 = v14;
    v17 = v10;
    v18 = v13;
    objc_msgSend(v12, "mode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v11, "mode");
      v20 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v12, "mode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23) ^ 1;

      }
      else
      {
        v24 = 1;
      }

      v11 = v52;
    }
    else
    {
      v24 = 1;
    }

    v13 = v18;
    v10 = v17;
    v14 = v50;
  }

  objc_msgSend(v12, "impactsAvailability");
  v25 = DNDResolvedImpactsAvailabilitySetting();
  objc_msgSend(v11, "impactsAvailability");
  if (v25 != DNDResolvedImpactsAvailabilitySetting())
    v24 = 1;
  objc_msgSend(v11, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v24 | -[DNDSUserAvailabilityCoordinator _queue_didAppAvailabilityChangeForApplicationIdentifier:fromConfiguration:toConfiguration:](v53, "_queue_didAppAvailabilityChangeForApplicationIdentifier:fromConfiguration:toConfiguration:", v14, v26, v27);

  if (v28)
  {
    v29 = objc_msgSend(v10, "source");
    v51 = objc_msgSend(v10, "reason") != 1 && objc_msgSend(v10, "reason") != 4;
    objc_msgSend(v10, "state");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastModified");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "laterDate:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "impactsAvailability");
    v49 = v36;
    if (DNDResolvedImpactsAvailabilitySetting() == 2)
    {
      objc_msgSend(v36, "modeIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[DNDSUserAvailabilityCoordinator _isLocalUserAvailableForMessagesWithModeIdentifier:withError:](v53, "_isLocalUserAvailableForMessagesWithModeIdentifier:withError:", v37, 0);

      objc_msgSend(v36, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v31 = (DNDSUserAvailabilityPublishResult *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
      v48 = 1;
    }
    objc_msgSend(v10, "state");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "isActive") & 1) != 0)
    {
      objc_msgSend(v10, "state");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "activeModeIdentifier");
      v41 = v14;
      v42 = v10;
      v43 = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v44, "length");

      v13 = v43;
      v10 = v42;
      v14 = v41;

      if (v47)
      {
        v45 = v49;
        v46 = v48;
LABEL_27:
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __116__DNDSUserAvailabilityCoordinator__queue_updateAvailabilityKit_fromConfiguration_toConfiguration_completionHandler___block_invoke;
        v55[3] = &unk_1E86A6190;
        v56 = v13;
        -[DNDSUserAvailabilityCoordinator _publishStatusKitAvailability:activityIdentifier:local:scheduled:date:forced:completion:](v53, "_publishStatusKitAvailability:activityIdentifier:local:scheduled:date:forced:completion:", v46, v31, v29 == 1, v51, v35, 0, v55);

        v11 = v52;
        goto LABEL_28;
      }
    }
    else
    {

    }
    v31 = 0;
    v46 = 1;
    v45 = v49;
    goto LABEL_27;
  }
  v30 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_INFO, "Ignoring request to publish StatusKit availability; from and to configurations are the same.",
      buf,
      2u);
  }
  v31 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
  (*((void (**)(id, DNDSUserAvailabilityPublishResult *))v13 + 2))(v13, v31);
LABEL_28:

}

void __116__DNDSUserAvailabilityCoordinator__queue_updateAvailabilityKit_fromConfiguration_toConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  DNDSUserAvailabilityPublishResult *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v10 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", v7, v8);
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *))(v11 + 16))(v11, v12);

}

- (BOOL)_queue_didAppAvailabilityChangeForApplicationIdentifier:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  BOOL v20;

  v8 = a3;
  queue = self->_queue;
  v10 = a5;
  v11 = a4;
  dispatch_assert_queue_V2(queue);
  v12 = objc_msgSend(v11, "applicationConfigurationType");
  objc_msgSend(v8, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "exceptionForApplication:", v13);

  v15 = !(v12 | v14) || v12 == 1 && v14 != 1 || v12 == 2;
  v16 = objc_msgSend(v10, "applicationConfigurationType");
  objc_msgSend(v8, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "exceptionForApplication:", v17);

  v19 = !(v16 | v18) || v16 == 1 && v18 != 1 || v16 == 2;
  v20 = v15 != v19;

  return v20;
}

- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 applicationIdentifiers:(id)a4 completionHandler:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  id v11;

  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(queue);
  -[DNDSUserAvailabilityCoordinator _queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:](self, "_queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:", v11, -1, v10, v9);

}

- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 availabilityOverride:(int64_t)a4 applicationIdentifiers:(id)a5 completionHandler:(id)a6
{
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  NSObject *extensionLaunchQueue;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void (**v35)(id, _QWORD);
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  DNDSUserAvailabilityCoordinator *v41;
  id obj;
  uint64_t v43;
  _QWORD block[4];
  NSObject *v45;
  DNDSUserAvailabilityCoordinator *v46;
  id v47;
  void *v48;
  __int128 *p_buf;
  int64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  void *v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a5;
  v35 = (void (**)(id, _QWORD))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v41 = self;
  -[DNDSUserAvailabilityTCCProviding userAvailabilityTCCApprovedBundleIds](self->_tccProvider, "userAvailabilityTCCApprovedBundleIds");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (!v9)
  {
    v39 = 0;
    goto LABEL_28;
  }
  v39 = 0;
  v43 = *(_QWORD *)v52;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v52 != v43)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v11, v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "supportedIntentsByApp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "containsObject:", v14) & 1) != 0)
        goto LABEL_23;
      objc_msgSend(v12, "supportedActionsByExtensions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v14);

      if (!v17)
        goto LABEL_24;
      v18 = (void *)DNDSLogStateProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        objc_msgSend(v11, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1CB895000, v19, OS_LOG_TYPE_INFO, "Found intent extension for app: %{public}@", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(v11, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v40, "containsObject:", v21);

      -[DNDSUserAvailabilityCoordinator _entitlementRecordForApplicationRecord:](v41, "_entitlementRecordForApplicationRecord:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entitlements");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:ofClass:", CFSTR("com.apple.developer.usernotifications.communication"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValue");

      objc_msgSend(v11, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__3;
      v60 = __Block_byref_object_dispose__3;
      v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v26);
      v27 = DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(v26);
      if ((v22 & v25 & v27) == 1)
      {
        extensionLaunchQueue = v41->_extensionLaunchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke;
        block[3] = &unk_1E86A6230;
        v29 = v37;
        p_buf = &buf;
        v50 = a4;
        v45 = v29;
        v46 = v41;
        v47 = v38;
        v48 = v11;
        dispatch_async(extensionLaunchQueue, block);

        ++v39;
        v30 = v45;
LABEL_21:

        goto LABEL_22;
      }
      if ((v22 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "bundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v55 = 138543362;
          v56 = v32;
          _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have user availability TCC permission, not launching extension.", v55, 0xCu);

        }
        goto LABEL_21;
      }
      if ((v25 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v55 = 138543362;
          v56 = v33;
          _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have UN Communication entitlement, not launching extension.", v55, 0xCu);

        }
        goto LABEL_21;
      }
      if ((v27 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "bundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v55 = 138543362;
          v56 = v31;
          _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have UN authorization, not launching extension.", v55, 0xCu);

        }
        goto LABEL_21;
      }
LABEL_22:
      _Block_object_dispose(&buf, 8);

LABEL_23:
LABEL_24:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  }
  while (v9);
LABEL_28:

  v34 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_INFO, "Done dispatching launch blocks to _launchQueue", (uint8_t *)&buf, 2u);
  }
  v35[2](v35, v39);

}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DNDSUserAvailabilityIntentLauncher *v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  if (v3
    && !objc_msgSend(v3, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
  {
    v6 = DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_INFO, "Skipping Intent launch of %@ because relative availability did not change.", buf, 0xCu);
    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4 == -1)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "activeModeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "_isLocalUserAvailableForAppId:modeIdentifier:withError:", v8, v10, 0);

    }
    else
    {
      v5 = v4 == 1;
    }
    v11 = -[DNDSUserAvailabilityIntentLauncher initWithApplicationRecord:available:]([DNDSUserAvailabilityIntentLauncher alloc], "initWithApplicationRecord:available:", *(_QWORD *)(a1 + 56), v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E86A6208;
    v12 = v2;
    v15 = v12;
    -[DNDSUserAvailabilityIntentLauncher launchIntentExtensionWithCompletion:](v11, "launchIntentExtensionWithCompletion:", v14);
    v13 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v12, v13);

  }
}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2_cold_1();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_entitlementRecordForApplicationRecord:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceClass");

  v6 = v3;
  if (v5 == 4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "applicationExtensionRecords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v18 = v3;
    v6 = v3;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      v6 = v3;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "infoDictionary", v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.watchkit"));

          if (v15)
          {
            v16 = v11;

            v6 = v16;
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v3 = v18;
  }

  return v6;
}

- (void)sendStatusKitInvitationsForContacts:(id)a3 completionHandler:(id)a4
{
  -[DNDSUserAvailabilityCoordinator sendStatusKitInvitationsForContacts:forceAvailabilityPublish:completionHandler:](self, "sendStatusKitInvitationsForContacts:forceAvailabilityPublish:completionHandler:", a3, 0, a4);
}

- (void)sendStatusKitInvitationsForContacts:(id)a3 forceAvailabilityPublish:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  NSObject *v11;
  DNDSUserAvailabilityPublishResult *v12;
  _QWORD v13[4];
  id v14;
  DNDSUserAvailabilityCoordinator *v15;
  id v16;
  uint8_t *v17;
  id v18;
  BOOL v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  char v23;
  id location;

  v8 = a3;
  v9 = a5;
  if (self->_active)
  {
    objc_initWeak(&location, self->_statusService);
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 0;
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke;
    v13[3] = &unk_1E86A62D0;
    objc_copyWeak(&v18, &location);
    v14 = v8;
    v15 = self;
    v17 = buf;
    v19 = a4;
    v16 = v9;
    dispatch_async(queue, v13);

    objc_destroyWeak(&v18);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_INFO, "Skipping invitation send request because User Availability is disabled.", buf, 2u);
    }
    if (v9)
    {
      v12 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
      (*((void (**)(id, DNDSUserAvailabilityPublishResult *, _QWORD))v9 + 2))(v9, v12, MEMORY[0x1E0C9AA60]);

    }
  }

}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  __int128 v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  DNDSAvailabilityInvitationRequest *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id WeakRetained;
  id obj;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  __int128 v60;
  _QWORD block[5];
  id v62;
  __int128 v63;
  char v64;
  _QWORD v65[4];
  NSObject *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[5];
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v1 = a1;
  v86 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = *(id *)(v1 + 32);
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v56)
  {
    v4 = *(_QWORD *)v78;
    v5 = 0x1E0D1D000uLL;
    *(_QWORD *)&v3 = 138412290;
    v48 = v3;
    v50 = v1;
    v51 = v2;
    v49 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v78 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v8 = objc_alloc_init(*(Class *)(v5 + 1776));
        objc_msgSend(v7, "contactIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setContactIdentifier:", v9);

        objc_msgSend(v7, "phoneNumbers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          objc_msgSend(v8, "setType:", 2);
          objc_msgSend(v7, "phoneNumbers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v7, "emailAddresses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (!v14)
            goto LABEL_11;
          objc_msgSend(v8, "setType:", 1);
          objc_msgSend(v7, "emailAddresses");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v12;
        objc_msgSend(v12, "anyObject", v48);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:", v16);

LABEL_11:
        v17 = *(void **)(v1 + 40);
        v76 = 0;
        objc_msgSend(v17, "exceptionalModesForContactHandle:withError:", v8, &v76, v48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v76;
        objc_msgSend(v18, "allowed");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "silenced");
        v57 = v19;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = DNDSLogStateProvider;
          v21 = v57;
          if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            v84 = v57;
            _os_log_error_impl(&dword_1CB895000, v20, OS_LOG_TYPE_ERROR, "Error getting allowedModesForContactHandle: %@", buf, 0xCu);
          }
        }
        else
        {
          v55 = v18;
          dispatch_group_enter(v2);
          v22 = (void *)objc_opt_new();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(v7, "phoneNumbers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v73;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v73 != v26)
                  objc_enumerationMutation(v23);
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DACA58]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j));
                objc_msgSend(v22, "addObject:", v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
            }
            while (v25);
          }

          v70 = 0u;
          v71 = 0u;
          v69 = 0u;
          v68 = 0u;
          objc_msgSend(v7, "emailAddresses");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v69;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v69 != v32)
                  objc_enumerationMutation(v29);
                v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DACA58]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
                objc_msgSend(v22, "addObject:", v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
            }
            while (v31);
          }

          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00590]), "initWithAvailableDuringActivityIdentifiers:unavailableDuringActivityIdentifiers:", v59, v58);
          objc_msgSend(v7, "phoneNumbers");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "allObjects");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "emailAddresses");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allObjects");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = -[DNDSAvailabilityInvitationRequest initWithHandles:invitation:]([DNDSAvailabilityInvitationRequest alloc], "initWithHandles:invitation:", v40, v35);
          objc_msgSend(v52, "addObject:", v41);

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "statusKitInvitationPayloadWithDateCreated:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_50;
          v65[3] = &unk_1E86A6258;
          v1 = v50;
          v2 = v51;
          v67 = *(_QWORD *)(v50 + 56);
          v66 = v51;
          objc_msgSend(WeakRetained, "inviteHandlesFromPrimaryAccountHandle:withInvitationPayload:completion:", v22, v43, v65);

          v4 = v49;
          v5 = 0x1E0D1D000;
          v18 = v55;
          v21 = 0;
        }

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v56);
  }

  v44 = *(_QWORD *)(v1 + 40);
  v45 = *(NSObject **)(v44 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_54;
  block[3] = &unk_1E86A62A8;
  v64 = *(_BYTE *)(v1 + 72);
  v60 = *(_OWORD *)(v1 + 48);
  block[4] = v44;
  v46 = (id)v60;
  v63 = v60;
  v62 = v52;
  v47 = v52;
  dispatch_group_notify(v2, v45, block);

}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  v4 = DNDSLogStateProvider;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
      __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_50_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NSClassFromString(CFSTR("XCTest")) != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_INFO, "Successfully published AKAvailabilityInvitation", v5, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  DNDSUserAvailabilityPublishResult *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  DNDSUserAvailabilityPublishResult *v13;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_INFO, "Forcing availability re-publish despite no updated invitations.", buf, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 64);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 8))
  {
    v8 = DNDSLogAvailabilityProvider;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v9 = "Skipping availability re-publish because User Availability is disabled.";
LABEL_15:
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    goto LABEL_16;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v8 = DNDSLogAvailabilityProvider;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v9 = "Skipping availability re-publish because there were no changes to allowed contacts.";
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(v3 + 40), "lastCalculatedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_55;
    v11[3] = &unk_1E86A6280;
    v13 = (DNDSUserAvailabilityPublishResult *)*(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_publishStatusKitCurrentAvailabilityForced:override:completionHandler:", 0, -1, v11);

    v7 = v13;
    goto LABEL_18;
  }
  v8 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v9 = "Skipping availability re-publish because no mode is enabled.";
    goto LABEL_15;
  }
LABEL_16:
  v10 = *(_QWORD *)(a1 + 48);
  if (!v10)
    return;
  v7 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, _QWORD))(v10 + 16))(v10, v7, *(_QWORD *)(a1 + 40));
LABEL_18:

}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_55(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  DNDSUserAvailabilityPublishResult *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v10 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v12 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", v7, v8);
    (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, _QWORD))(v11 + 16))(v11, v12, *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_isLocalUserAvailableForAppId:(id)a3 modeIdentifier:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  DNDSModeConfigurationProviding *configurationProvider;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v22;
  id v24;

  v8 = a3;
  v9 = a4;
  configurationProvider = self->_configurationProvider;
  v24 = 0;
  -[DNDSModeConfigurationProviding modeConfigurationForModeIdentifier:withError:](configurationProvider, "modeConfigurationForModeIdentifier:withError:", v9, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    objc_msgSend(v11, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "applicationConfigurationType");

    objc_msgSend(v8, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      v20 = -[DNDSModeConfigurationProviding exceptionForApplicationIdentifier:thread:forModeIdentifier:](self->_configurationProvider, "exceptionForApplicationIdentifier:thread:forModeIdentifier:", v8, 0, v9);
      if (!(v17 | v20))
      {
        v15 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      v20 = 2;
    }
    v22 = v17 == 1 && v20 != 1;
    v15 = 1;
    if (v17 != 2 && !v22)
    {
      objc_msgSend(v11, "impactsAvailability");
      v15 = DNDResolvedImpactsAvailabilitySetting() != 2;
    }
  }
  else
  {
    v15 = 1;
    if (a5 && v12)
      *a5 = objc_retainAutorelease(v12);
  }
LABEL_21:

  return v15;
}

- (BOOL)_isLocalUserAvailableForMessagesWithModeIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  DNDSModeConfigurationProviding *configurationProvider;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v20;
  _BOOL4 v21;
  id v22;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", CFSTR("com.apple.MobileSMS"), 1);
  configurationProvider = self->_configurationProvider;
  v22 = 0;
  -[DNDSModeConfigurationProviding modeConfigurationForModeIdentifier:withError:](configurationProvider, "modeConfigurationForModeIdentifier:withError:", v6, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (v12)
  {
    objc_msgSend(v9, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "applicationConfigurationType");

    v16 = -[DNDSModeConfigurationProviding exceptionForApplicationIdentifier:thread:forModeIdentifier:](self->_configurationProvider, "exceptionForApplicationIdentifier:thread:forModeIdentifier:", v7, 0, v6);
    objc_msgSend(v9, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "senderConfigurationType");

    if (!(v15 | v16))
      goto LABEL_9;
    if (!v15 && v16 == 2)
      goto LABEL_12;
    if (v15 == 1 && v16 == 1)
    {
      objc_msgSend(v9, "impactsAvailability");
      v13 = DNDResolvedImpactsAvailabilitySetting() != 2;
      goto LABEL_18;
    }
    v20 = v15 == 1 && v16 == 2;
    v21 = v20;
    if (v15 == 2 || v21)
    {
LABEL_12:
      objc_msgSend(v9, "impactsAvailability");
      v13 = DNDResolvedImpactsAvailabilitySetting() != 2 || (unint64_t)(v18 - 1) < 2;
    }
    else
    {
LABEL_9:
      v13 = 1;
    }
  }
  else
  {
    v13 = 1;
    if (a4 && v10)
      *a4 = objc_retainAutorelease(v10);
  }
LABEL_18:

  return v13;
}

- (BOOL)isLocalUserAvailableForApplicationIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  if (self->_active)
  {
    -[DNDSStateProviding lastCalculatedState](self->_stateProvider, "lastCalculatedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeModeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DNDSUserAvailabilityCoordinator _isLocalUserAvailableForAppId:modeIdentifier:withError:](self, "_isLocalUserAvailableForAppId:modeIdentifier:withError:", v6, v8, a4);

  }
  else
  {
    v10 = DNDSLogAvailabilityProvider;
    v9 = 1;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_INFO, "Skipping availability check because User Availability is disabled.", v12, 2u);
    }
  }

  return v9;
}

- (BOOL)isTCCUserAvailabilityGrantedForBundleId:(id)a3
{
  id v4;
  _BOOL4 active;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  char v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  active = self->_active;
  v6 = DNDSLogAvailabilityProvider;
  v7 = os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO);
  if (!active)
  {
    if (!v7)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    LOWORD(v15) = 0;
    v10 = "Skipping availability check because User Availability is disabled.";
    v11 = v6;
    v12 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl(&dword_1CB895000, v11, v12, v10, (uint8_t *)&v15, 2u);
    goto LABEL_11;
  }
  if (v7)
  {
    v15 = 138543362;
    v16 = v4;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_INFO, "Looking up User Availability permission for bundleId: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  if (!objc_msgSend(v4, "length"))
  {
    v13 = DNDSLogAvailabilityProvider;
    v9 = 0;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    LOWORD(v15) = 0;
    v10 = "Empty bundleId passed to isTCCUserAvailabilityGrantedForBundleId";
    v11 = v13;
    v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  -[DNDSUserAvailabilityTCCProviding userAvailabilityTCCApprovedBundleIds](self->_tccProvider, "userAvailabilityTCCApprovedBundleIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

LABEL_12:
  return v9;
}

- (id)allowedModesForContactHandle:(id)a3 withError:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DNDSUserAvailabilityCoordinator exceptionalModesForContactHandle:withError:](self, "exceptionalModesForContactHandle:withError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)silencedModesForContactHandle:(id)a3 withError:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DNDSUserAvailabilityCoordinator exceptionalModesForContactHandle:withError:](self, "exceptionalModesForContactHandle:withError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "silenced");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)exceptionalModesForContactHandle:(id)a3 withError:(id *)a4
{
  id v6;
  DNDSModeConfigurationProviding *configurationProvider;
  void *v8;
  id v9;
  void *v10;
  DNDSContentHandleExceptionalModesBox *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  DNDSModeConfigurationProviding *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_active)
  {
    v12 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_INFO, "Skipping exceptional modes check because User Availability is disabled.", buf, 2u);
    }
    v11 = 0;
    goto LABEL_26;
  }
  configurationProvider = self->_configurationProvider;
  v38 = 0;
  -[DNDSModeConfigurationProviding modeConfigurationsWithError:](configurationProvider, "modeConfigurationsWithError:", &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;
  v10 = v9;
  if (!v9)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v30 = v8;
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v8, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (!v13)
      goto LABEL_24;
    v14 = v13;
    v15 = *(_QWORD *)v35;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v17, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "senderConfigurationType");

        v20 = self->_configurationProvider;
        objc_msgSend(v17, "mode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "modeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[DNDSModeConfigurationProviding exceptionForContactHandle:forModeIdentifier:](v20, "exceptionForContactHandle:forModeIdentifier:", v6, v22);

        if (!(v19 | v23))
        {
          objc_msgSend(v17, "mode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v32;
LABEL_21:
          objc_msgSend(v27, "addObject:", v26);

          continue;
        }
        if (v19 == 1 && v23 == 1)
        {
          objc_msgSend(v17, "mode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v31;
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (!v14)
      {
LABEL_24:

        v11 = -[DNDSContentHandleExceptionalModesBox initWithContactHandle:allowed:silenced:]([DNDSContentHandleExceptionalModesBox alloc], "initWithContactHandle:allowed:silenced:", v6, v32, v31);
        v10 = 0;
        v8 = v30;
        goto LABEL_25;
      }
    }
  }
  v11 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v9);
LABEL_25:

LABEL_26:
  return v11;
}

- (BOOL)userAvailabilityInActiveModeForContactHandle:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  DNDSModeConfigurationProviding *configurationProvider;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  DNDSModeConfigurationProviding *v13;
  void *v14;
  uint64_t v15;
  BOOL v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t v25[8];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_active)
  {
    if (-[DNDSUserAvailabilityCoordinator _isTCCUserAvailabilityGrantedForMessages](self, "_isTCCUserAvailabilityGrantedForMessages"))
    {
      -[DNDSStateProviding lastCalculatedState](self->_stateProvider, "lastCalculatedState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      configurationProvider = self->_configurationProvider;
      objc_msgSend(v7, "activeModeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeConfigurationProviding modeConfigurationForModeIdentifier:withError:](configurationProvider, "modeConfigurationForModeIdentifier:withError:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "senderConfigurationType");

      v13 = self->_configurationProvider;
      objc_msgSend(v7, "activeModeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[DNDSModeConfigurationProviding exceptionForContactHandle:forModeIdentifier:](v13, "exceptionForContactHandle:forModeIdentifier:", v6, v14);

      v18 = v12 == 1 && v15 != 1 || v12 == 2;
      if (v12 | v15)
        v19 = v18;
      else
        v19 = 1;

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
    {
      -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:].cold.1();
      if (a4)
        goto LABEL_20;
    }
    else if (a4)
    {
LABEL_20:
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D1D3E0];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Calling bundleId does not have permission to read user availability.");
      v19 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1004, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    v19 = 1;
    goto LABEL_23;
  }
  v20 = DNDSLogAvailabilityProvider;
  v19 = 1;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v25 = 0;
    v19 = 1;
    _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_INFO, "Skipping availability check for contact because User Availability is disabled.", v25, 2u);
  }
LABEL_23:

  return v19;
}

- (id)publishStatusKitAvailabilityReturningError:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  DNDSUserAvailabilityPublishResult *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  DNDSUserAvailabilityPublishResult *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  NSObject *v20;
  uint8_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (self->_active)
  {
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    v29 = 0;
    v5 = dispatch_semaphore_create(0);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __78__DNDSUserAvailabilityCoordinator_publishStatusKitAvailabilityReturningError___block_invoke;
    v19 = &unk_1E86A62F8;
    v21 = buf;
    v22 = &v30;
    v23 = &v24;
    v6 = v5;
    v20 = v6;
    -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:](self, "_publishStatusKitCurrentAvailabilityForced:override:completionHandler:", 0, -1, &v16);
    v7 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      if (a3)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v43[0] = CFSTR("Call to -[SKStatusPublishingService publishStatusRequest:completion:] timed out");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, v16, v17, v18, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1000, v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = [DNDSUserAvailabilityPublishResult alloc];
      v11 = 0;
      v12 = 0;
    }
    else
    {
      if (a3)
        *a3 = objc_retainAutorelease((id)v25[5]);
      v10 = [DNDSUserAvailabilityPublishResult alloc];
      v11 = *((_QWORD *)v37 + 5);
      v12 = v31[5];
    }
    v15 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:](v10, "initWithIdentifier:availability:", v11, v12, v16, v17, v18, v19);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
    return v15;
  }
  else
  {
    v13 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_INFO, "Skipping publish because User Availability is disabled.", buf, 2u);
    }
    return -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:]([DNDSUserAvailabilityPublishResult alloc], "initWithIdentifier:availability:", 0, 0);
  }
}

void __78__DNDSUserAvailabilityCoordinator_publishStatusKitAvailabilityReturningError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v10 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    v20 = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v7;
  v13 = v7;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v8;
  v16 = v8;

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v9;
  v19 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_publishStatusKitCurrentAvailabilityForced:(BOOL)a3 override:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  DNDSModeConfigurationProviding *configurationProvider;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v6 = a3;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[DNDSUserAvailabilityCoordinator _isTCCUserAvailabilityGrantedForMessages](self, "_isTCCUserAvailabilityGrantedForMessages");
  v10 = v9;
  if (v6 || v9)
  {
    if (a4 != -1)
    {
      v15 = (void *)DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = v15;
        objc_msgSend(v16, "numberWithInteger:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Applying override to focus status update: %@", buf, 0xCu);

      }
      v14 = 0;
      v19 = a4 != 0;
      goto LABEL_19;
    }
    -[DNDSStateProviding lastCalculatedState](self->_stateProvider, "lastCalculatedState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isActive"))
    {
      v14 = 0;
      v19 = 1;
      goto LABEL_18;
    }
    configurationProvider = self->_configurationProvider;
    objc_msgSend(v20, "activeModeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    -[DNDSModeConfigurationProviding modeConfigurationForModeIdentifier:withError:](configurationProvider, "modeConfigurationForModeIdentifier:withError:", v22, &v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v34;

    if (v24)
    {
      v25 = (void *)DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
        -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:].cold.2(v25, v20);
    }
    else
    {
      if (v10)
      {
        objc_msgSend(v23, "impactsAvailability");
        if (DNDResolvedImpactsAvailabilitySetting() == 2)
        {
          objc_msgSend(v20, "activeModeIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[DNDSUserAvailabilityCoordinator _isLocalUserAvailableForMessagesWithModeIdentifier:withError:](self, "_isLocalUserAvailableForMessagesWithModeIdentifier:withError:", v26, 0);

          objc_msgSend(v23, "mode");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v14, "length"))
          {
            v29 = (void *)DNDSLogAvailabilityProvider;
            if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_FAULT))
              -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:].cold.1(v29, v20);

            v14 = 0;
            v19 = 1;
          }

        }
        else
        {
          v31 = (void *)DNDSLogAvailabilityProvider;
          v19 = 1;
          if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
          {
            v32 = v31;
            objc_msgSend(v20, "activeModeIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v36 = v33;
            _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_INFO, ".impactsAvailability is disabled for %{private}@", buf, 0xCu);

          }
          v14 = 0;
        }
        goto LABEL_16;
      }
      if (v6)
      {
        v30 = DNDSLogAvailabilityProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_DEFAULT, "Forced focus status update indicating not focused due to TCC revocation", buf, 2u);
        }
      }
    }
    v14 = 0;
    v19 = 1;
LABEL_16:

LABEL_18:
LABEL_19:
    -[DNDSUserAvailabilityCoordinator _publishStatusKitAvailability:activityIdentifier:local:scheduled:date:forced:completion:](self, "_publishStatusKitAvailability:activityIdentifier:local:scheduled:date:forced:completion:", v19, v14, 1, 0, 0, v6, v8);
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
    -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:].cold.1();
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0D1D3E0];
  v37 = *MEMORY[0x1E0CB2D50];
  v38[0] = CFSTR("Caller does not have permission to trigger publishing user availability.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1004, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v14);
LABEL_20:

}

- (void)_publishStatusKitAvailability:(BOOL)a3 activityIdentifier:(id)a4 local:(BOOL)a5 scheduled:(BOOL)a6 date:(id)a7 forced:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v11;
  _BOOL4 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  SKStatusPublishingService *statusService;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v11 = a6;
  v12 = a5;
  v13 = a3;
  v35[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a7;
  v17 = a9;
  if (a8
    || -[DNDSUserAvailabilityCoordinator _isTCCUserAvailabilityGrantedForMessages](self, "_isTCCUserAvailabilityGrantedForMessages"))
  {
    v18 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("UNAVAILABLE");
      if (v13)
        v19 = CFSTR("AVAILABLE");
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_INFO, "Informing availability (%{public}@) for activity %{public}@ to StatusKit", buf, 0x16u);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00588]), "initWithAvailable:activityIdentifierString:", v13, v15);
    objc_msgSend(v20, "statusPublishRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIsSecondaryDeviceRepublish:", !v12);
    objc_msgSend(v21, "setIsScheduledRequest:", v11);
    objc_msgSend(v21, "setDateCreated:", v16);
    statusService = self->_statusService;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __123__DNDSUserAvailabilityCoordinator__publishStatusKitAvailability_activityIdentifier_local_scheduled_date_forced_completion___block_invoke;
    v27[3] = &unk_1E86A6320;
    v28 = v20;
    v29 = v17;
    v23 = v20;
    -[SKStatusPublishingService publishStatusRequest:completion:](statusService, "publishStatusRequest:completion:", v21, v27);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
      -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:].cold.1();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D1D3E0];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("Caller does not have permission to trigger publishing user availability.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1004, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v21);
  }

}

void __123__DNDSUserAvailabilityCoordinator__publishStatusKitAvailability_activityIdentifier_local_scheduled_date_forced_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  v7 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, _QWORD, id))(v8 + 16))(v8, v5, *(_QWORD *)(a1 + 32), v6);

}

- (BOOL)_isTCCUserAvailabilityGrantedForMessages
{
  return -[DNDSUserAvailabilityCoordinator isTCCUserAvailabilityGrantedForBundleId:](self, "isTCCUserAvailabilityGrantedForBundleId:", CFSTR("com.apple.MobileSMS"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusService, 0);
  objc_storeStrong((id *)&self->_tccProvider, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_extensionLaunchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resumeUpdatingInvitationsForContacts:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Skipping publish and invite on resume because User Availability is **still** enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)suspendWithOverrideSetting:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Skipping overriding publish on suspend because User Availability is **already** disabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error publishing availability to StatusKit: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Intent launcher error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error publishing AKAvailabilityInvitation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)userAvailabilityInActiveModeForContactHandle:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Messages does not have user availability TCC permission.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_publishStatusKitCurrentAvailabilityForced:(void *)a1 override:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "activeModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1CB895000, v3, OS_LOG_TYPE_FAULT, "Unexpected empty identifier UUID or nil mode for modeIdentifier, modeIdentifier=%{private}@", v5, 0xCu);

  OUTLINED_FUNCTION_6_0();
}

- (void)_publishStatusKitCurrentAvailabilityForced:(void *)a1 override:(void *)a2 completionHandler:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "activeModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1CB895000, v3, OS_LOG_TYPE_ERROR, "Error getting mode configuration for %{private}@", v5, 0xCu);

  OUTLINED_FUNCTION_6_0();
}

@end

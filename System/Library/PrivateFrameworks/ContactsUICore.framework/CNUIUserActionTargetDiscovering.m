@implementation CNUIUserActionTargetDiscovering

CNUIUserActionTargetDiscoveringObservableCancelationToken *__57__CNUIUserActionTargetDiscovering_targetForTextWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:](CNUIUserActionTargetDiscovering, "isSkypeAvailableWithEnvironment:", *(_QWORD *)(a1 + 32)))
  {
    +[CNUIUserActionTarget targetForTextWithSkype](CNUIUserActionTarget, "targetForTextWithSkype");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

uint64_t __84__CNUIUserActionTargetDiscovering_applicationProxiesForIntent_applicationWorkspace___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreApplicationProxy:", a2) ^ 1;
}

+ (BOOL)shouldIgnoreApplicationProxy:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.internal.suiuntool"));

  return v4;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__58__CNUIUserActionTargetDiscovering_targetForVoiceWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:](CNUIUserActionTargetDiscovering, "isSkypeAvailableWithEnvironment:", *(_QWORD *)(a1 + 32)))
  {
    +[CNUIUserActionTarget targetForVoiceWithSkype](CNUIUserActionTarget, "targetForVoiceWithSkype");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__58__CNUIUserActionTargetDiscovering_targetForVideoWithSkype__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (+[CNUIUserActionTargetDiscovering isSkypeAvailableWithEnvironment:](CNUIUserActionTargetDiscovering, "isSkypeAvailableWithEnvironment:", *(_QWORD *)(a1 + 32)))
  {
    +[CNUIUserActionTarget targetForVideoWithSkype](CNUIUserActionTarget, "targetForVideoWithSkype");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

+ (BOOL)isSkypeAvailableWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userHasOptedInToPreference:", CFSTR("SkypeURLActions"));

  if (v5)
  {
    v6 = *MEMORY[0x1E0D137F8];
    objc_msgSend(v3, "applicationsAvailableForHandlingURLScheme:", CFSTR("skype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)targetsForActionType:(id)a3
{
  id v4;
  void *v5;
  CNUIUserActionTargetDiscovering *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void *v15;
  CNUIUserActionTargetDiscovering *v16;
  id v17;

  v4 = a3;
  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[CNUIUserActionTargetDiscovering cache](v6, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__CNUIUserActionTargetDiscovering_targetsForActionType___block_invoke;
  v15 = &unk_1EA605228;
  v16 = v6;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v7, "objectForKey:onCacheMiss:", v4, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "first", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v10;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUIUserActionTargetDiscoveryCache)cache
{
  return self->_cache;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x1E0C96620]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:applicationWorkspace:](CNUIUserActionTargetDiscovering, "applicationProxiesForIntent:applicationWorkspace:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke_2;
  v9[3] = &unk_1EA6052F0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  objc_msgSend(v6, "observerDidComplete");
  v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

+ (id)applicationProxiesForIntent:(id)a3 applicationWorkspace:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a4, "applicationsForUserActivityType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__CNUIUserActionTargetDiscovering_applicationProxiesForIntent_applicationWorkspace___block_invoke;
  v8[3] = &__block_descriptor_40_e28_B16__0__CNApplicationProxy_8l;
  v8[4] = a1;
  objc_msgSend(v5, "_cn_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNUIUserActionTarget targetForSendMessageIntentWithAppProxy:](CNUIUserActionTarget, "targetForSendMessageIntentWithAppProxy:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__62__CNUIUserActionTargetDiscovering_targetForVoiceWithTelephony__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "areTelephonyCallsSupported"))
  {
    +[CNUIUserActionTarget targetForVoiceWithTelephony](CNUIUserActionTarget, "targetForVoiceWithTelephony");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__60__CNUIUserActionTargetDiscovering_targetForTextWithMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isiMessageSupported"))
  {
    +[CNUIUserActionTarget targetForTextWithMessages](CNUIUserActionTarget, "targetForTextWithMessages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__61__CNUIUserActionTargetDiscovering_targetForVoiceWithFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isFaceTimeAudioSupported"))
  {
    +[CNUIUserActionTarget targetForVoiceWithFaceTime](CNUIUserActionTarget, "targetForVoiceWithFaceTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

id __56__CNUIUserActionTargetDiscovering_targetsForActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_targetsForActionType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13B58]), "initWithSchedulerProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "subscribe:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPair pairWithFirst:second:](CNUIUserActionTargetDiscoveringReplaySubjectPair, "pairWithFirst:second:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_targetsForActionType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96620]))
  {
    -[CNUIUserActionTargetDiscovering targetsForText](self, "targetsForText");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C965F8]))
  {
    -[CNUIUserActionTargetDiscovering targetsForVoice](self, "targetsForVoice");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96658]))
  {
    -[CNUIUserActionTargetDiscovering targetsForVideo](self, "targetsForVideo");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96618]))
  {
    -[CNUIUserActionTargetDiscovering targetsForEmail](self, "targetsForEmail");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96630]))
  {
    -[CNUIUserActionTargetDiscovering targetsForPay](self, "targetsForPay");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96608]))
      -[CNUIUserActionTargetDiscovering targetsForDirections](self, "targetsForDirections");
    else
      objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CNUIUserActionTargetDiscovering)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 profileConnection:(id)a5 schedulerProvider:(id)a6 highLatencySchedulerProvider:(id)a7 capabilities:(id)a8
{
  id v15;
  id v16;
  id v17;
  CNUIUserActionTargetDiscovering *v18;
  CNUIUserActionTargetDiscovering *v19;
  CNUIUserActionTargetDiscoveryCache *v20;
  void *v21;
  uint64_t v22;
  CNUIUserActionTargetDiscoveryCache *cache;
  CNUIUserActionTargetDiscovering *v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CNUIUserActionTargetDiscovering;
  v18 = -[CNUIUserActionTargetDiscovering init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_applicationWorkspace, a3);
    objc_storeStrong((id *)&v19->_callProviderManager, a4);
    objc_storeStrong((id *)&v19->_capabilities, a8);
    objc_storeStrong((id *)&v19->_highLatencySchedulerProvider, a7);
    objc_storeStrong((id *)&v19->_profileConnection, a5);
    objc_storeStrong((id *)&v19->_schedulerProvider, a6);
    v20 = [CNUIUserActionTargetDiscoveryCache alloc];
    v21 = (void *)objc_msgSend(v15, "newSynchronousSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsUICore.CNUIUserActionTargetDiscoveringResourceLock"));
    v22 = -[CNCache initWithResourceScheduler:](v20, "initWithResourceScheduler:", v21);
    cache = v19->_cache;
    v19->_cache = (CNUIUserActionTargetDiscoveryCache *)v22;

    v24 = v19;
  }

  return v19;
}

id __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke_2;
  v8[3] = &unk_1EA605250;
  v9 = a1[5];
  v10 = a1[6];
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:qualityOfService:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)targetsForVoice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(id *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[CNUIUserActionTargetDiscovering targetForVoiceWithTelephony](self, "targetForVoiceWithTelephony");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering targetForVoiceWithFaceTime](self, "targetForVoiceWithFaceTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[CNUIUserActionTargetDiscovering targetForVoiceWithSkype](self, "targetForVoiceWithSkype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[CNUIUserActionTargetDiscovering targetsForVoiceWithThirdPartyCallProviders](self, "targetsForVoiceWithThirdPartyCallProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering highLatencySchedulerProvider](self, "highLatencySchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D13AE8];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke;
  v23 = &unk_1EA605278;
  v24 = v9;
  v25 = v4;
  v26 = v8;
  v11 = v8;
  v12 = v4;
  v13 = v9;
  objc_msgSend(v10, "observableWithBlock:", &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D13AE8];
  v27[0] = v3;
  v27[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2, v20, v21, v22, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "merge:schedulerProvider:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CNSchedulerProvider)highLatencySchedulerProvider
{
  return self->_highLatencySchedulerProvider;
}

- (id)targetsForVoiceWithThirdPartyCallProviders
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering callProviderManager](self, "callProviderManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNTUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (id)targetsForVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering targetForVideoWithFaceTime](self, "targetForVideoWithFaceTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CNUIUserActionTargetDiscovering targetForVideoWithSkype](self, "targetForVideoWithSkype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[CNUIUserActionTargetDiscovering targetsForVideoWithThirdPartyCallProviders](self, "targetsForVideoWithThirdPartyCallProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering highLatencySchedulerProvider](self, "highLatencySchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D13AE8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke;
  v15[3] = &unk_1EA605278;
  v16 = v8;
  v17 = v3;
  v18 = v7;
  v10 = v7;
  v11 = v3;
  v12 = v8;
  objc_msgSend(v9, "observableWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__61__CNUIUserActionTargetDiscovering_targetForVideoWithFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isFaceTimeVideoSupported"))
  {
    +[CNUIUserActionTarget targetForVideoWithFaceTime](CNUIUserActionTarget, "targetForVideoWithFaceTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observerDidReceiveResult:", v4);

  }
  objc_msgSend(v3, "observerDidComplete");
  v5 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v5;
}

- (id)targetsForVideoWithThirdPartyCallProviders
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering callProviderManager](self, "callProviderManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetsForText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(id *, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  -[CNUIUserActionTargetDiscovering targetForTextWithMessages](self, "targetForTextWithMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering targetForTextWithSkype](self, "targetForTextWithSkype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[CNUIUserActionTargetDiscovering targetsForSendMessageIntent](self, "targetsForSendMessageIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering highLatencySchedulerProvider](self, "highLatencySchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D13AE8];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke;
  v22 = &unk_1EA605278;
  v23 = v8;
  v24 = v4;
  v25 = v7;
  v10 = v7;
  v11 = v4;
  v12 = v8;
  objc_msgSend(v9, "observableWithBlock:", &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D13AE8];
  v26[0] = v3;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2, v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering schedulerProvider](self, "schedulerProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "merge:schedulerProvider:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)targetsForSendMessageIntent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CNUIUserActionTargetDiscovering_targetsForSendMessageIntent__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetsForPay
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13AE8];
  +[CNUIUserActionTarget targetForPayWithWallet](CNUIUserActionTarget, "targetForPayWithWallet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observableWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)targetsForEmail
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13AE8];
  +[CNUIUserActionTarget targetForEmailWithMail](CNUIUserActionTarget, "targetForEmailWithMail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observableWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)targetForVoiceWithTelephony
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CNUIUserActionTargetDiscovering_targetForVoiceWithTelephony__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForVoiceWithSkype
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CNUIUserActionTargetDiscovering_targetForVoiceWithSkype__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (id)targetForVoiceWithFaceTime
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNUIUserActionTargetDiscovering_targetForVoiceWithFaceTime__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForVideoWithSkype
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CNUIUserActionTargetDiscovering_targetForVideoWithSkype__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForVideoWithFaceTime
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNUIUserActionTargetDiscovering_targetForVideoWithFaceTime__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNCapabilities)capabilities
{
  return self->_capabilities;
}

- (id)targetForTextWithSkype
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CNUIUserActionTargetDiscovering_targetForTextWithSkype__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForTextWithMessages
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CNUIUserActionTargetDiscovering_targetForTextWithMessages__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thirdPartyCallProvidersForActionType:", *MEMORY[0x1E0C965F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke_2;
  v8[3] = &unk_1EA6052C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_cn_each:", v8);

  objc_msgSend(v5, "observerDidComplete");
  v6 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v6;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thirdPartyCallProvidersForActionType:", *MEMORY[0x1E0C96658]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke_2;
  v8[3] = &unk_1EA6052C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "_cn_each:", v8);

  objc_msgSend(v5, "observerDidComplete");
  v6 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v6;
}

void __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D13AE8];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a2;
  objc_msgSend(v3, "merge:schedulerProvider:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", a1[6]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCancelable:", v8);
}

void __50__CNUIUserActionTargetDiscovering_targetsForVideo__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D13AE8];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a2;
  objc_msgSend(v3, "merge:schedulerProvider:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", a1[6]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCancelable:", v8);
}

void __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D13AE8];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a2;
  objc_msgSend(v3, "merge:schedulerProvider:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", a1[6]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCancelable:", v8);
}

id __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CNUIUserActionTargetDiscovering_targetsForVoice__block_invoke_2;
  v8[3] = &unk_1EA605250;
  v9 = a1[5];
  v10 = a1[6];
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:qualityOfService:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__CNUIUserActionTargetDiscovering_targetsForText__block_invoke_2;
  v8[3] = &unk_1EA605250;
  v9 = a1[5];
  v10 = a1[6];
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:qualityOfService:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1)
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_61);
  return (id)os_log_cn_once_object_1_0;
}

void __41__CNUIUserActionTargetDiscovering_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "target-discovery");
  v1 = (void *)os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  CNUIUserActionTargetDiscovering *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  -[CNUIUserActionTargetDiscovering cache](v4, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_map:", &__block_literal_global_9_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArray:", v7);

  -[CNUIUserActionTargetDiscovering cache](v4, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  objc_sync_exit(v4);
  objc_msgSend(v3, "_cn_each:", *MEMORY[0x1E0D13710]);

  v9.receiver = v4;
  v9.super_class = (Class)CNUIUserActionTargetDiscovering;
  -[CNUIUserActionTargetDiscovering dealloc](&v9, sel_dealloc);
}

uint64_t __42__CNUIUserActionTargetDiscovering_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

- (id)observableForTargetsChangedForActionType:(id)a3 schedulerProvider:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNUIUserActionTargetDiscovering *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = a4;
  if (v6 | *MEMORY[0x1E0C965F8]
    && (objc_msgSend((id)v6, "isEqual:") & 1) == 0
    && v6 | *MEMORY[0x1E0C96658]
    && (objc_msgSend((id)v6, "isEqual:") & 1) == 0
    && v6 | *MEMORY[0x1E0C96620]
    && !objc_msgSend((id)v6, "isEqual:"))
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D13AE8];
    -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "observableForApplicationsChangedWithSchedulerProvider:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    -[CNUIUserActionTargetDiscovering callProviderManager](self, "callProviderManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "observableForCallProvidersChangedWithSchedulerProvider:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    -[CNUIUserActionTargetDiscovering profileConnection](self, "profileConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "observableForManagedConfigChanged");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v20 = self;
    v15 = (void *)v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "merge:schedulerProvider:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (unint64_t)v15;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__CNUIUserActionTargetDiscovering_observableForTargetsChangedForActionType_schedulerProvider___block_invoke;
    v21[3] = &unk_1EA6037E8;
    v21[4] = v20;
    v22 = v15;
    objc_msgSend(v17, "doOnNext:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __94__CNUIUserActionTargetDiscovering_observableForTargetsChangedForActionType_schedulerProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetTargetsForActionType:", *(_QWORD *)(a1 + 40));
}

- (void)resetTargetsForActionType:(id)a3
{
  id v4;
  CNUIUserActionTargetDiscovering *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CNUIUserActionTargetDiscovering resetTargetsForActionType:].cold.1((uint64_t)v4, v6);

  -[CNUIUserActionTargetDiscovering cache](v5, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIUserActionTargetDiscovering cache](v5, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

  objc_sync_exit(v5);
  objc_msgSend(v9, "cancel");

}

- (id)targetsForDirections
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13AE8];
  +[CNUIUserActionTarget targetForDirections](CNUIUserActionTarget, "targetForDirections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observableWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __77__CNUIUserActionTargetDiscovering_targetsForVoiceWithThirdPartyCallProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNUIUserActionTarget targetForVoiceWithCallProvider:](CNUIUserActionTarget, "targetForVoiceWithCallProvider:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

void __77__CNUIUserActionTargetDiscovering_targetsForVideoWithThirdPartyCallProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNUIUserActionTarget targetForVideoWithCallProvider:](CNUIUserActionTarget, "targetForVideoWithCallProvider:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

- (id)targetsForStartAudioCallIntent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x1E0C965F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:applicationWorkspace:](CNUIUserActionTargetDiscovering, "applicationProxiesForIntent:applicationWorkspace:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke_2;
  v9[3] = &unk_1EA6052F0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  objc_msgSend(v6, "observerDidComplete");
  v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

void __65__CNUIUserActionTargetDiscovering_targetsForStartAudioCallIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNUIUserActionTarget targetForStartAudioCallIntentWithAppProxy:](CNUIUserActionTarget, "targetForStartAudioCallIntentWithAppProxy:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

- (id)targetsForStartVideoCallIntent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D13AE8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke;
  v7[3] = &unk_1EA6052A0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "observableWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

CNUIUserActionTargetDiscoveringObservableCancelationToken *__65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  CNUIUserActionTargetDiscoveringObservableCancelationToken *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  sIntentForActionType_block_invoke((uint64_t)v3, (void *)*MEMORY[0x1E0C96658]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:applicationWorkspace:](CNUIUserActionTargetDiscovering, "applicationProxiesForIntent:applicationWorkspace:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke_2;
  v9[3] = &unk_1EA6052F0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "_cn_each:", v9);

  objc_msgSend(v6, "observerDidComplete");
  v7 = objc_alloc_init(CNUIUserActionTargetDiscoveringObservableCancelationToken);

  return v7;
}

void __65__CNUIUserActionTargetDiscovering_targetsForStartVideoCallIntent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[CNUIUserActionTarget targetForStartVideoCallIntentWithAppProxy:](CNUIUserActionTarget, "targetForStartVideoCallIntentWithAppProxy:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observerDidReceiveResult:", v3);

}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke;
  v17 = &unk_1EA605318;
  v18 = v7;
  v19 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v5, "_cn_each:", &v14);

  v10 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(v8, "_cn_distinctObjects", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  sIntentForActionType_block_invoke(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionTargetDiscovering applicationProxiesForIntent:applicationWorkspace:](CNUIUserActionTargetDiscovering, "applicationProxiesForIntent:applicationWorkspace:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke_2;
  v5[3] = &unk_1EA6052F0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_cn_each:", v5);

}

void __67__CNUIUserActionTargetDiscovering_thirdPartyTargetsForActionTypes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  CNUIUserActionTarget *v4;
  void *v5;
  void *v6;
  CNUIUserActionTarget *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [CNUIUserActionTarget alloc];
  objc_msgSend(v3, "localizedName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](v4, "initWithName:bundleIdentifier:teamIdentifier:", v8, v5, v6);
  objc_msgSend(v2, "addObject:", v7);

}

- (id)thirdPartyTargetsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (thirdPartyTargetsForBundleIdentifier__cn_once_token_3 != -1)
    dispatch_once(&thirdPartyTargetsForBundleIdentifier__cn_once_token_3, &__block_literal_global_27_2);
  v6 = (id)thirdPartyTargetsForBundleIdentifier__cn_once_object_3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionTargetDiscovering callProviderManager](self, "callProviderManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thirdPartyCallProviderWithBundleIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "supportsAudio"))
  {
    +[CNUIUserActionTarget targetForVoiceWithCallProvider:](CNUIUserActionTarget, "targetForVoiceWithCallProvider:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v7, "removeObject:", *MEMORY[0x1E0C965F8]);
  }
  if (objc_msgSend(v9, "supportsVideo"))
  {
    +[CNUIUserActionTarget targetForVideoWithCallProvider:](CNUIUserActionTarget, "targetForVideoWithCallProvider:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    objc_msgSend(v7, "removeObject:", *MEMORY[0x1E0C96658]);
  }
  -[CNUIUserActionTargetDiscovering applicationWorkspace](self, "applicationWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationForBundleIdentifier:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke_2;
  v21 = &unk_1EA605318;
  v22 = v13;
  v23 = v5;
  v14 = v5;
  v15 = v13;
  objc_msgSend(v7, "_cn_each:", &v18);
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v14, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96658];
  v4[0] = *MEMORY[0x1E0C965F8];
  v4[1] = v0;
  v4[2] = *MEMORY[0x1E0C96620];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)thirdPartyTargetsForBundleIdentifier__cn_once_object_3;
  thirdPartyTargetsForBundleIdentifier__cn_once_object_3 = v2;

}

void __72__CNUIUserActionTargetDiscovering_thirdPartyTargetsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  unint64_t v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activityTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sIntentForActionType_block_invoke((uint64_t)v3, (void *)v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  v6 = (void *)v11;
  if (v5)
  {
    if (!(v11 | *MEMORY[0x1E0C965F8]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v7 = *(void **)(a1 + 40);
      +[CNUIUserActionTarget targetForStartAudioCallIntentWithAppProxy:](CNUIUserActionTarget, "targetForStartAudioCallIntentWithAppProxy:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = (void *)v8;
      objc_msgSend(v7, "addObject:", v8);

      v6 = (void *)v11;
      goto LABEL_12;
    }
    if (!(v11 | *MEMORY[0x1E0C96658]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v7 = *(void **)(a1 + 40);
      +[CNUIUserActionTarget targetForStartVideoCallIntentWithAppProxy:](CNUIUserActionTarget, "targetForStartVideoCallIntentWithAppProxy:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (!(v11 | *MEMORY[0x1E0C96620]) || (v9 = objc_msgSend((id)v11, "isEqual:"), v6 = (void *)v11, v9))
    {
      v7 = *(void **)(a1 + 40);
      +[CNUIUserActionTarget targetForSendMessageIntentWithAppProxy:](CNUIUserActionTarget, "targetForSendMessageIntentWithAppProxy:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (CNMCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_highLatencySchedulerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
}

- (void)resetTargetsForActionType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "resetTargetsForActionType %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

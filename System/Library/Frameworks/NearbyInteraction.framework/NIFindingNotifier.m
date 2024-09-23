@implementation NIFindingNotifier

- (NIFindingNotifier)initWithParentSession:(id)a3
{
  id v4;
  NIFindingNotifier *v5;
  NIFindingNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIFindingNotifier;
  v5 = -[NIFindingNotifier init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyDiscoveredNearbyObjectWithToken:(id)a3 sharedConfigurationData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2459, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurationData"));

LABEL_3:
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v36[0] = CFSTR("FindingEventDictKey_EventType");
    v36[1] = CFSTR("FindingEventDictKey_ObjectDiscoveryToken");
    v37[0] = &unk_1E4370348;
    v37[1] = v7;
    v36[2] = CFSTR("FindingEventDictKey_SharedConfigurationData");
    v37[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      objc_msgSend(WeakRetained, "getInternalLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "getInternalIdentifier");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(WeakRetained, "internalState") - 1;
        if (v14 > 7)
          v15 = CFSTR("Activating");
        else
          v15 = off_1E4362978[v14];
        objc_msgSend(v7, "descriptionInternal");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v17;
        v34 = 2112;
        v35 = v9;
        _os_log_impl(&dword_1A0337000, v12, OS_LOG_TYPE_DEFAULT, "Client: notifyDiscoveredNearbyObject STARTED [%@]. State: %@. Token: %@. Data: %@", buf, 0x2Au);

      }
    }
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__NIFindingNotifier_notifyDiscoveredNearbyObjectWithToken_sharedConfigurationData___block_invoke;
    block[3] = &unk_1E43622A8;
    v19 = WeakRetained;
    v26 = v19;
    v20 = v11;
    v27 = v20;
    dispatch_sync(v18, block);

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      objc_msgSend(v19, "getInternalLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "getInternalIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v22;
        _os_log_impl(&dword_1A0337000, v21, OS_LOG_TYPE_DEFAULT, "Client: notifyDiscoveredNearbyObject FINISHED [%@]", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2463, CFSTR("Parent session is nil"));

  }
}

void __83__NIFindingNotifier_notifyDiscoveredNearbyObjectWithToken_sharedConfigurationData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processFindingEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1137);

}

- (void)notifyRemovedNearbyObjectWithToken:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v29[0] = CFSTR("FindingEventDictKey_EventType");
    v29[1] = CFSTR("FindingEventDictKey_ObjectDiscoveryToken");
    v30[0] = &unk_1E4370360;
    v30[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      objc_msgSend(WeakRetained, "getInternalLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "getInternalIdentifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(WeakRetained, "internalState") - 1;
        if (v10 > 7)
          v11 = CFSTR("Activating");
        else
          v11 = off_1E4362978[v10];
        objc_msgSend(v5, "descriptionInternal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1A0337000, v8, OS_LOG_TYPE_DEFAULT, "Client: notifyRemovedNearbyObject STARTED [%@]. State: %@. Token: %@", buf, 0x20u);

      }
    }
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NIFindingNotifier_notifyRemovedNearbyObjectWithToken___block_invoke;
    block[3] = &unk_1E43622A8;
    v15 = WeakRetained;
    v21 = v15;
    v16 = v7;
    v22 = v16;
    dispatch_sync(v14, block);

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      objc_msgSend(v15, "getInternalLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "getInternalIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_impl(&dword_1A0337000, v17, OS_LOG_TYPE_DEFAULT, "Client: notifyRemovedNearbyObject FINISHED [%@]", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2492, CFSTR("Parent session is nil"));

  }
}

void __56__NIFindingNotifier_notifyRemovedNearbyObjectWithToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processFindingEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1138);

}

- (void)notifyUpdatedLocationForLocalDevice:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v15[0] = CFSTR("FindingEventDictKey_EventType");
    v15[1] = CFSTR("FindingEventDictKey_Location");
    v16[0] = &unk_1E4370300;
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NIFindingNotifier_notifyUpdatedLocationForLocalDevice___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v7;
    v9 = v7;
    dispatch_sync(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2519, CFSTR("Parent session is nil"));

  }
}

void __57__NIFindingNotifier_notifyUpdatedLocationForLocalDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processFindingEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1141);

}

- (void)notifyUpdatedHeadingForLocalDevice:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("heading"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v15[0] = CFSTR("FindingEventDictKey_EventType");
    v15[1] = CFSTR("FindingEventDictKey_Heading");
    v16[0] = &unk_1E4370318;
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NIFindingNotifier_notifyUpdatedHeadingForLocalDevice___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v7;
    v9 = v7;
    dispatch_sync(v8, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2536, CFSTR("Parent session is nil"));

  }
}

void __56__NIFindingNotifier_notifyUpdatedHeadingForLocalDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processFindingEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1144);

}

- (void)notifyUpdatedLocation:(id)a3 forNearbyObjectWithToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2549, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

LABEL_3:
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v20[0] = CFSTR("FindingEventDictKey_EventType");
    v20[1] = CFSTR("FindingEventDictKey_ObjectDiscoveryToken");
    v21[0] = &unk_1E4370330;
    v21[1] = v9;
    v20[2] = CFSTR("FindingEventDictKey_Location");
    v21[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NIFindingNotifier_notifyUpdatedLocation_forNearbyObjectWithToken___block_invoke;
    block[3] = &unk_1E43622A8;
    v18 = WeakRetained;
    v19 = v11;
    v13 = v11;
    dispatch_sync(v12, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2554, CFSTR("Parent session is nil"));

  }
}

void __68__NIFindingNotifier_notifyUpdatedLocation_forNearbyObjectWithToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processFindingEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1145);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end

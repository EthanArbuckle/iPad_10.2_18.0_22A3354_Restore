@implementation CNGeminiManager

void __44__CNGeminiManager_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("phoneNumbers");
  v5[1] = CFSTR("preferredChannel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Gemini"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)descriptorForRequiredKeys_cn_once_object_4;
  descriptorForRequiredKeys_cn_once_object_4 = v3;

}

- (id)remoteGeminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitlementVerifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D137C0], 0);

  if (v11)
  {
    -[CNGeminiManager geminiResultForContact:substituteDefaultForDangling:error:](self, "geminiResultForContact:substituteDefaultForDangling:error:", v8, 0, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.contactsd"), 0);
    +[CNXPCDataMapper serviceProtocolInterface](CNXPCDataMapper, "serviceProtocolInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRemoteObjectInterface:", v14);

    objc_msgSend(v13, "resume");
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_137);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke_140;
    v17[3] = &unk_1E29F8408;
    v17[4] = &v18;
    v17[5] = &v24;
    objc_msgSend(v15, "geminiResultForContact:substituteDefaultForDangling:withReply:", v8, v6, v17);
    objc_msgSend(v13, "invalidate");
    if (a5)
      *a5 = objc_retainAutorelease((id)v25[5]);
    v12 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }

  return v12;
}

- (id)geminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  CNGeminiChannel *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v33;
  id v34;
  id v35;
  _QWORD v36[2];

  v5 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertKeysAreAvailable:", v9);

    v34 = 0;
    v35 = 0;
    -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](self, 1, &v35, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v35;
    v12 = v34;
    if (!objc_msgSend(v10, "count"))
    {
      v18 = 0;
      goto LABEL_21;
    }
    v13 = *MEMORY[0x1E0D13848];
    objc_msgSend(v7, "preferredChannel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    if ((v15 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v7, "preferredChannel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager channelForPreferredChannelString:fromChannels:synthesizeMissingChannels:](self, v16, v10, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v17, 1, v12, objc_msgSend(v7, "hasBeenPersisted") ^ 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_5:
      if (!objc_msgSend((id)objc_opt_class(), "deviceSupportsGemini"))
      {
        v18 = 0;
LABEL_19:
        if (v11)
        {
          -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v11, 3, v12, objc_msgSend(v7, "hasBeenPersisted") ^ 1);
          v31 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v31;
        }
        goto LABEL_21;
      }
      v33 = v5;
      objc_msgSend(v7, "phoneNumbers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_cn_map:", &__block_literal_global_145);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_cn_filter:", *MEMORY[0x1E0D13830]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "channelIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGeminiManager bestChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:defaultChannelIdentifier:](self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "first");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

      if ((_DWORD)v22)
      {

        v18 = 0;
        v26 = 1;
        goto LABEL_18;
      }
      objc_msgSend(v24, "first");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v27);
      v28 = (CNGeminiChannel *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v28 = [CNGeminiChannel alloc];
        objc_msgSend(v24, "first");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          v28 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v28->super.isa, v29, &stru_1E29FF900, 0, 0, 0, 0);

      }
      objc_msgSend(v24, "second");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v28, objc_msgSend(v30, "unsignedIntegerValue"), v12, objc_msgSend(v7, "hasBeenPersisted") ^ 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v33;
      if (!v18)
        goto LABEL_19;
    }
    objc_msgSend(v18, "channel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5 & ~objc_msgSend(v21, "isAvailable");
LABEL_18:

    if (v26)
      goto LABEL_19;
LABEL_21:

    goto LABEL_22;
  }
  v18 = 0;
LABEL_22:

  return v18;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4, &__block_literal_global_8);
  return (id)descriptorForRequiredKeys_cn_once_object_4;
}

- (id)channelsByIdentifierIncludingDanglingPlans:(_QWORD *)a3 defaultChannel:(_QWORD *)a4 availableChannels:
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  id *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  _QWORD *v50;
  _QWORD *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "fetchedSenderIdentitiesWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  if (a2)
  {
    if (objc_msgSend((id)objc_opt_class(), "deviceSupportsGemini"))
    {
      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0D0D570], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "danglingPlanItemsShouldUpdate:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0D0D570], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "planItemsShouldUpdate:", 1);
      v8 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v50 = a3;
  v51 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v63;
    v16 = *MEMORY[0x1E0D13848];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(obj);
        v18 = -[CNGeminiChannel initWithSenderIdentity:]((id *)[CNGeminiChannel alloc], *(void **)(*((_QWORD *)&v62 + 1) + 8 * i));
        objc_msgSend(v18, "channelIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v19);

        if ((v20 & 1) == 0)
        {
          objc_msgSend(v18, "channelIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v18, v21);

          objc_msgSend(v52, "addObject:", v18);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v14);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v22 = v9;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v59;
    v26 = *MEMORY[0x1E0D13848];
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v59 != v25)
          objc_enumerationMutation(v22);
        v28 = -[CNGeminiChannel initWithDanglingPlanItem:]((id *)[CNGeminiChannel alloc], *(void **)(*((_QWORD *)&v58 + 1) + 8 * j));
        objc_msgSend(v28, "channelIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (*(uint64_t (**)(uint64_t, void *))(v26 + 16))(v26, v29);

        if ((v30 & 1) == 0)
        {
          objc_msgSend(v28, "channelIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v28, v31);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v24);
  }
  v49 = v22;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v32 = v48;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v55;
    v36 = *MEMORY[0x1E0D13848];
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v55 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
        if ((objc_msgSend(v38, "isSelected") & 1) == 0)
        {
          v39 = -[CNGeminiChannel initWithDisabledCellularPlanItem:]((id *)[CNGeminiChannel alloc], v38);
          objc_msgSend(v39, "channelIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (*(uint64_t (**)(uint64_t, void *))(v36 + 16))(v36, v40);

          if ((v41 & 1) == 0)
          {
            objc_msgSend(v39, "channelIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v39, v42);

          }
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v34);
  }

  if (v50)
  {
    objc_msgSend(obj, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "accountUUID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "UUIDString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v45);
    *v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v51)
    *v51 = objc_retainAutorelease(v52);
  v46 = (void *)objc_msgSend(v12, "copy");

  return v46;
}

+ (BOOL)deviceSupportsGemini
{
  id v2;
  int v3;
  const __CFBoolean *v4;
  BOOL v5;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = deviceSupportsGemini_haveValidGeminiStatus;
  if (deviceSupportsGemini_haveValidGeminiStatus == 1)
  {
    LOBYTE(v4) = deviceSupportsGemini_supportsGemini != 0;
    goto LABEL_8;
  }
  objc_opt_self();
  if (!CFPreferencesGetAppBooleanValue(CFSTR("CNEnableGemini"), (CFStringRef)*MEMORY[0x1E0C9B228], 0))
  {
    v4 = (const __CFBoolean *)MGCopyAnswerWithError();
    if (!v4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = (const __CFBoolean *)*MEMORY[0x1E0C9AE50];
  if (*MEMORY[0x1E0C9AE50])
  {
LABEL_7:
    deviceSupportsGemini_haveValidGeminiStatus = 1;
    deviceSupportsGemini_supportsGemini = CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
LABEL_8:
  objc_sync_exit(v2);

  v5 = deviceSupportsGemini_supportsGemini != 0;
  if (v3)
    return (char)v4;
  return v5;
}

- (id)fetchedSenderIdentitiesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_self();
  if (CFPreferencesGetAppBooleanValue(CFSTR("CNEnableGemini"), (CFStringRef)*MEMORY[0x1E0C9B228], 0))
  {
    -[CNGeminiManager fakeSenderIdentities]((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNGeminiManager callProviderManager](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "telephonyProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prioritizedSenderIdentities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)callProviderManager
{
  if (a1)
  {
    cn_objectResultWithObjectLock();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (CNGeminiManager)initWithEnvironment:(id)a3 coreTelephonyClient:(id)a4 callProviderManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNGeminiManager *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSMapTable *delegateToQueue;
  void *v17;
  uint64_t v18;
  void *v19;
  CNGeminiManager *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNGeminiManager;
  v12 = -[CNGeminiManager init](&v22, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.contacts.geminimanager.queue", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v12->_delegateToQueue;
    v12->_delegateToQueue = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v12->_callProviderManager, a5);
    objc_storeStrong((id *)&v12->_coreTelephonyClient, a4);
    -[CoreTelephonyClient setDelegate:](v12->_coreTelephonyClient, "setDelegate:", v12);
    -[TUCallProviderManager addDelegate:queue:](v12->_callProviderManager, "addDelegate:queue:", v12, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D0D568];
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D0D570], "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel_danglingPlansDidUpdate_, v18, v19);

    v20 = v12;
  }

  return v12;
}

id __38__CNGeminiManager_coreTelephonyClient__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(getCoreTelephonyClientClass());
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v2;
}

id __38__CNGeminiManager_callProviderManager__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(getTUCallProviderManagerClass());
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addDelegate:queue:", *(_QWORD *)(a1 + 32), 0);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return v2;
}

uint64_t __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channelsDidChangeForGeminiManager:", *(_QWORD *)(a1 + 40));
}

- (CNGeminiManager)init
{
  return -[CNGeminiManager initWithEnvironment:coreTelephonyClient:callProviderManager:](self, "initWithEnvironment:coreTelephonyClient:callProviderManager:", 0, 0, 0);
}

- (void)notifyDelegateOfChannelUpdates
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke;
    block[3] = &unk_1E29F8508;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __37__CNGeminiManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = -[CNGeminiManager callProviderManager](*(void **)(a1 + 32));
  v3 = -[CNGeminiManager coreTelephonyClient](*(void **)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 40);
  else
    v5 = 0;
  if (*(_QWORD *)(a1 + 40))
    v6 = *(_QWORD *)(a1 + 40);
  else
    v6 = MEMORY[0x1E0C80D38];
  return objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(a1 + 48));
}

- (id)coreTelephonyClient
{
  if (a1)
  {
    cn_objectResultWithObjectLock();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CNGeminiManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E29F84E0;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(queue, block);

}

void __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[5];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(void **)(v10 + 40);
        else
          v11 = 0;
        objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
        v12 = objc_claimAutoreleasedReturnValue();
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke_2;
        v15[3] = &unk_1E29F7CE0;
        v13 = *(_QWORD *)(a1 + 32);
        v15[4] = v9;
        v15[5] = v13;
        dispatch_async(v12, v15);

        ++v8;
      }
      while (v5 != v8);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v14;
    }
    while (v14);
  }

}

+ (id)channelStringFromSenderIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accountUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "accountUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("uuid:%@"), v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CNGeminiManager)initWithCallProviderManager:(id)a3
{
  return -[CNGeminiManager initWithEnvironment:coreTelephonyClient:callProviderManager:](self, "initWithEnvironment:coreTelephonyClient:callProviderManager:", 0, 0, a3);
}

- (id)fakeSenderIdentities
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5E4B060A-7996-47D2-804E-0833378D1311"));
  v44 = (void *)v2;
  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription1Label"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Home");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription1Number"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("+14104844321");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription2Service"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Subspace Relay");
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  v15 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v6, "rangeOfComposedCharacterSequenceAtIndex:", 0);
  -[__CFString substringToIndex:](v6, "substringToIndex:", v15 + v16);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(objc_alloc((Class)getTUHandleClass[0]()), "initWithType:value:", 2, v10);

  v17 = objc_alloc((Class)getTUSenderIdentityClass());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithUUID:accountUUID:localizedName:localizedShortName:localizedServiceName:handle:", v18, v2, v6, v43, v14, v42);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("ACE7E1F1-744F-41A5-856F-D8822258B2E1"));
  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription2Label"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = CFSTR("Work");
  if (v21)
    v23 = (__CFString *)v21;
  v24 = v23;

  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription2Number"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = CFSTR("+14089740000");
  if (v25)
    v27 = (__CFString *)v25;
  v28 = v27;

  objc_msgSend(v1, "objectForKey:", CFSTR("CNGeminiFakeSubscription2Service"));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = CFSTR("Quantum Entanglement");
  if (v29)
    v31 = (__CFString *)v29;
  v32 = v31;

  v33 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v24, "rangeOfComposedCharacterSequenceAtIndex:", 0);
  -[__CFString substringToIndex:](v24, "substringToIndex:", v33 + v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(objc_alloc((Class)getTUHandleClass[0]()), "initWithType:value:", 2, v28);

  v37 = objc_alloc((Class)getTUSenderIdentityClass());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v37, "initWithUUID:accountUUID:localizedName:localizedShortName:localizedServiceName:handle:", v38, v20, v24, v35, v32, v36);

  v46[0] = v19;
  v46[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)channelForContact:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[CNGeminiManager geminiResultForContact:substituteDefaultForDangling:error:](self, "geminiResultForContact:substituteDefaultForDangling:error:", a3, 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bestSenderIdentityForContact:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[CNGeminiManager geminiResultForContact:substituteDefaultForDangling:error:](self, "geminiResultForContact:substituteDefaultForDangling:error:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke()
{
  NSLog(CFSTR("Could not obtain contacts service proxy for gemini query"));
}

void __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)remoteBestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
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

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entitlementVerifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D137C0], 0);

  if (v12)
  {
    -[CNGeminiManager bestSenderIdentityForHandle:contactStore:error:](self, "bestSenderIdentityForHandle:contactStore:error:", v8, v9, a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "handleType"))
  {
    v14 = objc_msgSend(v8, "handleType");
    if (!v9 || v14 != -1)
      goto LABEL_10;
LABEL_8:
    objc_msgSend(v8, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager contactForPhoneString:contactStore:]((uint64_t)self, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CNGeminiManager remoteGeminiResultForContact:substituteDefaultForDangling:error:](self, "remoteGeminiResultForContact:substituteDefaultForDangling:error:", v16, 1, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "channel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "senderIdentity");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (v9)
    goto LABEL_8;
LABEL_10:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.contactsd"), 0);
  +[CNXPCDataMapper serviceProtocolInterface](CNXPCDataMapper, "serviceProtocolInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRemoteObjectInterface:", v20);

  objc_msgSend(v19, "resume");
  objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_142);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
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
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke_2;
  v23[3] = &unk_1E29F8450;
  v23[4] = &v24;
  v23[5] = &v30;
  objc_msgSend(v21, "bestSenderIdentityForHandle:withReply:", v8, v23);
  objc_msgSend(v19, "invalidate");
  if (a5)
    *a5 = objc_retainAutorelease((id)v31[5]);
  v13 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
LABEL_13:

  return v13;
}

- (id)contactForPhoneString:(void *)a3 contactStore:
{
  id v4;
  id v5;
  CNPhoneNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a3;
  v5 = a2;
  v6 = -[CNPhoneNumber initWithStringValue:]([CNPhoneNumber alloc], "initWithStringValue:", v5);

  +[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke()
{
  NSLog(CFSTR("Could not obtain contacts service proxy for gemini query"));
}

void __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)geminiResultForContact:(id)a3 error:(id *)a4
{
  return -[CNGeminiManager geminiResultForContact:substituteDefaultForDangling:error:](self, "geminiResultForContact:substituteDefaultForDangling:error:", a3, 0, a4);
}

- (id)channelForPreferredChannelString:(void *)a3 fromChannels:(int)a4 synthesizeMissingChannels:
{
  id v7;
  id v8;
  void *v9;
  CNGeminiChannel *v10;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("uuid:")))
    {
      objc_msgSend(v7, "substringFromIndex:", 5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

      if (a1)
        goto LABEL_9;
    }
    else
    {
      a1 = 0;
    }
    if (a4)
    {
      v10 = [CNGeminiChannel alloc];
      if (v10)
        a1 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v10->super.isa, CFSTR("BAD00000-0000-0000-0000-000000000000"), &stru_1E29FF900, 0, 0, 0, 0);
      else
        a1 = 0;
    }
  }
LABEL_9:

  return a1;
}

- (CNGeminiResult)geminiResultForChannel:(uint64_t)a3 usage:(void *)a4 availableChannels:(int)a5 isUnknownNumber:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  CNGeminiResult *v14;
  uint64_t v15;
  CNGeminiResult *v16;

  v9 = a2;
  v10 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isFeatureEnabled:", 7);

    v14 = [CNGeminiResult alloc];
    if ((v13 & a5) != 0)
      v15 = 4;
    else
      v15 = a3;
    v16 = -[CNGeminiResult initWithChannel:usage:availableChannels:](v14, "initWithChannel:usage:availableChannels:", v9, v15, v10);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __77__CNGeminiManager_geminiResultForContact_substituteDefaultForDangling_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unformattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bestChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:(void *)a4 defaultChannelIdentifier:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "count")
      && (-[CNGeminiManager mostRecentChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:](a1, v7, v8),
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v10, &unk_1E2A3FEA0);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      v11 = 0;
      a1 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v9, &unk_1E2A3FEB8);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }

  }
  return a1;
}

- (id)bestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;

  -[CNGeminiManager geminiResultForHandle:contactStore:substituteDefaultForDangling:error:](self, a3, a4, 1, (uint64_t)a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNGeminiResult)geminiResultForHandle:(void *)a3 contactStore:(uint64_t)a4 substituteDefaultForDangling:(uint64_t)a5 error:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  CNGeminiResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CNGeminiChannel *v25;
  void *v26;
  CNGeminiResult *v27;
  void *v28;
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (a1
    && (v11 = *MEMORY[0x1E0D13848],
        objc_msgSend(v9, "stringValue"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12),
        v12,
        (v11 & 1) == 0))
  {
    if (!objc_msgSend(v9, "handleType") || objc_msgSend(v9, "handleType") == -1)
    {
      if (v10)
      {
        objc_msgSend(v9, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNGeminiManager contactForPhoneString:contactStore:]((uint64_t)a1, v15, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(a1, "geminiResultForContact:substituteDefaultForDangling:error:", v16, a4, a5);
          v13 = (CNGeminiResult *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
      }
      objc_msgSend(v9, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v30 = 0;
    v31 = 0;
    -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](a1, a4 ^ 1, &v31, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v31;
    v20 = v30;
    objc_msgSend(v18, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "channelIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager bestChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:defaultChannelIdentifier:](a1, v14, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "first");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v24);
    v25 = (CNGeminiChannel *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v25 = [CNGeminiChannel alloc];
      objc_msgSend(v23, "first");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v25 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v25->super.isa, v26, &stru_1E29FF900, 0, 0, 0, 0);

    }
    v27 = [CNGeminiResult alloc];
    objc_msgSend(v23, "second");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNGeminiResult initWithChannel:usage:availableChannels:](v27, "initWithChannel:usage:availableChannels:", v25, objc_msgSend(v28, "unsignedIntegerValue"), v20);

  }
  else
  {
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (id)geminiResultForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  return -[CNGeminiManager geminiResultForHandle:contactStore:substituteDefaultForDangling:error:](self, a3, a4, 0, (uint64_t)a5);
}

- (id)mostRecentChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (a1 && objc_msgSend((id)objc_opt_class(), "deviceSupportsGemini"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager channelIdentifierForMostRecentCallFromPhoneNumbers:fromChannelIdentifiers:]((uint64_t)a1, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "dataSourceExclusions") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]((uint64_t)a1, v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "_cn_addNonNilObject:", v8);
    objc_msgSend(v7, "_cn_addNonNilObject:", v9);
    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_155);
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)channelIdentifierForMostRecentCallFromPhoneNumbers:(uint64_t)a1 fromChannelIdentifiers:(void *)a2
{
  Class (__cdecl *v2)();
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;

  if (a1)
  {
    v2 = (Class (__cdecl *)())getCHManagerClass;
    v3 = a2;
    v4 = objc_alloc_init(v2());
    objc_msgSend(v4, "latestCallMatchingNormalizedRemoteParticipantHandleValues:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "outgoingLocalParticipantUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "date");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v7, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)channelIdentifierForMostRecentSMSFromPhoneNumbers:(void *)a3 fromChannelIdentifiers:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (*IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc)(id, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!IMCoreLibraryCore_frameworkLibrary)
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (IMCoreLibraryCore_frameworkLibrary && getIMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc())
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc = (void (*)(id, id))getIMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc();
    if (IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc)
    {
      IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc(v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "labelID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0D13AF8];
          objc_msgSend(v12, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pairWithFirst:second:", v13, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

      goto LABEL_15;
    }
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
LABEL_18:
    v16 = 0;
    goto LABEL_16;
  }
  v16 = 0;
LABEL_15:

LABEL_16:
  return v16;
}

uint64_t __85__CNGeminiManager_mostRecentChannelIdentifierForPhoneNumbers_fromChannelIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)channelForFavoritesEntry:(void *)a1 includeDanglingChannels:(void *)a2 error:(int)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (a1
    && (v7 = *MEMORY[0x1E0D13848],
        objc_msgSend(v5, "actionChannel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        (v7 & 1) == 0))
  {
    -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](a1, a3, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager channelForPreferredChannelString:fromChannels:synthesizeMissingChannels:](a1, v11, v10, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)channelForFavoritesEntry:(id)a3 error:(id *)a4
{
  return -[CNGeminiManager channelForFavoritesEntry:includeDanglingChannels:error:](self, a3, 1);
}

- (id)bestSenderIdentityForFavoritesEntry:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[CNGeminiManager channelForFavoritesEntry:includeDanglingChannels:error:](self, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)badgeLabelForSenderIdentity:(id)a3 error:(id *)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "localizedShortName");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, __CFString *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v6))
  {

    -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager coreTelephonyClient](self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getSimLabel:error:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_take:", 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6))
    {

      v6 = CFSTR("?");
    }

  }
  return v6;
}

- (id)fetchedSubscriptionForSenderIdentity:(id)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[CNGeminiManager fetchedSubscriptionsWithError:](v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiManager coreTelephonyClient](v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CNGeminiManager_fetchedSubscriptionForSenderIdentity___block_invoke;
    v11[3] = &unk_1E29F8558;
    v12 = v5;
    v13 = v7;
    v8 = v7;
    v9 = v5;
    objc_msgSend(v4, "_cn_firstObjectPassingTest:", v11);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)remapChannelIdentifier:(id)a3 toIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  id v18;
  _BOOL4 v19;
  int v20;
  BOOL v21;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v8) & 1) != 0
    || (*(unsigned int (**)(uint64_t, id))(v10 + 16))(v10, v9))
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 205, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a5)
      *a5 = objc_retainAutorelease(v11);

    v13 = 0;
  }
  else
  {
    v14 = (void *)objc_opt_new();
    v23 = 0;
    v15 = -[CNGeminiManager remapContactsHavingPreferredChannelIdentifier:toPreferredChannelIdentifier:contactStore:error:](self, "remapContactsHavingPreferredChannelIdentifier:toPreferredChannelIdentifier:contactStore:error:", v8, v9, v14, &v23);
    v16 = v23;
    v17 = v16;
    v18 = 0;
    if (!v15)
      v18 = v16;
    v19 = -[CNGeminiManager remapRecentCallsHavingChannelIdentifier:toChannelIdentifier:error:]((uint64_t)self, v8, v9);
    v20 = v19 && v15;
    if (!v19 && v15)
    {

      v20 = 0;
      v18 = 0;
    }
    v21 = -[CNGeminiManager remapMessagesHavingChannelIdentifier:toChannelIdentifier:error:]((uint64_t)self, v8, v9);
    v13 = v21 & v20;
    if (!v21 && v20)
    {

      v13 = 0;
      v18 = 0;
    }
    if (a5 && !v13)
      *a5 = objc_retainAutorelease(v18);

  }
  return v13;
}

- (BOOL)remapRecentCallsHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3
{
  Class (__cdecl *v5)();
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = (Class (__cdecl *)())getTUCallHistoryManagerClass[0];
    v6 = a3;
    v7 = a2;
    v8 = objc_alloc_init(v5());
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    objc_msgSend(v8, "updateOutgoingLocalParticipantUUID:forCallsWithOutgoingLocalParticipantUUID:", v10, v9);

  }
  return a1 != 0;
}

- (BOOL)remapMessagesHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void (*IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc)(id, id);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!IMCoreLibraryCore_frameworkLibrary)
      IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (IMCoreLibraryCore_frameworkLibrary)
    {
      if (getIMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc())
      {
        v7 = *MEMORY[0x1E0D13848];
        if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v6) & 1) == 0
          && ((*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v5) & 1) == 0)
        {
          v8 = v5;
          v9 = v6;
          IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc = (void (*)(id, id))getIMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc();
          if (!IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc)
            -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:].cold.1();
          IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc(v8, v9);

        }
      }
    }
  }

  return a1 != 0;
}

- (BOOL)remapContactsHavingPreferredChannelIdentifier:(id)a3 toPreferredChannelIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactFetchRequest *v14;
  void *v15;
  CNContactFetchRequest *v16;
  void *v17;
  id v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  char v23;
  id v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  objc_msgSend(CFSTR("uuid:"), "stringByAppendingString:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("uuid:"), "stringByAppendingString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNContact predicateForContactsMatchingPreferredChannel:limitOne:](CNContact, "predicateForContactsMatchingPreferredChannel:limitOne:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [CNContactFetchRequest alloc];
  v31[0] = CFSTR("preferredChannel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNContactFetchRequest initWithKeysToFetch:](v14, "initWithKeysToFetch:", v15);

  -[CNContactFetchRequest setUnifyResults:](v16, "setUnifyResults:", 0);
  -[CNContactFetchRequest setMutableObjects:](v16, "setMutableObjects:", 1);
  -[CNContactFetchRequest setPredicate:](v16, "setPredicate:", v13);
  v17 = (void *)objc_opt_new();
  v30 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __113__CNGeminiManager_remapContactsHavingPreferredChannelIdentifier_toPreferredChannelIdentifier_contactStore_error___block_invoke;
  v27[3] = &unk_1E29F84B8;
  v18 = v12;
  v28 = v18;
  v19 = v17;
  v29 = v19;
  v20 = objc_msgSend(v9, "enumerateContactsWithFetchRequest:error:usingBlock:", v16, &v30, v27);
  v21 = v30;
  v22 = v21;
  if (v20)
  {
    v26 = v21;
    v23 = objc_msgSend(v9, "executeSaveRequest:error:", v19, &v26);
    v24 = v26;

    v22 = v24;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    v23 = 0;
    if (!a6)
      goto LABEL_7;
  }
  if ((v23 & 1) == 0)
    *a6 = objc_retainAutorelease(v22);
LABEL_7:

  return v23;
}

void __113__CNGeminiManager_remapContactsHavingPreferredChannelIdentifier_toPreferredChannelIdentifier_contactStore_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPreferredChannel:", v3);
  objc_msgSend(*(id *)(a1 + 40), "updateContact:", v4);

}

- (BOOL)isReferencedByContactsForSenderLabelIdentifier:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  void *v7;
  CNContactFetchRequest *v8;
  void *v9;
  CNContactFetchRequest *v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[CNContact predicateForContactsMatchingPreferredChannel:limitOne:](CNContact, "predicateForContactsMatchingPreferredChannel:limitOne:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CNContactFetchRequest alloc];
  v18[0] = CFSTR("preferredChannel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactFetchRequest initWithKeysToFetch:](v8, "initWithKeysToFetch:", v9);

  -[CNContactFetchRequest setUnifyResults:](v10, "setUnifyResults:", 0);
  -[CNContactFetchRequest setPredicate:](v10, "setPredicate:", v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__CNGeminiManager_isReferencedByContactsForSenderLabelIdentifier_store___block_invoke;
  v13[3] = &unk_1E29F80D0;
  v13[4] = &v14;
  if (objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v13))
  {
    v11 = *((_BYTE *)v15 + 24) != 0;
  }
  else
  {
    v11 = 1;
    *((_BYTE *)v15 + 24) = 1;
  }

  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __72__CNGeminiManager_isReferencedByContactsForSenderLabelIdentifier_store___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CNGeminiManager_removeDelegate___block_invoke;
  block[3] = &unk_1E29F7CE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __34__CNGeminiManager_removeDelegate___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[5];
  return objc_msgSend(v1, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)bestSubscriptionForContact:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[CNGeminiManager bestSenderIdentityForContact:error:](self, "bestSenderIdentityForContact:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bestSubscriptionForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  -[CNGeminiManager bestSenderIdentityForHandle:contactStore:error:](self, "bestSenderIdentityForHandle:contactStore:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fetchedSubscriptionsWithError:(id)a1
{
  id v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v2 = a1;
  if (a1)
  {
    -[CNGeminiManager coreTelephonyClient](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getSubscriptionInfoWithError:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNGeminiManager coreTelephonyClient](v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptionsInUse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__CNGeminiManager_fetchedSubscriptionsWithError___block_invoke;
    v10[3] = &unk_1E29F8530;
    v11 = v6;
    v8 = v6;
    objc_msgSend(v7, "_cn_filter:", v10);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t __49__CNGeminiManager_fetchedSubscriptionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isSimHidden") & 1) != 0 || (objc_msgSend(v3, "isSimDataOnly") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getPhoneNumber:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D13848];
    objc_msgSend(v5, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v7) ^ 1;

  }
  return v4;
}

uint64_t __56__CNGeminiManager_fetchedSubscriptionForSenderIdentity___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "getPhoneNumber:error:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v5;
}

- (id)badgeLabelForSubscription:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) != 0)
  {
    v7 = CFSTR("?");
  }
  else
  {
    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    objc_msgSend(v8, "substringToIndex:", v10 + v11);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)dataSourceExclusions
{
  return self->_dataSourceExclusions;
}

- (void)setDataSourceExclusions:(unint64_t)a3
{
  self->_dataSourceExclusions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (uint64_t)channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __LoadTelephonyUtilities_block_invoke_cold_1(v0);
}

@end

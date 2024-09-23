@implementation DRSTaskingMessageChannel

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DRSTaskingMessageChannel config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Subscribed Channel with config: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (DRSTaskingMessageChannel)initWithCloudChannelConfig:(id)a3 payloadProcessingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  DRSTaskingMessageChannel *v10;
  void *v11;
  id processingBlock;
  id v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *workQueue;
  void *v16;
  char v17;
  int v18;
  id *v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  DRSTaskingMessageChannel *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  PKPublicChannel *v32;
  PKPublicChannel *pubSubChannel;
  NSString *apsEnvironmentString;
  NSObject *v35;
  void *v36;
  void *v37;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    DPLogHandle_TaskingMessageChannelError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v20))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "InvalidChannelConfiguration";
    v22 = "Channel config cannot be nil";
    goto LABEL_12;
  }
  if (!v8)
  {
    DPLogHandle_TaskingMessageChannelError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v20))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "MissingProcessingBlock";
    v22 = "Payload processing block is required.";
LABEL_12:
    v23 = v20;
    v24 = 2;
LABEL_13:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v21, v22, buf, v24);
    goto LABEL_14;
  }
  v43.receiver = self;
  v43.super_class = (Class)DRSTaskingMessageChannel;
  v10 = -[DRSTaskingMessageChannel init](&v43, sel_init);
  self = v10;
  if (!v10)
  {
LABEL_22:
    self = self;
    v25 = self;
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v10->_config, a3);
  v11 = _Block_copy(v9);
  processingBlock = self->_processingBlock;
  self->_processingBlock = v11;

  -[DRSTaskingMessageChannel debugDescription](self, "debugDescription");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
  workQueue = self->_workQueue;
  self->_workQueue = v14;

  -[DRSTaskingMessageChannel config](self, "config");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isNoSubscriptionConfig");

  if ((v17 & 1) != 0)
  {
LABEL_19:
    DPLogHandle_TaskingMessageChannel();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v35))
    {
      -[DRSTaskingMessageChannel config](self, "config");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "debugDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewChannelInstance", "New channel instance: %{public}@", buf, 0xCu);

    }
    goto LABEL_22;
  }
  v18 = objc_msgSend(v7, "environment");
  if (v18 == 1)
  {
    v19 = (id *)MEMORY[0x1E0CFE128];
  }
  else
  {
    if (v18 != 2)
    {
LABEL_24:
      DPLogHandle_TaskingMessageChannelError();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v20))
        goto LABEL_14;
      v39 = objc_msgSend(v7, "environment");
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v39;
      v21 = "InvalidEnvironmentEnum";
      v22 = "Invalid environment enum %hhu";
      v23 = v20;
      v24 = 8;
      goto LABEL_13;
    }
    v19 = (id *)MEMORY[0x1E0CFE130];
  }
  v26 = *v19;
  if (!v26)
    goto LABEL_24;
  v20 = v26;
  objc_msgSend(v7, "channelName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = objc_alloc(MEMORY[0x1E0CD22E8]);
    -[DRSTaskingMessageChannel config](self, "config");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "channelID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (PKPublicChannel *)objc_msgSend(v29, "initWithChannelID:", v31);
    pubSubChannel = self->_pubSubChannel;
    self->_pubSubChannel = v32;

    apsEnvironmentString = self->_apsEnvironmentString;
    self->_apsEnvironmentString = (NSString *)&v20->isa;

    goto LABEL_19;
  }
  DPLogHandle_TaskingMessageChannelError();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v40))
  {
    DRSSystemProfilePlatformStringForPlatform(objc_msgSend(v7, "platform"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[DRSCloudChannelConfig stringForChannelType:](DRSCloudChannelConfig, "stringForChannelType:", objc_msgSend(v7, "type"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v41;
    v46 = 2114;
    v47 = v42;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidChannelConfiguration", "Failed to produce a channel name for %{public}@ %{public}@", buf, 0x16u);

  }
LABEL_14:

  v25 = 0;
LABEL_23:

  return v25;
}

- (BOOL)subscribe:(id *)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[DRSTaskingMessageChannel workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DRSTaskingMessageChannel_subscribe___block_invoke;
  block[3] = &unk_1EA3D1F58;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

void __38__DRSTaskingMessageChannel_subscribe___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNoSubscriptionConfig");

  if (v3)
  {
    DPLogHandle_TaskingMessageChannelError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "config");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v6;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionIsNoOp", "Not subscribing due to config %{public}@", buf, 0xCu);

LABEL_4:
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "apsConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CFE148]);
    objc_msgSend(*(id *)(a1 + 32), "apsEnvironmentString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithEnvironmentName:namedDelegatePort:queue:", v9, CFSTR("com.apple.aps.diagnosticpipeline.tasking"), v10);
    objc_msgSend(*(id *)(a1 + 32), "setApsConnection:", v11);

    objc_msgSend(*(id *)(a1 + 32), "apsConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      DPLogHandle_TaskingMessageChannelError();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v37))
      {
        objc_msgSend(*(id *)(a1 + 32), "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v38;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "APSConnectionInitFailure", "Failed to create connection for %{public}@", buf, 0xCu);

      }
      if (*(_QWORD *)(a1 + 48))
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v56 = *MEMORY[0x1E0CB2D50];
        v57[0] = CFSTR("APSConnection could not be initialized");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticRequestCloudChannelError"), 0, v40);
        **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "apsConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v13);

    objc_msgSend(*(id *)(a1 + 32), "apsConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = CFSTR("com.apple.symptomsd-diag");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabledTopics:ignoredTopics:", v16, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "apsConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v17, "registeredChannelsForTopic:error:", CFSTR("com.apple.symptomsd-diag"), &v49);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v49;

  if (!v19)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = v18;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v23)
    {
      v25 = v23;
      v44 = 0;
      v26 = *(_QWORD *)v46;
      *(_QWORD *)&v24 = 138543362;
      v43 = v24;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v28, "channelID", v43);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "pubSubChannel");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "channelID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v29, "isEqualToString:", v31);

          if (v32)
          {
            DPLogHandle_TaskingMessageChannel();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v33))
            {
              objc_msgSend(*(id *)(a1 + 32), "debugDescription");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v43;
              v52 = v34;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AlreadySubscribedToChannel", "Already subscribed to %{public}@", buf, 0xCu);

            }
            v44 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "apsConnection");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "unsubscribeFromChannel:forTopic:", v28, CFSTR("com.apple.symptomsd-diag"));

            DPLogHandle_TaskingMessageChannelError();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v33))
            {
              objc_msgSend(v28, "channelID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v43;
              v52 = v36;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscribedToUnexpectedChannel", "Subscribed to unexpected channel %{public}@. Unsubscribing", buf, 0xCu);

            }
          }

        }
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v25);

      if ((v44 & 1) != 0)
        goto LABEL_6;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "apsConnection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pubSubChannel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "subscribeToChannel:forTopic:", v42, CFSTR("com.apple.symptomsd-diag"));

    DPLogHandle_TaskingMessageChannel();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscribe", "Subscribing to channel %{public}@", buf, 0xCu);
      goto LABEL_4;
    }
LABEL_5:

LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  DPLogHandle_TaskingMessageChannelError();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v21;
    v53 = 2114;
    v54 = v19;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscribedChannelCheckFailure", "Failed to check for subscribed channel for %{public}@ due to error: %{public}@", buf, 0x16u);

  }
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v19);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

- (BOOL)unsubscribe:(id *)a3
{
  DRSTaskingMessageChannel *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[DRSTaskingMessageChannel workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__DRSTaskingMessageChannel_unsubscribe___block_invoke;
  v6[3] = &unk_1EA3D1DD0;
  v6[4] = v3;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __40__DRSTaskingMessageChannel_unsubscribe___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNoSubscriptionConfig");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "apsConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "apsConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pubSubChannel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unsubscribeFromChannel:forTopic:", v9, CFSTR("com.apple.symptomsd-diag"));

      objc_msgSend(*(id *)(a1 + 32), "apsConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shutdown");

      objc_msgSend(*(id *)(a1 + 32), "apsConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setApsConnection:", 0);
      DPLogHandle_TaskingMessageChannel();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v4))
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v5;
      v12 = "ChannelUnsubscribe";
      v13 = "Unsubscribing from channel %{public}@";
    }
    else
    {
      DPLogHandle_TaskingMessageChannel();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v4))
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v5;
      v12 = "RedundantUnsubscribe";
      v13 = "No APS connection for %{public}@";
    }
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_10;
  }
  DPLogHandle_TaskingMessageChannelError();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnsubscribeIsNoOp", "Not subscribed due to config:\n%{public}@", (uint8_t *)&v14, 0xCu);

LABEL_10:
  }
LABEL_11:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  DPLogHandle_TaskingMessageChannel();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    -[DRSTaskingMessageChannel config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "channelName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedPublicDeviceToken", "Received public token %{public}@ for channel name %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  DPLogHandle_TaskingMessageChannel();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    -[DRSTaskingMessageChannel config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "channelName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAPNSToken", "Received APNS token %{public}@ for topic: %{public}@ identifier: %{public}@ channel name: %{public}@", (uint8_t *)&v15, 0x2Au);

  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  DPLogHandle_TaskingMessageChannel();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    -[DRSTaskingMessageChannel debugDescription](self, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedMessage", "Received message on %{public}@\n%{public}@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tasking_payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    DPLogHandle_TaskingMessageChannelError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      -[DRSTaskingMessageChannel debugDescription](self, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = CFSTR("tasking_payload");
      v20 = 2114;
      v21 = v13;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MessageMissingPayload", "Message on %{public}@ missing %{public}@ key\n%{public}@", (uint8_t *)&v16, 0x20u);

    }
  }
  -[DRSTaskingMessageChannel processingBlock](self, "processingBlock");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[DRSTaskingMessageChannel config](self, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v14)[2](v14, v10, v15);

}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const __CFString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  DPLogHandle_TaskingMessageChannelError();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscriptionFailed", (const char *)&unk_1DBC04191, buf, 2u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        DPLogHandle_TaskingMessageChannelError();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v12))
        {
          v13 = objc_msgSend(v11, "failureReason");
          v14 = CFSTR("INVALID REASON. FILE A BUG AGAINST 'Apple Push Service|all'");
          if (!v13)
            v14 = CFSTR("Bad channel ID");
          *(_DWORD *)buf = 138543362;
          v20 = v14;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ChannelSubscriptionFailure", "Failure: %{public}@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

}

- (DRSCloudChannelConfig)config
{
  return self->_config;
}

- (id)processingBlock
{
  return self->_processingBlock;
}

- (PKPublicChannel)pubSubChannel
{
  return self->_pubSubChannel;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pubSubChannel, 0);
  objc_storeStrong(&self->_processingBlock, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end

@implementation HMNetworkRouterFirewallRuleManager

- (HMNetworkRouterFirewallRuleManager)initWithHomeManager:(id)a3
{
  id v4;
  HMNetworkRouterFirewallRuleManager *v5;
  HMNetworkRouterFirewallRuleManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HMFMessageDestination *messageDestination;
  HMNetworkRouterFirewallRuleManager *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMNetworkRouterFirewallRuleManager;
  v5 = -[HMNetworkRouterFirewallRuleManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeManager, v4);
    v7 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v4, "messageTargetUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithTarget:", v8);
    messageDestination = v6->_messageDestination;
    v6->_messageDestination = (HMFMessageDestination *)v9;

    v11 = v6;
  }

  return v6;
}

- (void)__sendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[HMNetworkRouterFirewallRuleManager homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke;
  v10[3] = &unk_1E3AB5ED8;
  v11 = v4;
  v12 = v5;
  v8 = v5;
  v9 = v4;
  dispatch_async(v7, v10);

}

- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  HMNetworkRouterFirewallRuleManager *v28;
  id v29;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("HMNetworkRouterFirewallRuleManagerProductGroupKey"));
  if (v15)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("HMNetworkRouterFirewallRuleManagerProductNumberKey"));
  if (!v11)
  {
    if (!v10)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpCloudRecordsListOnlyKey"));
    if (!v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"));
  if (v10)
    goto LABEL_11;
LABEL_7:
  if (v9)
LABEL_8:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpCloudRecordsVerifySignaturesKey"));
LABEL_9:
  v19 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v19, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpCloudRecordsMessageKey"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __132__HMNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
  v27 = &unk_1E3AB59B8;
  v28 = self;
  v29 = v16;
  v23 = v16;
  objc_msgSend(v22, "setResponseHandler:", &v24);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v22, v24, v25, v26, v27, v28);

}

- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  -[HMNetworkRouterFirewallRuleManager _dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:](self, "_dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:", a3, 0, a4, 1, 0, a5);
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
  -[HMNetworkRouterFirewallRuleManager _dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:](self, "_dumpCloudRecordsForProductGroup:productNumber:rawOutput:listOnly:verifySignatures:completion:", a3, a4, a5, 0, a6, a7);
}

- (void)_dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMNetworkRouterFirewallRuleManager *v29;
  id v30;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("HMNetworkRouterFirewallRuleManagerProductGroupKey"));
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("HMNetworkRouterFirewallRuleManagerProductNumberKey"));
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("HMNetworkRouterFirewallRuleManagerDumpLocalRulesFirmwareVersionKey"));
  if (v10)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpLocalRulesIgnoreOverridesKey"));
  if (v9)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"));
  v20 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v20, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpLocalRulesMessageKey"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __136__HMNetworkRouterFirewallRuleManager__dumpLocalRulesForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
  v28 = &unk_1E3AB59B8;
  v29 = self;
  v30 = v17;
  v24 = v17;
  objc_msgSend(v23, "setResponseHandler:", &v25);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v23, v25, v26, v27, v28, v29);

}

- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  -[HMNetworkRouterFirewallRuleManager _dumpLocalRulesForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:](self, "_dumpLocalRulesForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:", 0, 0, 0, a3, a4, a5);
}

- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6
{
  -[HMNetworkRouterFirewallRuleManager _dumpLocalRulesForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:](self, "_dumpLocalRulesForProductGroup:productNumber:firmwareVersion:ignoreOverrides:rawOutput:completion:", a3, 0, 0, a4, a5, a6);
}

- (void)_dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMNetworkRouterFirewallRuleManager *v29;
  id v30;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("HMNetworkRouterFirewallRuleManagerProductGroupKey"));
  if (v15)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("HMNetworkRouterFirewallRuleManagerProductNumberKey"));
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("HMNetworkRouterFirewallRuleManagerDumpPairedMetadataFirmwareVersionKey"));
  if (v10)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpPairedMetadataIgnoreOverridesKey"));
  if (v9)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"));
  v20 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v20, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpPairedMetadataMessageKey"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __140__HMNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
  v28 = &unk_1E3AB59B8;
  v29 = self;
  v30 = v17;
  v24 = v17;
  objc_msgSend(v23, "setResponseHandler:", &v25);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v23, v25, v26, v27, v28, v29);

}

- (void)removeAllLocalRulesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  HMNetworkRouterFirewallRuleManager *v13;
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerRemoveLocalRulesMessageKey"), v6, MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __72__HMNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke;
  v12 = &unk_1E3AB59B8;
  v13 = self;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v7, "setResponseHandler:", &v9);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v7, v9, v10, v11, v12, v13);

}

- (void)_addOverrides:(id)a3 replace:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v5 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v19[0] = CFSTR("HMNetworkRouterFirewallRuleManagerAddOverridesDataKey");
  v19[1] = CFSTR("HMNetworkRouterFirewallRuleManagerAddOverridesReplaceKey");
  v20[0] = a3;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerAddOverridesMessageKey"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__HMNetworkRouterFirewallRuleManager__addOverrides_replace_completion___block_invoke;
  v17[3] = &unk_1E3AB59B8;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "setResponseHandler:", v17);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v15);

}

- (void)setOverrides:(id)a3 completion:(id)a4
{
  -[HMNetworkRouterFirewallRuleManager _addOverrides:replace:completion:](self, "_addOverrides:replace:completion:", a3, 1, a4);
}

- (void)addOverrides:(id)a3 completion:(id)a4
{
  -[HMNetworkRouterFirewallRuleManager _addOverrides:replace:completion:](self, "_addOverrides:replace:completion:", a3, 0, a4);
}

- (void)_removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  HMNetworkRouterFirewallRuleManager *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("HMNetworkRouterFirewallRuleManagerProductGroupKey"));
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("HMNetworkRouterFirewallRuleManagerProductNumberKey"));
  v13 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerRemoveOverridesMessageKey"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __95__HMNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke;
  v21 = &unk_1E3AB59B8;
  v22 = self;
  v23 = v10;
  v17 = v10;
  objc_msgSend(v16, "setResponseHandler:", &v18);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v16, v18, v19, v20, v21, v22);

}

- (void)removeAllOverridesWithCompletion:(id)a3
{
  -[HMNetworkRouterFirewallRuleManager _removeOverridesForProductGroup:productNumber:completion:](self, "_removeOverridesForProductGroup:productNumber:completion:", 0, 0, a3);
}

- (void)_fetchCloudChangesWithForceChangesFound:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  HMNetworkRouterFirewallRuleManager *v18;
  id v19;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HMNetworkRouterFirewallRuleManagerFetchCloudChangesForceChangeNotificationsKey"));
  v9 = (void *)MEMORY[0x1E0D285F8];
  -[HMNetworkRouterFirewallRuleManager messageDestination](self, "messageDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("HMNetworkRouterFirewallRuleManagerFetchCloudChangesMessageKey"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __89__HMNetworkRouterFirewallRuleManager__fetchCloudChangesWithForceChangesFound_completion___block_invoke;
  v17 = &unk_1E3AB59B8;
  v18 = self;
  v19 = v6;
  v13 = v6;
  objc_msgSend(v12, "setResponseHandler:", &v14);
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v12, v14, v15, v16, v17, v18);

}

- (void)fetchCloudChangesWithCompletion:(id)a3
{
  -[HMNetworkRouterFirewallRuleManager _fetchCloudChangesWithForceChangesFound:completion:](self, "_fetchCloudChangesWithForceChangesFound:completion:", 0, a3);
}

- (void)fetchCloudChangesAndForceChangesFoundWithCompletion:(id)a3
{
  -[HMNetworkRouterFirewallRuleManager _fetchCloudChangesWithForceChangesFound:completion:](self, "_fetchCloudChangesWithForceChangesFound:completion:", 1, a3);
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (HMFMessageDestination)messageDestination
{
  return self->_messageDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDestination, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __89__HMNetworkRouterFirewallRuleManager__fetchCloudChangesWithForceChangesFound_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __95__HMNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __71__HMNetworkRouterFirewallRuleManager__addOverrides_replace_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __72__HMNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __140__HMNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpResponseKey"));
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:obj:", *(_QWORD *)(a1 + 40), v8, a3);

}

void __136__HMNetworkRouterFirewallRuleManager__dumpLocalRulesForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpResponseKey"));
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:obj:", *(_QWORD *)(a1 + 40), v8, a3);

}

void __132__HMNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMNetworkRouterFirewallRuleManagerDumpResponseKey"));
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:obj:", *(_QWORD *)(a1 + 40), v8, a3);

}

void __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_2;
  v10 = &unk_1E3AB59B8;
  v11 = *(id *)(a1 + 40);
  v12 = v2;
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  objc_msgSend(v3, "setResponseHandler:", &v7);
  objc_msgSend(*(id *)(a1 + 40), "context", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessage:completionHandler:", *(_QWORD *)(a1 + 32), 0);

}

void __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_3;
  v12[3] = &unk_1E3AB4D20;
  v13 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v9;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, v12);

}

uint64_t __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[5], a1[6]);
}

@end

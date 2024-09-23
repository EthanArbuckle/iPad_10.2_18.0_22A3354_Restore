@implementation SGAutonamingConsumer

- (SGAutonamingConsumer)init
{
  SGAutonamingConsumer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGAutonamingConsumer;
  v2 = -[SGAutonamingConsumer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerMessagesConsumer:levelOfService:", v2, 1);

  }
  return v2;
}

- (id)consumerName
{
  return CFSTR("com.apple.CoreSuggestionsInternals.AutonamingConsumer");
}

- (int)_sendEvents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        BiomeLibrary();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "Autonaming");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "Messages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "MessageIds");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sendEvent:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  v14 = objc_msgSend(v3, "count");

  return v14;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isGroupThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413059;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v5;
      v38 = 2117;
      v39 = v6;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@ -- rejected for autonaming stream", buf, 0x2Au);

    }
    v14 = 0;
  }
  else
  {
    if (v10)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413059;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v5;
      v38 = 2117;
      v39 = v6;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@ -- selected for autonaming stream", buf, 0x2Au);

    }
    v18 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "absoluteTimestamp");
    v9 = objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");
    v19 = objc_alloc(MEMORY[0x1E0D01F28]);
    v20 = *MEMORY[0x1E0D19A38];
    objc_msgSend(v6, "domainId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v19, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", &unk_1E7E0CDE0, v20, v21, v22, v23, v24, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAB0], v9);

    v31 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SGAutonamingConsumer _sendEvents:](self, "_sendEvents:", v26);

  }
  v27 = (void *)MEMORY[0x1E0D80F78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "successWithNumberOfExtractions:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  SGAutonamingConsumer *v20;
  id v21;
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  SEL v27;
  _QWORD v28[5];
  id v29;
  id v30;
  SEL v31;

  v5 = a3;
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Autonaming");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Messages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MessageIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v28[3] = &unk_1E7DB0EA8;
  v28[4] = self;
  v31 = a2;
  v29 = v9;
  v30 = v10;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
  v24[3] = &unk_1E7DB0EF8;
  v24[4] = self;
  v27 = a2;
  v25 = v29;
  v26 = v30;
  v16 = v11;
  v17 = 3221225472;
  v18 = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_16;
  v19 = &unk_1E7DB0F20;
  v20 = self;
  v21 = v25;
  v22 = v26;
  v23 = a2;
  v12 = v26;
  v13 = v25;
  objc_msgSend(v5, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:uniqueIdentifiersBlock:", v28, v24, &v16);

  -[SGAutonamingConsumer _sendEvents:](self, "_sendEvents:", v12, v16, v17, v18, v19, v20);
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "pruner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_11;
  v10[3] = &unk_1E7DB0E80;
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v9 = v3;
  objc_msgSend(v8, "deleteWithPolicy:eventsPassingTest:", CFSTR("autonaming-messageids"), v10);

}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v5;
    v24 = 2113;
    v25 = v6;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@ domain selection %{private}@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "pruner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_14;
  v14[3] = &unk_1E7DB0ED0;
  v15 = v5;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "deleteWithPolicy:eventsPassingTest:", CFSTR("autonaming-messageids"), v14);

}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v5;
    v24 = 2113;
    v25 = v6;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@ unique identifiers %{private}@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "pruner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_17;
  v14[3] = &unk_1E7DB0ED0;
  v15 = v5;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "deleteWithPolicy:eventsPassingTest:", CFSTR("autonaming-messageids"), v14);

}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);
    if ((_DWORD)v7)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v4, "spotlightId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

      if (!(_DWORD)v8)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v18 = objc_alloc(MEMORY[0x1E0D01F28]);
      objc_msgSend(v4, "bundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "domainId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "spotlightId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messageId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "conversationId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messageTimestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v18, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", &unk_1E7E0CDE0, v17, v10, v11, v12, v13, MEMORY[0x1E0C9AAB0], v14, v15);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }

  }
  else
  {
    v7 = 1;
  }
LABEL_8:

  return v7;
}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domainId");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v4, "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
      {

        v19 = 0;
        goto LABEL_9;
      }
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v4, "domainId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v9, "containsDomain:", v10);

      if ((_DWORD)v9)
      {
        v11 = objc_alloc(MEMORY[0x1E0D01F28]);
        v12 = *MEMORY[0x1E0D19A38];
        objc_msgSend(v4, "domainId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "spotlightId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messageId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "conversationId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messageTimestamp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v11, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", &unk_1E7E0CDE0, v12, v13, v14, v15, v16, MEMORY[0x1E0C9AAB0], v17, v18);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
        v19 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
LABEL_10:

  return v19;
}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    if (!(_DWORD)v5)
    {
      v16 = 0;
      goto LABEL_6;
    }
    v7 = objc_alloc(MEMORY[0x1E0D01F28]);
    v8 = *MEMORY[0x1E0D19A38];
    objc_msgSend(v4, "domainId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "initWithProtoVersion:bundleId:domainId:spotlightId:messageId:conversationId:isDeletion:containsImageAttachment:messageTimestamp:", &unk_1E7E0CDE0, v8, v9, v10, v11, v12, MEMORY[0x1E0C9AAB0], v13, v14);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
  }
  v16 = 1;
LABEL_6:

  return v16;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_23639 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_23639, &__block_literal_global_23640);
  return (id)sharedInstance__pasExprOnceResult_23641;
}

void __38__SGAutonamingConsumer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_23641;
  sharedInstance__pasExprOnceResult_23641 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

@implementation HMTelevisionProfile

uint64_t __67___HMTelevisionProfile__notifyDelegateOfUpdatedSourceDisplayOrder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "televisionProfileDidUpdateSourceDisplayOrder:", *(_QWORD *)(a1 + 40));
}

void __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
      objc_msgSend(v7, "serviceType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("000000D8-0000-1000-8000-0026BB765291"));

      if ((v9 & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v7;

    if (!v10)
      goto LABEL_12;
    v32[0] = CFSTR("kServiceInstanceID");
    objc_msgSend(v10, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("source-display-order");
    v33[0] = v11;
    v33[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D285F8];
    objc_msgSend(*(id *)(a1 + 32), "messageDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMTP.sdoUpdate"), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pendingRequests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _Block_copy(*(const void **)(a1 + 56));
    objc_msgSend(v17, "addCompletionBlock:forIdentifier:", v19, v18);

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke_2;
    v24[3] = &unk_1E3AB5C08;
    v25 = v17;
    v26 = v18;
    v27 = *(id *)(a1 + 48);
    v20 = v18;
    v21 = v17;
    objc_msgSend(v15, "setResponseHandler:", v24);
    objc_msgSend(*(id *)(a1 + 48), "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:completionHandler:", v15, 0);

  }
  else
  {
LABEL_9:

LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callCompletion:error:", v23, v15);
  }

}

void __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

void __53___HMTelevisionProfile__registerNotificationHandlers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSourceDisplayOrderUpdated:", v3);

}

- (HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4
{
  id v6;
  id v7;
  _HMTelevisionProfile *v8;
  HMTelevisionProfile *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = -[_HMTelevisionProfile initWithTelevisionService:linkedServices:]([_HMTelevisionProfile alloc], "initWithTelevisionService:linkedServices:", v7, v6);

  v11.receiver = self;
  v11.super_class = (Class)HMTelevisionProfile;
  v9 = -[HMAccessoryProfile initWithAccessoryProfile:](&v11, sel_initWithAccessoryProfile_, v8);
  if (v9)
    -[_HMTelevisionProfile setDelegate:](v8, "setDelegate:", v9);

  return v9;
}

- (NSArray)mediaSourceDisplayOrder
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "mediaSourceDisplayOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "mediaSourceDisplayOrderModifiable");
  return v5;
}

- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v10 = a3;
  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "updateMediaSourceDisplayOrder:completionHandler:", v10, v6);
}

- (void)televisionProfileDidUpdateSourceDisplayOrder:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HMTelevisionProfile *v13;

  -[HMTelevisionProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HMTelevisionProfile delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__HMTelevisionProfile_televisionProfileDidUpdateSourceDisplayOrder___block_invoke;
    v11[3] = &unk_1E3AB5ED8;
    v12 = v6;
    v13 = self;
    v10 = v6;
    objc_msgSend(v9, "invokeBlock:", v11);

  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMTelevisionProfile;
  v5 = -[HMAccessoryProfile mergeFromNewObject:](&v16, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "mediaSourceDisplayOrder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    -[HMTelevisionProfile mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqualToArray:", v13);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v12, "setMediaSourceDisplayOrder:", v9);
      -[HMTelevisionProfile televisionProfileDidUpdateSourceDisplayOrder:](self, "televisionProfileDidUpdateSourceDisplayOrder:", v12);
      v5 = 1;
    }

  }
  return v5;
}

- (HMTelevisionProfileDelegate)delegate
{
  return (HMTelevisionProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __68__HMTelevisionProfile_televisionProfileDidUpdateSourceDisplayOrder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "profileDidUpdateMediaSourceDisplayOrder:", *(_QWORD *)(a1 + 40));
}

@end

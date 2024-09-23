@implementation HUPrimaryUserItem

- (HUPrimaryUserItem)initWithHome:(id)a3 mediaProfileContainer:(id)a4 user:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  HUPrimaryUserItem *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserItem.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserItem.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserItem.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_4:
  v12 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v13 = (void *)objc_msgSend(v12, "initWithSuiteName:", *MEMORY[0x1E0D30790]);
  v19.receiver = self;
  v19.super_class = (Class)HUPrimaryUserItem;
  v14 = -[HFUserItem initWithHome:user:nameStyle:userDefaults:](&v19, sel_initWithHome_user_nameStyle_userDefaults_, v9, v11, 2, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_mediaProfileContainer, a4);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFUserItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHome:mediaProfileContainer:user:", v5, v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUPrimaryUserItem;
  -[HFUserItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HUPrimaryUserItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __49__HUPrimaryUserItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _DWORD v26[2];
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_preferredMediaUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hf_preferredUserSelectionType");

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26[0] = 67109376;
    v26[1] = v11;
    v27 = 1024;
    v28 = v13 == 1;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Is this the primary user?: %{BOOL}d isSelectionTypeHomeUser?: %{BOOL}d", (uint8_t *)v26, 0xEu);
  }

  if (v13 == 1)
    v15 = v11;
  else
    v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30DA0]);

  v17 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)objc_msgSend(v18, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "mutableCopy");

  }
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_dependentHomeKitObjectsForDownstreamItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unionSet:", v23);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v17);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end

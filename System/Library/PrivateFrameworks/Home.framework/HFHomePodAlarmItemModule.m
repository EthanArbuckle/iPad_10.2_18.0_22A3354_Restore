@implementation HFHomePodAlarmItemModule

- (HFHomePodAlarmItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4
{
  id v7;
  id v8;
  HFHomePodAlarmItemModule *v9;
  HFHomePodAlarmItemModule *v10;
  void *v11;
  HFHomePodAlarmItemProvider *v12;
  uint64_t v13;
  NSSet *itemProviders;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePodAlarmItemModule.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HFHomePodAlarmItemModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v17, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFHomePodAlarmItemProvider initWithMediaProfileContainer:]([HFHomePodAlarmItemProvider alloc], "initWithMediaProfileContainer:", v8);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    itemProviders = v10->_itemProviders;
    v10->_itemProviders = (NSSet *)v13;

  }
  return v10;
}

- (id)mobileTimerAdapterForAlarmItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "mobileTimerAdapter");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)mobileTimerAdapterForMediaProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "mediaProfileContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mediaProfiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v9, "mobileTimerAdapter");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HFMutableItemSection *v32;
  void *v33;
  HFMutableItemSection *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id obj;
  uint64_t v41;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[HFHomePodAlarmItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isControllable");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "hf_backingAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_siriEndpointProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 == 0;

  }
  v9 = objc_msgSend(v43, "count");
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v9 && !v6)
  {
    v39 = v3;
    v10 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (!v44)
      goto LABEL_29;
    v41 = *(_QWORD *)v52;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v45 = v11;
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        v46 = v12;
        objc_msgSend(v12, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "na_setByIntersectingWithSet:", v43);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v20)
        {
          v21 = v20;
          v22 = v14 > 1;
          v23 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v48 != v23)
                objc_enumerationMutation(v19);
              v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              v26 = objc_opt_class();
              v27 = v25;
              if (v27)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v28 = v27;
                else
                  v28 = 0;
                v29 = v27;
                if (v28)
                  goto LABEL_23;
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v26, objc_opt_class());

              }
              v29 = 0;
LABEL_23:

              v32 = [HFMutableItemSection alloc];
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), objc_msgSend(v29, "hash"));
              v34 = -[HFItemSection initWithIdentifier:](v32, "initWithIdentifier:", v33);

              if (v22)
              {
                objc_msgSend(v46, "mediaProfileContainer");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "hf_displayName");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFItemSection setHeaderTitle:](v34, "setHeaderTitle:", v36);

              }
              v55 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFItemSection setItems:](v34, "setItems:", v37);

              objc_msgSend(v10, "addObject:", v34);
              v22 = 0;
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            v22 = 0;
          }
          while (v21);
        }

        v11 = v45 + 1;
      }
      while (v45 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (!v44)
      {
LABEL_29:

        v3 = v39;
        break;
      }
    }
  }

  return v10;
}

- (void)mobileTimerAdapter:(id)a3 didUpdateAlarms:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFItemModule itemUpdater](self, "itemUpdater", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToReloadItemProviders:senderSelector:](HFItemUpdateRequest, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (void)registerForExternalUpdates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "mobileTimerAdapter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObserver:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)unregisterForExternalUpdates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFHomePodAlarmItemModule itemProviders](self, "itemProviders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "mobileTimerAdapter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end

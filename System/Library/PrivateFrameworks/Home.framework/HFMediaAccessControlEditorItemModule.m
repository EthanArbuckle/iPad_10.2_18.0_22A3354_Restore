@implementation HFMediaAccessControlEditorItemModule

- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessControlEditorItemModule.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessControlEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HFMediaAccessControlEditorItemModule *v8;
  HFMediaAccessControlEditorItemModule *v9;
  HFMediaAccessControlEditorItemProvider *v10;
  HFMediaAccessControlEditorItemProvider *accessControlEditorItemProvider;
  void *v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFMediaAccessControlEditorItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = -[HFMediaAccessControlEditorItemProvider initWithHome:]([HFMediaAccessControlEditorItemProvider alloc], "initWithHome:", v7);
    accessControlEditorItemProvider = v9->_accessControlEditorItemProvider;
    v9->_accessControlEditorItemProvider = v10;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addHomeObserver:", v9);

  }
  return v9;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  NSSet *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet na_safeAddObject:](v5, "na_safeAddObject:", v6);

    v7 = self->_itemProviders;
    self->_itemProviders = v5;
    v8 = v5;

    v3 = self->_itemProviders;
  }
  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HFMutableItemSection *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HFMutableItemSection *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessControlItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passwordEnableItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "passwordItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v12, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "intersectsSet:", v4);
  v38 = v9;
  v17 = 0;
  if (!objc_msgSend(v9, "intersectsSet:", v4))
  {
    if (!v16)
      goto LABEL_3;
LABEL_7:
    v28 = -[HFItemSection initWithIdentifier:]([HFMutableItemSection alloc], "initWithIdentifier:", CFSTR("ACCESS_CONTROL_PASSWORD_SECTION"));
    -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "passwordEnableItem");
    v37 = v4;
    v30 = v15;
    v31 = v5;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v32;
    -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "passwordItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v31;
    v15 = v30;
    v4 = v37;

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
    v39[3] = &unk_1EA7295B8;
    v40 = v37;
    objc_msgSend(v35, "na_filter:", v39);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemSection setItems:](v28, "setItems:", v36);

    objc_msgSend(v5, "addObject:", v28);
    v17 = v28;
    if (!v28)
      goto LABEL_5;
    goto LABEL_4;
  }
  v17 = -[HFItemSection initWithIdentifier:]([HFMutableItemSection alloc], "initWithIdentifier:", CFSTR("ACCESS_CONTROL_SECTION"));
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessControlItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v41[3] = &unk_1EA7295B8;
  v42 = v4;
  objc_msgSend(v24, "na_filter:", v41);
  v25 = v5;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection setItems:](v17, "setItems:", v26);

  v5 = v25;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessControlItemDisplayTitle"), CFSTR("HFMediaAccessControlItemDisplayTitle"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemSection setHeaderTitle:](v17, "setHeaderTitle:", v27);

  objc_msgSend(v25, "addObject:", v17);
  if (v16)
    goto LABEL_7;
LABEL_3:
  if (v17)
  {
LABEL_4:
    v18 = (void *)objc_opt_class();
    -[HFMediaAccessControlEditorItemModule home](self, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_accessControlDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_descriptionFooterTextForAccessControlDescriptor:hasNonPeerToPeerMediaAccessories:", v20, -[HFMediaAccessControlEditorItemModule _hasNonPeerToPeerMediaAccessories](self, "_hasNonPeerToPeerMediaAccessories"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemSection setFooterTitle:](v17, "setFooterTitle:", v21);

  }
LABEL_5:

  return v5;
}

uint64_t __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFMediaAccessControlEditorItemModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HFMediaAccessControlEditorItemModule_containsItem___block_invoke;
  v9[3] = &unk_1EA72C350;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __53__HFMediaAccessControlEditorItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)updateAccessControlDescriptor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a3;
  -[HFMediaAccessControlEditorItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToReloadItemProviders:senderSelector:](HFItemUpdateRequest, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFMediaAccessControlEditorItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_updateAccessControlDescriptor:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HFMediaAccessControlEditorItemModule_updateAccessControlDescriptor___block_invoke;
  v13[3] = &unk_1EA72C378;
  objc_copyWeak(&v15, &location);
  v10 = v7;
  v14 = v10;
  objc_msgSend(v9, "addCompletionBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __70__HFMediaAccessControlEditorItemModule_updateAccessControlDescriptor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;

  if (a3)
  {
    v4 = a3;
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "performItemUpdateRequest:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_hasNonPeerToPeerMediaAccessories
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessControlEditorItemModule home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_48);

  return v4;
}

BOOL __73__HFMediaAccessControlEditorItemModule__hasNonPeerToPeerMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "hf_mediaAccessControlCapabilities") & 3) == 1;
}

+ (id)_descriptionFooterTextForAccessControlDescriptor:(id)a3 hasNonPeerToPeerMediaAccessories:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  SEL v18;
  id v19;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addObject:", CFSTR("HFMediaAccessControlFooter"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke;
  v16[3] = &unk_1EA72C3C0;
  v9 = v7;
  v17 = v9;
  v18 = a2;
  v19 = a1;
  __122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke((uint64_t)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  if (objc_msgSend(v9, "accessSupportsPassword"))
  {
    if (objc_msgSend(v9, "accessRequiresPassword"))
      v11 = CFSTR("WithPassword");
    else
      v11 = CFSTR("NoPassword");
    objc_msgSend(v8, "addObject:", v11);
  }
  if (!objc_msgSend(v9, "access") && v4)
    objc_msgSend(v8, "addObject:", CFSTR("WithNonP2PAccessories"));
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedWiFiStringKeyForKey(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _HFLocalizedStringWithDefaultValue(v12, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

const __CFString *__122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "access");
  if (v2 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("HFMediaAccessControlEditorItemModule.m"), 147, CFSTR("This enum should never be hit."));

    return &stru_1EA741FF8;
  }
  else
  {
    v3 = CFSTR("Everyone");
    if (v2 == 1)
      v3 = CFSTR("SameNetwork");
    if (v2 == 2)
      return CFSTR("HomeUsersOnly");
    else
      return v3;
  }
}

- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFMediaAccessControlEditorItemModule itemProviders](self, "itemProviders", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToReloadItemProviders:senderSelector:](HFItemUpdateRequest, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v9);

}

- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFMediaAccessControlEditorItemModule itemProviders](self, "itemProviders", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToReloadItemProviders:senderSelector:](HFItemUpdateRequest, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v9);

}

- (void)home:(id)a3 didUpdateMediaPassword:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passwordItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessControlEditorItemModule accessControlEditorItemProvider](self, "accessControlEditorItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passwordEnableItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObjects:", v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToUpdateItems:senderSelector:](HFItemUpdateRequest, "requestToUpdateItems:senderSelector:", v11, a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "performItemUpdateRequest:", v14);

}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaAccessControlEditorItemProvider)accessControlEditorItemProvider
{
  return self->_accessControlEditorItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEditorItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end

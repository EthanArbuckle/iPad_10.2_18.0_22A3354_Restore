@implementation HFPinCodeListModule

- (HFPinCodeListModule)initWithItemUpdater:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 home:(id)a6 forAccessory:(id)a7
{
  id v13;
  id v14;
  id v15;
  HFPinCodeListModule *v16;
  HFPinCodeListModule *v17;
  objc_super v19;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HFPinCodeListModule;
  v16 = -[HFItemModule initWithItemUpdater:](&v19, sel_initWithItemUpdater_, a3);
  v17 = v16;
  if (v16)
  {
    v16->_listType = a5;
    objc_storeStrong((id *)&v16->_pinCodeManager, a4);
    objc_storeStrong((id *)&v17->_home, a6);
    objc_storeStrong((id *)&v17->_accessory, a7);
  }

  return v17;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v5;
  HFStaticItem *v6;
  HFStaticItem *v7;
  HFStaticItemProvider *v8;
  void *v9;
  uint64_t v10;
  HFStaticItem *v11;
  void *v12;
  void *v13;
  HFStaticItemProvider *v14;
  void *v15;
  void *v16;
  id v17;
  HFPinCodeItemProvider *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  HFPinCodeItemProvider *v23;
  void *v24;
  NSSet *v25;
  NSSet *v26;
  NSSet *v27;
  _QWORD v28[5];

  itemProviders = self->_itemProviders;
  if (itemProviders)
    return itemProviders;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  if (-[HFPinCodeListModule listType](self, "listType") == 2)
  {
    v6 = [HFStaticItem alloc];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __36__HFPinCodeListModule_itemProviders__block_invoke;
    v28[3] = &unk_1EA72E208;
    v28[4] = self;
    v7 = -[HFStaticItem initWithResultsBlock:](v6, "initWithResultsBlock:", v28);
    -[HFPinCodeListModule setAddPinCodeItem:](self, "setAddPinCodeItem:", v7);

    v8 = [HFStaticItemProvider alloc];
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[HFPinCodeListModule addPinCodeItem](self, "addPinCodeItem");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (void *)v10;
    objc_msgSend(v9, "setWithObject:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HFStaticItemProvider initWithItems:](v8, "initWithItems:", v13);
    -[NSSet addObject:](v5, "addObject:", v14);

    goto LABEL_8;
  }
  if (-[HFPinCodeListModule listType](self, "listType") == 3)
  {
    v11 = -[HFStaticItem initWithResultsBlock:]([HFStaticItem alloc], "initWithResultsBlock:", &__block_literal_global_60);
    -[HFPinCodeListModule setRevokePinCodeItem:](self, "setRevokePinCodeItem:", v11);

    v8 = [HFStaticItemProvider alloc];
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[HFPinCodeListModule revokePinCodeItem](self, "revokePinCodeItem");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_opt_class();
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = [HFPinCodeItemProvider alloc];
  objc_msgSend(v17, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFPinCodeListModule pinCodeManager](self, "pinCodeManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HFPinCodeListModule listType](self, "listType");
  -[HFPinCodeListModule accessory](self, "accessory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HFPinCodeItemProvider initWithHome:pinCodeManager:listType:forAccessory:](v18, "initWithHome:pinCodeManager:listType:forAccessory:", v19, v20, v21, v22);
  -[HFPinCodeListModule setPinCodeItemProvider:](self, "setPinCodeItemProvider:", v23);

  -[HFPinCodeListModule pinCodeItemProvider](self, "pinCodeItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet addObject:](v5, "addObject:", v24);

  v25 = self->_itemProviders;
  self->_itemProviders = v5;
  v26 = v5;

  v27 = self->_itemProviders;
  return v27;
}

id __36__HFPinCodeListModule_itemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("plus"), CFSTR("iconNames"));
  v3 = 1;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeAddButtonTitle"), CFSTR("HFPinCodeAddButtonTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasOptedToHH2");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "residentDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v9, "count") != 0;

  }
  HFLogForCategory(0x45uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "residentDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    objc_msgSend(*(id *)(a1 + 32), "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136316162;
    v19 = "-[HFPinCodeListModule itemProviders]_block_invoke";
    v20 = 1024;
    v21 = v3;
    v22 = 1024;
    v23 = v7;
    v24 = 2048;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowInvitePeople = %{BOOL}d because hasOptedToHH2 = %{BOOL}d | residentDevices.count = %ld | home %@", (uint8_t *)&v18, 0x2Cu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __36__HFPinCodeListModule_itemProviders__block_invoke_11()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeRevokeRemovedUserButtonTitle"), CFSTR("HFPinCodeRevokeRemovedUserButtonTitle"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, CFSTR("title"));

  objc_msgSend(v0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("hidden"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sectionIdentifier
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[HFPinCodeListModule listType](self, "listType");
  if (v2 - 1 > 3)
    v3 = 0;
  else
    v3 = off_1EA72E248[v2 - 1];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PinCodes-%@"), v3);
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  HFMutableItemSection *v17;
  void *v18;
  HFMutableItemSection *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPinCodeListModule pinCodeItemProvider](self, "pinCodeItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  +[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortUsingComparator:", v9);

  if (objc_msgSend(v8, "count")
    || -[HFPinCodeListModule listType](self, "listType") != 1
    && -[HFPinCodeListModule listType](self, "listType") != 3
    && -[HFPinCodeListModule listType](self, "listType") != 4)
  {
    -[HFPinCodeListModule addPinCodeItem](self, "addPinCodeItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HFPinCodeListModule addPinCodeItem](self, "addPinCodeItem");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFPinCodeListModule revokePinCodeItem](self, "revokePinCodeItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_11;
      -[HFPinCodeListModule revokePinCodeItem](self, "revokePinCodeItem");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v11;
    objc_msgSend(v8, "addObject:", v11);

LABEL_11:
    switch(-[HFPinCodeListModule listType](self, "listType"))
    {
      case 1uLL:
        v15 = CFSTR("HFPinCodeUserSectionHeader");
        goto LABEL_17;
      case 2uLL:
        v15 = CFSTR("HFPinCodeGuestSectionHeader");
        goto LABEL_17;
      case 3uLL:
        v15 = CFSTR("HFPinCodeRemovedUsersSectionHeader");
        goto LABEL_17;
      case 4uLL:
        v15 = CFSTR("HFPinCodeOtherEcosystemGuestsSectionHeader");
LABEL_17:
        _HFLocalizedStringWithDefaultValue(v15, v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v16 = 0;
        break;
    }
    v17 = [HFMutableItemSection alloc];
    -[HFPinCodeListModule _sectionIdentifier](self, "_sectionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HFItemSection initWithIdentifier:](v17, "initWithIdentifier:", v18);

    -[HFMutableItemSection setItems:filteringToDisplayedItems:](v19, "setItems:filteringToDisplayedItems:", v8, v4);
    -[HFItemSection setHeaderTitle:](v19, "setHeaderTitle:", v16);
    -[HFPinCodeListModule accessory](self, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_27;
    v21 = -[HFPinCodeListModule listType](self, "listType");
    switch(v21)
    {
      case 3uLL:
        v22 = CFSTR("HFPinCodeRemovedUsersSectionFooter");
        break;
      case 2uLL:
        _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeListGuestsHeaderButtonEditTitle"), CFSTR("HFPinCodeListGuestsHeaderButtonEditTitle"), 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFItemSection setHeaderAccessoryButtonTitle:](v19, "setHeaderAccessoryButtonTitle:", v24);

        -[HFPinCodeListModule editButtonHeaderDelegate](self, "editButtonHeaderDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFItemSection setHeaderAccessoryButtonDelegate:](v19, "setHeaderAccessoryButtonDelegate:", v23);
        goto LABEL_26;
      case 1uLL:
        v22 = CFSTR("HFPinCodeUserSectionFooter");
        break;
      default:
LABEL_27:
        v26[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
    }
    _HFLocalizedStringWithDefaultValue(v22, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemSection setFooterTitle:](v19, "setFooterTitle:", v23);
LABEL_26:

    goto LABEL_27;
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItem)addPinCodeItem
{
  return self->_addPinCodeItem;
}

- (void)setAddPinCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_addPinCodeItem, a3);
}

- (HFStaticItem)revokePinCodeItem
{
  return self->_revokePinCodeItem;
}

- (void)setRevokePinCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_revokePinCodeItem, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (unint64_t)listType
{
  return self->_listType;
}

- (void)setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (HFPinCodeItemProvider)pinCodeItemProvider
{
  return self->_pinCodeItemProvider;
}

- (void)setPinCodeItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeItemProvider, a3);
}

- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate
{
  return (HFItemSectionAccessoryButtonHeaderDelegate *)objc_loadWeakRetained((id *)&self->_editButtonHeaderDelegate);
}

- (void)setEditButtonHeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editButtonHeaderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editButtonHeaderDelegate);
  objc_storeStrong((id *)&self->_pinCodeItemProvider, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_revokePinCodeItem, 0);
  objc_storeStrong((id *)&self->_addPinCodeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end

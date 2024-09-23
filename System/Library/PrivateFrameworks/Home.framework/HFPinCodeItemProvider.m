@implementation HFPinCodeItemProvider

- (HFPinCodeItemProvider)initWithHome:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 forAccessory:(id)a6
{
  id v11;
  id v12;
  id v13;
  HFPinCodeItemProvider *v14;
  HFPinCodeItemProvider *v15;
  uint64_t v16;
  NSMutableSet *pinCodeItems;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HFPinCodeItemProvider;
  v14 = -[HFItemProvider init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_pinCodeManager, a4);
    v15->_listType = a5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    pinCodeItems = v15->_pinCodeItems;
    v15->_pinCodeItems = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_accessory, a6);
  }

  return v15;
}

- (HFPinCodeItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_pinCodeManager_listType_forAccessory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPinCodeItemProvider.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPinCodeItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFPinCodeItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItemProvider pinCodeManager](self, "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFPinCodeItemProvider listType](self, "listType");
  -[HFPinCodeItemProvider accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithHome:pinCodeManager:listType:forAccessory:", v5, v6, v7, v8);

  return v9;
}

- (id)reloadItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id location;

  switch(-[HFPinCodeItemProvider listType](self, "listType"))
  {
    case 1uLL:
      -[HFPinCodeItemProvider pinCodeManager](self, "pinCodeManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userPinCodes");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[HFPinCodeItemProvider pinCodeManager](self, "pinCodeManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "guestPinCodes");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[HFPinCodeItemProvider pinCodeManager](self, "pinCodeManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removedUserPINCodes");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[HFPinCodeItemProvider pinCodeManager](self, "pinCodeManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "otherEcosystemGuestPinCodes");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v4;

      break;
    default:
      v5 = 0;
      break;
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_1EA73CFA0;
  v8[4] = self;
  v9 = &__block_literal_global_194;
  v10 = &__block_literal_global_9_14;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v6;
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

id __36__HFPinCodeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "listType");
  v5 = MEMORY[0x1E0C809B0];
  if (v4 == 3)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_4;
    v16[3] = &unk_1EA736A60;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "na_filter:", v16);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_5;
  v15[3] = &unk_1EA73CF78;
  v15[4] = v7;
  objc_msgSend(v7, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, v8, v9, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_6;
  v13[3] = &unk_1EA726E30;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v14);

  return v11;
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

HFPinCodeItem *__36__HFPinCodeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  HFPinCodeItem *v4;
  void *v5;
  void *v6;
  HFPinCodeItem *v7;

  v3 = a2;
  v4 = [HFPinCodeItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFPinCodeItem initWithPinCode:inHome:onAccessory:](v4, "initWithPinCode:inHome:onAccessory:", v3, v5, v6);

  return v7;
}

id __36__HFPinCodeItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "pinCodeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(WeakRetained, "pinCodeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFPinCodeItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  v7[1] = CFSTR("service");
  v7[2] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (NSMutableSet)pinCodeItems
{
  return self->_pinCodeItems;
}

- (void)setPinCodeItems:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeItems, a3);
}

- (unint64_t)listType
{
  return self->_listType;
}

- (void)setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_pinCodeItems, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end

@implementation HUQuickControlPresentationItemManager

- (HUQuickControlPresentationItemManager)initWithHomeKitObjectUUID:(id)a3 type:(unint64_t)a4
{
  id v7;
  HUQuickControlPresentationItemManager *v8;
  HUQuickControlPresentationItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlPresentationItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_homeKitObjectUUID, a3);
    v9->_presentationItemType = a4;
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[4];
  id v33;

  v4 = a3;
  -[HUQuickControlPresentationItemManager homeKitObjectUUID](self, "homeKitObjectUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HUQuickControlPresentationItemManager__buildItemProvidersForHome___block_invoke;
  aBlock[3] = &unk_1E6F4D8E8;
  v6 = v5;
  v33 = v6;
  v7 = _Block_copy(aBlock);
  v8 = -[HUQuickControlPresentationItemManager presentationItemType](self, "presentationItemType");
  switch(v8)
  {
    case 3uLL:
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31230]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setCameraItemProvider:](self, "setCameraItemProvider:", v19);

      -[HUQuickControlPresentationItemManager cameraItemProvider](self, "cameraItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setServiceItemProvider:](self, "setServiceItemProvider:", v20);

      -[HUQuickControlPresentationItemManager serviceItemProvider](self, "serviceItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310B0]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setAccessoryItemProvider:](self, "setAccessoryItemProvider:", v9);

      -[HUQuickControlPresentationItemManager accessoryItemProvider](self, "accessoryItemProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilter:", v7);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31400]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setGenericItemProvider:](self, "setGenericItemProvider:", v11);

      -[HUQuickControlPresentationItemManager genericItemProvider](self, "genericItemProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFilter:", v7);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316B0]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setProgrammableSwitchItemProvider:](self, "setProgrammableSwitchItemProvider:", v13);

      -[HUQuickControlPresentationItemManager programmableSwitchItemProvider](self, "programmableSwitchItemProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilter:", v7);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D318B0]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setTargetControlItemProvider:](self, "setTargetControlItemProvider:", v15);

      -[HUQuickControlPresentationItemManager targetControlItemProvider](self, "targetControlItemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilter:", v7);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31510]), "initWithHome:", v4);
      -[HUQuickControlPresentationItemManager setMediaAccessoryItemProvider:](self, "setMediaAccessoryItemProvider:", v17);

      -[HUQuickControlPresentationItemManager mediaAccessoryItemProvider](self, "mediaAccessoryItemProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v21 = v18;
      objc_msgSend(v18, "setFilter:", v7);

      break;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlPresentationItemManager accessoryItemProvider](self, "accessoryItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v23);

  -[HUQuickControlPresentationItemManager genericItemProvider](self, "genericItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v24);

  -[HUQuickControlPresentationItemManager programmableSwitchItemProvider](self, "programmableSwitchItemProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v25);

  -[HUQuickControlPresentationItemManager targetControlItemProvider](self, "targetControlItemProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v26);

  -[HUQuickControlPresentationItemManager mediaAccessoryItemProvider](self, "mediaAccessoryItemProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v27);

  -[HUQuickControlPresentationItemManager serviceItemProvider](self, "serviceItemProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v28);

  -[HUQuickControlPresentationItemManager cameraItemProvider](self, "cameraItemProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeAddObject:", v29);

  v30 = (void *)objc_msgSend(v22, "copy");
  return v30;
}

uint64_t __68__HUQuickControlPresentationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUQuickControlPresentationItemManager presentationItemType](self, "presentationItemType") == 1)
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_270);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "_didFinishUpdateTransactionWithAffectedItems: %@, picked item %@", (uint8_t *)&v9, 0x16u);
  }

  -[HFItemManager setSourceItem:](self, "setSourceItem:", v7);
}

uint64_t __86__HUQuickControlPresentationItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();

  v8 = objc_msgSend(v6, "indexOfObject:", v7, v16, v17, v18, v19);
  v9 = objc_opt_class();

  v10 = objc_msgSend(v6, "indexOfObject:", v9);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v13 = v10 == 0x7FFFFFFFFFFFFFFFLL || v8 < v10;
    v14 = v13 << 63 >> 63;
    if (v8 > v10)
      v14 = 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 1;
    else
      v11 = v14;
  }

  return v11;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (NSUUID)homeKitObjectUUID
{
  return self->_homeKitObjectUUID;
}

- (unint64_t)presentationItemType
{
  return self->_presentationItemType;
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItemProvider, a3);
}

- (HFGenericAccessoryItemProvider)genericItemProvider
{
  return self->_genericItemProvider;
}

- (void)setGenericItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_genericItemProvider, a3);
}

- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider
{
  return self->_programmableSwitchItemProvider;
}

- (void)setProgrammableSwitchItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, a3);
}

- (HFTargetControlItemProvider)targetControlItemProvider
{
  return self->_targetControlItemProvider;
}

- (void)setTargetControlItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_targetControlItemProvider, a3);
}

- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider
{
  return self->_mediaAccessoryItemProvider;
}

- (void)setMediaAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, a3);
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItemProvider, a3);
}

- (HFCameraItemProvider)cameraItemProvider
{
  return self->_cameraItemProvider;
}

- (void)setCameraItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_targetControlItemProvider, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, 0);
  objc_storeStrong((id *)&self->_genericItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_homeKitObjectUUID, 0);
}

@end

@implementation HUHomeTheaterAudioItemModule

- (HUHomeTheaterAudioItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4 includeLocalDestinations:(BOOL)a5
{
  id v9;
  id v10;
  HUHomeTheaterAudioItemModule *v11;
  HUHomeTheaterAudioItemModule *v12;
  void *v14;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeTheaterAudioItemModule.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HUHomeTheaterAudioItemModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v15, sel_initWithItemUpdater_, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a4);
    v12->_includeLocalDestinations = a5;
    v12->_disableAutomaticCommit = 0;
    objc_storeWeak((id *)&v12->_selectedUncommittedItem, 0);
    -[HUHomeTheaterAudioItemModule _createItemProviders](v12, "_createItemProviders");
  }

  return v12;
}

- (void)_createItemProviders
{
  void *v3;
  HUMediaDestinationItem *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *itemProviders;
  id v14;
  _QWORD v15[5];
  id v16;

  if (self->_itemProviders)
  {
    NSLog(CFSTR("_createItemProviders has been called twice"), a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HUHomeTheaterAudioItemModule includeLocalDestinations](self, "includeLocalDestinations"))
    {
      v4 = -[HUMediaDestinationItem initWithDestination:withModule:]([HUMediaDestinationItem alloc], "initWithDestination:withModule:", 0, self);
      objc_msgSend(v3, "addObject:", v4);

    }
    -[HUHomeTheaterAudioItemModule mediaProfileContainer](self, "mediaProfileContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_backingAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioDestinationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableDestinations");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__HUHomeTheaterAudioItemModule__createItemProviders__block_invoke;
    v15[3] = &unk_1E6F56708;
    v15[4] = self;
    v16 = v3;
    v8 = v3;
    objc_msgSend(v14, "na_each:", v15);
    v9 = objc_alloc(MEMORY[0x1E0D31848]);
    objc_msgSend(v8, "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithItems:", v10);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v12;

  }
}

void __52__HUHomeTheaterAudioItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUMediaDestinationItem *v4;

  v3 = a2;
  v4 = -[HUMediaDestinationItem initWithDestination:withModule:]([HUMediaDestinationItem alloc], "initWithDestination:withModule:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HomeTheaterAudio"));
  if (-[HUHomeTheaterAudioItemModule includeLocalDestinations](self, "includeLocalDestinations"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSettings_FooterTitle"), CFSTR("HUHomeTheaterSettings_FooterTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFooterTitle:", v7);

  }
  -[HFItemModule allItems](self, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByIntersectingWithSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v14[3] = &unk_1E6F56750;
  v15 = &__block_literal_global_135;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v11);

  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("kIdentifierStringForBuiltIn"));

  return v8;
}

uint64_t __64__HUHomeTheaterAudioItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v7 = -1;
  }
  else if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v5, v6);

  }
  return v7;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUHomeTheaterAudioItemModule selectedUncommittedItem](self, "selectedUncommittedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeTheaterAudioItemModule _updateDestinationToIdentifier:](self, "_updateDestinationToIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)selectItem:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    -[HUHomeTheaterAudioItemModule _selectItem:](self, "_selectItem:", v7);

}

- (void)_selectItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[6];

  v5 = a3;
  if (-[HUHomeTheaterAudioItemModule disableAutomaticCommit](self, "disableAutomaticCommit"))
  {
    objc_storeWeak((id *)&self->_selectedUncommittedItem, v5);
  }
  else
  {
    objc_msgSend(v5, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeTheaterAudioItemModule setTappedDestinationIdentifier:](self, "setTappedDestinationIdentifier:", v7);

    -[HUHomeTheaterAudioItemModule tappedDestinationIdentifier](self, "tappedDestinationIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HUHomeTheaterAudioItemModule _updateDestinationToIdentifier:](self, "_updateDestinationToIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__HUHomeTheaterAudioItemModule__selectItem___block_invoke;
    v17[3] = &unk_1E6F4F960;
    v17[4] = self;
    v17[5] = a2;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v17);

  }
  -[HUHomeTheaterAudioItemModule onboardingDelegate](self, "onboardingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUHomeTheaterAudioItemModule onboardingDelegate](self, "onboardingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeTheaterItemModuleDidChangeSelectedDestination:", self);

  }
  v12 = (void *)MEMORY[0x1E0D314C0];
  -[HUHomeTheaterAudioItemModule itemProviders](self, "itemProviders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestToReloadItemProviders:senderSelector:", v13, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "performItemUpdateRequest:", v14);

}

void __44__HUHomeTheaterAudioItemModule__selectItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setTappedDestinationIdentifier:", 0);
  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(*(id *)(a1 + 32), "itemProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v9);

  }
}

- (id)_updateDestinationToIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  HUHomeTheaterAudioItemModule *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUHomeTheaterAudioItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioDestinationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "availableDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke;
  v23[3] = &unk_1E6F56778;
  v24 = v5;
  v11 = v5;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v26 = self;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ setting destination to %@ from possible destinations %@", buf, 0x2Au);

  }
  v15 = (void *)MEMORY[0x1E0D519C0];
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_26;
  v21[3] = &unk_1E6F4FA10;
  v21[4] = self;
  v22 = v12;
  v16 = v12;
  objc_msgSend(v15, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_2;
  v20[3] = &unk_1E6F4F960;
  v20[4] = self;
  v20[5] = a2;
  objc_msgSend(v17, "addCompletionBlock:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "audioDestinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaProfileContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_backingAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioDestinationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDestination:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __63__HUHomeTheaterAudioItemModule__updateDestinationToIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUHomeTheaterAudioItemModuleOnboardingDelegate)onboardingDelegate
{
  return (HUHomeTheaterAudioItemModuleOnboardingDelegate *)objc_loadWeakRetained((id *)&self->_onboardingDelegate);
}

- (void)setOnboardingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingDelegate, a3);
}

- (HUHomeTheaterAudioItemModuleAlertDelegate)alertDelegate
{
  return (HUHomeTheaterAudioItemModuleAlertDelegate *)objc_loadWeakRetained((id *)&self->_alertDelegate);
}

- (void)setAlertDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alertDelegate, a3);
}

- (NSString)tappedDestinationIdentifier
{
  return self->_tappedDestinationIdentifier;
}

- (void)setTappedDestinationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tappedDestinationIdentifier, a3);
}

- (HFItem)selectedUncommittedItem
{
  return (HFItem *)objc_loadWeakRetained((id *)&self->_selectedUncommittedItem);
}

- (BOOL)includeLocalDestinations
{
  return self->_includeLocalDestinations;
}

- (BOOL)disableAutomaticCommit
{
  return self->_disableAutomaticCommit;
}

- (void)setDisableAutomaticCommit:(BOOL)a3
{
  self->_disableAutomaticCommit = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedUncommittedItem);
  objc_storeStrong((id *)&self->_tappedDestinationIdentifier, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end

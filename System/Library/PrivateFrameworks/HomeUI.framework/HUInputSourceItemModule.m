@implementation HUInputSourceItemModule

+ (id)supportedServiceTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB9A48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_serviceItemComparatorForTelevisionProfile:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HUInputSourceItemModule__serviceItemComparatorForTelevisionProfile___block_invoke;
  v8[3] = &unk_1E6F521A0;
  v9 = v4;
  v10 = a1;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

uint64_t __70__HUInputSourceItemModule__serviceItemComparatorForTelevisionProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD);
  objc_super v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaSourceComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v9, v11);

  if (!v12)
  {
    v15.receiver = *(id *)(a1 + 40);
    v15.super_class = (Class)&OBJC_METACLASS___HUInputSourceItemModule;
    objc_msgSendSuper2(&v15, sel_childItemComparator);
    v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (**)(_QWORD, id, id))v13)[2](v13, v5, v6);

  }
  return v12;
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
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "intersectsSet:", v4))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUInputSourceItemSectionIdentifier"));
    -[HUChildServiceEditorItemModule accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "televisionProfiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_serviceItemComparatorForTelevisionProfile:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setItems:", v14);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTelevisionSettingsInputHeaderTitle"), CFSTR("HUTelevisionSettingsInputHeaderTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHeaderTitle:", v15);

    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (BOOL)canToggleConfigurationStateForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)HUInputSourceItemModule;
    v8 = -[HUChildServiceEditorItemModule canToggleConfigurationStateForItem:](&v10, sel_canToggleConfigurationStateForItem_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HFItem)chooseInputsSelectionItem
{
  return self->_chooseInputsSelectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chooseInputsSelectionItem, 0);
}

@end

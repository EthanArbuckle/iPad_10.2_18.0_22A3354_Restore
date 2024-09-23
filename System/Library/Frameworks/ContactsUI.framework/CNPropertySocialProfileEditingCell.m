@implementation CNPropertySocialProfileEditingCell

- (CNSocialProfile)profile
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPropertySocialProfileCell.m"), 38, CFSTR("Unexpected social profile value"));

  }
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labeledValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNSocialProfile *)v10;
}

- (void)labelButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  CNSocialProfileServicePickerController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    v8 = -[CNSocialProfileServicePickerController initWithStyle:]([CNSocialProfileServicePickerController alloc], "initWithStyle:", 1);
    -[CNPickerController setDelegate:](v8, "setDelegate:", self);
    -[CNPropertyCell delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharedActionsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C96658];
    v27[0] = *MEMORY[0x1E0C965F8];
    v27[1] = v11;
    v27[2] = *MEMORY[0x1E0C96620];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thirdPartyTargetsForActionTypes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v13, "result:", &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;

    if (objc_msgSend(v14, "count"))
    {
      -[CNPickerController setDiscoveredItems:](v8, "setDiscoveredItems:", v14);
      -[CNPickerController setAllowsDiscoveredItems:](v8, "setAllowsDiscoveredItems:", 1);
      -[CNPropertySocialProfileEditingCell profile](self, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __57__CNPropertySocialProfileEditingCell_labelButtonClicked___block_invoke;
        v25[3] = &unk_1E204D148;
        v25[4] = self;
        objc_msgSend(v14, "_cn_firstObjectPassingTest:", v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPickerController setSelectedItem:](v8, "setSelectedItem:", v19);

      }
    }
    -[CNPickerController selectedItem](v8, "selectedItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[CNPropertySocialProfileEditingCell profile](self, "profile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "service");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController setSelectedItem:](v8, "setSelectedItem:", v22);

    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
    objc_msgSend(v23, "setDelegate:", self);
    -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sender:presentViewController:", v4, v23);

  }
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labeledValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v6;
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setService:", v13);

    objc_msgSend(v12, "teamIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTeamIdentifier:", v14);

    objc_msgSend(v11, "bundleIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v11, "bundleIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "containsObject:", v17);

      if ((v18 & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v11, "bundleIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBundleIdentifiers:", v21);

    }
    else
    {
      objc_msgSend(v12, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBundleIdentifiers:", v20);
    }

    goto LABEL_8;
  }
  objc_msgSend(v11, "setService:", v6);
  objc_msgSend(v11, "setBundleIdentifiers:", 0);
  objc_msgSend(v11, "setTeamIdentifier:", 0);
LABEL_9:
  objc_msgSend(v11, "setUrlString:", 0);
  objc_msgSend(v11, "setUserIdentifier:", 0);
  objc_msgSend(v11, "setDisplayname:", 0);
  -[CNPropertyCell delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "propertyCell:didUpdateItem:withNewLabel:", self, v23, v24);

  -[CNPropertyCell delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "propertyCell:didUpdateItem:withNewValue:", self, v26, v11);

  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__CNPropertySocialProfileEditingCell_picker_didPickItem___block_invoke;
  v28[3] = &unk_1E204F648;
  v28[4] = self;
  objc_msgSend(v27, "sender:dismissViewController:completionHandler:", self, v7, v28);

}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CNPropertySocialProfileEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "sender:dismissViewController:completionHandler:", self, v4, v6);

}

uint64_t __54__CNPropertySocialProfileEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

uint64_t __57__CNPropertySocialProfileEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

uint64_t __57__CNPropertySocialProfileEditingCell_labelButtonClicked___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

@end

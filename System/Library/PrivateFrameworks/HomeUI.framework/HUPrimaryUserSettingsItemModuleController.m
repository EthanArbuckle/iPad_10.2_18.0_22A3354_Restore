@implementation HUPrimaryUserSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v4 = a3;
  v5 = objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v6;
    if (v7)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

  }
  v8 = 0;
LABEL_8:

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v8, "primaryUserSettingsHeaderItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
  objc_opt_class();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v13;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUIconCellContentMetrics *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUPrimaryUserSettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v18, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = objc_opt_class();
    v12 = v6;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v12;
      if (v13)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

    }
    v14 = 0;
LABEL_12:

    v17 = objc_alloc_init(HUIconCellContentMetrics);
    -[HUIconCellContentMetrics setContentInset:](v17, "setContentInset:", 10.0, 0.0, 10.0, 0.0);
    -[HUIconCellContentMetrics setIconSize:](v17, "setIconSize:", 36.0, 32.0);
    objc_msgSend(v14, "setContentMetrics:", v17);
    objc_msgSend(v14, "setIconDisplayStyle:", 1);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  objc_super v35;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HUPrimaryUserSettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v35, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  v13 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (!v12)
  {
    if (!v15)
      goto LABEL_29;
    v26 = objc_opt_class();
    v27 = v8;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v19 = v27;
      if (v28)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v26, objc_opt_class());

    }
    v19 = 0;
LABEL_24:

    v25 = v15;
    goto LABEL_25;
  }
  v16 = objc_opt_class();
  v17 = v8;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v17;
    if (v18)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class());

  }
  v19 = 0;
LABEL_15:

  objc_msgSend(v12, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "user");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_handleForUser:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserHandle:", v24);

  v25 = v13;
LABEL_25:
  objc_msgSend(v25, "latestResults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  if (v33)
    v34 = 3;
  else
    v34 = 0;
  objc_msgSend(v19, "setAccessoryType:", v34);

LABEL_29:
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Did select item: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_opt_class();
  v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = -[HUPrimaryUserSettingsItemModuleController updatePrimaryUserSelectionType:user:](self, "updatePrimaryUserSelectionType:user:", v12 == 0, v9);
  return 0;
}

- (id)updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "updatePrimaryUserSelectionType:user:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HUPrimaryUserSettingsItemModuleController_updatePrimaryUserSelectionType_user___block_invoke;
  v14[3] = &unk_1E6F4C610;
  v15 = v6;
  v11 = v6;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v14);

  return v10;
}

void __81__HUPrimaryUserSettingsItemModuleController_updatePrimaryUserSelectionType_user___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user to %@ with error %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

@end

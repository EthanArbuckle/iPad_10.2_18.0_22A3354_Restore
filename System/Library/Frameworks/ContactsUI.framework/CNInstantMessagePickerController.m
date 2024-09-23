@implementation CNInstantMessagePickerController

- (CNInstantMessagePickerController)initWithStyle:(int64_t)a3
{
  CNInstantMessagePickerController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CNInstantMessagePickerController;
  v3 = -[CNPickerController initWithStyle:](&v15, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend((id)objc_opt_class(), "defaultServices", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

    -[CNPickerController setBuiltinItems:](v3, "setBuiltinItems:", v4);
  }
  return v3;
}

- (id)titleForPickerItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97330], "localizedStringForService:", a3);
}

- (id)titleForAddCustomItem
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ADD_CUSTOM_SERVICE_BUTTON"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultServices
{
  if (defaultServices_onceToken != -1)
    dispatch_once(&defaultServices_onceToken, &__block_literal_global_19999);
  return (id)defaultServices__services;
}

void __51__CNInstantMessagePickerController_defaultServices__block_invoke()
{
  void *v0;
  int v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[11];

  v18[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("cn"));

  if (v1)
  {
    v2 = (uint64_t *)MEMORY[0x1E0C96930];
    v3 = (uint64_t *)MEMORY[0x1E0C96928];
    v4 = (uint64_t *)MEMORY[0x1E0C96950];
    v5 = (uint64_t *)MEMORY[0x1E0C96908];
    v6 = (uint64_t *)MEMORY[0x1E0C96910];
    v7 = (uint64_t *)MEMORY[0x1E0C96920];
    v18[0] = *MEMORY[0x1E0C96940];
    v8 = (uint64_t *)MEMORY[0x1E0C96938];
    v9 = (uint64_t *)MEMORY[0x1E0C96948];
    v10 = v18;
  }
  else
  {
    v2 = (uint64_t *)MEMORY[0x1E0C96940];
    v3 = (uint64_t *)MEMORY[0x1E0C96930];
    v4 = (uint64_t *)MEMORY[0x1E0C96928];
    v5 = (uint64_t *)MEMORY[0x1E0C96950];
    v6 = (uint64_t *)MEMORY[0x1E0C96908];
    v7 = (uint64_t *)MEMORY[0x1E0C96910];
    v17 = *MEMORY[0x1E0C96948];
    v8 = (uint64_t *)MEMORY[0x1E0C96920];
    v9 = (uint64_t *)MEMORY[0x1E0C96938];
    v10 = &v17;
  }
  v11 = *v8;
  v10[1] = *v9;
  v10[2] = v11;
  v12 = *v6;
  v10[3] = *v7;
  v10[4] = v12;
  v13 = *v4;
  v10[5] = *v5;
  v10[6] = v13;
  v14 = *v2;
  v10[7] = *v3;
  v10[8] = v14;
  v10[9] = *MEMORY[0x1E0C96918];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)defaultServices__services;
  defaultServices__services = v15;

}

@end

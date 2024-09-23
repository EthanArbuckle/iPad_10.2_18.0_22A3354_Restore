@implementation CNSocialProfileServicePickerController

- (CNSocialProfileServicePickerController)initWithStyle:(int64_t)a3
{
  CNSocialProfileServicePickerController *v3;
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
  v15.super_class = (Class)CNSocialProfileServicePickerController;
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
  return (id)objc_msgSend(MEMORY[0x1E0C973E8], "localizedStringForService:", a3);
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
  if (defaultServices_onceToken_46319 != -1)
    dispatch_once(&defaultServices_onceToken_46319, &__block_literal_global_46320);
  return (id)defaultServices__services_46321;
}

void __57__CNSocialProfileServicePickerController_defaultServices__block_invoke()
{
  void *v0;
  int v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("cn"));

  if (v1)
  {
    v2 = (uint64_t *)MEMORY[0x1E0C97100];
    v3 = (uint64_t *)MEMORY[0x1E0C970F8];
    v4 = (uint64_t *)MEMORY[0x1E0C970F0];
    v13[0] = *MEMORY[0x1E0C97108];
    v5 = (uint64_t *)MEMORY[0x1E0C970E8];
    v6 = (uint64_t *)MEMORY[0x1E0C97118];
    v7 = v13;
  }
  else
  {
    v2 = (uint64_t *)MEMORY[0x1E0C97108];
    v3 = (uint64_t *)MEMORY[0x1E0C97100];
    v4 = (uint64_t *)MEMORY[0x1E0C970F8];
    v12 = *MEMORY[0x1E0C97118];
    v5 = (uint64_t *)MEMORY[0x1E0C970F0];
    v6 = (uint64_t *)MEMORY[0x1E0C970E8];
    v7 = &v12;
  }
  v8 = *v5;
  v7[1] = *v6;
  v7[2] = v8;
  v9 = *v3;
  v7[3] = *v4;
  v7[4] = v9;
  v7[5] = *v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)defaultServices__services_46321;
  defaultServices__services_46321 = v10;

}

@end

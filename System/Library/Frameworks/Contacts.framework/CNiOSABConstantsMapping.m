@implementation CNiOSABConstantsMapping

- (id)mappedConstant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNiOSABConstantsMapping mapping](self, "mapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[CNiOSABConstantsMapping defaultConstant](self, "defaultConstant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CNiOSABConstantsMapping defaultConstant](self, "defaultConstant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v4;
    }
  }
  v9 = v7;

  return v9;
}

- (id)defaultConstant
{
  return self->_defaultConstant;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

+ (id)CNToABPersonSortOrderingConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CNiOSABConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSortOrderingConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonSortOrderingConstantsMapping_onceToken, block);
  return (id)CNToABPersonSortOrderingConstantsMapping_s_mapping;
}

+ (id)ABtoCNContactDisplayNameOrderConstantsMapping
{
  if (ABtoCNContactDisplayNameOrderConstantsMapping_onceToken != -1)
    dispatch_once(&ABtoCNContactDisplayNameOrderConstantsMapping_onceToken, &__block_literal_global_4_5);
  return (id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
}

uint64_t __62__CNiOSABConstantsMapping_ABToCNContainerTypeConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1E2A401E8;
  v5[1] = &unk_1E2A40200;
  v6[0] = &unk_1E2A401D0;
  v6[1] = &unk_1E2A40218;
  v5[2] = &unk_1E2A40278;
  v5[3] = &unk_1E2A402A8;
  v6[2] = &unk_1E2A40290;
  v6[3] = &unk_1E2A40230;
  v5[4] = &unk_1E2A402C0;
  v5[5] = &unk_1E2A402D8;
  v6[4] = &unk_1E2A40260;
  v6[5] = &unk_1E2A402F0;
  v5[6] = &unk_1E2A40308;
  v6[6] = &unk_1E2A40320;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;
  ABToCNContainerTypeConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABToCNContainerTypeConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A401D0);
}

uint64_t __72__CNiOSABConstantsMapping_ABtoCNContactDisplayNameOrderConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1E2A401E8;
  v5[1] = &unk_1E2A40200;
  v6[0] = &unk_1E2A401D0;
  v6[1] = &unk_1E2A40218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
  ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A401B8);
}

uint64_t __67__CNiOSABConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNContactSortOrderConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;
  CNToABPersonSortOrderingConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABPersonSortOrderingConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A40200);
}

+ (id)ABToCNContactSortOrderConstantsMapping
{
  if (ABToCNContactSortOrderConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNContactSortOrderConstantsMapping_onceToken, &__block_literal_global_9_3);
  return (id)ABToCNContactSortOrderConstantsMapping_s_mapping;
}

uint64_t __65__CNiOSABConstantsMapping_ABToCNContactSortOrderConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1E2A401E8;
  v5[1] = &unk_1E2A40200;
  v6[0] = &unk_1E2A40218;
  v6[1] = &unk_1E2A40230;
  v5[2] = &unk_1E2A40248;
  v6[2] = &unk_1E2A40260;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;
  ABToCNContactSortOrderConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABToCNContactSortOrderConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A401D0);
}

- (void)setDefaultConstant:(id)a3
{
  objc_storeStrong(&self->_defaultConstant, a3);
}

- (id)invertedMapping
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNiOSABConstantsMapping mapping](self, "mapping", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[CNiOSABConstantsMapping mapping](self, "mapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapping:", v3);
  return v12;
}

- (CNiOSABConstantsMapping)initWithMapping:(id)a3
{
  id v4;
  CNiOSABConstantsMapping *v5;
  uint64_t v6;
  NSDictionary *mapping;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABConstantsMapping;
  v5 = -[CNiOSABConstantsMapping init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mapping = v5->_mapping;
    v5->_mapping = (NSDictionary *)v6;

  }
  return v5;
}

+ (id)ABToCNContainerTypeConstantsMapping
{
  if (ABToCNContainerTypeConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNContainerTypeConstantsMapping_onceToken, &__block_literal_global_17_2);
  return (id)ABToCNContainerTypeConstantsMapping_s_mapping;
}

+ (id)ABToCNPersonKindConstantsMapping
{
  if (ABToCNPersonKindConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonKindConstantsMapping_onceToken, &__block_literal_global_134);
  return (id)ABToCNPersonKindConstantsMapping_s_mapping;
}

uint64_t __59__CNiOSABConstantsMapping_ABToCNPersonKindConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v1 = *MEMORY[0x1E0CF60A8];
  v6[0] = *MEMORY[0x1E0CF60B0];
  v6[1] = v1;
  v7[0] = &unk_1E2A401B8;
  v7[1] = &unk_1E2A401D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v2);
  v4 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;
  ABToCNPersonKindConstantsMapping_s_mapping = v3;

  return objc_msgSend((id)ABToCNPersonKindConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A401B8);
}

+ (id)CNToABPersonKindConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CNiOSABConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonKindConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonKindConstantsMapping_onceToken, block);
  return (id)CNToABPersonKindConstantsMapping_s_mapping;
}

uint64_t __59__CNiOSABConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonKindConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABPersonKindConstantsMapping_s_mapping;
  CNToABPersonKindConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABPersonKindConstantsMapping_s_mapping, "setDefaultConstant:", *MEMORY[0x1E0CF60B0]);
}

+ (id)CNToABCompositeNameFormatConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CNiOSABConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABCompositeNameFormatConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABCompositeNameFormatConstantsMapping_onceToken, block);
  return (id)CNToABCompositeNameFormatConstantsMapping_s_mapping;
}

uint64_t __68__CNiOSABConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABtoCNContactDisplayNameOrderConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;
  CNToABCompositeNameFormatConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABCompositeNameFormatConstantsMapping_s_mapping, "setDefaultConstant:", &unk_1E2A40200);
}

+ (id)ABToCNPersonAddressConstantsMapping
{
  if (ABToCNPersonAddressConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonAddressConstantsMapping_onceToken, &__block_literal_global_13_3);
  return (id)ABToCNPersonAddressConstantsMapping_s_mapping;
}

void __62__CNiOSABConstantsMapping_ABToCNPersonAddressConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[8];
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v1 = *MEMORY[0x1E0CF5ED8];
  v8[0] = *MEMORY[0x1E0CF5EC8];
  v8[1] = v1;
  v9[0] = CFSTR("street");
  v9[1] = CFSTR("subLocality");
  v2 = *MEMORY[0x1E0CF5ED0];
  v8[2] = *MEMORY[0x1E0CF5EA0];
  v8[3] = v2;
  v9[2] = CFSTR("city");
  v9[3] = CFSTR("subAdministrativeArea");
  v3 = *MEMORY[0x1E0CF5EE0];
  v8[4] = *MEMORY[0x1E0CF5EC0];
  v8[5] = v3;
  v9[4] = CFSTR("state");
  v9[5] = CFSTR("postalCode");
  v4 = *MEMORY[0x1E0CF5EA8];
  v8[6] = *MEMORY[0x1E0CF5EB0];
  v8[7] = v4;
  v9[6] = CFSTR("country");
  v9[7] = CFSTR("ISOCountryCode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v5);
  v7 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;
  ABToCNPersonAddressConstantsMapping_s_mapping = v6;

}

+ (id)CNToABPersonAddressConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CNiOSABConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonAddressConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonAddressConstantsMapping_onceToken, block);
  return (id)CNToABPersonAddressConstantsMapping_s_mapping;
}

void __62__CNiOSABConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonAddressConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;
  CNToABPersonAddressConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNPersonInstantMessageConstantsMapping
{
  if (ABToCNPersonInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonInstantMessageConstantsMapping_onceToken, &__block_literal_global_14_4);
  return (id)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
}

void __69__CNiOSABConstantsMapping_ABToCNPersonInstantMessageConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[12];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v1 = *MEMORY[0x1E0CF6088];
  v10[0] = *MEMORY[0x1E0CF6058];
  v10[1] = v1;
  v11[0] = CFSTR("service");
  v11[1] = CFSTR("username");
  v2 = *MEMORY[0x1E0CF6050];
  v10[2] = *MEMORY[0x1E0CF6078];
  v10[3] = v2;
  v11[2] = CFSTR("Yahoo");
  v11[3] = CFSTR("Jabber");
  v3 = *MEMORY[0x1E0CF6048];
  v10[4] = *MEMORY[0x1E0CF6060];
  v10[5] = v3;
  v11[4] = CFSTR("MSN");
  v11[5] = CFSTR("ICQ");
  v4 = *MEMORY[0x1E0CF6068];
  v10[6] = *MEMORY[0x1E0CF6028];
  v10[7] = v4;
  v11[6] = CFSTR("AIM");
  v11[7] = CFSTR("QQ");
  v5 = *MEMORY[0x1E0CF6070];
  v10[8] = *MEMORY[0x1E0CF6040];
  v10[9] = v5;
  v11[8] = CFSTR("GoogleTalk");
  v11[9] = CFSTR("Skype");
  v6 = *MEMORY[0x1E0CF6038];
  v10[10] = *MEMORY[0x1E0CF6030];
  v10[11] = v6;
  v11[10] = CFSTR("Facebook");
  v11[11] = CFSTR("GaduGadu");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v7);
  v9 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
  ABToCNPersonInstantMessageConstantsMapping_s_mapping = v8;

}

+ (id)CNToABPersonInstantMessageConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CNiOSABConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonInstantMessageConstantsMapping_onceToken, block);
  return (id)CNToABPersonInstantMessageConstantsMapping_s_mapping;
}

void __69__CNiOSABConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonInstantMessageConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;
  CNToABPersonInstantMessageConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNPersonSocialProfileConstantsMapping
{
  if (ABToCNPersonSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonSocialProfileConstantsMapping_onceToken, &__block_literal_global_15_2);
  return (id)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
}

void __68__CNiOSABConstantsMapping_ABToCNPersonSocialProfileConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[11];
  _QWORD v10[12];

  v10[11] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v1 = *MEMORY[0x1E0CF6260];
  v9[0] = *MEMORY[0x1E0CF6250];
  v9[1] = v1;
  v10[0] = CFSTR("urlString");
  v10[1] = CFSTR("username");
  v2 = *MEMORY[0x1E0CF6228];
  v9[2] = *MEMORY[0x1E0CF6258];
  v9[3] = v2;
  v10[2] = CFSTR("userIdentifier");
  v10[3] = CFSTR("service");
  v3 = *MEMORY[0x1E0CF6240];
  v9[4] = *MEMORY[0x1E0CF6248];
  v9[5] = v3;
  v10[4] = CFSTR("Twitter");
  v10[5] = CFSTR("SinaWeibo");
  v4 = *MEMORY[0x1E0CF6210];
  v9[6] = *MEMORY[0x1E0CF6220];
  v9[7] = v4;
  v10[6] = CFSTR("Game Center");
  v10[7] = CFSTR("Facebook");
  v5 = *MEMORY[0x1E0CF6230];
  v9[8] = *MEMORY[0x1E0CF6238];
  v9[9] = v5;
  v10[8] = CFSTR("MySpace");
  v10[9] = CFSTR("LinkedIn");
  v9[10] = *MEMORY[0x1E0CF6218];
  v10[10] = CFSTR("Flickr");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v6);
  v8 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
  ABToCNPersonSocialProfileConstantsMapping_s_mapping = v7;

}

+ (id)CNToABPersonSocialProfileConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CNiOSABConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonSocialProfileConstantsMapping_onceToken, block);
  return (id)CNToABPersonSocialProfileConstantsMapping_s_mapping;
}

void __68__CNiOSABConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonSocialProfileConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;
  CNToABPersonSocialProfileConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNLabelConstantsMapping
{
  if (ABToCNLabelConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNLabelConstantsMapping_onceToken, &__block_literal_global_16_1);
  return (id)ABToCNLabelConstantsMapping_s_mapping;
}

void __54__CNiOSABConstantsMapping_ABToCNLabelConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[31];
  _QWORD v20[32];

  v20[31] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v1 = *MEMORY[0x1E0CF5E90];
  v19[0] = *MEMORY[0x1E0CF6350];
  v19[1] = v1;
  v20[0] = CFSTR("_$!<Work>!$_");
  v20[1] = CFSTR("_$!<Home>!$_");
  v2 = *MEMORY[0x1E0CF5E98];
  v19[2] = *MEMORY[0x1E0CF62C0];
  v19[3] = v2;
  v20[2] = CFSTR("_$!<School>!$_");
  v20[3] = CFSTR("_$!<Other>!$_");
  v3 = *MEMORY[0x1E0CF6178];
  v19[4] = *MEMORY[0x1E0CF5F28];
  v19[5] = v3;
  v20[4] = CFSTR("_$!<Anniversary>!$_");
  v20[5] = CFSTR("iPhone");
  v4 = *MEMORY[0x1E0CF6180];
  v19[6] = *MEMORY[0x1E0CF6150];
  v19[7] = v4;
  v20[6] = CFSTR("Apple Watch");
  v20[7] = CFSTR("_$!<Main>!$_");
  v5 = *MEMORY[0x1E0CF61B0];
  v19[8] = *MEMORY[0x1E0CF6170];
  v19[9] = v5;
  v20[8] = CFSTR("_$!<HomeFAX>!$_");
  v20[9] = CFSTR("_$!<WorkFAX>!$_");
  v6 = *MEMORY[0x1E0CF6198];
  v19[10] = *MEMORY[0x1E0CF6190];
  v19[11] = v6;
  v20[10] = CFSTR("_$!<OtherFAX>!$_");
  v20[11] = CFSTR("_$!<Pager>!$_");
  v7 = *MEMORY[0x1E0CF6158];
  v19[12] = *MEMORY[0x1E0CF6188];
  v19[13] = v7;
  v20[12] = CFSTR("_$!<Mobile>!$_");
  v20[13] = CFSTR("_$!<AssistantPhone>!$_");
  v8 = *MEMORY[0x1E0CF61A8];
  v19[14] = *MEMORY[0x1E0CF6160];
  v19[15] = v8;
  v20[14] = CFSTR("_$!<Car>!$_");
  v20[15] = CFSTR("_$!<Radio>!$_");
  v9 = *MEMORY[0x1E0CF5FF0];
  v19[16] = *MEMORY[0x1E0CF6168];
  v19[17] = v9;
  v20[16] = CFSTR("_$!<CompanyMain>!$_");
  v20[17] = CFSTR("_$!<HomePage>!$_");
  v10 = *MEMORY[0x1E0CF6118];
  v19[18] = *MEMORY[0x1E0CF5FC0];
  v19[19] = v10;
  v20[18] = CFSTR("_$!<Father>!$_");
  v20[19] = CFSTR("_$!<Mother>!$_");
  v11 = *MEMORY[0x1E0CF5F40];
  v19[20] = *MEMORY[0x1E0CF6140];
  v19[21] = v11;
  v20[20] = CFSTR("_$!<Parent>!$_");
  v20[21] = CFSTR("_$!<Brother>!$_");
  v12 = *MEMORY[0x1E0CF6268];
  v19[22] = *MEMORY[0x1E0CF61F8];
  v19[23] = v12;
  v20[22] = CFSTR("_$!<Sister>!$_");
  v20[23] = CFSTR("_$!<Son>!$_");
  v13 = *MEMORY[0x1E0CF5F48];
  v19[24] = *MEMORY[0x1E0CF5F60];
  v19[25] = v13;
  v20[24] = CFSTR("_$!<Daughter>!$_");
  v20[25] = CFSTR("_$!<Child>!$_");
  v14 = *MEMORY[0x1E0CF6278];
  v19[26] = *MEMORY[0x1E0CF5FE8];
  v19[27] = v14;
  v20[26] = CFSTR("_$!<Friend>!$_");
  v20[27] = CFSTR("_$!<Spouse>!$_");
  v15 = *MEMORY[0x1E0CF5F30];
  v19[28] = *MEMORY[0x1E0CF6148];
  v19[29] = v15;
  v20[28] = CFSTR("_$!<Partner>!$_");
  v20[29] = CFSTR("_$!<Assistant>!$_");
  v19[30] = *MEMORY[0x1E0CF60E8];
  v20[30] = CFSTR("_$!<Manager>!$_");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v16);
  v18 = (void *)ABToCNLabelConstantsMapping_s_mapping;
  ABToCNLabelConstantsMapping_s_mapping = v17;

}

+ (id)CNToABLabelConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CNiOSABConstantsMapping_CNToABLabelConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABLabelConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABLabelConstantsMapping_onceToken, block);
  return (id)CNToABLabelConstantsMapping_s_mapping;
}

void __54__CNiOSABConstantsMapping_CNToABLabelConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNLabelConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABLabelConstantsMapping_s_mapping;
  CNToABLabelConstantsMapping_s_mapping = v1;

}

+ (id)CNToABSourceTypeConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CNiOSABConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABSourceTypeConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABSourceTypeConstantsMapping_onceToken, block);
  return (id)CNToABSourceTypeConstantsMapping_s_mapping;
}

void __59__CNiOSABConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNContainerTypeConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  CNToABSourceTypeConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultConstant:", v5);

}

+ (id)ABToCNContactShortNameFormatConstantsMapping
{
  if (ABToCNContactShortNameFormatConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNContactShortNameFormatConstantsMapping_onceToken, &__block_literal_global_27_2);
  return (id)ABToCNContactShortNameFormatConstantsMapping_s_mapping;
}

void __71__CNiOSABConstantsMapping_ABToCNContactShortNameFormatConstantsMapping__block_invoke()
{
  CNiOSABConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = [CNiOSABConstantsMapping alloc];
  v4[0] = &unk_1E2A401E8;
  v4[1] = &unk_1E2A40200;
  v5[0] = &unk_1E2A401B8;
  v5[1] = &unk_1E2A401D0;
  v4[2] = &unk_1E2A40338;
  v4[3] = &unk_1E2A40350;
  v5[2] = &unk_1E2A40218;
  v5[3] = &unk_1E2A40230;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[CNiOSABConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNContactShortNameFormatConstantsMapping_s_mapping;
  ABToCNContactShortNameFormatConstantsMapping_s_mapping = v2;

}

+ (id)CNToABPersonShortNameFormatConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CNiOSABConstantsMapping_CNToABPersonShortNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonShortNameFormatConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonShortNameFormatConstantsMapping_onceToken, block);
  return (id)CNToABPersonShortNameFormatConstantsMapping_s_mapping;
}

void __70__CNiOSABConstantsMapping_CNToABPersonShortNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNContactShortNameFormatConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABPersonShortNameFormatConstantsMapping_s_mapping;
  CNToABPersonShortNameFormatConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABPersonShortNameFormatConstantsMapping_s_mapping;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultConstant:", v5);

}

- (void)setMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultConstant, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end

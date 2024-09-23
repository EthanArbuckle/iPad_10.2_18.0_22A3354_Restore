@implementation CNVCardConstantsMapping

+ (id)CNToVCardInstantMessageConstantsMapping
{
  if (CNToVCardInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&CNToVCardInstantMessageConstantsMapping_onceToken, &__block_literal_global_103);
  return (id)CNToVCardInstantMessageConstantsMapping_s_mapping;
}

void __66__CNVCardConstantsMapping_CNToVCardInstantMessageConstantsMapping__block_invoke()
{
  CNVCardConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[10];
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v0 = [CNVCardConstantsMapping alloc];
  v1 = *MEMORY[0x1E0DDC890];
  v13[0] = CFSTR("AIM");
  v13[1] = CFSTR("Facebook");
  v2 = *MEMORY[0x1E0DDC898];
  v14[0] = v1;
  v14[1] = v2;
  v3 = *MEMORY[0x1E0DDC8A0];
  v13[2] = CFSTR("GaduGadu");
  v13[3] = CFSTR("GoogleTalk");
  v4 = *MEMORY[0x1E0DDC8A8];
  v14[2] = v3;
  v14[3] = v4;
  v5 = *MEMORY[0x1E0DDC8B0];
  v13[4] = CFSTR("ICQ");
  v13[5] = CFSTR("Jabber");
  v6 = *MEMORY[0x1E0DDC8B8];
  v14[4] = v5;
  v14[5] = v6;
  v7 = *MEMORY[0x1E0DDC8C0];
  v13[6] = CFSTR("MSN");
  v13[7] = CFSTR("QQ");
  v8 = *MEMORY[0x1E0DDC8C8];
  v14[6] = v7;
  v14[7] = v8;
  v13[8] = CFSTR("Skype");
  v13[9] = CFSTR("Yahoo");
  v9 = *MEMORY[0x1E0DDC8D8];
  v14[8] = *MEMORY[0x1E0DDC8D0];
  v14[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNVCardConstantsMapping initWithMapping:](v0, "initWithMapping:", v10);
  v12 = (void *)CNToVCardInstantMessageConstantsMapping_s_mapping;
  CNToVCardInstantMessageConstantsMapping_s_mapping = v11;

}

+ (id)vCardToCNInstantMessageConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CNVCardConstantsMapping_vCardToCNInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (vCardToCNInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&vCardToCNInstantMessageConstantsMapping_onceToken, block);
  return (id)vCardToCNInstantMessageConstantsMapping_s_mapping;
}

void __66__CNVCardConstantsMapping_vCardToCNInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "CNToVCardInstantMessageConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)vCardToCNInstantMessageConstantsMapping_s_mapping;
  vCardToCNInstantMessageConstantsMapping_s_mapping = v1;

}

+ (id)CNToVCardSocialProfileConstantsMapping
{
  if (CNToVCardSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&CNToVCardSocialProfileConstantsMapping_onceToken, &__block_literal_global_2_3);
  return (id)CNToVCardSocialProfileConstantsMapping_s_mapping;
}

void __65__CNVCardConstantsMapping_CNToVCardSocialProfileConstantsMapping__block_invoke()
{
  CNVCardConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v0 = [CNVCardConstantsMapping alloc];
  v1 = *MEMORY[0x1E0DDCA98];
  v10[0] = CFSTR("Facebook");
  v10[1] = CFSTR("Flickr");
  v2 = *MEMORY[0x1E0DDCAA0];
  v11[0] = v1;
  v11[1] = v2;
  v3 = *MEMORY[0x1E0DDCAA8];
  v10[2] = CFSTR("LinkedIn");
  v10[3] = CFSTR("MySpace");
  v4 = *MEMORY[0x1E0DDCAB0];
  v11[2] = v3;
  v11[3] = v4;
  v5 = *MEMORY[0x1E0DDCAB8];
  v10[4] = CFSTR("SinaWeibo");
  v10[5] = CFSTR("TencentWeibo");
  v6 = *MEMORY[0x1E0DDC8B8];
  v11[4] = v5;
  v11[5] = v6;
  v10[6] = CFSTR("Twitter");
  v11[6] = *MEMORY[0x1E0DDCAC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNVCardConstantsMapping initWithMapping:](v0, "initWithMapping:", v7);
  v9 = (void *)CNToVCardSocialProfileConstantsMapping_s_mapping;
  CNToVCardSocialProfileConstantsMapping_s_mapping = v8;

}

+ (id)vCardToCNSocialProfileConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CNVCardConstantsMapping_vCardToCNSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (vCardToCNSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&vCardToCNSocialProfileConstantsMapping_onceToken, block);
  return (id)vCardToCNSocialProfileConstantsMapping_s_mapping;
}

void __65__CNVCardConstantsMapping_vCardToCNSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "CNToVCardSocialProfileConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)vCardToCNSocialProfileConstantsMapping_s_mapping;
  vCardToCNSocialProfileConstantsMapping_s_mapping = v1;

}

- (CNVCardConstantsMapping)initWithMapping:(id)a3
{
  id v4;
  CNVCardConstantsMapping *v5;
  uint64_t v6;
  NSDictionary *mapping;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNVCardConstantsMapping;
  v5 = -[CNVCardConstantsMapping init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mapping = v5->_mapping;
    v5->_mapping = (NSDictionary *)v6;

  }
  return v5;
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
  -[CNVCardConstantsMapping mapping](self, "mapping", 0);
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
        -[CNVCardConstantsMapping mapping](self, "mapping");
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

- (id)mappedConstant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNVCardConstantsMapping mapping](self, "mapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end

@implementation CN

uint64_t __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

+ (id)allPhoneticNameComponentProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CN_PropertyDescription__allPhoneticNameComponentProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhoneticNameComponentProperties_cn_once_token_13 != -1)
    dispatch_once(&allPhoneticNameComponentProperties_cn_once_token_13, block);
  return (id)allPhoneticNameComponentProperties_cn_once_object_13;
}

+ (id)contactPropertiesByKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contactPropertiesByKey_cn_once_token_19 != -1)
    dispatch_once(&contactPropertiesByKey_cn_once_token_19, block);
  return (id)contactPropertiesByKey_cn_once_object_19;
}

+ (id)allContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CN_PropertyDescription__allContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allContactProperties_cn_once_token_2 != -1)
    dispatch_once(&allContactProperties_cn_once_token_2, block);
  return (id)allContactProperties_cn_once_object_2;
}

uint64_t __54__CN_PropertyDescription__multiValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMultiValue");
}

uint64_t __51__CN_PropertyDescription__allImageDataPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

uint64_t __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMultiValue");
}

uint64_t __52__CN_PropertyDescription__writableContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWritable");
}

void __58__CN_PropertyDescription__writableAlwaysFetchedProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[CN alwaysFetchedProperties](CN, "alwaysFetchedProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_148);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)writableAlwaysFetchedProperties_cn_once_object_7;
  writableAlwaysFetchedProperties_cn_once_object_7 = v1;

}

+ (id)alwaysFetchedProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CN_PropertyDescription__alwaysFetchedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (alwaysFetchedProperties_cn_once_token_6 != -1)
    dispatch_once(&alwaysFetchedProperties_cn_once_token_6, block);
  return (id)alwaysFetchedProperties_cn_once_object_6;
}

void __54__CN_PropertyDescription__multiValueContactProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_155_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)multiValueContactProperties_cn_once_object_15;
  multiValueContactProperties_cn_once_object_15 = v2;

}

+ (id)sourceContactForValue:(id)a3 labeledValueIdentifier:(id)a4 propertyKey:(id)a5 inUnifiedContact:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  id v17;
  id v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v12, "isUnified") & 1) != 0)
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "isMultiValue");
    if (v10 && (v15 & 1) != 0 || (v16 = objc_msgSend(v14, "isMultiValue"), v9) && !v16)
    {
      if (objc_msgSend(v14, "isMultiValue"))
      {
        v17 = v10;
        v18 = v14;
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v19 = ___contactTestMatchingLabeledValueID_block_invoke;
      }
      else
      {
        v17 = v9;
        v18 = v14;
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v19 = ___contactTestMatchingValue_block_invoke;
      }
      v28 = v19;
      v29 = &unk_1E29F91E8;
      v30 = v18;
      v31 = v17;
      v21 = _Block_copy(&v26);

      objc_msgSend(v12, "linkedContacts", v26, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_cn_firstObjectPassingTest:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v24 = v23;
      else
        v24 = v12;
      v20 = v24;

    }
    else
    {
      v20 = v12;
    }

  }
  else
  {
    v20 = v12;
  }

  return v20;
}

uint64_t __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMultiValue") ^ 1;
}

+ (id)allImageDataPropertyKeys
{
  if (allImageDataPropertyKeys_cn_once_token_9 != -1)
    dispatch_once(&allImageDataPropertyKeys_cn_once_token_9, &__block_literal_global_149);
  return (id)allImageDataPropertyKeys_cn_once_object_9;
}

+ (id)allWallpaperPropertyKeys
{
  if (allWallpaperPropertyKeys_cn_once_token_11 != -1)
    dispatch_once(&allWallpaperPropertyKeys_cn_once_token_11, &__block_literal_global_151);
  return (id)allWallpaperPropertyKeys_cn_once_object_11;
}

+ (id)organizationNameDescription
{
  if (organizationNameDescription_cn_once_token_40 != -1)
    dispatch_once(&organizationNameDescription_cn_once_token_40, &__block_literal_global_198);
  return (id)organizationNameDescription_cn_once_object_40;
}

+ (id)orderForContactName:(id)a3 phonetic:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4
    && objc_msgSend(a1, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v6, 0, 0)
    && +[CN hasContactChineseJapaneseKoreanPhoneticName:](CN, "hasContactChineseJapaneseKoreanPhoneticName:", v6)|| +[CN shouldContactUseFamilyGivenNameOrder:](CN, "shouldContactUseFamilyGivenNameOrder:", v6))
  {
    +[CNContactNameOrderImpl familyNameFirstOrder](CNContactNameOrderImpl, "familyNameFirstOrder");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v6, v4, 1))
      +[CNContactNameOrderImpl defaultNewContactOrder](CNContactNameOrderImpl, "defaultNewContactOrder");
    else
      +[CNContactNameOrderImpl defaultOrder](CNContactNameOrderImpl, "defaultOrder");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (BOOL)isEmptyNameContact:(id)a3 phonetic:(BOOL)a4 includingPrefixAndSuffix:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = v7;
  v9 = *MEMORY[0x1E0D13848];
  if (v6)
  {
    objc_msgSend(v7, "phoneticFamilyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    {
      objc_msgSend(v8, "phoneticGivenName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v11))
      {
        objc_msgSend(v8, "phoneticMiddleName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v12);

LABEL_15:
        goto LABEL_16;
      }
LABEL_14:
      LOBYTE(v13) = 0;
      goto LABEL_15;
    }
LABEL_13:
    LOBYTE(v13) = 0;
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v7, "givenName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    goto LABEL_13;
  objc_msgSend(v8, "middleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v11))
    goto LABEL_14;
  objc_msgSend(v8, "familyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v14);

  if (v13)
    v15 = !v5;
  else
    v15 = 1;
  if (!v15)
  {
    objc_msgSend(v8, "namePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    {
      objc_msgSend(v8, "nameSuffix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11);
      goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_17:

  return v13;
}

+ (id)orderForContactName:(id)a3
{
  return (id)objc_msgSend(a1, "orderForContactName:phonetic:", a3, 0);
}

+ (id)localizedNameDelimiterForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "requiredPropertiesForNameScriptDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN joinNonEmptyContactProperties:onContact:withDelimiter:](CN, "joinNonEmptyContactProperties:onContact:withDelimiter:", v5, v4, &stru_1E29FF900);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CNNameDelimiterForString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)requiredPropertiesForNameScriptDetection
{
  if (requiredPropertiesForNameScriptDetection_cn_once_token_0 != -1)
    dispatch_once(&requiredPropertiesForNameScriptDetection_cn_once_token_0, &__block_literal_global_143);
  return (id)requiredPropertiesForNameScriptDetection_cn_once_object_0;
}

+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4 withDelimiter:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    v15 = *MEMORY[0x1E0D13848];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "CNValueForContact:", v8, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v17) & 1) == 0)
        {
          if (objc_msgSend(v10, "length"))
            objc_msgSend(v10, "appendString:", v9);
          objc_msgSend(v10, "appendString:", v17);
        }

        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v10;
}

+ (BOOL)shouldContactUseFamilyGivenNameOrder:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "_nameOrderWithOverridesForComponents:", v5) == 2;
  return (char)v3;
}

+ (id)allNameComponentRelatedProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CN_PropertyDescription__allNameComponentRelatedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allNameComponentRelatedProperties_cn_once_token_12 != -1)
    dispatch_once(&allNameComponentRelatedProperties_cn_once_token_12, block);
  return (id)allNameComponentRelatedProperties_cn_once_object_12;
}

+ (id)nicknameDescription
{
  if (nicknameDescription_cn_once_token_30 != -1)
    dispatch_once(&nicknameDescription_cn_once_token_30, &__block_literal_global_178);
  return (id)nicknameDescription_cn_once_object_30;
}

+ (id)orderForContactPhoneticName:(id)a3
{
  return (id)objc_msgSend(a1, "orderForContactName:phonetic:", a3, 1);
}

+ (id)localizedPhoneticNameDelimiterForContact:(id)a3
{
  return CFSTR(" ");
}

+ (id)contactUnifyingContacts:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v8 = 0;
  }
  else if (objc_msgSend(v6, "count") == 1)
  {
    objc_opt_class();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      if (objc_msgSend(v7, "shouldFreezeMutableContacts"))
      {
        objc_msgSend(v11, "freezeWithSelfAsSnapshot");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = objc_msgSend(v11, "copy");
      }
    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v12;

  }
  else
  {
    objc_msgSend(a1, "_unifyContacts:options:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v8, "freezeWithSelfAsSnapshot");
  }

  return v8;
}

+ (id)writableAlwaysFetchedProperties
{
  if (writableAlwaysFetchedProperties_cn_once_token_7 != -1)
    dispatch_once(&writableAlwaysFetchedProperties_cn_once_token_7, &__block_literal_global_146);
  return (id)writableAlwaysFetchedProperties_cn_once_object_7;
}

void __49__CN_PropertyDescription__allImageDataProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imageDataDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v14;
  objc_msgSend(*(id *)(a1 + 32), "fullscreenImageDataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  objc_msgSend(*(id *)(a1 + 32), "syncImageDataDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  objc_msgSend(*(id *)(a1 + 32), "imageType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v4;
  objc_msgSend(*(id *)(a1 + 32), "imageHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v5;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailImageDataDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v6;
  objc_msgSend(*(id *)(a1 + 32), "cropRectDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v7;
  objc_msgSend(*(id *)(a1 + 32), "externalImageURIDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v8;
  objc_msgSend(*(id *)(a1 + 32), "memojiMetadataDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v9;
  objc_msgSend(*(id *)(a1 + 32), "sharedPhotoDisplayPreferenceDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)allImageDataProperties_cn_once_object_8;
  allImageDataProperties_cn_once_object_8 = v12;

}

+ (id)externalImageURIDescription
{
  if (externalImageURIDescription_cn_once_token_77 != -1)
    dispatch_once(&externalImageURIDescription_cn_once_token_77, &__block_literal_global_272);
  return (id)externalImageURIDescription_cn_once_object_77;
}

+ (id)thumbnailImageDataDescription
{
  if (thumbnailImageDataDescription_cn_once_token_50 != -1)
    dispatch_once(&thumbnailImageDataDescription_cn_once_token_50, &__block_literal_global_218);
  return (id)thumbnailImageDataDescription_cn_once_object_50;
}

+ (id)imageDataDescription
{
  if (imageDataDescription_cn_once_token_48 != -1)
    dispatch_once(&imageDataDescription_cn_once_token_48, &__block_literal_global_214);
  return (id)imageDataDescription_cn_once_object_48;
}

+ (id)fullscreenImageDataDescription
{
  if (fullscreenImageDataDescription_cn_once_token_51 != -1)
    dispatch_once(&fullscreenImageDataDescription_cn_once_token_51, &__block_literal_global_220);
  return (id)fullscreenImageDataDescription_cn_once_object_51;
}

void __61__CN_PropertyDescription__allPhoneticNameComponentProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "phoneticGivenNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "phoneticMiddleNameDescription", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "phoneticFamilyNameDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)allPhoneticNameComponentProperties_cn_once_object_13;
  allPhoneticNameComponentProperties_cn_once_object_13 = v6;

}

void __70__CN_CNInternationalSupport__requiredPropertiesForNameScriptDetection__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  +[CN givenNameDescription](CN, "givenNameDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN middleNameDescription](CN, "middleNameDescription", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  +[CN familyNameDescription](CN, "familyNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)requiredPropertiesForNameScriptDetection_cn_once_object_0;
  requiredPropertiesForNameScriptDetection_cn_once_object_0 = v4;

}

void __49__CN_PropertyDescription__allWallpaperProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wallpaperDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)allWallpaperProperties_cn_once_object_10;
  allWallpaperProperties_cn_once_object_10 = v3;

}

+ (id)multiValueContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CN_PropertyDescription__multiValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (multiValueContactProperties_cn_once_token_15 != -1)
    dispatch_once(&multiValueContactProperties_cn_once_token_15, block);
  return (id)multiValueContactProperties_cn_once_object_15;
}

+ (NSArray)runtimeOnlyProperties
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "contactFlagsDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)contactFlagsDescription
{
  if (contactFlagsDescription_cn_once_token_20 != -1)
    dispatch_once(&contactFlagsDescription_cn_once_token_20, &__block_literal_global_160);
  return (id)contactFlagsDescription_cn_once_object_20;
}

+ (Class)defaultDataMapperClass
{
  return (Class)objc_opt_class();
}

+ (id)allContainerProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CN_CNContainerPropertyDescription__allContainerProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allContainerProperties_cn_once_token_18 != -1)
    dispatch_once(&allContainerProperties_cn_once_token_18, block);
  return (id)allContainerProperties_cn_once_object_18;
}

uint64_t __51__CN_PropertyDescription__allWallpaperPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __50__CN_PropertyDescription__contactFlagsDescription__block_invoke()
{
  CNContactFlagsDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactFlagsDescription);
  v1 = (void *)contactFlagsDescription_cn_once_object_20;
  contactFlagsDescription_cn_once_object_20 = (uint64_t)v0;

}

void __55__CN_PropertyDescription__downtimeWhitelistDescription__block_invoke()
{
  CNDowntimeWhitelistDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNDowntimeWhitelistDescription);
  v1 = (void *)downtimeWhitelistDescription_cn_once_object_83;
  downtimeWhitelistDescription_cn_once_object_83 = (uint64_t)v0;

}

void __63__CN_PropertyDescription__imageBackgroundColorsDataDescription__block_invoke()
{
  CNImageBackgroundColorsDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageBackgroundColorsDataDescription);
  v1 = (void *)imageBackgroundColorsDataDescription_cn_once_object_91;
  imageBackgroundColorsDataDescription_cn_once_object_91 = (uint64_t)v0;

}

void __61__CN_PropertyDescription__watchWallpaperImageDataDescription__block_invoke()
{
  CNWatchWallpaperImageDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNWatchWallpaperImageDataDescription);
  v1 = (void *)watchWallpaperImageDataDescription_cn_once_object_89;
  watchWallpaperImageDataDescription_cn_once_object_89 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__addressingGrammarsDescription__block_invoke()
{
  CNAddressingGrammarsDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNAddressingGrammarsDescription);
  v1 = (void *)addressingGrammarsDescription_cn_once_object_70;
  addressingGrammarsDescription_cn_once_object_70 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__externalImageURIDescription__block_invoke()
{
  CNExternalImageURIDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExternalImageURIDescription);
  v1 = (void *)externalImageURIDescription_cn_once_object_77;
  externalImageURIDescription_cn_once_object_77 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__modificationDateDescription__block_invoke()
{
  CNModificationDateDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNModificationDateDescription);
  v1 = (void *)modificationDateDescription_cn_once_object_46;
  modificationDateDescription_cn_once_object_46 = (uint64_t)v0;

}

void __49__CN_PropertyDescription__contactTypeDescription__block_invoke()
{
  CNContactTypeDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactTypeDescription);
  v1 = (void *)contactTypeDescription_cn_once_object_59;
  contactTypeDescription_cn_once_object_59 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__creationDateDescription__block_invoke()
{
  CNCreationDateDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNCreationDateDescription);
  v1 = (void *)creationDateDescription_cn_once_object_45;
  creationDateDescription_cn_once_object_45 = (uint64_t)v0;

}

void __52__CN_PropertyDescription__linkIdentifierDescription__block_invoke()
{
  CNLinkIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNLinkIdentifierDescription);
  v1 = (void *)linkIdentifierDescription_cn_once_object_54;
  linkIdentifierDescription_cn_once_object_54 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__identifierDescription__block_invoke()
{
  CNInternalIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNInternalIdentifierDescription);
  v1 = (void *)identifierDescription_cn_once_object_22;
  identifierDescription_cn_once_object_22 = (uint64_t)v0;

}

void __42__CN_PropertyDescription__noteDescription__block_invoke()
{
  CNNoteDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNNoteDescription);
  v1 = (void *)noteDescription_cn_once_object_47;
  noteDescription_cn_once_object_47 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__contactRelationsDescription__block_invoke()
{
  CNContactRelationsDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactRelationsDescription);
  v1 = (void *)contactRelationsDescription_cn_once_object_67;
  contactRelationsDescription_cn_once_object_67 = (uint64_t)v0;

}

void __47__CN_PropertyDescription__wallpaperDescription__block_invoke()
{
  CNWallpaperDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNWallpaperDescription);
  v1 = (void *)wallpaperDescription_cn_once_object_87;
  wallpaperDescription_cn_once_object_87 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__externalUUIDDescription__block_invoke()
{
  CNExternalUUIDDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExternalUUIDDescription);
  v1 = (void *)externalUUIDDescription_cn_once_object_76;
  externalUUIDDescription_cn_once_object_76 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__preferredForNameDescription__block_invoke()
{
  CNPreferredForNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreferredForNameDescription);
  v1 = (void *)preferredForNameDescription_cn_once_object_55;
  preferredForNameDescription_cn_once_object_55 = (uint64_t)v0;

}

void __66__CN_PropertyDescription__sharedPhotoDisplayPreferenceDescription__block_invoke()
{
  CNSharedPhotoDisplayPreferenceDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSharedPhotoDisplayPreferenceDescription);
  v1 = (void *)sharedPhotoDisplayPreferenceDescription_cn_once_object_60;
  sharedPhotoDisplayPreferenceDescription_cn_once_object_60 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__isUsingSharedPhotoDescription__block_invoke()
{
  CNisUsingSharedPhotoDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNisUsingSharedPhotoDescription);
  v1 = (void *)isUsingSharedPhotoDescription_cn_once_object_61;
  isUsingSharedPhotoDescription_cn_once_object_61 = (uint64_t)v0;

}

void __47__CN_PropertyDescription__imageDataDescription__block_invoke()
{
  CNImageDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageDataDescription);
  v1 = (void *)imageDataDescription_cn_once_object_48;
  imageDataDescription_cn_once_object_48 = (uint64_t)v0;

}

void __57__CN_PropertyDescription__iOSLegacyIdentifierDescription__block_invoke()
{
  CNIOSLegacyIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNIOSLegacyIdentifierDescription);
  v1 = (void *)iOSLegacyIdentifierDescription_cn_once_object_23;
  iOSLegacyIdentifierDescription_cn_once_object_23 = (uint64_t)v0;

}

void __46__CN_PropertyDescription__nicknameDescription__block_invoke()
{
  CNNicknameNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNNicknameNameDescription);
  v1 = (void *)nicknameDescription_cn_once_object_30;
  nicknameDescription_cn_once_object_30 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__wallpaperURIDescription__block_invoke()
{
  CNWallpaperURIDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNWallpaperURIDescription);
  v1 = (void *)wallpaperURIDescription_cn_once_object_90;
  wallpaperURIDescription_cn_once_object_90 = (uint64_t)v0;

}

void __55__CN_PropertyDescription__preferredForImageDescription__block_invoke()
{
  CNPreferredForImageDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreferredForImageDescription);
  v1 = (void *)preferredForImageDescription_cn_once_object_56;
  preferredForImageDescription_cn_once_object_56 = (uint64_t)v0;

}

void __49__CN_PropertyDescription__phonemeDataDescription__block_invoke()
{
  CNPhonemeDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhonemeDataDescription);
  v1 = (void *)phonemeDataDescription_cn_once_object_78;
  phonemeDataDescription_cn_once_object_78 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__departmentDescription__block_invoke()
{
  CNDepartmentDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNDepartmentDescription);
  v1 = (void *)departmentDescription_cn_once_object_41;
  departmentDescription_cn_once_object_41 = (uint64_t)v0;

}

void __46__CN_PropertyDescription__jobTitleDescription__block_invoke()
{
  CNJobTitleDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNJobTitleDescription);
  v1 = (void *)jobTitleDescription_cn_once_object_42;
  jobTitleDescription_cn_once_object_42 = (uint64_t)v0;

}

void __57__CN_PropertyDescription__explicitDisplayNameDescription__block_invoke()
{
  CNExplicitDisplayNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExplicitDisplayNameDescription);
  v1 = (void *)explicitDisplayNameDescription_cn_once_object_37;
  explicitDisplayNameDescription_cn_once_object_37 = (uint64_t)v0;

}

void __43__CN_PropertyDescription__datesDescription__block_invoke()
{
  CNDatesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNDatesDescription);
  v1 = (void *)datesDescription_cn_once_object_65;
  datesDescription_cn_once_object_65 = (uint64_t)v0;

}

void __67__CN_PropertyDescription__sectionForSortingByFamilyNameDescription__block_invoke()
{
  CNSectionForSortingByFamilyNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSectionForSortingByFamilyNameDescription);
  v1 = (void *)sectionForSortingByFamilyNameDescription_cn_once_object_38;
  sectionForSortingByFamilyNameDescription_cn_once_object_38 = (uint64_t)v0;

}

void __61__CN_PropertyDescription__pronunciationFamilyNameDescription__block_invoke()
{
  CNPronunciationFamilyNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPronunciationFamilyNameDescription);
  v1 = (void *)pronunciationFamilyNameDescription_cn_once_object_36;
  pronunciationFamilyNameDescription_cn_once_object_36 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__urlAddressesDescription__block_invoke()
{
  CNUrlAddressesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNUrlAddressesDescription);
  v1 = (void *)urlAddressesDescription_cn_once_object_64;
  urlAddressesDescription_cn_once_object_64 = (uint64_t)v0;

}

void __36__CN_PropertyDescription__imageHash__block_invoke()
{
  CNImageHashDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageHashDescription);
  v1 = (void *)imageHash_cn_once_object_85;
  imageHash_cn_once_object_85 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__phoneticMiddleNameDescription__block_invoke()
{
  CNPhoneticMiddleNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhoneticMiddleNameDescription);
  v1 = (void *)phoneticMiddleNameDescription_cn_once_object_32;
  phoneticMiddleNameDescription_cn_once_object_32 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__preferredChannelDescription__block_invoke()
{
  CNPreferredChannelDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreferredChannelDescription);
  v1 = (void *)preferredChannelDescription_cn_once_object_81;
  preferredChannelDescription_cn_once_object_81 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__phoneNumbersDescription__block_invoke()
{
  CNPhoneNumbersDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhoneNumbersDescription);
  v1 = (void *)phoneNumbersDescription_cn_once_object_62;
  phoneNumbersDescription_cn_once_object_62 = (uint64_t)v0;

}

void __69__CN_PropertyDescription__preferredApplePersonaIdentifierDescription__block_invoke()
{
  CNPreferredApplePersonaIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreferredApplePersonaIdentifierDescription);
  v1 = (void *)preferredApplePersonaIdentifierDescription_cn_once_object_58;
  preferredApplePersonaIdentifierDescription_cn_once_object_58 = (uint64_t)v0;

}

void __46__CN_PropertyDescription__birthdayDescription__block_invoke()
{
  CNBirthdayDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNBirthdayDescription);
  v1 = (void *)birthdayDescription_cn_once_object_43;
  birthdayDescription_cn_once_object_43 = (uint64_t)v0;

}

void __61__CN_PropertyDescription__externalModificationTagDescription__block_invoke()
{
  CNExternalModificationTagDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExternalModificationTagDescription);
  v1 = (void *)externalModificationTagDescription_cn_once_object_74;
  externalModificationTagDescription_cn_once_object_74 = (uint64_t)v0;

}

void __54__CN_PropertyDescription__organizationNameDescription__block_invoke()
{
  CNOrganizationNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNOrganizationNameDescription);
  v1 = (void *)organizationNameDescription_cn_once_object_40;
  organizationNameDescription_cn_once_object_40 = (uint64_t)v0;

}

void __51__CN_PropertyDescription__syncImageDataDescription__block_invoke()
{
  CNSyncImageDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSyncImageDataDescription);
  v1 = (void *)syncImageDataDescription_cn_once_object_52;
  syncImageDataDescription_cn_once_object_52 = (uint64_t)v0;

}

void __52__CN_PropertyDescription__memojiMetadataDescription__block_invoke()
{
  CNMemojiMetadataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNMemojiMetadataDescription);
  v1 = (void *)memojiMetadataDescription_cn_once_object_86;
  memojiMetadataDescription_cn_once_object_86 = (uint64_t)v0;

}

void __60__CN_PropertyDescription__instantMessagAddressesDescription__block_invoke()
{
  CNInstantMessageAddressesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNInstantMessageAddressesDescription);
  v1 = (void *)instantMessagAddressesDescription_cn_once_object_66;
  instantMessagAddressesDescription_cn_once_object_66 = (uint64_t)v0;

}

void __58__CN_PropertyDescription__nonGregorianBirthdayDescription__block_invoke()
{
  CNNonGregorianBirthdayDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNNonGregorianBirthdayDescription);
  v1 = (void *)nonGregorianBirthdayDescription_cn_once_object_44;
  nonGregorianBirthdayDescription_cn_once_object_44 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__phoneticFamilyNameDescription__block_invoke()
{
  CNPhoneticFamilyNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhoneticFamilyNameDescription);
  v1 = (void *)phoneticFamilyNameDescription_cn_once_object_33;
  phoneticFamilyNameDescription_cn_once_object_33 = (uint64_t)v0;

}

void __65__CN_PropertyDescription__addressingGrammarsEncryptedDescription__block_invoke()
{
  CNAddressingGrammarsEncryptedDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNAddressingGrammarsEncryptedDescription);
  v1 = (void *)addressingGrammarsEncryptedDescription_cn_once_object_71;
  addressingGrammarsEncryptedDescription_cn_once_object_71 = (uint64_t)v0;

}

void __61__CN_PropertyDescription__preferredLikenessSourceDescription__block_invoke()
{
  CNPreferredLikenessSourceDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreferredLikenessSourceDescription);
  v1 = (void *)preferredLikenessSourceDescription_cn_once_object_57;
  preferredLikenessSourceDescription_cn_once_object_57 = (uint64_t)v0;

}

void __55__CN_PropertyDescription__phoneticGivenNameDescription__block_invoke()
{
  CNPhoneticGivenNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhoneticGivenNameDescription);
  v1 = (void *)phoneticGivenNameDescription_cn_once_object_31;
  phoneticGivenNameDescription_cn_once_object_31 = (uint64_t)v0;

}

void __66__CN_PropertyDescription__sectionForSortingByGivenNameDescription__block_invoke()
{
  CNSectionForSortingByGivenNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSectionForSortingByGivenNameDescription);
  v1 = (void *)sectionForSortingByGivenNameDescription_cn_once_object_39;
  sectionForSortingByGivenNameDescription_cn_once_object_39 = (uint64_t)v0;

}

void __55__CN_PropertyDescription__wallpaperMetadataDescription__block_invoke()
{
  CNWallpaperMetadataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNWallpaperMetadataDescription);
  v1 = (void *)wallpaperMetadataDescription_cn_once_object_88;
  wallpaperMetadataDescription_cn_once_object_88 = (uint64_t)v0;

}

void __50__CN_PropertyDescription__calendarURIsDescription__block_invoke()
{
  CNCalendarURIsDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNCalendarURIsDescription);
  v1 = (void *)calendarURIsDescription_cn_once_object_72;
  calendarURIsDescription_cn_once_object_72 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__imageDataAvailableDescription__block_invoke()
{
  CNImageDataAvailableDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageDataAvailableDescription);
  v1 = (void *)imageDataAvailableDescription_cn_once_object_53;
  imageDataAvailableDescription_cn_once_object_53 = (uint64_t)v0;

}

void __47__CN_PropertyDescription__textAlertDescription__block_invoke()
{
  CNTextAlertDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNTextAlertDescription);
  v1 = (void *)textAlertDescription_cn_once_object_79;
  textAlertDescription_cn_once_object_79 = (uint64_t)v0;

}

void __60__CN_PropertyDescription__pronunciationGivenNameDescription__block_invoke()
{
  CNPronunciationGivenNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPronunciationGivenNameDescription);
  v1 = (void *)pronunciationGivenNameDescription_cn_once_object_35;
  pronunciationGivenNameDescription_cn_once_object_35 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__thumbnailImageDataDescription__block_invoke()
{
  CNThumbnailImageDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNThumbnailImageDataDescription);
  v1 = (void *)thumbnailImageDataDescription_cn_once_object_50;
  thumbnailImageDataDescription_cn_once_object_50 = (uint64_t)v0;

}

void __46__CN_PropertyDescription__cropRectDescription__block_invoke()
{
  CNCropRectDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNCropRectDescription);
  v1 = (void *)cropRectDescription_cn_once_object_49;
  cropRectDescription_cn_once_object_49 = (uint64_t)v0;

}

void __36__CN_PropertyDescription__imageType__block_invoke()
{
  CNImageTypeDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageTypeDescription);
  v1 = (void *)imageType_cn_once_object_84;
  imageType_cn_once_object_84 = (uint64_t)v0;

}

void __53__CN_PropertyDescription__postalAddressesDescription__block_invoke()
{
  CNPostalAddressesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPostalAddressesDescription);
  v1 = (void *)postalAddressesDescription_cn_once_object_69;
  postalAddressesDescription_cn_once_object_69 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__previousFamilyNameDescription__block_invoke()
{
  CNPreviousFamilyNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPreviousFamilyNameDescription);
  v1 = (void *)previousFamilyNameDescription_cn_once_object_29;
  previousFamilyNameDescription_cn_once_object_29 = (uint64_t)v0;

}

void __60__CN_PropertyDescription__externalRepresentationDescription__block_invoke()
{
  CNExternalRepresentationDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExternalRepresentationDescription);
  v1 = (void *)externalRepresentationDescription_cn_once_object_75;
  externalRepresentationDescription_cn_once_object_75 = (uint64_t)v0;

}

void __56__CN_PropertyDescription__externalIdentifierDescription__block_invoke()
{
  CNExternalIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNExternalIdentifierDescription);
  v1 = (void *)externalIdentifierDescription_cn_once_object_73;
  externalIdentifierDescription_cn_once_object_73 = (uint64_t)v0;

}

void __67__CN_PropertyDescription__sensitiveContentConfigurationDescription__block_invoke()
{
  CNSensitiveContentConfigurationDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSensitiveContentConfigurationDescription);
  v1 = (void *)sensitiveContentConfigurationDescription_cn_once_object_92;
  sensitiveContentConfigurationDescription_cn_once_object_92 = (uint64_t)v0;

}

void __62__CN_PropertyDescription__phoneticOrganizationNameDescription__block_invoke()
{
  CNPhoneticOrganizationNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNPhoneticOrganizationNameDescription);
  v1 = (void *)phoneticOrganizationNameDescription_cn_once_object_34;
  phoneticOrganizationNameDescription_cn_once_object_34 = (uint64_t)v0;

}

void __52__CN_PropertyDescription__socialProfilesDescription__block_invoke()
{
  CNSocialProfilesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNSocialProfilesDescription);
  v1 = (void *)socialProfilesDescription_cn_once_object_68;
  socialProfilesDescription_cn_once_object_68 = (uint64_t)v0;

}

void __47__CN_PropertyDescription__callAlertDescription__block_invoke()
{
  CNCallAlertDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNCallAlertDescription);
  v1 = (void *)callAlertDescription_cn_once_object_80;
  callAlertDescription_cn_once_object_80 = (uint64_t)v0;

}

void __57__CN_PropertyDescription__fullscreenImageDataDescription__block_invoke()
{
  CNFullscreenImageDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNFullscreenImageDataDescription);
  v1 = (void *)fullscreenImageDataDescription_cn_once_object_51;
  fullscreenImageDataDescription_cn_once_object_51 = (uint64_t)v0;

}

void __46__CN_PropertyDescription__mapsDataDescription__block_invoke()
{
  CNMapsDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNMapsDataDescription);
  v1 = (void *)mapsDataDescription_cn_once_object_82;
  mapsDataDescription_cn_once_object_82 = (uint64_t)v0;

}

void __52__CN_PropertyDescription__emailAddressesDescription__block_invoke()
{
  CNEmailAddressesDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNEmailAddressesDescription);
  v1 = (void *)emailAddressesDescription_cn_once_object_63;
  emailAddressesDescription_cn_once_object_63 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__namePrefixDescription__block_invoke()
{
  CNNamePrefixDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNNamePrefixDescription);
  v1 = (void *)namePrefixDescription_cn_once_object_24;
  namePrefixDescription_cn_once_object_24 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__nameSuffixDescription__block_invoke()
{
  CNNameSuffixDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNNameSuffixDescription);
  v1 = (void *)nameSuffixDescription_cn_once_object_28;
  nameSuffixDescription_cn_once_object_28 = (uint64_t)v0;

}

void __47__CN_PropertyDescription__givenNameDescription__block_invoke()
{
  CNGivenNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNGivenNameDescription);
  v1 = (void *)givenNameDescription_cn_once_object_25;
  givenNameDescription_cn_once_object_25 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__familyNameDescription__block_invoke()
{
  CNFamilyNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNFamilyNameDescription);
  v1 = (void *)familyNameDescription_cn_once_object_27;
  familyNameDescription_cn_once_object_27 = (uint64_t)v0;

}

void __48__CN_PropertyDescription__middleNameDescription__block_invoke()
{
  CNMiddleNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNMiddleNameDescription);
  v1 = (void *)middleNameDescription_cn_once_object_26;
  middleNameDescription_cn_once_object_26 = (uint64_t)v0;

}

uint64_t __58__CN_PropertyDescription__writableAlwaysFetchedProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWritable");
}

void __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_indexBy:", &__block_literal_global_159);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)contactPropertiesByKey_cn_once_object_19;
  contactPropertiesByKey_cn_once_object_19 = v2;

}

void __60__CN_PropertyDescription__allNameComponentRelatedProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[17];

  v22[15] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "namePrefixDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  objc_msgSend(*(id *)(a1 + 32), "givenNameDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v20;
  objc_msgSend(*(id *)(a1 + 32), "middleNameDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(*(id *)(a1 + 32), "familyNameDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(*(id *)(a1 + 32), "previousFamilyNameDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v17;
  objc_msgSend(*(id *)(a1 + 32), "nameSuffixDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v16;
  objc_msgSend(*(id *)(a1 + 32), "nicknameDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v15;
  objc_msgSend(*(id *)(a1 + 32), "pronunciationGivenNameDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v14;
  objc_msgSend(*(id *)(a1 + 32), "pronunciationFamilyNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v2;
  objc_msgSend(*(id *)(a1 + 32), "explicitDisplayNameDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v3;
  objc_msgSend(*(id *)(a1 + 32), "organizationNameDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v4;
  objc_msgSend(*(id *)(a1 + 32), "phoneticOrganizationNameDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v5;
  objc_msgSend(*(id *)(a1 + 32), "contactTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v6;
  objc_msgSend(*(id *)(a1 + 32), "departmentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v7;
  objc_msgSend(*(id *)(a1 + 32), "jobTitleDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allPhoneticNameComponentProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)allNameComponentRelatedProperties_cn_once_object_12;
  allNameComponentRelatedProperties_cn_once_object_12 = v12;

}

void __47__CN_PropertyDescription__allContactProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[75];

  v78[73] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifierDescription");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v77;
  objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifierDescription");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v76;
  objc_msgSend(*(id *)(a1 + 32), "namePrefixDescription");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v75;
  objc_msgSend(*(id *)(a1 + 32), "givenNameDescription");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v74;
  objc_msgSend(*(id *)(a1 + 32), "middleNameDescription");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v73;
  objc_msgSend(*(id *)(a1 + 32), "familyNameDescription");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v72;
  objc_msgSend(*(id *)(a1 + 32), "nameSuffixDescription");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v71;
  objc_msgSend(*(id *)(a1 + 32), "previousFamilyNameDescription");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v70;
  objc_msgSend(*(id *)(a1 + 32), "nicknameDescription");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v69;
  objc_msgSend(*(id *)(a1 + 32), "phoneticGivenNameDescription");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v68;
  objc_msgSend(*(id *)(a1 + 32), "phoneticMiddleNameDescription");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v67;
  objc_msgSend(*(id *)(a1 + 32), "phoneticFamilyNameDescription");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v66;
  objc_msgSend(*(id *)(a1 + 32), "phoneticOrganizationNameDescription");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v78[12] = v65;
  objc_msgSend(*(id *)(a1 + 32), "pronunciationGivenNameDescription");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v78[13] = v64;
  objc_msgSend(*(id *)(a1 + 32), "pronunciationFamilyNameDescription");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v78[14] = v63;
  objc_msgSend(*(id *)(a1 + 32), "explicitDisplayNameDescription");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[15] = v62;
  objc_msgSend(*(id *)(a1 + 32), "addressingGrammarsDescription");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v78[16] = v61;
  objc_msgSend(*(id *)(a1 + 32), "addressingGrammarsEncryptedDescription");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v78[17] = v60;
  objc_msgSend(*(id *)(a1 + 32), "sectionForSortingByFamilyNameDescription");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v78[18] = v59;
  objc_msgSend(*(id *)(a1 + 32), "sectionForSortingByGivenNameDescription");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v78[19] = v58;
  objc_msgSend(*(id *)(a1 + 32), "organizationNameDescription");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v78[20] = v57;
  objc_msgSend(*(id *)(a1 + 32), "departmentDescription");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78[21] = v56;
  objc_msgSend(*(id *)(a1 + 32), "jobTitleDescription");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v78[22] = v55;
  objc_msgSend(*(id *)(a1 + 32), "birthdayDescription");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v78[23] = v54;
  objc_msgSend(*(id *)(a1 + 32), "nonGregorianBirthdayDescription");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v78[24] = v53;
  objc_msgSend(*(id *)(a1 + 32), "creationDateDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78[25] = v52;
  objc_msgSend(*(id *)(a1 + 32), "modificationDateDescription");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v78[26] = v51;
  objc_msgSend(*(id *)(a1 + 32), "noteDescription");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[27] = v50;
  objc_msgSend(*(id *)(a1 + 32), "imageDataDescription");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v78[28] = v49;
  objc_msgSend(*(id *)(a1 + 32), "cropRectDescription");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v78[29] = v48;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailImageDataDescription");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78[30] = v47;
  objc_msgSend(*(id *)(a1 + 32), "imageDataAvailableDescription");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v78[31] = v46;
  objc_msgSend(*(id *)(a1 + 32), "fullscreenImageDataDescription");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v78[32] = v45;
  objc_msgSend(*(id *)(a1 + 32), "syncImageDataDescription");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v78[33] = v44;
  objc_msgSend(*(id *)(a1 + 32), "linkIdentifierDescription");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v78[34] = v43;
  objc_msgSend(*(id *)(a1 + 32), "preferredForNameDescription");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v78[35] = v42;
  objc_msgSend(*(id *)(a1 + 32), "preferredForImageDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[36] = v41;
  objc_msgSend(*(id *)(a1 + 32), "contactTypeDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v78[37] = v40;
  objc_msgSend(*(id *)(a1 + 32), "preferredLikenessSourceDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v78[38] = v39;
  objc_msgSend(*(id *)(a1 + 32), "preferredApplePersonaIdentifierDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[39] = v38;
  objc_msgSend(*(id *)(a1 + 32), "sharedPhotoDisplayPreferenceDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78[40] = v37;
  objc_msgSend(*(id *)(a1 + 32), "isUsingSharedPhotoDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78[41] = v36;
  objc_msgSend(*(id *)(a1 + 32), "phoneNumbersDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v78[42] = v35;
  objc_msgSend(*(id *)(a1 + 32), "emailAddressesDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78[43] = v34;
  objc_msgSend(*(id *)(a1 + 32), "urlAddressesDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v78[44] = v33;
  objc_msgSend(*(id *)(a1 + 32), "datesDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78[45] = v32;
  objc_msgSend(*(id *)(a1 + 32), "instantMessagAddressesDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78[46] = v31;
  objc_msgSend(*(id *)(a1 + 32), "contactRelationsDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78[47] = v30;
  objc_msgSend(*(id *)(a1 + 32), "socialProfilesDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v78[48] = v29;
  objc_msgSend(*(id *)(a1 + 32), "postalAddressesDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[49] = v28;
  objc_msgSend(*(id *)(a1 + 32), "phonemeDataDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v78[50] = v27;
  objc_msgSend(*(id *)(a1 + 32), "textAlertDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v78[51] = v26;
  objc_msgSend(*(id *)(a1 + 32), "callAlertDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v78[52] = v25;
  objc_msgSend(*(id *)(a1 + 32), "mapsDataDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[53] = v24;
  objc_msgSend(*(id *)(a1 + 32), "preferredChannelDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v78[54] = v23;
  objc_msgSend(*(id *)(a1 + 32), "calendarURIsDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[55] = v22;
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifierDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v78[56] = v21;
  objc_msgSend(*(id *)(a1 + 32), "externalModificationTagDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[57] = v20;
  objc_msgSend(*(id *)(a1 + 32), "externalRepresentationDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78[58] = v19;
  objc_msgSend(*(id *)(a1 + 32), "externalUUIDDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v78[59] = v18;
  objc_msgSend(*(id *)(a1 + 32), "externalImageURIDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v78[60] = v17;
  objc_msgSend(*(id *)(a1 + 32), "imageType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v78[61] = v16;
  objc_msgSend(*(id *)(a1 + 32), "imageHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v78[62] = v15;
  objc_msgSend(*(id *)(a1 + 32), "downtimeWhitelistDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v78[63] = v14;
  objc_msgSend(*(id *)(a1 + 32), "memojiMetadataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v78[64] = v2;
  objc_msgSend(*(id *)(a1 + 32), "wallpaperDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v78[65] = v3;
  objc_msgSend(*(id *)(a1 + 32), "wallpaperMetadataDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78[66] = v4;
  objc_msgSend(*(id *)(a1 + 32), "watchWallpaperImageDataDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v78[67] = v5;
  objc_msgSend(*(id *)(a1 + 32), "wallpaperURIDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78[68] = v6;
  objc_msgSend(*(id *)(a1 + 32), "imageBackgroundColorsDataDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78[69] = v7;
  objc_msgSend(*(id *)(a1 + 32), "sensitiveContentConfigurationDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78[70] = v8;
  objc_msgSend(*(id *)(a1 + 32), "imageSyncFailedTimeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78[71] = v9;
  objc_msgSend(*(id *)(a1 + 32), "wallpaperSyncFailedTimeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[72] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 73);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)allContactProperties_cn_once_object_2;
  allContactProperties_cn_once_object_2 = v12;

}

+ (id)givenNameDescription
{
  if (givenNameDescription_cn_once_token_25 != -1)
    dispatch_once(&givenNameDescription_cn_once_token_25, &__block_literal_global_168);
  return (id)givenNameDescription_cn_once_object_25;
}

+ (id)familyNameDescription
{
  if (familyNameDescription_cn_once_token_27 != -1)
    dispatch_once(&familyNameDescription_cn_once_token_27, &__block_literal_global_172_0);
  return (id)familyNameDescription_cn_once_object_27;
}

+ (id)middleNameDescription
{
  if (middleNameDescription_cn_once_token_26 != -1)
    dispatch_once(&middleNameDescription_cn_once_token_26, &__block_literal_global_170);
  return (id)middleNameDescription_cn_once_object_26;
}

+ (id)nameSuffixDescription
{
  if (nameSuffixDescription_cn_once_token_28 != -1)
    dispatch_once(&nameSuffixDescription_cn_once_token_28, &__block_literal_global_174);
  return (id)nameSuffixDescription_cn_once_object_28;
}

+ (id)namePrefixDescription
{
  if (namePrefixDescription_cn_once_token_24 != -1)
    dispatch_once(&namePrefixDescription_cn_once_token_24, &__block_literal_global_166);
  return (id)namePrefixDescription_cn_once_object_24;
}

+ (id)sharedPhotoDisplayPreferenceDescription
{
  if (sharedPhotoDisplayPreferenceDescription_cn_once_token_60 != -1)
    dispatch_once(&sharedPhotoDisplayPreferenceDescription_cn_once_token_60, &__block_literal_global_238);
  return (id)sharedPhotoDisplayPreferenceDescription_cn_once_object_60;
}

+ (id)imageHash
{
  if (imageHash_cn_once_token_85 != -1)
    dispatch_once(&imageHash_cn_once_token_85, &__block_literal_global_288);
  return (id)imageHash_cn_once_object_85;
}

+ (id)cropRectDescription
{
  if (cropRectDescription_cn_once_token_49 != -1)
    dispatch_once(&cropRectDescription_cn_once_token_49, &__block_literal_global_216);
  return (id)cropRectDescription_cn_once_object_49;
}

+ (id)syncImageDataDescription
{
  if (syncImageDataDescription_cn_once_token_52 != -1)
    dispatch_once(&syncImageDataDescription_cn_once_token_52, &__block_literal_global_222);
  return (id)syncImageDataDescription_cn_once_object_52;
}

+ (id)memojiMetadataDescription
{
  if (memojiMetadataDescription_cn_once_token_86 != -1)
    dispatch_once(&memojiMetadataDescription_cn_once_token_86, &__block_literal_global_290);
  return (id)memojiMetadataDescription_cn_once_object_86;
}

+ (id)imageType
{
  if (imageType_cn_once_token_84 != -1)
    dispatch_once(&imageType_cn_once_token_84, &__block_literal_global_286);
  return (id)imageType_cn_once_object_84;
}

+ (id)wallpaperDescription
{
  if (wallpaperDescription_cn_once_token_87 != -1)
    dispatch_once(&wallpaperDescription_cn_once_token_87, &__block_literal_global_292);
  return (id)wallpaperDescription_cn_once_object_87;
}

+ (id)phoneticOrganizationNameDescription
{
  if (phoneticOrganizationNameDescription_cn_once_token_34 != -1)
    dispatch_once(&phoneticOrganizationNameDescription_cn_once_token_34, &__block_literal_global_186);
  return (id)phoneticOrganizationNameDescription_cn_once_object_34;
}

+ (id)phoneticMiddleNameDescription
{
  if (phoneticMiddleNameDescription_cn_once_token_32 != -1)
    dispatch_once(&phoneticMiddleNameDescription_cn_once_token_32, &__block_literal_global_182);
  return (id)phoneticMiddleNameDescription_cn_once_object_32;
}

+ (id)phoneticFamilyNameDescription
{
  if (phoneticFamilyNameDescription_cn_once_token_33 != -1)
    dispatch_once(&phoneticFamilyNameDescription_cn_once_token_33, &__block_literal_global_184);
  return (id)phoneticFamilyNameDescription_cn_once_object_33;
}

+ (id)pronunciationFamilyNameDescription
{
  if (pronunciationFamilyNameDescription_cn_once_token_36 != -1)
    dispatch_once(&pronunciationFamilyNameDescription_cn_once_token_36, &__block_literal_global_190);
  return (id)pronunciationFamilyNameDescription_cn_once_object_36;
}

+ (id)explicitDisplayNameDescription
{
  if (explicitDisplayNameDescription_cn_once_token_37 != -1)
    dispatch_once(&explicitDisplayNameDescription_cn_once_token_37, &__block_literal_global_192);
  return (id)explicitDisplayNameDescription_cn_once_object_37;
}

+ (id)jobTitleDescription
{
  if (jobTitleDescription_cn_once_token_42 != -1)
    dispatch_once(&jobTitleDescription_cn_once_token_42, &__block_literal_global_202);
  return (id)jobTitleDescription_cn_once_object_42;
}

+ (id)phoneticGivenNameDescription
{
  if (phoneticGivenNameDescription_cn_once_token_31 != -1)
    dispatch_once(&phoneticGivenNameDescription_cn_once_token_31, &__block_literal_global_180);
  return (id)phoneticGivenNameDescription_cn_once_object_31;
}

+ (id)departmentDescription
{
  if (departmentDescription_cn_once_token_41 != -1)
    dispatch_once(&departmentDescription_cn_once_token_41, &__block_literal_global_200);
  return (id)departmentDescription_cn_once_object_41;
}

+ (id)pronunciationGivenNameDescription
{
  if (pronunciationGivenNameDescription_cn_once_token_35 != -1)
    dispatch_once(&pronunciationGivenNameDescription_cn_once_token_35, &__block_literal_global_188);
  return (id)pronunciationGivenNameDescription_cn_once_object_35;
}

+ (id)previousFamilyNameDescription
{
  if (previousFamilyNameDescription_cn_once_token_29 != -1)
    dispatch_once(&previousFamilyNameDescription_cn_once_token_29, &__block_literal_global_176);
  return (id)previousFamilyNameDescription_cn_once_object_29;
}

+ (id)contactTypeDescription
{
  if (contactTypeDescription_cn_once_token_59 != -1)
    dispatch_once(&contactTypeDescription_cn_once_token_59, &__block_literal_global_236);
  return (id)contactTypeDescription_cn_once_object_59;
}

void __50__CN_PropertyDescription__alwaysFetchedProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifierDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifierDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)alwaysFetchedProperties_cn_once_object_6;
  alwaysFetchedProperties_cn_once_object_6 = v5;

}

+ (id)iOSLegacyIdentifierDescription
{
  if (iOSLegacyIdentifierDescription_cn_once_token_23 != -1)
    dispatch_once(&iOSLegacyIdentifierDescription_cn_once_token_23, &__block_literal_global_164);
  return (id)iOSLegacyIdentifierDescription_cn_once_object_23;
}

+ (id)identifierDescription
{
  if (identifierDescription_cn_once_token_22 != -1)
    dispatch_once(&identifierDescription_cn_once_token_22, &__block_literal_global_162);
  return (id)identifierDescription_cn_once_object_22;
}

+ (id)watchWallpaperImageDataDescription
{
  if (watchWallpaperImageDataDescription_cn_once_token_89 != -1)
    dispatch_once(&watchWallpaperImageDataDescription_cn_once_token_89, &__block_literal_global_296);
  return (id)watchWallpaperImageDataDescription_cn_once_object_89;
}

+ (id)wallpaperURIDescription
{
  if (wallpaperURIDescription_cn_once_token_90 != -1)
    dispatch_once(&wallpaperURIDescription_cn_once_token_90, &__block_literal_global_298);
  return (id)wallpaperURIDescription_cn_once_object_90;
}

+ (id)wallpaperMetadataDescription
{
  if (wallpaperMetadataDescription_cn_once_token_88 != -1)
    dispatch_once(&wallpaperMetadataDescription_cn_once_token_88, &__block_literal_global_294);
  return (id)wallpaperMetadataDescription_cn_once_object_88;
}

+ (id)textAlertDescription
{
  if (textAlertDescription_cn_once_token_79 != -1)
    dispatch_once(&textAlertDescription_cn_once_token_79, &__block_literal_global_276);
  return (id)textAlertDescription_cn_once_object_79;
}

+ (id)sensitiveContentConfigurationDescription
{
  if (sensitiveContentConfigurationDescription_cn_once_token_92 != -1)
    dispatch_once(&sensitiveContentConfigurationDescription_cn_once_token_92, &__block_literal_global_302);
  return (id)sensitiveContentConfigurationDescription_cn_once_object_92;
}

+ (id)preferredLikenessSourceDescription
{
  if (preferredLikenessSourceDescription_cn_once_token_57 != -1)
    dispatch_once(&preferredLikenessSourceDescription_cn_once_token_57, &__block_literal_global_232);
  return (id)preferredLikenessSourceDescription_cn_once_object_57;
}

+ (id)preferredForNameDescription
{
  if (preferredForNameDescription_cn_once_token_55 != -1)
    dispatch_once(&preferredForNameDescription_cn_once_token_55, &__block_literal_global_228);
  return (id)preferredForNameDescription_cn_once_object_55;
}

+ (id)preferredApplePersonaIdentifierDescription
{
  if (preferredApplePersonaIdentifierDescription_cn_once_token_58 != -1)
    dispatch_once(&preferredApplePersonaIdentifierDescription_cn_once_token_58, &__block_literal_global_234);
  return (id)preferredApplePersonaIdentifierDescription_cn_once_object_58;
}

+ (id)postalAddressesDescription
{
  if (postalAddressesDescription_cn_once_token_69 != -1)
    dispatch_once(&postalAddressesDescription_cn_once_token_69, &__block_literal_global_256);
  return (id)postalAddressesDescription_cn_once_object_69;
}

+ (id)phonemeDataDescription
{
  if (phonemeDataDescription_cn_once_token_78 != -1)
    dispatch_once(&phonemeDataDescription_cn_once_token_78, &__block_literal_global_274);
  return (id)phonemeDataDescription_cn_once_object_78;
}

+ (id)phoneNumbersDescription
{
  if (phoneNumbersDescription_cn_once_token_62 != -1)
    dispatch_once(&phoneNumbersDescription_cn_once_token_62, &__block_literal_global_242);
  return (id)phoneNumbersDescription_cn_once_object_62;
}

+ (id)modificationDateDescription
{
  if (modificationDateDescription_cn_once_token_46 != -1)
    dispatch_once(&modificationDateDescription_cn_once_token_46, &__block_literal_global_210_0);
  return (id)modificationDateDescription_cn_once_object_46;
}

+ (id)mapsDataDescription
{
  if (mapsDataDescription_cn_once_token_82 != -1)
    dispatch_once(&mapsDataDescription_cn_once_token_82, &__block_literal_global_282);
  return (id)mapsDataDescription_cn_once_object_82;
}

+ (id)linkIdentifierDescription
{
  if (linkIdentifierDescription_cn_once_token_54 != -1)
    dispatch_once(&linkIdentifierDescription_cn_once_token_54, &__block_literal_global_226);
  return (id)linkIdentifierDescription_cn_once_object_54;
}

+ (id)isUsingSharedPhotoDescription
{
  if (isUsingSharedPhotoDescription_cn_once_token_61 != -1)
    dispatch_once(&isUsingSharedPhotoDescription_cn_once_token_61, &__block_literal_global_240);
  return (id)isUsingSharedPhotoDescription_cn_once_object_61;
}

+ (id)imageBackgroundColorsDataDescription
{
  if (imageBackgroundColorsDataDescription_cn_once_token_91 != -1)
    dispatch_once(&imageBackgroundColorsDataDescription_cn_once_token_91, &__block_literal_global_300);
  return (id)imageBackgroundColorsDataDescription_cn_once_object_91;
}

+ (id)externalUUIDDescription
{
  if (externalUUIDDescription_cn_once_token_76 != -1)
    dispatch_once(&externalUUIDDescription_cn_once_token_76, &__block_literal_global_270);
  return (id)externalUUIDDescription_cn_once_object_76;
}

+ (id)externalRepresentationDescription
{
  if (externalRepresentationDescription_cn_once_token_75 != -1)
    dispatch_once(&externalRepresentationDescription_cn_once_token_75, &__block_literal_global_268);
  return (id)externalRepresentationDescription_cn_once_object_75;
}

+ (id)downtimeWhitelistDescription
{
  if (downtimeWhitelistDescription_cn_once_token_83 != -1)
    dispatch_once(&downtimeWhitelistDescription_cn_once_token_83, &__block_literal_global_284);
  return (id)downtimeWhitelistDescription_cn_once_object_83;
}

+ (id)creationDateDescription
{
  if (creationDateDescription_cn_once_token_45 != -1)
    dispatch_once(&creationDateDescription_cn_once_token_45, &__block_literal_global_208);
  return (id)creationDateDescription_cn_once_object_45;
}

+ (id)contactRelationsDescription
{
  if (contactRelationsDescription_cn_once_token_67 != -1)
    dispatch_once(&contactRelationsDescription_cn_once_token_67, &__block_literal_global_252);
  return (id)contactRelationsDescription_cn_once_object_67;
}

+ (id)callAlertDescription
{
  if (callAlertDescription_cn_once_token_80 != -1)
    dispatch_once(&callAlertDescription_cn_once_token_80, &__block_literal_global_278);
  return (id)callAlertDescription_cn_once_object_80;
}

+ (id)calendarURIsDescription
{
  if (calendarURIsDescription_cn_once_token_72 != -1)
    dispatch_once(&calendarURIsDescription_cn_once_token_72, &__block_literal_global_262);
  return (id)calendarURIsDescription_cn_once_object_72;
}

+ (id)urlAddressesDescription
{
  if (urlAddressesDescription_cn_once_token_64 != -1)
    dispatch_once(&urlAddressesDescription_cn_once_token_64, &__block_literal_global_246);
  return (id)urlAddressesDescription_cn_once_object_64;
}

+ (id)sectionForSortingByFamilyNameDescription
{
  if (sectionForSortingByFamilyNameDescription_cn_once_token_38 != -1)
    dispatch_once(&sectionForSortingByFamilyNameDescription_cn_once_token_38, &__block_literal_global_194);
  return (id)sectionForSortingByFamilyNameDescription_cn_once_object_38;
}

+ (id)nonGregorianBirthdayDescription
{
  if (nonGregorianBirthdayDescription_cn_once_token_44 != -1)
    dispatch_once(&nonGregorianBirthdayDescription_cn_once_token_44, &__block_literal_global_206);
  return (id)nonGregorianBirthdayDescription_cn_once_object_44;
}

+ (id)birthdayDescription
{
  if (birthdayDescription_cn_once_token_43 != -1)
    dispatch_once(&birthdayDescription_cn_once_token_43, &__block_literal_global_204);
  return (id)birthdayDescription_cn_once_object_43;
}

+ (id)preferredChannelDescription
{
  if (preferredChannelDescription_cn_once_token_81 != -1)
    dispatch_once(&preferredChannelDescription_cn_once_token_81, &__block_literal_global_280);
  return (id)preferredChannelDescription_cn_once_object_81;
}

+ (id)sectionForSortingByGivenNameDescription
{
  if (sectionForSortingByGivenNameDescription_cn_once_token_39 != -1)
    dispatch_once(&sectionForSortingByGivenNameDescription_cn_once_token_39, &__block_literal_global_196);
  return (id)sectionForSortingByGivenNameDescription_cn_once_object_39;
}

+ (id)preferredForImageDescription
{
  if (preferredForImageDescription_cn_once_token_56 != -1)
    dispatch_once(&preferredForImageDescription_cn_once_token_56, &__block_literal_global_230_0);
  return (id)preferredForImageDescription_cn_once_object_56;
}

+ (id)noteDescription
{
  if (noteDescription_cn_once_token_47 != -1)
    dispatch_once(&noteDescription_cn_once_token_47, &__block_literal_global_212);
  return (id)noteDescription_cn_once_object_47;
}

+ (id)instantMessagAddressesDescription
{
  if (instantMessagAddressesDescription_cn_once_token_66 != -1)
    dispatch_once(&instantMessagAddressesDescription_cn_once_token_66, &__block_literal_global_250);
  return (id)instantMessagAddressesDescription_cn_once_object_66;
}

+ (id)imageDataAvailableDescription
{
  if (imageDataAvailableDescription_cn_once_token_53 != -1)
    dispatch_once(&imageDataAvailableDescription_cn_once_token_53, &__block_literal_global_224);
  return (id)imageDataAvailableDescription_cn_once_object_53;
}

+ (id)externalModificationTagDescription
{
  if (externalModificationTagDescription_cn_once_token_74 != -1)
    dispatch_once(&externalModificationTagDescription_cn_once_token_74, &__block_literal_global_266);
  return (id)externalModificationTagDescription_cn_once_object_74;
}

+ (id)externalIdentifierDescription
{
  if (externalIdentifierDescription_cn_once_token_73 != -1)
    dispatch_once(&externalIdentifierDescription_cn_once_token_73, &__block_literal_global_264);
  return (id)externalIdentifierDescription_cn_once_object_73;
}

+ (id)emailAddressesDescription
{
  if (emailAddressesDescription_cn_once_token_63 != -1)
    dispatch_once(&emailAddressesDescription_cn_once_token_63, &__block_literal_global_244);
  return (id)emailAddressesDescription_cn_once_object_63;
}

+ (id)datesDescription
{
  if (datesDescription_cn_once_token_65 != -1)
    dispatch_once(&datesDescription_cn_once_token_65, &__block_literal_global_248);
  return (id)datesDescription_cn_once_object_65;
}

+ (id)addressingGrammarsEncryptedDescription
{
  if (addressingGrammarsEncryptedDescription_cn_once_token_71 != -1)
    dispatch_once(&addressingGrammarsEncryptedDescription_cn_once_token_71, &__block_literal_global_260);
  return (id)addressingGrammarsEncryptedDescription_cn_once_object_71;
}

+ (id)socialProfilesDescription
{
  if (socialProfilesDescription_cn_once_token_68 != -1)
    dispatch_once(&socialProfilesDescription_cn_once_token_68, &__block_literal_global_254);
  return (id)socialProfilesDescription_cn_once_object_68;
}

+ (id)addressingGrammarsDescription
{
  if (addressingGrammarsDescription_cn_once_token_70 != -1)
    dispatch_once(&addressingGrammarsDescription_cn_once_token_70, &__block_literal_global_258);
  return (id)addressingGrammarsDescription_cn_once_object_70;
}

void __51__CN_PropertyDescription__allImageDataPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[CN allImageDataProperties](CN, "allImageDataProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_150);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)allImageDataPropertyKeys_cn_once_object_9;
  allImageDataPropertyKeys_cn_once_object_9 = v2;

}

+ (id)allImageDataProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__allImageDataProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allImageDataProperties_cn_once_token_8 != -1)
    dispatch_once(&allImageDataProperties_cn_once_token_8, block);
  return (id)allImageDataProperties_cn_once_object_8;
}

void __51__CN_PropertyDescription__allWallpaperPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[CN allWallpaperProperties](CN, "allWallpaperProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_152_0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)allWallpaperPropertyKeys_cn_once_object_11;
  allWallpaperPropertyKeys_cn_once_object_11 = v2;

}

+ (id)allWallpaperProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__allWallpaperProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allWallpaperProperties_cn_once_token_10 != -1)
    dispatch_once(&allWallpaperProperties_cn_once_token_10, block);
  return (id)allWallpaperProperties_cn_once_object_10;
}

void __60__CN_CNContainerPropertyDescription__allContainerProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  _QWORD v23[20];

  v23[18] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifierDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  objc_msgSend(*(id *)(a1 + 32), "containerNameDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v21;
  objc_msgSend(*(id *)(a1 + 32), "containerTypeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  objc_msgSend(*(id *)(a1 + 32), "containeriOSLegacyIdentifierDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v19;
  objc_msgSend(*(id *)(a1 + 32), "containerAccountIdentifierDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v18;
  objc_msgSend(*(id *)(a1 + 32), "containerEnabledDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v17;
  objc_msgSend(*(id *)(a1 + 32), "containerExternalIdentifierDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v16;
  objc_msgSend(*(id *)(a1 + 32), "containerExternalModificationTagDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v15;
  objc_msgSend(*(id *)(a1 + 32), "containerExternalSyncTagDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v14;
  objc_msgSend(*(id *)(a1 + 32), "containerExternalSyncDataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v2;
  objc_msgSend(*(id *)(a1 + 32), "containerConstraintsPathDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v3;
  objc_msgSend(*(id *)(a1 + 32), "containerMeIdentifierDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v4;
  objc_msgSend(*(id *)(a1 + 32), "containerRestrictionsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v5;
  objc_msgSend(*(id *)(a1 + 32), "containerGuardianRestrictedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v6;
  objc_msgSend(*(id *)(a1 + 32), "containerGuardianStateDirtyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[14] = v7;
  objc_msgSend(*(id *)(a1 + 32), "containerLastSyncDateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[15] = v8;
  objc_msgSend(*(id *)(a1 + 32), "containerProviderIdentifierDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[16] = v9;
  objc_msgSend(*(id *)(a1 + 32), "containerProviderMetadataDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)allContainerProperties_cn_once_object_18;
  allContainerProperties_cn_once_object_18 = v12;

}

+ (id)containeriOSLegacyIdentifierDescription
{
  if (containeriOSLegacyIdentifierDescription_cn_once_token_3 != -1)
    dispatch_once(&containeriOSLegacyIdentifierDescription_cn_once_token_3, &__block_literal_global_50);
  return (id)containeriOSLegacyIdentifierDescription_cn_once_object_3;
}

+ (id)containerTypeDescription
{
  if (containerTypeDescription_cn_once_token_2 != -1)
    dispatch_once(&containerTypeDescription_cn_once_token_2, &__block_literal_global_48);
  return (id)containerTypeDescription_cn_once_object_2;
}

+ (id)containerRestrictionsDescription
{
  if (containerRestrictionsDescription_cn_once_token_12 != -1)
    dispatch_once(&containerRestrictionsDescription_cn_once_token_12, &__block_literal_global_68);
  return (id)containerRestrictionsDescription_cn_once_object_12;
}

+ (id)containerProviderMetadataDescription
{
  if (containerProviderMetadataDescription_cn_once_token_17 != -1)
    dispatch_once(&containerProviderMetadataDescription_cn_once_token_17, &__block_literal_global_78);
  return (id)containerProviderMetadataDescription_cn_once_object_17;
}

+ (id)containerProviderIdentifierDescription
{
  if (containerProviderIdentifierDescription_cn_once_token_16 != -1)
    dispatch_once(&containerProviderIdentifierDescription_cn_once_token_16, &__block_literal_global_76);
  return (id)containerProviderIdentifierDescription_cn_once_object_16;
}

+ (id)containerNameDescription
{
  if (containerNameDescription_cn_once_token_1 != -1)
    dispatch_once(&containerNameDescription_cn_once_token_1, &__block_literal_global_46);
  return (id)containerNameDescription_cn_once_object_1;
}

+ (id)containerMeIdentifierDescription
{
  if (containerMeIdentifierDescription_cn_once_token_11 != -1)
    dispatch_once(&containerMeIdentifierDescription_cn_once_token_11, &__block_literal_global_66);
  return (id)containerMeIdentifierDescription_cn_once_object_11;
}

+ (id)containerLastSyncDateDescription
{
  if (containerLastSyncDateDescription_cn_once_token_15 != -1)
    dispatch_once(&containerLastSyncDateDescription_cn_once_token_15, &__block_literal_global_74);
  return (id)containerLastSyncDateDescription_cn_once_object_15;
}

+ (id)containerIdentifierDescription
{
  if (containerIdentifierDescription_cn_once_token_0 != -1)
    dispatch_once(&containerIdentifierDescription_cn_once_token_0, &__block_literal_global_5);
  return (id)containerIdentifierDescription_cn_once_object_0;
}

+ (id)containerGuardianStateDirtyDescription
{
  if (containerGuardianStateDirtyDescription_cn_once_token_14 != -1)
    dispatch_once(&containerGuardianStateDirtyDescription_cn_once_token_14, &__block_literal_global_72);
  return (id)containerGuardianStateDirtyDescription_cn_once_object_14;
}

+ (id)containerGuardianRestrictedDescription
{
  if (containerGuardianRestrictedDescription_cn_once_token_13 != -1)
    dispatch_once(&containerGuardianRestrictedDescription_cn_once_token_13, &__block_literal_global_70_0);
  return (id)containerGuardianRestrictedDescription_cn_once_object_13;
}

+ (id)containerExternalSyncTagDescription
{
  if (containerExternalSyncTagDescription_cn_once_token_8 != -1)
    dispatch_once(&containerExternalSyncTagDescription_cn_once_token_8, &__block_literal_global_60);
  return (id)containerExternalSyncTagDescription_cn_once_object_8;
}

+ (id)containerExternalSyncDataDescription
{
  if (containerExternalSyncDataDescription_cn_once_token_9 != -1)
    dispatch_once(&containerExternalSyncDataDescription_cn_once_token_9, &__block_literal_global_62);
  return (id)containerExternalSyncDataDescription_cn_once_object_9;
}

+ (id)containerExternalModificationTagDescription
{
  if (containerExternalModificationTagDescription_cn_once_token_7 != -1)
    dispatch_once(&containerExternalModificationTagDescription_cn_once_token_7, &__block_literal_global_58);
  return (id)containerExternalModificationTagDescription_cn_once_object_7;
}

+ (id)containerExternalIdentifierDescription
{
  if (containerExternalIdentifierDescription_cn_once_token_6 != -1)
    dispatch_once(&containerExternalIdentifierDescription_cn_once_token_6, &__block_literal_global_56);
  return (id)containerExternalIdentifierDescription_cn_once_object_6;
}

+ (id)containerEnabledDescription
{
  if (containerEnabledDescription_cn_once_token_5 != -1)
    dispatch_once(&containerEnabledDescription_cn_once_token_5, &__block_literal_global_54);
  return (id)containerEnabledDescription_cn_once_object_5;
}

+ (id)containerConstraintsPathDescription
{
  if (containerConstraintsPathDescription_cn_once_token_10 != -1)
    dispatch_once(&containerConstraintsPathDescription_cn_once_token_10, &__block_literal_global_64);
  return (id)containerConstraintsPathDescription_cn_once_object_10;
}

+ (id)containerAccountIdentifierDescription
{
  if (containerAccountIdentifierDescription_cn_once_token_4 != -1)
    dispatch_once(&containerAccountIdentifierDescription_cn_once_token_4, &__block_literal_global_52);
  return (id)containerAccountIdentifierDescription_cn_once_object_4;
}

void __81__CN_CNContainerPropertyDescription__containerExternalModificationTagDescription__block_invoke()
{
  CNContainerExternalModificationTagDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerExternalModificationTagDescription);
  v1 = (void *)containerExternalModificationTagDescription_cn_once_object_7;
  containerExternalModificationTagDescription_cn_once_object_7 = (uint64_t)v0;

}

void __77__CN_CNContainerPropertyDescription__containeriOSLegacyIdentifierDescription__block_invoke()
{
  CNContainerIOSLegacyIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerIOSLegacyIdentifierDescription);
  v1 = (void *)containeriOSLegacyIdentifierDescription_cn_once_object_3;
  containeriOSLegacyIdentifierDescription_cn_once_object_3 = (uint64_t)v0;

}

void __76__CN_CNContainerPropertyDescription__containerProviderIdentifierDescription__block_invoke()
{
  CNContainerProviderIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerProviderIdentifierDescription);
  v1 = (void *)containerProviderIdentifierDescription_cn_once_object_16;
  containerProviderIdentifierDescription_cn_once_object_16 = (uint64_t)v0;

}

void __76__CN_CNContainerPropertyDescription__containerGuardianStateDirtyDescription__block_invoke()
{
  CNContainerGuardianStateDirtyDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerGuardianStateDirtyDescription);
  v1 = (void *)containerGuardianStateDirtyDescription_cn_once_object_14;
  containerGuardianStateDirtyDescription_cn_once_object_14 = (uint64_t)v0;

}

void __76__CN_CNContainerPropertyDescription__containerGuardianRestrictedDescription__block_invoke()
{
  CNContainerGuardianRestrictedDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerGuardianRestrictedDescription);
  v1 = (void *)containerGuardianRestrictedDescription_cn_once_object_13;
  containerGuardianRestrictedDescription_cn_once_object_13 = (uint64_t)v0;

}

void __76__CN_CNContainerPropertyDescription__containerExternalIdentifierDescription__block_invoke()
{
  CNContainerExternalIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerExternalIdentifierDescription);
  v1 = (void *)containerExternalIdentifierDescription_cn_once_object_6;
  containerExternalIdentifierDescription_cn_once_object_6 = (uint64_t)v0;

}

void __75__CN_CNContainerPropertyDescription__containerAccountIdentifierDescription__block_invoke()
{
  CNContainerAccountIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerAccountIdentifierDescription);
  v1 = (void *)containerAccountIdentifierDescription_cn_once_object_4;
  containerAccountIdentifierDescription_cn_once_object_4 = (uint64_t)v0;

}

void __74__CN_CNContainerPropertyDescription__containerProviderMetadataDescription__block_invoke()
{
  CNContainerProviderMetadataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerProviderMetadataDescription);
  v1 = (void *)containerProviderMetadataDescription_cn_once_object_17;
  containerProviderMetadataDescription_cn_once_object_17 = (uint64_t)v0;

}

void __74__CN_CNContainerPropertyDescription__containerExternalSyncDataDescription__block_invoke()
{
  CNContainerExternalSyncDataDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerExternalSyncDataDescription);
  v1 = (void *)containerExternalSyncDataDescription_cn_once_object_9;
  containerExternalSyncDataDescription_cn_once_object_9 = (uint64_t)v0;

}

void __73__CN_CNContainerPropertyDescription__containerExternalSyncTagDescription__block_invoke()
{
  CNContainerExternalSyncTagDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerExternalSyncTagDescription);
  v1 = (void *)containerExternalSyncTagDescription_cn_once_object_8;
  containerExternalSyncTagDescription_cn_once_object_8 = (uint64_t)v0;

}

void __73__CN_CNContainerPropertyDescription__containerConstraintsPathDescription__block_invoke()
{
  CNContainerConstraintsPathDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerConstraintsPathDescription);
  v1 = (void *)containerConstraintsPathDescription_cn_once_object_10;
  containerConstraintsPathDescription_cn_once_object_10 = (uint64_t)v0;

}

void __70__CN_CNContainerPropertyDescription__containerRestrictionsDescription__block_invoke()
{
  CNContainerRestrictionsDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerRestrictionsDescription);
  v1 = (void *)containerRestrictionsDescription_cn_once_object_12;
  containerRestrictionsDescription_cn_once_object_12 = (uint64_t)v0;

}

void __70__CN_CNContainerPropertyDescription__containerMeIdentifierDescription__block_invoke()
{
  CNContainerMeIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerMeIdentifierDescription);
  v1 = (void *)containerMeIdentifierDescription_cn_once_object_11;
  containerMeIdentifierDescription_cn_once_object_11 = (uint64_t)v0;

}

void __70__CN_CNContainerPropertyDescription__containerLastSyncDateDescription__block_invoke()
{
  CNContainerLastSyncDateDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerLastSyncDateDescription);
  v1 = (void *)containerLastSyncDateDescription_cn_once_object_15;
  containerLastSyncDateDescription_cn_once_object_15 = (uint64_t)v0;

}

void __68__CN_CNContainerPropertyDescription__containerIdentifierDescription__block_invoke()
{
  CNContainerIdentifierDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerIdentifierDescription);
  v1 = (void *)containerIdentifierDescription_cn_once_object_0;
  containerIdentifierDescription_cn_once_object_0 = (uint64_t)v0;

}

void __65__CN_CNContainerPropertyDescription__containerEnabledDescription__block_invoke()
{
  CNContainerEnabledDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerEnabledDescription);
  v1 = (void *)containerEnabledDescription_cn_once_object_5;
  containerEnabledDescription_cn_once_object_5 = (uint64_t)v0;

}

void __62__CN_CNContainerPropertyDescription__containerTypeDescription__block_invoke()
{
  CNContainerTypeDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerTypeDescription);
  v1 = (void *)containerTypeDescription_cn_once_object_2;
  containerTypeDescription_cn_once_object_2 = (uint64_t)v0;

}

void __62__CN_CNContainerPropertyDescription__containerNameDescription__block_invoke()
{
  CNContainerNameDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNContainerNameDescription);
  v1 = (void *)containerNameDescription_cn_once_object_1;
  containerNameDescription_cn_once_object_1 = (uint64_t)v0;

}

void __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "writableContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_157_0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)writableSingleValueContactProperties_cn_once_object_17;
  writableSingleValueContactProperties_cn_once_object_17 = v2;

}

void __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "writableContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_158_0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)writableMultiValueContactProperties_cn_once_object_18;
  writableMultiValueContactProperties_cn_once_object_18 = v2;

}

void __52__CN_PropertyDescription__writableContactProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_156);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)writableContactProperties_cn_once_object_16;
  writableContactProperties_cn_once_object_16 = v2;

}

+ (unint64_t)indexOfPreferredContactsForUnifying:(id)a3 includingMainStoreContacts:(BOOL)a4
{
  return +[CNUnifiedContacts indexOfPreferredContactForUnifying:includingMainStoreContacts:]((uint64_t)CNUnifiedContacts, a3, a4);
}

+ (id)_unifyContacts:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_cn_arrayByRotatingRange:by:", 0, objc_msgSend(a1, "indexOfPreferredContactsForUnifying:includingMainStoreContacts:", v7, objc_msgSend(v6, "shouldIncludeMainStoreContacts"))+ 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUnifiedContacts _unifyContactsSortedByPreference:options:]((uint64_t)CNUnifiedContacts, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)writableSingleValueContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableSingleValueContactProperties_cn_once_token_17 != -1)
    dispatch_once(&writableSingleValueContactProperties_cn_once_token_17, block);
  return (id)writableSingleValueContactProperties_cn_once_object_17;
}

+ (id)writableMultiValueContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableMultiValueContactProperties_cn_once_token_18 != -1)
    dispatch_once(&writableMultiValueContactProperties_cn_once_token_18, block);
  return (id)writableMultiValueContactProperties_cn_once_object_18;
}

+ (id)writableContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CN_PropertyDescription__writableContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableContactProperties_cn_once_token_16 != -1)
    dispatch_once(&writableContactProperties_cn_once_token_16, block);
  return (id)writableContactProperties_cn_once_object_16;
}

+ (id)writableContainerProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableContainerProperties_cn_once_token_19 != -1)
    dispatch_once(&writableContainerProperties_cn_once_token_19, block);
  return (id)writableContainerProperties_cn_once_object_19;
}

void __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allContainerProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_83);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)writableContainerProperties_cn_once_object_19;
  writableContainerProperties_cn_once_object_19 = v2;

}

uint64_t __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWritable");
}

+ (id)mutableContactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CNContactUnificationOptions *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_opt_class();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      if (v9)
      {
        v9 = v9;
      }
      else
      {
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v10, "mutableCopy");

      }
    }
    else
    {
      v9 = objc_alloc_init(CNContactUnificationOptions);
      -[CNContactUnificationOptions setShouldIncludeMainStoreContacts:](v9, "setShouldIncludeMainStoreContacts:", v4);
      objc_msgSend(a1, "_unifyContacts:options:", v6, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrozenSelfAsSnapshot");
    }

  }
  return v7;
}

+ (id)contactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4 allowMutableContactFreeze:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CNContactUnificationOptions *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(CNContactUnificationOptions);
  -[CNContactUnificationOptions setShouldIncludeMainStoreContacts:](v9, "setShouldIncludeMainStoreContacts:", v6);
  -[CNContactUnificationOptions setShouldFreezeMutableContacts:](v9, "setShouldFreezeMutableContacts:", v5);
  objc_msgSend(a1, "contactUnifyingContacts:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4
{
  return +[CNUnifiedContacts unifyMultivalues:forProperty:]((uint64_t)CNUnifiedContacts, a3, a4);
}

+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4 options:(id)a5
{
  return +[CNUnifiedContacts unifyMultivalues:forProperty:options:]((uint64_t)CNUnifiedContacts, a3, a4, a5);
}

+ (id)unifyContactMatchInfos:(id)a3 linkedContacts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__8;
  v30 = __Block_byref_object_dispose__8;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke;
  v20[3] = &unk_1E29F8EF0;
  v8 = v5;
  v21 = v8;
  v22 = &v26;
  v23 = v24;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v9 = (id)v27[5];
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__8;
    v18 = __Block_byref_object_dispose__8;
    v19 = 0;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke_2;
    v13[3] = &unk_1E29F8F18;
    v13[4] = &v14;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
    v9 = (id)objc_msgSend((id)v27[5], "copy");
    objc_msgSend(v9, "setMatchedTerms:", v15[5]);
    _Block_object_dispose(&v14, 8);

  }
  v10 = v21;
  v11 = v9;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = (void *)a1[4];
  v10 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v9);
  if (objc_msgSend(v10, "isPreferredForName"))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    *a4 = 1;

}

void __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "matchedTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v11, "matchedTerms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v10);

  }
}

+ (id)identifierMapForUnifiedContact:(id)a3 backingContacts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  CNResultWithAutoreleasePool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __70__CN_UnifiedContacts__identifierMapForUnifiedContact_backingContacts___block_invoke(uint64_t a1)
{
  return +[CNUnifiedContacts identifierMapForUnifiedContact:backingContacts:]((uint64_t)CNUnifiedContacts, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

+ (id)identifierMapForUnifiedMultiValue:(id)a3 backingMultiValues:(id)a4 forProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  id v13;
  id v14;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  CNResultWithAutoreleasePool();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __88__CN_UnifiedContacts__identifierMapForUnifiedMultiValue_backingMultiValues_forProperty___block_invoke(void **a1)
{
  return +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:forProperty:]((uint64_t)CNUnifiedContacts, a1[4], a1[5], a1[6]);
}

+ (id)groupIdentifiersByLabeledValue:(id)a3 forProperty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D13AC8], "multiDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(v7, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __66__CN_UnifiedContacts__groupIdentifiersByLabeledValue_forProperty___block_invoke;
        v19[3] = &unk_1E29F8F68;
        v19[4] = v12;
        v20 = v6;
        objc_msgSend(v13, "_cn_filter:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
          objc_msgSend(v14, "lastObject");
        else
          objc_msgSend(v12, "labelValuePair");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:forKey:", v16, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v7;
}

uint64_t __66__CN_UnifiedContacts__groupIdentifiersByLabeledValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "labelValuePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = canUnifyLabeledValuePairs(v5, v4, *(void **)(a1 + 40));

  return v6;
}

+ (unint64_t)indexOfUnifiedIdentifier:(id)a3 onNonUnifiedMultiValue:(id)a4 withIdentifierMap:(id)a5
{
  return +[CNUnifiedContacts indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:]((uint64_t)CNUnifiedContacts, a3, a4, a5);
}

+ (void)addLinkedIdentifier:(id)a3 toLabeledValue:(id)a4
{
  +[CNUnifiedContacts addLinkedIdentifier:toLabeledValue:]((uint64_t)CNUnifiedContacts, a3, a4);
}

+ (id)squashableContactCardPropertyKeys
{
  if (squashableContactCardPropertyKeys_cn_once_token_3 != -1)
    dispatch_once(&squashableContactCardPropertyKeys_cn_once_token_3, &__block_literal_global_140);
  return (id)squashableContactCardPropertyKeys_cn_once_object_3;
}

void __60__CN_PropertyDescription__squashableContactCardPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[CN squashableContactCardProperties](CN, "squashableContactCardProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_143);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)squashableContactCardPropertyKeys_cn_once_object_3;
  squashableContactCardPropertyKeys_cn_once_object_3 = v2;

}

uint64_t __60__CN_PropertyDescription__squashableContactCardPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

+ (id)squashableContactCardProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CN_PropertyDescription__squashableContactCardProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (squashableContactCardProperties_cn_once_token_4 != -1)
    dispatch_once(&squashableContactCardProperties_cn_once_token_4, block);
  return (id)squashableContactCardProperties_cn_once_object_4;
}

void __58__CN_PropertyDescription__squashableContactCardProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  _QWORD v31[28];

  v31[26] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "namePrefixDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v30;
  objc_msgSend(*(id *)(a1 + 32), "givenNameDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v29;
  objc_msgSend(*(id *)(a1 + 32), "middleNameDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v28;
  objc_msgSend(*(id *)(a1 + 32), "familyNameDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v27;
  objc_msgSend(*(id *)(a1 + 32), "nameSuffixDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v26;
  objc_msgSend(*(id *)(a1 + 32), "previousFamilyNameDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v25;
  objc_msgSend(*(id *)(a1 + 32), "nicknameDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v24;
  objc_msgSend(*(id *)(a1 + 32), "phoneticGivenNameDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v23;
  objc_msgSend(*(id *)(a1 + 32), "phoneticMiddleNameDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v22;
  objc_msgSend(*(id *)(a1 + 32), "phoneticFamilyNameDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v21;
  objc_msgSend(*(id *)(a1 + 32), "phoneticOrganizationNameDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v20;
  objc_msgSend(*(id *)(a1 + 32), "addressingGrammarsDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v19;
  objc_msgSend(*(id *)(a1 + 32), "addressingGrammarsEncryptedDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v18;
  objc_msgSend(*(id *)(a1 + 32), "organizationNameDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v17;
  objc_msgSend(*(id *)(a1 + 32), "departmentDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v16;
  objc_msgSend(*(id *)(a1 + 32), "jobTitleDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[15] = v15;
  objc_msgSend(*(id *)(a1 + 32), "birthdayDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[16] = v14;
  objc_msgSend(*(id *)(a1 + 32), "nonGregorianBirthdayDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[17] = v2;
  objc_msgSend(*(id *)(a1 + 32), "phoneNumbersDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[18] = v3;
  objc_msgSend(*(id *)(a1 + 32), "emailAddressesDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[19] = v4;
  objc_msgSend(*(id *)(a1 + 32), "urlAddressesDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[20] = v5;
  objc_msgSend(*(id *)(a1 + 32), "datesDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[21] = v6;
  objc_msgSend(*(id *)(a1 + 32), "instantMessagAddressesDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[22] = v7;
  objc_msgSend(*(id *)(a1 + 32), "contactRelationsDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[23] = v8;
  objc_msgSend(*(id *)(a1 + 32), "socialProfilesDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[24] = v9;
  objc_msgSend(*(id *)(a1 + 32), "postalAddressesDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[25] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)squashableContactCardProperties_cn_once_object_4;
  squashableContactCardProperties_cn_once_object_4 = v12;

}

+ (id)allContactPropertyKeys
{
  if (allContactPropertyKeys_cn_once_token_5 != -1)
    dispatch_once(&allContactPropertyKeys_cn_once_token_5, &__block_literal_global_144);
  return (id)allContactPropertyKeys_cn_once_object_5;
}

void __49__CN_PropertyDescription__allContactPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[CN allContactProperties](CN, "allContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_145_0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)allContactPropertyKeys_cn_once_object_5;
  allContactPropertyKeys_cn_once_object_5 = v2;

}

uint64_t __49__CN_PropertyDescription__allContactPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

+ (id)singleValueContactProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CN_PropertyDescription__singleValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleValueContactProperties_cn_once_token_14 != -1)
    dispatch_once(&singleValueContactProperties_cn_once_token_14, block);
  return (id)singleValueContactProperties_cn_once_object_14;
}

void __55__CN_PropertyDescription__singleValueContactProperties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allContactProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_154_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)singleValueContactProperties_cn_once_object_14;
  singleValueContactProperties_cn_once_object_14 = v2;

}

uint64_t __55__CN_PropertyDescription__singleValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMultiValue") ^ 1;
}

+ (void)resetRestrictedPropertiesOnMutableContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "restrictedProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isKeyAvailable:", v11);

        if (v12)
          objc_msgSend(v10, "resetGuardianManagedValueOnContact:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

+ (NSArray)restrictedProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CN_PropertyDescription__restrictedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (restrictedProperties_cn_once_token_21 != -1)
    dispatch_once(&restrictedProperties_cn_once_token_21, block);
  return (NSArray *)(id)restrictedProperties_cn_once_object_21;
}

void __47__CN_PropertyDescription__restrictedProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "downtimeWhitelistDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "externalIdentifierDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "externalModificationTagDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(*(id *)(a1 + 32), "externalRepresentationDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(*(id *)(a1 + 32), "externalUUIDDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifierDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(*(id *)(a1 + 32), "preferredChannelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  objc_msgSend(*(id *)(a1 + 32), "externalImageURIDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)restrictedProperties_cn_once_object_21;
  restrictedProperties_cn_once_object_21 = v11;

}

+ (id)imageSyncFailedTimeDescription
{
  if (imageSyncFailedTimeDescription_cn_once_token_93 != -1)
    dispatch_once(&imageSyncFailedTimeDescription_cn_once_token_93, &__block_literal_global_304);
  return (id)imageSyncFailedTimeDescription_cn_once_object_93;
}

void __57__CN_PropertyDescription__imageSyncFailedTimeDescription__block_invoke()
{
  CNImageSyncFailedTimeDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNImageSyncFailedTimeDescription);
  v1 = (void *)imageSyncFailedTimeDescription_cn_once_object_93;
  imageSyncFailedTimeDescription_cn_once_object_93 = (uint64_t)v0;

}

+ (id)wallpaperSyncFailedTimeDescription
{
  if (wallpaperSyncFailedTimeDescription_cn_once_token_94 != -1)
    dispatch_once(&wallpaperSyncFailedTimeDescription_cn_once_token_94, &__block_literal_global_306);
  return (id)wallpaperSyncFailedTimeDescription_cn_once_object_94;
}

void __61__CN_PropertyDescription__wallpaperSyncFailedTimeDescription__block_invoke()
{
  CNWallpaperSyncFailedTimeDescription *v0;
  void *v1;

  v0 = objc_alloc_init(CNWallpaperSyncFailedTimeDescription);
  v1 = (void *)wallpaperSyncFailedTimeDescription_cn_once_object_94;
  wallpaperSyncFailedTimeDescription_cn_once_object_94 = (uint64_t)v0;

}

+ (id)nullTransform
{
  return &__block_literal_global_109;
}

+ (id)phoneNumberFromStringTransform
{
  return &__block_literal_global_1_5;
}

+ (id)phoneNumberToStringTransform
{
  return &__block_literal_global_3_11;
}

+ (id)socialProfileFromDictionaryTransform
{
  return &__block_literal_global_4_3;
}

+ (id)socialProfileToDictionaryTransform
{
  return &__block_literal_global_7_5;
}

+ (id)socialProfileToFoundationProfileTransform
{
  return &__block_literal_global_9_1;
}

+ (id)instantMessageAddressFromDictionaryTransform
{
  return &__block_literal_global_11_1;
}

+ (id)instantMessageAddressToDictionaryTransform
{
  return &__block_literal_global_14_1;
}

+ (id)postalAddressFromDictionaryTransform
{
  return &__block_literal_global_15_0;
}

+ (id)postalAddressToDictionaryTransform
{
  return &__block_literal_global_17_0;
}

+ (id)relatedContactFromStringTransform
{
  return &__block_literal_global_19_1;
}

+ (id)relatedContactToStringTransform
{
  return &__block_literal_global_21;
}

+ (id)dateComponentsFromDictionaryTransform
{
  return &__block_literal_global_22_1;
}

+ (id)dateComponentsToDictionaryTransform
{
  return 0;
}

+ (id)addressingGrammarFromStringTransform
{
  return &__block_literal_global_25_1;
}

+ (id)addressingGrammarToStringTransform
{
  return &__block_literal_global_28_0;
}

+ (id)addressingGrammarFromEncryptedStringTransform
{
  return &__block_literal_global_29_0;
}

+ (id)addressingGrammarToEncryptedStringTransform
{
  return &__block_literal_global_30_1;
}

+ (id)wallpaperFromDataTransform
{
  return &__block_literal_global_31_0;
}

+ (id)sensitiveContentConfigurationFromDataTransform
{
  return &__block_literal_global_34_1;
}

+ (BOOL)areValidKeyPaths:(id)a3 forObject:(id)a4 expectedClasses:(id)a5 allowNil:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v32;
  void *v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "count");
  if (v15 != objc_msgSend(v13, "count"))
    +[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:].cold.2();
  v16 = objc_msgSend(v11, "count");
  if (v16 != objc_msgSend(v14, "count"))
    +[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:].cold.1();
  v32 = a7;
  if (objc_msgSend(v11, "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
      objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      v22 = objc_msgSend(v19, "isSubclassOfClass:", objc_opt_class());
      objc_msgSend(v12, "valueForKey:", v18);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = v22 ^ 1;
      if (!v23)
        v25 = v21;
      if (v25 != 1 || (!v23 ? (v26 = 1) : (v26 = v22), (v26 & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0))
        objc_msgSend(v33, "addObject:", v18);

      ++v17;
    }
    while (v17 < objc_msgSend(v11, "count"));
  }
  v27 = objc_msgSend(v33, "count");
  v28 = v27;
  if (v32 && v27)
  {
    v34 = CFSTR("CNKeyPaths");
    v29 = (void *)objc_msgSend(v33, "copy");
    v35[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 301, v30);
    *v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v28 == 0;
}

+ (BOOL)areValidDayComponents:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t (**v8)(void *, _QWORD *, const __CFString *, uint64_t);
  void *v9;
  id v10;
  int v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id v22;
  int v23;
  id v24;
  int v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD aBlock[4];
  id v63;
  const __CFString *v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke;
  aBlock[3] = &unk_1E29FDD70;
  v7 = v5;
  v63 = v7;
  v8 = (uint64_t (**)(void *, _QWORD *, const __CFString *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(v4, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "addObject:", CFSTR("timeZone"));
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_2;
  v60[3] = &unk_1E29F9518;
  v10 = v4;
  v61 = v10;
  v11 = v8[2](v8, v60, CFSTR("month"), 1);
  if (v9)
    v12 = 0;
  else
    v12 = v11;
  v36 = v12;
  v58[0] = v6;
  v58[1] = 3221225472;
  v58[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_3;
  v58[3] = &unk_1E29F9518;
  v13 = v10;
  v59 = v13;
  v35 = v8[2](v8, v58, CFSTR("day"), 1);
  v56[0] = v6;
  v56[1] = 3221225472;
  v56[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_4;
  v56[3] = &unk_1E29F9518;
  v14 = v13;
  v57 = v14;
  v34 = v8[2](v8, v56, CFSTR("hour"), 0);
  v54[0] = v6;
  v54[1] = 3221225472;
  v54[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_5;
  v54[3] = &unk_1E29F9518;
  v15 = v14;
  v55 = v15;
  v33 = v8[2](v8, v54, CFSTR("minute"), 0);
  v52[0] = v6;
  v52[1] = 3221225472;
  v52[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_6;
  v52[3] = &unk_1E29F9518;
  v16 = v15;
  v53 = v16;
  v32 = v8[2](v8, v52, CFSTR("second"), 0);
  v50[0] = v6;
  v50[1] = 3221225472;
  v50[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_7;
  v50[3] = &unk_1E29F9518;
  v17 = v16;
  v51 = v17;
  v31 = v8[2](v8, v50, CFSTR("nanosecond"), 0);
  v48[0] = v6;
  v48[1] = 3221225472;
  v48[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_8;
  v48[3] = &unk_1E29F9518;
  v18 = v17;
  v49 = v18;
  v19 = v8[2](v8, v48, CFSTR("weekday"), 0);
  v46[0] = v6;
  v46[1] = 3221225472;
  v46[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_9;
  v46[3] = &unk_1E29F9518;
  v20 = v18;
  v47 = v20;
  LODWORD(v18) = v8[2](v8, v46, CFSTR("weekdayOrdinal"), 0);
  v44[0] = v6;
  v44[1] = 3221225472;
  v44[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_10;
  v44[3] = &unk_1E29F9518;
  v21 = v20;
  v45 = v21;
  LODWORD(v20) = v8[2](v8, v44, CFSTR("quarter"), 0);
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_11;
  v42[3] = &unk_1E29F9518;
  v22 = v21;
  v43 = v22;
  v23 = v8[2](v8, v42, CFSTR("weekOfMonth"), 0);
  v40[0] = v6;
  v40[1] = 3221225472;
  v40[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_12;
  v40[3] = &unk_1E29F9518;
  v24 = v22;
  v41 = v24;
  v25 = v8[2](v8, v40, CFSTR("weekOfYear"), 0);
  v38[0] = v6;
  v38[1] = 3221225472;
  v38[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_13;
  v38[3] = &unk_1E29F9518;
  v26 = v24;
  v39 = v26;
  v27 = v8[2](v8, v38, CFSTR("yearForWeekOfYear"), 0) & v25 & v23 & v20 & v18 & v19 & v31 & v32 & v33 & v34 & v35 & v36;
  if (a4 && (v27 & 1) == 0)
  {
    v64 = CFSTR("CNKeyPaths");
    v28 = (void *)objc_msgSend(v7, "copy");
    v65[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v29);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v7;
  uint64_t v8;

  v7 = a3;
  v8 = ((*(uint64_t (**)(uint64_t))(a2 + 16))(a2) == 0x7FFFFFFFFFFFFFFFLL) ^ a4;
  if ((v8 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  return v8;
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "month");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "day");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hour");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minute");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "second");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nanosecond");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "weekday");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "weekdayOrdinal");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "quarter");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "weekOfMonth");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "weekOfYear");
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "yearForWeekOfYear");
}

+ (BOOL)areValidGregorianDayComponents:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(v6, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v11 & 1) == 0)
  {
    if (a4)
    {
      v14 = CFSTR("CNKeyPaths");
      v15[0] = &unk_1E2A40728;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
LABEL_3:
    LOBYTE(a4) = objc_msgSend(a1, "areValidDayComponents:error:", v6, a4);
  }

  return (char)a4;
}

+ (BOOL)areValidNonGregorianDayComponents:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(v6, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if (!v11)
  {
    LOBYTE(a4) = objc_msgSend(a1, "areValidDayComponents:error:", v6, a4);
  }
  else
  {
LABEL_3:
    if (a4)
    {
      v14 = CFSTR("CNKeyPaths");
      v15[0] = &unk_1E2A40740;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

+ (BOOL)hasContactChineseJapaneseKoreanName:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = 0;
  if ((objc_msgSend(a1, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v4, 0, 0) & 1) == 0)
  {
    objc_msgSend(a1, "requiredPropertiesForNameScriptDetection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CN joinNonEmptyContactProperties:onContact:withDelimiter:](CN, "joinNonEmptyContactProperties:onContact:withDelimiter:", v6, v4, &stru_1E29FF900);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CNIsChineseJapaneseKoreanString();
  }

  return v5;
}

+ (BOOL)hasContactChineseJapaneseKoreanPhoneticName:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = 0;
  if ((objc_msgSend(a1, "isEmptyNameContact:phonetic:includingPrefixAndSuffix:", v4, 1, 0) & 1) == 0)
  {
    objc_msgSend(a1, "requiredPropertiesForPhoneticNameScriptDetection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CN joinNonEmptyContactProperties:onContact:withDelimiter:](CN, "joinNonEmptyContactProperties:onContact:withDelimiter:", v6, v4, &stru_1E29FF900);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = CNIsChineseJapaneseKoreanString();
  }

  return v5;
}

+ (id)requiredPropertiesForPhoneticNameScriptDetection
{
  if (requiredPropertiesForPhoneticNameScriptDetection_cn_once_token_1 != -1)
    dispatch_once(&requiredPropertiesForPhoneticNameScriptDetection_cn_once_token_1, &__block_literal_global_15_3);
  return (id)requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1;
}

void __78__CN_CNInternationalSupport__requiredPropertiesForPhoneticNameScriptDetection__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  +[CN phoneticGivenNameDescription](CN, "phoneticGivenNameDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN phoneticMiddleNameDescription](CN, "phoneticMiddleNameDescription", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  +[CN phoneticFamilyNameDescription](CN, "phoneticFamilyNameDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1;
  requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1 = v4;

}

+ (id)keyVectorForAllUsedKeysForInternationalSupport
{
  if (keyVectorForAllUsedKeysForInternationalSupport_cn_once_token_2 != -1)
    dispatch_once(&keyVectorForAllUsedKeysForInternationalSupport_cn_once_token_2, &__block_literal_global_16_2);
  return (id)keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2;
}

void __76__CN_CNInternationalSupport__keyVectorForAllUsedKeysForInternationalSupport__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("namePrefix");
  v4[1] = CFSTR("givenName");
  v4[2] = CFSTR("middleName");
  v4[3] = CFSTR("familyName");
  v4[4] = CFSTR("nameSuffix");
  v4[5] = CFSTR("phoneticGivenName");
  v4[6] = CFSTR("phoneticMiddleName");
  v4[7] = CFSTR("phoneticFamilyName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2;
  keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2 = v2;

}

+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[CN joinNonEmptyContactProperties:onContact:withDelimiter:](CN, "joinNonEmptyContactProperties:onContact:withDelimiter:", v6, v5, &stru_1E29FF900);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNNameDelimiterForString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CN joinNonEmptyContactProperties:onContact:withDelimiter:](CN, "joinNonEmptyContactProperties:onContact:withDelimiter:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

@implementation VCPFaceUtils

+ (id)imageCreationOptions
{
  if (+[VCPFaceUtils imageCreationOptions]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils imageCreationOptions]::onceToken, &__block_literal_global_15);
  return (id)+[VCPFaceUtils imageCreationOptions]::kImageCreationOptions;
}

void __36__VCPFaceUtils_imageCreationOptions__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CBD2B8];
  v3[0] = *MEMORY[0x1E0CBD2B0];
  v3[1] = v0;
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = *MEMORY[0x1E0CBD288];
  v4[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VCPFaceUtils imageCreationOptions]::kImageCreationOptions;
  +[VCPFaceUtils imageCreationOptions]::kImageCreationOptions = v1;

}

+ (id)phFacesFromVCPPhotosFaces:(id)a3 withFetchOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (!v14)
        {
          objc_msgSend(v12, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesWithLocalIdentifiers:options:", v7, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__VCPFaceUtils_phFacesFromVCPPhotosFaces_withFetchOptions___block_invoke;
    v20[3] = &unk_1E6B169B0;
    v18 = v17;
    v21 = v18;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __59__VCPFaceUtils_phFacesFromVCPPhotosFaces_withFetchOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)_vnFaceAttributeAgeToPHFaceAgeTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::onceToken, &__block_literal_global_287);
  return (id)+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap;
}

void __53__VCPFaceUtils__vnFaceAttributeAgeToPHFaceAgeTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE2C8];
  v4[0] = *MEMORY[0x1E0CEE2C0];
  v4[1] = v0;
  v5[0] = &unk_1E6B72770;
  v5[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE2B8];
  v4[2] = *MEMORY[0x1E0CEE2D8];
  v4[3] = v1;
  v5[2] = &unk_1E6B727A0;
  v5[3] = &unk_1E6B727B8;
  v4[4] = *MEMORY[0x1E0CEE2D0];
  v5[4] = &unk_1E6B727D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap = v2;

}

+ (unsigned)mad_PHValueFromVNAgeCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeAgeToPHFaceAgeTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeSexToPHFaceSexTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::onceToken, &__block_literal_global_293);
  return (id)+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap;
}

void __53__VCPFaceUtils__vnFaceAttributeSexToPHFaceSexTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE1B8];
  v3[0] = *MEMORY[0x1E0CEE098];
  v3[1] = v0;
  v4[0] = &unk_1E6B72770;
  v4[1] = &unk_1E6B72788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap = v1;

}

+ (unsigned)mad_PHValueFromVNSexCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeSexToPHFaceSexTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeEyesToPHEyesStateMap
{
  if (+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::onceToken, &__block_literal_global_294);
  return (id)+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap;
}

void __52__VCPFaceUtils__vnFaceAttributeEyesToPHEyesStateMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE2E0];
  v3[0] = *MEMORY[0x1E0CEE2E8];
  v3[1] = v0;
  v4[0] = &unk_1E6B72788;
  v4[1] = &unk_1E6B72770;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap = v1;

}

+ (unsigned)mad_PHValueFromVNEyesCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeEyesToPHEyesStateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeSmileToPHFaceSmileTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::onceToken, &__block_literal_global_295);
  return (id)+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap;
}

void __57__VCPFaceUtils__vnFaceAttributeSmileToPHFaceSmileTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE368];
  v3[0] = *MEMORY[0x1E0CEE370];
  v3[1] = v0;
  v4[0] = &unk_1E6B72788;
  v4[1] = &unk_1E6B72770;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap = v1;

}

+ (unsigned)mad_PHValueFromVNSmilingCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeSmileToPHFaceSmileTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeFacialHairToPHFacialHairTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::onceToken, &__block_literal_global_296);
  return (id)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap;
}

void __63__VCPFaceUtils__vnFaceAttributeFacialHairToPHFacialHairTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[12];
  _QWORD v9[13];

  v9[12] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE2F8];
  v8[0] = *MEMORY[0x1E0CEE2F0];
  v8[1] = v0;
  v9[0] = &unk_1E6B72788;
  v9[1] = &unk_1E6B727A0;
  v1 = *MEMORY[0x1E0CEE308];
  v8[2] = *MEMORY[0x1E0CEE300];
  v8[3] = v1;
  v9[2] = &unk_1E6B727D0;
  v9[3] = &unk_1E6B727B8;
  v2 = *MEMORY[0x1E0CEE118];
  v8[4] = *MEMORY[0x1E0CEE310];
  v8[5] = v2;
  v9[4] = &unk_1E6B72770;
  v9[5] = &unk_1E6B72788;
  v3 = *MEMORY[0x1E0CEE178];
  v8[6] = *MEMORY[0x1E0CEE208];
  v8[7] = v3;
  v9[6] = &unk_1E6B727A0;
  v9[7] = &unk_1E6B727E8;
  v4 = *MEMORY[0x1E0CEE148];
  v8[8] = *MEMORY[0x1E0CEE108];
  v8[9] = v4;
  v9[8] = &unk_1E6B72800;
  v9[9] = &unk_1E6B727D0;
  v5 = *MEMORY[0x1E0CEE158];
  v8[10] = *MEMORY[0x1E0CEE0E8];
  v8[11] = v5;
  v9[10] = &unk_1E6B72818;
  v9[11] = &unk_1E6B727B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap = v6;

}

+ (unsigned)mad_PHValueFromVNFaceHairCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeFacialHairToPHFacialHairTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeHairColorToPHFaceHairColorTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::onceToken, &__block_literal_global_300);
  return (id)+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap;
}

void __65__VCPFaceUtils__vnFaceAttributeHairColorToPHFaceHairColorTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE340];
  v5[0] = *MEMORY[0x1E0CEE338];
  v5[1] = v0;
  v6[0] = &unk_1E6B72770;
  v6[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE350];
  v5[2] = *MEMORY[0x1E0CEE348];
  v5[3] = v1;
  v6[2] = &unk_1E6B727A0;
  v6[3] = &unk_1E6B727D0;
  v2 = *MEMORY[0x1E0CEE360];
  v5[4] = *MEMORY[0x1E0CEE358];
  v5[5] = v2;
  v6[4] = &unk_1E6B727B8;
  v6[5] = &unk_1E6B72818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap = v3;

}

+ (unsigned)mad_PHValueFromVNHairColorCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeHairColorToPHFaceHairColorTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeGlassesToPHFaceGlassesTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::onceToken, &__block_literal_global_301);
  return (id)+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap;
}

void __61__VCPFaceUtils__vnFaceAttributeGlassesToPHFaceGlassesTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE330];
  v3[0] = *MEMORY[0x1E0CEE328];
  v3[1] = v0;
  v4[0] = &unk_1E6B72770;
  v4[1] = &unk_1E6B72788;
  v3[2] = *MEMORY[0x1E0CEE320];
  v4[2] = &unk_1E6B727A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap = v1;

}

+ (unsigned)mad_PHValueFromVNGlassesCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeGlassesToPHFaceGlassesTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeFacialHairToPHFaceExpressionType
{
  if (+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::onceToken, &__block_literal_global_302);
  return (id)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap;
}

void __64__VCPFaceUtils__vnFaceAttributeFacialHairToPHFaceExpressionType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE180];
  v5[0] = *MEMORY[0x1E0CEE200];
  v5[1] = v0;
  v6[0] = &unk_1E6B72770;
  v6[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE088];
  v5[2] = *MEMORY[0x1E0CEE140];
  v5[3] = v1;
  v6[2] = &unk_1E6B727A0;
  v6[3] = &unk_1E6B727D0;
  v2 = *MEMORY[0x1E0CEE1C0];
  v5[4] = *MEMORY[0x1E0CEE0C0];
  v5[5] = v2;
  v6[4] = &unk_1E6B727B8;
  v6[5] = &unk_1E6B72818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap = v3;

}

+ (unsigned)mad_PHValueFromVNExpressionCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeFacialHairToPHFaceExpressionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeHeadGearToPHFaceHeadGearType
{
  if (+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::onceToken, &__block_literal_global_303);
  return (id)+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap;
}

void __60__VCPFaceUtils__vnFaceAttributeHeadGearToPHFaceHeadGearType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE390];
  v4[0] = *MEMORY[0x1E0CEE0D8];
  v4[1] = v0;
  v5[0] = &unk_1E6B72770;
  v5[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE120];
  v4[2] = *MEMORY[0x1E0CEE150];
  v4[3] = v1;
  v5[2] = &unk_1E6B727A0;
  v5[3] = &unk_1E6B727D0;
  v4[4] = *MEMORY[0x1E0CEE0F0];
  v5[4] = &unk_1E6B727B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap = v2;

}

+ (unsigned)mad_PHValueFromVNHeadgearCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeHeadGearToPHFaceHeadGearType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeHairTypeToPHFaceHairType
{
  if (+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::onceToken, &__block_literal_global_304);
  return (id)+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap;
}

void __56__VCPFaceUtils__vnFaceAttributeHairTypeToPHFaceHairType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE0C8];
  v5[0] = *MEMORY[0x1E0CEE1C8];
  v5[1] = v0;
  v6[0] = &unk_1E6B72770;
  v6[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE168];
  v5[2] = *MEMORY[0x1E0CEE160];
  v5[3] = v1;
  v6[2] = &unk_1E6B727A0;
  v6[3] = &unk_1E6B727D0;
  v2 = *MEMORY[0x1E0CEE1E0];
  v5[4] = *MEMORY[0x1E0CEE0A0];
  v5[5] = v2;
  v6[4] = &unk_1E6B727B8;
  v6[5] = &unk_1E6B72818;
  v5[6] = *MEMORY[0x1E0CEE1A0];
  v5[7] = v5[0];
  v6[6] = &unk_1E6B727E8;
  v6[7] = &unk_1E6B72770;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap = v3;

}

+ (unsigned)mad_PHValueFromVNFaceHairCategoryV2Label:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeHairTypeToPHFaceHairType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributePoseToPHFacePoseType
{
  if (+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::onceToken, &__block_literal_global_305);
  return (id)+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap;
}

void __52__VCPFaceUtils__vnFaceAttributePoseToPHFacePoseType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE1E8];
  v4[0] = *MEMORY[0x1E0CEE170];
  v4[1] = v0;
  v5[0] = &unk_1E6B72770;
  v5[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE1F0];
  v4[2] = *MEMORY[0x1E0CEE110];
  v4[3] = v1;
  v5[2] = &unk_1E6B727A0;
  v5[3] = &unk_1E6B727D0;
  v4[4] = *MEMORY[0x1E0CEE078];
  v5[4] = &unk_1E6B727B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap = v2;

}

+ (unsigned)mad_PHValueFromVNPoseCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributePoseToPHFacePoseType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeSkintoneToPHFaceSkintoneType
{
  if (+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::onceToken, &__block_literal_global_306);
  return (id)+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap;
}

void __60__VCPFaceUtils__vnFaceAttributeSkintoneToPHFaceSkintoneType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE190];
  v5[0] = *MEMORY[0x1E0CEE2A0];
  v5[1] = v0;
  v6[0] = &unk_1E6B72770;
  v6[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE090];
  v5[2] = *MEMORY[0x1E0CEE070];
  v5[3] = v1;
  v6[2] = &unk_1E6B727A0;
  v6[3] = &unk_1E6B727D0;
  v2 = *MEMORY[0x1E0CEE138];
  v5[4] = *MEMORY[0x1E0CEE080];
  v5[5] = v2;
  v6[4] = &unk_1E6B727B8;
  v6[5] = &unk_1E6B72818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap = v3;

}

+ (unsigned)mad_PHValueFromVNSkintoneCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeSkintoneToPHFaceSkintoneType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceAttributeEthnicityToPHFaceEthnicityType
{
  if (+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::onceToken, &__block_literal_global_307);
  return (id)+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap;
}

void __62__VCPFaceUtils__vnFaceAttributeEthnicityToPHFaceEthnicityType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEE0D0];
  v4[0] = *MEMORY[0x1E0CEE210];
  v4[1] = v0;
  v5[0] = &unk_1E6B72770;
  v5[1] = &unk_1E6B72788;
  v1 = *MEMORY[0x1E0CEE0B0];
  v4[2] = *MEMORY[0x1E0CEE1B0];
  v4[3] = v1;
  v5[2] = &unk_1E6B727A0;
  v5[3] = &unk_1E6B727D0;
  v4[4] = *MEMORY[0x1E0CEE1D0];
  v5[4] = &unk_1E6B727B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap = v2;

}

+ (unsigned)mad_PHValueFromVNEthnicityCategoryLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;

  v4 = a3;
  objc_msgSend(a1, "_vnFaceAttributeEthnicityToPHFaceEthnicityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0;

  return v8;
}

+ (id)_vnFaceGazeDirectionToPHFaceGazeType
{
  if (+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::onceToken != -1)
    dispatch_once(&+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::onceToken, &__block_literal_global_308);
  return (id)+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap;
}

void __52__VCPFaceUtils__vnFaceGazeDirectionToPHFaceGazeType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6B72830;
  v2[1] = &unk_1E6B72848;
  v3[0] = &unk_1E6B727B8;
  v3[1] = &unk_1E6B72770;
  v2[2] = &unk_1E6B72860;
  v2[3] = &unk_1E6B72878;
  v3[2] = &unk_1E6B72788;
  v3[3] = &unk_1E6B727A0;
  v2[4] = &unk_1E6B72890;
  v2[5] = &unk_1E6B728A8;
  v3[4] = &unk_1E6B727D0;
  v3[5] = &unk_1E6B727B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap;
  +[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap = v0;

}

+ (id)mad_VNFaceGazeDirectionDescription:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return off_1E6B16A90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error VNFaceGazeDirection: %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mad_PHFaceGazeTypeDescription:(unsigned __int16)a3
{
  if ((a3 - 1) < 5)
    return off_1E6B16AC0[(__int16)(a3 - 1)];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error PHFaceGazeType: %d"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)mad_PHValueFromVNFaceGazeDirection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;

  objc_msgSend(a1, "_vnFaceGazeDirectionToPHFaceGazeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return v7;
}

+ (void)assignPropertiesOfVCPPhotosFace:(id)a3 toPHFaceChangeRequest:(id)a4
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
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "setSourceWidth:", objc_msgSend(v14, "sourceWidth"));
  objc_msgSend(v5, "setSourceHeight:", objc_msgSend(v14, "sourceHeight"));
  objc_msgSend(v5, "setDetectionType:", objc_msgSend(v14, "detectionType"));
  objc_msgSend(v14, "centerX");
  objc_msgSend(v5, "setCenterX:");
  objc_msgSend(v14, "centerY");
  objc_msgSend(v5, "setCenterY:");
  objc_msgSend(v14, "size");
  objc_msgSend(v5, "setSize:");
  objc_msgSend(v14, "bodyCenterX");
  objc_msgSend(v5, "setBodyCenterX:");
  objc_msgSend(v14, "bodyCenterY");
  objc_msgSend(v5, "setBodyCenterY:");
  objc_msgSend(v14, "bodyWidth");
  objc_msgSend(v5, "setBodyWidth:");
  objc_msgSend(v14, "bodyHeight");
  objc_msgSend(v5, "setBodyHeight:");
  objc_msgSend(v5, "setHasSmile:", objc_msgSend(v14, "hasSmile"));
  objc_msgSend(v14, "blurScore");
  objc_msgSend(v5, "setBlurScore:");
  objc_msgSend(v5, "setLeftEyeClosed:", objc_msgSend(v14, "isLeftEyeClosed"));
  objc_msgSend(v5, "setRightEyeClosed:", objc_msgSend(v14, "isRightEyeClosed"));
  objc_msgSend(v14, "poseYaw");
  objc_msgSend(v5, "setPoseYaw:");
  objc_msgSend(v5, "setFaceAlgorithmVersion:", objc_msgSend(v14, "algorithmVersion"));
  objc_msgSend(v5, "setQualityMeasure:", objc_msgSend(v14, "qualityMeasure"));
  objc_msgSend(v5, "setAgeType:", objc_msgSend(v14, "ageType"));
  objc_msgSend(v5, "setSexType:", objc_msgSend(v14, "sexType"));
  objc_msgSend(v5, "setEyesState:", objc_msgSend(v14, "eyesState"));
  objc_msgSend(v5, "setSmileType:", objc_msgSend(v14, "smileType"));
  objc_msgSend(v5, "setFacialHairType:", objc_msgSend(v14, "facialHairType"));
  objc_msgSend(v5, "setHairColorType:", objc_msgSend(v14, "hairColorType"));
  objc_msgSend(v5, "setGlassesType:", objc_msgSend(v14, "glassesType"));
  objc_msgSend(v5, "setFaceExpressionType:", objc_msgSend(v14, "expressionType"));
  objc_msgSend(v5, "setHeadgearType:", objc_msgSend(v14, "headgearType"));
  objc_msgSend(v5, "setHairType:", objc_msgSend(v14, "hairType"));
  objc_msgSend(v5, "setPoseType:", objc_msgSend(v14, "poseType"));
  objc_msgSend(v5, "setSkintoneType:", objc_msgSend(v14, "skintoneType"));
  objc_msgSend(v5, "setEthnicityType:", objc_msgSend(v14, "ethnicityType"));
  objc_msgSend(v14, "roll");
  objc_msgSend(v5, "setRoll:");
  objc_msgSend(v14, "quality");
  objc_msgSend(v5, "setQuality:");
  objc_msgSend(v5, "setGazeType:", objc_msgSend(v14, "gazeType"));
  objc_msgSend(v5, "setHasFaceMask:", objc_msgSend(v14, "hasFaceMask"));
  objc_msgSend(v14, "gazeCenterX");
  objc_msgSend(v5, "setGazeCenterX:");
  objc_msgSend(v14, "gazeCenterY");
  objc_msgSend(v5, "setGazeCenterY:");
  objc_msgSend(v14, "gazeRect");
  objc_msgSend(v5, "setGazeRect:");
  objc_msgSend(v14, "gazeAngle");
  objc_msgSend(v5, "setGazeAngle:");
  objc_msgSend(v14, "gazeConfidence");
  objc_msgSend(v5, "setGazeConfidence:");
  objc_msgSend(v5, "setHidden:", objc_msgSend(v14, "hidden"));
  objc_msgSend(v5, "setInTrash:", objc_msgSend(v14, "isInTrash"));
  objc_msgSend(v5, "setManual:", objc_msgSend(v14, "manual"));
  objc_msgSend(v14, "adjustmentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustmentVersion:", v6);

  objc_msgSend(v14, "groupingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupingIdentifier:", v7);

  objc_msgSend(v5, "setNameSource:", objc_msgSend(v14, "nameSource"));
  objc_msgSend(v5, "setClusterSequenceNumber:", objc_msgSend(v14, "clusterSequenceNumber"));
  objc_msgSend(v5, "setVuObservationID:", objc_msgSend(v14, "vuObservationID"));
  objc_msgSend(v14, "imageprintWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CD1568]);
    objc_msgSend(v14, "imageprintWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageprintWrapper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithFaceprintData:faceprintVersion:", v11, (int)objc_msgSend(v12, "version"));

    objc_msgSend(v5, "setFaceprint:", v13);
  }

}

+ (id)phFaceFromVCPPhotosFace:(id)a3 withFetchOptions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "localIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CD1520];
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchFacesWithLocalIdentifiers:options:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_firstLocallyAvailableResourceFromResources:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "vcp_isLocallyAvailable", (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)resourceForFaceProcessing:(id)a3 allowStreaming:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Choosing asset resource from preferred list: %@", buf, 0xCu);
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v12, "analysisType") == 2 || objc_msgSend(v12, "analysisType") == 1)
              objc_msgSend(v7, "addObject:", v12);
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v9);
      }

      if (!objc_msgSend(v7, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Network is available, filtering list to remove the CPL Thumb, new list is: %@", buf, 0xCu);
      }
      objc_msgSend(a1, "_firstLocallyAvailableResourceFromResources:", v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v22;
LABEL_24:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18);
            if (objc_msgSend(v19, "analysisType", (_QWORD)v21) == 1)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v16)
                goto LABEL_24;
              goto LABEL_30;
            }
          }
          v14 = v19;

          if (v14)
            goto LABEL_35;
        }
        else
        {
LABEL_30:

        }
        objc_msgSend(v15, "firstObject", (_QWORD)v21);
        v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "No resources locally available, returning a downloadable hi-res resource: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      objc_msgSend(a1, "_firstLocallyAvailableResourceFromResources:", v6);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)preferredResourcesForFaceProcessingWithAsset:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasAdjustments") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v17, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "vcp_isSyndicationLibrary") ^ 1;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", v17);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "pixelWidth"))
          {
            if (objc_msgSend(v11, "pixelHeight"))
            {
              if (objc_msgSend(v11, "type") != 13 && objc_msgSend(v11, "type") != 8)
              {
                objc_msgSend(v11, "vcp_uniformTypeIdentifier");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:](VCPImageManager, "canDecodeAcceleratedUniformTypeIdentifier:", v12);

                if (v13)
                {
                  if (objc_msgSend(v11, "type") == 1)
                    v14 = v4;
                  else
                    v14 = 1;
                  if (v14 == 1)
                    objc_msgSend(v5, "addObject:", v11);
                }
              }
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_descendingSizeComparator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingComparator:", v15);

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)resourceForFaceProcessingWithAsset:(id)a3 allowStreaming:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a1, "preferredResourcesForFaceProcessingWithAsset:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resourceForFaceProcessing:allowStreaming:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isBestResourceForFaceProcessing:(id)a3 fromResources:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_descendingSizeComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9 == v5 || objc_msgSend(v5, "analysisType") == 2 || objc_msgSend(v5, "analysisType") == 1;

  return v10;
}

+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andVisionRevision:(unint64_t)a5
{
  id v8;
  char v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  id v16;
  uint8_t buf[4];
  Class v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(a4);
  *a3 = v8;
  if (a5 < 0xDECAF000)
  {
    objc_msgSend(v8, "setRevision:", a5);
  }
  else
  {
    v16 = 0;
    v9 = objc_msgSend(v8, "setRevision:error:", a5, &v16);
    v10 = v16;
    v11 = v10;
    if ((v9 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = _os_feature_enabled_impl();
        *(_DWORD *)buf = 138412802;
        if (v13)
          v14 = 15;
        else
          v14 = 11;
        v18 = a4;
        v19 = 2112;
        v20 = v11;
        v21 = 1024;
        v22 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Face] Failed setting %@ private revision: %@, umbrellaVersion: %d", buf, 0x1Cu);
      }
      v12 = -50;
      goto LABEL_15;
    }

  }
  objc_msgSend(*a3, "setMetalContextPriority:", 1);
  objc_msgSend(*a3, "setPreferBackgroundProcessing:", 1);
  if (DeviceHasANE())
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a3, "setProcessingDevice:", v11);
    v12 = 0;
LABEL_15:

    return v12;
  }
  return 0;
}

+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andProcessingVersion:(int)a5
{
  uint64_t v8;

  v8 = VCPMAGetRevisionForVisionModel(a4, *(uint64_t *)&a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return -23807;
  else
    return objc_msgSend(a1, "configureVNRequest:withClass:andVisionRevision:", a3, a4, v8);
}

+ (CGRect)faceRectFromNormalizedCenterX:(double)a3 normalizedCenterY:(double)a4 normalizedSize:(double)a5 sourceWidth:(double)a6 sourceHeight:(double)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  if (a6 >= a7)
    v7 = a6;
  else
    v7 = a7;
  v8 = v7 * a5;
  v9 = v8 / a6;
  v10 = v8 / a7;
  v11 = a3 - v9 * 0.5;
  v12 = a4 - v8 / a7 * 0.5;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end

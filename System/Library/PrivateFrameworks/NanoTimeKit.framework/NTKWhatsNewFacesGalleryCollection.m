@implementation NTKWhatsNewFacesGalleryCollection

void __52__NTKWhatsNewFacesGalleryCollection_facesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "heroFacesForDevice:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

- (NTKWhatsNewFacesGalleryCollection)initWithDevice:(id)a3
{
  NTKWhatsNewFacesGalleryCollection *v3;
  NTKWhatsNewFacesGalleryCollection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWhatsNewFacesGalleryCollection;
  v3 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:](&v6, sel_initWithDevice_, a3);
  v4 = v3;
  if (v3)
    -[NTKGalleryCollection setCalloutName:](v3, "setCalloutName:", &__block_literal_global_68);
  return v4;
}

- (BOOL)hasNewFaces
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NTKDeviceSpecificFacesArrayGalleryCollection device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhatsNewFacesGalleryCollection facesForDevice:](self, "facesForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)facesForDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D5DDA3E7-8863-48E3-95C7-3C65C5E31718"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (!v5)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D0D02931-2190-4E71-B843-C73C4ADB3F27"));
    v18 = objc_msgSend(v3, "supportsCapability:", v17);

    if (v18)
    {
      objc_msgSend((id)objc_opt_class(), "_pride2020DefaultFacesForDevice:", v3);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
      v21 = objc_msgSend(v3, "supportsCapability:", v20);

      if (v21)
      {
        objc_msgSend((id)objc_opt_class(), "_spring2020DefaultFacesForDevice:", v3);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v3, "isRunningGraceOrLater"))
      {
        objc_msgSend((id)objc_opt_class(), "_graceDefaultFacesForDevice:", v3);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v3, "isRunningGloryFOrLater"))
        {
          objc_msgSend(v3, "nrDevice");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 && objc_msgSend(MEMORY[0x1E0C944B0], "NRProductVersionForNRDevice:", v23) <= 0x501FF)
          {
            v25 = objc_msgSend(MEMORY[0x1E0C944B0], "NRProductVersionForNRDevice:", v23);
            v26 = (void *)objc_opt_class();
            if (v25 <= 0x500FF)
              objc_msgSend(v26, "_legacyDefaultFacesForDevice:", v3);
            else
              objc_msgSend(v26, "_gloryBDefaultFacesForDevice:", v3);
            v24 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "_gloryEDefaultFacesForDevice:", v3);
            v24 = objc_claimAutoreleasedReturnValue();
          }
          v16 = (void *)v24;

          goto LABEL_21;
        }
        objc_msgSend((id)objc_opt_class(), "_gloryFDefaultFacesForDevice:", v3);
        v19 = objc_claimAutoreleasedReturnValue();
      }
    }
    v16 = (void *)v19;
    goto LABEL_21;
  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__NTKWhatsNewFacesGalleryCollection_facesForDevice___block_invoke;
  v31[3] = &unk_1E6BCE960;
  v32 = v3;
  v8 = v7;
  v33 = v8;
  objc_msgSend(v6, "enumerateFaceBundlesOnDevice:includingLegacy:withBlock:", v32, 1, v31);
  objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "face", (_QWORD)v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v9, "copy");
LABEL_21:

  return v16;
}

uint64_t __52__NTKWhatsNewFacesGalleryCollection_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_faceGalleryCalloutName");
}

- (id)title
{
  return NTKCompanionClockFaceLocalizedString(CFSTR("NTK_FACE_GALLERY_TITLE_NEW_FACES_COMPANION"), CFSTR("New Watch faces"));
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "deviceCategory") != 1)
  {
    if (objc_msgSend(v3, "collectionType") == 5)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "faceBundleForFaceStyle:onDevice:", 14, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "heroLegacyDefaultFacesForDevice:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "addObjectsFromArray:", v7);

    }
    if (NTKShowVictoryFaces(v3))
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "faceBundleForFaceStyle:onDevice:", 19, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "heroLegacyDefaultFacesForDevice:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
          objc_msgSend(v4, "addObjectsFromArray:", v10);

      }
    }
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "faceBundleForFaceStyle:onDevice:", 30, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "heroLegacyDefaultFacesForDevice:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
        objc_msgSend(v4, "addObjectsFromArray:", v13);

    }
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "faceBundleForFaceStyle:onDevice:", 29, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v15, "heroLegacyDefaultFacesForDevice:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
        objc_msgSend(v4, "addObjectsFromArray:", v16);

    }
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 23, v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 3, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectOption:forCustomEditMode:slot:", v18, 15, 0);

    +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", 13, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectOption:forCustomEditMode:slot:", v19, 12, 0);

    +[NTKCKaleidoscopeFacesGalleryCollection complicationTypesBySlot](NTKCKaleidoscopeFacesGalleryCollection, "complicationTypesBySlot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setFaceGalleryComplicationTypesForSlots:", v20);

    objc_msgSend(v4, "addObject:", v17);
  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "faceBundleForFaceStyle:onDevice:", 27, v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "heroLegacyDefaultFacesForDevice:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v23);

  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "faceBundleForFaceStyle:onDevice:", 32, v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "heroLegacyDefaultFacesForDevice:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v26);

  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "faceBundleForFaceStyle:onDevice:", 31, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "heroLegacyDefaultFacesForDevice:", v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v29);

  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "faceBundleForFaceStyle:onDevice:", 28, v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "heroLegacyDefaultFacesForDevice:", v3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v32);

  }
  return v4;
}

+ (id)_gloryBDefaultFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_legacyDefaultFacesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceBundleForFaceStyle:onDevice:", 3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "heroGloryBDefaultFacesForDevice:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "addObjectsFromArray:", v9);

  }
  return v5;
}

+ (id)_gloryEDefaultFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_gloryBDefaultFacesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceBundleForFaceStyle:onDevice:", 14, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "heroGloryEDefaultFacesForDevice:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_msgSend(v5, "copy", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v16, "faceStyle") == 14)
        {
          v17 = objc_msgSend(v5, "indexOfObject:", v16);
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v17, v18);

          objc_msgSend(v10, "removeObjectAtIndex:", 0);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v5;
}

+ (id)_gloryFDefaultFacesForDevice:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_gloryEDefaultFacesForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceBundleForFaceStyle:onDevice:", 26, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "heroGloryFDefaultFacesForDevice:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "addObjectsFromArray:", v9);
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceBundleForFaceStyle:onDevice:", 33, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "heroGloryFDefaultFacesForDevice:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v5, "addObjectsFromArray:", v12);

  return v5;
}

+ (id)_graceDefaultFacesForDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "deviceCategory");
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "faceBundleForFaceStyle:onDevice:", 37, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "heroGraceDefaultFacesForDevice:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v4, "addObjectsFromArray:", v9);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "faceBundleForFaceStyle:onDevice:", 38, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "heroGraceDefaultFacesForDevice:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "addObjectsFromArray:", v12);
  }
  else
  {
    objc_msgSend(v6, "faceBundleForFaceStyle:onDevice:", 42, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "heroGraceDefaultFacesForDevice:", v3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "addObjectsFromArray:", v14);
    v42 = v13;
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "faceBundleForFaceStyle:onDevice:", 14, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "heroGraceDefaultFacesForDevice:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "addObjectsFromArray:", v12);
    if (objc_msgSend(v3, "collectionType") == 6)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "faceBundleForFaceStyle:onDevice:", 35, v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "heroGraceDefaultFacesForDevice:", v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v4, "addObjectsFromArray:", v19);

    }
    v40 = v16;
    v41 = (void *)v14;
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 40, v3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:");
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "faceBundleForFaceStyle:onDevice:", 39, v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v21;
    objc_msgSend(v21, "heroGraceDefaultFacesForDevice:", v3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:");
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, v3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:");
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "faceBundleForFaceStyle:onDevice:", 36, v3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "heroGraceDefaultFacesForDevice:", v3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:");
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "faceBundleForFaceStyle:onDevice:", 41, v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "heroGraceDefaultFacesForDevice:", v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v4, "addObjectsFromArray:", v24);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "faceBundleForFaceStyle:onDevice:", 37, v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "heroGraceDefaultFacesForDevice:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v4, "addObjectsFromArray:", v27);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "faceBundleForFaceStyle:onDevice:", 38, v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "heroGraceDefaultFacesForDevice:", v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v4, "addObjectsFromArray:", v30);
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 38, v3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v31);

    v9 = v41;
    v8 = v42;
    v11 = v40;
  }

  return v4;
}

+ (id)whistlerSubdialsSpring2020ComplicationTypesBySlot
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("center");
  v4[0] = &unk_1E6CA9B68;
  v4[1] = &unk_1E6CA9B80;
  v3[2] = CFSTR("bottom");
  v4[2] = &unk_1E6CA9B98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v3;
  void *v4;
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
  void *v31;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "deviceCategory") != 1)
  {
    if (objc_msgSend(v3, "collectionType") == 5)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "faceBundleForFaceStyle:onDevice:", 14, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "heroSpring2020DefaultFacesForDevice:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "addObjectsFromArray:", v7);

    }
    if (objc_msgSend(v3, "collectionType") == 6)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "faceBundleForFaceStyle:onDevice:", 35, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "heroSpring2020DefaultFacesForDevice:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v4, "addObjectsFromArray:", v10);

    }
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 40, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKCBlackcombFacesGalleryCollection complicationTypesBySlot](NTKCBlackcombFacesGalleryCollection, "complicationTypesBySlot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setFaceGalleryComplicationTypesForSlots:", v12);

    objc_msgSend(v4, "addObject:", v11);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "faceBundleForFaceStyle:onDevice:", 39, v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v14;
    objc_msgSend(v14, "heroSpring2020DefaultFacesForDevice:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v15);
    +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 34, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWhatsNewFacesGalleryCollection whistlerSubdialsSpring2020ComplicationTypesBySlot](NTKWhatsNewFacesGalleryCollection, "whistlerSubdialsSpring2020ComplicationTypesBySlot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setFaceGalleryComplicationTypesForSlots:", v17);

    objc_msgSend(v4, "addObject:", v16);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "faceBundleForFaceStyle:onDevice:", 36, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "heroGraceDefaultFacesForDevice:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v20);
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "faceBundleForFaceStyle:onDevice:", 41, v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "heroSpring2020DefaultFacesForDevice:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v4, "addObjectsFromArray:", v23);

  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "faceBundleForFaceStyle:onDevice:", 37, v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "heroSpring2020DefaultFacesForDevice:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v4, "addObjectsFromArray:", v26);
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "faceBundleForFaceStyle:onDevice:", 38, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "heroSpring2020DefaultFacesForDevice:", v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v4, "addObjectsFromArray:", v29);

  return v4;
}

+ (id)_pride2020DefaultFacesForDevice:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceBundleForFaceStyle:onDevice:", 26, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "heroPride2020DefaultFacesForDevice:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObjectsFromArray:", v8);
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "faceBundleForFaceStyle:onDevice:", 33, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "heroPride2020DefaultFacesForDevice:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "addObjectsFromArray:", v11);
  objc_msgSend(a1, "_spring2020DefaultFacesForDevice:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  return v5;
}

@end

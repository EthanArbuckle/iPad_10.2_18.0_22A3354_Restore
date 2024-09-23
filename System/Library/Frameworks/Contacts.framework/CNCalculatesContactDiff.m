@implementation CNCalculatesContactDiff

+ (id)imageMetadataLog
{
  if (imageMetadataLog_cn_once_token_0 != -1)
    dispatch_once(&imageMetadataLog_cn_once_token_0, &__block_literal_global_33);
  return (id)imageMetadataLog_cn_once_object_0;
}

void __43__CNCalculatesContactDiff_imageMetadataLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "image-metadata");
  v1 = (void *)imageMetadataLog_cn_once_object_0;
  imageMetadataLog_cn_once_object_0 = (uint64_t)v0;

}

+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id *v43;
  id v44;
  void *v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  void *v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v47 = a5;
  if (v10 == v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = a6;
    v44 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    +[CN writableContactProperties](CN, "writableContactProperties");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v49;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v15);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v15), "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v10, "areKeysAvailable:", v18);

          if (!v11)
            goto LABEL_14;
        }
        else
        {
          v19 = 1;
          if (!v11)
          {
LABEL_14:
            v22 = 1;
            goto LABEL_15;
          }
        }
        objc_msgSend(v16, "key");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v11, "areKeysAvailable:", v21);

        if (v10 && v19 != v22)
        {
          if ((objc_msgSend(v47, "ignoreUnavailableKeys") & 1) == 0)
          {
            if (v22)
              v31 = v10;
            else
              v31 = v11;
            v32 = v31;
            v33 = v32;
            if (v43)
            {
              if (v32 == v10)
                v34 = v11;
              else
                v34 = v10;
              v53[1] = v34;
              v54[0] = CFSTR("CNInvalidRecords");
              v53[0] = v32;
              v35 = (void *)MEMORY[0x1E0C99D20];
              v36 = v34;
              objc_msgSend(v35, "arrayWithObjects:count:", v53, 2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v55[0] = v37;
              v54[1] = CFSTR("CNKeyPaths");
              objc_msgSend(v16, "key");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v55[1] = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1000, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              *v43 = v41;
            }

            v30 = 0;
            v26 = v45;
            goto LABEL_35;
          }
          goto LABEL_20;
        }
LABEL_15:
        if ((v19 & v22) == 1)
        {
          objc_msgSend(v47, "ignoredKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "key");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "containsObject:", v24);

          if ((v25 & 1) == 0)
          {
            if (objc_msgSend(v16, "isMultiValue"))
              objc_msgSend(v44, "addMultiValueUpdateTo:forProperty:contact1:contact2:", v45, v16, v10, v11);
            else
              objc_msgSend(v44, "addSingleValueUpdateTo:forProperty:contact1:contact2:", v45, v16, v10, v11);
          }
        }
LABEL_20:
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

    v26 = v45;
    objc_msgSend(v44, "cleanOrphanedCropUpdates:withContact1:contact2:", v45, v10, v11);
    objc_msgSend(v44, "clearWallpaperURIInUpdates:forContact:", v45, v11);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "featureFlags");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isFeatureEnabled:", 3);

    if (v29)
      objc_msgSend(v44, "clearBackgroundColorInUpdates:forContact:", v45, v11);
    v30 = v45;
LABEL_35:

  }
  return v30;
}

+ (void)addSingleValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "CNValueForContact:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CNValueForContact:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "isValue:equalToEmptyEquivalentOrValue:", v12, v13)
    || objc_msgSend(a1, "shouldSaveDuplicateProperty:value1:value2:", v10, v12, v13))
  {
    +[CNContactUpdate updateWithValue:property:](CNContactUpdate, "updateWithValue:property:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

  }
}

+ (BOOL)shouldSaveDuplicateProperty:(id)a3 value1:(id)a4 value2:(id)a5
{
  id v6;
  __CFString *v7;
  _BOOL4 v8;
  CGRect v10;

  v6 = a5;
  objc_msgSend(a3, "key");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 == CFSTR("cropRect"))
  {
    objc_msgSend(v6, "rectValue");
    v8 = !CGRectIsEmpty(v10);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (void)addMultiValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNMultiValueDiff diffMultiValue:toMultiValue:](CNMultiValueDiff, "diffMultiValue:toMultiValue:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEmpty") & 1) == 0)
  {
    +[CNContactUpdate updateMultiValueWithDiff:property:](CNContactUpdate, "updateMultiValueWithDiff:property:", v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v11, "isUnified");
    v20 = objc_msgSend(v12, "isUnified");
    if (v19)
    {
      v28 = v9;
      if ((v20 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A contact and its snapshot should both be unified."));
      v27 = v18;
      objc_msgSend(v18, "diff");
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updates");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v25++), "setIgnoreIdentifiers:", 1);
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v23);
      }

      v18 = v27;
      v9 = v28;
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A contact and its snapshot should both be non-unified."));
    }
    objc_msgSend(v9, "addObject:", v18);

  }
}

+ (void)cleanOrphanedCropUpdates:(id)a3 withContact1:(id)a4 contact2:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v16, "_cn_firstObjectPassingTest:", &__block_literal_global_15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_msgSend(v16, "_cn_any:", &__block_literal_global_16) & 1) == 0)
    {
      objc_msgSend(v9, "property");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "property");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CNValueForContact:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "property");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "CNValueForContact:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isValue:equalToEmptyEquivalentOrValue:", v12, v14);

      if (v15)
        objc_msgSend(v16, "removeObject:", v9);
    }
  }

}

BOOL __74__CNCalculatesContactDiff_cleanOrphanedCropUpdates_withContact1_contact2___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("cropRect");

  return v4;
}

BOOL __74__CNCalculatesContactDiff_cleanOrphanedCropUpdates_withContact1_contact2___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("imageData");

  return v4;
}

+ (void)clearWallpaperURIInUpdates:(id)a3 forContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", &__block_literal_global_17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && objc_msgSend(v5, "_cn_any:", &__block_literal_global_18))
  {
    +[CN wallpaperURIDescription](CN, "wallpaperURIDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactUpdate updateWithValue:property:](CNContactUpdate, "updateWithValue:property:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v9);
    objc_msgSend((id)objc_opt_class(), "imageMetadataLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Cleared wallpaper URI for contact identifier %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

BOOL __65__CNCalculatesContactDiff_clearWallpaperURIInUpdates_forContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("wallpaperURI");

  return v4;
}

BOOL __65__CNCalculatesContactDiff_clearWallpaperURIInUpdates_forContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  _BOOL8 v8;

  v2 = a2;
  objc_msgSend(v2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "key");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v4 == CFSTR("wallpaper") || v6 == CFSTR("wallpaperMetadata");

  return v8;
}

+ (void)clearBackgroundColorInUpdates:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_cn_firstObjectPassingTest:", &__block_literal_global_19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke_2;
    v13[3] = &__block_descriptor_40_e8_B16__0_8l;
    v13[4] = a1;
    if (objc_msgSend(v6, "_cn_any:", v13))
    {
      +[CN imageBackgroundColorsDataDescription](CN, "imageBackgroundColorsDataDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactUpdate updateWithValue:property:](CNContactUpdate, "updateWithValue:property:", 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v10);
      objc_msgSend((id)objc_opt_class(), "imageMetadataLog");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_DEFAULT, "Cleared image background colors for contact identifier %{public}@", buf, 0xCu);

      }
    }
  }

}

BOOL __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("imageBackgroundColorsData");

  return v4;
}

uint64_t __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "backgroundColorRelatedKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)backgroundColorRelatedKeys
{
  if (backgroundColorRelatedKeys_cn_once_token_3 != -1)
    dispatch_once(&backgroundColorRelatedKeys_cn_once_token_3, &__block_literal_global_20);
  return (id)backgroundColorRelatedKeys_cn_once_object_3;
}

void __53__CNCalculatesContactDiff_backgroundColorRelatedKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("imageType");
  v3[1] = CFSTR("imageData");
  v3[2] = CFSTR("thumbnailImageData");
  v3[3] = CFSTR("cropRect");
  v3[4] = CFSTR("wallpaper");
  v3[5] = CFSTR("wallpaperMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)backgroundColorRelatedKeys_cn_once_object_3;
  backgroundColorRelatedKeys_cn_once_object_3 = v1;

}

@end

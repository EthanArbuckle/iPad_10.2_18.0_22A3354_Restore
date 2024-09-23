@implementation AXImageCaptionModelAssetPolicy

+ (id)assertionForNewsestCompatibleImageCaptionModelAssetWithStage:(id)a3 language:(id)a4 clientIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  AXImageCaptionModelAssetAssertion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  -[AXImageCaptionModelAssetAssertion setAssertionType:](v10, "setAssertionType:", 1);
  -[AXImageCaptionModelAssetAssertion setClientIdentifier:](v10, "setClientIdentifier:", v7);

  -[AXImageCaptionModelAssetAssertion setModelStage:](v10, "setModelStage:", v9);
  -[AXImageCaptionModelAssetAssertion setModelLanguage:](v10, "setModelLanguage:", v8);

  return v10;
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.ImageCaptionModel.LaunchActivity");
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return 1;
}

+ (int64_t)minimumCompatibilityVersion
{
  void *v2;
  void *v3;
  NSObject *v4;
  int64_t v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideMinimumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.ImageCaptionModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    AXLogAssetLoader();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412802;
      v8 = CFSTR("com.apple.MobileAsset.ImageCaptionModel");
      v9 = 2048;
      v10 = 7;
      v11 = 2048;
      v12 = objc_msgSend(v3, "integerValue");
      _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_INFO, "Asset type [%@] default minimumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", (uint8_t *)&v7, 0x20u);
    }

    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v5 = 7;
  }

  return v5;
}

+ (int64_t)maximumCompatibilityVersion
{
  void *v2;
  void *v3;
  NSObject *v4;
  int64_t v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideMaximumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.ImageCaptionModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    AXLogAssetLoader();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412802;
      v8 = CFSTR("com.apple.MobileAsset.ImageCaptionModel");
      v9 = 2048;
      v10 = 9;
      v11 = 2048;
      v12 = objc_msgSend(v3, "integerValue");
      _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_INFO, "Asset type [%@] default maximumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", (uint8_t *)&v7, 0x20u);
    }

    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v5 = 9;
  }

  return v5;
}

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.ImageCaptionModel");
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id obj;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetPolicy assetType](self, "assetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v4;
  objc_msgSend(v4, "heldAssertionsForAssetType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v5;
  v46 = (void *)v6;
  +[AXImageCaptionModelAssetAssertion partitionAssertionsWithPropertyListRepresentations:intoVersionLockedAssertions:upgradableAssertions:](AXImageCaptionModelAssetAssertion, "partitionAssertionsWithPropertyListRepresentations:intoVersionLockedAssertions:upgradableAssertions:", v8, v5, v6);

  AXLogAssetLoader();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3F8E000, v9, OS_LOG_TYPE_INFO, "Will evaluate installed ImageCaptionModel assets for items to purge", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v11;
  -[AXImageCaptionModelAssetPolicy _partitionAssets:intoValidAssets:invalidAssets:](self, "_partitionAssets:intoValidAssets:invalidAssets:", v49, v10, v11);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v10;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v71 != v50)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v14 = v51;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        if (!v15)
        {

          continue;
        }
        v16 = v15;
        v54 = i;
        v17 = *(_QWORD *)v67;
        v56 = v13;
        v59 = *(_QWORD *)v67;
        v60 = v14;
        while (2)
        {
          v18 = 0;
          v61 = v16;
          do
          {
            if (*(_QWORD *)v67 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v18);
            objc_msgSend(v19, "modelVersion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "modelStage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "modelLanguage");
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            if (v20)
              v24 = v21 == 0;
            else
              v24 = 1;
            if (!v24 && v22 != 0)
            {
              objc_msgSend(v13, "imageCaptionModel");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stage");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v21, "isEqualToString:", v27))
                goto LABEL_25;
              objc_msgSend(v13, "imageCaptionModel");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "language");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v23, "isEqualToString:", v29))
              {

                v17 = v59;
                v14 = v60;
LABEL_25:

                v16 = v61;
                goto LABEL_26;
              }
              objc_msgSend(v13, "imageCaptionModel");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "version");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v20, "compare:options:", v30, 64);

              v13 = v56;
              v17 = v59;
              v14 = v60;
              v16 = v61;
              if (!v58)
              {
                AXLogAssetLoader();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v76 = v56;
                  v77 = 2112;
                  v78 = v19;
                  _os_log_impl(&dword_1D3F8E000, v31, OS_LOG_TYPE_INFO, "  WIll not purge asset [%@]. Protected by assertion: %@", buf, 0x16u);
                }

                objc_msgSend(v53, "addObject:", v56);
                goto LABEL_32;
              }
            }
LABEL_26:

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
          if (v16)
            continue;
          break;
        }

LABEL_32:
        i = v54;
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v52);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v33 = v46;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v63 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(obj, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "modelStage");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "modelLanguage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:](AXAsset, "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v39, v40, v41, 1, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          objc_msgSend(v53, "addObject:", v42);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v35);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "unionSet:", v47);
  objc_msgSend(v43, "unionSet:", obj);
  objc_msgSend(v43, "minusSet:", v53);
  objc_msgSend(v43, "allObjects");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
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
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[16];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  AXLogAssetLoader();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_INFO, "Will evaluate downloadable ImageCaptionModel assets for items to download", buf, 2u);
  }

  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetPolicy assetType](self, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  objc_msgSend(v5, "heldAssertionsForAssetType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)v6;
  v51 = (void *)v7;
  +[AXImageCaptionModelAssetAssertion partitionAssertionsWithPropertyListRepresentations:intoVersionLockedAssertions:upgradableAssertions:](AXImageCaptionModelAssetAssertion, "partitionAssertionsWithPropertyListRepresentations:intoVersionLockedAssertions:upgradableAssertions:", v9, v6, v7);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAsset downloadableAssets:](AXAsset, "downloadableAssets:", v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetPolicy _partitionAssets:intoValidAssets:invalidAssets:](self, "_partitionAssets:intoValidAssets:invalidAssets:", v11, v10, 0);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v10;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v75 != v55)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v14 = v56;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        if (v15)
        {
          v16 = v15;
          v58 = i;
          v17 = *(_QWORD *)v71;
          v60 = v13;
          v62 = *(_QWORD *)v71;
          v63 = v14;
          while (2)
          {
            v18 = 0;
            v64 = (id)v16;
            do
            {
              if (*(_QWORD *)v71 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v18);
              objc_msgSend(v19, "modelVersion");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "modelStage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "modelLanguage");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              if (v20)
                v24 = v21 == 0;
              else
                v24 = 1;
              if (!v24 && v22 != 0)
              {
                objc_msgSend(v13, "imageCaptionModel");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "stage");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v21, "isEqualToString:", v27) & 1) != 0)
                {
                  objc_msgSend(v13, "imageCaptionModel");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "language");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "isEqualToString:", v29))
                  {
                    objc_msgSend(v13, "imageCaptionModel");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "version");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v20, "compare:options:", v30, 64) == 0;

                    v13 = v60;
                  }
                  else
                  {
                    v31 = 0;
                  }

                  v17 = v62;
                  v14 = v63;
                  v16 = (uint64_t)v64;
                  if (v31)
                  {

                    objc_msgSend(v54, "addObject:", v13);
                    goto LABEL_30;
                  }
                }
                else
                {

                  v16 = (uint64_t)v64;
                }
              }

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
            if (v16)
              continue;
            break;
          }

LABEL_30:
          i = v58;
        }
        else
        {

        }
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    }
    while (v57);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v65 = v51;
  v32 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v67 != v34)
          objc_enumerationMutation(v65);
        v36 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(obj, "allObjects");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "modelStage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "modelLanguage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:](AXAsset, "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v37, v38, v39, 0, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v36, "modelStage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "modelLanguage");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:](AXAsset, "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v53, v41, v42, 1, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v43)
            goto LABEL_42;
          objc_msgSend(v40, "imageCaptionModel");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "version");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "imageCaptionModel");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "version");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v45, "compare:options:", v47, 64);

          if (v48 == 1)
LABEL_42:
            objc_msgSend(v54, "addObject:", v40);

        }
      }
      v33 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v33);
  }

  objc_msgSend(v54, "allObjects");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (void)_partitionAssets:(id)a3 intoValidAssets:(id)a4 invalidAssets:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  v8 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "imageCaptionModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v8;
        if (v14)
        {
          objc_msgSend(v14, "version");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v8;
          if (v16)
          {
            objc_msgSend(v14, "stage");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              objc_msgSend(v14, "language");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
                v15 = v20;
              else
                v15 = v8;
            }
            else
            {

              v15 = v8;
            }
          }
        }
        objc_msgSend(v15, "addObject:", v13);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

@end

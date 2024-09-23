@implementation PHImageResourceChooserBestPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  id *v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double v23;
  double v24;
  __CFString *v25;
  void *v26;
  int v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  int v34;
  id *v35;
  uint64_t v36;
  void *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  int v41;
  unsigned int v42;
  float v43;
  int v44;
  char v45;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  BOOL v51;
  int v52;
  char v53;
  void *v54;
  objc_super v55;

  v10 = (id *)a6;
  v14 = a3;
  v15 = a5;
  v55.receiver = a1;
  v55.super_class = (Class)&OBJC_METACLASS___PHImageResourceChooserBestPolicyHandler;
  v16 = objc_msgSendSuper2(&v55, sel_qualifyResourceInfo_againstPolicy_requestInfo_reversed_tooLargeForPolicy_disqualificationReason_, v14, a4, v15, v10, a7, a8);
  objc_msgSend(v15, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataStoreKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "behaviorSpec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v19, "loadingOptions");

  objc_msgSend(v15, "behaviorSpec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "version");

  objc_msgSend(v14, "store");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend((id)objc_opt_class(), "storeClassID");

  v23 = 0.0;
  if (v21 <= 1)
  {
    objc_msgSend(v15, "fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable");
    v23 = v24;
  }
  if (v16)
  {
    if ((v53 & 6) != 0 && v52 == 1)
    {
      v25 = CFSTR("failed loading mode test");
LABEL_7:
      v16 = 0;
      *a8 = v25;
      goto LABEL_11;
    }
    objc_msgSend(v14, "recipeID");
    if (PLResourceRecipeIsFullSizeDeferredProcessingPreview())
    {
      objc_msgSend(v15, "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (int)v10;
      v10 = a8;
      v28 = objc_msgSend(v26, "mediaType");

      v29 = v28 == 2;
      a8 = v10;
      LODWORD(v10) = v27;
      if (!v29)
      {
        v25 = CFSTR("failed deferred processing preview test");
        goto LABEL_7;
      }
    }
  }
LABEL_11:
  if (!objc_msgSend(v17, "isRAWPlusJPEG"))
  {
    if (v16)
      goto LABEL_21;
LABEL_59:
    v49 = 0;
    goto LABEL_67;
  }
  if (objc_msgSend(v14, "resourceType") || objc_msgSend(v14, "version"))
    v30 = 1;
  else
    v30 = objc_msgSend(v14, "isDerivative");
  v31 = objc_msgSend(v17, "originalResourceChoice");
  if (!v16)
    goto LABEL_59;
  if (v31 == 1 || v21 == 2)
  {
    if (v21 == 2)
      v44 = v30;
    else
      v44 = 1;
    if (v44 != 1)
    {
      v32 = CFSTR("r+j raw or derivatives");
      goto LABEL_66;
    }
    if (v31 == 1)
    {
      v45 = objc_msgSend(v14, "version") ? 1 : v30;
      if ((v45 & 1) == 0)
      {
        v32 = CFSTR("r+j ignore orig JPEG");
        goto LABEL_66;
      }
    }
  }
  else if (objc_msgSend(v14, "resourceType") == 4)
  {
    v32 = CFSTR("r+j alt image");
LABEL_66:
    v49 = 0;
    *a8 = v32;
    goto LABEL_67;
  }
LABEL_21:
  if (objc_msgSend(v14, "recipeID") == 65743
    && !v18
    && objc_msgSend(v17, "effectiveThumbnailIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = CFSTR("cpl thumb test");
    goto LABEL_66;
  }
  if (!(objc_msgSend(v14, "isHintBased") & 1 | (v18 != 0))
    && (objc_msgSend(v14, "canDownload") & 1) == 0
    && !objc_msgSend(v14, "locallyGeneratableOnDemand"))
  {
    v32 = CFSTR("failed local/generatable test");
    goto LABEL_66;
  }
  v51 = v18 != 0;
  if ((objc_msgSend(v14, "isHintBased") & 1) == 0 && (v53 & 1) != 0)
  {
    v54 = (void *)objc_opt_class();
    v33 = objc_msgSend(v14, "resourceType");
    v34 = (int)v10;
    v10 = (id *)objc_msgSend(v14, "recipeID");
    v35 = a8;
    v36 = objc_msgSend(v14, "version");
    objc_msgSend(v15, "loggingPrefix");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v10;
    LODWORD(v10) = v34;
    v39 = v36;
    a8 = v35;
    LOBYTE(v34) = objc_msgSend(v54, "_imageResourceIsUndecodableBasedOnResourceType:recipeID:version:asset:loggingPrefix:", v33, v38, v39, v17, v37);

    if ((v34 & 1) != 0)
    {
      v32 = CFSTR("failed undecodable test");
      goto LABEL_66;
    }
  }
  if (v52 == 3 && !objc_msgSend(v14, "recipeID"))
  {
    objc_msgSend(v15, "behaviorSpec");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isExplicitUserAction");

    if (!v41)
    {
      v32 = CFSTR("syndication originals test");
      goto LABEL_66;
    }
  }
  if (v21 < 2)
    v42 = v10 ^ 1;
  else
    v42 = 0;
  if (v42 == 1 && v23 > 0.0)
  {
    objc_msgSend(v14, "resourceScale");
    if (v23 > v43)
    {
      v32 = CFSTR("smaller than fallback scale");
      goto LABEL_66;
    }
  }
  objc_msgSend(v14, "resourceScale");
  v47 = v46;
  objc_msgSend(v15, "requestedScale");
  if (v47 >= v48)
  {
    v49 = 2;
    goto LABEL_67;
  }
  if (v23 > 0.0 && v51)
    v49 = 1;
  else
    v49 = 2;
  if ((v23 <= 0.0 || !v51) && ((v42 ^ 1) & 1) == 0)
  {
    if (a8)
    {
      v32 = CFSTR("too small");
      goto LABEL_66;
    }
    goto LABEL_59;
  }
LABEL_67:

  return v49;
}

+ (BOOL)_imageResourceIsUndecodableBasedOnResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 version:(unsigned int)a5 asset:(id)a6 loggingPrefix:(id)a7
{
  id v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__29015;
  v43 = __Block_byref_object_dispose__29016;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__29015;
  v37 = __Block_byref_object_dispose__29016;
  v38 = 0;
  objc_msgSend(v11, "managedObjectContextForFetchingResources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(a4 | a3 | a5))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke;
    v29[3] = &unk_1E35DE5F8;
    v14 = v29;
    v29[4] = v11;
    v30 = v13;
    v31 = &v39;
    v32 = &v33;
    objc_msgSend(v30, "performBlockAndWait:", v29);
    goto LABEL_7;
  }
  if (!a3 && a4 == 65938 && a5 == 2)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke_2;
    v25[3] = &unk_1E35DE5F8;
    v14 = v25;
    v25[4] = v11;
    v26 = v13;
    v27 = &v39;
    v28 = &v33;
    objc_msgSend(v26, "performBlockAndWait:", v25);
LABEL_7:

  }
  v15 = (void *)v40[5];
  if (v15)
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("CGImageProperties")))
    {
      v16 = v34[5];
      if (v16)
      {
        v24 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, &v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v24;
        v19 = v17 != 0;
        if (v17)
        {
          PLImageManagerGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = (unint64_t)v12;
            _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEBUG, "[RM]: %@ Checking image decodability based on media metadata", buf, 0xCu);
          }

          if (!CGImageIsDecodable())
          {
            v19 = 0;
            goto LABEL_23;
          }
          PLImageManagerGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v46 = (unint64_t)v12;
            v47 = 2048;
            v48 = a5;
            _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEBUG, "[RM]: %@ Metadata decode check failed (version: %ld)", buf, 0x16u);
          }
        }
        else
        {
          PLImageManagerGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v46 = a5;
            v47 = 2112;
            v48 = (unint64_t)v23;
            v49 = 2112;
            v50 = v18;
            _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Error serializing media metadata for resource version: %ld, asset: %@, error: %@", buf, 0x20u);

          }
        }

LABEL_23:
        goto LABEL_18;
      }
    }
  }
  v19 = 0;
LABEL_18:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19;
}

void __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:inManagedObjectContext:", v3, *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadataType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v13, "master");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:inManagedObjectContext:", v3, *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "additionalAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadataType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v13, "additionalAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

@end

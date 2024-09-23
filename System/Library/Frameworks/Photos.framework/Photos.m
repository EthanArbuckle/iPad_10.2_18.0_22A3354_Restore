uint64_t _FastValueHashForExpression(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v1 = a1;
  if (objc_msgSend(v1, "expressionType"))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "constantValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "hash");

    objc_msgSend(v1, "constantValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v1, "constantValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v2 += objc_msgSend(v7, "hash");

    }
    objc_msgSend(v1, "constantValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v1, "constantValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v2 += objc_msgSend(v11, "hash");

    }
  }

  return v2;
}

uint64_t _FastHashForPredicate(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v1, "subpredicates", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v2);
          v5 += _FastHashForPredicate(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v1;
    objc_msgSend(v8, "leftExpression");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v2, "expressionType");
    v11 = 100 * objc_msgSend(v9, "expressionType");
    v12 = objc_msgSend(v8, "comparisonPredicateModifier");
    v13 = objc_msgSend(v8, "predicateOperatorType");

    v14 = _FastValueHashForExpression(v2);
    v5 = v11 + 1000 * v10 + 10 * v12 + 10000 * v13 + v14 + _FastValueHashForExpression(v9) + 11110;

LABEL_14:
    goto LABEL_15;
  }
  v5 = objc_msgSend((id)objc_opt_class(), "hash");
LABEL_15:

  return v5;
}

id PHPredicateByCombiningPredicatesWithAnd_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    v12[0] = v4;
    v12[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4)
      v10 = v4;
    else
      v10 = v5;
    v9 = v10;
  }

  return v9;
}

id PHPredicateByCombiningPredicatesWithOr_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    v12[0] = v4;
    v12[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v4)
      v10 = v4;
    else
      v10 = v5;
    v9 = v10;
  }

  return v9;
}

void sub_1991F53E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1991F5788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991F8FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void ___presentResourcesFromHintsUntilStop_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, unsigned int a10, _BYTE *a11)
{
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PHResourceChooserListResourceInfo *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[4];
  id v28;
  _BYTE *v29;
  uint64_t v30;

  v16 = a6;
  v17 = a7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v17)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v17);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD *)(v18 + 40);
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(v18 + 48) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
  else
  {
    *(_QWORD *)(v18 + 40) = a2;
  }
  v20 = objc_msgSend(v17, "resourceType");
  v21 = objc_msgSend(v17, "resourceVersion");
  v22 = objc_msgSend(v17, "isDerivative");
  if (objc_msgSend((id)objc_opt_class(), "storeClassID") == 1)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  LOWORD(v26) = 0;
  LOWORD(v25) = 256;
  v23 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:]([PHResourceChooserListResourceInfo alloc], "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v20, a10, v21, 0, v22, a3, a4, v25, 0, v16, v17, v26);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___presentResourcesFromHintsUntilStop_block_invoke_2;
  aBlock[3] = &unk_1E35DB398;
  v29 = a11;
  v28 = *(id *)(a1 + 32);
  v30 = v19;
  v24 = _Block_copy(aBlock);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 16)
                                                                                    + 16))();
  if (!*a11)
    *a11 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();

}

void PHDecodeImageFromURLForRequest(void *a1, int a2, void *a3, void *a4, double a5, double a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PHImageDecoderOptions *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __objc2_class **v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint8_t v30[16];

  v11 = a1;
  v12 = a3;
  v13 = a4;
  if (objc_msgSend(v12, "isCancelled"))
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(v12, "behaviorSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displaySpec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(PHImageDecoderOptions);
    -[PHImageDecoderOptions setTargetSize:](v16, "setTargetSize:", a5, a6);
    -[PHImageDecoderOptions setContentMode:](v16, "setContentMode:", objc_msgSend(v15, "contentMode"));
    objc_msgSend(v15, "normalizedCropRect");
    -[PHImageDecoderOptions setNormalizedCropRect:](v16, "setNormalizedCropRect:");
    -[PHImageDecoderOptions setHighPriority:](v16, "setHighPriority:", ((unint64_t)objc_msgSend(v14, "loadingOptions") >> 4) & 1);
    -[PHImageDecoderOptions setOptimizeForDrawing:](v16, "setOptimizeForDrawing:", ((unint64_t)objc_msgSend(v14, "loadingOptions") >> 3) & 1);
    -[PHImageDecoderOptions setWaitUntilComplete:](v16, "setWaitUntilComplete:", objc_msgSend(v14, "isSynchronous"));
    -[PHImageDecoderOptions setResizeMode:](v16, "setResizeMode:", objc_msgSend(v14, "resizeMode"));
    -[PHImageDecoderOptions setShouldLoadGainMap:](v16, "setShouldLoadGainMap:", objc_msgSend(v14, "includeHDRGainMap"));
    -[PHImageDecoderOptions setDecodeAsHDR:](v16, "setDecodeAsHDR:", objc_msgSend(v14, "decodeAsHDR"));
    objc_msgSend(v14, "targetHDRHeadroom");
    *(float *)&v17 = v17;
    -[PHImageDecoderOptions setTargetHDRHeadroom:](v16, "setTargetHDRHeadroom:", v17);
    objc_msgSend(v12, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hdrGain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    -[PHImageDecoderOptions setHdrGain:](v16, "setHdrGain:");

    -[PHImageDecoderOptions setAllowFallbackDecoder:](v16, "setAllowFallbackDecoder:", (objc_msgSend(v14, "loadingOptions") & 0x20) == 0);
    if ((objc_msgSend(v14, "loadingOptions") & 0x40) != 0)
    {
      v20 = (void *)MEMORY[0x1E0D752F0];
      objc_msgSend(v11, "pathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "typeWithFilenameExtension:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC530]))
        -[PHImageDecoderOptions setPreferSWDecode:](v16, "setPreferSWDecode:", 1);

    }
    if ((objc_msgSend(v14, "useLowMemoryMode") & 1) != 0 || (objc_msgSend(v14, "loadingOptions") & 0x80) != 0)
      -[PHImageDecoderOptions setUseLowMemoryMode:](v16, "setUseLowMemoryMode:", 1);
    v23 = off_1E35D2BA8;
    if (!a2)
      v23 = off_1E35D2BE8;
    -[__objc2_class sharedDecoder](*v23, "sharedDecoder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "mediaSubtypes");

    if ((objc_msgSend(v14, "decodeAsHDR") & 1) != 0 || (v26 & 0x800000) != 0)
    {
      PLImageManagerGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_INFO, "[HDR] Using ImageIO decoder for HDR", v30, 2u);
      }

      +[PHImageIODecoder sharedDecoder](PHImageIODecoder, "sharedDecoder");
      v28 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v28;
    }
    objc_msgSend(v24, "decodeImageFromData:orFileURL:options:completion:", 0, v11, v16, v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSynchronous") & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 32);
      objc_storeStrong((id *)v12 + 17, v29);
      if (objc_msgSend(v12, "isCancelled"))
        objc_msgSend(v29, "cancel");
      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 32);
    }

  }
}

uint64_t ___presentResourcesFromHintsUntilStop_block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 48);
  **(_BYTE **)(result + 40) = 1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 0;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = v1;
  return result;
}

void sub_1991FD2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1991FD838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1991FF2D8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1991FF58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1991FF710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInPhotosHighlight_block_invoke_13(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInPhotosHighlight_block_invoke_13";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_199200488(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *_fetchTypeForAssetCollectionTypeAndSubtype(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  uint64_t v4;
  __CFString **v5;

  v3 = 0;
  v4 = a1 - 1;
  v5 = PHFetchTypeMoment;
  switch(v4)
  {
    case 0:
      v5 = PHFetchTypeAlbum;
      if (a2 == 101)
        v5 = PHFetchTypeCloudSharedAlbum;
      goto LABEL_13;
    case 1:
      v5 = PHFetchTypeSmartAlbum;
      goto LABEL_13;
    case 2:
      goto LABEL_13;
    case 3:
      v5 = PHFetchTypeMemory;
      goto LABEL_13;
    case 5:
      v5 = PHFetchTypePhotosHighlight;
      goto LABEL_13;
    case 6:
      v5 = &PHFetchTypeMomentShare;
      goto LABEL_13;
    case 7:
      v5 = &PHFetchTypeSuggestion;
      goto LABEL_13;
    case 8:
      v5 = PHFetchTypeImportSession;
      goto LABEL_13;
    case 9:
      v5 = PHFetchTypeProject;
      goto LABEL_13;
    case 10:
      v5 = &PHFetchTypeAssetCollection;
LABEL_13:
      v3 = *v5;
      break;
    default:
      return v3;
  }
  return v3;
}

id _predicateForAssetsInPhotosHighlightWithOptions(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "highlightCurationType");
  if (v6 == 2)
  {
    v10 = objc_msgSend(v3, "kind");
    v8 = 1;
    if (v10 < 3)
    {
      v9 = CFSTR("highlightBeingExtendedAssets = %@");
      goto LABEL_17;
    }
    if (v10 == 3)
    {
      v8 = 0;
      v9 = CFSTR("dayGroupHighlightBeingExtendedAssets = %@");
      goto LABEL_17;
    }
  }
  else if (v6 == 1)
  {
    v11 = objc_msgSend(v3, "kind");
    v8 = 1;
    if (v11 < 3)
    {
      v9 = CFSTR("highlightBeingSummaryAssets = %@");
      goto LABEL_17;
    }
    if (v11 == 3)
    {
      v9 = CFSTR("dayGroupHighlightBeingSummaryAssets = %@");
      goto LABEL_17;
    }
  }
  else
  {
    if (v6)
    {
      v12 = 0;
      v8 = 1;
      goto LABEL_19;
    }
    v7 = objc_msgSend(v3, "kind");
    v8 = 1;
    if (v7 < 3)
    {
      v9 = CFSTR("highlightBeingAssets = %@");
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if (v7 == 3)
    {
      v9 = CFSTR("dayGroupHighlightBeingAssets = %@");
      goto LABEL_17;
    }
  }
  v12 = 0;
LABEL_19:
  if (objc_msgSend(v3, "isSharingSuggestion"))
  {
    objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeSharedLibrarySharingSuggestionsAssets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_msgSend(v4, "sharingFilter");
    if (v14 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14)
      {
        v15 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludePrivateLibraryAssetsAllowingIndexingOnParticipationState:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = v13;
  if (v13)
  {
    if (v12)
    {
      v16 = (void *)MEMORY[0x1E0CB3528];
      v20[0] = v12;
      v20[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v18;
    }
    else
    {
      v15 = v13;
      v12 = v15;
    }
  }
LABEL_30:

  return v12;
}

void sub_1992025BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19920429C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199204480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1992052EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

id _buildCacheKey(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 > 0.0 && a3 > 0.0)
  {
    DCIM_NSStringFromCGSize();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v14);

  }
  if (a6 > 0.0 && a7 > 0.0)
  {
    DCIM_NSStringFromCGRect();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v15);

  }
  return v13;
}

id _figDecodeOptionsFromContext(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int Container;
  int v17;
  NSObject *v18;
  int ImageGeometryForIndex;
  int v20;
  NSObject *DictionaryRepresentation;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double x;
  double y;
  double width;
  double height;
  void *v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  CGAffineTransform v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  CFTypeRef cf;
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[7];
  _QWORD v99[7];
  _QWORD v100[5];
  _QWORD v101[5];
  _QWORD v102[8];
  _QWORD v103[8];
  uint8_t buf[16];
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v107 = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)MEMORY[0x1E0D09558];
  if (!*(_BYTE *)(a1 + 16) && (objc_msgSend(*(id *)(a1 + 48), "shouldCrop") & 1) == 0 && !*(_BYTE *)(a1 + 20))
  {
    v22 = *v6;
    v23 = MEMORY[0x1E0C9AAB0];
    if (*(uint64_t *)a1 < 1)
    {
      if ((a3 & 1) != 0)
      {
        v97[0] = MEMORY[0x1E0C9AAB0];
        v64 = *MEMORY[0x1E0D09580];
        v96[0] = v22;
        v96[1] = v64;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
        v65 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v65;
        v66 = *MEMORY[0x1E0D09560];
        if (*(_BYTE *)(a1 + 17))
          v67 = v23;
        else
          v67 = MEMORY[0x1E0C9AAA0];
        v97[1] = v65;
        v97[2] = v67;
        v68 = *MEMORY[0x1E0D09578];
        v96[2] = v66;
        v96[3] = v68;
        if (*(_BYTE *)(a1 + 21))
          v69 = v23;
        else
          v69 = MEMORY[0x1E0C9AAA0];
        v96[4] = *MEMORY[0x1E0D095A0];
        v97[3] = v69;
        v97[4] = v69;
        v31 = (void *)MEMORY[0x1E0C99D80];
        v32 = v97;
        v33 = v96;
        goto LABEL_75;
      }
      v99[0] = MEMORY[0x1E0C9AAB0];
      v82 = *MEMORY[0x1E0D09580];
      v98[0] = v22;
      v98[1] = v82;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v26;
      v98[2] = *MEMORY[0x1E0D09598];
      if (*(_QWORD *)(a1 + 8) == 2)
        v83 = 1;
      else
        v83 = 3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v83);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = *MEMORY[0x1E0D09548];
      v99[2] = v72;
      v99[3] = v23;
      v85 = *MEMORY[0x1E0D09560];
      v98[3] = v84;
      v98[4] = v85;
      v86 = MEMORY[0x1E0C9AAA0];
      if (*(_BYTE *)(a1 + 17))
        v87 = v23;
      else
        v87 = MEMORY[0x1E0C9AAA0];
      v88 = *MEMORY[0x1E0D09578];
      if (*(_BYTE *)(a1 + 21))
        v86 = v23;
      v99[4] = v87;
      v99[5] = v86;
      v89 = *MEMORY[0x1E0D095A0];
      v98[5] = v88;
      v98[6] = v89;
      v99[6] = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((a3 & 1) != 0)
      {
        v101[0] = MEMORY[0x1E0C9AAB0];
        v24 = *MEMORY[0x1E0D09580];
        v100[0] = v22;
        v100[1] = v24;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = *MEMORY[0x1E0D09560];
        if (*(_BYTE *)(a1 + 17))
          v28 = v23;
        else
          v28 = MEMORY[0x1E0C9AAA0];
        v101[1] = v25;
        v101[2] = v28;
        v29 = *MEMORY[0x1E0D09578];
        v100[2] = v27;
        v100[3] = v29;
        if (*(_BYTE *)(a1 + 21))
          v30 = v23;
        else
          v30 = MEMORY[0x1E0C9AAA0];
        v100[4] = *MEMORY[0x1E0D095A0];
        v101[3] = v30;
        v101[4] = v30;
        v31 = (void *)MEMORY[0x1E0C99D80];
        v32 = v101;
        v33 = v100;
LABEL_75:
        objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_96:

        return v8;
      }
      v103[0] = MEMORY[0x1E0C9AAB0];
      v70 = *MEMORY[0x1E0D09580];
      v102[0] = v22;
      v102[1] = v70;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v103[1] = v26;
      v102[2] = *MEMORY[0x1E0D09598];
      if (*(_QWORD *)(a1 + 8) == 2)
        v71 = 1;
      else
        v71 = 3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = *MEMORY[0x1E0D09548];
      v103[2] = v72;
      v103[3] = v23;
      v74 = *MEMORY[0x1E0D09560];
      v102[3] = v73;
      v102[4] = v74;
      v75 = MEMORY[0x1E0C9AAA0];
      if (*(_BYTE *)(a1 + 17))
        v76 = v23;
      else
        v76 = MEMORY[0x1E0C9AAA0];
      v103[4] = v76;
      v102[5] = *MEMORY[0x1E0D09568];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)a1);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = (void *)v77;
      v79 = *MEMORY[0x1E0D09578];
      if (*(_BYTE *)(a1 + 21))
        v80 = v23;
      else
        v80 = v75;
      v103[5] = v77;
      v103[6] = v80;
      v81 = *MEMORY[0x1E0D095A0];
      v102[6] = v79;
      v102[7] = v81;
      v103[7] = v80;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_96;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
  v8 = v7;
  if (*(_BYTE *)(a1 + 20))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E3656428, *MEMORY[0x1E0D09530]);
  if (*(_BYTE *)(a1 + 21))
  {
    v9 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09578]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D095A0]);
  }
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D09580]);

  if ((a3 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 8) == 2)
      v12 = 1;
    else
      v12 = 3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D09598]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09548]);
    if (*(uint64_t *)a1 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D09568]);

    }
    if (*(_BYTE *)(a1 + 16))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E3656440, *MEMORY[0x1E0D09570]);
  }
  if (*(_BYTE *)(a1 + 17))
    v15 = v10;
  else
    v15 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D09560]);
  if (objc_msgSend(*(id *)(a1 + 48), "shouldCrop"))
  {
    cf = 0;
    PFSharedFigDecodeSession();
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (Container)
    {
      v17 = Container;
      PLImageManagerGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - unable to generate crop rect, error opening container: %ld", buf, 0xCu);
      }

    }
    else
    {
      v93 = 0;
      v94 = 0;
      v92 = 1;
      ImageGeometryForIndex = CMPhotoDecompressionContainerGetImageGeometryForIndex();
      if (ImageGeometryForIndex)
      {
        v20 = ImageGeometryForIndex;
        PLImageManagerGetLog();
        DictionaryRepresentation = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(DictionaryRepresentation, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_1991EC000, DictionaryRepresentation, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - unable to generate crop rect, error determining source image geometry: %ld", buf, 0xCu);
        }
      }
      else
      {
        PLOrientationTransformImageSize();
        v35 = v34;
        v37 = v36;
        objc_msgSend(*(id *)(a1 + 48), "targetSize");
        v39 = v38;
        v41 = v40;
        objc_msgSend(*(id *)(a1 + 48), "normalizedCropRect");
        v46 = PHGenerateCropRectGivenNormalizedCropRect((unint64_t)v35, (unint64_t)v37, objc_msgSend(*(id *)(a1 + 48), "contentMode"), 0, v39, v41, v42, v43, v44, v45);
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v105 = 0u;
        v106 = 0u;
        *(_OWORD *)buf = 0u;
        PLOrientationMakeTransformWithSize();
        memset(&v91, 0, sizeof(v91));
        v108.origin.x = v46;
        v108.origin.y = v48;
        v108.size.width = v50;
        v108.size.height = v52;
        v109 = CGRectApplyAffineTransform(v108, &v91);
        x = v109.origin.x;
        y = v109.origin.y;
        width = v109.size.width;
        height = v109.size.height;
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D09570]);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v57)
        {
          v58 = ~(int)x + (int)v35 - (((~(int)x + (int)v35) & 0x80000001) == 1);
          v110.origin.x = x;
          v110.origin.y = y;
          v110.size.width = width;
          v110.size.height = height;
          if (((int)CGRectGetMinX(v110) & 0x80000001) == 1)
          {
            x = x + -1.0;
            if (width + 1.0 >= (double)v58)
              width = (double)v58;
            else
              width = width + 1.0;
            PLImageManagerGetLog();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_1991EC000, v59, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect min x along even bounds...", (uint8_t *)&v91, 2u);
            }

          }
          v111.origin.x = x;
          v111.origin.y = y;
          v111.size.width = width;
          v111.size.height = height;
          if (((int)CGRectGetMaxX(v111) & 0x80000001) == 1)
          {
            if (width + 1.0 >= (double)v58)
              width = (double)v58;
            else
              width = width + 1.0;
            PLImageManagerGetLog();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect max x along even bounds...", (uint8_t *)&v91, 2u);
            }

          }
          v61 = ~(int)y + (int)v37 - (((~(int)y + (int)v37) & 0x80000001) == 1);
          v112.origin.x = x;
          v112.origin.y = y;
          v112.size.width = width;
          v112.size.height = height;
          if (((int)CGRectGetMinY(v112) & 0x80000001) == 1)
          {
            y = y + -1.0;
            if (height + 1.0 >= (double)v61)
              height = (double)v61;
            else
              height = height + 1.0;
            PLImageManagerGetLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect min y along even bounds...", (uint8_t *)&v91, 2u);
            }

          }
          v113.origin.x = x;
          v113.origin.y = y;
          v113.size.width = width;
          v113.size.height = height;
          if (((int)CGRectGetMaxY(v113) & 0x80000001) == 1)
          {
            if (height + 1.0 >= (double)v61)
              height = (double)v61;
            else
              height = height + 1.0;
            PLImageManagerGetLog();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_1991EC000, v63, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect max y along even bounds...", (uint8_t *)&v91, 2u);
            }

          }
        }
        v114.origin.x = x;
        v114.origin.y = y;
        v114.size.width = width;
        v114.size.height = height;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v114);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09590]);
      }

      CFRelease(cf);
    }
  }
  return v8;
}

void sub_199209958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHErrorIsMediaServerDisconnected()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  PLUnderlyingErrorThatHasDomainAndCode();
  v0 = objc_claimAutoreleasedReturnValue();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  PLUnderlyingErrorWithDomain();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  v3 = PLErrorOrUnderlyingErrorMatchesCodesByDomain();

  return v3;
}

BOOL PHImageManagerRecordEnabled()
{
  BOOL v0;

  if (PHImageManagerRecordEnabled_onceToken != -1)
    dispatch_once(&PHImageManagerRecordEnabled_onceToken, &__block_literal_global_10);
  if (s_tracingDisabled)
    v0 = 1;
  else
    v0 = PHImageManagerRecordEnabled_s_enabled == 0;
  return !v0;
}

void PHDecodeImageFromStoreForRequest(void *a1, void *a2, int a3, void *a4, void *a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;
  CGImage *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a1;
  v13 = a2;
  v14 = a4;
  v15 = a5;
  if (objc_msgSend((id)objc_opt_class(), "storeClassID") == 1)
  {
    v16 = (CGImage *)objc_msgSend(v19, "newTableThumbImageForKey:", v13);
    (*((void (**)(id, CGImage *, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, v16, 0, 0, 0);

    CGImageRelease(v16);
  }
  else
  {
    objc_msgSend(v14, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLForAssetID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PHDecodeImageFromURLForRequest(v18, a3, v14, v15, a6, a7);

  }
}

void sub_19920B6FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void PHChooserListContinueEnumerating(void *a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v13[4];
  _QWORD *v14;
  char v15;

  v3 = a1;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHChooserListContinueEnumerating(PHResourceChooserList *__strong _Nonnull, PLResourceChooserListDataSource)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PHResourceChooserList.m"), 745, CFSTR("PLResourceChooserListDataSourceNone is not allowed when choosing begins."));

  }
  if (*((_BYTE *)v3 + 48) || !_presentResourcesFromHintsUntilStop(v3, a2))
  {
    if ((a2 & 2) == 0)
    {
      (*(void (**)(void))(v3[3] + 16))();
      goto LABEL_27;
    }
    v15 = 0;
    if (!*((_BYTE *)v3 + 96))
    {
      if (!v3[9])
        _fetchNonHintResources(v3);
      if (!v3[10])
      {
        v4 = (void *)v3[8];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __PHChooserListContinueEnumerating_block_invoke;
        v13[3] = &unk_1E35DF110;
        v14 = v3;
        objc_msgSend(v4, "performBlockAndWait:", v13);

      }
      while (1)
      {
        v5 = v3[11];
        v6 = v3[14];
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v7 = (void *)v3[10];
          if (v6 == 1)
          {
            v8 = 0;
            goto LABEL_19;
          }
          v8 = objc_msgSend(v7, "count") - 1;
          if ((v8 & 0x8000000000000000) != 0)
            goto LABEL_24;
        }
        else
        {
          v8 = v6 + v5;
          if (v6 + v5 < 0)
            goto LABEL_24;
        }
        v7 = (void *)v3[10];
LABEL_19:
        if (v8 >= objc_msgSend(v7, "count"))
        {
LABEL_24:
          *((_BYTE *)v3 + 96) = 1;
          break;
        }
        v12 = 0;
        v3[11] = v8;
        v9 = _presentFullResourceAtIndex(v3, v8, (uint64_t)&v12);
        if (v12)
          v3[11] = v5;
        if ((v9 & 1) != 0)
          goto LABEL_27;
      }
    }
    (*(void (**)(void))(v3[3] + 16))();
    if (v15)
    {
      PHChooserListMoveFirst((uint64_t)v3);
      v3[14] = -1;
      *((_BYTE *)v3 + 48) = 1;
      PHChooserListContinueEnumerating(v3, a2);
    }
  }
LABEL_27:

}

BOOL _presentResourcesFromHintsUntilStop(void *a1, char a2)
{
  id *v3;
  id *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id *v14;
  NSObject *v15;
  void *v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  if ((a2 & 1) == 0 || v3[7])
  {
    PLImageManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4[1], "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "[RM]: PHResourceChooserList: use of hints not allowed, asset uuid: %{public}@...", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v3[1], "unorientedSize");
    v6 = v5;
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0D71880];
    objc_msgSend(v4[1], "imageRequestHints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "libraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4[5];
    v13 = v4[1];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ___presentResourcesFromHintsUntilStop_block_invoke;
    v19[3] = &unk_1E35DB3C0;
    v21 = &v30;
    v14 = v4;
    v20 = v14;
    v22 = &v26;
    v23 = v24;
    objc_msgSend(v9, "enumerateImageRequestHintData:assetWidth:assetHeight:libraryID:startingOffset:assetID:block:", v10, (uint64_t)v6, (uint64_t)v8, v11, v12, v13, v19);

    if (!*((_BYTE *)v31 + 24))
      *((_BYTE *)v14 + 48) = 1;
  }
  v17 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

void sub_19920BB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void _decodeCallback(uint64_t a1, uint64_t a2, int a3, uint64_t a4, CGImage *a5, uint64_t a6)
{
  NSObject *v12;
  int AuxiliaryImageGeometryForIndex;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  CFTypeRef v22;
  void *v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  void (*v28)(void);
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a6)
    return;
  if (objc_msgSend(*(id *)(a6 + 80), "figRequestID") == a2)
  {
    if (a3 != -17105)
    {
      if (!a3)
      {
        *(_QWORD *)(a6 + 88) = CGImageRetain(a5);
        goto LABEL_25;
      }
      PLImageManagerGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a6 + 56);
        *(_DWORD *)buf = 138412546;
        v35 = v18;
        v36 = 1024;
        v37 = a3;
        v19 = "[RM] PHFigDecoder - failed async decode of image at url: %@, status code: %d";
LABEL_21:
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x12u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else if (objc_msgSend(*(id *)(a6 + 80), "figGainMapRequestID") == a2 && a3 != -17105)
  {
    if (a3)
    {
      *(_BYTE *)(a6 + 40) = 1;
      PLImageManagerGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a6 + 56);
        *(_DWORD *)buf = 138412546;
        v35 = v20;
        v36 = 1024;
        v37 = a3;
        v19 = "[RM] PHFigDecoder - failed async decode of gain map at url: %@, status code: %d";
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_25;
    }
    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - returned gain map, loading orientation", buf, 2u);
    }

    v33 = 1;
    AuxiliaryImageGeometryForIndex = CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex();
    if (AuxiliaryImageGeometryForIndex)
    {
      v14 = AuxiliaryImageGeometryForIndex;
      PLImageManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v14;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read aux image orientation, default to Up, %ld", buf, 0xCu);
      }

      v16 = 1;
    }
    else
    {
      v16 = v33;
    }
    v32 = 0;
    _figReadImageProperties(a1, &v32);
    v21 = v32;
    v22 = CFRetain(a5);
    *(_DWORD *)(a6 + 44) = v16;
    v23 = *(void **)(a6 + 104);
    *(_QWORD *)(a6 + 96) = v22;
    *(_QWORD *)(a6 + 104) = v21;

  }
LABEL_25:
  v24 = (unsigned int *)(a6 + 36);
  do
  {
    v25 = __ldaxr(v24);
    v26 = v25 + 1;
  }
  while (__stlxr(v26, v24));
  if (v26 == *(_DWORD *)(a6 + 32))
  {
    if (a3 != -17105)
    {
      if (!a3 && !*(_BYTE *)(a6 + 40) && *(_QWORD *)(a6 + 88))
      {
        v27 = *(_QWORD *)(a6 + 72);
        if (v27)
        {
          v28 = *(void (**)(void))(v27 + 16);
LABEL_38:
          v28();
          goto LABEL_39;
        }
        goto LABEL_39;
      }
      if (*(_BYTE *)(a6 + 19))
      {
        +[PHImageIODecoder sharedDecoder](PHImageIODecoder, "sharedDecoder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v29, "decodeImageFromData:orFileURL:options:existingRequestHandle:completion:", *(_QWORD *)(a6 + 64), *(_QWORD *)(a6 + 56), *(_QWORD *)(a6 + 48), *(_QWORD *)(a6 + 80), *(_QWORD *)(a6 + 72));

        goto LABEL_39;
      }
    }
    v31 = *(_QWORD *)(a6 + 72);
    if (v31)
    {
      v28 = *(void (**)(void))(v31 + 16);
      goto LABEL_38;
    }
LABEL_39:
    _cleanupContext(a6);
  }
}

void ___loadImageFromStoreAndKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = *(id **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v10[18], "setImageRef:", a2);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setIsDerivedFromDeferredPreview:", 1);
    if (a3)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setHighDynamicRangeGainMap:orientation:averagePixelLuminance:", a3, a4, v9);
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setDegraded:", 1);
      if (PHSignpostEventsEnabled_onceToken != -1)
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        v11 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v11;
          PLImageManagerGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(*(id *)(a1 + 32), "managerID");
          v15 = objc_msgSend(*(id *)(a1 + 32), "requestID");
          v16 = objc_msgSend(*(id *)(a1 + 32), "requestIndex");
          if (os_signpost_enabled(v13))
          {
            v17 = 30;
            if (*(_BYTE *)(a1 + 58))
              v17 = 31;
            *(_DWORD *)buf = 134218752;
            v29 = v14;
            v30 = 2048;
            v31 = v15;
            v32 = 2048;
            v33 = v16;
            v34 = 2048;
            v35 = v17;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
      }
    }
    else
    {
      if (PHSignpostEventsEnabled_onceToken != -1)
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
        if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v12 = v22;
          PLImageManagerGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(*(id *)(a1 + 32), "managerID");
          v24 = objc_msgSend(*(id *)(a1 + 32), "requestID");
          v25 = objc_msgSend(*(id *)(a1 + 32), "requestIndex");
          if (os_signpost_enabled(v13))
          {
            *(_DWORD *)buf = 134218752;
            v29 = v23;
            v30 = 2048;
            v31 = v24;
            v32 = 2048;
            v33 = v25;
            v34 = 2048;
            v35 = 32;
LABEL_26:
            _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_EVENT, v12, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
          }
LABEL_27:

        }
      }
    }
    if (*(_BYTE *)(a1 + 59))
    {
      v21 = *(id *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v21, "recipeIDForAssetID:", v26);

      if (!v27)
        objc_msgSend(*(id *)(a1 + 32), "recordMetricsWithMetricsHandler:", &__block_literal_global_154);
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend(v10, "isCancelled") & 1) == 0)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v19;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[RM]: %@ Failed to decode image", buf, 0xCu);

    }
    if (PHImageManagerRecordEnabled())
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "requestID");
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v20, CFSTR("[RM]: %@ Failed to decode image"), v21);
LABEL_31:

    }
  }
LABEL_32:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void _cleanupContext(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;

  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    v3 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v4 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v5 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v6 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    CGImageRelease(*(CGImageRef *)(a1 + 88));
    *(_QWORD *)(a1 + 88) = 0;
    v7 = *(const void **)(a1 + 96);
    if (v7)
      CFRelease(v7);
    v8 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 96) = 0;
    *(_QWORD *)(a1 + 104) = 0;

    free((void *)a1);
  }
}

void PHChooserListMoveFirst(uint64_t a1)
{
  void *v1;
  id v2;
  id *v3;

  *(_QWORD *)(a1 + 112) = 1;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_WORD *)(a1 + 48) = 0;
  v1 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  v3 = (id *)(id)a1;

  objc_msgSend(v3[13], "removeAllObjects");
  v2 = v3[10];
  v3[10] = 0;

  v3[11] = (id)0x7FFFFFFFFFFFFFFFLL;
  *((_BYTE *)v3 + 96) = 0;

}

void PHChooserListSetSortDescriptor(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id *v9;
  _QWORD v10[4];
  id *v11;

  v7 = a1;
  v3 = a2;
  if ((objc_msgSend(v7[7], "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong(v7 + 7, a2);
    v4 = MEMORY[0x1E0C809B0];
    if (v7[9])
    {
      v5 = v7[8];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __PHChooserListSetSortDescriptor_block_invoke;
      v10[3] = &unk_1E35DF110;
      v11 = v7;
      objc_msgSend(v5, "performBlockAndWait:", v10);

    }
    if (v7[10])
    {
      v6 = v7[8];
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __PHChooserListSetSortDescriptor_block_invoke_2;
      v8[3] = &unk_1E35DF110;
      v9 = v7;
      objc_msgSend(v6, "performBlockAndWait:", v8);

    }
  }

}

void _finishRequest(void *a1)
{
  id *v1;
  int *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  CGImage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = &OBJC_IVAR___PHPTPAnalyticsData__downloadedCount;
  if ((objc_msgSend(v1[29], "shouldLoadDataOrURL") & 1) == 0)
  {
    objc_msgSend(v1[18], "setExifOrientation:", 0);
    objc_msgSend(v1[18], "setUniformTypeIdentifier:", 0);
  }
  objc_msgSend(v1[18], "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isCancelled") & 1) != 0)
    goto LABEL_4;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v5 = objc_msgSend(v3, "code");

      if (v5 == 3072)
      {
LABEL_4:
        objc_msgSend(v1[18], "setCancelled:", 1);
        goto LABEL_26;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v1[18], "imageRef"))
    goto LABEL_26;
  objc_msgSend(v1, "behaviorSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "allowPlaceholder") & 1) == 0)
  {
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v1, "behaviorSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLoadImage");

  if (!v8)
    goto LABEL_26;
  objc_msgSend(MEMORY[0x1E0D719F0], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CGImage *)objc_msgSend(v9, "newPlaceholderImageWithSize:", 1.0, 1.0);

  if (!v10)
  {
    objc_msgSend(v1[18], "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_26;
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "identifierString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "%@ failed to generate placeholder", buf, 0xCu);

    }
    if (PHImageManagerRecordEnabled())
    {
      v21 = objc_msgSend(v1, "requestID");
      objc_msgSend(v1, "identifierString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v21, CFSTR("%@ failed to generate placeholder"), v22);

    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Error generating placeholder image");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[18], "setError:", v6);
    goto LABEL_25;
  }
  PLImageManagerGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v1, "identifierString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v12;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ delivering placeholder", buf, 0xCu);

  }
  if (PHImageManagerRecordEnabled())
  {
    v19 = objc_msgSend(v1, "requestID");
    objc_msgSend(v1, "identifierString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v19, CFSTR("[RM]: %@ delivering placeholder"), v20);

    v2 = &OBJC_IVAR___PHPTPAnalyticsData__downloadedCount;
  }
  objc_msgSend(*(id *)((char *)v1 + v2[116]), "setImageRef:", v10);
  CGImageRelease(v10);
  objc_msgSend(*(id *)((char *)v1 + v2[116]), "setIsPlaceholder:", 1);
LABEL_26:
  objc_msgSend(v1, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mediaRequest:didFinishWithResult:", v1, *(id *)((char *)v1 + v2[116]));

}

void ___chooserDidPresentLocallyAvailableBag_block_invoke(id *a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id *v28;
  id v29;
  uint64_t v30;
  os_signpost_id_t v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _BOOL4 v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  int v66;
  id v67;
  id v68;
  char v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  __int128 v101;
  uint64_t (*v102)(uint64_t);
  void *v103;
  id v104;
  __int128 v105;
  void (*v106)(uint64_t, int);
  void *v107;
  id *v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0 && !objc_msgSend(a1[4], "isCancelled"))
  {
    if (objc_msgSend((id)objc_opt_class(), "storeClassID") == 1)
    {
      *(_DWORD *)buf = 0;
      LODWORD(v93) = -1;
      v5 = a1[6];
      objc_msgSend(v5, "tableType:index:", buf, &v93);
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v99 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode table thumbnail with type: %ld, index: %ld"), *(unsigned int *)buf, (int)v93);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7003, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = a1[6];
      objc_msgSend(a1[4], "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURLForAssetID:", v11);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

      v15 = (void *)MEMORY[0x1E0CB35C8];
      if ((v14 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7001, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v97 = *MEMORY[0x1E0CB2938];
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Failed to decode because file does not exist at path: %@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "identifierString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v9, "code");
      objc_msgSend(v9, "debugDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v110 = (uint64_t)v21;
      v111 = 2112;
      v112 = v23;
      v113 = 2048;
      v114 = v24;
      v115 = 2112;
      v116 = (uint64_t)v25;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "[RM]: %@ failed to decode for asset: %@, error code: %ld, description: %@", buf, 0x2Au);

    }
    if (PHImageManagerRecordEnabled())
    {
      v77 = objc_msgSend(a1[4], "requestID");
      objc_msgSend(a1[4], "identifierString");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "asset");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "uuid");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v9, "code");
      objc_msgSend(v9, "debugDescription");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v77, CFSTR("[RM]: %@ failed to decode for asset: %@, error code: %ld, description: %@"), v78, v80, v81, v82);

    }
    v26 = a1[4];
    v27 = a1[7];
    v28 = (id *)v26;
    v29 = v9;
    if (PHSignpostEventsEnabled_onceToken != -1)
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      v30 = objc_msgSend(v28, "signpostID");
      if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v31 = v30;
        PLImageManagerGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v28, "managerID");
        v34 = objc_msgSend(v28, "requestID");
        v35 = objc_msgSend(v28, "requestIndex");
        if (os_signpost_enabled(v32))
        {
          *(_DWORD *)buf = 134218752;
          v110 = v33;
          v111 = 2048;
          v112 = (void *)v34;
          v113 = 2048;
          v114 = v35;
          v115 = 2048;
          v116 = 36;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v32, OS_SIGNPOST_EVENT, v31, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }

      }
    }
    v36 = v28[19];
    objc_msgSend(v28, "behaviorSpec");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "choosingPolicy");
    objc_msgSend(v29, "domain");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v39, "isEqualToString:", CFSTR("PHPhotosErrorDomain")))
      goto LABEL_26;
    v40 = objc_msgSend(v29, "code");

    if (v40 != 3303)
    {
      v41 = 0;
LABEL_29:
      objc_msgSend(v28[18], "setErrorIfNone:", v29);
      if (v38 == 3)
      {
        objc_msgSend(v36, "behaviorSpec");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (((objc_msgSend(v42, "onlyUseFetchedAssetPropertiesDuringChoosing") | v41) & 1) != 0)
          v43 = 0;
        else
          v43 = objc_msgSend(v37, "cannotReturnSmallerImage") ^ 1;

        if (objc_msgSend(v27, "keyIsHintBased") && (v43 & 1) != 0)
          goto LABEL_53;
        if ((MEMORY[0x19AEBDFF0]() & 1) != 0)
        {
          if (!v43)
            goto LABEL_74;
          goto LABEL_53;
        }
      }
      else
      {
        if ((MEMORY[0x19AEBDFF0](objc_msgSend(v27, "keyIsHintBased")) & 1) != 0)
          goto LABEL_74;
        LOBYTE(v43) = 0;
      }
      objc_msgSend(v27, "dataStoreKey");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "assetID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "validateForAssetID:resourceIdentity:", v45, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v46, "count"))
      {
        v91 = v37;
        v92 = v27;
        v88 = v43;
        v89 = v36;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v46, "count"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v48 = v46;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v94;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v94 != v51)
                objc_enumerationMutation(v48);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "code"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v53);

            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
          }
          while (v50);
        }

        objc_msgSend(v28, "asset");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "photoLibrary");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "asset");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectFetchingManagedObjectContextForObject:propertySet:", v56, CFSTR("PHAssetPropertySetCore"));
        v57 = objc_claimAutoreleasedReturnValue();

        v58 = (void *)MEMORY[0x1E0D71A68];
        objc_msgSend(v92, "dataStoreKey");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "dataStore");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "asset");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)v57;
        objc_msgSend(v58, "imageRequestResourceForDataStoreKey:store:assetObjectID:context:", v59, v60, v62, v57);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = v63 != 0;
        if (v63)
        {
          objc_msgSend(v28, "delegate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "mediaRequestCanRequestRepair:", v28);

          if (v66)
          {
            *(_QWORD *)&v105 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v105 + 1) = 3221225472;
            v106 = ___handleKeyUsageFailureDuringChoosing_block_invoke;
            v107 = &unk_1E35DC1B0;
            v108 = v28;
            v67 = (id)objc_msgSend(v108, "sendResourceRepairRequestForResource:errorCodes:reply:", v63, v47, &v105);
            v68 = v108;
            v69 = v88;
            v27 = v92;
LABEL_51:

            v36 = v89;
            v37 = v91;
            goto LABEL_61;
          }
          v64 = 0;
          v36 = v89;
          v37 = v91;
          v27 = v92;
        }
        else
        {
          PLImageManagerGetLog();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "identifierString");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v105) = 138412290;
            *(_QWORD *)((char *)&v105 + 4) = v73;
            _os_log_impl(&dword_1991EC000, v72, OS_LOG_TYPE_ERROR, "[RM]: %@ Unable to build resource repair request.", (uint8_t *)&v105, 0xCu);

          }
          v37 = v91;
          v27 = v92;
          if (PHImageManagerRecordEnabled())
          {
            v87 = objc_msgSend(v28, "requestID");
            objc_msgSend(v28, "identifierString");
            v68 = (id)objc_claimAutoreleasedReturnValue();
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v87, CFSTR("[RM]: %@ Unable to build resource repair request."), v68);
            v69 = v88;
            goto LABEL_51;
          }
          v64 = 0;
          v36 = v89;
        }
        v69 = v88;
LABEL_61:

        if ((v69 & 1) == 0)
        {
          if (v64 && !objc_msgSend(v28, "isSynchronous"))
            goto LABEL_75;
          goto LABEL_74;
        }
LABEL_62:
        if (objc_msgSend(v27, "keyIsHintBased"))
        {
          PLImageManagerGetLog();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "identifierString");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v101) = 138412290;
            *(_QWORD *)((char *)&v101 + 4) = v75;
            _os_log_impl(&dword_1991EC000, v74, OS_LOG_TYPE_DEBUG, "[RM]: %@ hint based key usage failed (hints may be stale), choosing without hints...", (uint8_t *)&v101, 0xCu);

          }
          if (PHImageManagerRecordEnabled())
          {
            v83 = v37;
            v84 = objc_msgSend(v28, "requestID");
            objc_msgSend(v28, "identifierString");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = v84;
            v37 = v83;
            +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v86, CFSTR("[RM]: %@ hint based key usage failed (hints may be stale), choosing without hints..."), v85);

          }
          objc_msgSend(v36, "setAllowHints:", 0);
        }
        else if (!objc_msgSend(v28, "isSynchronous"))
        {
          if (!v64)
          {
            objc_msgSend(v28, "imageDelegate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v101 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v101 + 1) = 3221225472;
            v102 = ___handleKeyUsageFailureDuringChoosing_block_invoke_168;
            v103 = &unk_1E35D66B8;
            v104 = v36;
            objc_msgSend(v76, "imageRequest:isRequestingScheduledWorkBlock:", v28, &v101);

          }
          goto LABEL_75;
        }
        objc_msgSend(v36, "presentNextQualifyingResource");
LABEL_75:

        return;
      }

      if ((v43 & 1) != 0)
      {
LABEL_53:
        LOBYTE(v64) = 0;
        goto LABEL_62;
      }
LABEL_74:
      _finishRequest(v28);
      goto LABEL_75;
    }
    objc_msgSend(v27, "dataStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)objc_opt_class(), "storeClassID"))
    {
      objc_msgSend(v27, "dataStoreKey");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "keyData");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = PLPrimaryDataStoreKeyStrategyFromData() == 4;

    }
    else
    {
LABEL_26:
      v41 = 0;
    }

    goto LABEL_29;
  }
  objc_msgSend(*((id *)a1[4] + 18), "clearError");
  if (objc_msgSend(a1[4], "wantsProgress"))
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCompletedUnitCount:", 1);
      objc_msgSend(a1[4], "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaRequest:didReportProgress:", a1[4], v3);

    }
  }
  _finishRequest(a1[4]);
}

void sub_19920FF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PHSanitizeNormalizedCropRect(char *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10;
  double v11;
  BOOL v12;
  char v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  BOOL v24;
  CGRect v25;

  v10 = *MEMORY[0x1E0C9D648];
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], v25)
    || (v11 = a2 + a4, a4 > 0.0)
    && a5 > 0.0
    && a2 >= 0.0
    && a3 >= 0.0
    && (v11 <= 1.0 ? (v12 = a3 + a5 <= 1.0) : (v12 = 0), v12))
  {
    v13 = 0;
    v10 = a2;
  }
  else
  {
    v15 = -a4;
    if (a4 >= 0.0)
    {
      v15 = a4;
      v11 = a2;
    }
    v16 = -a5;
    if (a5 >= 0.0)
      v17 = a3;
    else
      v17 = a3 + a5;
    if (a5 >= 0.0)
      v16 = a5;
    if (v11 >= 0.0)
      v18 = -0.0;
    else
      v18 = v11;
    v19 = v15 + v18;
    if (v11 >= 0.0)
      v20 = v11;
    else
      v20 = 0.0;
    if (v17 >= 0.0)
      v21 = v17;
    else
      v21 = 0.0;
    if (v17 >= 0.0)
      v17 = -0.0;
    v22 = v16 + v17;
    if (v20 + v19 > 1.0)
      v19 = 1.0 - v20;
    if (v21 + v22 > 1.0)
      v22 = 1.0 - v21;
    if (v19 > 0.0
      && (v22 > 0.0 ? (v23 = v20 + v19 <= 1.0) : (v23 = 0), v23 ? (v24 = v21 + v22 <= 1.0) : (v24 = 0), v24))
    {
      v13 = 1;
      v10 = v20;
    }
    else
    {
      v13 = 1;
    }
  }
  if (a1)
    *a1 = v13;
  return v10;
}

void sub_199211A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _objectIDForObject(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id newPhotoLibrary(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0D719A8], "newPhotoLibraryWithName:loadedFromBundle:options:error:", a1, v5, 0, &v12);
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "managedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addManagedObjectContext:", v9);
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "libraryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v14 = a1;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);

    }
  }

  return v7;
}

void __sReadUserDefaults_block_invoke()
{
  id v0;

  if (MEMORY[0x19AEBDEDC]())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    sIsLoggingDisabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.photos.performanceLogsDisabled"));
    sAreBacktracesEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.photos.performanceLogsEnableBacktraces"));

  }
}

void sub_199214048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199215D28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL PHIsExpressionMatchingTypeOrAggregateMatchingType(void *a1, char *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(v3, "expressionType");
  if (!v4)
  {
    v10 = 0;
    v7 = 1;
    if (!a2)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v4 != 14)
  {
    v10 = 0;
    v7 = 0;
    if (!a2)
      goto LABEL_16;
LABEL_15:
    *a2 = v10;
    goto LABEL_16;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "collection", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  v7 = v6 != 0;
  if (v6)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "expressionType"))
        {

          v7 = 0;
          goto LABEL_18;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

LABEL_18:
  v10 = 1;
  if (a2)
    goto LABEL_15;
LABEL_16:

  return v7;
}

void sub_19921654C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x199216538);
  }
  _Unwind_Resume(a1);
}

void PHChange.changeDetails<A>(for:)(uint64_t a1)
{
  void *v1;

  if (objc_msgSend(v1, sel_changeDetailsForObject_, a1))
  {
    objc_opt_self();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_1();
}

void PHChange.changeDetails<A>(for:)()
{
  void *v0;

  objc_opt_self();
  if (objc_msgSend(v0, sel_changeDetailsForFetchResult_, OUTLINED_FUNCTION_0()))
  {
    objc_opt_self();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_1();
}

void type metadata accessor for PHPhotosError(uint64_t a1)
{
  sub_199217184(a1, &qword_1EE34F4C0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_199217184(a1, (unint64_t *)&unk_1ECDF4F18);
}

uint64_t sub_199216CC0()
{
  sub_199217084(&qword_1EE34F4D8, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_1994496E0);
  return sub_199428100();
}

uint64_t sub_199216D00()
{
  sub_199217084(&qword_1EE34F4D8, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_1994496E0);
  return sub_1994280F4();
}

uint64_t sub_199216D44()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  return sub_199427F8C();
}

id sub_199216D84()
{
  id *v0;

  return *v0;
}

uint64_t sub_199216D8C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_199216D98()
{
  return sub_199428004();
}

uint64_t sub_199216DA8()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  return sub_199427FC8();
}

uint64_t sub_199216DE8()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  return sub_199427FA4();
}

uint64_t sub_199216E28(void *a1)
{
  id v2;

  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  v2 = a1;
  return sub_199427F98();
}

uint64_t sub_199216E8C()
{
  void **v0;

  return sub_199216E94(*v0);
}

uint64_t sub_199216E94(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_199428064();

  return v2;
}

uint64_t sub_199216EC4()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  return sub_199427FBC();
}

uint64_t sub_199216F14()
{
  sub_199428118();
  sub_199427FEC();
  return sub_199428124();
}

void sub_199216F70(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_199216FA0();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_199216FA8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_199216FD4()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
  return sub_199427FB0();
}

void sub_19921702C()
{
  sub_199217084(&qword_1EE34F4C8, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_1994495F8);
}

void sub_199217058()
{
  sub_199217084(&qword_1EE34F4D0, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449624);
}

void sub_199217084(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x19AEBF028](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1();
}

void sub_1992170C0()
{
  sub_199217084(&qword_1EE34F4D8, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_1994496E0);
}

void sub_1992170EC()
{
  sub_199217084(&qword_1EE34F4E0, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_1994496AC);
}

void sub_199217118()
{
  sub_199217084(&qword_1EE34F4E8, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449668);
}

void sub_199217144()
{
  sub_199217084(&qword_1EE34F4F0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1994497CC);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_199217184(a1, &qword_1EE34F518);
}

void sub_199217184(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_1992171C8()
{
  sub_199217084(&qword_1EE34F4F8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_199449790);
}

unint64_t sub_1992171F8()
{
  unint64_t result;

  result = qword_1EE34F500;
  if (!qword_1EE34F500)
  {
    result = MEMORY[0x19AEBF028](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EE34F500);
  }
  return result;
}

void sub_199217234()
{
  sub_199217084(&qword_1EE34F508, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_199449808);
}

void sub_199217260()
{
  sub_199217084((unint64_t *)&qword_1EE34F510, (uint64_t (*)(uint64_t))type metadata accessor for PHPhotosError, (uint64_t)&unk_199449724);
}

BOOL sub_19921728C(uint64_t *a1, uint64_t *a2)
{
  return sub_199217298(*a1, *a2);
}

BOOL sub_199217298(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_dynamicCastObjCClassUnconditional();
}

void PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)sub_199428034();
  v2 = objc_msgSend(v0, sel_cloudIdentifierMappingsForLocalIdentifiers_, v1);

  OUTLINED_FUNCTION_1_0(v3, &qword_1EE34F520);
  v4 = sub_199427FE0();

  sub_1992179D8(v4);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
}

void PHPhotoLibrary.localIdentifierMappings(for:)(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0(a1, &qword_1EE34F528);
  v2 = (void *)sub_199428034();
  v3 = objc_msgSend(v1, sel_localIdentifierMappingsForCloudIdentifiers_, v2);

  OUTLINED_FUNCTION_1_0(v4, &qword_1EE34F530);
  sub_199217CAC();
  v5 = sub_199427FE0();

  if ((v5 & 0xC000000000000001) != 0)
    sub_199217708();
  else
    sub_199217CFC(v5);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_199217438(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F548);
  v2 = sub_1994280D0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_199218360(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_199217560(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1992183A8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_199217560(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_199428118();
  sub_199428010();
  v4 = sub_199428124();
  return sub_1992175C4(a1, a2, v4);
}

unint64_t sub_1992175C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1994280E8() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1994280E8() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1994280E8() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_199217708()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  if (sub_199428094())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F540);
    v0 = sub_1994280D0();
  }
  else
  {
    v0 = MEMORY[0x1E0DEE9E0];
  }
  v24 = v0;
  sub_199428088();
  swift_unknownObjectRetain();
  v1 = sub_1994280A0();
  if (v1)
  {
    v3 = (void *)v1;
    v4 = v2;
    sub_199217C74(0, &qword_1EE34F528);
    while (1)
    {
      swift_dynamicCast();
      v22 = v4;
      sub_199217C74(0, &qword_1EE34F530);
      swift_dynamicCast();
      v5 = (id)sub_1992182C0(v3);
      v7 = v6;
      if (v6 || (v5 = objc_msgSend(v3, sel_error)) != 0)
      {
        v8 = v5;
      }
      else
      {
        type metadata accessor for PHPhotosError(0);
        sub_199217438(MEMORY[0x1E0DEE9D8]);
        sub_199218320();
        sub_199427FD4();
        v8 = v22;
      }

      v0 = v24;
      v9 = *(_QWORD *)(v24 + 16);
      if (*(_QWORD *)(v24 + 24) <= v9)
      {
        sub_199217FB8(v9 + 1, 1);
        v0 = v24;
      }
      result = sub_199428058();
      v11 = v0 + 64;
      v12 = -1 << *(_BYTE *)(v0 + 32);
      v13 = result & ~v12;
      v14 = v13 >> 6;
      if (((-1 << v13) & ~*(_QWORD *)(v0 + 64 + 8 * (v13 >> 6))) == 0)
        break;
      v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v0 + 64 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
LABEL_20:
      *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v0 + 48) + 8 * v15) = v23;
      v20 = *(_QWORD *)(v0 + 56) + 24 * v15;
      *(_QWORD *)v20 = v8;
      *(_QWORD *)(v20 + 8) = v7;
      *(_BYTE *)(v20 + 16) = v7 == 0;
      ++*(_QWORD *)(v0 + 16);
      v3 = (void *)sub_1994280A0();
      v4 = v21;
      if (!v3)
        goto LABEL_23;
    }
    v16 = 0;
    v17 = (unint64_t)(63 - v12) >> 6;
    while (++v14 != v17 || (v16 & 1) == 0)
    {
      v18 = v14 == v17;
      if (v14 == v17)
        v14 = 0;
      v16 |= v18;
      v19 = *(_QWORD *)(v11 + 8 * v14);
      if (v19 != -1)
      {
        v15 = __clz(__rbit64(~v19)) + (v14 << 6);
        goto LABEL_20;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_release();
    return v0;
  }
  return result;
}

void sub_1992179D8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F558);
  v2 = sub_1994280B8();
  v3 = (_QWORD *)v2;
  v4 = 0;
  v30 = a1;
  v5 = *(_QWORD *)(a1 + 64);
  v27 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & v5;
  v28 = (unint64_t)(v6 + 63) >> 6;
  v29 = v2 + 64;
  if ((v7 & v5) == 0)
    goto LABEL_6;
LABEL_5:
  v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v9 | (v4 << 6); ; i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * i);
    v16 = *v14;
    v15 = v14[1];
    v17 = *(void **)(*(_QWORD *)(v30 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v18 = v17;
    v19 = objc_msgSend(v18, sel_cloudIdentifier);
    if (v19)
    {

      v20 = v19;
    }
    else
    {
      v21 = objc_msgSend(v18, sel_error);
      if (v21)
      {
        v20 = v21;
      }
      else
      {
        type metadata accessor for PHPhotosError(0);
        sub_199217438(MEMORY[0x1E0DEE9D8]);
        sub_199218320();
        sub_199427FD4();
        v20 = v31;
      }

    }
    *(_QWORD *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v22 = (_QWORD *)(v3[6] + 16 * i);
    *v22 = v16;
    v22[1] = v15;
    v23 = v3[7] + 16 * i;
    *(_QWORD *)v23 = v20;
    *(_BYTE *)(v23 + 8) = v19 == 0;
    v24 = v3[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v3[2] = v26;
    if (v8)
      goto LABEL_5;
LABEL_6:
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_31;
    if (v11 >= v28)
      return;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v28)
        return;
      v12 = *(_QWORD *)(v27 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v28)
          return;
        v12 = *(_QWORD *)(v27 + 8 * v4);
        if (!v12)
          break;
      }
    }
LABEL_19:
    v8 = (v12 - 1) & v12;
  }
  v13 = v11 + 3;
  if (v13 >= v28)
    return;
  v12 = *(_QWORD *)(v27 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v28)
      return;
    v12 = *(_QWORD *)(v27 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_19;
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_199217C74(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_199217CAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE34F538;
  if (!qword_1EE34F538)
  {
    v1 = sub_199217C74(255, &qword_1EE34F528);
    result = MEMORY[0x19AEBF028](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE34F538);
  }
  return result;
}

void sub_199217CFC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  void *v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F540);
  v2 = sub_1994280B8();
  v3 = (_QWORD *)v2;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v25 = a1;
  v26 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & v5;
  v27 = (unint64_t)(v6 + 63) >> 6;
  v28 = v2 + 64;
  if ((v7 & v5) == 0)
    goto LABEL_6;
LABEL_5:
  v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v9 | (v4 << 6); ; i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * i);
    v15 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * i);
    v16 = v14;
    v17 = (id)sub_1992182C0(v16);
    v19 = v18;
    if (v18 || (v17 = objc_msgSend(v16, sel_error)) != 0)
    {
      v20 = v17;
    }
    else
    {
      type metadata accessor for PHPhotosError(0);
      sub_199217438(MEMORY[0x1E0DEE9D8]);
      sub_199218320();
      a1 = v25;
      sub_199427FD4();
      v20 = v29;
    }

    *(_QWORD *)(v28 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v3[6] + 8 * i) = v15;
    v21 = v3[7] + 24 * i;
    *(_QWORD *)v21 = v20;
    *(_QWORD *)(v21 + 8) = v19;
    *(_BYTE *)(v21 + 16) = v19 == 0;
    v22 = v3[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v24;
    if (v8)
      goto LABEL_5;
LABEL_6:
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_29;
    if (v11 >= v27)
      return;
    v12 = *(_QWORD *)(v26 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return;
      v12 = *(_QWORD *)(v26 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return;
        v12 = *(_QWORD *)(v26 + 8 * v4);
        if (!v12)
          break;
      }
    }
LABEL_19:
    v8 = (v12 - 1) & v12;
  }
  v13 = v11 + 3;
  if (v13 >= v27)
    return;
  v12 = *(_QWORD *)(v26 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return;
    v12 = *(_QWORD *)(v26 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_19;
  }
LABEL_30:
  __break(1u);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x19AEBF01C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_199217FB8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F540);
  v38 = a2;
  v6 = sub_1994280C4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * i);
      v20 = *(_QWORD *)(v5 + 56) + 24 * i;
      v21 = *(void **)v20;
      v22 = *(_QWORD *)(v20 + 8);
      v23 = *(_BYTE *)(v20 + 16);
      if ((v38 & 1) == 0)
      {
        v24 = v19;
        sub_1992183B8(v21, v22, v23);
      }
      result = sub_199428058();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) == 0)
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          v31 = v27 == v30;
          if (v27 == v30)
            v27 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v11 + 8 * v27);
          if (v32 != -1)
          {
            v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v28) = v19;
      v33 = *(_QWORD *)(v7 + 56) + 24 * v28;
      *(_QWORD *)v33 = v21;
      *(_QWORD *)(v33 + 8) = v22;
      *(_BYTE *)(v33 + 16) = v23;
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_39;
      if (v16 >= v36)
        goto LABEL_32;
      v17 = v37[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v36)
          goto LABEL_32;
        v17 = v37[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v36)
          {
LABEL_32:
            swift_release();
            v3 = v35;
            if ((v38 & 1) != 0)
            {
              v34 = 1 << *(_BYTE *)(v5 + 32);
              if (v34 >= 64)
                sub_1992182A4(0, (unint64_t)(v34 + 63) >> 6, v37);
              else
                *v37 = -1 << v34;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v37[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_40;
              if (v13 >= v36)
                goto LABEL_32;
              v17 = v37[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1992182A4(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1992182C0(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_localIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_199428004();

  return v3;
}

unint64_t sub_199218320()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE34F510;
  if (!qword_1EE34F510)
  {
    type metadata accessor for PHPhotosError(255);
    result = MEMORY[0x19AEBF028](&unk_199449724, v1);
    atomic_store(result, (unint64_t *)&qword_1EE34F510);
  }
  return result;
}

uint64_t sub_199218360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1992183A8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_1992183B8(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, unint64_t *a2)
{
  return sub_199217C74(0, a2);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease();
}

void PHPersistentChangeFetchResult.Iterator.__allocating_init(fetchResult:)(void *a1)
{
  OUTLINED_FUNCTION_0_1();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(a1);
  OUTLINED_FUNCTION_1();
}

uint64_t PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(void *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  *(_QWORD *)(v1 + 16) = objc_msgSend(a1, sel_iteratorForPersistentChangeEnumeration);
  return v1;
}

PHPersistentChange_optional __swiftcall PHPersistentChangeFetchResult.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  id v2;
  objc_class *v3;
  PHChange *v4;
  PHPersistentChangeToken *v5;
  Swift::Bool v6;
  PHPersistentChange_optional result;

  v1 = *(void **)(v0 + 16);
  if (objc_msgSend(v1, sel_hasMoreTransactions))
    v2 = objc_msgSend(*(id *)(v0 + 24), sel_nextPersistentChangeWithIterator_, v1);
  OUTLINED_FUNCTION_1();
  result.value._changeToken = v5;
  result.value._change = v4;
  result.value.super.isa = v3;
  result.is_nil = v6;
  return result;
}

uint64_t PHPersistentChangeFetchResult.Iterator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PHPersistentChangeFetchResult.Iterator.__deallocating_deinit()
{
  PHPersistentChangeFetchResult.Iterator.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_1992184E0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
  *a1 = result;
  return result;
}

void PHPersistentChangeFetchResult.makeIterator()()
{
  void *v0;

  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  OUTLINED_FUNCTION_0_1();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(v0);
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for PHPersistentChangeFetchResult.Iterator()
{
  return objc_opt_self();
}

unint64_t sub_19921855C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE34F560;
  if (!qword_1EE34F560)
  {
    v1 = type metadata accessor for PHPersistentChangeFetchResult.Iterator();
    result = MEMORY[0x19AEBF028](&protocol conformance descriptor for PHPersistentChangeFetchResult.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_1EE34F560);
  }
  return result;
}

void sub_199218598(_QWORD *a1@<X8>)
{
  void **v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  PHPersistentChangeFetchResult.makeIterator()();
  v5 = v4;

  *a1 = v5;
}

uint64_t sub_1992185D4()
{
  return 2;
}

uint64_t sub_1992185DC()
{
  return sub_1992185FC();
}

uint64_t sub_1992185FC()
{
  void *v0;
  uint64_t v1;

  v1 = sub_199218704(v0);

  return v1;
}

uint64_t sub_199218628()
{
  return sub_199218648();
}

uint64_t sub_19921864C()
{
  sub_1992186C8();
  return sub_199428028();
}

uint64_t method lookup function for PHPersistentChangeFetchResult.Iterator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PHPersistentChangeFetchResult.Iterator.__allocating_init(fetchResult:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

unint64_t sub_1992186C8()
{
  unint64_t result;

  result = qword_1EE34F568;
  if (!qword_1EE34F568)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE34F568);
  }
  return result;
}

uint64_t sub_199218704(void *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  swift_initStackObject();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(a1);
  result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
  v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (result)
  {
    v4 = result;
    v5 = 0;
    v6 = (uint64_t *)(MEMORY[0x1E0DEE9D8] + 32);
    while (1)
    {
      if (!v5)
      {
        v7 = v3[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1)
          v9 = 1;
        else
          v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE34F570);
        v10 = (_QWORD *)swift_allocObject();
        v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 8;
        v10[2] = v9;
        v10[3] = (2 * v11) | 1;
        v12 = (unint64_t)(v10 + 4);
        v13 = v3[3];
        v14 = v13 >> 1;
        if (v3[2])
        {
          if (v10 != v3 || v12 >= (unint64_t)&v3[v14 + 4])
            memmove(v10 + 4, v3 + 4, 8 * v14);
          v3[2] = 0;
        }
        v6 = (uint64_t *)(v12 + 8 * v14);
        v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - (v13 >> 1);
        result = swift_release();
        v3 = v10;
      }
      v16 = __OFSUB__(v5--, 1);
      if (v16)
        break;
      *v6++ = v4;
      result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
      v4 = result;
      if (!result)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v5 = 0;
LABEL_21:
  result = swift_release();
  v17 = v3[3];
  if (v17 < 2)
    return (uint64_t)v3;
  v18 = v17 >> 1;
  v16 = __OFSUB__(v18, v5);
  v19 = v18 - v5;
  if (!v16)
  {
    v3[2] = v19;
    return (uint64_t)v3;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_19921887C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;

  v4 = v3;
  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  v8 = swift_allocObject();
  result = PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(v4);
  v10 = 0;
  if (!a2 || !a3)
  {
LABEL_9:
    *a1 = v8;
    return v10;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v11 = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
    v10 = 0;
    if (v11)
    {
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v10) = v11;
        if (a3 - 1 == v10)
          break;
        v11 = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
        ++v10;
        if (!v11)
          goto LABEL_9;
      }
      v10 = a3;
    }
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_allocObject();
}

uint64_t sub_19921892C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_199218950()
{
  sub_19921892C();
  return swift_deallocClassInstance();
}

uint64_t sub_19921896C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  *(_BYTE *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = MEMORY[0x1E0DEE9D8];
  return v0;
}

uint64_t sub_1992189B4(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState];
  OUTLINED_FUNCTION_3();
  v4 = *(_QWORD *)(v3 + 16);
  objc_msgSend(*(id *)(v4 + 16), sel_addObject_, a1);
  LOBYTE(v4) = *(_BYTE *)(v4 + 24);
  OUTLINED_FUNCTION_6();
  v5 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v5 + 16) = a1;
  *(_BYTE *)(v5 + 24) = v4;
  *(_QWORD *)(v5 + 32) = v1;
  v6 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v6 + 16) = sub_199219F24;
  *(_QWORD *)(v6 + 24) = v5;
  v12[4] = sub_199219F38;
  v12[5] = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_199218BE4;
  v12[3] = &block_descriptor_24;
  v7 = _Block_copy(v12);
  v8 = a1;
  v9 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_performBlockAndWait_, v7);
  _Block_release(v7);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_199218B18(void *a1, char a2, uint64_t a3)
{
  id v6;
  id v7;

  objc_msgSend(a1, sel_setTrackSQLiteDatabaseStatistics_, 1);
  if ((a2 & 1) != 0)
  {
    v6 = objc_msgSend(a1, sel__delegate);
    sub_199428070();
    swift_unknownObjectRelease();
    sub_199217C74(0, &qword_1EE34F600);
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v7, sel_setPhotoKitStatsTracker_, a3);

    }
  }
}

uint64_t sub_199218BE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_199218C88()
{
  char *v0;
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;

  OUTLINED_FUNCTION_4(*(os_unfair_lock_s **)&v0[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState]);
  v1 = OUTLINED_FUNCTION_9();
  sub_199218CF0(v1, v2);
  OUTLINED_FUNCTION_10();
  sub_199218D6C(0, v3, v0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

void sub_199218CF0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), sel_allObjects);
  sub_199217C74(0, &qword_1EE34F608);
  v4 = sub_199428040();

  *a2 = v4;
}

uint64_t sub_199218D6C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  if (a2 >> 62)
    goto LABEL_13;
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_1994280AC())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x19AEBD4B0](v7 - 4, a2) : *(id *)(a2 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = sub_199218E6C();

      v12 = __OFADD__(a1, v11);
      a1 += v11;
      if (v12)
        goto LABEL_12;
      ++v7;
      if (v10 == v6)
        goto LABEL_10;
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_10:

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_199218E6C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE34F610);
  sub_19942804C();
  if (v4)
  {
    v0 = v4;
    v1 = (uint64_t)objc_msgSend(v0, sel_pageSize);
    v2 = (uint64_t)objc_msgSend(v0, sel_totalCachePages);

    result = v1 * v2;
    if ((unsigned __int128)(v1 * (__int128)v2) >> 64 == (v1 * v2) >> 63)
      return result;
    __break(1u);
  }
  return 0;
}

id sub_199218F18@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(a1, sel_databaseStatistics);
  *a2 = result;
  return result;
}

void sub_199218F54()
{
  char *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)();
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void (*v15)();
  unint64_t v16;
  char aBlock[8];
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_4(*(os_unfair_lock_s **)&v0[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState]);
  v1 = (uint64_t *)OUTLINED_FUNCTION_9();
  sub_199219434(v1, 1, v2);
  OUTLINED_FUNCTION_10();
  v3 = *(_QWORD *)aBlock;
  if (*(_QWORD *)aBlock >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((*(_QWORD *)aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (v4 >= 1)
    {
      v5 = 0;
      v6 = 0;
      v16 = v3 & 0xC000000000000001;
      v7 = v3;
      while (1)
      {
        v8 = v16 ? (id)MEMORY[0x19AEBD4B0](v6, v3) : *(id *)(v3 + 8 * v6 + 32);
        v9 = v8;
        v10 = OUTLINED_FUNCTION_1_1();
        *(_QWORD *)(v10 + 16) = v9;
        *(_QWORD *)(v10 + 24) = v0;
        v11 = v9;
        v12 = v0;
        sub_199219E64((uint64_t)v5);
        v13 = OUTLINED_FUNCTION_1_1();
        *(_QWORD *)(v13 + 16) = sub_199219ED8;
        *(_QWORD *)(v13 + 24) = v10;
        v14 = OUTLINED_FUNCTION_12((uint64_t)&block_descriptor_14, v16, MEMORY[0x1E0C809B0], 1107296256, v18, v19);
        swift_retain();
        swift_release();
        objc_msgSend(v11, sel_performBlockAndWait_, v14);

        _Block_release(v14);
        v3 = OUTLINED_FUNCTION_8();
        swift_release();
        if ((v3 & 1) != 0)
          break;
        ++v6;
        v5 = sub_199219ED8;
        v3 = v7;
        if (v4 == v6)
        {
          OUTLINED_FUNCTION_5();
          v15 = sub_199219ED8;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      v4 = sub_1994280AC();
      OUTLINED_FUNCTION_5();
      if (!v4)
        goto LABEL_13;
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    OUTLINED_FUNCTION_5();
    v15 = 0;
LABEL_14:
    sub_199219E64((uint64_t)v15);
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_199219160(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = objc_msgSend(a1, sel__delegate);
  sub_199428070();
  swift_unknownObjectRelease();
  sub_199217C74(0, &qword_1EE34F600);
  if ((swift_dynamicCast() & 1) != 0)
  {
    objc_msgSend(v4, sel_setPhotoKitStatsTracker_, a2);

  }
}

void sub_199219238()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)();
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  void (*v14)();
  uint64_t v15;
  char aBlock[8];
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)();
  uint64_t v20;

  v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  v2 = (uint64_t *)&v1[4];
  OUTLINED_FUNCTION_4(v1);
  sub_199219434(v2, 0, (uint64_t *)aBlock);
  OUTLINED_FUNCTION_10();
  v3 = *(_QWORD *)aBlock;
  if (*(_QWORD *)aBlock >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((*(_QWORD *)aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (v4 >= 1)
    {
      v5 = 0;
      v6 = 0;
      while (1)
      {
        v7 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x19AEBD4B0](v6, v3) : *(id *)(v3 + 8 * v6 + 32);
        v8 = v7;
        v9 = OUTLINED_FUNCTION_1_1();
        *(_QWORD *)(v9 + 16) = v8;
        v10 = v8;
        sub_199219E64((uint64_t)v5);
        v11 = OUTLINED_FUNCTION_1_1();
        *(_QWORD *)(v11 + 16) = sub_199219E5C;
        *(_QWORD *)(v11 + 24) = v9;
        v19 = sub_199219E78;
        v20 = v11;
        v12 = OUTLINED_FUNCTION_12((uint64_t)&block_descriptor, v15, MEMORY[0x1E0C809B0], 1107296256, v17, v18);
        swift_retain();
        swift_release();
        objc_msgSend(v10, sel_performBlockAndWait_, v12);

        _Block_release(v12);
        v13 = OUTLINED_FUNCTION_8();
        swift_release();
        if ((v13 & 1) != 0)
          break;
        ++v6;
        v5 = sub_199219E5C;
        if (v4 == v6)
        {
          OUTLINED_FUNCTION_11();
          v14 = sub_199219E5C;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      v4 = sub_1994280AC();
      OUTLINED_FUNCTION_11();
      if (!v4)
        goto LABEL_13;
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    OUTLINED_FUNCTION_11();
    v14 = 0;
LABEL_14:
    sub_199219E64((uint64_t)v14);
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_199219434(uint64_t *a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  id v5;
  uint64_t v6;

  v4 = *a1;
  *(_BYTE *)(v4 + 24) = a2;
  v5 = objc_msgSend(*(id *)(v4 + 16), sel_allObjects);
  sub_199217C74(0, &qword_1EE34F608);
  v6 = sub_199428040();

  *a3 = v6;
}

void sub_1992194B4(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(a1, sel__delegate);
  sub_199428070();
  swift_unknownObjectRelease();
  sub_199217C74(0, &qword_1EE34F600);
  if ((swift_dynamicCast() & 1) != 0)
  {
    objc_msgSend(v2, sel_setPhotoKitStatsTracker_, 0);

  }
}

uint64_t sub_1992195D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_3();
  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 32);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6();
  return v2;
}

void sub_199219618()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_3();
  *(_QWORD *)(*(_QWORD *)(v1 + 16) + 32) = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
}

void sub_199219698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState];
  OUTLINED_FUNCTION_3();
  v9 = *(_QWORD *)(v7 + 16);
  v8 = (uint64_t *)(v7 + 16);
  v10 = *(unsigned __int8 *)(v9 + 24);
  OUTLINED_FUNCTION_6();
  if (v10 == 1)
  {
    sub_1992197C0(a5, v5);
    v11 = (void *)objc_opt_self();
    v12 = (void *)sub_199427FF8();
    v13 = (void *)sub_199428034();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_bindSelectString_bindValueStrings_, v12, v13);

    v15 = sub_199428004();
    v17 = v16;

    OUTLINED_FUNCTION_3();
    sub_199219940(v8, v15, v17);
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_5();
  }
}

uint64_t sub_1992197C0(uint64_t a1, void *a2)
{
  int64_t v2;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_199219C7C(0, v2, 0);
    v4 = v16;
    v5 = (_QWORD *)(a1 + 32);
    v6 = (void *)objc_opt_self();
    do
    {
      __swift_project_boxed_opaque_existential_0(v5, v5[3]);
      v7 = objc_msgSend(v6, sel_stringFromBindVariable_withTypePrefix_, sub_1994280DC(), 0);
      v8 = sub_199428004();
      v10 = v9;
      swift_unknownObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_199219C7C(0, *(_QWORD *)(v16 + 16) + 1, 1);
      v12 = *(_QWORD *)(v16 + 16);
      v11 = *(_QWORD *)(v16 + 24);
      if (v12 >= v11 >> 1)
        sub_199219C7C((char *)(v11 > 1), v12 + 1, 1);
      *(_QWORD *)(v16 + 16) = v12 + 1;
      v13 = v16 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
      v5 += 4;
      --v2;
    }
    while (v2);

  }
  else
  {

    return MEMORY[0x1E0DEE9D8];
  }
  return v4;
}

char *sub_199219940(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  char *result;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  swift_bridgeObjectRetain();
  sub_199219D94();
  v6 = *(char **)(*(_QWORD *)(v5 + 32) + 16);
  result = sub_199219DDC(v6);
  v8 = *(_QWORD *)(v5 + 32);
  *(_QWORD *)(v8 + 16) = v6 + 1;
  v9 = v8 + 16 * (_QWORD)v6;
  *(_QWORD *)(v9 + 32) = a2;
  *(_QWORD *)(v9 + 40) = a3;
  return result;
}

void sub_199219A58()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v1 = v0;
  v2 = OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState;
  type metadata accessor for PHDatabaseStatisticsTracker.State();
  OUTLINED_FUNCTION_1_1();
  v3 = v0;
  v4 = sub_19921896C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECDF4F28);
  v5 = OUTLINED_FUNCTION_1_1();
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)&v1[v2] = v5;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for PHDatabaseStatisticsTracker();
  objc_msgSendSuper2(&v6, sel_init);
  OUTLINED_FUNCTION_0_0();
}

id sub_199219B00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PHDatabaseStatisticsTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PHDatabaseStatisticsTracker()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PHDatabaseStatisticsTracker.State()
{
  return objc_opt_self();
}

char *sub_199219B80(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F5F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_199219C7C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_199219C98(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_199219C98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE34F5F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_199219D94()
{
  char **v0;
  char *v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_199219B80(result, *((_QWORD *)v1 + 2) + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

char *sub_199219DDC(char *result)
{
  char **v1;
  unint64_t v2;

  v2 = *((_QWORD *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_199219B80((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_199219E3C()
{
  OUTLINED_FUNCTION_13();
  return swift_deallocObject();
}

void sub_199219E5C()
{
  uint64_t v0;

  sub_1992194B4(*(void **)(v0 + 16));
}

uint64_t sub_199219E64(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_199219E78()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_199219EB0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13();

  return swift_deallocObject();
}

void sub_199219ED8()
{
  uint64_t v0;

  sub_199219160(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

id sub_199219EE4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_199218F18(*(void **)(v1 + 16), a1);
}

uint64_t sub_199219EFC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13();

  return swift_deallocObject();
}

void sub_199219F24()
{
  uint64_t v0;

  sub_199218B18(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_3()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_lock(v0);
}

void OUTLINED_FUNCTION_4(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 6);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_6()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_unlock(v0);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_10()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_unlock(v0);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X8>, uint64_t a2, char aBlock, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  a5 = v6;
  a6 = a1;
  return _Block_copy(&aBlock);
}

void OUTLINED_FUNCTION_13()
{
  uint64_t v0;

}

id ph_objc_getAssociatedObject(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  sSharedTable();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedObjectOnObject:forKey:", v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sSharedTable()
{
  pl_dispatch_once();
  return (id)sSharedTable_pl_once_object_17;
}

void __sSharedTable_block_invoke()
{
  PHAssociatedObjectsTable *v0;
  void *v1;

  v0 = objc_alloc_init(PHAssociatedObjectsTable);
  v1 = (void *)sSharedTable_pl_once_object_17;
  sSharedTable_pl_once_object_17 = (uint64_t)v0;

}

void ph_objc_setAssociatedObject(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  sSharedTable();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssociatedObject:onObject:forKey:", v5, v7, v6);

}

id ph_objc_setAssociatedObjectIfNotSet(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  sSharedTable();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssociatedObjectIfNotSet:onObject:forKey:", v5, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void ph_objc_removeAssociatedObjects(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  sSharedTable();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAssociatedObjectsOnObject:", v1);

}

void sub_19921B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19921E2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_199226A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__672(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__673(uint64_t a1)
{

}

const __CFString *PHSocialGroupVerifiedTypeDescription(int a1)
{
  if ((a1 + 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E35D5D80[a1 + 1];
}

void sub_199228ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199229028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199229444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

void sub_199229624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19922A384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19922A444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *PLStringForSearchEntityCategoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
    return CFSTR("PHSearchEntityCategoryTypeUndefined");
  else
    return off_1E35D5EC0[a1 - 1];
}

const __CFString *PLDebugStringForSearchSuggestionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("PHSearchSuggestionTypeUndefined");
  else
    return off_1E35D5F38[a1 - 1];
}

const __CFString *PLDebugStringForSearchEntityType(uint64_t a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;

  result = CFSTR("PHSearchEntityTypeUndefined");
  if (a1 <= 1529)
  {
    if (a1 <= 1099)
    {
      switch(a1)
      {
        case 1:
          result = CFSTR("PHSearchEntityTypeAOI");
          break;
        case 2:
          result = CFSTR("PHSearchEntityTypeThoroughfare");
          break;
        case 3:
          result = CFSTR("PHSearchEntityTypeSubLocality");
          break;
        case 4:
          result = CFSTR("PHSearchEntityTypeLargeAOI");
          break;
        case 5:
          result = CFSTR("PHSearchEntityTypeLocality");
          break;
        case 6:
          result = CFSTR("PHSearchEntityTypeSuperLocality");
          break;
        case 7:
          result = CFSTR("PHSearchEntityTypeSubAdministrativeArea");
          break;
        case 8:
          result = CFSTR("PHSearchEntityTypeSubAdministrativeLocality");
          break;
        case 9:
          result = CFSTR("PHSearchEntityTypeSuperAOI");
          break;
        case 10:
          result = CFSTR("PHSearchEntityTypeAdministrativeArea");
          break;
        case 11:
          result = CFSTR("PHSearchEntityTypeAdministrativeAreaCode");
          break;
        case 12:
          result = CFSTR("PHSearchEntityTypeCountry");
          break;
        case 13:
          result = CFSTR("PHSearchEntityTypeCountryCode");
          break;
        case 14:
          result = CFSTR("PHSearchEntityTypeMegaAOI");
          break;
        default:
          switch(a1)
          {
            case 1000:
              result = CFSTR("PHSearchEntityTypeHome");
              break;
            case 1001:
              result = CFSTR("PHSearchEntityTypeWork");
              break;
            case 1002:
              result = CFSTR("PHSearchEntityTypePlaceAnnotation");
              break;
            case 1003:
              result = CFSTR("PHSearchEntityTypePOI");
              break;
            case 1004:
              result = CFSTR("PHSearchEntityTypeROI");
              break;
            default:
              return result;
          }
          break;
      }
      return result;
    }
    if (a1 <= 1299)
    {
      switch(a1)
      {
        case 1200:
          result = CFSTR("PHSearchEntityTypeKeyword");
          break;
        case 1201:
          result = CFSTR("PHSearchEntityTypeTitle");
          break;
        case 1202:
          result = CFSTR("PHSearchEntityTypeDescription");
          break;
        case 1203:
          result = CFSTR("PHSearchEntityTypeOCRText");
          break;
        case 1204:
          result = CFSTR("PHSearchEntityTypeOCRTextFound");
          break;
        default:
          switch(a1)
          {
            case 1100:
              result = CFSTR("PHSearchEntityTypeMonth");
              break;
            case 1101:
              result = CFSTR("PHSearchEntityTypeYear");
              break;
            case 1102:
              result = CFSTR("PHSearchEntityTypeHoliday");
              break;
            case 1103:
              result = CFSTR("PHSearchEntityTypeSeason");
              break;
            default:
              return result;
          }
          break;
      }
      return result;
    }
    if (a1 <= 1399)
    {
      v3 = CFSTR("PHSearchEntityTypeContributor");
      v21 = CFSTR("PHSearchEntityTypePet");
      if (a1 != 1330)
        v21 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1320)
        v3 = v21;
      v6 = CFSTR("PHSearchEntityTypePerson");
      v22 = CFSTR("PHSearchEntityTypeSocialGroup");
      if (a1 != 1310)
        v22 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1300)
        v6 = v22;
      v10 = __OFSUB__(a1, 1319);
      v8 = a1 == 1319;
      v9 = a1 - 1319 < 0;
    }
    else
    {
      v3 = CFSTR("PHSearchEntityTypeScene");
      v14 = CFSTR("PHSearchEntityTypeParseRichLabelKGID");
      v15 = CFSTR("PHSearchEntityTypePrivateEncryptedComputeKGID");
      if (a1 != 1520)
        v15 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1510)
        v14 = v15;
      if (a1 != 1500)
        v3 = v14;
      v6 = CFSTR("PHSearchEntityTypeAlbumTitle");
      v16 = CFSTR("PHSearchEntityTypeMemoryTitle");
      if (a1 != 1401)
        v16 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1400)
        v6 = v16;
      v10 = __OFSUB__(a1, 1499);
      v8 = a1 == 1499;
      v9 = a1 - 1499 < 0;
    }
LABEL_79:
    if (v9 ^ v10 | v8)
      return v6;
    else
      return v3;
  }
  if (a1 <= 1899)
  {
    if (a1 <= 1699)
    {
      v3 = CFSTR("PHSearchEntityTypeMeaning");
      v17 = CFSTR("PHSearchEntityTypeTrip");
      if (a1 != 1610)
        v17 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1600)
        v3 = v17;
      v6 = CFSTR("PHSearchEntityTypePrivateEncryptedComputeMUID");
      v18 = CFSTR("PHSearchEntityTypePrivateEncryptedComputeAMP");
      if (a1 != 1540)
        v18 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1530)
        v6 = v18;
      v10 = __OFSUB__(a1, 1599);
      v8 = a1 == 1599;
      v9 = a1 - 1599 < 0;
    }
    else
    {
      v3 = CFSTR("PHSearchEntityTypePublicEventName");
      v4 = CFSTR("PHSearchEntityTypePublicEventPerformer");
      v5 = CFSTR("PHSearchEntityTypePublicEventCategory");
      if (a1 != 1802)
        v5 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1801)
        v4 = v5;
      if (a1 != 1800)
        v3 = v4;
      v6 = CFSTR("PHSearchEntityTypeBusinessName");
      v7 = CFSTR("PHSearchEntityTypeBusinessCategory");
      if (a1 != 1701)
        v7 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 1700)
        v6 = v7;
      v10 = __OFSUB__(a1, 1799);
      v8 = a1 == 1799;
      v9 = a1 - 1799 < 0;
    }
    goto LABEL_79;
  }
  if (a1 > 1999)
  {
    if (a1 <= 2399)
    {
      v3 = CFSTR("PHSearchEntityTypeImportedByAppName");
      v19 = CFSTR("PHSearchEntityTypeCameraMakeAndModel");
      if (a1 != 2300)
        v19 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 2200)
        v3 = v19;
      v6 = CFSTR("PHSearchEntityTypeFavorite");
      v20 = CFSTR("PHSearchEntityTypeFilename");
      if (a1 != 2100)
        v20 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 2000)
        v6 = v20;
      v10 = __OFSUB__(a1, 2199);
      v8 = a1 == 2199;
      v9 = a1 - 2199 < 0;
    }
    else
    {
      v3 = CFSTR("PHSearchEntityTypeAudioClassification");
      v11 = CFSTR("PHSearchEntityTypeHumanAction");
      v12 = CFSTR("PHSearchEntityTypeDate");
      if (a1 != 2700)
        v12 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 2600)
        v11 = v12;
      if (a1 != 2500)
        v3 = v11;
      v6 = CFSTR("PHSearchEntityTypeSharedLibrary");
      v13 = CFSTR("PHSearchEntityTypePersonalLibrary");
      if (a1 != 2401)
        v13 = CFSTR("PHSearchEntityTypeUndefined");
      if (a1 != 2400)
        v6 = v13;
      v10 = __OFSUB__(a1, 2499);
      v8 = a1 == 2499;
      v9 = a1 - 2499 < 0;
    }
    goto LABEL_79;
  }
  switch(a1)
  {
    case 1900:
      result = CFSTR("PHSearchEntityTypeImage");
      break;
    case 1901:
      result = CFSTR("PHSearchEntityTypeVideo");
      break;
    case 1902:
      result = CFSTR("PHSearchEntityTypeRaw");
      break;
    case 1903:
      result = CFSTR("PHSearchEntityTypeCinematicVideo");
      break;
    case 1904:
      result = CFSTR("PHSearchEntityTypeProRes");
      break;
    case 1905:
      result = CFSTR("PHSearchEntityTypeSlomo");
      break;
    case 1906:
      result = CFSTR("PHSearchEntityTypeLivePhoto");
      break;
    case 1907:
      result = CFSTR("PHSearchEntityTypeScreenshot");
      break;
    case 1908:
      result = CFSTR("PHSearchEntityTypePanorama");
      break;
    case 1909:
      result = CFSTR("PHSearchEntityTypeTimelapse");
      break;
    case 1910:
      result = CFSTR("PHSearchEntityTypeScreenRecording");
      break;
    case 1911:
      result = CFSTR("PHSearchEntityTypeLongExposure");
      break;
    case 1912:
      result = CFSTR("PHSearchEntityTypeAnimated");
      break;
    case 1913:
      result = CFSTR("PHSearchEntityTypeBurst");
      break;
    case 1914:
      result = CFSTR("PHSearchEntityTypePortrait");
      break;
    case 1915:
      result = CFSTR("PHSearchEntityTypeSelfie");
      break;
    case 1916:
      result = CFSTR("PHSearchEntityTypeActionCam");
      break;
    case 1917:
      result = CFSTR("PHSearchEntityTypeLivePortrait");
      break;
    case 1918:
      result = CFSTR("PHSearchEntityTypeSpatial");
      break;
    default:
      return result;
  }
  return result;
}

const __CFString *PLDebugStringForSearchQuerySuggestionType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("PHSearchQuerySuggestionTypeUndefined");
  if (a1 == 1)
    v1 = CFSTR("PHSearchQuerySuggestionTypeInitial");
  if (a1 == 2)
    return CFSTR("PHSearchQuerySuggestionTypeRecent");
  else
    return v1;
}

const __CFString *PLDebugStringForAmbiguityType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("PHSearchAmbiguityTypeNone");
  if (a1 == 1)
    v1 = CFSTR("PHSearchAmbiguityTypePartiallyAmbiguous");
  if (a1 == 2)
    return CFSTR("PHSearchAmbiguityTypeFullyAmbiguous");
  else
    return v1;
}

void sub_19922DBD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19922F30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1369(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1370(uint64_t a1)
{

}

void sub_199231468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39)
{

  _Unwind_Resume(a1);
}

void sub_199232148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_199232794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_199232CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_199232F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19923352C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_199235904(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1992364CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199236528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199236584(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1992365E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19923663C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199237314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19923A11C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x368], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Unwind_Resume(a1);
}

void sub_19923ABA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;
  void *v67;
  uint64_t v68;

  objc_sync_exit(v67);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose((const void *)(v68 - 256), 8);
  _Block_object_dispose((const void *)(v68 - 208), 8);
  _Block_object_dispose((const void *)(v68 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1949(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1950(uint64_t a1)
{

}

void __WriteStackshot(void *a1)
{
  int v1;
  void *v2;
  id v3;

  v3 = a1;
  v1 = MEMORY[0x19AEBDEDC]();
  v2 = v3;
  if (v1)
  {
    if (__WriteStackshot_onceToken != -1)
      dispatch_once(&__WriteStackshot_onceToken, &__block_literal_global_327);
    v2 = v3;
    if (__WriteStackshot_PHWriteStackshotReport)
    {
      __WriteStackshot_PHWriteStackshotReport(v3, 3134986837);
      v2 = v3;
    }
  }

}

void sub_19923FC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2315(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2316(uint64_t a1)
{

}

id PHAssetExportRequestCopyFileURL(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PHAssetExportRequest.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    if (v8)
    {
LABEL_3:
      if (v9)
        goto LABEL_4;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PHAssetExportRequest.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

      if (a4)
        goto LABEL_5;
      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PHAssetExportRequest.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectory"));

  if (!v9)
    goto LABEL_18;
LABEL_4:
  if (a4)
    goto LABEL_5;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PHAssetExportRequest.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_5:
  v31 = 0;
  v10 = PHAssetExportRequestCreateOutputDirectory(v8, &v31);
  v11 = v31;
  if (v10)
  {
    objc_msgSend(v7, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathExtension:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v14) & 1) != 0)
    {
      v15 = v7;
      v16 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v11;
      v18 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v7, v14, &v30);
      v16 = v30;

      if (v18)
      {
        v15 = v14;
      }
      else
      {
        PLPhotoKitGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v16;
          _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to copy file: %@", buf, 0xCu);
        }

        v15 = 0;
      }
    }

    v11 = v16;
  }
  else
  {
    v15 = 0;
  }
  v20 = objc_retainAutorelease(v11);
  *a4 = v20;

  return v15;
}

uint64_t PHAssetExportRequestCreateOutputDirectory(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    if (a2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestCreateOutputDirectory(NSURL *__strong, NSError *__autoreleasing *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PHAssetExportRequest.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectory"));

    if (a2)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestCreateOutputDirectory(NSURL *__strong, NSError *__autoreleasing *)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PHAssetExportRequest.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v13);
  v6 = v13;

  if ((v5 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to create output directory: %@", buf, 0xCu);
    }

    *a2 = objc_retainAutorelease(v6);
  }

  return v5;
}

id PHAssetExportRequestFilenameForAsset(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "customFilenameBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  if (v5)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "originalMetadataProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "originalFilename");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138478083;
      v17 = (uint64_t)v8;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset's original filename is '%{private}@', but using custom filename base (supplied in options): %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v3, "originalMetadataProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      goto LABEL_6;
    objc_msgSend(v3, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v16 = 138543362;
        v17 = (uint64_t)v4;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Asset's original filename is nil/empty, so using the library filename as name: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();

      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Asset's original filename and filename are both nil/empty, so using a new UUID as name: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      v4 = (void *)v15;
    }
  }

  v9 = v4;
LABEL_6:

  return v9;
}

uint64_t PHAssetExportRequestCanCreateLivePhotoBundleForAssetWithOptions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v5, "playbackStyle");
  if (!objc_msgSend(v5, "isMediaSubtype:", 8) || v8 == 3)
  {
    if (v8 != 3)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  else if ((objc_msgSend(v7, "shouldExportUnmodifiedOriginalResources") & 1) == 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "treatLivePhotoAsStill") & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHAssetExportRequestVideoFileURLKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v9 = 1;
  else
    v9 = objc_msgSend(v5, "isIncompleteLivePhotoMissingVideoComplement") ^ 1;
LABEL_8:

  return v9;
}

uint64_t PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int matched;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata * _Nullable __strong, CLLocation * _Nullable __autoreleasing * _Nullable)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PHAssetExportRequest.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    v12 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8))
      goto LABEL_9;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata * _Nullable __strong, CLLocation * _Nullable __autoreleasing * _Nullable)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PHAssetExportRequest.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  if (!v7)
    goto LABEL_11;
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    v12 = 0;
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v7, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "locationComparisonStrategy") == 2)
  {
    v11 = v10;
  }
  else
  {
    PHAssetOriginalLocationForAsset(v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v11;
  matched = _LocationsMatchUsingComparisonStrategy(v10, v11, objc_msgSend(v8, "locationComparisonStrategy"));
  v12 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(CFSTR("location"), v7, objc_msgSend(v8, "shouldStripLocation"), objc_msgSend(v8, "forceLocationMetadataBaking"), v10, v13, matched, a4);

LABEL_9:
  return v12;
}

uint64_t PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PHAssetExportRequest.m"), 577, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    v14 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8))
      goto LABEL_11;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PHAssetExportRequest.m"), 576, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  if (!v7)
    goto LABEL_13;
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    v14 = 0;
    goto LABEL_11;
  }
LABEL_4:
  objc_msgSend(v7, "descriptionProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PHAssetOriginalCaptionForAsset(v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PLObjectIsEqual() & 1) != 0)
  {
    v13 = 1;
  }
  else if (objc_msgSend(v11, "length"))
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_msgSend(v12, "length") == 0;
  }
  v14 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(CFSTR("caption"), v7, objc_msgSend(v8, "shouldStripCaption"), objc_msgSend(v8, "forceCaptionMetadataBaking"), v11, v12, v13, a4);

LABEL_11:
  return v14;
}

uint64_t PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PHAssetExportRequest.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    v13 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8))
      goto LABEL_6;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PHAssetExportRequest.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  if (!v7)
    goto LABEL_8;
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    v13 = 0;
    goto LABEL_6;
  }
LABEL_4:
  objc_msgSend(v7, "descriptionProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PHAssetOriginalAccessibilityDescriptionForAsset(v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = PLObjectIsEqual();
  v13 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(CFSTR("accessibility description"), v7, objc_msgSend(v8, "shouldStripAccessibilityDescription"), objc_msgSend(v8, "forceAccessibilityDescriptionMetadataBaking"), v11, v12, (_BOOL4)v10, a4);

LABEL_6:
  return v13;
}

id PHAssetExportRequestCustomDateForAssetWithOptions(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  _BOOL4 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v44;
  __CFString *v45;
  id v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if ((objc_msgSend(v5, "isCloudSharedAsset") & 1) == 0
    && PHAssetCanPerformAdditionalProcessingOnAsset(v5, v6))
  {
    objc_msgSend(v5, "fetchPropertySetsIfNeeded");
    objc_msgSend(v5, "originalMetadataProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "originalMetadataProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    objc_msgSend(v5, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v5, "originalCreationDateWithTimeZone:", &v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (__CFString *)v46;
    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(v5, "isVideo");
        v20 = CFSTR("image");
        *(_DWORD *)buf = 138543875;
        if (v19)
          v20 = CFSTR("video");
        v48 = v20;
        v49 = 2113;
        v50 = v16;
        v51 = 2113;
        v52 = v45;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Parsed original %{public}@ metadata creation date: %{private}@, with timezone: %{private}@", buf, 0x20u);
      }

      v21 = _CreationDatesInLibraryAndOriginalMetadataAreSame(v15, v16);
      v22 = v21;
      if (v8)
      {
        if (v21)
        {
          v23 = objc_msgSend(v14, "secondsFromGMTForDate:", v15);
          v24 = -[__CFString secondsFromGMTForDate:](v45, "secondsFromGMTForDate:", v16);
          v25 = objc_msgSend(v14, "isEqualToTimeZone:", v45);
          if (v23 == v24)
            v22 = 1;
          else
            v22 = v25;
        }
LABEL_22:
        v28 = &stru_1E35DFFF8;
        goto LABEL_26;
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v5, "isVideo");
        v27 = CFSTR("image");
        if (v26)
          v27 = CFSTR("video");
        *(_DWORD *)buf = 138412546;
        v48 = v27;
        v49 = 2114;
        v50 = v5;
        _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Couldn't extract creation date from %@ asset: %{public}@", buf, 0x16u);
      }

      v22 = 0;
      if (v8)
        goto LABEL_22;
    }
    PLPhotoKitGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uuid");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Library does not have explicit timezone saved for asset %{public}@, so skipping explicit time zone comparison", buf, 0xCu);

    }
    v28 = CFSTR("Not available, so using default: ");
LABEL_26:
    v31 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (TimeZone: %@%@)"), v15, v14, v28);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (TimeZone: %@)"), v16, v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v6, "forceDateTimeMetadataBaking");
    PLPhotoKitGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v48 = v32;
        v49 = 2114;
        v50 = v36;
        v37 = "[PHAssetExportRequest] Based on internal debug settings, forcing creation date to be baked in, even though"
              " the library and original creation date (%{private}@) are the same for asset: %{public}@.";
        v38 = v35;
        v39 = 22;
LABEL_41:
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);

      }
    }
    else
    {
      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          if (objc_msgSend(v5, "isVideo"))
            v40 = CFSTR("video");
          else
            v40 = CFSTR("image");
          objc_msgSend(v5, "uuid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v40;
          v49 = 2114;
          v50 = v41;
          _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Creation date in library is same as original creation date for %{public}@ asset: %{public}@. No need for a custom date.", buf, 0x16u);

        }
        v13 = 0;
        goto LABEL_45;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v5, "isVideo"))
          v42 = CFSTR("video");
        else
          v42 = CFSTR("image");
        objc_msgSend(v5, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478851;
        v48 = v32;
        v49 = 2113;
        v50 = v44;
        v51 = 2114;
        v52 = v42;
        v53 = 2114;
        v54 = v36;
        v55 = 2113;
        v56 = v32;
        v37 = "[PHAssetExportRequest] Creation date in library (%{private}@) is different from original creation date (%{"
              "private}@) for %{public}@ asset: %{public}@. Setting custom creation date to: %{private}@";
        v38 = v35;
        v39 = 52;
        goto LABEL_41;
      }
    }

    if (a3)
      *a3 = objc_retainAutorelease(v31);
    v13 = v15;
LABEL_45:

    goto LABEL_46;
  }
  v13 = 0;
LABEL_46:

  return v13;
}

void PHAssetExportRequestPerformMediaConversion(void *a1, uint64_t a2, char a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(id, _QWORD, id);
  NSObject *v28;
  void *v29;
  void (**v30)(id, _QWORD, id);
  id v31;
  void *v32;
  int v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
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
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  void (**v72)(id, _QWORD, id);
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  const __CFString *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v21 = a1;
  v22 = a5;
  v65 = a6;
  v63 = a7;
  v67 = a9;
  v66 = a11;
  v64 = a12;
  v23 = a13;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v27 = a18;
  if (v21)
  {
    if (v23)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("PHAssetExportRequest.m"), 891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    if (v23)
    {
LABEL_3:
      if (v24)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("PHAssetExportRequest.m"), 892, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

  if (v24)
  {
LABEL_4:
    if (v25)
      goto LABEL_5;
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("PHAssetExportRequest.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v27)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PHAssetExportRequest.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectory"));

  if (!v25)
    goto LABEL_44;
LABEL_5:
  if (v27)
    goto LABEL_6;
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("PHAssetExportRequest.m"), 895, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_6:
  PLPhotoKitGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v21, "fileURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pathExtension");
    v30 = v27;
    v31 = v26;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v21, "isVideo");
    v34 = CFSTR("image");
    if (v33)
      v34 = CFSTR("video");
    *(_DWORD *)buf = 138543618;
    v75 = v32;
    v76 = 2114;
    v77 = v34;
    _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Requesting conversion of %{public}@ %{public}@ resource", buf, 0x16u);

    v26 = v31;
    v27 = v30;

  }
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
  else
    objc_msgSend(MEMORY[0x1E0D75128], "capabilitiesForCurrentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(MEMORY[0x1E0D47C48], "requestForSource:destinationCapabilities:error:", v21, v35, &v73);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v73;
  if (!v36)
  {
    v27[2](v27, 0, v37);
    goto LABEL_40;
  }
  if (v26)
  {
    objc_msgSend(v36, "setLivePhotoPairingIdentifier:", v26);
    objc_msgSend(v36, "setLivePhotoPairingIdentifierBehavior:", 3);
  }
  if (a4 == 2 && v22)
  {
    v38 = v36;
    v39 = 2;
    v40 = v22;
  }
  else
  {
    if (a4 != 1)
      goto LABEL_23;
    v38 = v36;
    v39 = 1;
    v40 = 0;
  }
  objc_msgSend(v38, "setLocationMetadataBehavior:withLocation:", v39, v40);
LABEL_23:
  v62 = v22;
  if (v65)
    objc_msgSend(v36, "setCreationDateMetadataBehavior:withCreationDate:inTimeZone:", 2, v65, v63);
  if (a8 == 2 && v67)
  {
    v41 = v36;
    v42 = 2;
    v43 = v67;
LABEL_30:
    objc_msgSend(v41, "setCaptionMetadataBehavior:withCaption:", v42, v43);
    goto LABEL_31;
  }
  if (a8 == 1)
  {
    v41 = v36;
    v42 = 1;
    v43 = 0;
    goto LABEL_30;
  }
LABEL_31:
  if (a10 == 2 && v66)
  {
    v44 = v36;
    v45 = 2;
    v46 = v66;
LABEL_36:
    objc_msgSend(v44, "setAccessibilityDescriptionMetadataBehavior:withAccessibilityDescription:", v45, v46);
    goto LABEL_37;
  }
  if (a10 == 1)
  {
    v44 = v36;
    v45 = 1;
    v46 = 0;
    goto LABEL_36;
  }
LABEL_37:
  if (v64)
    objc_msgSend(v36, "setVideoExportPreset:");
  objc_msgSend(v36, "progress");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addChild:withPendingUnitCount:", v47, a14);

  PHAssetExportRequestMediaFormatConversionManager();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __PHAssetExportRequestPerformMediaConversion_block_invoke;
  v68[3] = &unk_1E35DF520;
  v69 = v36;
  v70 = v24;
  v71 = v25;
  v72 = v27;
  objc_msgSend(v48, "enqueueConversionRequest:completionHandler:", v69, v68);

  v22 = v62;
LABEL_40:

}

uint64_t PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PHAssetExportRequest.m"), 773, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v5)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PHAssetExportRequest.m"), 774, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_9;
LABEL_3:
  if (objc_msgSend(v5, "flattenSlomoVideos") && objc_msgSend(v3, "isHighFrameRateVideo"))
  {
    objc_msgSend(v3, "fetchPropertySetsIfNeeded");
    objc_msgSend(v3, "adjustmentProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D75308];
    objc_msgSend(v6, "formatIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formatVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isRecognizedSlowMotionFormatWithIdentifier:version:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void PHAssetExportRequestPerformSlomoFlattening(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, char a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v23 = a2;
  v24 = a3;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v86 = a8;
  v85 = a11;
  v83 = a13;
  v82 = a15;
  v28 = a16;
  if (v22)
  {
    if (v23)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v53 = v27;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PHAssetExportRequest.m"), 788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoURL"));

    v27 = v53;
    if (v23)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v56 = v27;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("PHAssetExportRequest.m"), 789, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adjustmentsURL"));

  v27 = v56;
LABEL_3:
  if (v24)
  {
    if (a4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v59 = v27;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("PHAssetExportRequest.m"), 790, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

    v27 = v59;
    if (a4)
    {
LABEL_5:
      if (v25)
        goto LABEL_6;
      goto LABEL_31;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v62 = v27;
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("PHAssetExportRequest.m"), 791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitCount"));

  v27 = v62;
  if (v25)
  {
LABEL_6:
    if (v26)
      goto LABEL_7;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v68 = v27;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v69, CFSTR("PHAssetExportRequest.m"), 793, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    v27 = v68;
    if (v28)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v65 = v27;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("PHAssetExportRequest.m"), 792, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectory"));

  v27 = v65;
  if (!v26)
    goto LABEL_32;
LABEL_7:
  if (v28)
    goto LABEL_8;
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v71 = v27;
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("PHAssetExportRequest.m"), 794, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  v27 = v71;
LABEL_8:
  v95 = 0;
  v29 = PHAssetExportRequestCreateOutputDirectory(v25, &v95);
  v30 = v95;
  v84 = v25;
  if (v29)
  {
    v75 = v30;
    v78 = v24;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", 0x7FFFFFFFFFFFFFFFLL);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v23;
    v81 = v22;
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithURL:", v23);
    objc_msgSend(MEMORY[0x1E0D75270], "remakerOperationWithInputType:videoURL:imageURL:adjustmentData:", 3, v22, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x1E0D75278]);
    objc_msgSend(v32, "setOutputDirectoryURL:", v25);
    v77 = v26;
    objc_msgSend(v32, "setOutputFilename:", v26);
    v76 = v27;
    if (v27)
    {
      objc_msgSend(v32, "setExportPreset:", v27);
      v34 = v85;
      v33 = v86;
      v36 = v82;
      v35 = v83;
    }
    else
    {
      v34 = v85;
      v36 = v82;
      v35 = v83;
      if (a9)
        v41 = (_QWORD *)MEMORY[0x1E0C89E28];
      else
        v41 = (_QWORD *)MEMORY[0x1E0C89E98];
      objc_msgSend(v32, "setExportPreset:", *v41);
      v33 = v86;
    }
    objc_msgSend(v32, "setExportFileType:", v33);
    objc_msgSend(v32, "setShouldStripLocation:", a10 == 1);
    if (objc_msgSend(v32, "shouldStripLocation"))
      v42 = 0;
    else
      v42 = v34;
    objc_msgSend(v32, "setCustomLocation:", v42);
    objc_msgSend(v32, "setShouldStripCaption:", a12 == 1);
    if (objc_msgSend(v32, "shouldStripCaption"))
      v43 = 0;
    else
      v43 = v35;
    objc_msgSend(v32, "setCustomCaption:", v43);
    objc_msgSend(v32, "setShouldStripAccessibilityDescription:", a14 == 1);
    if (objc_msgSend(v32, "shouldStripAccessibilityDescription"))
      v44 = v36;
    else
      v44 = 0;
    objc_msgSend(v32, "setCustomAccessibilityLabel:", v44);
    v45 = (void *)MEMORY[0x1E0D75268];
    v96[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "remakerWithOperations:options:", v46, v32);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = MEMORY[0x1E0C809B0];
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke;
    v93[3] = &unk_1E35DF110;
    v94 = v47;
    v49 = v47;
    objc_msgSend(v73, "setCancellationHandler:", v93);
    v91[0] = v48;
    v91[1] = 3221225472;
    v91[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke_2;
    v91[3] = &unk_1E35D6320;
    v92 = v73;
    v87[0] = v48;
    v87[1] = 3221225472;
    v87[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke_3;
    v87[3] = &unk_1E35D9878;
    v89 = v92;
    v90 = v28;
    v88 = v31;
    v50 = v92;
    v51 = v31;
    objc_msgSend(v49, "remakeWithProgressHandler:completionHandler:", v91, v87);

    v40 = v79;
    v37 = v81;
    v26 = v77;
    v38 = v78;
    v27 = v76;
    v39 = v75;
  }
  else
  {
    v37 = v22;
    v38 = v24;
    v39 = v30;
    (*((void (**)(id, _QWORD, id))v28 + 2))(v28, 0, v30);
    v34 = v85;
    v40 = v23;
    v36 = v82;
    v35 = v83;
  }

}

void PHAssetExportRequestPerformGifConversion(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
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
  _QWORD v34[4];
  id v35;
  id v36;

  v11 = a1;
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PHAssetExportRequest.m"), 844, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoURL"));

    if (v12)
    {
LABEL_3:
      if (a3)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PHAssetExportRequest.m"), 845, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

  if (a3)
  {
LABEL_4:
    if (v13)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PHAssetExportRequest.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitCount"));

  if (v13)
  {
LABEL_5:
    if (v14)
      goto LABEL_6;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PHAssetExportRequest.m"), 848, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v15)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PHAssetExportRequest.m"), 847, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectory"));

  if (!v14)
    goto LABEL_15;
LABEL_6:
  if (v15)
    goto LABEL_7;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PHAssetExportRequest.m"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_7:
  v36 = 0;
  v16 = PHAssetExportRequestCreateOutputDirectory(v13, &v36);
  v17 = v36;
  if (v16)
  {
    objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("GIF"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0D11618];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __PHAssetExportRequestPerformGifConversion_block_invoke;
    v34[3] = &unk_1E35DD990;
    v35 = v15;
    objc_msgSend(v20, "generateGIFForVideoAtURL:destinationURL:completionHandler:", v11, v19, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addChild:withPendingUnitCount:", v21, a3);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v17);
  }

}

id PHAssetExportRequestError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHAssetExportRequestErrorDomain"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PHAssetExportRequestMediaFormatConversionManager()
{
  if (PHAssetExportRequestMediaFormatConversionManager_predicate != -1)
    dispatch_once(&PHAssetExportRequestMediaFormatConversionManager_predicate, &__block_literal_global_322);
  return (id)PHAssetExportRequestMediaFormatConversionManager__conversionManager;
}

uint64_t PHAssetCanPerformAdditionalProcessingOnAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  int v25;
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "disableMetadataCorrections"))
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_38:
      v10 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v3, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v6;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Metadata corrections are disabled for this exporting asset %{public}@, so skipping processing operations like metadata corrections.", (uint8_t *)&v25, 0xCu);
LABEL_37:

    goto LABEL_38;
  }
  objc_msgSend(v3, "uniformTypeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "mediaType") == 1)
  {
    if (PHAssetCanPerformAdditionalProcessingOnAsset_onceToken != -1)
      dispatch_once(&PHAssetCanPerformAdditionalProcessingOnAsset_onceToken, &__block_literal_global_2337);
    if ((objc_msgSend((id)PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats, "containsObject:", v5) & 1) == 0)
    {
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      objc_msgSend(v3, "uuid");
      v7 = objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v7;
      v27 = 2114;
      v28 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is not a supported readable format (%{public}@) for remaking, skipping processing operations like metadata corrections", (uint8_t *)&v25, 0x16u);
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject conformsToType:](v6, "conformsToType:", *MEMORY[0x1E0CEC4F8]))
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uuid");
        v8 = objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v8;
        v9 = "[PHAssetExportRequest] Asset %{public}@ is a GIF, so skipping processing operations like metadata corrections";
LABEL_29:
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v25, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (-[NSObject conformsToType:](v6, "conformsToType:", *MEMORY[0x1E0CEC580]))
    {
      v11 = objc_msgSend(v4, "allowMetadataConversionsForPNG");
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v12)
        {
          objc_msgSend(v3, "uuid");
          v8 = objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v8;
          v9 = "[PHAssetExportRequest] Asset %{public}@ is a PNG, so skipping processing operations like metadata corrections";
          goto LABEL_29;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (v12)
      {
        objc_msgSend(v3, "uuid");
        v13 = objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v13;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a PNG, allowing metadata corrections", (uint8_t *)&v25, 0xCu);

      }
    }
    objc_msgSend(v3, "originalFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uppercaseString");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D752F0], "panasonicRAWImageType");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(MEMORY[0x1E0D752F0], "panasonicRAWImageType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject conformsToType:](v6, "conformsToType:", v18) & 1) != 0)
      {
        v19 = -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("RAW"));

        if (v19)
        {
          PLPhotoKitGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
LABEL_35:

            goto LABEL_36;
          }
          objc_msgSend(v3, "uuid");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "originalFilename");
          v21 = objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v20;
          v27 = 2114;
          v28 = v21;
          _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ (Filename: %{public}@) is a Panasonic RAW image, which is unsupported. Skipping metadata corrections.", (uint8_t *)&v25, 0x16u);

LABEL_34:
          goto LABEL_35;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0D752F0], "heicSequenceType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSObject conformsToType:](v6, "conformsToType:", v22);

    if (v23)
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      objc_msgSend(v3, "uuid");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v20;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a HEICS, so skipping processing operations like metadata corrections", (uint8_t *)&v25, 0xCu);
      goto LABEL_34;
    }

LABEL_41:
    v10 = 1;
    goto LABEL_39;
  }
  if (objc_msgSend(v3, "mediaType") != 2)
    goto LABEL_41;
  if (PHAssetCanPerformAdditionalProcessingOnAsset_onceToken_269 != -1)
    dispatch_once(&PHAssetCanPerformAdditionalProcessingOnAsset_onceToken_269, &__block_literal_global_271);
  v10 = objc_msgSend((id)PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats, "containsObject:", v5);
LABEL_39:

  return v10;
}

BOOL _CreationDatesInLibraryAndOriginalMetadataAreSame(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  objc_msgSend(a1, "timeIntervalSince1970");
  v5 = v4;
  objc_msgSend(v3, "timeIntervalSince1970");
  v7 = v6;

  v8 = v5 - v7;
  if (v5 - v7 < 0.0)
    v8 = -(v5 - v7);
  return v8 <= 5.0;
}

uint64_t PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(void *a1, void *a2, int a3, int a4, void *a5, void *a6, _BOOL4 a7, _QWORD *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a5;
  v18 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(NSString *__strong, PHAsset *__strong, BOOL, BOOL, NSObject<NSCopying> *__strong, NSObject<NSCopying> *__strong, BOOL, NSObject<NSCopying> * _Nullable __autoreleasing * _Nullable)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PHAssetExportRequest.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (a3)
      goto LABEL_3;
LABEL_10:
    if (v17 && a4)
    {
      PLPhotoKitGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v24;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Based on internal debug settings, forcing caption to be baked in, even if the library and original caption are the same for asset: %{public}@.", buf, 0xCu);

      }
      if (!a8)
        goto LABEL_16;
    }
    else
    {
      if (!v17 || a7)
        goto LABEL_4;
      if (!a8)
      {
LABEL_16:
        v20 = CFSTR("Bake in Library Value");
        v19 = 2;
        goto LABEL_17;
      }
    }
    *a8 = (id)objc_msgSend(v17, "copy");
    goto LABEL_16;
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  a7 = v18 == 0;
LABEL_4:
  if (a8)
    *a8 = 0;
  v19 = !a7;
  if (a7)
    v20 = CFSTR("Do nothing");
  else
    v20 = CFSTR("Strip Metadata");
LABEL_17:
  PLPhotoKitGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v29 = v15;
    v30 = 2114;
    v31 = v26;
    v32 = 2114;
    v33 = v20;
    v34 = 2113;
    v35 = v17;
    v36 = 2113;
    v37 = v18;
    _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Metadata behavior for \"%{public}@\" for asset ID %{public}@ is to: [%{public}@]. Library value '%{private}@' Original value: '%{private}@'", buf, 0x34u);

  }
  return v19;
}

uint64_t _LocationsMatchUsingComparisonStrategy(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v5 == v6)
    goto LABEL_7;
  if (!a3)
  {
    objc_msgSend(v5, "coordinate");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "coordinate");
    v13 = v12;
    v15 = v14;
    if ((PHAssetLocationCoordinatesAreEqual(v9, v11, v12, v14) & 1) == 0)
    {
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 134284289;
        v19 = v9;
        v20 = 2049;
        v21 = v13;
        v22 = 2049;
        v23 = v11;
        v24 = 2049;
        v25 = v15;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Mismatch in Latitude (library: %{private}.8f, original: %{private}.8f), or Longitude (library: %{private}.8f, original: %{private}.8f).", (uint8_t *)&v18, 0x2Au);
      }

      goto LABEL_11;
    }
LABEL_7:
    v7 = 1;
    goto LABEL_12;
  }
  if (a3 == 2)
    goto LABEL_7;
  if (a3 != 1)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = objc_msgSend(v5, "isEqual:", v6);
LABEL_12:

  return v7;
}

void sub_199245648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t PHAssetExportRequestProcessingRequiredForAssetWithOptions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  char v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestProcessingRequiredForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PHAssetExportRequest.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v6)
      goto LABEL_3;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PHAssetExportRequestProcessingRequiredForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PHAssetExportRequest.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_26;
LABEL_3:
  v8 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v5, "uniformTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typeWithIdentifier:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  v11 = PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  v12 = PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  PHAssetExportRequestCustomDateForAssetWithOptions(v5, v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(v5, v6);
  objc_msgSend(v6, "videoExportPreset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v14;
  if ((objc_msgSend(v6, "includeAllAssetResources") & 1) != 0
    || (objc_msgSend(v6, "shouldExportUnmodifiedOriginalResources") & 1) != 0)
  {
    v16 = 0;
    v31 = 0;
  }
  else if (objc_msgSend(v6, "variant") == 2)
  {
    v16 = 1;
    v31 = 1;
  }
  else
  {
    if (objc_msgSend(v6, "variant") == 3)
      v24 = 1;
    else
      v24 = v14;
    if (v15)
      v24 = 1;
    if (v10)
      v24 = 1;
    if (v11)
      v24 = 1;
    if (v12)
      v24 = 1;
    if (v13)
      v24 = 1;
    v31 = v24;
    v16 = 1;
  }
  PLPhotoKitGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    v19 = objc_msgSend(v6, "variant");
    objc_msgSend(v6, "videoExportPreset");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v11;
    v22 = (void *)v20;
    *(_DWORD *)buf = 138545923;
    v34 = v18;
    v35 = 1024;
    v36 = v31 & 1;
    v37 = 2048;
    v38 = v10;
    v39 = 2048;
    v40 = v21;
    v41 = 2048;
    v42 = v12;
    v43 = 2113;
    v44 = v13;
    v45 = 1024;
    v46 = v16;
    v47 = 2048;
    v48 = v19;
    v7 = v29;
    v49 = 1024;
    v50 = v30;
    v51 = 2114;
    v52 = v20;
    v53 = 2114;
    v54 = v32;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Export request processing required for asset %{public}@: %{BOOL}d (metadataOperationLocation=%td, metadataOperationCaption=%td, metadataOperationCaptionAccessibilityDescription=%td, metadataChangeCustomDate=%{private}@, producingNewFilesForExport=%{BOOL}d, options.variant=%td, requiresSloMoFlattening=%{BOOL}d, videoExportPreset=%{public}@, type = %{public}@)", buf, 0x64u);

  }
  return v31 & 1;
}

const __CFString *PHAssetExportRequestStateDebugDescription(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("unknown");
  else
    return off_1E35D6488[a1];
}

const __CFString *PHAssetExportRequestAssetAvailabilityDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("unknown");
  else
    return off_1E35D6450[a1];
}

uint64_t PHAssetExportRequestPassthroughConversionIsSupportedByType(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (PHAssetExportRequestPassthroughConversionIsSupportedByType_predicate != -1)
    dispatch_once(&PHAssetExportRequestPassthroughConversionIsSupportedByType_predicate, &__block_literal_global_328);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v1, (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v7, "conformsToType:", v6);

        if ((v6 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

uint64_t PHOptionalVALocationAnalysisVersion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "vaLocationAnalysisVersion");
  else
    v2 = 0;

  return v2;
}

uint64_t PHMediaAnalysisImageVersionUsingFallback(void *a1)
{
  id v1;
  __int16 v2;
  unint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "mediaAnalysisImageVersion");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v1, "mediaAnalysisVersion");
    v2 = v3;
    if (v3 >= 0x8000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int16_t PHMediaAnalysisImageVersionUsingFallback(__strong id<PHMediaProcessingAlgorithmVersionProvider>)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PHPhotoLibrary+MediaProcessing.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaAnalysisVersion <= INT16_MAX"));

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t PHOptionalCaptionGenerationVersion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "captionGenerationVersion");
  else
    v2 = 0;

  return v2;
}

void *PHMediaProcessingAllKnownTaskIDs()
{
  return &unk_1E36570D8;
}

__CFString *PHMediaProcessingDescriptionForTaskID(uint64_t a1)
{
  __CFString *v3;

  v3 = CFSTR("unknown");
  switch(a1)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("MediaAnalysisVideo");
      return v3;
    case 2:
      return CFSTR("SceneAnalysis");
    case 3:
      return CFSTR("FaceAnalysis");
    case 4:
      return CFSTR("EffectsAnalysis");
    case 5:
      return CFSTR("Sceneprint");
    case 6:
      return CFSTR("VideoStabilization");
    case 7:
      return CFSTR("MultiWorkerAnalysis");
    case 8:
      return CFSTR("QuickFaceIdentification");
    case 9:
      return CFSTR("EmbeddingAnalysis");
    case 10:
      return CFSTR("OCRAnalysis");
    case 11:
      return CFSTR("MovieHighlightProcessing");
    case 12:
      return CFSTR("VisualSearchAnalysis");
    case 13:
      return CFSTR("FilesystemAnalysis");
    case 14:
      return CFSTR("FilesystemVideoAnalysis");
    case 15:
      return CFSTR("VideoCaptionAnalysis");
    case 16:
      return CFSTR("PECAnalysis");
    case 17:
      return CFSTR("MediaAnalysisImage");
    case 18:
      return CFSTR("PECLocationAnalysis");
    default:
      if (a1 == 0x7FFFFFFF)
        return CFSTR("UnifiedAnalysis");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown:%tu"), a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

void *PHMediaProcessingAllKnownTaskPriorities()
{
  return &unk_1E36570F0;
}

void sub_199249E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19924A180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2760(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2761(uint64_t a1)
{

}

uint64_t _loadURLIntoResult(int a1, int a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  char *v11;
  id v12;
  id *v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if ((a1 & 1) == 0 && (a2 & 1) == 0)
  {
    PLImageManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)";
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "%s called with no options to load, will no op", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", objc_msgSend(v14, "requestID"), CFSTR("%s called with no options to load, will no op"), "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)");
    v16 = 1;
    goto LABEL_35;
  }
  if (v11)
  {
    if (a1)
      objc_msgSend(v13[18], "setImageURL:", v11);
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14[18], "setImageData:", v17);
      if (!v17)
      {
        v16 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v17 = 0;
    }
    if (v12 && a5 != -1)
    {
      v19 = v14[18];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setExifOrientation:", v20);

      objc_msgSend(v14[18], "setUniformTypeIdentifier:", v12);
LABEL_33:
      v16 = 1;
      goto LABEL_34;
    }
    objc_msgSend(v14, "behaviorSpec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "onlyUseFetchedAssetPropertiesDuringChoosing");

    if ((v22 & 1) != 0)
      goto LABEL_33;
    if (v17)
    {
      v23 = PLGetOrientationAndUntransformedSizeFromImageData();
      v24 = 0;
      if ((v23 & 1) != 0)
      {
LABEL_26:
        v25 = v14[18];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setExifOrientation:", v26);

        objc_msgSend(v14[18], "setUniformTypeIdentifier:", v24);
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      v27 = PLGetOrientationAndUntransformedSizeFromImageURL();
      v24 = 0;
      if (v27)
        goto LABEL_26;
    }
    PLImageManagerGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "Reading image metadata failed for resource at URL: %@", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled())
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", objc_msgSend(v14, "requestID"), CFSTR("Reading image metadata failed for resource at URL: %@"), v11);
    goto LABEL_32;
  }
  PLImageManagerGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)";
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "%s called with nil URL", buf, 0xCu);
  }

  if (PHImageManagerRecordEnabled())
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", objc_msgSend(v14, "requestID"), CFSTR("%s called with nil URL"), "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)");
  v16 = 0;
LABEL_35:

  return v16;
}

void sub_19924C1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ___chooserDidPresentResourceIdentity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v9 = (id *)(a1 + 40);
  v10 = a6;
  v11 = a5;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "handleAvailabilityChangeForResource:url:info:error:", *(_QWORD *)(a1 + 32), v12, v11, v10);

}

uint64_t ___chooserDidPresentResourceIdentity_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "incrementImageCacheMissCount");
}

uint64_t ___loadImageFromStoreAndKey_block_invoke_152(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "incrementImageCacheHitCount");
}

void ___handleKeyUsageFailureDuringChoosing_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifierString");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("N");
    if (a2)
      v7 = CFSTR("Y");
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %@ Result of repair attempt: %@. Retrying request w/o hints...", buf, 0x16u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "requestID");
    objc_msgSend(*(id *)(a1 + 32), "identifierString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("N");
    if (a2)
      v12 = CFSTR("Y");
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v9, CFSTR("[RM]: %@ Result of repair attempt: %@. Retrying request w/o hints..."), v10, v12);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isSynchronous") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "configureWithError:", 0);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaRequest:didRequestRetryWithHintsAllowed:", *(_QWORD *)(a1 + 32), 0);

  }
}

uint64_t ___handleKeyUsageFailureDuringChoosing_block_invoke_168(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentNextQualifyingResource");
}

void sub_19924CA68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19924D908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3223(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3224(uint64_t a1)
{

}

void sub_199251958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3754(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3755(uint64_t a1)
{

}

void sub_199255770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t _AssetAvailabilityForAssetWithOptions(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PHInternalAssetExportRequest.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    if (v9)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PHInternalAssetExportRequest.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  if (!v8)
    goto LABEL_9;
LABEL_3:
  if (v9)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PHInternalAssetExportRequest.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceRetrievalRequest"));

LABEL_4:
  _PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "resourceAvailabilityForOptions:resourceInfo:", v10, a4);
  if (v11 == 2)
    v12 = 2;
  else
    v12 = v11 == 1;

  return v12;
}

PHResourceLocalAvailabilityRequestOptions *_PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(void *a1)
{
  id v1;
  PHResourceLocalAvailabilityRequestOptions *v2;
  void *v3;

  v1 = a1;
  v2 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  -[PHResourceLocalAvailabilityRequestOptions setTreatLivePhotoAsStill:](v2, "setTreatLivePhotoAsStill:", objc_msgSend(v1, "treatLivePhotoAsStill"));
  -[PHResourceLocalAvailabilityRequestOptions setDontAllowRAW:](v2, "setDontAllowRAW:", objc_msgSend(v1, "dontAllowRAW"));
  -[PHResourceLocalAvailabilityRequestOptions setIncludeAllAssetResources:](v2, "setIncludeAllAssetResources:", objc_msgSend(v1, "includeAllAssetResources"));
  -[PHResourceLocalAvailabilityRequestOptions setIncludeOriginalResourcesOnly:](v2, "setIncludeOriginalResourcesOnly:", objc_msgSend(v1, "shouldExportUnmodifiedOriginalResources"));
  objc_msgSend(v1, "resultHandlerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHResourceLocalAvailabilityRequestOptions setResultHandlerQueue:](v2, "setResultHandlerQueue:", v3);
  -[PHResourceLocalAvailabilityRequestOptions setAllowMissingVideoComplement:](v2, "setAllowMissingVideoComplement:", 1);
  return v2;
}

id _ResourceInfoToFileURLs(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<PHAssetExportRequestFileURLKey,NSURL *> *_ResourceInfoToFileURLs(NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,NSURL *> *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PHInternalAssetExportRequest.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceInfo"));

  }
  if (_ResourceInfoToFileURLs_onceToken != -1)
    dispatch_once(&_ResourceInfoToFileURLs_onceToken, &__block_literal_global_4027);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend((id)_ResourceInfoToFileURLs_fileURLKeysFromResourceInfoKeys, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t _PreflightMediaConversion(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;

  v5 = a1;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _PreflightMediaConversion(PHMediaFormatConversionSource *__strong, NSString * _Nullable __autoreleasing * _Nonnull, NSError * _Nullable __autoreleasing * _Nullable)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PHInternalAssetExportRequest.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compatibleUTI"));

  }
  objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0D47C48], "requestForSource:destinationCapabilities:error:", v5, v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v7)
    goto LABEL_6;
  PHAssetExportRequestMediaFormatConversionManager();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preflightConversionRequest:", v7);

  if (objc_msgSend(v7, "status") == 5)
  {
    objc_msgSend(v7, "error");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
LABEL_6:
    *a2 = 0;
    if (a3)
    {
      v8 = objc_retainAutorelease(v8);
      v11 = 0;
      v12 = 0;
      *a3 = v8;
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "backwardsCompatibilityStatus") == 2)
  {
    objc_msgSend(v7, "outputFileType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v12 = objc_retainAutorelease(v13);
  *a2 = v12;
  v11 = 1;
LABEL_13:

  return v11;
}

void sub_199259444(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t PHVideoComplementVisibilityStateIsHidden(char a1)
{
  return a1 & 1;
}

uint64_t PHVideoComplementVisibilityStateIsExplicit(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t PHVideoComplementVisibilityStateIsEvaluated(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t PHVideoComplementVisibilityStateHasFullEditingSupport(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t PHVideoComplementVisibilityStateIsPlayable(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D71880], "isVideoComplementVisibilityStatePlayable:hasAdjustments:", a1, a2);
}

BOOL PHVideoComplementVisibilityStateSupportsVariationChanges(char a1)
{
  return (a1 & 0xD) != 1;
}

uint64_t PHImportConcurrencyLimit()
{
  if (PHImportConcurrencyLimit_onceToken != -1)
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4570);
  return PHImportConcurrencyLimit_concurrencyLimit;
}

void PHImportDumpCGImageToURL(CGImage *a1, void *a2)
{
  void *v3;
  const __CFURL *v4;
  __CFString *v5;
  CGImageDestination *v6;

  v3 = (void *)*MEMORY[0x1E0CEC530];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CGImageDestinationCreateWithURL(v4, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, a1, 0);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
  }
}

const __CFString *stringForTrashedMask(uint64_t a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  result = 0;
  if (a1 > 255)
  {
    v3 = CFSTR("AdjustmentBasePairedVideoTrashed");
    v4 = CFSTR("DiagnosticFileTrashed");
    v5 = CFSTR("AdjutmentSecondaryDataTrashed");
    if (a1 != 0x10000)
      v5 = 0;
    if (a1 != 0x8000)
      v4 = v5;
    if (a1 != 0x4000)
      v3 = v4;
    v6 = CFSTR("PairedVideoTrashed");
    v7 = CFSTR("XMPTrashed");
    if (a1 != 0x2000)
      v7 = 0;
    if (a1 != 4096)
      v6 = v7;
    if (a1 < 0x4000)
      v3 = v6;
    v8 = CFSTR("AdjustedPairedVideoTrashed");
    v9 = CFSTR("AlternateImageTrashed");
    if (a1 != 2048)
      v9 = 0;
    if (a1 != 1024)
      v8 = v9;
    v10 = CFSTR("AdjustmentBaseVideoTrashed");
    v11 = CFSTR("AudioTrashed");
    if (a1 != 512)
      v11 = 0;
    if (a1 != 256)
      v10 = v11;
    if (a1 <= 1023)
      v8 = v10;
    if (a1 <= 4095)
      return v8;
    else
      return v3;
  }
  else if (a1 > 15)
  {
    if (a1 > 63)
    {
      v12 = CFSTR("AdjustmentBasePhotoTrashed");
      if (a1 != 128)
        v12 = 0;
      if (a1 == 64)
        return CFSTR("OriginalAdjustmentDataTrashed");
      else
        return v12;
    }
    else if (a1 == 16 || a1 == 32)
    {
      return &stru_1E35DFFF8;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("Untrashed");
        break;
      case 1:
        result = CFSTR("OriginalTrashed");
        break;
      case 2:
        result = CFSTR("AdjutmentDataTrashed");
        break;
      case 4:
        result = CFSTR("AdjustedImageTrashed");
        break;
      case 8:
        result = CFSTR("AdjustedVideoTrashed");
        break;
      default:
        return result;
    }
  }
  return result;
}

const __CFString *PHDebugStringForSearchResultType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("PHSearchResultTypeUndefined");
  else
    return off_1E35D6C60[a1 - 1];
}

const __CFString *PHDebugStringForSearchResultRetrievalType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("PHSearchResultRetrievalTypeUndefined");
  else
    return off_1E35D6C80[a1 - 1];
}

const __CFString *PHHumanReadableStringForSearchResultMatchType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E35D6C98[a1];
}

const __CFString *PHHumanReadableStringForSearchResultType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return off_1E35D6CB8[a1];
}

const __CFString *PHHumanReadableStringForSearchResultRetrievalType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E35D6CE0[a1];
}

void sub_19925F790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199260120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_199260810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5129(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5130(uint64_t a1)
{

}

void sub_19926146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

BOOL createObjectChangeRequestsFromXPCObject(void *a1, void *a2, const char *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a4;
  xpc_dictionary_get_value(a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v16 = a3;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "##### %s: %@", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __createObjectChangeRequestsFromXPCObject_block_invoke;
    v12[3] = &unk_1E35DEE78;
    v13 = v7;
    v14 = v8;
    xpc_array_apply(v9, v12);

  }
  return v9 != 0;
}

uint64_t __createObjectChangeRequestsFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = +[PHChangeRequestHelper changeRequestWithXPCDict:request:clientAuthorization:](PHChangeRequestHelper, "changeRequestWithXPCDict:request:clientAuthorization:", a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return 1;
}

void addObjectChangeRequests(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v7 = xpc_array_create(0, 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
          v14 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v13, "encodeToXPCDict:", v14, (_QWORD)v15);
          xpc_array_append_value(v7, v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    xpc_dictionary_set_value(v6, a3, v7);
  }

}

void sub_199265310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992653CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199265550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992665FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992666B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992667EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992668C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992669BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199266F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992670F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992671BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992674CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992677DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992678A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199267964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926A020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926ABD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19926AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19926C79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6064(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6065(uint64_t a1)
{

}

void sub_1992703AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19927053C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_199271268(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19927144C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6458(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6459(uint64_t a1)
{

}

void sub_199272FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199274524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *PHQuestionOptionsDebugDescription(uint64_t a1)
{
  int v1;
  __CFString *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!a1)
  {
    v2 = CFSTR("<none>");
    return v2;
  }
  v1 = a1;
  if (a1 == 533075965)
  {
    v2 = CFSTR("<all>");
    return v2;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v1 & 1) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("contact-matching"));
  if ((v1 & 2) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("contact-merging"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("person:(%@)"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;
  if ((v1 & 4) != 0)
  {
    objc_msgSend(v9, "addObject:", CFSTR("meaning"));
    if ((v1 & 8) == 0)
    {
LABEL_13:
      if ((v1 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_38;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v10, "addObject:", CFSTR("business-item"));
  if ((v1 & 0x10) == 0)
  {
LABEL_14:
    if ((v1 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v10, "addObject:", CFSTR("relationship"));
  if ((v1 & 0x20) == 0)
  {
LABEL_15:
    if ((v1 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v10, "addObject:", CFSTR("public-event"));
  if ((v1 & 0x40) == 0)
  {
LABEL_16:
    if ((v1 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v10, "addObject:", CFSTR("holiday"));
  if ((v1 & 0x80) == 0)
  {
LABEL_17:
    if ((v1 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v10, "addObject:", CFSTR("frequent-location"));
  if ((v1 & 0x100) == 0)
  {
LABEL_18:
    if ((v1 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v10, "addObject:", CFSTR("wallpaper"));
  if ((v1 & 0x200) == 0)
  {
LABEL_19:
    if ((v1 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v10, "addObject:", CFSTR("age-category"));
  if ((v1 & 0x400) == 0)
  {
LABEL_20:
    if ((v1 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v10, "addObject:", CFSTR("memory-quality"));
  if ((v1 & 0x800) == 0)
  {
LABEL_21:
    if ((v1 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v10, "addObject:", CFSTR("trip-key-asset"));
  if ((v1 & 0x1000) == 0)
  {
LABEL_22:
    if ((v1 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v10, "addObject:", CFSTR("pet"));
  if ((v1 & 0x2000) == 0)
  {
LABEL_23:
    if ((v1 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v10, "addObject:", CFSTR("featured-photo"));
  if ((v1 & 0x4000) == 0)
  {
LABEL_24:
    if ((v1 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v10, "addObject:", CFSTR("memory-music-quality"));
  if ((v1 & 0x8000) == 0)
  {
LABEL_25:
    if ((v1 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v10, "addObject:", CFSTR("memory-music-energy"));
  if ((v1 & 0x10000) == 0)
  {
LABEL_26:
    if ((v1 & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v10, "addObject:", CFSTR("social-groups"));
  if ((v1 & 0x20000) == 0)
  {
LABEL_27:
    if ((v1 & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v10, "addObject:", CFSTR("syndicated-assets"));
  if ((v1 & 0x40000) == 0)
  {
LABEL_28:
    if ((v1 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v10, "addObject:", CFSTR("person-activity-meaning"));
  if ((v1 & 0x80000) == 0)
  {
LABEL_29:
    if ((v1 & 0x100000) == 0)
      goto LABEL_30;
LABEL_54:
    objc_msgSend(v10, "addObject:", CFSTR("shared-library-start"));
    if ((v1 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_53:
  objc_msgSend(v10, "addObject:", CFSTR("shared-library-assets"));
  if ((v1 & 0x100000) != 0)
    goto LABEL_54;
LABEL_30:
  if ((v1 & 0x200000) != 0)
LABEL_31:
    objc_msgSend(v10, "addObject:", CFSTR("camera-library-switch"));
LABEL_32:
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("survey:(%@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@>"), v15);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PHStringFromPHAdjustmentStyleCastShort(int a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 <= 15)
  {
    if ((a1 - 1) > 0xE)
      v1 = CFSTR("PHAdjustmentStyleCastNone");
    else
      v1 = off_1E35D71D8[a1 - 1];
  }
  else
  {
    v1 = CFSTR("Unknown Style Cast");
  }
  -[__CFString substringFromIndex:](v1, "substringFromIndex:", objc_msgSend(CFSTR("PHAdjustmentStyleCast"), "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *PHStringFromCloudResourcePrefetchMode(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E35D7250[a1];
}

const __CFString *PHStringFromAnalysisCoordinatorFeature(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 1:
      result = CFSTR("PHAnalysisCoordinatorFeatureMemoriesCreation");
      break;
    case 2:
      result = CFSTR("PHAnalysisCoordinatorFeatureSearchIndexing");
      break;
    case 3:
      result = CFSTR("PHAnalysisCoordinatorFeatureSearchUI");
      break;
    case 4:
      result = CFSTR("PHAnalysisCoordinatorFeaturePeopleAlbum");
      break;
    case 5:
      result = CFSTR("PHAnalysisCoordinatorFeatureInfoPanel");
      break;
    case 6:
      result = CFSTR("PHAnalysisCoordinatorFeatureGlobalProcessing");
      break;
    default:
      if (a1 == 100)
        result = CFSTR("PHAnalysisCoordinatorFeatureUnitTest");
      else
        result = CFSTR("PHAnalysisCoordinatorFeatureNone");
      break;
  }
  return result;
}

CGImage *_createDecodedImageUsingImageIOWithFileUrlOrData(void *a1, void *a2, void *a3, uint64_t a4, int a5, int a6, uint64_t *a7, uint64_t a8, _QWORD *a9)
{
  id v16;
  const __CFURL *v17;
  const __CFData *v18;
  const __CFData *v19;
  CGImageSourceRef v20;
  CGImageSource *v21;
  NSObject *v22;
  uint64_t v23;
  double Width;
  double Height;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CGImage *ThumbnailAtIndex;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  size_t v37;
  size_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  uint64_t v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  CGImageRef v64;
  uint64_t v65;
  const void *v66;
  uint64_t v67;
  CGImage *v68;
  NSObject *v69;
  uint64_t GainMapFromImageSource;
  NSObject *v71;
  const __CFString *v72;
  uint64_t v74;
  int *v75;
  int v76;
  uint8_t buf[4];
  const __CFString *v78;
  _QWORD v79[3];
  _QWORD v80[4];
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v80[3] = *MEMORY[0x1E0C80C00];
  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = v18;
  if (v18)
  {
    v20 = CGImageSourceCreateWithData(v18, 0);
  }
  else
  {
    if (!v17)
      goto LABEL_17;
    v20 = CGImageSourceCreateWithURL(v17, 0);
  }
  v21 = v20;
  if (v20)
  {
    v76 = a6;
    v74 = a8;
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = MEMORY[0x1E0C9AAB0];
    -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD178]);
    -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBD190]);
    if (a4 >= 1)
    {
      if (objc_msgSend(v16, "shouldCrop", v74))
      {
        objc_msgSend(v16, "normalizedCropRect");
        Width = CGRectGetWidth(v81);
        objc_msgSend(v16, "normalizedCropRect");
        Height = CGRectGetHeight(v82);
        if (Width >= Height)
          Height = Width;
        a4 = (uint64_t)((double)a4 / Height);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CBD2A0]);

    }
    if (a5)
      -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD268]);
    if (objc_msgSend(v16, "decodeAsHDR", v74))
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", CFSTR("com.apple.photos.DisableFlexGTC"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v28, "BOOLValue") ^ 1;
      }
      else
      {
        v29 = 0;
      }
      -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CBD1B0], *MEMORY[0x1E0CBD1A0]);
      v79[0] = *MEMORY[0x1E0CBD2E0];
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v16, "targetHDRHeadroom");
      objc_msgSend(v31, "numberWithFloat:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v32;
      v79[1] = *MEMORY[0x1E0CBC698];
      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v16, "hdrGain");
      objc_msgSend(v33, "numberWithFloat:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v34;
      v79[2] = *MEMORY[0x1E0CBC6B0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v80[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CBD1A8]);

    }
    else
    {
      -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CBD1B8], *MEMORY[0x1E0CBD1A0]);
    }
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v21, 0, (CFDictionaryRef)v22);
    if (objc_msgSend(v16, "shouldCrop"))
    {
      v37 = CGImageGetWidth(ThumbnailAtIndex);
      v38 = CGImageGetHeight(ThumbnailAtIndex);
      objc_msgSend(v16, "targetSize");
      v40 = v39;
      v42 = v41;
      objc_msgSend(v16, "normalizedCropRect");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v51 = objc_msgSend(v16, "contentMode");
      v83.origin.x = v44;
      v83.origin.y = v46;
      v83.size.width = v48;
      v83.size.height = v50;
      v52 = CGRectEqualToRect(v83, *MEMORY[0x1E0C9D648]);
      v53 = 0.0;
      if (v52)
        v54 = 1.0;
      else
        v54 = v50;
      if (v52)
        v55 = 1.0;
      else
        v55 = v48;
      if (v52)
        v56 = 0.0;
      else
        v56 = v46;
      if (v52)
        v57 = 0.0;
      else
        v57 = v44;
      v58 = v57 * (double)v37;
      v59 = v56 * (double)v38;
      v60 = v55 * (double)v37;
      v61 = v54 * (double)v38;
      if (v51 == 1)
      {
        if (v60 - v40 >= 0.0)
          v62 = (v60 - v40) * 0.5;
        else
          v62 = 0.0;
        if (v61 - v42 >= 0.0)
          v53 = (v61 - v42) * 0.5;
        *(CGRect *)&v58 = CGRectInset(*(CGRect *)&v58, v62, v53);
      }
      v63 = v76;
      v84 = CGRectIntegral(*(CGRect *)&v58);
      v64 = CGImageCreateWithImageInRect(ThumbnailAtIndex, v84);
      CGImageRelease(ThumbnailAtIndex);
      ThumbnailAtIndex = v64;
    }
    else
    {
      v63 = v76;
      if (CGImageGetImageProvider())
      {
        v65 = CGImageProviderCopyIOSurface();
        if (v65)
        {
          v66 = (const void *)v65;
          v67 = CGImageCreateFromIOSurface();
          if (v67)
          {
            v68 = (CGImage *)v67;
            CGImageRelease(ThumbnailAtIndex);
            ThumbnailAtIndex = v68;
          }
          CFRelease(v66);
        }
      }
    }
    if (a7 && v63 && ThumbnailAtIndex)
    {
      PLImageManagerGetLog();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v69, OS_LOG_TYPE_DEBUG, "[RM]: PHImageIODecoder - starting aux image decode", buf, 2u);
      }

      GainMapFromImageSource = _createGainMapFromImageSource(v21, v75, a9);
      if (!GainMapFromImageSource)
      {
        PLImageManagerGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v72 = CFSTR("data");
          if (!v19)
            v72 = (const __CFString *)v17;
          *(_DWORD *)buf = 138412290;
          v78 = v72;
          _os_log_impl(&dword_1991EC000, v71, OS_LOG_TYPE_ERROR, "[RM]: PHImageIODecoder - Failed to load aux image from %@", buf, 0xCu);
        }

      }
      *a7 = GainMapFromImageSource;
    }
    CFRelease(v21);
    goto LABEL_62;
  }
LABEL_17:
  PLImageManagerGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "[RM]: PHImageIODecoder - Unable to create image source", buf, 2u);
  }
  ThumbnailAtIndex = 0;
LABEL_62:

  return ThumbnailAtIndex;
}

uint64_t _createGainMapFromImageSource(CGImageSource *a1, int *a2, _QWORD *a3)
{
  size_t PrimaryImageIndex;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];

  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a1);
  v7 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a1, PrimaryImageIndex, (CFStringRef)*MEMORY[0x1E0CBC710]);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:", a1, 0, 13, 0, 0);
  v10 = v9;
  if (!v9)
  {
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Unable to check for gain map's average pixel luminance", v16, 2u);
    }

    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "hdrGainMapPercentageValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "orientation"))
  {
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  v12 = objc_msgSend(v10, "orientation");
LABEL_10:
  v13 = objc_msgSend(MEMORY[0x1E0D75130], "createPixelBufferFromAuxiliaryImageInfo:", v8);
  CFRelease(v8);
  if (a2)
    *a2 = v12;
  if (a3)
    *a3 = objc_retainAutorelease(v11);

  return v13;
}

id PHCollectionPresentationHintsStringsFromSocialRelationships(char a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a1 & 1) != 0)
  {
    objc_msgSend(CFSTR("PHCollectionPresentationHintsSocialRelationshipsFamily"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("PHCollectionPresentationHintsSocialRelationships"), &stru_1E35DFFF8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  if ((a1 & 2) != 0)
  {
    objc_msgSend(CFSTR("PHCollectionPresentationHintsSocialRelationshipsFriends"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("PHCollectionPresentationHintsSocialRelationships"), &stru_1E35DFFF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

id PHCollectionPresentationHintsStringFromTripType(uint64_t a1)
{
  const __CFString *v1;
  __CFString *v2;

  v1 = CFSTR("PHCollectionPresentationHintsTripTypeUnknown");
  if (a1 == 1)
    v1 = CFSTR("PHCollectionPresentationHintsTripTypeTrip");
  if (a1 == 2)
    v2 = CFSTR("PHCollectionPresentationHintsTripTypeRecurringTrip");
  else
    v2 = (__CFString *)v1;
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PHCollectionPresentationHintsTripType"), &stru_1E35DFFF8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PHCollectionPresentationHintsStringFromQualityCategory(uint64_t a1)
{
  __CFString *v1;

  if ((unint64_t)(a1 - 1) > 2)
    v1 = CFSTR("PHCollectionPresentationHintsQualityCategoryNone");
  else
    v1 = off_1E35D7328[a1 - 1];
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PHCollectionPresentationHintsQualityCategory"), &stru_1E35DFFF8);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_199279C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19927BEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7729(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7730(uint64_t a1)
{

}

void sub_19927D120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7891(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7892(uint64_t a1)
{

}

void sub_19927F844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&STACK[0x380], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Unwind_Resume(a1);
}

id PLObjectIDOrUUIDFromPHObject(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(v1, "objectID");
  else
    objc_msgSend(v1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1992841F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199284344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199284760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1992859EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8379(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8380(uint64_t a1)
{

}

void __cpl_dispatch_async_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEBEADC]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_19928C884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19928CE04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_19928D8A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19928EDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9052(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9053(uint64_t a1)
{

}

void sub_19928F2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199290744(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_199292324(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_199292BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_199294A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199294C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199294DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9680(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9681(uint64_t a1)
{

}

const __CFString *PHShortDescriptionForPhotosHighlightKind(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E35D7A70[a1];
}

const __CFString *PHShortDescriptionForPhotosHighlightType(unsigned int a1)
{
  if (a1 > 7)
    return CFSTR("Unknown");
  else
    return off_1E35D7A90[a1];
}

const __CFString *PHShortDescriptionForPhotosHighlightCategory(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 1)
    v1 = CFSTR("Recent");
  if (a1)
    return v1;
  else
    return CFSTR("Default");
}

const __CFString *PHShortDescriptionForPhotosHighlightEnrichmentState(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return off_1E35D7AD0[a1];
}

const __CFString *PHShortDescriptionForPhotosHighlightVisibilityState(__int16 a1)
{
  if ((unsigned __int16)(a1 - 1) > 3u)
    return CFSTR("Not Visibile");
  else
    return off_1E35D7AF8[(unsigned __int16)(a1 - 1)];
}

const __CFString *PHDescriptionForSharingComposition(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E35D7B18[a1];
}

const __CFString *PHDescriptionForSharingFilter(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E35D7B30[a1];
}

void sub_199297880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199297BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9867(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9868(uint64_t a1)
{

}

void sub_199298AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199298D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10022(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10023(uint64_t a1)
{

}

void sub_199299044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHErrorIsXPCConnectionInvalidOrInterrupted(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0D11268];
  v7[0] = *MEMORY[0x1E0CB28A8];
  v7[1] = v1;
  v8[0] = &unk_1E36571B0;
  v8[1] = &unk_1E36571C8;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PLErrorOrUnderlyingErrorMatchesCodesByDomain();

  return v5;
}

uint64_t PHErrorIsGenerateAdjustmentFileNotFound()
{
  return PLErrorOrUnderlyingErrorHasDomainAndCode();
}

id PHPublicImageManagerErrorFromError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (PHErrorIsMediaServerDisconnected())
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB3388];
    v8[0] = *MEMORY[0x1E0CB2938];
    v8[1] = v4;
    v9[0] = CFSTR("Media server disconnected");
    v9[1] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3301, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PHPublicErrorFromError(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id PHDescriptionsForResourceTypes(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        _PHAssetResourceTypeDescription(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "integerValue", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

const __CFString *_PHAssetResourceTypeDescription(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = CFSTR("photo");
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("video");
      break;
    case 2:
      result = CFSTR("audio");
      break;
    case 3:
      result = CFSTR("photo_alt");
      break;
    case 4:
      result = CFSTR("photo_full");
      break;
    case 5:
      result = CFSTR("video_full");
      break;
    case 6:
      result = CFSTR("adjustment");
      break;
    case 7:
      result = CFSTR("photo_base");
      break;
    case 8:
      result = CFSTR("video_cmpl");
      break;
    case 9:
      result = CFSTR("video_cmpl_full");
      break;
    case 10:
      result = CFSTR("video_cmpl_base");
      break;
    case 11:
      result = CFSTR("video_base");
      break;
    case 12:
      result = CFSTR("photo_over");
      break;
    case 13:
      result = CFSTR("video_over");
      break;
    case 14:
      result = CFSTR("video_cmpl_over");
      break;
    case 15:
      result = CFSTR("original_adjustment");
      break;
    case 16:
      result = CFSTR("xmp");
      break;
    case 17:
      result = CFSTR("slm");
      break;
    case 18:
      result = CFSTR("photo_proxy");
      break;
    case 19:
      result = CFSTR("photo_alchemist");
      break;
    default:
      switch((unint64_t)CFSTR("photo"))
      {
        case 'e':
          result = CFSTR("tablethumb");
          break;
        case 'f':
          result = CFSTR("masterthumb");
          break;
        case 'g':
          result = CFSTR("derivative");
          break;
        case 'h':
          result = CFSTR("mediametadata_orig");
          break;
        case 'i':
          result = CFSTR("mediametadata_curr");
          break;
        case 'j':
          result = CFSTR("video_metadata");
          break;
        case 'k':
          result = CFSTR("deferred_preview_img");
          break;
        case 'l':
          result = CFSTR("adjustment_blob");
          break;
        case 'm':
          result = CFSTR("wallpaper_comp");
          break;
        case 'n':
          result = CFSTR("adjustment_2nd");
          break;
        case 'p':
          result = CFSTR("compute_sync");
          break;
        case 'r':
          result = CFSTR("generative_playground_face_resources");
          break;
        default:
          result = CFSTR("unknown");
          break;
      }
      break;
  }
  return result;
}

const __CFString *PHAssetResourceAnalysisTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("small");
  else
    return off_1E35D7CB8[a1 - 1];
}

id PHUniformTypesForResourceType(uint64_t a1)
{
  void *v1;
  unint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 1:
    case 4:
    case 5:
    case 8:
    case 13:
    case 19:
    case 20:
      objc_msgSend(MEMORY[0x1E0D752F0], "supportedImageTypes");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
      objc_msgSend(MEMORY[0x1E0D752F0], "supportedMovieTypes");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0D752F0], "supportedAudioTypes");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
    case 16:
    case 17:
    case 18:
      goto LABEL_6;
    default:
      v1 = 0;
      v3 = a1 - 108;
      if (v3 <= 6 && ((1 << v3) & 0x57) != 0)
      {
LABEL_6:
        v5[0] = *MEMORY[0x1E0CEC4A0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
        v1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v1;
}

uint64_t PHUniformTypeConformsToResourceType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  PHUniformTypesForResourceType(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0D752F0], "type:conformsToOneOfTypes:", v3, v4);

  return v5;
}

uint64_t PHIsImageAssetResourceType(unint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if (a1 <= 0x14)
  {
    if (((1 << a1) & 0x1DECC) != 0)
      return 0;
    if (((1 << a1) & 0x182132) != 0)
      return result;
  }
  v3 = a1 - 107;
  if (v3 > 7 || ((1 << v3) & 0xAE) != 0 || v3)
    return 0;
  return result;
}

BOOL PHIsVideoAssetResourceType(unint64_t a1)
{
  return a1 <= 0x14 && ((1 << a1) & 0x1921BA) == 0 && ((1 << a1) & 0xDE44) != 0;
}

BOOL PHAssetResourceTypeClientCanAppendToOrDeleteFromAsset(uint64_t a1)
{
  return a1 == 20 || a1 == 114 || a1 == 109;
}

uint64_t ResourceRecipeIDForDeletableAssetResourceType(uint64_t a1)
{
  int v1;
  unsigned int v2;

  if (a1 == 109)
    v1 = 327687;
  else
    v1 = 0;
  if (a1 == 114)
    v2 = 327693;
  else
    v2 = v1;
  if (a1 == 20)
    return 66137;
  else
    return v2;
}

id PathForDeletableAssetResourceType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  switch(a2)
  {
    case 20:
      objc_msgSend(v3, "pathForAlchemistImage");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 114:
      objc_msgSend(v3, "pathForGenerativePlaygroundFaceResourcesFile");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 109:
      objc_msgSend(v3, "pathForWallpaperComputeResourcesFile");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      goto LABEL_9;
  }
  v6 = (void *)v5;
LABEL_9:

  return v6;
}

void sub_19929DB90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10671(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10672(uint64_t a1)
{

}

void sub_19929E234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19929E470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19929EF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, id *a14)
{
  id *v14;
  uint64_t v15;

  objc_destroyWeak(location);
  objc_destroyWeak(v14);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x218]);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose((const void *)(v15 - 224), 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_19929F524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_19929FCE0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x228], 8);
  objc_destroyWeak((id *)&STACK[0x248]);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

void sub_1992A019C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1992A063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10890(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10891(uint64_t a1)
{

}

void sub_1992A09BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _FetchableResourcesForAsset(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:", v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideo"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "type", (_QWORD)v13) != 106)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

void sub_1992A1234(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AssetResourceIsReallyLocallyAvailable(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "isLocallyAvailable"))
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v1, "privateFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0);

  if ((v3 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v1;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Asset resource %@ claims to be locally available, but it's fileURL is not on disk. Treating as NOT available.", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

uint64_t _AssetVersionFromRequestOptions(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "includeAllAssetResources") & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "includeOriginalResourcesOnly"))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1992A1A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(v27);
  _Block_object_dispose((const void *)(v28 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1992A1E54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _PHResourceLocalAvailabilityRequestError(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2938]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHResourceLocalAvailabilityRequestErrorDomain"), a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *_PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(unint64_t a1)
{
  if (a1 < 3)
    return off_1E35D82D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown resource availability type: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1992A3668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992A4A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992A59A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_PHResourceLocalAvailabilityRequestResourceTypeDescription(unint64_t a1)
{
  if (a1 < 0x17)
    return off_1E35D8310[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown resource type %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1992A6700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PHFullScreenSizeForScreen(void *a1, _QWORD *a2)
{
  id v3;

  v3 = a1;
  DCIM_boundsFromScreen();
  DCIM_scaleFromScreen();

  if (a2)
    *a2 = 0;
}

void sub_1992AA0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992ADF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992AE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992AE2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992AED3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11312(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11313(uint64_t a1)
{

}

uint64_t PHMemoryValidatedMemoryCategory(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  if (a1 > 200)
  {
    if ((unint64_t)(a1 - 201) >= 0x15 && (unint64_t)(a1 - 301) >= 2 && a1 != 401)
      return v1;
    return a1;
  }
  if ((unint64_t)a1 <= 0x20 && a1 != 22 || (unint64_t)(a1 - 100) < 3)
    return a1;
  return v1;
}

uint64_t PHMemoryValidatedMemorySubcategory(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  if (a1 <= 300)
  {
    if ((unint64_t)(a1 - 201) >= 0x12 && (unint64_t)(a1 - 101) >= 3 && a1)
      return v1;
    return a1;
  }
  if (a1 > 999)
  {
    if ((unint64_t)(a1 - 1000) < 4 || a1 == 1100)
      return a1;
  }
  else if ((unint64_t)(a1 - 401) < 4 || (unint64_t)(a1 - 301) < 3)
  {
    return a1;
  }
  return v1;
}

const __CFString *PHMemoryPendingStateDescription(unsigned int a1)
{
  if (a1 > 3)
    return &stru_1E35DFFF8;
  else
    return off_1E35D8558[a1];
}

const __CFString *PHMemoryCreationTypeDescription(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("?");
  if (a1 == 1)
    v1 = CFSTR("Generative");
  if (a1)
    return v1;
  else
    return CFSTR("Default");
}

BOOL PHMemoryCategoryIsDisabled(unint64_t a1)
{
  _BOOL8 result;

  if (a1 > 0x64)
    return 1;
  result = 1;
  if (a1 > 0x20 || ((1 << a1) & 0x100008824) == 0)
    return a1 == 100;
  return result;
}

uint64_t PHMemoryFeaturedStateFromPLMemoryFeaturedState(uint64_t result)
{
  if (result >= 3)
    return -1;
  else
    return result;
}

uint64_t PLMemoryFeaturedStateFromPHMemoryFeaturedState(unint64_t a1)
{
  if (a1 >= 3)
    return -1;
  else
    return (__int16)a1;
}

void sub_1992B0F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992B121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992B13A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11647(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11648(uint64_t a1)
{

}

void sub_1992B9BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1992BA60C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1992BA6C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1992BB170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1992BC828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992BC93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992BCA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992BD854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992BDC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1992BE8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t sShortObjectID_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pl_shortURI");
}

uint64_t __Block_byref_object_copy__12443(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12444(uint64_t a1)
{

}

void _addOIDsWithEntityNames(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "entity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "containsObject:", v14);

        if (v15)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

void copyPropertiesFromObjectAToObjectB(void *a1, void *a2)
{
  id v3;
  id v4;
  objc_class *v5;
  objc_property_t *v6;
  objc_class *v7;
  unint64_t i;
  const char *Name;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  unsigned int outCount;

  v3 = a1;
  v4 = a2;
  outCount = 0;
  v5 = (objc_class *)objc_opt_class();
  v6 = class_copyPropertyList(v5, &outCount);
  v14 = 0;
  v7 = (objc_class *)objc_opt_class();
  class_copyPropertyList(v7, &v14);
  if (outCount != v14)
    __assert_rtn("copyPropertiesFromObjectAToObjectB", "PHAssetCreationRequest.m", 269, "matched");
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v6[i]);
      if (Name)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Name, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKeyPath:", v13, v10);

      }
    }
  }
  free(v6);

}

void sub_1992C5264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1992C6E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1992C7AD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1992C8400(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1992C8C4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1992C8FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992CC2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1992D1370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 224), 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1992D1F74(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const __CFString *a16, int buf, __int128 a18)
{
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(a1);
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      buf = 138543618;
      WORD2(a18) = 2112;
      *(_QWORD *)((char *)&a18 + 6) = v18;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Failed to validate UUID '%{public}@' is well formed, exception %@", (uint8_t *)&buf, 0x16u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    a15 = *MEMORY[0x1E0CB2938];
    a16 = CFSTR("Malformed UUID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a16, &a15, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3140, v21);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1992D1C9CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13099(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13100(uint64_t a1)
{

}

void sub_1992D896C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id PHImageDataFromImageAsScreenshot(void *a1, int a2)
{
  id v3;
  CGImage *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = (CGImage *)DCIM_CGImageRefFromPLImage();
  if (a2 && v4)
  {
    CGImageGetUTType(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC580]),
          v6,
          (v7 & 1) == 0))
    {
      v8 = (void *)DCIM_newPNGRepresentationWithPLImage();
      v9 = (void *)DCIM_newPLImageWithData();
      if (v9)
        DCIM_CGImageRefFromPLImage();

    }
  }
  MEMORY[0x19AEBDA80](v3);
  PLExifOrientationFromImageOrientation();
  imageDataFromImageRef();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t _PrimaryPLResourceTypeForPrimaryPHResourceType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF)
    return 31;
  else
    return dword_19944A8A0[a1 - 1];
}

void sub_1992D9324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id resourceIdentifierForURL(void *a1)
{
  int v1;
  id v2;
  void *v3;
  id v4;
  id v6;

  v6 = 0;
  v1 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99948], 0);
  v2 = v6;
  v3 = v2;
  v4 = 0;
  if (v1)
    v4 = v2;

  return v4;
}

void sub_1992DEFB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1992DF538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1992DF878(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1992E0F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1992E1938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992E1D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992E2038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1992E2148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14626(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14627(uint64_t a1)
{

}

uint64_t PHSearchSuggestionCategoriesTypeForPLSearchSuggestionCategoriesType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0x29)
    return 0;
  return result;
}

const __CFString *PLDebugStringForPHSearchSuggestionCategoriesType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x28)
    return CFSTR("PHSearchSuggestionCategoriesTypeUndefined");
  else
    return off_1E35D8E08[a1 - 1];
}

void sub_1992E51B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1992E74D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15451(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15452(uint64_t a1)
{

}

uint64_t PHDeviceSupportsRAW()
{
  if (PHDeviceSupportsRAW_onceToken != -1)
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_16549);
  return PHDeviceSupportsRAW_deviceSupportsRAW;
}

uint64_t _PHAssetResourceIsTopClassResource(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t IsHighestQuality;

  v1 = a1;
  objc_msgSend(v1, "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "storeClassID");

  if (v3 == 2)
  {
    objc_msgSend(v1, "dataStoreSubtype");
    IsHighestQuality = PLSharedStreamsResourceTypeIsHighestQuality();
  }
  else
  {
    IsHighestQuality = (objc_msgSend(v1, "isDerivative") & 1) == 0
                    && objc_msgSend(v1, "recipeID") != 65946
                    && objc_msgSend(v1, "recipeID") != 65948
                    || objc_msgSend(v1, "resourceType") == 9;
  }

  return IsHighestQuality;
}

id _PHAssetResourceOriginalFilenameFromBasePlusUTI(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0D71880], "preferredFileExtensionForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "stringByAppendingPathExtension:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Unknown file extension for uti: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v8 = v7;
  }

  return v8;
}

id _PHAssetResourceOriginalFilenameFromBasePlusAsset(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v5;
  objc_msgSend(v6, "originalFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "originalFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
    {
      objc_msgSend(v11, "lowercaseString");
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }

    objc_msgSend(v7, "stringByAppendingPathExtension:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "originalFilename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Asset original filename %{public}@ has no path extension", (uint8_t *)&v18, 0xCu);

    }
    v14 = v7;
  }

  return v14;
}

void sub_199304258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16851(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16852(uint64_t a1)
{

}

void sub_19930705C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17005(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17006(uint64_t a1)
{

}

void sub_19930834C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_199309AB4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Unwind_Resume(a1);
}

void sub_199309D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199309F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19930A158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19930C5A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19930C778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19930D5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19930D754(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19930D8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17296(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17297(uint64_t a1)
{

}

void sub_19930E648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PHStringForMemoryMood(__int16 a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Dreamy"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Sentimental"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("Gentle"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("Chill"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "addObject:", CFSTR("Neutral"));
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "addObject:", CFSTR("Happy"));
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "addObject:", CFSTR("Uplifting"));
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "addObject:", CFSTR("Club"));
    if ((a1 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "addObject:", CFSTR("Epic"));
  if ((a1 & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((a1 & 0x200) != 0)
LABEL_11:
    objc_msgSend(v3, "addObject:", CFSTR("Extreme"));
LABEL_12:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t PHMemoryMoodForString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(", "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (!v3)
      goto LABEL_30;
    v4 = v3;
    v10 = v1;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Dreamy")))
        {
          v5 |= 1uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Sentimental")))
        {
          v5 |= 2uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Gentle")))
        {
          v5 |= 4uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Chill")))
        {
          v5 |= 8uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Neutral")))
        {
          v5 |= 0x10uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Happy")))
        {
          v5 |= 0x20uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Uplifting")))
        {
          v5 |= 0x40uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Epic")))
        {
          v5 |= 0x80uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Club")))
        {
          v5 |= 0x100uLL;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Extreme")))
        {
          v5 |= 0x200uLL;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
    v1 = v10;
    if (!v5)
    {
LABEL_30:
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Party")) & 1) != 0)
      {
        v5 = 256;
      }
      else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Action")) & 1) != 0)
      {
        v5 = 512;
      }
      else
      {
        v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("Ethereal"));
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id PHFetchDictionaryAccessingMutableCopy(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(v1, "mutableCopy");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "mutableAccessingCopy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v3 = v2;

  return v3;
}

uint64_t __Block_byref_object_copy__17686(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17687(uint64_t a1)
{

}

void sub_199310790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199310FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19931161C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199311F98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_199315258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1993158CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199315CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_199316584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  void *v69;

  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_199316F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1993170E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18234(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18235(uint64_t a1)
{

}

id __copy_helper_block_e8_64n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = result;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return result;
}

void __destroy_helper_block_e8_64n4_8_s0(uint64_t a1)
{

}

void sub_19931989C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_199319FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19931B610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19931B718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19931C3C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _classNameCompare(objc_class *a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  NSStringFromClass(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "caseInsensitiveCompare:", v5);
  return v6;
}

void sub_19931C940(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19931CFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHAuthorizationStatusFromPhotosAccessAllowedResult(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_19944A9F0[a1];
}

const __CFString *PHStringFromAuthorizationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("not determined");
  else
    return off_1E35D9C10[a1 - 1];
}

BOOL PHShouldAllowAccessWithAuthorizationStatus(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t PHAccessLevelFromPLPhotosAccessScopeOptions(uint64_t a1)
{
  if (a1 == 1)
    return 1;
  else
    return 2;
}

void sub_19931E51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18807(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18808(uint64_t a1)
{

}

void sub_19931F21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_19931F508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19931F6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19931F840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199321198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199321280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199322568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993228F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19932326C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_199324844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199325AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Unwind_Resume(a1);
}

void sub_19932688C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199326C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19039(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19040(uint64_t a1)
{

}

id PHAssetMediaAnalysisStringsWithMultipleAudioClassifications(int a1)
{
  id v2;
  int v3;
  void *v4;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a1 >= 1)
    {
      LOWORD(v3) = 1;
      do
      {
        if (((unsigned __int16)v3 & (unsigned __int16)a1) != 0)
        {
          PHAssetMediaAnalysisStringWithSingleAudioClassification((__int16)v3);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v4);

        }
        v3 = (__int16)(2 * v3);
      }
      while (v3 <= a1 && v3 != 0);
    }
  }
  else
  {
    v7[0] = CFSTR("None");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

const __CFString *PHAssetMediaAnalysisStringWithSingleAudioClassification(int a1)
{
  const __CFString *result;

  result = CFSTR("None");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("Applause");
      break;
    case 2:
      result = CFSTR("Babble");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      result = CFSTR("Cheering");
      break;
    case 8:
      result = CFSTR("Laughter");
      break;
    default:
      if (a1 == 16)
      {
        result = CFSTR("Speech");
      }
      else if (a1 == 32)
      {
        result = CFSTR("Music");
      }
      else
      {
LABEL_6:
        result = CFSTR("Unknown");
      }
      break;
  }
  return result;
}

uint64_t _assetSubtypeForMediaSubtypes(uint64_t a1)
{
  int64_t v1;
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;

  v1 = a1 & 0xFFFFFFFFFF6FFCADLL;
  if ((a1 & 0xFFFFFFFFFF6FFCADLL) == 0x400000)
    v2 = 104;
  else
    v2 = 0;
  if (v1 == 0x80000)
    v3 = 103;
  else
    v3 = v2;
  if (v1 == 0x40000)
    v4 = 102;
  else
    v4 = 0;
  if (v1 == 0x20000)
    v5 = 101;
  else
    v5 = v4;
  if (v1 < 0x80000)
    v3 = v5;
  if (v1 == 0x10000)
    v6 = 100;
  else
    v6 = 0;
  if (v1 == 8)
    v7 = 2;
  else
    v7 = v6;
  if (v1 == 4)
    v8 = 10;
  else
    v8 = 0;
  if (v1 == 1)
    v9 = 1;
  else
    v9 = v8;
  if (v1 <= 7)
    v7 = v9;
  if (v1 < 0x20000)
    return v7;
  else
    return v3;
}

void sub_199334020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199335224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_199336A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199336B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199336C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _IsOriginalKnownUnsupportedFormatForAsset(void *a1, char a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v5 = a1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__19039;
  v23 = __Block_byref_object_dispose__19040;
  v24 = (id)MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "pl_photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___IsOriginalKnownUnsupportedFormatForAsset_block_invoke;
  v12[3] = &unk_1E35DA628;
  v7 = v5;
  v13 = v7;
  v8 = v6;
  v17 = a2;
  v14 = v8;
  v15 = &v25;
  v18 = a3 != 0;
  v16 = &v19;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v9 = v26;
  if (a3 && *((_BYTE *)v26 + 24))
  {
    *a3 = objc_retainAutorelease((id)v20[5]);
    v9 = v26;
  }
  v10 = *((unsigned __int8 *)v9 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void sub_199336DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1993382F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PHAllAssetMediaSubtypes()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", &unk_1E36557C8);
  objc_msgSend(v0, "addObject:", &unk_1E36557E0);
  objc_msgSend(v0, "addObject:", &unk_1E36557F8);
  objc_msgSend(v0, "addObject:", &unk_1E3655810);
  objc_msgSend(v0, "addObject:", &unk_1E3655828);
  objc_msgSend(v0, "addObject:", &unk_1E3655840);
  objc_msgSend(v0, "addObject:", &unk_1E3655858);
  objc_msgSend(v0, "addObject:", &unk_1E3655870);
  objc_msgSend(v0, "addObject:", &unk_1E3655888);
  objc_msgSend(v0, "addObject:", &unk_1E36558A0);
  objc_msgSend(v0, "addObject:", &unk_1E36558B8);
  objc_msgSend(v0, "addObject:", &unk_1E36558D0);
  objc_msgSend(v0, "addObject:", &unk_1E36558E8);
  objc_msgSend(v0, "addObject:", &unk_1E3655900);
  objc_msgSend(v0, "addObject:", &unk_1E3655918);
  objc_msgSend(v0, "addObject:", &unk_1E3655930);
  objc_msgSend(v0, "addObject:", &unk_1E3655948);
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

const __CFString *PHAssetMediaTypeDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DA708[a1 - 1];
}

id PHAssetMediaSubtypesDebugDescription(uint64_t a1)
{
  return +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", a1);
}

__CFString *PHAssetPlaybackVariationDebugDescription(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E35DA648[a1];
}

__CFString *PHAssetPlaybackStyleDebugDescription(unint64_t a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1E35DA668[a1];
}

__CFString *PHOriginalChoiceDebugDescription(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E35DA698[a1];
}

uint64_t PHAssetDeferredProcessingInvalidatesContentWhenCompleted(unsigned int a1)
{
  return (a1 > 0xB) | (0x40Eu >> a1) & 1;
}

BOOL PHAssetVideoDeferredProcessingInvalidatesContentWhenCompleted(int a1)
{
  return a1 == 1;
}

unint64_t _assetKindForMediaType(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x2000100000003uLL >> (16 * a1);
  if (a1 >= 4)
    LOBYTE(v1) = 3;
  return v1 & 3;
}

unint64_t PLVariationSuggestionTypeStatesFromPHStatesAndType(char a1, uint64_t a2)
{
  if (a2)
    return (unint64_t)(a1 & 0x3F) << (6 * a2 - 6);
  else
    return 0;
}

uint64_t PHVariationSuggestionStatesFromPLStatesAndType(unint64_t a1, uint64_t a2)
{
  if (a2)
    return (a1 >> (6 * a2 - 6)) & 0x3F;
  else
    return 0;
}

const __CFString *PHAssetSourceTypeStringWithSourceType(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return CFSTR("Alternate");
      case 32:
        return CFSTR("Guest");
      case 64:
        return CFSTR("CompanionSynced");
      default:
        return CFSTR("unknown");
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("None");
        break;
      case 1:
        result = CFSTR("UserLibrary");
        break;
      case 2:
        result = CFSTR("CloudShared");
        break;
      case 4:
        result = CFSTR("iTunesSynced");
        break;
      case 8:
        result = CFSTR("MomentShared");
        break;
      default:
        return CFSTR("unknown");
    }
  }
  return result;
}

const __CFString *PHAssetImportSourceDescription(unint64_t a1)
{
  if (a1 > 0xC)
    return CFSTR("Unknown Import Source Value");
  else
    return off_1E35DA720[a1];
}

uint64_t CPLMasterImportSourceFromPHAssetImportSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0xC)
    return (__int16)a1;
  else
    return 0;
}

const __CFString *PHAdjustmentBaseVersionDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("unknown");
  else
    return off_1E35DA790[a1];
}

void sub_19933E7B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19933EA5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t PHNextImageAndAssetResourceManagerID()
{
  unint64_t result;

  if (PHNextImageAndAssetResourceManagerID_onceToken != -1)
    dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_20522);
  do
    result = __ldaxr(&PHNextImageAndAssetResourceManagerID_managerID);
  while (__stlxr(result + 1, &PHNextImageAndAssetResourceManagerID_managerID));
  return result;
}

void sub_19933F0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19933FD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  void *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v13 - 192), 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  objc_destroyWeak((id *)(v13 - 112));

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20604(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20605(uint64_t a1)
{

}

id __copy_helper_block_e8_72n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = result;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return result;
}

void __destroy_helper_block_e8_72n4_8_s0(uint64_t a1)
{

}

void sub_199340508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1993408B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_199340B28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_199340D38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19934105C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993413AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19934157C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_48n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return result;
}

void __destroy_helper_block_e8_48n4_8_s0(uint64_t a1)
{

}

void sub_199341EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  void *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v13 - 192), 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  objc_destroyWeak((id *)(v13 - 112));

  _Unwind_Resume(a1);
}

void sub_1993420E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993423EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993483F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21392(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21393(uint64_t a1)
{

}

void sub_199354F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199357E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1993584AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199359290(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22749(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22750(uint64_t a1)
{

}

void sub_19935D388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1993600E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23246(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23247(uint64_t a1)
{

}

void sub_19936095C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23598(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23599(uint64_t a1)
{

}

void sub_1993647A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1993651DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23874(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23875(uint64_t a1)
{

}

void sub_1993661EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993670F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_199367414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199368418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1993687E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993689F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199368EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *PHPersonTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DB220[a1 + 1];
}

const __CFString *PHPersonVerifiedTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 4)
    return CFSTR("unknown");
  else
    return off_1E35DB238[a1 + 2];
}

const __CFString *PHDetectionTypeDescription(int a1)
{
  if ((a1 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E35DB260[a1 - 1];
}

const __CFString *PHPersonAgeTypeDescription(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E35DB280[(unsigned __int16)(a1 - 1)];
}

const __CFString *PHDescriptionForUtilityCollectionType(int a1)
{
  if ((a1 - 1) > 5)
    return CFSTR("None");
  else
    return off_1E35DB360[(unsigned __int16)(a1 - 1)];
}

void _fetchNonHintResources(void *a1)
{
  id *v1;
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (_fetchNonHintResources_s_onceToken != -1)
    dispatch_once(&_fetchNonHintResources_s_onceToken, &__block_literal_global_191);
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v1[1], "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEBUG, "[RM]: PHResourceChooserList: Fetching non-hint resources for asset with uuid: %{public}@...", buf, 0xCu);

  }
  v4 = v1[8];
  if (!v4)
  {
    objc_msgSend(v1[1], "managedObjectContextForFetchingResources");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v1[8];
    v1[8] = (id)v5;

    v4 = v1[8];
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___fetchNonHintResources_block_invoke_197;
  v8[3] = &unk_1E35DF110;
  v9 = v1;
  v7 = v1;
  objc_msgSend(v4, "performBlockAndWait:", v8);

}

uint64_t _presentFullResourceAtIndex(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];
  char v14;

  v5 = (void *)a1[10];
  v6 = a1;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___presentFullResourceAtIndex_block_invoke;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = a3;
  v8 = _Block_copy(v13);
  v9 = v6[2];
  v10 = v6[14];

  v11 = (*(uint64_t (**)(uint64_t, void *, BOOL, char *, void *))(v9 + 16))(v9, v7, v10 == -1, &v14, v8);
  return v11;
}

uint64_t ___presentFullResourceAtIndex_block_invoke(uint64_t result)
{
  **(_BYTE **)(result + 32) = 1;
  return result;
}

void ___fetchNonHintResources_block_invoke_197(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 49) || *(_BYTE *)(v2 + 48) && *(_QWORD *)(v2 + 112) == 1)
  {
    v3 = objc_msgSend(*(id *)(v2 + 8), "hasAdjustments");
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 1;
  }
  v4 = objc_msgSend(*(id *)(v2 + 8), "isWalrusEnabled");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  fetchResourcesForChoosing(v5, v3, v4, (void *)_fetchNonHintResources_s_predicate, (uint64_t)&v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    _sortedInfosFromChooserInfos(v6, *(void **)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v8;
  }
  else
  {
    PLImageManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      v19 = 2048;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "[RM]: PHResourceChooserList: unable to execute fetch request for persisted resources for asset with uuid: %{public}@, error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

    }
  }

}

id fetchResourcesForChoosing(void *a1, int a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a4;
  v36 = a5;
  if (fetchResourcesForChoosing_s_onceToken != -1)
    dispatch_once(&fetchResourcesForChoosing_s_onceToken, &__block_literal_global_186);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContextForFetchingResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0x1E0D71000uLL;
  v37 = a2;
  if (a2)
  {
    v14 = (void *)MEMORY[0x1E0D71880];
    objc_msgSend(v9, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetWithObjectID:inManagedObjectContext:", v15, v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v10)
      objc_msgSend(v16, "addObject:", v10);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "nonPersistedResources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_pl_map:", &__block_literal_global_189);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v21);

    v13 = 0x1E0D71000;
  }
  else
  {
    v18 = 0;
    v40 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(void **)(v13 + 2176);
  objc_msgSend(v9, "objectID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  objc_msgSend(v23, "fetchRequestForResourcesWithObjectID:versions:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:", v24, 0, 1, a3, v10, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setResultType:", 2);
  objc_msgSend(v25, "setPropertiesToFetch:", fetchResourcesForChoosing_s_propertiesToFetch);
  v38 = v12;
  objc_msgSend(v12, "executeFetchRequest:error:", v25, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        _resourceInfoFromResultDict(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v22, "addObject:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v28);
  }
  objc_msgSend(v11, "addObjectsFromArray:", v22);
  if (v37)
  {
    objc_msgSend(v40, "virtualResourcesThatReplaceMissingPersistedResources:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "filteredArrayUsingPredicate:", v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "_pl_map:", &__block_literal_global_190);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v34);

  }
  return v11;
}

id _sortedInfosFromChooserInfos(void *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  void *v19;
  int v20;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (_sortedInfosFromChooserInfos_s_onceToken != -1)
    dispatch_once(&_sortedInfosFromChooserInfos_s_onceToken, &__block_literal_global_24800);
  if (v4[7])
  {
    v28[0] = v4[7];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", _sortedInfosFromChooserInfos_s_defaultSortDescriptors);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (id)_sortedInfosFromChooserInfos_s_defaultSortDescriptors;
  }
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_158_24802) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
  }
  else
  {
    v22 = v4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "resourceType");
          v19 = v9;
          if (v18 != 4)
          {
            v20 = objc_msgSend(v17, "localAvailability");
            v19 = v8;
            if (v20 <= 0)
            {
              if ((int)objc_msgSend(v17, "localAvailabilityTarget") <= 0)
                v19 = v11;
              else
                v19 = v10;
            }
          }
          objc_msgSend(v19, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v8, "addObjectsFromArray:", v10);
    objc_msgSend(v8, "addObjectsFromArray:", v9);
    objc_msgSend(v8, "addObjectsFromArray:", v11);

    v4 = v22;
  }

  return v8;
}

BOOL ___sortedInfosFromChooserInfos_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resourceType") == 4;
}

void ___sortedInfosFromChooserInfos_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localAvailability"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("qualitySortValue"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_sortedInfosFromChooserInfos_s_defaultSortDescriptors;
  _sortedInfosFromChooserInfos_s_defaultSortDescriptors = v2;

}

PHResourceChooserListResourceInfo *_resourceInfoFromResultDict(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  uint64_t v34;
  unsigned __int8 v35;
  double v36;
  double v37;
  double v38;
  float v39;
  PHResourceChooserListResourceInfo *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  id v50;
  _QWORD block[4];
  id v52;

  v3 = a1;
  v50 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___resourceInfoFromResultDict_block_invoke;
    block[3] = &unk_1E35DF110;
    v52 = v4;
    if (_resourceInfoFromResultDict_s_onceToken == -1)
    {
      v6 = v4;
    }
    else
    {
      dispatch_once(&_resourceInfoFromResultDict_s_onceToken, block);
      v6 = v52;
    }
    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_dataStoreClassID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_dataStoreSubtype);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_localAvailabilityTarget);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_resourceType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_version);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_recipeID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_utiConformanceHint);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_width);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v17, "longLongValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v18, "longLongValue");

    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_compactUTI);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueAtIndex:", _resourceInfoFromResultDict_s_index_dataStoreKeyData);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dataStoreClassID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dataStoreSubtype"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v22, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localAvailabilityTarget"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v23, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("resourceType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v24, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v25, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recipeID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v26, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("utiConformanceHint"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v27, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unorientedWidth"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v28, "longLongValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unorientedHeight"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v29, "longLongValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("compactUTI"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dataStoreKeyData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v50, "libraryID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v31, "keyFromKeyStruct:", objc_msgSend(v20, "bytes"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  v45 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0D71BA0], "utiWithCompactRepresentation:conformanceHint:", v19, v16);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isPrimaryImageFormat");
  v35 = objc_msgSend(v31, "dataStoreSubtypeIsDownloadable:", v9);
  objc_msgSend(v33, "isLosslessEncoding");
  PLIsResourceMarkedFullSizeFromRecipeID();
  if (!objc_msgSend(v50, "hasAdjustments") || (_DWORD)v49)
    objc_msgSend(v50, "unorientedSize");
  else
    objc_msgSend(v50, "originalUnorientedSize");
  v38 = 0.0;
  if (v36 * v37 > 0.0)
  {
    v39 = v36 * v37;
    v38 = (float)((float)(v46 * v44) / v39);
  }
  LOWORD(v43) = v48;
  LOWORD(v42) = v35;
  v40 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:]([PHResourceChooserListResourceInfo alloc], "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v47, v14, v49, PLQualitySortValueFromResourceDimensions(), v14 & 1, v34, v38, v42, v33, v31, v32, v43);

  return v40;
}

PHResourceChooserListResourceInfo *__fetchResourcesForChoosing_block_invoke_3(uint64_t a1, void *a2)
{
  return _resourceInfoFromVirtualResource(a2);
}

PHResourceChooserListResourceInfo *_resourceInfoFromVirtualResource(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __int16 v6;
  float v7;
  float v8;
  unsigned __int8 v9;
  uint64_t v10;
  PHResourceChooserListResourceInfo *v11;
  uint64_t v12;
  void *v13;
  PHResourceChooserListResourceInfo *v14;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;

  v1 = a1;
  objc_msgSend(v1, "uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v2, "isPrimaryImageFormat");

  v18 = objc_msgSend(v1, "resourceType");
  HIDWORD(v17) = objc_msgSend(v1, "version");
  v3 = objc_msgSend(v1, "isDerivative");
  objc_msgSend(v1, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataStoreKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v1, "localAvailabilityTarget");
  objc_msgSend(v1, "scale");
  v8 = v7;
  v9 = objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", objc_msgSend(v1, "dataStoreSubtype"));
  v10 = objc_msgSend(v1, "recipeID");
  v11 = [PHResourceChooserListResourceInfo alloc];
  v12 = objc_msgSend(v1, "qualitySortValue");
  objc_msgSend(v1, "uniformTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v17) = v6;
  LOWORD(v16) = v9;
  v14 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v11, "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v18, v10, HIDWORD(v17), v12, v3, v19, v8, v16, v13, v4, v5, v17);

  return v14;
}

void ___resourceInfoFromResultDict_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mapping");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "indexForKey:", CFSTR("objectID"));
  _resourceInfoFromResultDict_s_index_recipeID = objc_msgSend(v1, "indexForKey:", CFSTR("recipeID"));
  _resourceInfoFromResultDict_s_index_resourceType = objc_msgSend(v1, "indexForKey:", CFSTR("resourceType"));
  _resourceInfoFromResultDict_s_index_version = objc_msgSend(v1, "indexForKey:", CFSTR("version"));
  _resourceInfoFromResultDict_s_index_compactUTI = objc_msgSend(v1, "indexForKey:", CFSTR("compactUTI"));
  _resourceInfoFromResultDict_s_index_utiConformanceHint = objc_msgSend(v1, "indexForKey:", CFSTR("utiConformanceHint"));
  _resourceInfoFromResultDict_s_index_width = objc_msgSend(v1, "indexForKey:", CFSTR("unorientedWidth"));
  _resourceInfoFromResultDict_s_index_height = objc_msgSend(v1, "indexForKey:", CFSTR("unorientedHeight"));
  _resourceInfoFromResultDict_s_index_dataStoreClassID = objc_msgSend(v1, "indexForKey:", CFSTR("dataStoreClassID"));
  _resourceInfoFromResultDict_s_index_dataStoreSubtype = objc_msgSend(v1, "indexForKey:", CFSTR("dataStoreSubtype"));
  _resourceInfoFromResultDict_s_index_dataStoreKeyData = objc_msgSend(v1, "indexForKey:", CFSTR("dataStoreKeyData"));
  _resourceInfoFromResultDict_s_index_localAvailabilityTarget = objc_msgSend(v1, "indexForKey:", CFSTR("localAvailabilityTarget"));

}

PHResourceChooserListResourceInfo *__fetchResourcesForChoosing_block_invoke_2(uint64_t a1, void *a2)
{
  return _resourceInfoFromVirtualResource(a2);
}

void __fetchResourcesForChoosing_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];

  v2[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("objectID");
  v2[1] = CFSTR("recipeID");
  v2[2] = CFSTR("resourceType");
  v2[3] = CFSTR("version");
  v2[4] = CFSTR("compactUTI");
  v2[5] = CFSTR("utiConformanceHint");
  v2[6] = CFSTR("unorientedWidth");
  v2[7] = CFSTR("unorientedHeight");
  v2[8] = CFSTR("dataStoreClassID");
  v2[9] = CFSTR("dataStoreSubtype");
  v2[10] = CFSTR("dataStoreKeyData");
  v2[11] = CFSTR("localAvailability");
  v2[12] = CFSTR("localAvailabilityTarget");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fetchResourcesForChoosing_s_propertiesToFetch;
  fetchResourcesForChoosing_s_propertiesToFetch = v0;

}

void ___fetchNonHintResources_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K != %d"), CFSTR("utiConformanceHint"), &unk_1E36573F0, CFSTR("resourceType"), 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_fetchNonHintResources_s_predicate;
  _fetchNonHintResources_s_predicate = v0;

}

uint64_t PHChooserListLookAheadForNonHintResourcePassingTest(void *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a1;
  v4 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)v3[8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PHChooserListLookAheadForNonHintResourcePassingTest_block_invoke;
  v10[3] = &unk_1E35DB4F0;
  v6 = v3;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v5, "performBlockAndWait:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_19936F90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199370A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_199370C34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19937123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 200), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25110(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25111(uint64_t a1)
{

}

void sub_199372EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_199374C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  void *v22;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1993753AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;
  void *v69;
  uint64_t v70;

  _Block_object_dispose((const void *)(v70 - 160), 8);

  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_199375A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v30);

  objc_destroyWeak((id *)(v31 - 128));
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_104n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 104);
  *(_QWORD *)(a1 + 104) = result;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return result;
}

void __destroy_helper_block_e8_104n4_8_s0(uint64_t a1)
{

}

id __copy_helper_block_e8_56n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 56);
  *(_QWORD *)(a1 + 56) = result;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return result;
}

void __destroy_helper_block_e8_56n4_8_s0(uint64_t a1)
{

}

id getCKMediaItemMakerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCKMediaItemMakerClass_softClass;
  v7 = getCKMediaItemMakerClass_softClass;
  if (!getCKMediaItemMakerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKMediaItemMakerClass_block_invoke;
    v3[3] = &unk_1E35DB860;
    v3[4] = &v4;
    __getCKMediaItemMakerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19937A050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKMediaItemMakerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CloudKitLibraryCore_frameworkLibrary)
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PHImageManager+VideoUtilities.m"), 31, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CKMediaItemMaker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKMediaItemMakerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PHImageManager+VideoUtilities.m"), 32, CFSTR("Unable to find class %s"), "CKMediaItemMaker");

LABEL_8:
    __break(1u);
  }
  getCKMediaItemMakerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PHCloudResourcePrefetchModeForPLCloudResourcePrefetchMode(uint64_t a1)
{
  if (a1 == 1)
    return 2;
  else
    return a1 == 0;
}

uint64_t PLCloudResourcePrefetchModeForPHCloudResourcePrefetchMode(int a1)
{
  uint64_t v1;

  v1 = 1;
  if (a1 != 2)
    v1 = 2;
  if (a1 == 1)
    return 0;
  else
    return v1;
}

id PHAssetOriginalMetadataOfAsset(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = a1;
  if (objc_msgSend(v1, "isVideo"))
  {
    objc_msgSend(v1, "originalAVAssetOrProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v1, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibraryBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZoneLookup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithAVAsset:options:timeZoneLookup:", v2, 12, v6);
  }
  else
  {
    objc_msgSend(v1, "originalImageProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v8 = objc_alloc(MEMORY[0x1E0D75140]);
    v9 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v1, "uniformTypeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibraryBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZoneLookup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithImageProperties:contentType:timeZoneLookup:", v2, v5, v11);

  }
LABEL_7:

  return v7;
}

id PHAssetOriginalLocationForAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PHAssetOriginalMetadataOfAsset(v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "gpsLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (v9 = (void *)MEMORY[0x1E0D71860],
        objc_msgSend(v7, "coordinate"),
        objc_msgSend(v9, "canUseCoordinate:")))
  {
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

LABEL_9:
  return v10;
}

id PHAssetOriginalCaptionForAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PHAssetOriginalMetadataOfAsset(v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v6, "captionAbstract");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v7;
}

id PHAssetOriginalAccessibilityDescriptionForAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PHAssetOriginalMetadataOfAsset(v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v6, "artworkContentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v7;
}

uint64_t PHAssetLocationCoordinatesAreEqual(double a1, double a2, double a3, double a4)
{
  int v8;
  int v9;
  _BOOL4 v11;

  v8 = objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:");
  v9 = objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:", a3, a4);
  if ((v8 & 1) == 0 && !v9)
    return 1;
  if (v8 != v9)
    return 0;
  v11 = vabdd_f64(a1, a3) < 0.00000001;
  return vabdd_f64(a2, a4) < 0.00000001 && v11;
}

id PHAssetAVMetadataItemDateFormatter()
{
  if (PHAssetAVMetadataItemDateFormatter_onceToken != -1)
    dispatch_once(&PHAssetAVMetadataItemDateFormatter_onceToken, &__block_literal_global_25854);
  return (id)PHAssetAVMetadataItemDateFormatter_dateFormatter;
}

id PHAssetDateAndTimeZoneFromISO8601DateString(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  PHAssetAVMetadataItemDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2 && v5)
  {
    if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Z")) & 1) != 0
      || objc_msgSend(v3, "hasSuffix:", CFSTR("z")))
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (PHAssetDateAndTimeZoneFromISO8601DateString_onceToken != -1)
        dispatch_once(&PHAssetDateAndTimeZoneFromISO8601DateString_onceToken, &__block_literal_global_26);
      objc_msgSend((id)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8
        || (objc_msgSend((id)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = -[NSObject rangeAtIndex:](v8, "rangeAtIndex:", 1);
        objc_msgSend(v3, "substringWithRange:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject rangeAtIndex:](v8, "rangeAtIndex:", 2);
        objc_msgSend(v3, "substringWithRange:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSObject rangeAtIndex:](v8, "rangeAtIndex:", 3);
        objc_msgSend(v3, "substringWithRange:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v11, "isEqualToString:", CFSTR("-"));
        v19 = objc_msgSend(v14, "intValue");
        v20 = objc_msgSend(v17, "intValue");
        if (!v18 || v19 || v20)
        {
          if (v18)
            v22 = -(3600 * v19 + 60 * v20);
          else
            v22 = 3600 * v19 + 60 * v20;
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v22);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v7 = (void *)v21;

      }
      else
      {
        PLPhotoKitGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138477827;
          v26 = v3;
          _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "[PHAsset_MetadataUtilities] Could not parse timezone from original movie date string: %{private}@", (uint8_t *)&v25, 0xCu);
        }
        v7 = 0;
      }

    }
    goto LABEL_22;
  }
  if (a2)
  {
    v7 = 0;
LABEL_22:
    v23 = objc_retainAutorelease(v7);
    *a2 = v23;

  }
  return v6;
}

void sub_19937ED44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26096(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26097(uint64_t a1)
{

}

const __CFString *PHStringFromFeatureAvailabilityState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Feature Availability Unknown");
  if (a1 == 1)
    v1 = CFSTR("Feature Is Available");
  if (a1)
    return v1;
  else
    return CFSTR("Feature Not Available");
}

void sub_1993855B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26861(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26862(uint64_t a1)
{

}

void sub_1993856F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *PHLibraryScopeExitStateDebugDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("unknown");
  else
    return off_1E35DBD28[a1];
}

double PHGenerateCropRectGivenNormalizedCropRect(unint64_t a1, unint64_t a2, uint64_t a3, int a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double result;
  CGRect v42;
  CGRect v43;

  v20 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v43.size.width = *(CGFloat *)(MEMORY[0x1E0C9D648] + 16);
  v43.size.height = *(CGFloat *)(MEMORY[0x1E0C9D648] + 24);
  v42.origin.x = a7;
  v42.origin.y = a8;
  v42.size.width = a9;
  v42.size.height = a10;
  v43.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v43.origin.y = v21;
  v22 = CGRectEqualToRect(v42, v43);
  v23 = 0.0;
  if (v22)
    v24 = 1.0;
  else
    v24 = a10;
  if (v22)
    v25 = 1.0;
  else
    v25 = a9;
  if (v22)
    v26 = 0.0;
  else
    v26 = a8;
  if (!v22)
    v23 = a7;
  v27 = v23 * (double)a1;
  v28 = v26 * (double)a2;
  v29 = v25 * (double)a1;
  v30 = v24 * (double)a2;
  if (a3 == 1)
  {
    if (!v22 || (a4 & 1) != 0)
    {
      if (a4)
      {
        v39 = (v30 - a6) * 0.5;
        if (v29 - a5 >= 0.0)
          v40 = (v29 - a5) * 0.5;
        else
          v40 = 0.0;
        if (v30 - a6 < 0.0)
          v39 = 0.0;
        *(CGRect *)&v27 = CGRectInset(*(CGRect *)&v27, v40, v39);
      }
    }
    else
    {
      PLSizeMake();
      v31 = PLSizeMake();
      PLCGSizeScaledToFitSize();
      v33 = v32;
      v35 = v34;
      v36 = v32 == (double)(int)v31;
      v37 = ((double)(int)v31 - v32) * 0.5;
      v38 = ((double)SHIDWORD(v31) - v34) * 0.5;
      if (v33 == (double)(int)v31)
        v37 = v20;
      if (!v36)
        v38 = v21;
      *(CGRect *)&v27 = CGRectIntegral(*(CGRect *)&v37);
    }
  }
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(*(CGRect *)&v27);
  return result;
}

void sub_19938D004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  void *v46;
  uint64_t v47;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v47 - 232), 8);
  _Block_object_dispose((const void *)(v47 - 176), 8);
  objc_destroyWeak((id *)(v47 - 184));

  _Unwind_Resume(a1);
}

void sub_19938D38C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28044(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28045(uint64_t a1)
{

}

id __copy_helper_block_e8_88n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 88);
  *(_QWORD *)(a1 + 88) = result;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return result;
}

void __destroy_helper_block_e8_88n4_8_s0(uint64_t a1)
{

}

void sub_19938F528(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19938F8A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_199390F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28508(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28509(uint64_t a1)
{

}

void sub_19939210C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199392DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1993961C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29015(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29016(uint64_t a1)
{

}

void sub_199396AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PHLocalIdentifierWithUUIDAndCode(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), a1, CFSTR("/L0/"), a2);
}

void sub_19939A0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29802(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29803(uint64_t a1)
{

}

id PHObjectReferenceDictionariesForReferences(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "representedType", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dictionaryForReferenceType:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("representedType"));
        objc_msgSend(v2, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

id PHObjectReferencesForDictionaries(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("representedType"), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "objectForKeyedSubscript:", v12)), "initWithDictionary:referenceType:", v11, v12);
          objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id PHLocalIdentifierForObjectReferencesAndLibrary(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PHObjectReference filteredObjectReferences:inPhotoLibrary:](PHObjectReference, "filteredObjectReferences:inPhotoLibrary:", a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "localIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

id PHCollectionReferenceFetchCollectionsForReferences(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  PHManualFetchResult *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v29 = a3;
  v28 = a4;
  +[PHObjectReference filteredObjectReferences:inPhotoLibrary:](PHObjectReference, "filteredObjectReferences:inPhotoLibrary:", a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v18, "transient"))
        {
          objc_msgSend(v18, "_transientCollectionInLibrary:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v9, "addObject:", v19);
            objc_msgSend(v11, "addIndex:", v15++);
          }

        }
        else
        {
          objc_msgSend(v18, "localIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v20);

          ++v15;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v10, "count"))
  {
    v21 = v28;
    (*((void (**)(id, void *))v28 + 2))(v28, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
    v21 = v28;
  }
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v22, "count"))
    {
      v23 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v22, "fetchedObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayWithArray:", v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "insertObjects:atIndexes:", v9, v11);
    }
    else
    {
      v25 = v9;
    }
    v26 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:]([PHManualFetchResult alloc], "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v25, v7, v29, 0, 0, 0);

    v22 = v26;
  }

  return v22;
}

void sub_19939C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30030(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30031(uint64_t a1)
{

}

void sub_19939F040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1993A1C50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1993A24E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1993A55F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993A916C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993AA170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1993AF3AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AF524(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AF69C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AF814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AF98C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AFB04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AFC7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AFDF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993AFF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B00E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B025C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B03D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B054C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B06C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B083C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B09B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B0B2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B0CA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B0E1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B0F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B110C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInOtherSmartAlbum_block_invoke_19(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInOtherSmartAlbum_block_invoke_19";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B1284(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B13FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B16EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B19DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1B54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1CCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1E44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B1FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B22AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2424(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B259C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B288C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2A04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2B7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2CF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2E6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B2FE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B315C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B32D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B344C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B35C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B373C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B38B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B3A2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B3BA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B3D1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B3E94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B400C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B42FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B45EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4764(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B48DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4BCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4D44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B4EBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B51AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B549C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B578C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5904(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5A7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5D6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B5EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B605C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncFolder_block_invoke_38(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_1WaySyncFolder_block_invoke_38";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B61D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum_block_invoke_37(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum_block_invoke_37";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B634C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncEvent_block_invoke_36(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_1WaySyncEvent_block_invoke_36";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B64C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncAlbum_block_invoke_35(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_1WaySyncAlbum_block_invoke_35";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B663C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B67B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B692C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B6AA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B6C1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B6D94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B6F0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B7084(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B71FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B7374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1stSpecial_block_invoke_25(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetInAlbumKind_1stSpecial_block_invoke_25";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B74EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B7664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B77DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B7954(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B7ACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31074(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31075(uint64_t a1)
{

}

__CFString *_fetchTypeForCollectionListTypeAndSubtype(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return (__CFString *)0;
  else
    return *off_1E35DD4D8[a1 - 1];
}

id PHQueryForCollectionsInFolder_block_invoke_5(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForCollectionsInFolder_block_invoke_5";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B7D20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderFavoriteMemories_block_invoke_4(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForCollectionsInSmartFolderFavoriteMemories_block_invoke_4";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B7E98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderFaces_block_invoke_3(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForCollectionsInSmartFolderFaces_block_invoke_3";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8010(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderEvents_block_invoke_2(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForCollectionsInSmartFolderEvents_block_invoke_2";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInMomentList_block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForCollectionsInMomentList_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1993B86E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___fetchTypeForLocalIdentifierCode_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[17];
  _QWORD v21[19];

  v21[17] = *MEMORY[0x1E0C80C00];
  +[PHAsset identifierCode](PHAsset, "identifierCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  v21[0] = CFSTR("PHAsset");
  +[PHCollectionList identifierCode](PHCollectionList, "identifierCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v18;
  v21[1] = CFSTR("PHCollectionList");
  +[PHMomentList identifierCode](PHMomentList, "identifierCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  v21[2] = CFSTR("PHMomentList");
  +[PHAssetCollection identifierCode](PHAssetCollection, "identifierCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  v21[3] = CFSTR("PHAssetCollection");
  +[PHMoment identifierCode](PHMoment, "identifierCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  v21[4] = CFSTR("PHMoment");
  +[PHPerson identifierCode](PHPerson, "identifierCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v14;
  v21[5] = CFSTR("PHPerson");
  +[PHFace identifierCode](PHFace, "identifierCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v13;
  v21[6] = CFSTR("PHFace");
  +[PHFaceGroup identifierCode](PHFaceGroup, "identifierCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v12;
  v21[7] = CFSTR("PHFaceGroup");
  +[PHSocialGroup identifierCode](PHSocialGroup, "identifierCode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v0;
  v21[8] = CFSTR("PHSocialGroup");
  +[PHMemory identifierCode](PHMemory, "identifierCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v1;
  v21[9] = CFSTR("PHMemory");
  +[PHPhotosHighlight identifierCode](PHPhotosHighlight, "identifierCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v2;
  v21[10] = CFSTR("PHPhotosHighlight");
  +[PHMomentShare identifierCode](PHMomentShare, "identifierCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v3;
  v21[11] = CFSTR("PHMomentShare");
  +[PHLibraryScope identifierCode](PHLibraryScope, "identifierCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v4;
  v21[12] = CFSTR("PHLibraryScope");
  +[PHShareParticipant identifierCode](PHShareParticipant, "identifierCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v5;
  v21[13] = CFSTR("PHShareParticipant");
  +[PHSuggestion identifierCode](PHSuggestion, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[14] = v6;
  v21[14] = CFSTR("PHSuggestion");
  +[PHImportSession identifierCode](PHImportSession, "identifierCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[15] = v7;
  v21[15] = CFSTR("PHImportSession");
  +[PHProject identifierCode](PHProject, "identifierCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[16] = v8;
  v21[16] = CFSTR("PHProject");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)_fetchTypeForLocalIdentifierCode_pl_once_object_20;
  _fetchTypeForLocalIdentifierCode_pl_once_object_20 = v10;

}

id PHQueryForKeyAssetsInAssetCollection_block_invoke_8(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForKeyAssetsInAssetCollection_block_invoke_8";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForKeySharingSuggestionAssetsInHighlight_block_invoke_9(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForKeySharingSuggestionAssetsInHighlight_block_invoke_9";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8D40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForKeyAssetsInMomentShare_block_invoke_7(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForKeyAssetsInMomentShare_block_invoke_7";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B8EB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForKeyAssetsInSuggestion_block_invoke_6(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForKeyAssetsInSuggestion_block_invoke_6";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B9030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "isSharingSuggestion") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSPredicate *_predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(PHPhotosHighlight *__strong, PHFetchOptions *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PHQuery.m"), 2946, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlight.isSharingSuggestion"));

  }
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "kind");

  if (v3 > 3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", off_1E35DD458[v3], v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeSharedLibrarySharingSuggestionsAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PHQueryForAssetsInImportSession_block_invoke_16(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInImportSession_block_invoke_16";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B938C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSuggestion_block_invoke_15(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInSuggestion_block_invoke_15";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B9504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSharedLibrarySuggestion_block_invoke_14(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInSharedLibrarySuggestion_block_invoke_14";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B967C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInUserSmartAlbum_block_invoke_18(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInUserSmartAlbum_block_invoke_18";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B97F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMemory_block_invoke_12(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInMemory_block_invoke_12";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B996C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMomentShare_block_invoke_11(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInMomentShare_block_invoke_11";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B9AE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMoment_block_invoke_10(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInMoment_block_invoke_10";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B9C5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInConversation_block_invoke_17(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInConversation_block_invoke_17";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993B9E8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSearchIndex_block_invoke_20(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoKitGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v11 = 136315138;
    v12 = "PHQueryForAssetsInSearchIndex_block_invoke_20";
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  v2[2](v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", "", (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_1993BA004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PHQueryTransformExpressionConstantValue(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE35B348))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    ((void (**)(id, id))v4)[2](v4, v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void sub_1993BA540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1993BB0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose((const void *)(v70 - 216), 8);
  _Block_object_dispose((const void *)(v70 - 168), 8);
  _Block_object_dispose((const void *)(v70 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31499(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31500(uint64_t a1)
{

}

void sub_1993BBCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1993BCBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id OutboundURLForURL(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0D732D0];
    v2 = a1;
    v3 = [v1 alloc];
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithURL:sandboxExtensionToken:consume:", v2, v5, 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void sub_1993C1FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1993C5284(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32568(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32569(uint64_t a1)
{

}

void sub_1993C7A30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1993CA7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33083(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33084(uint64_t a1)
{

}

void sub_1993CB480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *PHSuggestionStringWithSubtype(int a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;

  result = CFSTR("Unknown Subtype");
  if (a1 > 651)
  {
    if (a1 <= 702)
    {
      if (a1 > 680)
      {
        v3 = CFSTR("Widget User Album");
        v4 = CFSTR("Widget Favorites Smart Album");
        if (a1 != 702)
          v4 = CFSTR("Unknown Subtype");
        if (a1 != 701)
          v3 = v4;
        v5 = CFSTR("Wallpaper User Album");
        v6 = CFSTR("Wallpaper Favorites Smart Album");
        if (a1 != 682)
          v6 = CFSTR("Unknown Subtype");
        if (a1 != 681)
          v5 = v6;
        if (a1 <= 700)
          return v5;
        else
          return v3;
      }
      else
      {
        switch(a1)
        {
          case 652:
            result = CFSTR("Wallpaper People");
            break;
          case 653:
            result = CFSTR("Wallpaper Pet");
            break;
          case 654:
            result = CFSTR("Wallpaper Landscape");
            break;
          case 655:
            result = CFSTR("Wallpaper Cityscape");
            break;
          default:
            v12 = a1 == 680;
            v13 = CFSTR("Wallpaper Settling Effect");
LABEL_49:
            if (v12)
              result = v13;
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 901:
          result = CFSTR("Wallpaper Me");
          break;
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
          return result;
        case 910:
          result = CFSTR("Collection Person");
          break;
        case 911:
          result = CFSTR("Collection Pet");
          break;
        case 912:
          result = CFSTR("Collection Album");
          break;
        case 913:
          result = CFSTR("Collection Trip");
          break;
        case 914:
          result = CFSTR("Collection Memory");
          break;
        case 915:
          result = CFSTR("Collection Event");
          break;
        case 916:
          result = CFSTR("Collection Group");
          break;
        case 917:
          result = CFSTR("Collection Media Type");
          break;
        default:
          switch(a1)
          {
            case 801:
              result = CFSTR("Ambient Nature");
              break;
            case 802:
              result = CFSTR("Ambient City");
              break;
            case 803:
              result = CFSTR("Ambient Pet");
              break;
            case 804:
              result = CFSTR("Ambient People");
              break;
            default:
              v12 = a1 == 703;
              v13 = CFSTR("Widget Depth Effect Smart Album");
              goto LABEL_49;
          }
          break;
      }
    }
    return result;
  }
  if (a1 > 400)
  {
    if (a1 <= 600)
    {
      v7 = CFSTR("On this Day");
      v8 = CFSTR("Outstander");
      v9 = CFSTR("Long Tail");
      if (a1 != 502)
        v9 = CFSTR("Unknown Subtype");
      if (a1 != 501)
        v8 = v9;
      v10 = a1 == 401;
      goto LABEL_41;
    }
    switch(a1)
    {
      case 601:
        result = CFSTR("Locket");
        break;
      case 602:
        result = CFSTR("Wallpaper Top People");
        break;
      case 603:
        result = CFSTR("Wallpaper Top Pet");
        break;
      case 604:
        result = CFSTR("Wallpaper Top Landscape");
        break;
      case 605:
        result = CFSTR("Wallpaper Top Cityscape");
        break;
      default:
        return result;
    }
  }
  else
  {
    if (a1 <= 300)
    {
      if (a1 > 200)
      {
        switch(a1)
        {
          case 201:
            result = CFSTR("Loop");
            break;
          case 202:
            result = CFSTR("Long Exposure");
            break;
          case 203:
            result = CFSTR("Bounce");
            break;
          case 204:
            result = CFSTR("Portrait Studio Light");
            break;
          default:
            return result;
        }
        return result;
      }
      v7 = CFSTR("Moment Share");
      v8 = CFSTR("Collection Share");
      v11 = CFSTR("Ongoing Collection Share");
      if (a1 != 103)
        v11 = CFSTR("Unknown Subtype");
      if (a1 != 102)
        v8 = v11;
      v10 = a1 == 101;
LABEL_41:
      if (v10)
        return v7;
      else
        return v8;
    }
    switch(a1)
    {
      case 301:
        result = CFSTR("Favorite");
        break;
      case 302:
        result = CFSTR("Edit");
        break;
      case 303:
        result = CFSTR("Aesthetics");
        break;
      case 304:
        result = CFSTR("Person Centric");
        break;
      case 305:
        result = CFSTR("Social Group Centric");
        break;
      case 306:
        result = CFSTR("Recent Syndicated Asset");
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t PHSuggestionSubtypeForCPLSuggestionSubtype(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  unsigned int v3;

  v1 = 0;
  if ((int)a1 > 679)
  {
    if ((int)a1 <= 900)
    {
      if ((int)a1 > 701)
      {
        switch((int)a1)
        {
          case 801:
          case 802:
          case 803:
          case 804:
LABEL_43:
            v1 = a1;
            break;
          default:
            if ((_DWORD)a1 == 703)
              LODWORD(v1) = 703;
            else
              LODWORD(v1) = 0;
            v2 = (_DWORD)a1 == 702;
            goto LABEL_48;
        }
      }
      else
      {
        if ((_DWORD)a1 == 701)
          LODWORD(v1) = 701;
        else
          LODWORD(v1) = 0;
        if ((_DWORD)a1 == 682)
          LODWORD(v1) = 682;
        if ((_DWORD)a1 == 681)
          v3 = 681;
        else
          v3 = 0;
        if ((_DWORD)a1 == 680)
          v3 = 680;
        if ((int)a1 <= 681)
          return v3;
        else
          return v1;
      }
    }
    else
    {
      switch((int)a1)
      {
        case 901:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
          goto LABEL_43;
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
          return v1;
        default:
          if ((_DWORD)a1 == 1102)
            LODWORD(v1) = 1102;
          else
            LODWORD(v1) = 0;
          v2 = (_DWORD)a1 == 1101;
          goto LABEL_48;
      }
    }
  }
  else if ((int)a1 > 400)
  {
    if ((int)a1 <= 600)
    {
      if ((_DWORD)a1 == 502)
        LODWORD(v1) = 502;
      else
        LODWORD(v1) = 0;
      if ((_DWORD)a1 == 501)
        LODWORD(v1) = 501;
      v2 = (_DWORD)a1 == 401;
      goto LABEL_48;
    }
    switch((int)a1)
    {
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
        goto LABEL_43;
      default:
        switch((int)a1)
        {
          case 652:
          case 653:
          case 654:
          case 655:
            goto LABEL_43;
          default:
            return v1;
        }
    }
  }
  else
  {
    if ((int)a1 <= 300)
    {
      if ((int)a1 > 200)
      {
        switch((int)a1)
        {
          case 201:
          case 202:
          case 203:
          case 204:
            goto LABEL_43;
          default:
            return v1;
        }
        return v1;
      }
      if ((_DWORD)a1 == 103)
        LODWORD(v1) = 103;
      else
        LODWORD(v1) = 0;
      if ((_DWORD)a1 == 102)
        LODWORD(v1) = 102;
      v2 = (_DWORD)a1 == 101;
LABEL_48:
      if (v2)
        return a1;
      else
        return v1;
    }
    switch((int)a1)
    {
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
        goto LABEL_43;
      default:
        return v1;
    }
  }
  return v1;
}

uint64_t PHSuggestionTypeForCPLSuggestionType(uint64_t result)
{
  if ((result - 1) >= 0xA)
    return 0;
  else
    return result;
}

uint64_t CPLSuggestionTypeForPHSuggestionType(uint64_t result)
{
  if ((result - 1) >= 0xA)
    return 0;
  else
    return result;
}

uint64_t CPLSuggestionSubtypeForPHSuggestionSubtype(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  unsigned int v3;

  v1 = 0;
  if ((int)a1 > 679)
  {
    if ((int)a1 <= 900)
    {
      if ((int)a1 > 701)
      {
        switch((int)a1)
        {
          case 801:
          case 802:
          case 803:
          case 804:
LABEL_43:
            v1 = a1;
            break;
          default:
            if ((_DWORD)a1 == 703)
              LODWORD(v1) = 703;
            else
              LODWORD(v1) = 0;
            v2 = (_DWORD)a1 == 702;
            goto LABEL_48;
        }
      }
      else
      {
        if ((_DWORD)a1 == 701)
          LODWORD(v1) = 701;
        else
          LODWORD(v1) = 0;
        if ((_DWORD)a1 == 682)
          LODWORD(v1) = 682;
        if ((_DWORD)a1 == 681)
          v3 = 681;
        else
          v3 = 0;
        if ((_DWORD)a1 == 680)
          v3 = 680;
        if ((int)a1 <= 681)
          return v3;
        else
          return v1;
      }
    }
    else
    {
      switch((int)a1)
      {
        case 901:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
          goto LABEL_43;
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
          return v1;
        default:
          if ((_DWORD)a1 == 1102)
            LODWORD(v1) = 1102;
          else
            LODWORD(v1) = 0;
          v2 = (_DWORD)a1 == 1101;
          goto LABEL_48;
      }
    }
  }
  else if ((int)a1 > 400)
  {
    if ((int)a1 <= 600)
    {
      if ((_DWORD)a1 == 502)
        LODWORD(v1) = 502;
      else
        LODWORD(v1) = 0;
      if ((_DWORD)a1 == 501)
        LODWORD(v1) = 501;
      v2 = (_DWORD)a1 == 401;
      goto LABEL_48;
    }
    switch((int)a1)
    {
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
        goto LABEL_43;
      default:
        switch((int)a1)
        {
          case 652:
          case 653:
          case 654:
          case 655:
            goto LABEL_43;
          default:
            return v1;
        }
    }
  }
  else
  {
    if ((int)a1 <= 300)
    {
      if ((int)a1 > 200)
      {
        switch((int)a1)
        {
          case 201:
          case 202:
          case 203:
          case 204:
            goto LABEL_43;
          default:
            return v1;
        }
        return v1;
      }
      if ((_DWORD)a1 == 103)
        LODWORD(v1) = 103;
      else
        LODWORD(v1) = 0;
      if ((_DWORD)a1 == 102)
        LODWORD(v1) = 102;
      v2 = (_DWORD)a1 == 101;
LABEL_48:
      if (v2)
        return a1;
      else
        return v1;
    }
    switch((int)a1)
    {
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
        goto LABEL_43;
      default:
        return v1;
    }
  }
  return v1;
}

uint64_t PHSuggestionStateForCPLSuggestionState(uint64_t result)
{
  if ((result - 1) >= 4)
    return 0;
  else
    return result;
}

uint64_t CPLSuggestionStateForPHSuggestionState(uint64_t result)
{
  if ((result - 1) >= 4)
    return 0;
  else
    return result;
}

uint64_t PHSuggestionNotificationStateForCPLSuggestionNotificationState(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

uint64_t CPLSuggestionNotificationStateForPHSuggestionNotificationState(int a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

BOOL PHSuggestionFeaturedStateForPLSuggestionFeaturedState(int a1)
{
  return a1 != 0;
}

BOOL PLSuggestionFeaturedStateForPHSuggestionFeaturedState(int a1)
{
  return a1 != 0;
}

const __CFString *PHSuggestionStringWithType(int a1)
{
  if ((a1 - 1) > 9)
    return CFSTR("Unknown Type");
  else
    return off_1E35DDBA8[(unsigned __int16)(a1 - 1)];
}

const __CFString *PHSuggestionStateStringWithState(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("Unknown State");
  else
    return off_1E35DDBF8[a1];
}

const __CFString *PHSuggestionNotificationStateStringWithNotificationState(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown State");
  else
    return off_1E35DDC20[a1];
}

const __CFString *PHSuggestionFeaturedStateStringWithFeaturedState(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown State");
  if (a1 == 1)
    v1 = CFSTR("Currently Featured");
  if (a1)
    return v1;
  else
    return CFSTR("Not Featured");
}

const __CFString *PHAssetSyndicationEligibilityShortDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 6) > 8)
    return CFSTR("Unknown");
  else
    return off_1E35DDC80[a1 + 6];
}

const __CFString *PHAssetSyndicationEligibilityDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 6) > 8)
    return CFSTR("Unknown");
  else
    return off_1E35DDCC8[a1 + 6];
}

id PHAssetMediaAnalysisSyndicationProcessingValueDescription(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!a1)
  {
    v4 = CFSTR("None");
LABEL_34:
    objc_msgSend(v3, "addObject:", v4);
    goto LABEL_35;
  }
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("No Moment For Date"));
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Time"));
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "addObject:", CFSTR("No Location"));
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("Location Too Far"));
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("Location"));
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("Owner Face"));
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("Face"));
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "addObject:", CFSTR("Moment Previously Matched"));
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "addObject:", CFSTR("Detected As Duplicate"));
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "addObject:", CFSTR("Pet"));
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "addObject:", CFSTR("CoreRoutine"));
  if ((a1 & 0x800) == 0)
  {
LABEL_14:
    if ((a1 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "addObject:", CFSTR("Significant Location"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_15:
    if ((a1 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "addObject:", CFSTR("SavedGuestAsset"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "addObject:", CFSTR("Sceneprint"));
  if ((a1 & 0x4000) != 0)
  {
LABEL_33:
    v4 = CFSTR("Child");
    goto LABEL_34;
  }
LABEL_35:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *PHAssetSyndicationProcessingVersionDescription(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;

  if ((unint64_t)(a1 - 1) > 0xFFFFFFFFFFFFFFFDLL)
    return CFSTR("Not processed for guest inference");
  v3 = CFSTR("(final)");
  if ((a1 & 0x10000) == 0)
    v3 = CFSTR("(need face processing)");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v.%llu %@"), a1 & 0xFFFFFFFFFFFEFFFFLL, v3, v1, v2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t PHAssetSyndicationProcessingVersionWithFacesProcessed(uint64_t a1)
{
  return a1 | 0x10000;
}

uint64_t PHAssetSyndicationProcessingCurrentVersionForAsset(void *a1)
{
  void *v1;

  objc_msgSend(a1, "faceAdjustmentVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    return 65556;
  else
    return 20;
}

__CFString *PHSearchQueryResultTypesDescription(char a1)
{
  id v2;
  void *v3;
  __CFString *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("asset"));
  if ((a1 & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("collection"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("invalid");
  }

  return v4;
}

void sub_1993D90B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PHStringForMemoryCurationLength(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E35DDFE8[a1];
}

uint64_t PHMemoryCurationLengthForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Short")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Medium")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Long")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

const __CFString *PHShareStatusDebugDescription(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DE088[(unsigned __int16)(a1 - 1)];
}

const __CFString *PHShareParticipantPermissionDebugDescription(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DE0A0[a1 - 1];
}

const __CFString *PHShareTrashedStateDebugDescription(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("trashed");
  if (a1)
    return v1;
  else
    return CFSTR("not trashed");
}

const __CFString *PHSharePublishStateDebugDescription(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DE0B8[a1 - 1];
}

void sub_1993DE978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993DEA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993DEB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993DEE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1993DF108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36259(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36260(uint64_t a1)
{

}

void sub_1993E019C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1993E3820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993E38C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993E3960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993E3A30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1993E4D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36679(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36680(uint64_t a1)
{

}

void sub_1993E717C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993E7754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993E7A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1993E7C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36869(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36870(uint64_t a1)
{

}

void sub_1993E9C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37056(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37057(uint64_t a1)
{

}

uint64_t PHErrorAllowsInternalErrors()
{
  uint64_t result;

  result = MEMORY[0x19AEBDEDC]();
  if ((_DWORD)result)
  {
    if (PHErrorSuppressInternalErrors_onceToken != -1)
      dispatch_once(&PHErrorSuppressInternalErrors_onceToken, &__block_literal_global_63);
    return PHErrorSuppressInternalErrors_suppressInternalErrors == 0;
  }
  return result;
}

const __CFString *NSStringFromPHErrorCode(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 3209)
  {
    switch(a1)
    {
      case 3300:
        return CFSTR("PHPhotosErrorChangeNotSupported");
      case 3301:
        return CFSTR("PHPhotosErrorOperationInterrupted");
      case 3302:
        return CFSTR("PHPhotosErrorInvalidResource");
      case 3303:
        return CFSTR("PHPhotosErrorMissingResource");
      case 3304:
      case 3307:
      case 3308:
      case 3309:
        goto LABEL_26;
      case 3305:
        return CFSTR("PHPhotosErrorNotEnoughSpace");
      case 3306:
        return CFSTR("PHPhotosErrorRequestNotSupportedForAsset");
      case 3310:
        return CFSTR("PHPhotosErrorAccessRestricted");
      case 3311:
        return CFSTR("PHPhotosErrorAccessUserDenied");
      default:
        if (a1 == 3210)
        {
          result = CFSTR("PHPhotosErrorPersistentChangeDetailsUnavailable");
        }
        else
        {
          if (a1 != 5423)
            goto LABEL_26;
LABEL_21:
          result = CFSTR("PHPhotosErrorLibraryInFileProviderSyncRoot");
        }
        break;
    }
  }
  else
  {
    if (a1 > 3141)
    {
      if (a1 > 3200)
      {
        if (a1 == 3201)
          return CFSTR("PHPhotosErrorIdentifierNotFound");
        if (a1 == 3202)
          return CFSTR("PHPhotosErrorMultipleIdentifiersFound");
      }
      else
      {
        if (a1 == 3142)
          return CFSTR("PHPhotosErrorRelinquishingLibraryBundleToWriter");
        if (a1 == 3143)
          return CFSTR("PHPhotosErrorSwitchingSystemPhotoLibrary");
      }
    }
    else if (a1 > 3104)
    {
      if (a1 == 3105)
        return CFSTR("PHPhotosErrorPersistentChangeTokenExpired");
      if (a1 == 3114)
        return CFSTR("PHPhotosErrorLibraryVolumeOffline");
    }
    else
    {
      if (a1 == -1)
        return CFSTR("PHPhotosErrorInternalError");
      if (a1 == 3072)
        return CFSTR("PHPhotosErrorUserCancelled");
    }
LABEL_26:
    if (a1 <= 5400)
    {
      if (a1 <= 3306)
      {
        switch(a1)
        {
          case 3103:
            result = CFSTR("PHPhotosErrorReadFailure");
            break;
          case 3104:
            result = CFSTR("PHPhotosErrorWriteFailure");
            break;
          case 3105:
          case 3113:
          case 3114:
          case 3142:
          case 3143:
          case 3148:
            return CFSTR("unknown");
          case 3106:
            result = CFSTR("PHPhotosErrorLibraryNeedsUpgrade");
            break;
          case 3107:
            result = CFSTR("PHPhotosErrorLibraryDirectoryAlreadyExists");
            break;
          case 3108:
            result = CFSTR("PHPhotosErrorLibraryDirectoryDoesNotExist");
            break;
          case 3109:
            result = CFSTR("PHPhotosErrorLibraryNotOpen");
            break;
          case 3110:
            result = CFSTR("PHPhotosErrorNotFound");
            break;
          case 3111:
            result = CFSTR("PHPhotosErrorForbidden");
            break;
          case 3112:
            result = CFSTR("PHPhotosErrorDatabaseLoadFailed");
            break;
          case 3115:
            result = CFSTR("PHPhotosErrorNoSSBAvailable");
            break;
          case 3116:
            result = CFSTR("PHPhotosErrorPostMigration");
            break;
          case 3117:
            result = CFSTR("PHPhotosErrorSectionData");
            break;
          case 3118:
            result = CFSTR("PHPhotosErrorCoreData");
            break;
          case 3119:
            result = CFSTR("PHPhotosErrorDirectoryCreation");
            break;
          case 3120:
            result = CFSTR("PHPhotosErrorDirectoryMove");
            break;
          case 3121:
            result = CFSTR("PHPhotosErrorFileClone");
            break;
          case 3122:
            result = CFSTR("PHPhotosErrorFileCloneUnsupported");
            break;
          case 3123:
            result = CFSTR("PHPhotosErrorFileMove");
            break;
          case 3124:
            result = CFSTR("PHPhotosErrorModelCreation");
            break;
          case 3125:
            result = CFSTR("PHPhotosErrorModelMigration");
            break;
          case 3126:
            result = CFSTR("PHPhotosErrorUnsupported");
            break;
          case 3127:
            result = CFSTR("PHPhotosErrorLibraryClone");
            break;
          case 3128:
            result = CFSTR("PHPhotosErrorMigrationCancelled");
            break;
          case 3129:
            result = CFSTR("PHPhotosErrorFailedToOpenLibrary");
            break;
          case 3130:
            result = CFSTR("PHPhotosErrorMigrationPhase");
            break;
          case 3131:
            result = CFSTR("PHPhotosErrorNewerSchema");
            break;
          case 3132:
            result = CFSTR("PHPhotosErrorNoConnectionInterrupted");
            break;
          case 3133:
            result = CFSTR("PHPhotosErrorNoConnectionInvalidated");
            break;
          case 3134:
            result = CFSTR("PHPhotosErrorNoDelegate");
            break;
          case 3135:
            result = CFSTR("PHPhotosErrorNoURLBookmark");
            break;
          case 3136:
            result = CFSTR("PHPhotosErrorObtainPIDLockFail");
            break;
          case 3137:
            result = CFSTR("PHPhotosErrorPreMigrationPhase");
            break;
          case 3138:
            result = CFSTR("PHPhotosErrorResumeFailed");
            break;
          case 3139:
            result = CFSTR("PHPhotosErrorTimeout");
            break;
          case 3140:
            result = CFSTR("PHPhotosErrorValidationIssue");
            break;
          case 3141:
            result = CFSTR("PHPhotosErrorException");
            break;
          case 3144:
            result = CFSTR("PHPhotosErrorDeletionCheck");
            break;
          case 3145:
            result = CFSTR("PHPhotosErrorRebuildRequested");
            break;
          case 3146:
            result = CFSTR("PHPhotosErrorShutdownRequested");
            break;
          case 3147:
            result = CFSTR("PHPhotosErrorNoCloudPhotoLibraryManager");
            break;
          case 3149:
            result = CFSTR("PHPhotosErrorLegacyUpgradeFailed");
            break;
          case 3150:
            result = CFSTR("PHPhotosErrorMissingDatabaseFiles");
            break;
          case 3151:
            result = CFSTR("PHPhotosErrorMigrationInProgress");
            break;
          case 3152:
            result = CFSTR("PHPhotosErrorMigrationRebuild");
            break;
          case 3153:
            result = CFSTR("PHPhotosErrorMigrationAquireFSReservation");
            break;
          case 3154:
            result = CFSTR("PHPhotosErrorMigrationAquirePIDLock");
            break;
          case 3155:
            result = CFSTR("PHPhotosErrorMigrationPLMUInternal");
            break;
          case 3156:
            result = CFSTR("PHPhotosErrorMigrationLithiumInternal");
            break;
          case 3157:
            result = CFSTR("PHPhotosErrorMigrationUnknownLibraryType");
            break;
          case 3158:
            result = CFSTR("PHPhotosErrorClientNormalClose");
            break;
          case 3159:
            result = CFSTR("PHPhotosErrorClientDealloc");
            break;
          case 3160:
            result = CFSTR("PHPhotosErrorClientRequestedCloseAndDeleteLibrary");
            break;
          case 3161:
            result = CFSTR("PHPhotosErrorLibraryFilesystemDeleteFailed");
            break;
          case 3162:
            result = CFSTR("PHPhotosErrorServiceSandboxExtensionConsumeFailed");
            break;
          case 3163:
            result = CFSTR("PHPhotosErrorServiceSandboxExtensionCreateFailed");
            break;
          case 3164:
            result = CFSTR("PHPhotosErrorNetworkAccessRequired");
            break;
          case 3165:
            result = CFSTR("PHPhotosErrorClientRequestedCloseLibrary");
            break;
          case 3166:
            result = CFSTR("PHPhotosErrorDataVaultRequiresClientSandboxOrEntitlement");
            break;
          case 3167:
            result = CFSTR("PHPhotosErrorOperationCancelled");
            break;
          case 3168:
            result = CFSTR("PHPhotosErrorUnsupportedLegacyLibrary");
            break;
          case 3169:
            result = CFSTR("PHPhotosErrorNetworkError");
            break;
          case 3170:
            result = CFSTR("PHPhotosErrorNetworkIsConstrained");
            break;
          default:
            if (a1)
              return CFSTR("unknown");
            result = CFSTR("PHPhotosErrorNone");
            break;
        }
        return result;
      }
      if (a1 > 4301)
      {
        switch(a1)
        {
          case 5101:
            result = CFSTR("PHPhotosErrorClientNotEntitled");
            break;
          case 5102:
            result = CFSTR("PHPhotosErrorNotAuthorized");
            break;
          case 5103:
            result = CFSTR("PHPhotosErrorBookmarkResolutionFailed");
            break;
          case 5104:
            result = CFSTR("PHPhotosErrorClientSandboxExtensionConsumeFailed");
            break;
          case 5105:
            result = CFSTR("PHPhotosErrorClientSandboxExtensionCreateFailed");
            break;
          case 5106:
            result = CFSTR("PHPhotosErrorNoPersistentStores");
            break;
          case 5107:
            result = CFSTR("PHPhotosErrorMultiLibraryService");
            break;
          default:
            if (a1 == 4302)
            {
              result = CFSTR("PHPhotosErrorInvalidState");
            }
            else
            {
              if (a1 != 4303)
                return CFSTR("unknown");
              result = CFSTR("PHPhotosErrorTerminationImminent");
            }
            break;
        }
        return result;
      }
      if (a1 > 4102)
      {
        if (a1 > 4201)
        {
          if (a1 == 4202)
            return CFSTR("PHPhotosErrorJobQueueFull");
          if (a1 == 4301)
            return CFSTR("PHPhotosErrorUnknownState");
        }
        else
        {
          if (a1 == 4103)
            return CFSTR("PHPhotosErrorXPC");
          if (a1 == 4201)
            return CFSTR("PHPhotosErrorNoData");
        }
      }
      else
      {
        if (a1 > 4100)
        {
          if (a1 == 4101)
            return CFSTR("PHPhotosErrorXPCConnectionReplyInvalid");
          else
            return CFSTR("PHPhotosErrorXPCConnectionReplyTimeout");
        }
        if (a1 == 3307)
          return CFSTR("PHPhotosErrorObjectStale");
        if (a1 == 3311)
          return CFSTR("PHPhotosErrorAccessUserDenied");
      }
      return CFSTR("unknown");
    }
    if (a1 > 6099)
    {
      if (a1 <= 7400)
      {
        if (a1 > 6300)
        {
          switch(a1)
          {
            case 6301:
              return CFSTR("PHPhotosErrorPersonMissingKeyFace");
            case 7001:
              return CFSTR("PHPhotosErrorImageManagerResourceDecodeError");
            case 7003:
              return CFSTR("PHPhotosErrorImageManagerTableThumbDecodeError");
          }
          return CFSTR("unknown");
        }
        switch(a1)
        {
          case 6201:
            result = CFSTR("PHPhotosErrorLibraryImportUnknown");
            break;
          case 6202:
            result = CFSTR("PHPhotosErrorLibraryImportInvalid");
            break;
          case 6203:
            result = CFSTR("PHPhotosErrorLibraryImportNeedsMigration");
            break;
          case 6204:
            result = CFSTR("PHPhotosErrorLibraryImportNeedsForceRepair");
            break;
          case 6205:
            result = CFSTR("PHPhotosErrorLibraryImportNeedsTimeMachineRestore");
            break;
          case 6206:
            result = CFSTR("PHPhotosErrorLibraryImportNeedsDisableCPL");
            break;
          case 6207:
            result = CFSTR("PHPhotosErrorLibraryImportNeedsDisabledCPLCleanupCompletion");
            break;
          case 6208:
            result = CFSTR("PHPhotosErrorLibraryImportProcessingError");
            break;
          case 6209:
            result = CFSTR("PHPhotosErrorLibraryImportIsLegacyLibrary");
            break;
          default:
            if (a1 != 6100)
              return CFSTR("unknown");
            result = CFSTR("PHPhotosErrorSpotlightSearchTimeout");
            break;
        }
      }
      else if (a1 > 8001)
      {
        switch(a1)
        {
          case 8500:
            result = CFSTR("PHPhotosErrorSharedLibraryExceedsMaxLibraries");
            break;
          case 8501:
            result = CFSTR("PHPhotosErrorSharedLibraryBlockedInExit");
            break;
          case 8502:
            result = CFSTR("PHPhotosErrorManagedAppleIDRestricted");
            break;
          case 8503:
            result = CFSTR("PHPhotosErrorU13Restricted");
            break;
          case 8504:
            result = CFSTR("PHPhotosErrorShareRegionUnsupported");
            break;
          case 8505:
            result = CFSTR("PHPhotosErrorSharedLibraryIsOwned");
            break;
          case 8506:
            result = CFSTR("PHPhotosErrorSharedLibraryDoesNotHaveACurrentUser");
            break;
          case 8507:
            result = CFSTR("PHPhotosErrorInvalidEmailAddress");
            break;
          default:
            if (a1 == 8002)
            {
              result = CFSTR("PHPhotosErrorUnknownTaskID");
            }
            else
            {
              if (a1 != 9999)
                return CFSTR("unknown");
              result = CFSTR("PHPhotosErrorFeatureDisabled");
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 7401:
            result = CFSTR("PHPhotosErrorSocialGroupAlreadyExists");
            break;
          case 7402:
            result = CFSTR("PHPhotosErrorSocialGroupInvalidKeyAsset");
            break;
          case 7403:
            result = CFSTR("PHPhotosErrorSocialGroupOrderNegative");
            break;
          case 7404:
            result = CFSTR("PHPhotosErrorSocialGroupNeedsAtLeastTwoPersons");
            break;
          case 7405:
            result = CFSTR("PHPhotosErrorSocialGroupApproveRejectedMemberByNonUser");
            break;
          case 7406:
            result = CFSTR("PHPhotosErrorSocialGroupNeedsCommonAsset");
            break;
          case 7407:
            result = CFSTR("PHPhotosErrorSocialGroupRemoveMemberByNonUser");
            break;
          case 7408:
            result = CFSTR("PHPhotosErrorSocialGroupMemberNotFound");
            break;
          case 7409:
            result = CFSTR("PHPhotosErrorSocialGroupOverrideUserPickedKeyAssetByNonUser");
            break;
          default:
            if (a1 != 8001)
              return CFSTR("unknown");
            result = CFSTR("PHPhotosErrorAssetLimitExceeded");
            break;
        }
      }
    }
    else if (a1 > 5600)
    {
      switch(a1)
      {
        case 6001:
          result = CFSTR("PHPhotosErrorShareNetworkError");
          break;
        case 6002:
          result = CFSTR("PHPhotosErrorShareInvalidShareURL");
          break;
        case 6003:
          result = CFSTR("PHPhotosErrorShareNotFound");
          break;
        case 6004:
          result = CFSTR("PHPhotosErrorShareTrashed");
          break;
        case 6005:
          result = CFSTR("PHPhotosErrorShareInvalidAction");
          break;
        case 6006:
          result = CFSTR("PHPhotosErrorShareCPLClosed");
          break;
        case 6007:
          result = CFSTR("PHPhotosErrorShareCPLExitMode");
          break;
        case 6008:
          result = CFSTR("PHPhotosErrorShareQuotaExceeded");
          break;
        case 6009:
          result = CFSTR("PHPhotosErrorShareBusy");
          break;
        case 6010:
          result = CFSTR("PHPhotosErrorShareForbidden");
          break;
        case 6011:
          result = CFSTR("PHPhotosErrorShareTooManyParticipants");
          break;
        case 6012:
          result = CFSTR("PHPhotosErrorShareCloudNotAuthenticated");
          break;
        default:
          if (a1 == 5601)
          {
            result = CFSTR("PHPhotosErrorInvalidFileIdentifier");
          }
          else
          {
            if (a1 != 5602)
              return CFSTR("unknown");
            result = CFSTR("PHPhotosErrorMissingLibraryBundle");
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 5401:
          result = CFSTR("PHPhotosErrorDatabaseOpenError");
          break;
        case 5402:
          result = CFSTR("PHPhotosErrorInvalidURL");
          break;
        case 5403:
          result = CFSTR("PHPhotosErrorLibraryInTrash");
          break;
        case 5404:
          result = CFSTR("PHPhotosErrorNoPermission");
          break;
        case 5405:
          result = CFSTR("PHPhotosErrorReadOnlyFilesystem");
          break;
        case 5406:
          result = CFSTR("PHPhotosErrorSandboxNoPermission");
          break;
        case 5407:
          result = CFSTR("PHPhotosErrorUnsupportedFilesystem");
          break;
        case 5408:
          result = CFSTR("PHPhotosErrorPLMUUpgradeCompleted");
          break;
        case 5409:
          result = CFSTR("PHPhotosErrorLibraryUnsupported");
          break;
        case 5410:
          result = CFSTR("PHPhotosErrorLibraryTooNew");
          break;
        case 5411:
          result = CFSTR("PHPhotosErrorLibraryRequiresMigration");
          break;
        case 5412:
          result = CFSTR("PHPhotosErrorLightweightMigrationFailed");
          break;
        case 5413:
          result = CFSTR("PHPhotosErrorLibraryCannotOpen");
          break;
        case 5414:
          result = CFSTR("PHPhotosErrorDatabaseIsLocked");
          break;
        case 5415:
          result = CFSTR("PHPhotosErrorLibraryTooOld");
          break;
        case 5416:
          result = CFSTR("PHPhotosErrorLibraryVolumeUnmountRequested");
          break;
        case 5417:
          result = CFSTR("PHPhotosErrorDatabaseIsCorrupt");
          break;
        case 5418:
          result = CFSTR("PHPhotosErrorMigrationMissingRebuildData");
          break;
        case 5419:
          result = CFSTR("PHPhotosErrorStagedMigrationFailed");
          break;
        case 5420:
          result = CFSTR("PHPhotosErrorBackgroundMigrationFailed");
          break;
        case 5421:
          result = CFSTR("PHPhotosErrorLibraryInTimeMachineBackupLocation");
          break;
        case 5422:
          result = CFSTR("PHPhotosErrorUserPreventedRebuild");
          break;
        case 5423:
          goto LABEL_21;
        case 5424:
          result = CFSTR("PHPhotosErrorMismatchURL");
          break;
        case 5425:
          result = CFSTR("PHPhotosErrorExistingIdentifier");
          break;
        case 5426:
          result = CFSTR("PHPhotosErrorLibraryCreationFailed");
          break;
        default:
          if (a1 != 5600)
            return CFSTR("unknown");
          result = CFSTR("PHPhotosErrorFailedToCreateDefaultDirectories");
          break;
      }
    }
  }
  return result;
}

id PHErrorFromPLError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v7 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74498]);

  if (v4)
  {
    v5 = objc_msgSend(v2, "code");
    v6 = -1;
    if (v5 > 46300)
    {
      if (v5 > 46799)
      {
        if (v5 <= 72000)
        {
          if (v5 <= 47001)
          {
            switch(v5)
            {
              case 46800:
                v6 = 5600;
                break;
              case 46801:
                v6 = 5601;
                break;
              case 46802:
                v6 = 5602;
                break;
            }
          }
          else if (v5 > 47015)
          {
            if (v5 == 47016)
            {
              v6 = 3302;
            }
            else if (v5 == 47018)
            {
              v6 = 3164;
            }
          }
          else if (v5 == 47002)
          {
            v6 = 3072;
          }
          else if (v5 == 47006)
          {
            v6 = 3303;
          }
        }
        else if (v5 > 73000)
        {
          switch(v5)
          {
            case 73001:
              v6 = 6301;
              break;
            case 81001:
              v6 = 8505;
              break;
            case 81003:
              v6 = 8506;
              break;
          }
        }
        else
        {
          switch(v5)
          {
            case 72001:
              v6 = 6201;
              break;
            case 72002:
              v6 = 6202;
              break;
            case 72003:
              v6 = 6203;
              break;
            case 72004:
              v6 = 6204;
              break;
            case 72005:
              v6 = 6205;
              break;
            case 72006:
              v6 = 6206;
              break;
            case 72007:
              v6 = 6207;
              break;
            case 72008:
              v6 = 6208;
              break;
            case 72009:
              v6 = 6209;
              break;
            default:
              goto LABEL_15;
          }
        }
      }
      else
      {
        switch(v5)
        {
          case 46501:
            v6 = 3129;
            break;
          case 46502:
            goto LABEL_86;
          case 46503:
            v6 = 3130;
            break;
          case 46504:
            v6 = 3131;
            break;
          case 46505:
            v6 = 3132;
            break;
          case 46506:
            v6 = 3133;
            break;
          case 46507:
            v6 = 3134;
            break;
          case 46508:
            v6 = 3135;
            break;
          case 46509:
            v6 = 3136;
            break;
          case 46510:
            v6 = 3137;
            break;
          case 46511:
            v6 = 3138;
            break;
          case 46512:
            v6 = 3139;
            break;
          case 46513:
            v6 = 3140;
            break;
          case 46514:
            v6 = 3141;
            break;
          case 46515:
            v6 = 3144;
            break;
          case 46516:
            v6 = 3305;
            break;
          case 46517:
            v6 = 3149;
            break;
          case 46518:
            v6 = 3150;
            break;
          case 46519:
            v6 = 3151;
            break;
          case 46520:
            v6 = 3152;
            break;
          case 46521:
            v6 = 3153;
            break;
          case 46522:
            v6 = 3154;
            break;
          case 46523:
            v6 = 3155;
            break;
          case 46524:
            v6 = 3156;
            break;
          case 46525:
            v6 = 3157;
            break;
          case 46526:
            v6 = 5417;
            break;
          case 46527:
            v6 = 5418;
            break;
          default:
            switch(v5)
            {
              case 46301:
                v6 = 3118;
                break;
              case 46302:
                v6 = 3119;
                break;
              case 46303:
                v6 = 3120;
                break;
              case 46304:
                v6 = 3121;
                break;
              case 46305:
                v6 = 3122;
                break;
              case 46306:
                v6 = 3123;
                break;
              case 46307:
                v6 = 3124;
                break;
              case 46308:
                v6 = 3125;
                break;
              case 46309:
                v6 = 3126;
                break;
              case 46310:
                v6 = 3127;
                break;
              case 46311:
                v6 = 5408;
                break;
              case 46312:
                v6 = 3128;
                break;
              case 46313:
                v6 = 3168;
                break;
              default:
                goto LABEL_15;
            }
            break;
        }
      }
    }
    else if (v5 > 45001)
    {
      if (v5 > 46100)
      {
        switch(v5)
        {
          case 46101:
            v6 = 5401;
            break;
          case 46102:
            v6 = 5402;
            break;
          case 46103:
            v6 = 5403;
            break;
          case 46104:
            v6 = 5404;
            break;
          case 46105:
            v6 = 5405;
            break;
          case 46106:
            v6 = 5406;
            break;
          case 46107:
            v6 = 5407;
            break;
          case 46108:
            v6 = 3117;
            break;
          case 46109:
            v6 = 5424;
            break;
          case 46110:
            v6 = 5425;
            break;
          case 46111:
            v6 = 3201;
            break;
          default:
            goto LABEL_15;
        }
      }
      else
      {
        switch(v5)
        {
          case 45998:
          case 45999:
            v6 = 9999;
            break;
          case 46000:
            goto LABEL_15;
          case 46001:
            v6 = 5409;
            break;
          case 46002:
            goto LABEL_91;
          case 46003:
            v6 = 3116;
            break;
          case 46004:
LABEL_90:
            v6 = 5103;
            break;
          case 46005:
            v6 = 5106;
            break;
          case 46006:
            v6 = 5410;
            break;
          case 46007:
            v6 = 5411;
            break;
          case 46008:
            v6 = 5412;
            break;
          case 46009:
            v6 = 5413;
            break;
          case 46010:
            v6 = 5414;
            break;
          case 46011:
            v6 = 5415;
            break;
          case 46012:
            v6 = 5416;
            break;
          case 46013:
            v6 = 5419;
            break;
          case 46014:
            v6 = 5420;
            break;
          case 46015:
            v6 = 5421;
            break;
          case 46016:
            v6 = 5422;
            break;
          case 46017:
            v6 = 5423;
            break;
          case 46018:
            v6 = 5426;
            break;
          case 46019:
          case 46020:
LABEL_76:
            v6 = 3146;
            break;
          default:
            v26 = 3300;
            if (v5 != 45702)
              v26 = -1;
            if (v5 == 45002)
              v6 = 3311;
            else
              v6 = v26;
            break;
        }
      }
    }
    else if (v5 > 42000)
    {
      if (v5 > 43002)
      {
        if (v5 > 44003)
        {
          if (v5 == 44004)
          {
            v6 = 5105;
          }
          else if (v5 == 45001)
          {
            v6 = 3112;
          }
        }
        else if (v5 == 43003)
        {
          v6 = 4303;
        }
        else if (v5 == 44003)
        {
          v6 = 5104;
        }
      }
      else if (v5 > 43000)
      {
        if (v5 == 43001)
LABEL_91:
          v6 = 4301;
        else
LABEL_86:
          v6 = 4302;
      }
      else if (v5 == 42001)
      {
        v6 = 4201;
      }
      else if (v5 == 42002)
      {
        v6 = 4202;
      }
    }
    else
    {
      switch(v5)
      {
        case 41002:
          v6 = 4103;
          break;
        case 41004:
          v6 = 3110;
          break;
        case 41005:
          v6 = 3111;
          break;
        case 41006:
          v6 = 3103;
          break;
        case 41007:
          v6 = 3104;
          break;
        case 41009:
          v6 = 5101;
          break;
        case 41010:
        case 41011:
          v6 = 5102;
          break;
        case 41012:
          v6 = 3109;
          break;
        case 41013:
          v6 = 3106;
          break;
        case 41014:
          goto LABEL_90;
        case 41015:
          v6 = 3108;
          break;
        case 41017:
          v6 = 3115;
          break;
        case 41018:
          v6 = 3142;
          break;
        case 41019:
          v6 = 3143;
          break;
        case 41020:
          v6 = 3145;
          break;
        case 41021:
          goto LABEL_76;
        case 41022:
          v6 = 3147;
          break;
        case 41023:
          v6 = 3158;
          break;
        case 41024:
          v6 = 3159;
          break;
        case 41025:
          v6 = 3160;
          break;
        case 41026:
          v6 = 3161;
          break;
        case 41027:
          v6 = 3162;
          break;
        case 41028:
          v6 = 3163;
          break;
        case 41029:
          v6 = 3165;
          break;
        case 41030:
          v6 = 3166;
          break;
        case 41031:
          v6 = 3167;
          break;
        default:
          goto LABEL_15;
      }
    }
    goto LABEL_15;
  }
  objc_msgSend(v2, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D74600]);

  if (v9)
  {
    v10 = objc_msgSend(v2, "code");
    v11 = 3169;
    if (v10 != 9)
      v11 = -1;
    if (v10 == 6)
      v6 = 3164;
    else
      v6 = v11;
    goto LABEL_15;
  }
  objc_msgSend(v2, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D11268]);

  if (!v15)
  {
    objc_msgSend(v2, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v18)
    {
      if (objc_msgSend(v2, "code") != -1009 || !dyld_program_sdk_at_least())
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB3388];
        v30[0] = v2;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = (void **)v30;
        v22 = &v29;
LABEL_48:
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v25);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v2, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("PHPhotosErrorDomain"));

      if (!v24)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB3388];
        v28 = v2;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = &v28;
        v22 = &v27;
        goto LABEL_48;
      }
    }
    v12 = v2;
    goto LABEL_16;
  }
  v16 = objc_msgSend(v2, "code");
  if (v16 <= 81)
  {
    if ((unint64_t)(v16 - 80) < 2)
    {
      if (dyld_program_sdk_at_least())
        v6 = 3169;
      else
        v6 = -1;
      goto LABEL_15;
    }
    if (v16 == 51)
    {
      v6 = 3306;
      goto LABEL_15;
    }
    goto LABEL_63;
  }
  if (v16 != 82)
  {
    if (v16 == 1013)
    {
      v6 = 3170;
LABEL_15:
      _PHErrorByCopyingUserInfoFromError(v2, v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v7 = v12;
      goto LABEL_17;
    }
LABEL_63:
    v6 = -1;
    goto LABEL_15;
  }
  if (!dyld_program_sdk_at_least())
    goto LABEL_63;
  PLUnderlyingErrorThatHasDomainAndCode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_63;
LABEL_17:

  return v7;
}

id _PHErrorByCopyingUserInfoFromError(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);

  v7 = *MEMORY[0x1E0CB2938];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NSStringFromPHErrorCode(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v7);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), a2, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id PHNetworkAccessAllowedRequiredError()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Retry with networkAccessAllowed = YES");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3164, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PHStreamingDeniedError()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Retry with streamingAllowed = NO");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3306, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PHPublicErrorFromError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D11268]))
    {
      if (objc_msgSend(v2, "code") == 1005)
      {

LABEL_10:
        v8 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v2, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v2, "code");
        objc_msgSend(v2, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", v9, v10, v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
      v5 = objc_msgSend(v2, "code");

      if (v5 == 1006)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v7 = objc_msgSend(v2, "code");

      if (v7 == 3072)
        goto LABEL_10;
    }
    else
    {

    }
    PHErrorFromPLError(v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "code");
    objc_msgSend(v9, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", v11, v13, v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v4 = 0;
LABEL_14:

  return v4;
}

void sub_1993F12D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1993F1E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38032(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38033(uint64_t a1)
{

}

void sub_1993F2BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993F2CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993F3828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38372(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38373(uint64_t a1)
{

}

void sub_1993F7770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993F7CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38695(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38696(uint64_t a1)
{

}

void sub_1993F95A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38949(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38950(uint64_t a1)
{

}

void sub_1993F9E8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1993FA0A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t PLImageManagerRecordEnabled()
{
  if (PLImageManagerRecordEnabled_onceToken != -1)
    dispatch_once(&PLImageManagerRecordEnabled_onceToken, &__block_literal_global_39275);
  return PLImageManagerRecordEnabled_s_enabled;
}

void sub_1993FD208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993FDB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993FEC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1993FF060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1993FF3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39603(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__39604(uint64_t a1)
{

}

void sub_199400B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_199401D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t hasValidFullSizePhoto(unsigned int a1)
{
  uint64_t v1;

  if ((a1 & 2) != 0 && (a1 & 0x45044) != 0x45044)
  {
    if ((a1 & 0x80) == 0)
      return 0;
    return (a1 >> 5) & 1;
  }
  v1 = 0;
  if ((~a1 & 0x84) == 0 && (a1 & 0x2AE0A) != 0x2AE0A)
    return (a1 >> 5) & 1;
  return v1;
}

void sub_199405618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHSignpostEventsEnabled()
{
  if (PHSignpostEventsEnabled_onceToken != -1)
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_40514);
  return PHSignpostEventsEnabled_eventsEnabled;
}

uint64_t PHImageManagerSignpostRequestStateFromRecipeID(int a1)
{
  uint64_t result;
  int v2;

  if (a1 <= 131074)
  {
    v2 = a1 - 65737;
    result = 70;
    switch(v2)
    {
      case 0:
        return result;
      case 2:
        result = 71;
        break;
      case 4:
        result = 72;
        break;
      case 6:
        result = 73;
        break;
      default:
        return 51;
    }
  }
  else if (a1 > 131271)
  {
    switch(a1)
    {
      case 131272:
        return 100;
      case 131275:
        return 101;
      case 131277:
        return 102;
      default:
        return 51;
    }
  }
  else
  {
    switch(a1)
    {
      case 131075:
        result = 80;
        break;
      case 131077:
        result = 81;
        break;
      case 131079:
        result = 82;
        break;
      case 131081:
        result = 83;
        break;
      default:
        return 51;
    }
  }
  return result;
}

uint64_t PHFetchSignpostsEnabled()
{
  return kdebug_is_enabled();
}

void sub_199409344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199409484(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1994095C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40547(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40548(uint64_t a1)
{

}

void sub_19940BCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40723(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40724(uint64_t a1)
{

}

void sub_19940C630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40923(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40924(uint64_t a1)
{

}

void sub_19940DB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40955(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40956(uint64_t a1)
{

}

const __CFString *PHChoosingPolicyName(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("best");
  else
    return off_1E35DEFD0[a1];
}

uint64_t _indexOfGainMapInContainer(uint64_t a1, _QWORD *a2)
{
  uint64_t AuxiliaryImageCountForIndex;
  uint64_t v4;
  NSObject *v5;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  AuxiliaryImageCountForIndex = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex();
  if ((_DWORD)AuxiliaryImageCountForIndex)
  {
    v4 = AuxiliaryImageCountForIndex;
    PLImageManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v8 = (int)v4;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to get aux image count, %ld", buf, 0xCu);
    }

  }
  else
  {
    v4 = 0;
  }
  if (a2)
    *a2 = 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

uint64_t _auxImageOrientation()
{
  int AuxiliaryImageGeometryForIndex;
  int v1;
  NSObject *v2;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  AuxiliaryImageGeometryForIndex = CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex();
  if (!AuxiliaryImageGeometryForIndex)
    return 1;
  v1 = AuxiliaryImageGeometryForIndex;
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v5 = v1;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read aux image orientation, default to Up, %ld", buf, 0xCu);
  }

  return 1;
}

void _figReadImageProperties(uint64_t a1, _QWORD *a2)
{
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CMPhotoDecompressionContainerCopyImagePropertiesForIndex();
  if (v3)
  {
    v4 = v3;
    PLImageManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read image properties, %ld", buf, 0xCu);
    }

    v6 = 0;
    if (a2)
    {
LABEL_5:
      objc_msgSend(v6, "hdrGainMapPercentageValue");
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageProperties:contentType:timeZoneLookup:", 0, 0, 0);
    if (!v6)
    {
      PLImageManagerGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - Failed to read gain map average pixel luminance", buf, 2u);
      }

    }
    CFRelease(0);
    if (a2)
      goto LABEL_5;
  }

}

uint64_t PHRequestRetryTypeForRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if ((PHErrorIsXPCConnectionInvalidOrInterrupted(v4) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    if (!PLErrorOrUnderlyingErrorHasDomainAndCode())
    {
      v5 = 0;
      goto LABEL_9;
    }
    v5 = 3;
  }
  if ((unint64_t)objc_msgSend(v3, "fetchIncrementRetryAttemptCount") > 2)
    v5 = 1;
LABEL_9:

  return v5;
}

void sub_199411D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);
  _Block_object_dispose((const void *)(v36 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41847(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41848(uint64_t a1)
{

}

__CFString *_PHDownloadIntentName(unint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 >= 0xD)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E35DF7A0[a1];
  }
  return v1;
}

__CFString *_PHDownloadPriorityName(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1)
  {
    if (a1 == 1)
    {
      v1 = CFSTR("preload");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringValue");
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v1 = CFSTR("on-demand");
  }
  return v1;
}

__CFString *_PHStreamingVideoIntentName(unint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E35DF768[a1];
  }
  return v1;
}

void sub_1994173BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___getNextLayoutID_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v1 = (void *)s_availableLayoutIDs;
  s_availableLayoutIDs = (uint64_t)v0;

  return objc_msgSend((id)s_availableLayoutIDs, "addIndexesInRange:", 1, 100);
}

uint64_t __Block_byref_object_copy__42840(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42841(uint64_t a1)
{

}

uint64_t _getNextLayoutID()
{
  uint64_t v0;
  uint64_t v1;

  if (_getNextLayoutID_onceToken != -1)
    dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_659);
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  v0 = objc_msgSend((id)s_availableLayoutIDs, "firstIndex");
  if (v0 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v1 = 101;
  }
  else
  {
    v1 = v0;
    objc_msgSend((id)s_availableLayoutIDs, "removeIndex:", v0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return v1;
}

uint64_t PHRequestOptionsDownloadIntentIsExplicitUserAction(unint64_t a1)
{
  return (a1 < 0xD) & (0x238u >> a1);
}

void sub_19941CD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43107(uint64_t a1)
{

}

void sub_19941F398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

unint64_t PFAssetBundleMediaTypeFromPHAssetMediaType(unint64_t result)
{
  if (result >= 4)
    return 1;
  return result;
}

uint64_t PFAssetBundleMediaSubtypesFromPHAssetMediaSubtypes(unint64_t a1)
{
  return (a1 >> 1) & 0x20 | a1 & 0x3F031F | (((a1 >> 10) & 1) << 22);
}

uint64_t PFAssetBundlePlaybackStyleFromPHAssetPlaybackStyle(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

uint64_t PFAssetBundlePlaybackVariationFromPHAssetPlaybackVariation(int a1)
{
  if ((a1 - 1) < 3)
    return (unsigned __int16)(a1 - 1) + 1;
  else
    return 0;
}

uint64_t PFAssetBundleVideoComplementVisibilityStateFromPHVideoComplementVisibilityState(char a1)
{
  return a1 & 0xF;
}

void sub_199420D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199421B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_199422080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_199422508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _oidsContainEntity(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "entity", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isKindOfEntity:", v4);

        if ((v10 & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __Block_byref_object_copy__43764(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43765(uint64_t a1)
{

}

void sub_1994236E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_199423A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1994249E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_199427F8C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_199427F98()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_199427FA4()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_199427FB0()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_199427FBC()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_199427FC8()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_199427FD4()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_199427FE0()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_199427FEC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_199427FF8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_199428004()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_199428010()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19942801C()
{
  return MEMORY[0x1E0DEAAC8]();
}

uint64_t sub_199428028()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_199428034()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_199428040()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19942804C()
{
  return MEMORY[0x1E0C977B8]();
}

uint64_t sub_199428058()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_199428064()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_199428070()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19942807C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_199428088()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_199428094()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1994280A0()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1994280AC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1994280B8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1994280C4()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1994280D0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1994280DC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1994280E8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1994280F4()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_199428100()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_19942810C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_199428118()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_199428124()
{
  return MEMORY[0x1E0DEDF40]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBB8](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1E0C9CC70]();
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1E0C9CCC8](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

uint64_t CGImageIsDecodable()
{
  return MEMORY[0x1E0CBC380]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1E0C9CD10]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC500](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC528](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC550]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x1E0C9CE28]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1E0C9E2F8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMPhotoDecompressionContainerCancelAsyncRequest()
{
  return MEMORY[0x1E0D08D98]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndex()
{
  return MEMORY[0x1E0D08DD0]();
}

uint64_t CMPhotoDecompressionContainerCopyImagePropertiesForIndex()
{
  return MEMORY[0x1E0D08E18]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1E0D08E48]();
}

uint64_t CMPhotoDecompressionContainerDecodeAuxiliaryImageForIndexAsyncF()
{
  return MEMORY[0x1E0D08EA8]();
}

uint64_t CMPhotoDecompressionContainerDecodeImageForIndexAsyncF()
{
  return MEMORY[0x1E0D08EB8]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex()
{
  return MEMORY[0x1E0D08ED8]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex()
{
  return MEMORY[0x1E0D08EF0]();
}

uint64_t CMPhotoDecompressionContainerGetImageGeometryForIndex()
{
  return MEMORY[0x1E0D08F30]();
}

uint64_t CMPhotoDecompressionCreateCGImageForIndex()
{
  return MEMORY[0x1E0D08F98]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1E0D08FE8]();
}

uint64_t CMPhotoDecompressionSessionReserveRequestID()
{
  return MEMORY[0x1E0D09018]();
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

uint64_t CPAnalyticsLog()
{
  return MEMORY[0x1E0D09758]();
}

uint64_t CPLPrimaryScopeIdentifierForCurrentUniverse()
{
  return MEMORY[0x1E0D11318]();
}

uint64_t CPLStatusFromPathManager()
{
  return MEMORY[0x1E0D71558]();
}

uint64_t DCIM_CGImageRefFromPLImage()
{
  return MEMORY[0x1E0D72FC8]();
}

uint64_t DCIM_NSStringFromCGRect()
{
  return MEMORY[0x1E0D72FE0]();
}

uint64_t DCIM_NSStringFromCGSize()
{
  return MEMORY[0x1E0D72FE8]();
}

uint64_t DCIM_NSValueFromCGRect()
{
  return MEMORY[0x1E0D72FF0]();
}

uint64_t DCIM_NSValueFromCGSize()
{
  return MEMORY[0x1E0D72FF8]();
}

uint64_t DCIM_NSValueToCGRect()
{
  return MEMORY[0x1E0D73000]();
}

uint64_t DCIM_NSValueToCGSize()
{
  return MEMORY[0x1E0D73008]();
}

uint64_t DCIM_applicationDidReceiveMemoryWarningNotificationName()
{
  return MEMORY[0x1E0D73020]();
}

uint64_t DCIM_boundsFromScreen()
{
  return MEMORY[0x1E0D73050]();
}

uint64_t DCIM_newPLImageWithCGImage()
{
  return MEMORY[0x1E0D73088]();
}

uint64_t DCIM_newPLImageWithContentsOfFile()
{
  return MEMORY[0x1E0D73090]();
}

uint64_t DCIM_newPLImageWithContentsOfFileURL()
{
  return MEMORY[0x1E0D73098]();
}

uint64_t DCIM_newPLImageWithData()
{
  return MEMORY[0x1E0D730A0]();
}

uint64_t DCIM_newPLImageWithStoredJPEGData()
{
  return MEMORY[0x1E0D730B0]();
}

uint64_t DCIM_newPNGRepresentationWithPLImage()
{
  return MEMORY[0x1E0D730B8]();
}

uint64_t DCIM_newResizablePLImageWithCGImage()
{
  return MEMORY[0x1E0D730C0]();
}

uint64_t DCIM_orientationFromPLImage()
{
  return MEMORY[0x1E0D730C8]();
}

uint64_t DCIM_scaleFromScreen()
{
  return MEMORY[0x1E0D730E8]();
}

uint64_t DCIM_scaleImageFromURL()
{
  return MEMORY[0x1E0D730F0]();
}

uint64_t DCIM_sizeFromPLImage()
{
  return MEMORY[0x1E0D730F8]();
}

uint64_t DCIM_sizeScale()
{
  return MEMORY[0x1E0D73100]();
}

uint64_t DCIM_sizeScaleToFillSize()
{
  return MEMORY[0x1E0D73108]();
}

uint64_t DCIM_sizeScaleToFitSize()
{
  return MEMORY[0x1E0D73110]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSHashRemove(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BF0](table, pointer);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x1E0D753F8]();
}

uint64_t PFDeviceLockScreenFocusAreaRectNormalized()
{
  return MEMORY[0x1E0D75400]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x1E0D75410]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x1E0D75480]();
}

uint64_t PFMap()
{
  return MEMORY[0x1E0D710C8]();
}

uint64_t PFMethodNotImplementedException()
{
  return MEMORY[0x1E0D710D0]();
}

uint64_t PFMutableArrayShuffleWithRandomNumberGenerator()
{
  return MEMORY[0x1E0D75540]();
}

uint64_t PFOrientationInverse()
{
  return MEMORY[0x1E0D75548]();
}

uint64_t PFOrientationTransformImageSize()
{
  return MEMORY[0x1E0D75550]();
}

uint64_t PFReadPairingIdentifierFromImageAtPath()
{
  return MEMORY[0x1E0D75890]();
}

uint64_t PFSceneTaxonomyNodeDetectorsCount()
{
  return MEMORY[0x1E0D758B0]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x1E0D758E8]();
}

uint64_t PFSceneTaxonomyNodeNetworkId()
{
  return MEMORY[0x1E0D758F0]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x1E0D758F8]();
}

uint64_t PFSceneTaxonomyNodeVisitDetectors()
{
  return MEMORY[0x1E0D75908]();
}

uint64_t PFSharedFigDecodeSession()
{
  return MEMORY[0x1E0D75920]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x1E0D71138]();
}

uint64_t PFStoryColorGradeKindDefaultForColorGradeCategory()
{
  return MEMORY[0x1E0D75980]();
}

uint64_t PFStoryColorGradeKindToString()
{
  return MEMORY[0x1E0D75988]();
}

uint64_t PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision()
{
  return MEMORY[0x1E0D759E0]();
}

uint64_t PFStoryTitleCategoryGetSerializedTitleCategory()
{
  return MEMORY[0x1E0D75A28]();
}

uint64_t PFStoryValidatedTitleCategory()
{
  return MEMORY[0x1E0D75A58]();
}

uint64_t PFStringFromDateTimeZoneFormat()
{
  return MEMORY[0x1E0D75A60]();
}

uint64_t PFVideoComplementMetadataForVideoAVAssetWithKnownValues()
{
  return MEMORY[0x1E0D75A88]();
}

uint64_t PFVideoComplementMetadataForVideoAtPath()
{
  return MEMORY[0x1E0D75A90]();
}

uint64_t PLAbstractMethodException()
{
  return MEMORY[0x1E0D73358]();
}

uint64_t PLApproximateResourceSizeFromScale()
{
  return MEMORY[0x1E0D71C38]();
}

uint64_t PLArrayFromEnumeration()
{
  return MEMORY[0x1E0D71C40]();
}

uint64_t PLArrayFromXPCDictionary()
{
  return MEMORY[0x1E0D733D8]();
}

uint64_t PLArrayFromXPCObject()
{
  return MEMORY[0x1E0D733E0]();
}

uint64_t PLAssetAnalysisGetLog()
{
  return MEMORY[0x1E0D733E8]();
}

uint64_t PLAssetImportGetLog()
{
  return MEMORY[0x1E0D73408]();
}

uint64_t PLAssetKindPredicateForTaskID()
{
  return MEMORY[0x1E0D71C50]();
}

uint64_t PLAttachmentIndexFromMessagesSyndicationID()
{
  return MEMORY[0x1E0D71C60]();
}

uint64_t PLAvailabilityRequestGetLog()
{
  return MEMORY[0x1E0D73490]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x1E0D73498]();
}

uint64_t PLBackendSharingGetLog()
{
  return MEMORY[0x1E0D734A0]();
}

uint64_t PLBundleIdentifier()
{
  return MEMORY[0x1E0D734C0]();
}

uint64_t PLCGRectIsNormalized()
{
  return MEMORY[0x1E0D734C8]();
}

uint64_t PLCGSizeScaledToFitSize()
{
  return MEMORY[0x1E0D734D0]();
}

uint64_t PLCacheMetricsCollectorGetLog()
{
  return MEMORY[0x1E0D734F8]();
}

uint64_t PLChangeHandlingGetLog()
{
  return MEMORY[0x1E0D73528]();
}

uint64_t PLConvertMercuryUUIDString()
{
  return MEMORY[0x1E0D73580]();
}

uint64_t PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers()
{
  return MEMORY[0x1E0D71D60]();
}

uint64_t PLCreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0D73D68]();
}

uint64_t PLCreateIOSurfaceFromXPCDictionary()
{
  return MEMORY[0x1E0D73D88]();
}

uint64_t PLCreateImageWithFormatFromImage()
{
  return MEMORY[0x1E0D73D98]();
}

uint64_t PLCreateShortLivedPhotoLibraryWithPhotoLibraryURL()
{
  return MEMORY[0x1E0D71D70]();
}

uint64_t PLCreateShortLivedWellKnownPhotoLibrary()
{
  return MEMORY[0x1E0D71D78]();
}

uint64_t PLDataFromManagedObjectID()
{
  return MEMORY[0x1E0D73DD8]();
}

uint64_t PLDataFromXPCDataObject()
{
  return MEMORY[0x1E0D73DE0]();
}

uint64_t PLDataFromXPCDictionary()
{
  return MEMORY[0x1E0D73DE8]();
}

uint64_t PLDataStoreForClassIDAndLibraryID()
{
  return MEMORY[0x1E0D71D88]();
}

uint64_t PLDataStoreHasClassID()
{
  return MEMORY[0x1E0D71D90]();
}

uint64_t PLDateFromXPCDictionary()
{
  return MEMORY[0x1E0D73DF8]();
}

uint64_t PLDateFromXPCObject()
{
  return MEMORY[0x1E0D73E00]();
}

uint64_t PLDebugStringForSearchIndexCategory()
{
  return MEMORY[0x1E0D71DA8]();
}

uint64_t PLDescriptionForPhotosHighlightCategory()
{
  return MEMORY[0x1E0D71DB0]();
}

uint64_t PLDescriptionForPhotosHighlightKind()
{
  return MEMORY[0x1E0D71DB8]();
}

uint64_t PLDescriptionForPhotosHighlightType()
{
  return MEMORY[0x1E0D71DC0]();
}

uint64_t PLDictionaryFromXPCDictionary()
{
  return MEMORY[0x1E0D73E38]();
}

uint64_t PLDictionaryFromXPCObject()
{
  return MEMORY[0x1E0D73E40]();
}

uint64_t PLDiffArrays()
{
  return MEMORY[0x1E0D71DD8]();
}

uint64_t PLErrorOrUnderlyingErrorHasDomainAndCode()
{
  return MEMORY[0x1E0D73E88]();
}

uint64_t PLErrorOrUnderlyingErrorMatchesCodesByDomain()
{
  return MEMORY[0x1E0D73E90]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1E0D73E98]();
}

uint64_t PLFetchPerformanceGetLog()
{
  return MEMORY[0x1E0D73EA0]();
}

uint64_t PLGatekeeperXPCGetLog()
{
  return MEMORY[0x1E0D74068]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageData()
{
  return MEMORY[0x1E0D71E00]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageURL()
{
  return MEMORY[0x1E0D71E08]();
}

uint64_t PLGetSandboxExtensionToken()
{
  return MEMORY[0x1E0D74070]();
}

uint64_t PLGetSandboxExtensionTokenIfPossible()
{
  return MEMORY[0x1E0D74080]();
}

uint64_t PLHasInternalDiagnostics()
{
  return MEMORY[0x1E0D740A8]();
}

uint64_t PLImageManagerGetLog()
{
  return MEMORY[0x1E0D740C8]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1E0D740D8]();
}

uint64_t PLImportGetLog()
{
  return MEMORY[0x1E0D74100]();
}

uint64_t PLImportantFetchGetLog()
{
  return MEMORY[0x1E0D74108]();
}

uint64_t PLInternalPredicateForMediaProcessingTaskID()
{
  return MEMORY[0x1E0D71E40]();
}

uint64_t PLIsAssetsd()
{
  return MEMORY[0x1E0D74138]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1E0D74148]();
}

uint64_t PLIsContentPrivacyEnabled()
{
  return MEMORY[0x1E0D74170]();
}

uint64_t PLIsErrorEqualToCode()
{
  return MEMORY[0x1E0D74190]();
}

uint64_t PLIsErrorFileNotFound()
{
  return MEMORY[0x1E0D74198]();
}

uint64_t PLIsErrorOrUnderlyingErrorFileNotFound()
{
  return MEMORY[0x1E0D741A8]();
}

uint64_t PLIsErrorXPCConnectionInvalid()
{
  return MEMORY[0x1E0D741B8]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x1E0D741C0]();
}

uint64_t PLIsForegroundApplication()
{
  return MEMORY[0x1E0D741D0]();
}

uint64_t PLIsInternalTool()
{
  return MEMORY[0x1E0D741D8]();
}

uint64_t PLIsLimitedLibraryClient()
{
  return MEMORY[0x1E0D741E0]();
}

uint64_t PLIsMobileSlideShow()
{
  return MEMORY[0x1E0D74200]();
}

uint64_t PLIsPhotoanalysisd()
{
  return MEMORY[0x1E0D74230]();
}

uint64_t PLIsPhotosAppAnyPlatform()
{
  return MEMORY[0x1E0D74240]();
}

uint64_t PLIsProcessWithAppleBundleIdentifier()
{
  return MEMORY[0x1E0D74260]();
}

uint64_t PLIsResourceMarkedFullSizeFromRecipeID()
{
  return MEMORY[0x1E0D71E58]();
}

uint64_t PLIsRotatedExifOrientation()
{
  return MEMORY[0x1E0D74270]();
}

uint64_t PLIsXcTest()
{
  return MEMORY[0x1E0D742C8]();
}

uint64_t PLLibraryBundleGetLog()
{
  return MEMORY[0x1E0D742F0]();
}

uint64_t PLLibraryIDFromPathManager()
{
  return MEMORY[0x1E0D742F8]();
}

uint64_t PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue()
{
  return MEMORY[0x1E0D71E88]();
}

uint64_t PLLibraryScopeAssetGetRejectedByCameraStateFromShareStateValue()
{
  return MEMORY[0x1E0D71E90]();
}

uint64_t PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue()
{
  return MEMORY[0x1E0D71E98]();
}

uint64_t PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue()
{
  return MEMORY[0x1E0D71EA0]();
}

uint64_t PLLibraryScopeAssetGetUserManuallyAddedStateFromShareStateValue()
{
  return MEMORY[0x1E0D71EA8]();
}

uint64_t PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue()
{
  return MEMORY[0x1E0D71EB0]();
}

uint64_t PLLibraryScopeAssetRemoveSuggestedByClientType()
{
  return MEMORY[0x1E0D71EB8]();
}

uint64_t PLLibraryScopeAssetResetValues()
{
  return MEMORY[0x1E0D71EC0]();
}

uint64_t PLLibraryScopeAssetSetAddToSharedZoneState()
{
  return MEMORY[0x1E0D71EC8]();
}

uint64_t PLLibraryScopeAssetSetPhotosSuggesterRejectedState()
{
  return MEMORY[0x1E0D71ED0]();
}

uint64_t PLLibraryScopeAssetSetSuggestedByClientType()
{
  return MEMORY[0x1E0D71ED8]();
}

uint64_t PLLibraryScopeAssetSetUserManuallyAddedState()
{
  return MEMORY[0x1E0D71EE0]();
}

uint64_t PLLibraryScopeAssetSetUserManuallyRejectedState()
{
  return MEMORY[0x1E0D71EE8]();
}

uint64_t PLLivePhotoPlaybackGetLog()
{
  return MEMORY[0x1E0D74320]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74330]();
}

uint64_t PLLocalizedNameWithFirstAndLastName()
{
  return MEMORY[0x1E0D74350]();
}

uint64_t PLMakeIndicatorFileExistAtPath()
{
  return MEMORY[0x1E0D74368]();
}

uint64_t PLManagedAssetDecodeFaceRegions()
{
  return MEMORY[0x1E0D71F20]();
}

uint64_t PLManagedAssetDeferredProcessingNeededDescription()
{
  return MEMORY[0x1E0D71F28]();
}

uint64_t PLManagedAssetDeferredProcessingNeededRequiresImmediateProcessing()
{
  return MEMORY[0x1E0D71F30]();
}

uint64_t PLManagedAssetDeferredProcessingNeededRequiresPhotoFinalization()
{
  return MEMORY[0x1E0D71F38]();
}

uint64_t PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewState()
{
  return MEMORY[0x1E0D71F50]();
}

uint64_t PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewStateWithSuggestedByClientType()
{
  return MEMORY[0x1E0D71F58]();
}

uint64_t PLManagedAssetPredicateToFetchAssetsSuggestedForSharing()
{
  return MEMORY[0x1E0D71F60]();
}

uint64_t PLManagedAssetVideoDeferredProcessingNeededRequiresVideoFinalization()
{
  return MEMORY[0x1E0D71F88]();
}

uint64_t PLManagedObjectIDFromData()
{
  return MEMORY[0x1E0D74378]();
}

uint64_t PLManagedObjectIDFromXPCValue()
{
  return MEMORY[0x1E0D74380]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D71FB8]();
}

uint64_t PLMemoriesGetLog()
{
  return MEMORY[0x1E0D74388]();
}

uint64_t PLMethodNotImplementedException()
{
  return MEMORY[0x1E0D74390]();
}

uint64_t PLMillisecondDateFormatter()
{
  return MEMORY[0x1E0D743A0]();
}

uint64_t PLMomentAggregationScoreFromAggregationScoreType()
{
  return MEMORY[0x1E0D71FD0]();
}

uint64_t PLMomentDescriptionForProcessedLocationType()
{
  return MEMORY[0x1E0D71FD8]();
}

uint64_t PLNormalizedCGRectToInt64()
{
  return MEMORY[0x1E0D743C0]();
}

uint64_t PLObjectIsEqual()
{
  return MEMORY[0x1E0D743D0]();
}

uint64_t PLOrientationInverse()
{
  return MEMORY[0x1E0D72010]();
}

uint64_t PLOrientationIsValid()
{
  return MEMORY[0x1E0D72018]();
}

uint64_t PLOrientationMakeTransformWithSize()
{
  return MEMORY[0x1E0D72020]();
}

uint64_t PLOrientationTransformImageSize()
{
  return MEMORY[0x1E0D72030]();
}

uint64_t PLPTPGetLog()
{
  return MEMORY[0x1E0D743F8]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x1E0D74438]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1E0D74440]();
}

uint64_t PLPhotoKitIngestGetLog()
{
  return MEMORY[0x1E0D74448]();
}

uint64_t PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation()
{
  return MEMORY[0x1E0D72408]();
}

uint64_t PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties()
{
  return MEMORY[0x1E0D72418]();
}

uint64_t PLPhotoLibraryServicesFrameworkBundle()
{
  return MEMORY[0x1E0D74460]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1E0D74478]();
}

uint64_t PLPhotosAccessAllowed()
{
  return MEMORY[0x1E0D74488]();
}

uint64_t PLPhotosHighlightTypeIsConsideredTrip()
{
  return MEMORY[0x1E0D72490]();
}

uint64_t PLPhotosHighlightVisibilityStateIsVisibleInMonth()
{
  return MEMORY[0x1E0D72498]();
}

uint64_t PLPhotosObjectLifecycleGetLog()
{
  return MEMORY[0x1E0D744A8]();
}

uint64_t PLPhotosSearchGetLog()
{
  return MEMORY[0x1E0D744C8]();
}

uint64_t PLPhotosStatusGetLog()
{
  return MEMORY[0x1E0D744D0]();
}

uint64_t PLPlatformEagerlyFetchFaceRegions()
{
  return MEMORY[0x1E0D74528]();
}

uint64_t PLPlatformExtendedAttributesSupported()
{
  return MEMORY[0x1E0D74530]();
}

uint64_t PLPlatformPhotosAccessLoggingSupported()
{
  return MEMORY[0x1E0D74578]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x1E0D724B0]();
}

uint64_t PLPrimaryDataStoreKeyStrategyFromData()
{
  return MEMORY[0x1E0D724B8]();
}

uint64_t PLPrimaryResourceDataStoreReferenceFileURL()
{
  return MEMORY[0x1E0D724C0]();
}

uint64_t PLProcessingPredicateForTaskID()
{
  return MEMORY[0x1E0D724C8]();
}

uint64_t PLQualitySortValueFromResourceDimensions()
{
  return MEMORY[0x1E0D724D8]();
}

uint64_t PLResetMediaProcessingStateOnAsset()
{
  return MEMORY[0x1E0D72518]();
}

uint64_t PLResourceIdentityShortDescription()
{
  return MEMORY[0x1E0D72520]();
}

uint64_t PLResourceIsDerivedFromDeferredProcessingPreviewImage()
{
  return MEMORY[0x1E0D72528]();
}

uint64_t PLResourceRecipeIDDescription()
{
  return MEMORY[0x1E0D72540]();
}

uint64_t PLResourceRecipeIDIsCPLImageDerivative()
{
  return MEMORY[0x1E0D72548]();
}

uint64_t PLResourceRecipeIDIsValidForFullSizeRenderVirtualResource()
{
  return MEMORY[0x1E0D72550]();
}

uint64_t PLResourceRecipeIsFullSizeDeferredProcessingPreview()
{
  return MEMORY[0x1E0D72558]();
}

uint64_t PLResultWithUnfairLock()
{
  return MEMORY[0x1E0D74618]();
}

uint64_t PLRunWithUnfairLock()
{
  return MEMORY[0x1E0D74620]();
}

uint64_t PLSAggregateDictionaryAddValueForScalarKey()
{
  return MEMORY[0x1E0D72578]();
}

uint64_t PLSafeEntityForNameInManagedObjectContext()
{
  return MEMORY[0x1E0D72A58]();
}

uint64_t PLSafeInsertNewObjectForEntityForNameInManagedObjectContext()
{
  return MEMORY[0x1E0D72A60]();
}

uint64_t PLSafeResultWithUnfairLock()
{
  return MEMORY[0x1E0D74628]();
}

uint64_t PLSafeRunWithUnfairLock()
{
  return MEMORY[0x1E0D74630]();
}

uint64_t PLSearchBackendInitialSuggestionsGetLog()
{
  return MEMORY[0x1E0D74690]();
}

uint64_t PLSearchBackendQueryGetLog()
{
  return MEMORY[0x1E0D746C0]();
}

uint64_t PLSearchBackendRecentSuggestionsGetLog()
{
  return MEMORY[0x1E0D746C8]();
}

uint64_t PLSearchBackendResultProcessingGetLog()
{
  return MEMORY[0x1E0D746D0]();
}

uint64_t PLSearchBackendSceneTaxonomyGetLog()
{
  return MEMORY[0x1E0D746D8]();
}

uint64_t PLSearchContributorUUIDFromLookupIdentifier()
{
  return MEMORY[0x1E0D72A78]();
}

uint64_t PLSearchFileProtectionTypes()
{
  return MEMORY[0x1E0D72A98]();
}

uint64_t PLSearchHumanActionIdentifierFromLookupIdentifier()
{
  return MEMORY[0x1E0D72B10]();
}

uint64_t PLSearchJSONForCSEmbedding()
{
  return MEMORY[0x1E0D72B88]();
}

uint64_t PLSearchLookupIdentifierForUtilityCollectionType()
{
  return MEMORY[0x1E0D72D60]();
}

uint64_t PLSearchNaturalLanguageInitialSuggestionsSupportedForLocale()
{
  return MEMORY[0x1E0D72D80]();
}

uint64_t PLSearchSceneIdentifierFromLookupIdentifier()
{
  return MEMORY[0x1E0D72D98]();
}

uint64_t PLSearchSemanticSearchQueriesSupported()
{
  return MEMORY[0x1E0D72DA8]();
}

uint64_t PLSearchSuggestionCategoriesTypeForSearchIndexCategory()
{
  return MEMORY[0x1E0D72DB8]();
}

uint64_t PLSearchUIQueryGetLog()
{
  return MEMORY[0x1E0D74708]();
}

uint64_t PLSearchableIdentifierFromMessagesSyndicationID()
{
  return MEMORY[0x1E0D72DD8]();
}

uint64_t PLSearchableUniqueIdentifierHashFromSearchableIdentifier()
{
  return MEMORY[0x1E0D72DE0]();
}

uint64_t PLSendCoreAnalyticEvent()
{
  return MEMORY[0x1E0D74718]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x1E0D74730]();
}

uint64_t PLSharedStreamsResourceTypeIsHighestQuality()
{
  return MEMORY[0x1E0D72DF8]();
}

uint64_t PLShortDescriptionForWorkerType()
{
  return MEMORY[0x1E0D72E00]();
}

uint64_t PLShortObjectIDFromURL()
{
  return MEMORY[0x1E0D72E08]();
}

uint64_t PLShortStringFromQoSClass()
{
  return MEMORY[0x1E0D74788]();
}

uint64_t PLShouldBoostLogLevelForResourceRecipeID()
{
  return MEMORY[0x1E0D72E10]();
}

uint64_t PLShouldConstructDisplayNameForAppBundle()
{
  return MEMORY[0x1E0D72E18]();
}

uint64_t PLSizeMake()
{
  return MEMORY[0x1E0D747A8]();
}

uint64_t PLSplitToCGRectFromInt64()
{
  return MEMORY[0x1E0D747B8]();
}

uint64_t PLSplitToDoubleFromInt64()
{
  return MEMORY[0x1E0D747C0]();
}

uint64_t PLStringFromQoSClass()
{
  return MEMORY[0x1E0D74808]();
}

uint64_t PLStringFromXPCDictionary()
{
  return MEMORY[0x1E0D74828]();
}

uint64_t PLStringUUIDComponents()
{
  return MEMORY[0x1E0D72E88]();
}

uint64_t PLSyndicatedDisplayNameForAppBundle()
{
  return MEMORY[0x1E0D72E90]();
}

uint64_t PLSyndicationGetLog()
{
  return MEMORY[0x1E0D74870]();
}

uint64_t PLTableThumbnailRecipeIDFromFormatID()
{
  return MEMORY[0x1E0D72EA0]();
}

uint64_t PLThumbnailsGetLog()
{
  return MEMORY[0x1E0D748A0]();
}

uint64_t PLURLFromXPCDictionary()
{
  return MEMORY[0x1E0D748D8]();
}

uint64_t PLUUIDFromLocalMercuryLocalIdentifier()
{
  return MEMORY[0x1E0D748F0]();
}

uint64_t PLUnderlyingErrorThatHasDomainAndCode()
{
  return MEMORY[0x1E0D74900]();
}

uint64_t PLUnderlyingErrorWithDomain()
{
  return MEMORY[0x1E0D74908]();
}

uint64_t PLUpNextGetLog()
{
  return MEMORY[0x1E0D74918]();
}

uint64_t PLUserFeedbackGetLog()
{
  return MEMORY[0x1E0D74928]();
}

uint64_t PLValidatedSavedAssetTypeApplies()
{
  return MEMORY[0x1E0D74948]();
}

uint64_t PLValidatedSavedAssetTypeDescription()
{
  return MEMORY[0x1E0D74950]();
}

uint64_t PLVideoResourceDescription()
{
  return MEMORY[0x1E0D72ED8]();
}

uint64_t PLWriteImageWithEmbeddedThumbnailToPath()
{
  return MEMORY[0x1E0D72EE0]();
}

uint64_t PLXPCArrayAppendManagedObjectID()
{
  return MEMORY[0x1E0D74980]();
}

uint64_t PLXPCDictionarySetArray()
{
  return MEMORY[0x1E0D74988]();
}

uint64_t PLXPCDictionarySetData()
{
  return MEMORY[0x1E0D74990]();
}

uint64_t PLXPCDictionarySetDate()
{
  return MEMORY[0x1E0D74998]();
}

uint64_t PLXPCDictionarySetDictionary()
{
  return MEMORY[0x1E0D749A0]();
}

uint64_t PLXPCDictionarySetIOSurface()
{
  return MEMORY[0x1E0D749A8]();
}

uint64_t PLXPCDictionarySetManagedObjectID()
{
  return MEMORY[0x1E0D749B0]();
}

uint64_t PLXPCDictionarySetString()
{
  return MEMORY[0x1E0D749B8]();
}

uint64_t PLXPCDictionarySetURL()
{
  return MEMORY[0x1E0D749C0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1E0D71160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1E0DE3F30]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1E0DE3F48]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1E0DE3F70]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1E0DE3FD0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1E0DE3FE0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3FE8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1E0DE7AF8](cls, sel);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

uint64_t diffOrderedSets()
{
  return MEMORY[0x1E0D72F00]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1E0C830B8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1E0C835B8](a1, a2, *(_QWORD *)&a3);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t imageDataFromImageRef()
{
  return MEMORY[0x1E0D72F08]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1E0D74FE8]();
}

uint64_t pl_dispatch_barrier_async()
{
  return MEMORY[0x1E0D74FF0]();
}

uint64_t pl_dispatch_barrier_sync()
{
  return MEMORY[0x1E0D74FF8]();
}

uint64_t pl_dispatch_once()
{
  return MEMORY[0x1E0D75010]();
}

uint64_t pl_dispatch_source_set_event_handler()
{
  return MEMORY[0x1E0D75028]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1E0D75030]();
}

uint64_t pl_notify_register_dispatch()
{
  return MEMORY[0x1E0D75040]();
}

uint64_t pl_result_with_autoreleasepool()
{
  return MEMORY[0x1E0D75050]();
}

uint64_t plsGreenTeaEnabled()
{
  return MEMORY[0x1E0D72F98]();
}

uint64_t plslogGreenTea()
{
  return MEMORY[0x1E0D72FA8]();
}

uint64_t plslogGreenTeaReadingPhotosOrVideos()
{
  return MEMORY[0x1E0D72FB0]();
}

uint64_t plslogGreenTeaTransmittingPhotosOrVideos()
{
  return MEMORY[0x1E0D72FB8]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_self()
{
  return MEMORY[0x1E0C851C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86280](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}


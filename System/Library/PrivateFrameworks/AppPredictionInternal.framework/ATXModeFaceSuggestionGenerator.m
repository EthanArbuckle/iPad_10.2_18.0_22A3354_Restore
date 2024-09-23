@implementation ATXModeFaceSuggestionGenerator

- (ATXModeFaceSuggestionGenerator)init
{
  ATXModeFaceSuggestionGenerator *v2;
  void *v3;
  uint64_t v4;
  NSDictionary *appLaunchCounts;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXModeFaceSuggestionGenerator;
  v2 = -[ATXModeFaceSuggestionGenerator init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps");
    v4 = objc_claimAutoreleasedReturnValue();
    appLaunchCounts = v2->_appLaunchCounts;
    v2->_appLaunchCounts = (NSDictionary *)v4;

  }
  return v2;
}

- (id)generateFacesFromDescriptors:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(&unk_1E83D0748, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(&unk_1E83D0748);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E28]), "initWithType:uuid:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue"), 0);
        -[ATXModeFaceSuggestionGenerator facesForMode:allDescriptors:](self, "facesForMode:allDescriptors:", v11, v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bs_firstObjectPassingTest:", &__block_literal_global_236);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 || (objc_msgSend(v12, "lastObject"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          if ((v9 & 1) != 0)
          {
            v7 = objc_msgSend(v12, "count") - 1;
            objc_msgSend(v4, "addObjectsFromArray:", v12);
          }
          else
          {
            if (v7 >= 1)
            {
              objc_msgSend(v4, "removeObjectAtIndex:", 0);
              --v7;
            }
            objc_msgSend(v4, "addObject:", v13);
          }

          v9 = 0;
        }

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(&unk_1E83D0748, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

uint64_t __63__ATXModeFaceSuggestionGenerator_generateFacesFromDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPreferredForGallery");
}

- (void)generateAndCacheFacesFromDescriptors:(id)a3
{
  id v4;
  double Current;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  CFAbsoluteTime v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeFaceSuggestionGenerator: starting generation of mode faces", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0CF8F68]);
  objc_msgSend(v7, "evictCachedSuggestedFaces");
  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuredModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ATXModeFaceSuggestionGenerator_generateAndCacheFacesFromDescriptors___block_invoke;
  v13[3] = &unk_1E82EAC00;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

  __atxlog_handle_lock_screen();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v16 = v12 - Current;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeFaceSuggestionGenerator: finished generation of mode faces in %f seconds", buf, 0xCu);
  }

}

void __71__ATXModeFaceSuggestionGenerator_generateAndCacheFacesFromDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v7 = *(void **)(a1 + 32);
  v8 = DNDModeSemanticTypeToSuggestedFaceType(objc_msgSend(v5, "semanticType"));
  objc_msgSend(v11, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "_facesForModeType:modeUUID:allDescriptors:", v8, v9, *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v6);
}

- (id)facesForMode:(id)a3 allDescriptors:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "type");
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  if (!v8)
  {
    if (v10)
    {
      if (!objc_msgSend(v9, "length"))
      {
        v8 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
      objc_msgSend(v16, "dndModeForDNDModeWithUUID:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v8 = DNDModeSemanticTypeToSuggestedFaceType(objc_msgSend(v14, "semanticType"));
        goto LABEL_12;
      }
      __atxlog_handle_modes();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXModeFaceSuggestionGenerator facesForMode:allDescriptors:].cold.1((uint64_t)v9, v19);

    }
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 >= 0xC)
      v13 = 0;
    else
      v13 = v8 - 2;
    objc_msgSend(v11, "dndModeUUIDForDNDModeSemanticType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
LABEL_12:

      goto LABEL_14;
    }
    goto LABEL_18;
  }
LABEL_14:
  -[ATXModeFaceSuggestionGenerator _facesForModeType:modeUUID:allDescriptors:](self, "_facesForModeType:modeUUID:allDescriptors:", v8, v9, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v18;
}

- (id)_facesForModeType:(int64_t)a3 modeUUID:(id)a4 allDescriptors:(id)a5
{
  id v9;
  ATXModeFaceComplicationsAggregator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  int64_t v44;
  _QWORD v45[4];
  _QWORD v46[7];

  v46[5] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v34 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXModeFaceSuggestionGenerator.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modeUUID"));

  }
  v10 = objc_alloc_init(ATXModeFaceComplicationsAggregator);
  -[ATXModeFaceComplicationsAggregator provideComplicationsForSuggestedFaceType:environment:](v10, "provideComplicationsForSuggestedFaceType:environment:", a3, self);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeFaceComplicationsAggregator provideLandscapeComplicationsForSuggestedFaceType:environment:](v10, "provideLandscapeComplicationsForSuggestedFaceType:environment:", a3, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v11 = (void *)objc_opt_new();
  v46[0] = v11;
  v12 = (void *)objc_opt_new();
  v46[1] = v12;
  v13 = (void *)objc_opt_new();
  v46[2] = v13;
  v14 = (void *)objc_opt_new();
  v46[3] = v14;
  v15 = (void *)objc_opt_new();
  v46[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a3 - 1) >= 0xB)
    v17 = 0;
  else
    v17 = a3 - 2;
  -[ATXModeFaceSuggestionGenerator _posterCandidatesForModeType:allDescriptors:](self, "_posterCandidatesForModeType:allDescriptors:", v17, v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    DNDModeLocalizedNameForSemanticType();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __76__ATXModeFaceSuggestionGenerator__facesForModeType_modeUUID_allDescriptors___block_invoke;
    v35[3] = &unk_1E82EAC28;
    v22 = v21;
    v36 = v22;
    v43 = v45;
    v37 = v16;
    v44 = v17;
    v23 = v20;
    v38 = v23;
    v24 = v9;
    v39 = v24;
    v25 = v19;
    v40 = v25;
    v41 = v32;
    v42 = v33;
    objc_msgSend(v18, "enumerateObjectsWithOptions:usingBlock:", 2, v35);
    if (objc_msgSend(v22, "count"))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0CF8F68]);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v24);
      objc_msgSend(v26, "cacheSuggestedFaces:forModeUUID:", v22, v27);

    }
    v28 = v42;
    v29 = v22;

  }
  else
  {
    v29 = 0;
  }

  _Block_object_dispose(v45, 8);
  return v29;
}

void __76__ATXModeFaceSuggestionGenerator__facesForModeType_modeUUID_allDescriptors___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;

  v34 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (v7 < objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mode-%ld-%ld"), *(_QWORD *)(a1 + 96), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CF8CE0];
      objc_msgSend(v34, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "extensionBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedNameForExtensionBundleId:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc(MEMORY[0x1E0CF8E10]);
      objc_msgSend(v34, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "extensionBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 96));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fontName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v13, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v8, v15, v17, v12, v18, v19, *(_QWORD *)(a1 + 48), 0, 0, 0, 0);

      objc_msgSend(v20, "setModeUUID:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v20, "setIsPreferredForGallery:", objc_msgSend(v34, "isPreferredForGallery"));
      objc_msgSend(v20, "setLocalizedSubtitle:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v20, "setSource:", 6);
      objc_msgSend(v34, "descriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "galleryOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "allowsSystemSuggestedComplications"))
      {

      }
      else
      {
        objc_msgSend(v34, "descriptor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "galleryOptions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "modularComplications");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (!v26)
          goto LABEL_8;
      }
      objc_msgSend(v34, "descriptor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "extensionBundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"));

      if ((v29 & 1) == 0)
      {
        v31 = 0;
        do
        {
          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = (void *)objc_opt_new();
          objc_msgSend(v32, "assignComplicationsFromCandidates:forSuggestedFace:", *(_QWORD *)(a1 + 72), v20);
          v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          if (v33 < objc_msgSend(*(id *)(a1 + 40), "count") - 1)
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);

          v31 = v30;
        }
        while ((objc_msgSend(v30, "assignComplicationsFromCandidates:forSuggestedFace:", *(_QWORD *)(a1 + 80), v20) & 1) == 0);
        goto LABEL_13;
      }
LABEL_8:
      v30 = (void *)objc_opt_new();
      objc_msgSend(v30, "assignComplicationsFromCandidates:forSuggestedFace:", *(_QWORD *)(a1 + 80), v20);
LABEL_13:

      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v20, 0);
      goto LABEL_14;
    }
  }
  *a4 = 1;
LABEL_14:

}

- (id)_firstDescriptorWithExtension:(id)a3 identifier:(id)a4 allDescriptors:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = a5;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "galleryOptions", (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isHero");

        if ((v15 & 1) == 0)
        {
          if (objc_msgSend(v8, "length"))
          {
            objc_msgSend(v13, "extensionBundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isEqualToString:", v7) & 1) != 0)
            {
              objc_msgSend(v13, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "hasPrefix:", v8);

              if ((v18 & 1) != 0)
                goto LABEL_17;
            }
            else
            {

            }
          }
          if (!objc_msgSend(v8, "length"))
          {
            objc_msgSend(v13, "extensionBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v7);

            if ((v20 & 1) != 0)
            {
LABEL_17:
              v10 = v13;
              goto LABEL_18;
            }
          }
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

  return v10;
}

- (id)_firstDescriptorWithExtension:(id)a3 focus:(int64_t)a4 allDescriptors:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = a5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v12, "extensionBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqualToString:", v6))
        goto LABEL_11;
      objc_msgSend(v12, "galleryOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isOnlyEligibleForMadeForFocusSection") & 1) == 0)
      {

LABEL_11:
        continue;
      }
      objc_msgSend(v12, "galleryOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "focus");

      if (v16 == a4)
      {
        v17 = v12;
        goto LABEL_15;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v9);
LABEL_14:
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)_firstPhotosDescriptorMatchingSubtype:(int64_t)a3 allDescriptors:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke;
  v9[3] = &__block_descriptor_40_e29_B16__0__ATXPosterDescriptor_8l;
  v9[4] = a3;
  objc_msgSend(a4, "_pas_filteredSetWithTest:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_72_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "galleryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "photoSubtype");
  v6 = *(_QWORD *)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(v3, "galleryOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldShowAsShuffleStack");

    v9 = v8 ^ 1u;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __87__ATXModeFaceSuggestionGenerator__firstPhotosDescriptorMatchingSubtype_allDescriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "galleryOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "featuredConfidenceLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "galleryOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "featuredConfidenceLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (id)_posterCandidatesForModeType:(int64_t)a3 allDescriptors:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void (**v12)(void *, const __CFString *, const __CFString *, const __CFString *, uint64_t);
  id v13;
  id v14;
  uint64_t (**v15)(void *, const __CFString *, uint64_t, const __CFString *, _QWORD);
  id v16;
  id v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  int64_t v20;
  id v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void *, const __CFString *, const __CFString *, const __CFString *, uint64_t);
  const __CFString *v31;
  int v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(_QWORD *, uint64_t, void *, uint64_t);
  void *v41;
  ATXModeFaceSuggestionGenerator *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD aBlock[4];
  id v52;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke;
  aBlock[3] = &unk_1E82EAC90;
  v9 = v7;
  v52 = v9;
  v48[0] = v8;
  v48[1] = 3221225472;
  v48[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_2;
  v48[3] = &unk_1E82EACB8;
  v10 = _Block_copy(aBlock);
  v50 = v10;
  v48[4] = self;
  v11 = v6;
  v49 = v11;
  v12 = (void (**)(void *, const __CFString *, const __CFString *, const __CFString *, uint64_t))_Block_copy(v48);
  v45[0] = v8;
  v45[1] = 3221225472;
  v45[2] = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_3;
  v45[3] = &unk_1E82EACE0;
  v13 = v10;
  v47 = v13;
  v45[4] = self;
  v14 = v11;
  v46 = v14;
  v15 = (uint64_t (**)(void *, const __CFString *, uint64_t, const __CFString *, _QWORD))_Block_copy(v45);
  v38 = v8;
  v39 = 3221225472;
  v40 = __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_4;
  v41 = &unk_1E82EAD08;
  v16 = v13;
  v44 = v16;
  v42 = self;
  v17 = v14;
  v43 = v17;
  v18 = _Block_copy(&v38);
  v19 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v18;
  v20 = a3 + 1;
  v21 = 0;
  switch(v20)
  {
    case 0:
    case 1:
    case 3:
    case 10:
      goto LABEL_55;
    case 2:
      v12[2](v12, CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster"), CFSTR("V02-Moon"), &stru_1E82FDC98, 1);
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 2, &stru_1E82FDC98, 0) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      v22 = v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 2, &stru_1E82FDC98, 0);
      goto LABEL_46;
    case 4:
      if (((*((uint64_t (**)(void *, uint64_t, const __CFString *, uint64_t))v18 + 2))(v18, 3, &stru_1E82FDC98, 1) & 1) == 0&& (v15[2](v15, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), 4, &stru_1E82FDC98, 1) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, const __CFString *, const __CFString *, uint64_t))v12[2])(v12, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), CFSTR("7560"), &stru_1E82FDC98, 1) & 1) == 0)
      {
        v12[2](v12, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), CFSTR("7420"), &stru_1E82FDC98, 1);
      }
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 4, &stru_1E82FDC98, 0) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 4, &stru_1E82FDC98, 0) & 1) != 0)
        goto LABEL_49;
      v30 = v12[2];
      v31 = CFSTR("green");
      break;
    case 5:
      v32 = (*((uint64_t (**)(void *, uint64_t, const __CFString *, uint64_t))v18 + 2))(v18, 4, &stru_1E82FDC98, 1);
      if ((v32 & 1) == 0)
        v12[2](v12, CFSTR("com.apple.weather.poster"), CFSTR("weather-poster"), &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 5, &stru_1E82FDC98, v32 ^ 1u) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 5, &stru_1E82FDC98, 0) & 1) != 0)
        goto LABEL_49;
      v30 = v12[2];
      v31 = CFSTR("red");
      break;
    case 6:
      if (((*((uint64_t (**)(void *, uint64_t, const __CFString *, uint64_t))v18 + 2))(v18, 2, &stru_1E82FDC98, 1) & 1) == 0&& (((uint64_t (**)(_QWORD, uint64_t, const __CFString *, uint64_t))v19)[2](v19, 1, &stru_1E82FDC98, 1) & 1) == 0&& (v15[2](v15, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), 6, &stru_1E82FDC98, 1) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, const __CFString *, const __CFString *, uint64_t))v12[2])(v12, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), CFSTR("7560"), &stru_1E82FDC98, 1) & 1) == 0)
      {
        v12[2](v12, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), CFSTR("7420"), &stru_1E82FDC98, 1);
      }
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 6, &stru_1E82FDC98, 0) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 6, &stru_1E82FDC98, 0) & 1) != 0)
        goto LABEL_49;
      v30 = v12[2];
      v31 = CFSTR("pink");
      break;
    case 7:
      v12[2](v12, CFSTR("com.apple.weather.poster"), CFSTR("weather-poster"), CFSTR("PRTimeFontIdentifierNewYork"), 0);
      v33 = v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 7, CFSTR("PRTimeFontIdentifierNewYork"), 1);
      if ((v33 & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, CFSTR("PRTimeFontIdentifierNewYork"), 0);
      v34 = v33 ^ 1u;
      if ((v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 7, CFSTR("PRTimeFontIdentifierNewYork"), v34) & 1) == 0)v12[2](v12, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), CFSTR("yellow"), CFSTR("PRTimeFontIdentifierNewYork"), v34);
      goto LABEL_49;
    case 8:
      if ((v15[2](v15, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), 8, &stru_1E82FDC98, 1) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), CFSTR("7365"), &stru_1E82FDC98, 1);
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 8, &stru_1E82FDC98, 1) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 8, &stru_1E82FDC98, 0) & 1) != 0)
        goto LABEL_49;
      v30 = v12[2];
      v31 = CFSTR("blue");
      break;
    case 9:
      if ((v15[2](v15, CFSTR("com.apple.WallpaperKit.CollectionsPoster"), 9, &stru_1E82FDC98, 1) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.weather.poster"), CFSTR("weather-poster"), &stru_1E82FDC98, 0);
      if ((v15[2](v15, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), 9, &stru_1E82FDC98, 0) & 1) == 0)
        v12[2](v12, CFSTR("com.apple.EmojiPoster.EmojiPosterExtension"), &stru_1E82FDC98, &stru_1E82FDC98, 0);
      v22 = v15[2](v15, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), 9, &stru_1E82FDC98, 0);
LABEL_46:
      if ((v22 & 1) != 0)
        goto LABEL_49;
      v30 = v12[2];
      v31 = CFSTR("cyan");
      break;
    default:
      __atxlog_handle_modes();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        DNDModeSemanticTypeToSuggestedFaceType_cold_1(0, v23, v24, v25, v26, v27, v28, v29);

      v21 = 0;
      goto LABEL_55;
  }
  v30(v12, CFSTR("com.apple.GradientPoster.GradientPosterExtension"), v31, &stru_1E82FDC98, 0);
LABEL_49:
  if (!objc_msgSend(v9, "count", v38, v39, v40, v41, v42) && objc_msgSend(v17, "count"))
  {
    __atxlog_handle_modes();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ATXModeFaceSuggestionGenerator _posterCandidatesForModeType:allDescriptors:].cold.2(v35);

    objc_msgSend(v17, "anyObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, const __CFString *, _QWORD))v16 + 2))(v16, v36, &stru_1E82FDC98, 0);

  }
  v21 = v9;
LABEL_55:

  return v21;
}

BOOL __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  _ATXModePosterCandidate *v10;

  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    v9 = a2;
    if (objc_msgSend(v7, "count") == 3)
      objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
    v10 = -[_ATXModePosterCandidate initWithDescriptor:fontName:isPreferredForGallery:]([_ATXModePosterCandidate alloc], "initWithDescriptor:fontName:isPreferredForGallery:", v9, v8, a4);

    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v10, 0);
  }
  return a2 != 0;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v9 = a1[5];
  v8 = a1[6];
  v10 = (void *)a1[4];
  v11 = a4;
  objc_msgSend(v10, "_firstDescriptorWithExtension:identifier:allDescriptors:", a2, a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v8 + 16))(v8, v12, v11, a5);

  return v13;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v9 = a1[5];
  v8 = a1[6];
  v10 = (void *)a1[4];
  v11 = a4;
  objc_msgSend(v10, "_firstDescriptorWithExtension:focus:allDescriptors:", a2, a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v8 + 16))(v8, v12, v11, a5);

  return v13;
}

uint64_t __78__ATXModeFaceSuggestionGenerator__posterCandidatesForModeType_allDescriptors___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = a1[5];
  v6 = a1[6];
  v8 = (void *)a1[4];
  v9 = a3;
  objc_msgSend(v8, "_firstPhotosDescriptorMatchingSubtype:allDescriptors:", a2, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (*(uint64_t (**)(uint64_t, void *, id, uint64_t))(v6 + 16))(v6, v10, v9, a4);

  return v11;
}

- (NSDictionary)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (NSSet)suggestedApps
{
  return self->_suggestedApps;
}

- (ATXSuggestedPagesTunableConstants)tunableConstants
{
  return self->_tunableConstants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunableConstants, 0);
  objc_storeStrong((id *)&self->_suggestedApps, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

- (void)facesForMode:(uint64_t)a1 allDescriptors:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXModeFaceSuggestionGenerator: could not look up mode semantic type for UUID: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_posterCandidatesForModeType:(os_log_t)log allDescriptors:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXModeFaceSuggestionGenerator: falling back to any descriptor because no poster from heuristics is available", v1, 2u);
}

@end

@implementation ATXFaceSuggestionAssetParameters

- (ATXFaceSuggestionAssetParameters)init
{
  ATXFaceSuggestionAssetParameters *v2;
  uint64_t v3;
  ATXPosterDescriptorCache *descriptorCache;
  uint64_t v5;
  NSString *path;
  uint64_t v7;
  NSLocale *locale;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXFaceSuggestionAssetParameters;
  v2 = -[ATXFaceSuggestionAssetParameters init](&v10, sel_init);
  if (v2)
  {
    +[ATXPosterDescriptorCache sharedInstance](ATXPosterDescriptorCache, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    descriptorCache = v2->_descriptorCache;
    v2->_descriptorCache = (ATXPosterDescriptorCache *)v3;

    objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("FaceSuggestionAssetParameters"), CFSTR("json"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    path = v2->_path;
    v2->_path = (NSString *)v5;

    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v7;

  }
  return v2;
}

- (NSArray)sectionOrder
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("SectionOrder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)heroSectionOrder
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("HeroSectionOrder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_59_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)weatherAndAstronomySectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("WeatherAndAstronomySectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_60_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)kaleidoscopeSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("KaleidoscopeSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_61_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)emojiSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("EmojiSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_62_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)unitySectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("UnitySectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_63_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)prideSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("PrideSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_64_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)osVersionSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("OSVersionSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_65_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)collectionsSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("CollectionsSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)colorSectionDescriptors
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("ColorSectionDescriptors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_67_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)descriptorsToRemoveFromCollections
{
  void *v2;
  void *v3;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("DescriptorsToRemoveFromCollections"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_68_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSArray)dayZeroFeaturedDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  ATXFaceSuggestionAssetParameters *v16;

  -[ATXFaceSuggestionAssetParameters _currentCountryCode](self, "_currentCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionAssetParameters unpromotableRegions](self, "unpromotableRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionAssetParameters hiddenRegions](self, "hiddenRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("DayZeroFeaturedDescriptors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke;
  v12[3] = &unk_1E82E8E78;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = self;
  v7 = v5;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

id __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint32_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_71;
    v12[3] = &unk_1E82E8E50;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_pas_filteredArrayWithTest:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = arc4random_uniform(objc_msgSend(v5, "count"));
    v7 = *(void **)(a1 + 56);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_posterDescriptorFromKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_lock_screen();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_cold_1();

    v9 = 0;
  }

  return v9;
}

uint64_t __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_71(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)))
      {

LABEL_6:
        __atxlog_handle_lock_screen();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          v12 = 136315650;
          v13 = "-[ATXFaceSuggestionAssetParameters dayZeroFeaturedDescriptors]_block_invoke";
          v14 = 2112;
          v15 = v9;
          v16 = 2112;
          v17 = v4;
          _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: not showing hidden or unpromotable day zero extensionBundleId in restricted country code %@: %@", (uint8_t *)&v12, 0x20u);
        }

        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

      if (v7)
        goto LABEL_6;
    }
    v10 = 1;
    goto LABEL_11;
  }
LABEL_9:
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSSet)extensionBundleIdsEligibleForComplicationsInFaceGallery
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[ATXFaceSuggestionAssetParameters arrayForKey:](self, "arrayForKey:", CFSTR("ExtensionBundleIdsEligibleForComplicationsInFaceGallery"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_77);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  }
  else
  {
    v5 = 0;
  }

  return (NSSet *)v5;
}

id __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke_cold_1();

    v3 = 0;
  }

  return v3;
}

- (NSDictionary)uprankedDateIntervals
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSLocale *locale;
  id v34;
  void *v35;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  __CFString *v59;
  __int16 v60;
  NSLocale *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionAssetParameters dictionaryForKey:](self, "dictionaryForKey:", CFSTR("UprankedDateIntervals"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v40 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v37 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v53;
      v38 = *(_QWORD *)v53;
      v39 = v3;
      do
      {
        v7 = 0;
        v41 = v5;
        do
        {
          if (*(_QWORD *)v53 != v6)
            objc_enumerationMutation(v3);
          v8 = *(__CFString **)(*((_QWORD *)&v52 + 1) + 8 * v7);
          objc_msgSend(v3, "objectForKeyedSubscript:", v8, v37);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v8);
            v11 = objc_claimAutoreleasedReturnValue();
            -[ATXFaceSuggestionAssetParameters _currentCountryCode](self, "_currentCountryCode");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              v14 = (__CFString *)v12;
            else
              v14 = CFSTR("default");
            v15 = v14;

            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = v15;
            }
            else
            {

              v17 = CFSTR("default");
            }
            v46 = (__CFString *)v17;
            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_opt_class();
              v45 = v18;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = v8;
                v43 = v11;
                v44 = v7;
                v19 = objc_opt_new();
                v48 = 0u;
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v20 = v18;
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v49;
                  do
                  {
                    for (i = 0; i != v22; ++i)
                    {
                      if (*(_QWORD *)v49 != v23)
                        objc_enumerationMutation(v20);
                      v25 = *(__CFString **)(*((_QWORD *)&v48 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v26 = v25;
                        -[__CFString objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("start"));
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        dateFromDict(v27);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v28)
                        {
                          -[__CFString objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("end"));
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          dateFromDict(v29);
                          v30 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v30 && (objc_msgSend(v28, "isAfterDate:", v30) & 1) == 0)
                            v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v28, v30);
                          else
                            v31 = 0;

                        }
                        else
                        {
                          v31 = 0;
                        }

                        if (v31)
                        {
                          -[NSObject addObject:](v19, "addObject:", v31);
                        }
                        else
                        {
                          __atxlog_handle_lock_screen();
                          v32 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          {
                            locale = self->_locale;
                            *(_DWORD *)buf = 136315650;
                            v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                            v58 = 2112;
                            v59 = v26;
                            v60 = 2112;
                            v61 = locale;
                            _os_log_error_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_ERROR, "%s: date interval dict didn't produce a valid interval: %@, current locale: %@", buf, 0x20u);
                          }

                        }
                      }
                      else
                      {
                        __atxlog_handle_lock_screen();
                        v31 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315394;
                          v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                          v58 = 2112;
                          v59 = v25;
                          _os_log_error_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_ERROR, "%s: array element %@ is not a dictionary", buf, 0x16u);
                        }
                      }

                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
                  }
                  while (v22);
                }

                v34 = -[NSObject copy](v19, "copy");
                objc_msgSend(v40, "setObject:forKeyedSubscript:", v34, v42);

                v6 = v38;
                v3 = v39;
                v5 = v41;
                v11 = v43;
                v7 = v44;
              }
              else
              {
                __atxlog_handle_lock_screen();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
                  v58 = 2112;
                  v59 = v46;
                  _os_log_error_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_ERROR, "%s: value of key %@ is not an array", buf, 0x16u);
                }
              }

              v18 = v45;
            }

          }
          else
          {
            __atxlog_handle_lock_screen();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v57 = "-[ATXFaceSuggestionAssetParameters uprankedDateIntervals]";
              v58 = 2112;
              v59 = v8;
              _os_log_error_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_ERROR, "%s: value of key %@ not a dictionary", buf, 0x16u);
            }
          }

          ++v7;
        }
        while (v7 != v5);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v5);
    }

    v35 = (void *)objc_msgSend(v40, "copy");
    v2 = v37;
  }
  else
  {
    v35 = 0;
  }

  return (NSDictionary *)v35;
}

- (NSDictionary)globalPopularityScores
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  void *v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionAssetParameters dictionaryForKey:](self, "dictionaryForKey:", CFSTR("GlobalPopularityScores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[ATXFaceSuggestionAssetParameters _posterDescriptorFromKey:](self, "_posterDescriptorFromKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", v9);
              v13 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v10);
            }
            else
            {
              __atxlog_handle_lock_screen();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v23 = "-[ATXFaceSuggestionAssetParameters globalPopularityScores]";
                v24 = 2112;
                v25 = v9;
                _os_log_error_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_ERROR, "%s: value is not NSNumber for key: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            __atxlog_handle_lock_screen();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v23 = "-[ATXFaceSuggestionAssetParameters globalPopularityScores]";
              v24 = 2112;
              v25 = v9;
              _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: no descriptor found for key: %@", buf, 0x16u);
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v6);
    }

    v14 = (void *)objc_msgSend(v17, "copy");
    v3 = v16;
  }
  else
  {
    v14 = 0;
  }

  return (NSDictionary *)v14;
}

- (NSDictionary)unpromotableRegions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionAssetParameters dictionaryForKey:](self, "dictionaryForKey:", CFSTR("UnpromotableRegions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v18 = 0;
    goto LABEL_20;
  }
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v2;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v22;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __atxlog_handle_lock_screen();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_DWORD *)buf = 136315394;
        v26 = "-[ATXFaceSuggestionAssetParameters unpromotableRegions]";
        v27 = 2112;
        v28 = v9;
        v15 = v13;
        v16 = "%s: key is not a string: %@";
        goto LABEL_16;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v9);

        goto LABEL_13;
      }
      __atxlog_handle_lock_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[ATXFaceSuggestionAssetParameters unpromotableRegions]";
        v27 = 2112;
        v28 = v9;
        v15 = v13;
        v16 = "%s: value is not an array for key: %@";
LABEL_16:
        _os_log_error_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      }
LABEL_13:

      ++v8;
    }
    while (v6 != v8);
    v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    v6 = v17;
  }
  while (v17);
LABEL_18:

  v18 = (void *)objc_msgSend(v3, "copy");
  v2 = v20;
LABEL_20:

  return (NSDictionary *)v18;
}

- (NSDictionary)hiddenRegions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionAssetParameters dictionaryForKey:](self, "dictionaryForKey:", CFSTR("HiddenRegions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v18 = 0;
    goto LABEL_20;
  }
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v2;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v22;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __atxlog_handle_lock_screen();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_DWORD *)buf = 136315394;
        v26 = "-[ATXFaceSuggestionAssetParameters hiddenRegions]";
        v27 = 2112;
        v28 = v9;
        v15 = v13;
        v16 = "%s: key is not a string: %@";
        goto LABEL_16;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v9);

        goto LABEL_13;
      }
      __atxlog_handle_lock_screen();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[ATXFaceSuggestionAssetParameters hiddenRegions]";
        v27 = 2112;
        v28 = v9;
        v15 = v13;
        v16 = "%s: value is not an array for key: %@";
LABEL_16:
        _os_log_error_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      }
LABEL_13:

      ++v8;
    }
    while (v6 != v8);
    v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    v6 = v17;
  }
  while (v17);
LABEL_18:

  v18 = (void *)objc_msgSend(v3, "copy");
  v2 = v20;
LABEL_20:

  return (NSDictionary *)v18;
}

- (NSDictionary)allowedDescriptorsForRegions
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ATXFaceSuggestionAssetParameters dictionaryForKey:](self, "dictionaryForKey:", CFSTR("AllowedDescriptorsForRegions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:](self, "dictionaryStringToSetFromObject:", v11);
            v12 = objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
            }
            else
            {
              __atxlog_handle_lock_screen();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v22 = "-[ATXFaceSuggestionAssetParameters allowedDescriptorsForRegions]";
                v23 = 2112;
                v24 = v10;
                _os_log_fault_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_FAULT, "%s: dictionary is nil. key: %@", buf, 0x16u);
              }

            }
          }
          else
          {
            __atxlog_handle_lock_screen();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v22 = "-[ATXFaceSuggestionAssetParameters allowedDescriptorsForRegions]";
              v23 = 2112;
              v24 = v10;
              _os_log_fault_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_FAULT, "%s: key is not a string: %@", buf, 0x16u);
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v7);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
    v3 = v16;
  }
  else
  {
    v14 = 0;
  }

  return (NSDictionary *)v14;
}

- (id)dictionaryStringToSetFromObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v3;
    v4 = v3;
    v5 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (!v7)
      goto LABEL_18;
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __atxlog_handle_lock_screen();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            goto LABEL_13;
          *(_DWORD *)buf = 136315394;
          v28 = "-[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:]";
          v29 = 2112;
          v30 = v11;
          v17 = v15;
          v18 = "%s: key is not a string: %@";
          goto LABEL_16;
        }
        -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v14 = objc_alloc(MEMORY[0x1E0C99E60]);
          -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v11);

          goto LABEL_13;
        }
        __atxlog_handle_lock_screen();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:]";
          v29 = 2112;
          v30 = v11;
          v17 = v15;
          v18 = "%s: value is not an array for key: %@";
LABEL_16:
          _os_log_fault_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0x16u);
        }
LABEL_13:

        ++v10;
      }
      while (v8 != v10);
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v8 = v19;
      if (!v19)
      {
LABEL_18:

        v20 = (void *)objc_msgSend(v5, "copy");
        v3 = v22;
        goto LABEL_22;
      }
    }
  }
  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[ATXFaceSuggestionAssetParameters dictionaryStringToSetFromObject:].cold.1((uint64_t)v3, v6);
  v20 = 0;
LABEL_22:

  return v20;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  -[ATXFaceSuggestionAssetParameters topLevelDictionary](self, "topLevelDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionAssetParameters dictionaryForKey:].cold.1((uint64_t)v4, self, v8);

    v7 = 0;
  }

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  -[ATXFaceSuggestionAssetParameters topLevelDictionary](self, "topLevelDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXFaceSuggestionAssetParameters arrayForKey:].cold.1((uint64_t)v4, self, v8);

    v7 = 0;
  }

  return v7;
}

- (NSDictionary)topLevelDictionary
{
  ATXFaceSuggestionAssetParameters *v2;
  NSDictionary *topLevelDictionary;
  uint64_t v4;
  uint64_t v5;
  NSDictionary *v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = self;
  objc_sync_enter(v2);
  topLevelDictionary = v2->_topLevelDictionary;
  if (topLevelDictionary)
  {
    v4 = -[NSDictionary copy](topLevelDictionary, "copy");
LABEL_5:
    v7 = (void *)v4;
    goto LABEL_6;
  }
  if (v2->_path)
  {
    +[ATXFaceSuggestionAssetParameters _loadAssetParametersDictionaryFromPath:](ATXFaceSuggestionAssetParameters, "_loadAssetParametersDictionaryFromPath:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_topLevelDictionary;
    v2->_topLevelDictionary = (NSDictionary *)v5;

    v4 = -[NSDictionary copy](v2->_topLevelDictionary, "copy");
    goto LABEL_5;
  }
  __atxlog_handle_lock_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ATXFaceSuggestionAssetParameters topLevelDictionary].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v7 = 0;
LABEL_6:
  objc_sync_exit(v2);

  return (NSDictionary *)v7;
}

+ (id)_loadAssetParametersDictionaryFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  id v12;

  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v6;
        v8 = v6;
        goto LABEL_13;
      }
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXFaceSuggestionAssetParameters _loadAssetParametersDictionaryFromPath:].cold.3();
    }
    else
    {
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXFaceSuggestionAssetParameters _loadAssetParametersDictionaryFromPath:].cold.2();
    }

    v8 = 0;
    goto LABEL_13;
  }
  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[ATXFaceSuggestionAssetParameters _loadAssetParametersDictionaryFromPath:].cold.1();
  v8 = 0;
  v7 = v5;
LABEL_13:

  return v8;
}

- (id)_posterDescriptorFromKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster")))
  {
    -[ATXPosterDescriptorCache descriptors](self->_descriptorCache, "descriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.WallpaperKit.CollectionsPoster"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v6, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") > 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPosterDescriptorCache descriptors](self->_descriptorCache, "descriptors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __61__ATXFaceSuggestionAssetParameters__posterDescriptorFromKey___block_invoke;
        v26[3] = &unk_1E82E8EC0;
        v19 = v15;
        v27 = v19;
        objc_msgSend(v17, "bs_firstObjectPassingTest:", v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v7 = v20;
        }
        else
        {
          v24[0] = v18;
          v24[1] = 3221225472;
          v24[2] = __61__ATXFaceSuggestionAssetParameters__posterDescriptorFromKey___block_invoke_2;
          v24[3] = &unk_1E82E8EC0;
          v25 = v19;
          objc_msgSend(v17, "bs_firstObjectPassingTest:", v24);
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        __atxlog_handle_lock_screen();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ATXFaceSuggestionAssetParameters _posterDescriptorFromKey:].cold.2();

        v7 = 0;
      }

    }
    else
    {
      __atxlog_handle_lock_screen();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[ATXFaceSuggestionAssetParameters _posterDescriptorFromKey:].cold.1(v6, v8, v9, v10, v11, v12, v13, v14);
      v7 = 0;
    }
  }

  return v7;
}

uint64_t __61__ATXFaceSuggestionAssetParameters__posterDescriptorFromKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "coreIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __61__ATXFaceSuggestionAssetParameters__posterDescriptorFromKey___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "coreIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_currentCountryCode
{
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSLocale countryCode](self->_locale, "countryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_lock_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[ATXFaceSuggestionAssetParameters _currentCountryCode]";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s: using country code: %@", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelDictionary, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

void __48__ATXFaceSuggestionAssetParameters_sectionOrder__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __52__ATXFaceSuggestionAssetParameters_heroSectionOrder__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __73__ATXFaceSuggestionAssetParameters_weatherAndAstronomySectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __66__ATXFaceSuggestionAssetParameters_kaleidoscopeSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __59__ATXFaceSuggestionAssetParameters_emojiSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __59__ATXFaceSuggestionAssetParameters_unitySectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __59__ATXFaceSuggestionAssetParameters_prideSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __63__ATXFaceSuggestionAssetParameters_osVersionSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __65__ATXFaceSuggestionAssetParameters_collectionsSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __59__ATXFaceSuggestionAssetParameters_colorSectionDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __70__ATXFaceSuggestionAssetParameters_descriptorsToRemoveFromCollections__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __62__ATXFaceSuggestionAssetParameters_dayZeroFeaturedDescriptors__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

void __91__ATXFaceSuggestionAssetParameters_extensionBundleIdsEligibleForComplicationsInFaceGallery__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_10(&dword_1C9A3B000, v0, v1, "%s: item '%@' is not a string in array with key %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_4();
}

- (void)dictionaryStringToSetFromObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  v4 = v3;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%s: object is not a dictionary: %@", (uint8_t *)v5, 0x16u);

  OUTLINED_FUNCTION_4_4();
}

- (void)dictionaryForKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "topLevelDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, v5, "%s: did not find dictionary with key %@ in top level dictionary: %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_16();
}

- (void)arrayForKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "topLevelDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, v5, "%s: did not find array with key %@ in top level dictionary: %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_16();
}

- (void)topLevelDictionary
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: could not get file path", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadAssetParametersDictionaryFromPath:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, v0, (uint64_t)v0, "%s: could not load data from path: %@; error: %@",
    (uint8_t *)v1);
  OUTLINED_FUNCTION_4_4();
}

+ (void)_loadAssetParametersDictionaryFromPath:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, v0, (uint64_t)v0, "%s: could not parse JSON from contents of path: %@; error: %@",
    (uint8_t *)v1);
  OUTLINED_FUNCTION_4_4();
}

+ (void)_loadAssetParametersDictionaryFromPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: parsed JSON is not a dictionary at path: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_posterDescriptorFromKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: parsed poster descriptor key is not a valid key. Needs to be extensionBundleId:identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_posterDescriptorFromKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: extensionBundleId %@ not found in descriptor cache", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

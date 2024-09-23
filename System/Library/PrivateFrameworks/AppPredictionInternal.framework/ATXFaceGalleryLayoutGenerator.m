@implementation ATXFaceGalleryLayoutGenerator

- (ATXFaceGalleryLayoutGenerator)initWithDescriptors:(id)a3 complicationProvider:(id)a4 complicationDescriptorProvider:(id)a5 parameters:(id)a6 dayZero:(BOOL)a7 locale:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXFaceGalleryLayoutGenerator *v18;
  ATXFaceGalleryLayoutGenerator *v19;
  uint64_t v20;
  ATXComplicationSuggestionParameters *complicationParameters;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ATXFaceGalleryLayoutGenerator;
  v18 = -[ATXFaceGalleryLayoutGenerator init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_complicationProvider, a4);
    objc_storeStrong((id *)&v19->_complicationDescriptorProvider, a5);
    objc_storeStrong((id *)&v19->_parameters, a6);
    v19->_dayZero = a7;
    objc_storeStrong((id *)&v19->_locale, a8);
    +[ATXComplicationSuggestionParameters sharedInstance](ATXComplicationSuggestionParameters, "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    complicationParameters = v19->_complicationParameters;
    v19->_complicationParameters = (ATXComplicationSuggestionParameters *)v20;

    -[ATXFaceGalleryLayoutGenerator _processDescriptors:](v19, "_processDescriptors:", v14);
  }

  return v19;
}

- (id)generatedConfigurationWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  ATXFaceGalleryLayoutGenerator *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  __int128 v70;
  id v71;
  id v72;
  id v73;
  ATXFaceGalleryLayoutGenerator *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  const char *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v72 = a4;
  v71 = a5;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v81 = "-[ATXFaceGalleryLayoutGenerator generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchD"
          "ata:bundleIdToCompanionBundleId:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: generating new gallery layout", buf, 0xCu);
  }

  -[ATXFaceSuggestionParameters sectionOrder](self->_parameters, "sectionOrder");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  if (!objc_msgSend(v12, "count"))
  {
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXFaceGalleryLayoutGenerator generatedConfigurationWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  v21 = (void *)objc_opt_new();
  v74 = self;
  -[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v73, v72, v71);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v76;
    *(_QWORD *)&v25 = 138412290;
    v70 = v25;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v76 != v27)
          objc_enumerationMutation(v23);
        v29 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * v28);
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Default")))
          goto LABEL_72;
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("FeaturedFaces")))
        {

          objc_msgSend(v21, "addObject:", v22);
          goto LABEL_18;
        }
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("FeaturedPhotos")))
        {

          if ((objc_msgSend(MEMORY[0x1E0CF8CD8], "bundleIdIsLockedOrHiddenByUserPreference:", CFSTR("com.apple.mobileslideshow")) & 1) == 0)
          {
            -[ATXFaceGalleryLayoutGenerator _generatedFeaturedPhotosSectionGivenFeaturedSection:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](v74, "_generatedFeaturedPhotosSectionGivenFeaturedSection:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v22, v73, v72, v71);
            v32 = objc_claimAutoreleasedReturnValue();
LABEL_28:
            v29 = v32;
            if (!v32)
              goto LABEL_72;
            goto LABEL_32;
          }
          __atxlog_handle_lock_screen();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_72;
          *(_DWORD *)buf = v70;
          v81 = CFSTR("com.apple.mobileslideshow");
          v30 = v29;
          v31 = "Not generating Suggested Photos section: %@ is locked or hidden by user preference.";
          goto LABEL_24;
        }
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Focus")))
        {

          -[ATXFaceGalleryLayoutGenerator _generatedFocusSection](v74, "_generatedFocusSection");
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Hero")))
        {

          -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](v74, "_generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v73, v72, v71);
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_32:
          objc_msgSend(v21, "addObject:", v29, v70);
          goto LABEL_72;
        }
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("PhotoShuffle")))
        {

          if ((objc_msgSend(MEMORY[0x1E0CF8CD8], "bundleIdIsLockedOrHiddenByUserPreference:", CFSTR("com.apple.mobileslideshow")) & 1) == 0)
          {
            -[ATXFaceGalleryLayoutGenerator _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](v74, "_generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v73, v72, v71);
            v32 = objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          }
          __atxlog_handle_lock_screen();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_72;
          *(_DWORD *)buf = v70;
          v81 = CFSTR("com.apple.mobileslideshow");
          v30 = v29;
          v31 = "Not generating Photo Shuffle section: %@ is locked or hidden by user preference.";
LABEL_24:
          _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
          goto LABEL_72;
        }
        if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("WeatherAndAstronomy")))
        {

          -[ATXFaceSuggestionParameters weatherAndAstronomySectionDescriptors](v74->_parameters, "weatherAndAstronomySectionDescriptors");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v33;
          v35 = (void *)MEMORY[0x1E0C9AA60];
          if (v33)
            v35 = (void *)v33;
          v36 = v35;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 6;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Kaleidoscope")))
        {

          -[ATXFaceSuggestionParameters kaleidoscopeSectionDescriptors](v74->_parameters, "kaleidoscopeSectionDescriptors");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v43;
          v45 = (void *)MEMORY[0x1E0C9AA60];
          if (v43)
            v45 = (void *)v43;
          v36 = v45;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 7;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Emoji")))
        {

          -[ATXFaceSuggestionParameters emojiSectionDescriptors](v74->_parameters, "emojiSectionDescriptors");
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v46;
          v48 = (void *)MEMORY[0x1E0C9AA60];
          if (v46)
            v48 = (void *)v46;
          v36 = v48;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 8;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Unity")))
        {

          -[ATXFaceSuggestionParameters unitySectionDescriptors](v74->_parameters, "unitySectionDescriptors");
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)v49;
          v51 = (void *)MEMORY[0x1E0C9AA60];
          if (v49)
            v51 = (void *)v49;
          v36 = v51;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 9;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Pride")))
        {

          -[ATXFaceSuggestionParameters prideSectionDescriptors](v74->_parameters, "prideSectionDescriptors");
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = (void *)v52;
          v54 = (void *)MEMORY[0x1E0C9AA60];
          if (v52)
            v54 = (void *)v52;
          v36 = v54;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 10;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("OSVersion")))
        {

          -[ATXFaceSuggestionParameters osVersionSectionDescriptors](v74->_parameters, "osVersionSectionDescriptors");
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v55;
          v57 = (void *)MEMORY[0x1E0C9AA60];
          if (v55)
            v57 = (void *)v55;
          v36 = v57;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 11;
        }
        else if (-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Collections")))
        {

          -[ATXFaceSuggestionParameters collectionsSectionDescriptors](v74->_parameters, "collectionsSectionDescriptors");
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v58;
          v60 = (void *)MEMORY[0x1E0C9AA60];
          if (v58)
            v60 = (void *)v58;
          v36 = v60;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 12;
        }
        else
        {
          v61 = -[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Color"));

          if ((v61 & 1) == 0)
            goto LABEL_18;
          -[ATXFaceSuggestionParameters colorSectionDescriptors](v74->_parameters, "colorSectionDescriptors");
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = (void *)v62;
          v64 = (void *)MEMORY[0x1E0C9AA60];
          if (v62)
            v64 = (void *)v62;
          v36 = v64;

          v37 = v74;
          v39 = v72;
          v38 = v73;
          v40 = v71;
          v41 = v36;
          v42 = 13;
        }
        -[ATXFaceGalleryLayoutGenerator _generateSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:assetDescriptors:semanticType:](v37, "_generateSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:assetDescriptors:semanticType:", v38, v39, v40, v41, v42, v70);
        v29 = objc_claimAutoreleasedReturnValue();

        if (v29)
          objc_msgSend(v21, "addObject:", v29);
LABEL_72:

LABEL_18:
        ++v28;
      }
      while (v26 != v28);
      v65 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      v26 = v65;
    }
    while (v65);
  }

  v66 = objc_alloc(MEMORY[0x1E0CF8E08]);
  v67 = (void *)objc_msgSend(v21, "copy");
  v68 = (void *)objc_msgSend(v66, "initWithSections:source:locale:dayZero:", v67, 1, v74->_locale, v74->_dayZero);

  return v68;
}

- (void)_processDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  NSArray *allHeroDescriptors;
  NSArray *v16;
  NSArray *allNonHeroDescriptors;
  NSDictionary *v18;
  NSDictionary *nonHeroDescriptorsByExtensionBundleId;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  -[ATXFaceSuggestionParameters hiddenRegions](self->_parameters, "hiddenRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionParameters allowedDescriptorsForRegions](self->_parameters, "allowedDescriptorsForRegions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__ATXFaceGalleryLayoutGenerator__processDescriptors___block_invoke;
  v21[3] = &unk_1E82EA300;
  v21[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v5;
  v25 = v6;
  v26 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  v13 = v9;
  v20 = v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v21);

  v14 = (NSArray *)objc_msgSend(v12, "copy");
  allHeroDescriptors = self->_allHeroDescriptors;
  self->_allHeroDescriptors = v14;

  v16 = (NSArray *)objc_msgSend(v11, "copy");
  allNonHeroDescriptors = self->_allNonHeroDescriptors;
  self->_allNonHeroDescriptors = v16;

  v18 = (NSDictionary *)objc_msgSend(v10, "copy");
  nonHeroDescriptorsByExtensionBundleId = self->_nonHeroDescriptorsByExtensionBundleId;
  self->_nonHeroDescriptorsByExtensionBundleId = v18;

}

void __53__ATXFaceGalleryLayoutGenerator__processDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  NSObject *v42;
  id obj;
  char v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  NSObject *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_42;
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (!v11)
  {
LABEL_42:
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster")))
    {
      v12 = MGGetStringAnswer();
      if ((-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("iPad7,5")) & 1) != 0
        || -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("iPad7,6")))
      {
        __atxlog_handle_lock_screen();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_11:

          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315650;
        v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
        v52 = 2112;
        v53 = v5;
        v54 = 2112;
        v55 = v12;
        v14 = "%s: disallowing extensionBundleId %@ for product type: %@";
        v15 = v13;
LABEL_10:
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, 0x20u);
        goto LABEL_11;
      }

    }
    v42 = objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v41 = v6;
    obj = v6;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (!v16)
      goto LABEL_38;
    v17 = v16;
    v44 = 0;
    v45 = *(_QWORD *)v47;
LABEL_15:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v45)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
        v22 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v22;
        if (v25)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "containsObject:", v29);

          __atxlog_handle_lock_screen();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          v5 = v22;
          if ((v30 & 1) == 0)
          {
            if (v32)
            {
              objc_msgSend(v19, "identifier");
              v37 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
              v52 = 2112;
              v53 = v22;
              v54 = 2112;
              v55 = v37;
              v56 = 2112;
              v57 = v38;
              _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "%s: hiding extensionBundleId %@ descriptorId: %@ in restricted locale: %@ because it's not on allow list.", buf, 0x2Au);

            }
            goto LABEL_36;
          }
          if (v32)
          {
            objc_msgSend(v19, "identifier");
            v33 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
            v52 = 2112;
            v53 = v22;
            v54 = 2112;
            v55 = v33;
            v56 = 2112;
            v57 = v34;
            _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "%s: Accepting extensionBundleId %@ descriptorId: %@ in restricted locale: %@ because it is on allow list.", buf, 0x2Au);

          }
        }
      }
      objc_msgSend(v19, "galleryOptions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isHero");

      if (v36)
      {
        if ((v44 & 1) != 0 && !isPhotosPosterExtensionBundleId(v5))
        {
          __atxlog_handle_lock_screen();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
            v52 = 2112;
            v53 = v5;
            _os_log_error_impl(&dword_1C9A3B000, v39, OS_LOG_TYPE_ERROR, "%s: provider %@ has provided more than one hero descriptor!", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);
        }
        v44 = 1;
      }
      else
      {
        -[NSObject addObject:](v42, "addObject:", v19);
      }
LABEL_36:
      if (v17 == ++v18)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (!v17)
        {
LABEL_38:

          v12 = v42;
          objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v42);
          v40 = -[NSObject copy](v42, "copy");
          objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v40, v5);

          v6 = v41;
          goto LABEL_39;
        }
        goto LABEL_15;
      }
    }
  }
  __atxlog_handle_lock_screen();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v51 = "-[ATXFaceGalleryLayoutGenerator _processDescriptors:]_block_invoke";
    v52 = 2112;
    v53 = v5;
    v54 = 2112;
    v55 = v13;
    v14 = "%s: hiding extensionBundleId %@ in restricted locale: %@";
    v15 = v12;
    goto LABEL_10;
  }
LABEL_39:

}

- (id)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  NSObject *v8;
  NSUInteger v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  ATXFaceGalleryLayoutGenerator *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  NSUInteger v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v68 = a4;
  v67 = a5;
  __atxlog_handle_lock_screen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSArray count](self->_allHeroDescriptors, "count");
    *(_DWORD *)buf = 136315394;
    v90 = "-[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchDa"
          "ta:bundleIdToCompanionBundleId:]";
    v91 = 2048;
    v92 = v9;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%s: %lu hero descriptors", buf, 0x16u);
  }

  v10 = (void *)objc_opt_new();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v66 = self;
  v11 = self->_allHeroDescriptors;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (!v12)
  {
    v72 = 0;
    v73 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_29;
  }
  v13 = v12;
  v72 = 0;
  v73 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v83 != v16)
        objc_enumerationMutation(v11);
      v18 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * i);
      if ((isPhotosDescriptor(v18) & 1) != 0)
      {
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("CreateAFacePhotos"));

        if (v20)
        {
          v21 = v15;
          v15 = v18;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v22 = v18;
      if ((isPhotosDescriptor(v22) & 1) != 0)
      {
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "hasPrefix:", CFSTR("CreateAFacePeople"));

        if (v24)
        {
          v21 = v14;
          v14 = v22;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v25 = v22;
      if ((isPhotosDescriptor(v25) & 1) != 0)
      {
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("CreateAFaceShuffle"));

        if (v27)
        {
          v21 = v72;
          v72 = v25;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v28 = v25;
      if ((isPhotosDescriptor(v28) & 1) != 0)
      {
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "hasPrefix:", CFSTR("CreateAFaceLivePhoto"));

        if (v30)
        {
          v21 = v73;
          v73 = v28;
          goto LABEL_25;
        }
      }
      else
      {

      }
      objc_msgSend(v28, "extensionBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, v21);
LABEL_25:

    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  }
  while (v13);
LABEL_29:
  v71 = v10;

  v31 = (void *)objc_opt_new();
  -[ATXFaceSuggestionParameters heroSectionOrder](v66->_parameters, "heroSectionOrder");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  v34 = (void *)MEMORY[0x1E0C9AA60];
  if (v32)
    v34 = (void *)v32;
  v35 = v34;

  v36 = v72;
  if (!objc_msgSend(v35, "count"))
  {
    __atxlog_handle_lock_screen();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);

  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v45 = v35;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  v70 = v45;
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v79 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        if (v15
          && objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "isEqualToString:", CFSTR("Photos")))
        {
          v51 = v31;
          v52 = v15;
LABEL_52:
          objc_msgSend(v51, "addObject:", v52);
          continue;
        }
        if (v14 && objc_msgSend(v50, "isEqualToString:", CFSTR("People")))
        {
          v51 = v31;
          v52 = v14;
          goto LABEL_52;
        }
        if (v36 && objc_msgSend(v50, "isEqualToString:", CFSTR("Shuffle")))
        {
          v51 = v31;
          v52 = v36;
          goto LABEL_52;
        }
        if (v73 && objc_msgSend(v50, "isEqualToString:", CFSTR("LivePhoto")))
        {
          v51 = v31;
          v52 = v73;
          goto LABEL_52;
        }
        objc_msgSend(v71, "objectForKeyedSubscript:", v50);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          objc_msgSend(v31, "addObject:", v53);
          objc_msgSend(v71, "removeObjectForKey:", v50);
        }
        else
        {
          __atxlog_handle_lock_screen();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v90 = "-[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedApp"
                  "LaunchData:bundleIdToCompanionBundleId:]";
            v91 = 2112;
            v92 = (NSUInteger)v50;
            _os_log_error_impl(&dword_1C9A3B000, v54, OS_LOG_TYPE_ERROR, "%s: could not find extensionBundleId defined in hero section order: %@", buf, 0x16u);
          }

        }
        v36 = v72;
        v45 = v70;
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v47);
  }

  objc_msgSend(v71, "allValues");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "count"))
  {
    __atxlog_handle_lock_screen();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      -[ATXFaceGalleryLayoutGenerator _generatedHeroSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:].cold.1(v71, v56);

    objc_msgSend(v31, "addObjectsFromArray:", v55);
  }
  v57 = (void *)objc_msgSend(v31, "copy");
  -[ATXFaceGalleryLayoutGenerator _itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:](v66, "_itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:", v57, v69, v68, v67, 1, 0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v59 = v58;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v75 != v62)
          objc_enumerationMutation(v59);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "setSource:", 1);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v61);
  }

  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E18]), "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", 0, 0, 0, 0, 0, 0, 3, v59, 4);
  return v64;
}

- (id)_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  NSObject *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_dayZero)
  {
    -[ATXFaceSuggestionParameters dayZeroFeaturedDescriptors](self->_parameters, "dayZeroFeaturedDescriptors");
    v11 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](v11, "count") > 5)
      goto LABEL_11;
    __atxlog_handle_lock_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:].cold.1();
  }
  else
  {
    -[ATXFaceGalleryLayoutGenerator rankedFeaturedDescriptors](self, "rankedFeaturedDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLa"
            "unchData:bundleIdToCompanionBundleId:]";
      v56 = 2112;
      v57 = v12;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "%s: ranked descriptors before deduplicating and photos promotion: %@", buf, 0x16u);
    }

    -[NSObject _pas_filteredArrayWithTest:](v12, "_pas_filteredArrayWithTest:", &__block_literal_global_229);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_descriptorsByDeduplicatingExtensionsInDescriptors:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_lock_screen();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLa"
            "unchData:bundleIdToCompanionBundleId:]";
      v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%s: ranked descriptors after deduplicating photos promotion: %@", buf, 0x16u);
    }

  }
LABEL_11:
  v16 = (void *)MEMORY[0x1E0C9AA60];
  v38 = v11;
  v39 = v10;
  if (v11)
    v17 = v11;
  else
    v17 = MEMORY[0x1E0C9AA60];
  v40 = v9;
  v41 = v8;
  -[ATXFaceGalleryLayoutGenerator _itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:](self, "_itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:", v17, v8, v9, v10, 1, 1, &unk_1E83CE380);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceSuggestionParameters osVersionSectionDescriptors](self->_parameters, "osVersionSectionDescriptors");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v16;
  v43 = v21;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v18;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v26, "setSource:", 2);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v27 = v43;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v45 != v30)
                objc_enumerationMutation(v27);
              if (-[ATXFaceGalleryLayoutGenerator isDescriptorFromGalleryItem:availableInAssetParameter:](self, "isDescriptorFromGalleryItem:availableInAssetParameter:", v26, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j)))
              {
                -[ATXFaceGalleryLayoutGenerator _localizedTitleforOSVersionSection](self, "_localizedTitleforOSVersionSection");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setLocalizedDisplayName:", v32);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v29);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v23);
  }

  v33 = objc_alloc(MEMORY[0x1E0CF8E18]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_FEATURED_FACES"), &stru_1E82FDC98, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v33, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v35, 0, 0, 0, 0, 0, 1, obj, 1);

  return v36;
}

uint64_t __146__ATXFaceGalleryLayoutGenerator__generatedFeaturedSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotosDescriptor(a2) ^ 1;
}

- (NSArray)rankedFeaturedDescriptors
{
  void *v3;
  ATXFaceSuggestionScorer *v4;
  ATXFaceSuggestionParameters *parameters;
  void *v6;
  ATXFaceSuggestionScorer *v7;
  ATXFaceSuggestionScorer *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  ATXFaceSuggestionScorer *v13;

  -[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors](self, "_candidateFeaturedDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ATXFaceSuggestionScorer alloc];
  parameters = self->_parameters;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
  v7 = -[ATXFaceSuggestionScorer initWithParameters:descriptors:](v4, "initWithParameters:descriptors:", parameters, v6);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke;
  v12[3] = &unk_1E82EA368;
  v13 = v7;
  v8 = v7;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_46_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

id __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "featuredScoreForDescriptor:", v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScore:", v4);

  __atxlog_handle_lock_screen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ATXFaceGalleryLayoutGenerator rankedFeaturedDescriptors]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: descriptor: %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

uint64_t __58__ATXFaceGalleryLayoutGenerator_rankedFeaturedDescriptors__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

    if (!v8)
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "compare:", v12);

    }
  }

  return v8;
}

- (id)_candidateFeaturedDescriptors
{
  NSArray *allNonHeroDescriptors;
  _QWORD v4[5];

  allNonHeroDescriptors = self->_allNonHeroDescriptors;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ATXFaceGalleryLayoutGenerator__candidateFeaturedDescriptors__block_invoke;
  v4[3] = &unk_1E82E8EC0;
  v4[4] = self;
  -[NSArray _pas_filteredArrayWithTest:](allNonHeroDescriptors, "_pas_filteredArrayWithTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __62__ATXFaceGalleryLayoutGenerator__candidateFeaturedDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (isPhotosDescriptor(v3))
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
      v25 = 2112;
      v26 = v3;
      v5 = "%s: not considering photos descriptor for featured section: %@";
LABEL_10:
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v3, "galleryOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "featuredConfidenceLevel");

    if (v7)
    {
      objc_msgSend(v3, "galleryOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isOnlyEligibleForMadeForFocusSection");

      if (v9)
      {
        __atxlog_handle_lock_screen();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136315394;
          v24 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
          v25 = 2112;
          v26 = v3;
          v5 = "%s: not considering descriptor made only for focus for featured section: %@";
          goto LABEL_10;
        }
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unpromotableRegions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "extensionBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsObject:", v17);

          if (v18)
          {
            __atxlog_handle_lock_screen();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "countryCode");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 136315394;
              v24 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
              v25 = 2112;
              v26 = v20;
              _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, "%s: not considering unpromotable descriptor in restricted locale: %@", (uint8_t *)&v23, 0x16u);

            }
            goto LABEL_12;
          }
        }
        objc_msgSend(v3, "extensionBundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.weather.poster"));

        if (!v22 || (objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledForBundle:", CFSTR("com.apple.weather")) & 1) != 0)
        {
          v10 = objc_msgSend(*(id *)(a1 + 32), "shouldRemoveDescriptorFromFeatured:", v3) ^ 1;
          goto LABEL_13;
        }
        __atxlog_handle_lock_screen();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136315394;
          v24 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
          v25 = 2112;
          v26 = v3;
          v5 = "%s: not considering descriptor for featured section because weather app is not currently installed: %@";
          goto LABEL_10;
        }
      }
    }
    else
    {
      __atxlog_handle_lock_screen();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315394;
        v24 = "-[ATXFaceGalleryLayoutGenerator _candidateFeaturedDescriptors]_block_invoke";
        v25 = 2112;
        v26 = v3;
        v5 = "%s: not considering unconfident descriptor for featured section: %@";
        goto LABEL_10;
      }
    }
  }

LABEL_12:
  v10 = 0;
LABEL_13:

  return v10;
}

+ (id)_descriptorsByDeduplicatingExtensionsInDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  v32 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v11, "extensionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.RhizomePoster"));

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v8)
        continue;
      break;
    }
    v14 = 0;
LABEL_11:
    v5 = v32;
  }
  else
  {
    v14 = 0;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v19, "extensionBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "containsObject:", v20);

        if (!v21)
        {
          objc_msgSend(v19, "extensionBundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.UnityPoster.UnityPosterExtension")) & 1) != 0)
            goto LABEL_25;
          objc_msgSend(v19, "extensionBundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.ExtragalacticPoster")))
          {

LABEL_25:
LABEL_26:
            objc_msgSend(v4, "addObject:", CFSTR("com.apple.UnityPoster.UnityPosterExtension"));
            objc_msgSend(v4, "addObject:", CFSTR("com.apple.WatchFacesWallpaperSupport.ExtragalacticPoster"));
            objc_msgSend(v4, "addObject:", CFSTR("com.apple.WatchFacesWallpaperSupport.RhizomePoster"));
            if (v14)
            {
              v25 = v5;
              v26 = v14;
LABEL_31:
              objc_msgSend(v25, "addObject:", v26);
              continue;
            }
          }
          else
          {
            objc_msgSend(v19, "extensionBundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.RhizomePoster"));

            v5 = v32;
            if ((v28 & 1) != 0)
              goto LABEL_26;
            objc_msgSend(v19, "extensionBundleIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v29);

            v5 = v32;
          }
          v25 = v5;
          v26 = v19;
          goto LABEL_31;
        }
        __atxlog_handle_lock_screen();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "+[ATXFaceGalleryLayoutGenerator _descriptorsByDeduplicatingExtensionsInDescriptors:]";
          v44 = 2112;
          v45 = v19;
          _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "%s: skipping descriptor, extensionBundleId already used: %@", buf, 0x16u);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v16);
  }

  v30 = (void *)objc_msgSend(v5, "copy");
  return v30;
}

- (id)_generatedFeaturedPhotosSectionGivenFeaturedSection:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[NSDictionary objectForKeyedSubscript:](self->_nonHeroDescriptorsByExtensionBundleId, "objectForKeyedSubscript:", CFSTR("com.apple.mobileslideshow.PhotosPosterProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_nonHeroDescriptorsByExtensionBundleId, "objectForKeyedSubscript:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_63_1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ATXFaceGalleryLayoutGenerator _itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:](self, "_itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:", v16, v9, v10, v11, 0, 1, &unk_1E83CE398);
    v17 = objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setSource:", 3);
        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v19);
    }
    v22 = objc_alloc(MEMORY[0x1E0CF8E18]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_FEATURED_PHOTOS"), &stru_1E82FDC98, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v24, 0, 0, 0, 0, 0, 1, v17, 2);

  }
  else
  {
    __atxlog_handle_lock_screen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[ATXFaceGalleryLayoutGenerator _generatedFeaturedPhotosSectionGivenFeaturedSection:widgetDescriptorsAdditio"
            "nalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:]";
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "%s: no viable photos descriptors are available, not returning a photos section", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

uint64_t __169__ATXFaceGalleryLayoutGenerator__generatedFeaturedPhotosSectionGivenFeaturedSection_widgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotoShuffleDescriptor(a2) ^ 1;
}

- (id)_generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSDictionary objectForKeyedSubscript:](self->_nonHeroDescriptorsByExtensionBundleId, "objectForKeyedSubscript:", CFSTR("com.apple.mobileslideshow.PhotosPosterProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_nonHeroDescriptorsByExtensionBundleId, "objectForKeyedSubscript:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v14, "_pas_filteredArrayWithTest:", &__block_literal_global_67_3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = objc_msgSend(v15, "count");
    __atxlog_handle_lock_screen();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[ATXFaceGalleryLayoutGenerator _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedA"
            "ppLaunchData:bundleIdToCompanionBundleId:]";
      v49 = 1024;
      v50 = v16 > 1;
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "%s: shuffle should show display name: %{BOOL}d", buf, 0x12u);
    }

    v40 = v9;
    -[ATXFaceGalleryLayoutGenerator _itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:](self, "_itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:", v15, v8, v9, v10, v16 > 1, 0, &unk_1E83CE398);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "setSource:", 4);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v20);
    }
    v39 = v14;
    v41 = v8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_DESCRIPTIVE_TEXT_PHOTO_SHUFFLE"), &stru_1E82FDC98, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = v10;
    if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_DESCRIPTIVE_TEXT_PHOTO_SHUFFLE_IPAD"), &stru_1E82FDC98, 0);
      v27 = objc_claimAutoreleasedReturnValue();

      v24 = v27;
    }
    v28 = v16 > 1;
    if (v16 <= 1)
      v29 = v24;
    else
      v29 = 0;
    if (v28)
      v30 = v24;
    else
      v30 = 0;
    v31 = (objc_class *)MEMORY[0x1E0CF8E18];
    v32 = v24;
    v33 = [v31 alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_PHOTO_SHUFFLE"), &stru_1E82FDC98, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 1;
    if (v29)
      v36 = 2;
    v37 = (void *)objc_msgSend(v33, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v35, 0, 0, v30, v29, v29, v36, v18, 5);

    v9 = v40;
    v8 = v41;
    v10 = v25;
    v14 = v39;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[ATXFaceGalleryLayoutGenerator _generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData:aggregatedA"
            "ppLaunchData:bundleIdToCompanionBundleId:]";
      _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "%s: no photo shuffle descriptors available, not returning a photo shuffle section", buf, 0xCu);
    }
    v37 = 0;
  }

  return v37;
}

uint64_t __150__ATXFaceGalleryLayoutGenerator__generatedPhotoShuffleSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, void *a2)
{
  return isPhotoShuffleDescriptor(a2);
}

- (BOOL)_isFocusUser
{
  void *v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dndModeUUIDForDNDModeSemanticType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = 4;
    do
    {
      v6 = v5;
      if (v5 == 9)
        break;
      objc_msgSend(v2, "dndModeUUIDForDNDModeSemanticType:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6 + 1;
    }
    while (!v7);
    v4 = (unint64_t)(v6 - 1) < 8;
  }

  return v4;
}

- (id)_generatedFocusSection
{
  ATXModeFaceSuggestionGenerator *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[16];

  if (-[ATXFaceGalleryLayoutGenerator _isFocusUser](self, "_isFocusUser"))
  {
    v3 = objc_alloc_init(ATXModeFaceSuggestionGenerator);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_allNonHeroDescriptors);
    -[ATXModeFaceSuggestionGenerator generateFacesFromDescriptors:](v3, "generateFacesFromDescriptors:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_alloc(MEMORY[0x1E0CF8E18]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_FOCUS"), &stru_1E82FDC98, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_SUBTITLE_FOCUS"), &stru_1E82FDC98, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v6, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v8, CFSTR("moon.fill"), CFSTR("systemIndigoColor"), v10, 0, 0, 1, v5, 3);

    }
    else
    {
      v11 = 0;
    }

    return v11;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Not generating Made For Focus section because user is not a Focus user", buf, 2u);
    }

    return 0;
  }
}

- (id)_generateSectionWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 assetDescriptors:(id)a6 semanticType:(int64_t)a7
{
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v50 = a4;
  v49 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "count"))
  {
    -[ATXFaceGalleryLayoutGenerator descriptorsToRemoveFromSectionWithSemanticType:](self, "descriptorsToRemoveFromSectionWithSemanticType:", a7);
    v14 = objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v48 = v12;
    obj = v12;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v66;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(obj);
          v16 = *(id *)(*((_QWORD *)&v65 + 1) + 8 * v15);
          v56 = v15;
          if (objc_msgSend(v16, "containsString:", CFSTR(":")))
          {
            objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "firstObject");
            v18 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "lastObject");
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v16 = (id)v18;
          }
          else
          {
            v20 = &stru_1E82FDC98;
          }
          v55 = v16;
          -[NSDictionary objectForKeyedSubscript:](self->_nonHeroDescriptorsByExtensionBundleId, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_pas_filteredArrayWithTest:", &__block_literal_global_87_0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v62 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
                if (-[ATXFaceGalleryLayoutGenerator shouldAddDescriptorFromExtension:descriptorIdentifierInAsset:withSemanticType:assetParametersToFilterOut:](self, "shouldAddDescriptorFromExtension:descriptorIdentifierInAsset:withSemanticType:assetParametersToFilterOut:", v28, v20, a7, v14))
                {
                  objc_msgSend(v13, "addObject:", v28);
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
            }
            while (v25);
          }

          v15 = v56 + 1;
        }
        while (v56 + 1 != v54);
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v54);
    }

    v29 = (void *)objc_msgSend(v13, "copy");
    -[ATXFaceGalleryLayoutGenerator _itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:](self, "_itemsFromDescriptors:widgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:shouldShowDisplayName:shouldShowComplications:limit:", v29, v51, v50, v49, 0, 1, &unk_1E83CE398);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v58 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "setSource:", 5);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v33);
    }

    v36 = objc_alloc(MEMORY[0x1E0CF8E18]);
    -[ATXFaceGalleryLayoutGenerator _localizedTitleTextWithSemanticType:](self, "_localizedTitleTextWithSemanticType:", a7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXFaceGalleryLayoutGenerator _localizedSubtitleTextWithSemanticType:](self, "_localizedSubtitleTextWithSemanticType:", a7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v37, 0, 0, v38, 0, 0, 1, v31, a7);

    v12 = v48;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXFaceGalleryLayoutGenerator _generateSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:assetDescriptors:semanticType:].cold.1(v14, v40, v41, v42, v43, v44, v45, v46);
    v39 = 0;
  }

  return v39;
}

uint64_t __167__ATXFaceGalleryLayoutGenerator__generateSectionWithWidgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId_assetDescriptors_semanticType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "galleryOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnlyEligibleForMadeForFocusSection") ^ 1;

  return v3;
}

- (id)_itemsFromDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 shouldShowDisplayName:(BOOL)a7 shouldShowComplications:(BOOL)a8 limit:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  _BOOL4 v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  void *v44;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v52;
  _BOOL4 v53;
  uint64_t v54;
  void *v55;
  ATXFaceGalleryLayoutGenerator *v56;
  _BOOL4 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v57 = a8;
  v53 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v47 = a9;
  -[ATXFaceGalleryLayoutGenerator _shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self, "_shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v15;
  v50 = v14;
  v48 = v16;
  -[ATXFaceGalleryLayoutGeneratorComplicationProviding landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:portraitSets:](self->_complicationProvider, "landscapeModularSetsDictsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:portraitSets:", v14, v15, v16, v17);
  v56 = self;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryLayoutGenerator _landscapeSetsFromLandscapeSetsDict:](self, "_landscapeSetsFromLandscapeSetsDict:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v13;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v54)
  {
    v20 = 0;
    v52 = *(_QWORD *)v59;
    v55 = v18;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v23 = v57
           && -[ATXFaceGalleryLayoutGenerator _descriptorIsEligibleForComplications:](v56, "_descriptorIsEligibleForComplications:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
        if (objc_msgSend(v17, "count"))
          v24 = v20 % objc_msgSend(v17, "count");
        else
          v24 = 0;
        if (objc_msgSend(v18, "count"))
        {
          v25 = v20 % objc_msgSend(v18, "count");
          if (!v23)
            goto LABEL_20;
        }
        else
        {
          v25 = 0;
          if (!v23)
            goto LABEL_20;
        }
        if (!objc_msgSend(v17, "count"))
        {
LABEL_20:
          v29 = 0;
          v28 = 0;
          goto LABEL_32;
        }
        objc_msgSend(v22, "galleryOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "allowsSystemSuggestedComplications"))
        {
          v27 = objc_msgSend(v17, "count");

          if (v27)
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
        }
        else
        {

        }
        v28 = 0;
LABEL_23:
        objc_msgSend(v22, "extensionBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.GradientPoster.GradientPosterExtension")))
        {

LABEL_26:
          objc_msgSend(v22, "galleryOptions");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v33, "allowsSystemSuggestedComplications"))
            goto LABEL_30;
          goto LABEL_27;
        }
        objc_msgSend(v22, "extensionBundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster"));

        if (v32)
          goto LABEL_26;
        objc_msgSend(v22, "galleryOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v33, "allowsSystemSuggestedComplicationsInLandscape"))
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_27:
        v34 = objc_msgSend(v55, "count");

        if (v34)
        {
          objc_msgSend(v55, "objectAtIndexedSubscript:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
LABEL_31:
        v29 = 0;
LABEL_32:
        -[ATXFaceGalleryLayoutGenerator _itemFromDescriptor:shouldShowDisplayName:shouldShowComplications:systemSuggestedComplicationSet:systemSuggestedLandscapeComplicationSet:](v56, "_itemFromDescriptor:shouldShowDisplayName:shouldShowComplications:systemSuggestedComplicationSet:systemSuggestedLandscapeComplicationSet:", v22, v53, v57, v28, v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v35);
        objc_msgSend(v35, "complications");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

        objc_msgSend(v35, "landscapeComplications");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37 | objc_msgSend(v38, "count");

        if (v39)
          ++v20;

        v18 = v55;
      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v54);
  }

  if (v47)
  {
    v40 = objc_msgSend(v19, "count");
    v41 = objc_msgSend(v47, "unsignedIntegerValue");
    if (v40 >= v41)
      v42 = v41;
    else
      v42 = v40;
    objc_msgSend(v19, "subarrayWithRange:", 0, v42);
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = v19;
  }
  v44 = v43;

  return v44;
}

- (id)_itemFromDescriptor:(id)a3 shouldShowDisplayName:(BOOL)a4 shouldShowComplications:(BOOL)a5 systemSuggestedComplicationSet:(id)a6 systemSuggestedLandscapeComplicationSet:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v39 = v10;
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E0CF8CE0];
    objc_msgSend(v12, "extensionBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedNameForExtensionBundleId:", v16);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  v40 = v14;
  v41 = v13;
  if (v9)
  {
    objc_msgSend(v13, "complications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXFaceGalleryLayoutGenerator _modularComplicationsForDescriptor:systemSuggestionComplications:](self, "_modularComplicationsForDescriptor:systemSuggestionComplications:", v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "complications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXFaceGalleryLayoutGenerator _modularLandscapeComplicationsForDescriptor:systemSuggestionComplications:](self, "_modularLandscapeComplicationsForDescriptor:systemSuggestionComplications:", v12, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXFaceGalleryLayoutGenerator _inlineComplicationForDescriptor:](self, "_inlineComplicationForDescriptor:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
    v18 = 0;
    v20 = 0;
  }
  v22 = objc_alloc(MEMORY[0x1E0CF8E10]);
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v22, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v24, v25, v26, v42, 0, &stru_1E82FDC98, v27, v21, 0, v18, v20);

  objc_msgSend(v28, "setSource:", 5);
  if (v39)
  {
    objc_msgSend(v12, "galleryOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "displayNameLocalizationKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDisplayNameLocalizationKey:", v30);

  }
  else
  {
    objc_msgSend(v28, "setDisplayNameLocalizationKey:", 0);
  }
  objc_msgSend(v12, "galleryOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "spokenNameLocalizationKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSpokenNameLocalizationKey:", v32);

  objc_msgSend(v12, "galleryOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "descriptiveTextLocalizationKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDescriptiveTextLocalizationKey:", v34);

  objc_msgSend(v12, "score");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setScore:", v35);

  objc_msgSend(v12, "galleryOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBlankTemplate:", objc_msgSend(v36, "isHero"));

  objc_msgSend(v12, "galleryOptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setShouldShowAsShuffleStack:", objc_msgSend(v37, "shouldShowAsShuffleStack"));

  return v28;
}

- (id)_inlineComplicationForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ATXComplicationSuggestionParameters showPreviewsInPosterGallery](self->_complicationParameters, "showPreviewsInPosterGallery")|| (objc_msgSend(v4, "galleryOptions"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "inlineComplication"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v5, !v6))
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "galleryOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineComplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXFaceGalleryLayoutGenerator _complicationExistsOnSystem:](self, "_complicationExistsOnSystem:", v8);

  if (!v9)
  {
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "galleryOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inlineComplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Not showing complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_8;
  }
  objc_msgSend(v4, "galleryOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inlineComplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v12, "setSource:", 5);
LABEL_9:

  return v12;
}

- (id)_modularComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  if (-[ATXComplicationSuggestionParameters showPreviewsInPosterGallery](self->_complicationParameters, "showPreviewsInPosterGallery"))
  {
    objc_msgSend(v6, "galleryOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modularComplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__ATXFaceGalleryLayoutGenerator__modularComplicationsForDescriptor_systemSuggestionComplications___block_invoke;
    v15[3] = &unk_1E82EA430;
    v15[4] = self;
    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v7;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __98__ATXFaceGalleryLayoutGenerator__modularComplicationsForDescriptor_systemSuggestionComplications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_complicationExistsOnSystem:", v3))
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setSource:", 5);
  }
  else
  {
    __atxlog_handle_lock_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Not showing preferred complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)_modularLandscapeComplicationsForDescriptor:(id)a3 systemSuggestionComplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  if (-[ATXComplicationSuggestionParameters showPreviewsInPosterGallery](self->_complicationParameters, "showPreviewsInPosterGallery")&& objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    objc_msgSend(v6, "galleryOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modularLandscapeComplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __107__ATXFaceGalleryLayoutGenerator__modularLandscapeComplicationsForDescriptor_systemSuggestionComplications___block_invoke;
    v15[3] = &unk_1E82EA430;
    v15[4] = self;
    objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v7;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __107__ATXFaceGalleryLayoutGenerator__modularLandscapeComplicationsForDescriptor_systemSuggestionComplications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_complicationExistsOnSystem:", v3))
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "setSource:", 5);
  }
  else
  {
    __atxlog_handle_lock_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Not showing preferred landscape complication since no matching chrono descriptor exists on system: %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (BOOL)_complicationExistsOnSystem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ATXFaceGalleryLayoutGeneratorComplicationDescriptorProviding allWidgetDescriptorsAllowedOnLockscreen](self->_complicationDescriptorProvider, "allWidgetDescriptorsAllowedOnLockscreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ATXFaceGalleryLayoutGenerator__complicationExistsOnSystem___block_invoke;
  v9[3] = &unk_1E82EA458;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __61__ATXFaceGalleryLayoutGenerator__complicationExistsOnSystem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v3, "supportedFamilies");
      objc_msgSend(*(id *)(a1 + 32), "widgetFamily");
      v8 = CHSWidgetFamilyMaskContainsFamily();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_shuffledSuggestableComplicationSetsWithWidgetDescriptorsAdditionalData:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ATXFaceGalleryLayoutGeneratorComplicationProviding modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:](self->_complicationProvider, "modularSetsWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:", v8, v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_shuffledArrayUsingRng:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  v18 = (void *)objc_msgSend(v11, "copy");
  return v18;
}

- (id)_landscapeSetsFromLandscapeSetsDict:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
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
  id v52;
  id v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v53 = (id)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v56 = *(_QWORD *)v58;
    v55 = *MEMORY[0x1E0CF89F8];
    v8 = *MEMORY[0x1E0CF89F0];
    v9 = *MEMORY[0x1E0CF89E8];
    v52 = v4;
    do
    {
      v10 = 0;
      v54 = v7;
      do
      {
        if (*(_QWORD *)v58 != v56)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", v55);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "complications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "complications");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "complications");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count") == 2 && objc_msgSend(v15, "count") == 2 && objc_msgSend(v17, "count") == 4)
        {
          v18 = (void *)objc_opt_new();
          switch(v54 + (_DWORD)v10)
          {
            case 0:
              objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v19);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v20);

              objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v21);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v22);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v23);

              objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v24);

              v25 = v13;
              v26 = 1;
              goto LABEL_15;
            case 1:
              objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v27);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v28);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v29);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v30);

              objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v31);

              objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v32);

              v33 = v13;
              v34 = 0;
              goto LABEL_13;
            case 2:
              objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v35);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v36);

              objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v37);

              objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v38);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v39);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v40);

              v33 = v15;
              v34 = 1;
LABEL_13:
              objc_msgSend(v33, "objectAtIndexedSubscript:", v34);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v13;
              goto LABEL_16;
            case 3:
              objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v43);

              objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v44);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v45);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v46);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v47);

              objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v48);

              v25 = v15;
              v26 = 0;
LABEL_15:
              objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v15;
LABEL_16:
              objc_msgSend(v18, "addObject:", v41);

              objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v49);

              break;
            default:
              break;
          }
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8D40]), "initWithComplications:", v18);
          objc_msgSend(v53, "addObject:", v50);

          v4 = v52;
        }

        ++v10;
      }
      while (v6 != v10);
      v7 = v54 + v6;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v6);
  }

  return v53;
}

- (BOOL)_descriptorIsEligibleForComplications:(id)a3
{
  ATXFaceSuggestionParameters *parameters;
  id v4;
  void *v5;
  void *v6;

  parameters = self->_parameters;
  v4 = a3;
  -[ATXFaceSuggestionParameters extensionBundleIdsEligibleForComplicationsInFaceGallery](parameters, "extensionBundleIdsEligibleForComplicationsInFaceGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)_localizedTitleForWeatherAndAstronomySection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_WEATHER_AND_ASTRONOMY"), &stru_1E82FDC98, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledForBundle:", CFSTR("com.apple.weather")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_ASTRONOMY_ONLY"), &stru_1E82FDC98, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_localizedTitleforOSVersionSection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_IOS_VERSION"), &stru_1E82FDC98, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_IPADOS_VERSION"), &stru_1E82FDC98, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_localizedTitleTextWithSemanticType:(int64_t)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 6:
      -[ATXFaceGalleryLayoutGenerator _localizedTitleForWeatherAndAstronomySection](self, "_localizedTitleForWeatherAndAstronomySection");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7:
      v5 = (void *)MEMORY[0x1E0CF8CE0];
      v6 = CFSTR("com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster");
      goto LABEL_11;
    case 8:
      v5 = (void *)MEMORY[0x1E0CF8CE0];
      v6 = CFSTR("com.apple.EmojiPoster.EmojiPosterExtension");
      goto LABEL_11;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACE_GALLERY_SECTION_TITLE_UNITY"), &stru_1E82FDC98, 0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v4;
    case 10:
      v5 = (void *)MEMORY[0x1E0CF8CE0];
      v6 = CFSTR("com.apple.PridePoster.PridePosterExtension");
      goto LABEL_11;
    case 11:
      -[ATXFaceGalleryLayoutGenerator _localizedTitleforOSVersionSection](self, "_localizedTitleforOSVersionSection");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 12:
      v5 = (void *)MEMORY[0x1E0CF8CE0];
      v6 = CFSTR("com.apple.WallpaperKit.CollectionsPoster");
      goto LABEL_11;
    case 13:
      v5 = (void *)MEMORY[0x1E0CF8CE0];
      v6 = CFSTR("com.apple.GradientPoster.GradientPosterExtension");
LABEL_11:
      objc_msgSend(v5, "localizedNameForExtensionBundleId:", v6);
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v4 = (__CFString *)v3;
      break;
    default:
      v4 = &stru_1E82FDC98;
      break;
  }
  return v4;
}

- (id)_localizedSubtitleTextWithSemanticType:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = &stru_1E82FDC98;
  switch(a3)
  {
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("FACE_GALLERY_SECTION_SUBTITLE_WEATHER_AND_ASTRONOMY");
      goto LABEL_6;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("FACE_GALLERY_SECTION_SUBTITLE_UNITY");
      goto LABEL_6;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("FACE_GALLERY_SECTION_SUBTITLE_PRIDE");
      goto LABEL_6;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("FACE_GALLERY_SECTION_SUBTITLE_OS_VERSION");
LABEL_6:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E82FDC98, 0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)shouldAddDescriptorFromExtension:(id)a3 descriptorIdentifierInAsset:(id)a4 withSemanticType:(int64_t)a5 assetParametersToFilterOut:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  char v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  switch(a5)
  {
    case 12:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            if (-[ATXFaceGalleryLayoutGenerator isDescriptor:availableInAssetParameter:](self, "isDescriptor:availableInAssetParameter:", v10, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24))
            {

              goto LABEL_19;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v18)
            continue;
          break;
        }
      }

      break;
    case 11:
      objc_msgSend(v10, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v22, "hasPrefix:", v11);

      goto LABEL_20;
    case 6:
      objc_msgSend(v10, "extensionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.weather.poster"));

      if (v15)
      {
        if ((objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledForBundle:", CFSTR("com.apple.weather")) & 1) == 0)
        {
LABEL_19:
          v21 = 0;
          goto LABEL_20;
        }
      }
      break;
  }
  v21 = 1;
LABEL_20:

  return v21;
}

- (id)descriptorsToRemoveFromSectionWithSemanticType:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (a3 == 12)
  {
    -[ATXFaceSuggestionParameters descriptorsToRemoveFromCollections](self->_parameters, "descriptorsToRemoveFromCollections");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    if (v4)
      v7 = (void *)v4;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    v8 = v7;

    -[ATXFaceSuggestionParameters osVersionSectionDescriptors](self->_parameters, "osVersionSectionDescriptors");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "unionSet:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (BOOL)isDescriptorFromGalleryItem:(id)a3 availableInAssetParameter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v9))
  {
    objc_msgSend(v5, "descriptorIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "hasPrefix:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isDescriptor:(id)a3 availableInAssetParameter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v9))
  {
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "hasPrefix:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldRemoveDescriptorFromFeatured:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXFaceSuggestionParameters descriptorsToRemoveFromCollections](self->_parameters, "descriptorsToRemoveFromCollections");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if (-[ATXFaceGalleryLayoutGenerator isDescriptor:availableInAssetParameter:](self, "isDescriptor:availableInAssetParameter:", v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16))
        {
          v14 = 1;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (NSArray)candidateFeaturedDescriptors
{
  return self->_candidateFeaturedDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateFeaturedDescriptors, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_complicationParameters, 0);
  objc_storeStrong((id *)&self->_nonHeroDescriptorsByExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_allNonHeroDescriptors, 0);
  objc_storeStrong((id *)&self->_allHeroDescriptors, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_complicationProvider, 0);
}

- (void)generatedConfigurationWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: no section order provided in asset parameters, or asset parameters missing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(void *)a1 aggregatedAppLaunchData:(NSObject *)a2 bundleIdToCompanionBundleId:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, a2, v4, "%s: missing descriptors from hero section order: %@", (uint8_t *)v5);

}

- (void)_generatedHeroSectionWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: no hero section order provided in asset parameters, or asset parameters missing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_generatedFeaturedSectionWithWidgetDescriptorsAdditionalData:aggregatedAppLaunchData:bundleIdToCompanionBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_5(&dword_1C9A3B000, v0, v1, "%s: not enough day zero descriptors were provided: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_generateSectionWithWidgetDescriptorsAdditionalData:(uint64_t)a3 aggregatedAppLaunchData:(uint64_t)a4 bundleIdToCompanionBundleId:(uint64_t)a5 assetDescriptors:(uint64_t)a6 semanticType:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, a1, a3, "%s: No descriptors provided in asset parameters, or asset parameters missing!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

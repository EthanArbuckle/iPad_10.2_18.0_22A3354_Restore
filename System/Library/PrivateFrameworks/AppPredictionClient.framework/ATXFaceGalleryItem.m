@implementation ATXFaceGalleryItem

- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12
{
  return -[ATXFaceGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0);
}

- (ATXFaceGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 localizedDisplayName:(id)a6 modeSemanticType:(id)a7 titleFontName:(id)a8 titleColor:(id)a9 subtitleComplication:(id)a10 layoutType:(int64_t)a11 complications:(id)a12 landscapeComplications:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  ATXFaceGalleryItem *v28;
  uint64_t v29;
  NSString *identifier;
  uint64_t v31;
  NSString *descriptorIdentifier;
  uint64_t v33;
  NSString *extensionBundleIdentifier;
  uint64_t v35;
  NSString *localizedDisplayName;
  uint64_t v37;
  NSString *titleFontName;
  uint64_t v39;
  BSColor *titleColor;
  uint64_t v41;
  ATXComplication *subtitleComplication;
  uint64_t v43;
  NSArray *complications;
  uint64_t v45;
  NSArray *landscapeComplications;
  id obj;
  id v50;
  id v51;
  objc_super v52;

  v18 = a3;
  v19 = a4;
  v51 = a5;
  v20 = a6;
  obj = a7;
  v21 = a7;
  v22 = v20;
  v50 = v21;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  v27 = a13;
  v52.receiver = self;
  v52.super_class = (Class)ATXFaceGalleryItem;
  v28 = -[ATXFaceGalleryItem init](&v52, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v18, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    descriptorIdentifier = v28->_descriptorIdentifier;
    v28->_descriptorIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v51, "copy");
    extensionBundleIdentifier = v28->_extensionBundleIdentifier;
    v28->_extensionBundleIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    localizedDisplayName = v28->_localizedDisplayName;
    v28->_localizedDisplayName = (NSString *)v35;

    objc_storeStrong((id *)&v28->_modeSemanticType, obj);
    v37 = objc_msgSend(v23, "copy");
    titleFontName = v28->_titleFontName;
    v28->_titleFontName = (NSString *)v37;

    v39 = objc_msgSend(v24, "copy");
    titleColor = v28->_titleColor;
    v28->_titleColor = (BSColor *)v39;

    v41 = objc_msgSend(v25, "copy");
    subtitleComplication = v28->_subtitleComplication;
    v28->_subtitleComplication = (ATXComplication *)v41;

    v28->_layoutType = a11;
    v43 = objc_msgSend(v26, "copy");
    complications = v28->_complications;
    v28->_complications = (NSArray *)v43;

    v45 = objc_msgSend(v27, "copy");
    landscapeComplications = v28->_landscapeComplications;
    v28->_landscapeComplications = (NSArray *)v45;

  }
  return v28;
}

+ (id)itemFromJSONDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  __CFString *v18;
  NSObject *v19;
  ATXFaceGalleryItem *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  ATXFaceGalleryItem *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v46;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("descriptorIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("descriptorIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extensionBundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extensionBundleIdentifier"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDisplayName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDisplayName"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = &stru_1E4D5DB30;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleComplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleComplication"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("complications"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();

    v27 = MEMORY[0x1E0C9AA60];
    v28 = (void *)MEMORY[0x1E0C9AA60];
    if ((v26 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("complications"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("landscapeComplications"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("landscapeComplications"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_pas_mappedArrayWithTransform:", &__block_literal_global_54);
      v33 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v33;
    }
    v34 = [ATXFaceGalleryItem alloc];
    v35 = (void *)objc_opt_new();
    v20 = -[ATXFaceGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:](v34, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v5, v10, v46, v18, 0, &stru_1E4D5DB30, v35, v24, 0, v28, v27);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blankTemplate"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = objc_opt_isKindOfClass();

    if ((v37 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blankTemplate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXFaceGalleryItem setBlankTemplate:](v20, "setBlankTemplate:", objc_msgSend(v38, "BOOLValue"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldShowAsShuffleStack"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();

    if ((v40 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldShowAsShuffleStack"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXFaceGalleryItem setShouldShowAsShuffleStack:](v20, "setShouldShowAsShuffleStack:", objc_msgSend(v41, "BOOLValue"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXFaceGalleryItem setSource:](v20, "setSource:", objc_msgSend(v44, "integerValue"));

    }
  }
  else
  {
    __atxlog_handle_lock_screen();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ATXFaceGalleryItem itemFromJSONDictionary:].cold.1(v19);

    v20 = 0;
  }

  return v20;
}

id __45__ATXFaceGalleryItem_itemFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __45__ATXFaceGalleryItem_itemFromJSONDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGalleryItem identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem descriptorIdentifier](self, "descriptorIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem localizedDisplayName](self, "localizedDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem titleFontName](self, "titleFontName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem titleColor](self, "titleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem subtitleComplication](self, "subtitleComplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ATXFaceGalleryItem layoutType](self, "layoutType");
  -[ATXFaceGalleryItem complications](self, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem landscapeComplications](self, "landscapeComplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem modeSemanticType](self, "modeSemanticType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("YES");
  if (-[ATXFaceGalleryItem isBlankTemplate](self, "isBlankTemplate"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!-[ATXFaceGalleryItem shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"))
    v9 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXFaceGalleryItem source](self, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("identifier: %@, descriptorIdentifier: %@, extensionBundleIdentifier: %@, displayNameLocalizationKey: %@, localizedDisplayName: %@, titleFontName: %@, titleColor: %@, subtitleComplication: %@, layoutType: %d, complications: %@, landscapeComplications: %@, modeSemanticType: %@, score: %@, blankTemplate: %@, shouldShowAsShuffleStack: %@, source: %@"), v19, v18, v17, v16, v3, v15, v4, v14, v13, v5, v6, v7, v8, v10, v9, v11);

  return (NSString *)v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGalleryItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  ATXFaceGalleryItem *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptorIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocalizationKey"));
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spokenNameLocalizationKey"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptiveTextLocalizationKey"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleFontName"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleColor"));
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeSemanticType"));
            v59 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeUUID"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleComplication"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutType"));
            v10 = (void *)MEMORY[0x1E0C99E60];
            v68[0] = objc_opt_class();
            v68[1] = objc_opt_class();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
            v60 = v8;
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setWithArray:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("complications"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = (void *)MEMORY[0x1E0C99E60];
            v67[0] = objc_opt_class();
            v67[1] = objc_opt_class();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setWithArray:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("landscapeComplications"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v60;
            self = -[ATXFaceGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v5, v6, v7, v64, v59, v62, v9, v57, v55, v58, v56);
            -[ATXFaceGalleryItem setDisplayNameLocalizationKey:](self, "setDisplayNameLocalizationKey:", v60);
            -[ATXFaceGalleryItem setSpokenNameLocalizationKey:](self, "setSpokenNameLocalizationKey:", v66);
            -[ATXFaceGalleryItem setDescriptiveTextLocalizationKey:](self, "setDescriptiveTextLocalizationKey:", v65);
            -[ATXFaceGalleryItem setLocalizedSubtitle:](self, "setLocalizedSubtitle:", v63);
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXFaceGalleryItem setScore:](self, "setScore:", v16);

            v17 = v59;
            -[ATXFaceGalleryItem setModeUUID:](self, "setModeUUID:", v61);
            -[ATXFaceGalleryItem setBlankTemplate:](self, "setBlankTemplate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blankTemplate")));
            -[ATXFaceGalleryItem setShouldShowAsShuffleStack:](self, "setShouldShowAsShuffleStack:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowAsShuffleStack")));
            -[ATXFaceGalleryItem setSource:](self, "setSource:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source")));

            v18 = self;
          }
          else
          {
            __atxlog_handle_lock_screen();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[ATXFaceGalleryItem initWithCoder:].cold.5(v17, v47, v48, v49, v50, v51, v52, v53);
            v18 = 0;
          }

        }
        else
        {
          __atxlog_handle_lock_screen();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[ATXFaceGalleryItem initWithCoder:].cold.4(v9, v40, v41, v42, v43, v44, v45, v46);
          v18 = 0;
        }

      }
      else
      {
        __atxlog_handle_lock_screen();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[ATXFaceGalleryItem initWithCoder:].cold.3(v8, v33, v34, v35, v36, v37, v38, v39);
        v18 = 0;
      }

    }
    else
    {
      __atxlog_handle_lock_screen();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXFaceGalleryItem initWithCoder:].cold.2(v7, v26, v27, v28, v29, v30, v31, v32);
      v18 = 0;
    }

  }
  else
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXFaceGalleryItem initWithCoder:].cold.1(v6, v19, v20, v21, v22, v23, v24, v25);
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v20;

  v20 = a3;
  -[ATXFaceGalleryItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[ATXFaceGalleryItem descriptorIdentifier](self, "descriptorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("descriptorIdentifier"));

  -[ATXFaceGalleryItem extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("extensionBundleIdentifier"));

  -[ATXFaceGalleryItem localizedDisplayName](self, "localizedDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("localizedDisplayName"));

  -[ATXFaceGalleryItem displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("displayNameLocalizationKey"));

  -[ATXFaceGalleryItem spokenNameLocalizationKey](self, "spokenNameLocalizationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("spokenNameLocalizationKey"));

  -[ATXFaceGalleryItem descriptiveTextLocalizationKey](self, "descriptiveTextLocalizationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("descriptiveTextLocalizationKey"));

  -[ATXFaceGalleryItem localizedSubtitle](self, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("localizedSubtitle"));

  -[ATXFaceGalleryItem titleFontName](self, "titleFontName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("titleFontName"));

  -[ATXFaceGalleryItem titleColor](self, "titleColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("titleColor"));

  -[ATXFaceGalleryItem subtitleComplication](self, "subtitleComplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("subtitleComplication"));

  objc_msgSend(v20, "encodeInteger:forKey:", -[ATXFaceGalleryItem layoutType](self, "layoutType"), CFSTR("layoutType"));
  -[ATXFaceGalleryItem complications](self, "complications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("complications"));

  -[ATXFaceGalleryItem landscapeComplications](self, "landscapeComplications");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("landscapeComplications"));

  -[ATXFaceGalleryItem modeSemanticType](self, "modeSemanticType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("modeSemanticType"));

  -[ATXFaceGalleryItem score](self, "score");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v18, CFSTR("score"));

  -[ATXFaceGalleryItem modeUUID](self, "modeUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("modeUUID"));

  objc_msgSend(v20, "encodeBool:forKey:", -[ATXFaceGalleryItem isBlankTemplate](self, "isBlankTemplate"), CFSTR("blankTemplate"));
  objc_msgSend(v20, "encodeBool:forKey:", -[ATXFaceGalleryItem shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"), CFSTR("shouldShowAsShuffleStack"));
  objc_msgSend(v20, "encodeInteger:forKey:", -[ATXFaceGalleryItem source](self, "source"), CFSTR("source"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v23 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXFaceGalleryItem identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem descriptorIdentifier](self, "descriptorIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem localizedDisplayName](self, "localizedDisplayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem modeSemanticType](self, "modeSemanticType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem titleFontName](self, "titleFontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem titleColor](self, "titleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem subtitleComplication](self, "subtitleComplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXFaceGalleryItem layoutType](self, "layoutType");
  -[ATXFaceGalleryItem complications](self, "complications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGalleryItem landscapeComplications](self, "landscapeComplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v23, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v21, v19, v22, v20, v4, v5, v6, v7, v8, v9, v10);

  -[ATXFaceGalleryItem displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayNameLocalizationKey:", v12);

  -[ATXFaceGalleryItem spokenNameLocalizationKey](self, "spokenNameLocalizationKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpokenNameLocalizationKey:", v13);

  -[ATXFaceGalleryItem descriptiveTextLocalizationKey](self, "descriptiveTextLocalizationKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDescriptiveTextLocalizationKey:", v14);

  -[ATXFaceGalleryItem localizedSubtitle](self, "localizedSubtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalizedSubtitle:", v15);

  -[ATXFaceGalleryItem score](self, "score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScore:", v16);

  -[ATXFaceGalleryItem modeUUID](self, "modeUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModeUUID:", v17);

  objc_msgSend(v11, "setBlankTemplate:", -[ATXFaceGalleryItem isBlankTemplate](self, "isBlankTemplate"));
  objc_msgSend(v11, "setShouldShowAsShuffleStack:", -[ATXFaceGalleryItem shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"));
  objc_msgSend(v11, "setSource:", -[ATXFaceGalleryItem source](self, "source"));
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXFaceGalleryItem *v4;
  ATXFaceGalleryItem *v5;
  BOOL v6;

  v4 = (ATXFaceGalleryItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXFaceGalleryItem isEqualToATXFaceGalleryItem:](self, "isEqualToATXFaceGalleryItem:", v5);

  return v6;
}

- (BOOL)isEqualToATXFaceGalleryItem:(id)a3
{
  NSString *v4;
  NSString *v5;
  char v6;

  v4 = self->_identifier;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 2))
    v6 = 1;
  else
    v6 = -[NSString isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  void *v2;

  -[ATXFaceGalleryItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (unint64_t)v2;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (NSDictionary)jsonDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[9];
  _QWORD v27[11];

  v27[9] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("identifier");
  -[ATXFaceGalleryItem identifier](self, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v26[1] = CFSTR("descriptorIdentifier");
  -[ATXFaceGalleryItem descriptorIdentifier](self, "descriptorIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v24;
  v26[2] = CFSTR("extensionBundleIdentifier");
  -[ATXFaceGalleryItem extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v23;
  v26[3] = CFSTR("localizedDisplayName");
  -[ATXFaceGalleryItem localizedDisplayName](self, "localizedDisplayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v27[3] = v3;
  v26[4] = CFSTR("displayNameLocalizationKey");
  -[ATXFaceGalleryItem displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v5;
  v27[4] = v5;
  v26[5] = CFSTR("subtitleComplication");
  -[ATXFaceGalleryItem subtitleComplication](self, "subtitleComplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v4;
  v27[5] = v7;
  v26[6] = CFSTR("complications");
  -[ATXFaceGalleryItem complications](self, "complications", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_67_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[6] = v11;
  v26[7] = CFSTR("landscapeComplications");
  -[ATXFaceGalleryItem landscapeComplications](self, "landscapeComplications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_68);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[7] = v14;
  v26[8] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXFaceGalleryItem source](self, "source"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v10)

  if (!v8)
  if (!v6)

  if (!v22)
  return (NSDictionary *)v16;
}

uint64_t __36__ATXFaceGalleryItem_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __36__ATXFaceGalleryItem_jsonDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXFaceGalleryItem jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXFaceGalleryItem)initWithProtoData:(id)a3
{
  id v4;
  ATXPBFaceGalleryItem *v5;
  ATXFaceGalleryItem *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBFaceGalleryItem initWithData:]([ATXPBFaceGalleryItem alloc], "initWithData:", v4);

    self = -[ATXFaceGalleryItem initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXFaceGalleryItem proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXFaceGalleryItem)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXFaceGalleryItem *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_lock_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22F90], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXFaceGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v6, v7, v8, &stru_1E4D5DB30, 0, &stru_1E4D5DB30, v9, 0, 0, 0, 0);

  v10 = self;
LABEL_8:

  return v10;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[ATXFaceGalleryItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  -[ATXFaceGalleryItem descriptorIdentifier](self, "descriptorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDescriptorIdentifier:", v5);

  -[ATXFaceGalleryItem extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExtensionBundleIdentifier:", v6);

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (void)setDescriptorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (void)setSpokenNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (void)setDescriptiveTextLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (void)setTitleFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BSColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ATXComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (void)setSubtitleComplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (NSNumber)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_modeSemanticType, a3);
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (void)setLandscapeComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isBlankTemplate
{
  return self->_blankTemplate;
}

- (void)setBlankTemplate:(BOOL)a3
{
  self->_blankTemplate = a3;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (void)setShouldShowAsShuffleStack:(BOOL)a3
{
  self->_shouldShowAsShuffleStack = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (BOOL)isPreferredForGallery
{
  return self->_isPreferredForGallery;
}

- (void)setIsPreferredForGallery:(BOOL)a3
{
  self->_isPreferredForGallery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)itemFromJSONDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "+[ATXFaceGalleryItem itemFromJSONDictionary:]";
  v3 = 2112;
  v4 = CFSTR("extensionBundleIdentifier");
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: missing key: %@", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Unable to decode identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Unable to decode descriptorIdentifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Unable to decode extensionBundleIdentifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Unable to decode titleFontName", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Unable to decode titleColor", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

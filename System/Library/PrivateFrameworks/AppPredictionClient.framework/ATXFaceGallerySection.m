@implementation ATXFaceGallerySection

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6
{
  return -[ATXFaceGallerySection initWithLocalizedTitle:unityDescription:type:items:semanticType:](self, "initWithLocalizedTitle:unityDescription:type:items:semanticType:", a3, a4, a5, a6, 0);
}

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 unityDescription:(id)a4 type:(int64_t)a5 items:(id)a6 semanticType:(int64_t)a7
{
  return -[ATXFaceGallerySection initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:](self, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", a3, 0, 0, 0, 0, a4, a5, a6, a7);
}

- (ATXFaceGallerySection)initWithLocalizedTitle:(id)a3 symbolImageName:(id)a4 symbolColorName:(id)a5 localizedSubtitle:(id)a6 localizedDescriptiveText:(id)a7 unityDescription:(id)a8 type:(int64_t)a9 items:(id)a10 semanticType:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ATXFaceGallerySection *v24;
  uint64_t v25;
  NSString *localizedTitle;
  uint64_t v27;
  NSString *localizedSubtitle;
  uint64_t v29;
  NSString *symbolImageName;
  uint64_t v31;
  NSString *symbolColorName;
  uint64_t v33;
  NSString *localizedDescriptiveText;
  uint64_t v35;
  NSString *unityDescription;
  uint64_t v37;
  NSArray *items;
  objc_super v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)ATXFaceGallerySection;
  v24 = -[ATXFaceGallerySection init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    localizedTitle = v24->_localizedTitle;
    v24->_localizedTitle = (NSString *)v25;

    v27 = objc_msgSend(v20, "copy");
    localizedSubtitle = v24->_localizedSubtitle;
    v24->_localizedSubtitle = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    symbolImageName = v24->_symbolImageName;
    v24->_symbolImageName = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    symbolColorName = v24->_symbolColorName;
    v24->_symbolColorName = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    localizedDescriptiveText = v24->_localizedDescriptiveText;
    v24->_localizedDescriptiveText = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    unityDescription = v24->_unityDescription;
    v24->_unityDescription = (NSString *)v35;

    v24->_type = a9;
    v37 = objc_msgSend(v23, "copy");
    items = v24->_items;
    v24->_items = (NSArray *)v37;

    v24->_semanticType = a11;
  }

  return v24;
}

+ (id)sectionFromJSONDictionary:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  __CFString *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  uint64_t v34;
  ATXFaceGallerySection *v35;
  void *v37;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedSubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedSubtitle"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("symbolImageName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("symbolImageName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("symbolColorName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("symbolColorName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDescriptiveText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v17 = objc_opt_isKindOfClass();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedDescriptiveText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unityDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unityDescription"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_1E4D5DB30;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v23 = objc_opt_isKindOfClass();

  v37 = (void *)v9;
  if ((v23 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Full")) & 1) != 0)
    {
      v25 = (void *)v6;
      v26 = 0;
    }
    else
    {
      v25 = (void *)v6;
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Scrollable")) & 1) != 0)
      {
        v26 = 1;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Unity")) & 1) != 0)
      {
        v26 = 2;
      }
      else if (objc_msgSend(v24, "isEqualToString:", CFSTR("ScrollableSquares")))
      {
        v26 = 3;
      }
      else
      {
        v26 = 0;
      }
    }

  }
  else
  {
    v25 = (void *)v6;
    v26 = 1;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("items"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = objc_opt_isKindOfClass();

  if ((v28 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("items"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_pas_mappedArrayWithTransform:", &__block_literal_global_67);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("semanticType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = objc_opt_isKindOfClass();

  if ((v32 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("semanticType"));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    {
      v34 = 0;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("FeaturedFaces")) & 1) != 0)
    {
      v34 = 1;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("FeaturedPhotos")) & 1) != 0)
    {
      v34 = 2;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Focus")) & 1) != 0)
    {
      v34 = 3;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Hero")) & 1) != 0)
    {
      v34 = 4;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PhotoShuffle")) & 1) != 0)
    {
      v34 = 5;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("WeatherAndAstronomy")) & 1) != 0)
    {
      v34 = 6;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Kaleidoscope")) & 1) != 0)
    {
      v34 = 7;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Emoji")) & 1) != 0)
    {
      v34 = 8;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Unity")) & 1) != 0)
    {
      v34 = 9;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Pride")) & 1) != 0)
    {
      v34 = 10;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("OSVersion")) & 1) != 0)
    {
      v34 = 11;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Collections")) & 1) != 0)
    {
      v34 = 12;
    }
    else if (objc_msgSend(v33, "isEqualToString:", CFSTR("Color")))
    {
      v34 = 13;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }
  v35 = -[ATXFaceGallerySection initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:]([ATXFaceGallerySection alloc], "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v25, v12, v15, v37, v18, v21, v26, v30, v34);

  return v35;
}

id __51__ATXFaceGallerySection_sectionFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ATXFaceGalleryItem itemFromJSONDictionary:](ATXFaceGalleryItem, "itemFromJSONDictionary:", v2);
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
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("    localizedTitle: %@"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection symbolImageName](self, "symbolImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("    symbolImageName: %@"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection symbolColorName](self, "symbolColorName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("    symbolColorName: %@"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection localizedSubtitle](self, "localizedSubtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("    localizedSubtitle: %@"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection localizedDescriptiveText](self, "localizedDescriptiveText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("    localizedDescriptiveText: %@"), v17);
  objc_msgSend(v3, "addObject:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXFaceGallerySection unityDescription](self, "unityDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("    unityDescription: %@"), v20);
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("    type: %zd"), -[ATXFaceGallerySection type](self, "type"));
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(v3, "addObject:", CFSTR("    items:"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[ATXFaceGallerySection items](self, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("        %@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v27));
        objc_msgSend(v3, "addObject:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v25);
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("semanticType: %zd"), -[ATXFaceGallerySection semanticType](self, "semanticType"));
  objc_msgSend(v3, "addObject:", v29);

  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("ATXFaceGallerySection:\n%@"), v31);

  return (NSString *)v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGallerySection)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ATXFaceGallerySection *v18;
  ATXFaceGallerySection *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescriptiveText"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolImageName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolColorName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unityDescription"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("items"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v22 = v9;
    v14 = (void *)v5;
    v15 = (void *)v4;
    v16 = (void *)v23;
    v17 = (void *)v8;
    v18 = -[ATXFaceGallerySection initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:](self, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v23, v6, v7, v15, v14, v8, v22, v13, objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("semanticType")));
    v19 = v18;
  }
  else
  {
    v17 = (void *)v8;
    v14 = (void *)v5;
    v15 = (void *)v4;
    v16 = (void *)v23;
    v18 = self;
    __atxlog_handle_lock_screen();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXFaceGallerySection initWithCoder:].cold.1(v20);

    v19 = 0;
  }

  return v19;
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
  id v11;

  v11 = a3;
  -[ATXFaceGallerySection localizedTitle](self, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("localizedTitle"));

  -[ATXFaceGallerySection localizedSubtitle](self, "localizedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("localizedSubtitle"));

  -[ATXFaceGallerySection symbolImageName](self, "symbolImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("symbolImageName"));

  -[ATXFaceGallerySection symbolColorName](self, "symbolColorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("symbolColorName"));

  -[ATXFaceGallerySection localizedDescriptiveText](self, "localizedDescriptiveText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("localizedDescriptiveText"));

  -[ATXFaceGallerySection unityDescription](self, "unityDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("unityDescription"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[ATXFaceGallerySection type](self, "type"), CFSTR("type"));
  -[ATXFaceGallerySection items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("items"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[ATXFaceGallerySection semanticType](self, "semanticType"), CFSTR("semanticType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXFaceGallerySection localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGallerySection symbolImageName](self, "symbolImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGallerySection symbolColorName](self, "symbolColorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGallerySection localizedSubtitle](self, "localizedSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGallerySection localizedDescriptiveText](self, "localizedDescriptiveText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFaceGallerySection unityDescription](self, "unityDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXFaceGallerySection type](self, "type");
  -[ATXFaceGallerySection items](self, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", v5, v6, v7, v8, v9, v10, v11, v12, -[ATXFaceGallerySection semanticType](self, "semanticType"));

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ATXFaceGallerySection *v4;
  id *v5;
  NSString *localizedTitle;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;
  NSString *unityDescription;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  int64_t type;
  NSArray *items;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  char v22;
  int64_t semanticType;

  v4 = (ATXFaceGallerySection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      localizedTitle = self->_localizedTitle;
      v7 = (NSString *)v5[1];
      if (localizedTitle == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = localizedTitle;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_16;
      }
      unityDescription = self->_unityDescription;
      v13 = (NSString *)v5[6];
      if (unityDescription == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = unityDescription;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_16;
      }
      type = self->_type;
      if (type == objc_msgSend(v5, "type"))
      {
        items = self->_items;
        v19 = (NSArray *)v5[8];
        if (items == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = items;
          v22 = -[NSArray isEqual:](v21, "isEqual:", v20);

          if ((v22 & 1) == 0)
            goto LABEL_16;
        }
        semanticType = self->_semanticType;
        v11 = semanticType == objc_msgSend(v5, "semanticType");
        goto LABEL_17;
      }
LABEL_16:
      v11 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  int64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_localizedTitle, "hash");
  v4 = -[NSString hash](self->_unityDescription, "hash");
  v5 = self->_type - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = -[NSArray hash](self->_items, "hash");
  return self->_semanticType - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
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
  int64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  int64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("type");
  v3 = -[ATXFaceGallerySection type](self, "type");
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4D5ADB8[(int)v3];
  }
  v20[0] = v4;
  v19[1] = CFSTR("items");
  -[ATXFaceGallerySection items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_59);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("semanticType");
  v7 = -[ATXFaceGallerySection semanticType](self, "semanticType");
  if (v7 >= 0xE)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E4D5ADD8[(int)v7];
  }
  v20[2] = v8;
  v19[3] = CFSTR("localizedTitle");
  -[ATXFaceGallerySection localizedTitle](self, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v9)
  -[ATXFaceGallerySection localizedSubtitle](self, "localizedSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("localizedSubtitle"));

  -[ATXFaceGallerySection localizedDescriptiveText](self, "localizedDescriptiveText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("localizedDescriptiveText"));

  -[ATXFaceGallerySection symbolImageName](self, "symbolImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("symbolImageName"));

  -[ATXFaceGallerySection symbolColorName](self, "symbolColorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("symbolColorName"));

  v17 = (void *)objc_msgSend(v12, "copy");
  return (NSDictionary *)v17;
}

uint64_t __39__ATXFaceGallerySection_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDictionary");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXFaceGallerySection jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXFaceGallerySection)initWithProtoData:(id)a3
{
  id v4;
  ATXPBFaceGallerySection *v5;
  ATXFaceGallerySection *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBFaceGallerySection initWithData:]([ATXPBFaceGallerySection alloc], "initWithData:", v4);

    self = -[ATXFaceGallerySection initWithProto:](self, "initWithProto:", v5);
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

  -[ATXFaceGallerySection proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXFaceGallerySection)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  ATXFaceGallerySection *v13;
  ATXFaceGallerySection *v14;
  NSObject *v15;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_lock_screen();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v15);

    goto LABEL_9;
  }
  v5 = v4;
  v6 = (int)objc_msgSend(v5, "type");
  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_64);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = objc_msgSend(v5, "semanticType");
  v13 = -[ATXFaceGallerySection initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:](self, "initWithLocalizedTitle:symbolImageName:symbolColorName:localizedSubtitle:localizedDescriptiveText:unityDescription:type:items:semanticType:", &stru_1E4D5DB30, 0, 0, 0, 0, 0, v6, v11, v12);

  self = v13;
  v14 = self;
LABEL_10:

  return v14;
}

ATXFaceGalleryItem *__39__ATXFaceGallerySection_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXFaceGalleryItem *v3;

  v2 = a2;
  v3 = -[ATXFaceGalleryItem initWithProto:]([ATXFaceGalleryItem alloc], "initWithProto:", v2);

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setType:", -[ATXFaceGallerySection type](self, "type"));
  -[ATXFaceGallerySection items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_66_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v3, "setItems:", v6);

  objc_msgSend(v3, "setSemanticType:", -[ATXFaceGallerySection semanticType](self, "semanticType"));
  return v3;
}

uint64_t __30__ATXFaceGallerySection_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)symbolColorName
{
  return self->_symbolColorName;
}

- (void)setSymbolColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedDescriptiveText
{
  return self->_localizedDescriptiveText;
}

- (void)setLocalizedDescriptiveText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)unityDescription
{
  return self->_unityDescription;
}

- (void)setUnityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_unityDescription, 0);
  objc_storeStrong((id *)&self->_localizedDescriptiveText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_symbolColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Unable to decode items", v1, 2u);
}

@end

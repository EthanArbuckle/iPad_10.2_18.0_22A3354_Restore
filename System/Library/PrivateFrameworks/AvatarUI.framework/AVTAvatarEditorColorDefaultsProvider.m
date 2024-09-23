@implementation AVTAvatarEditorColorDefaultsProvider

+ (id)keyForCategory:(int64_t)a3 colorIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  AVTPresetCategoryToColorCategoryString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%ld"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)categoryForKey:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = AVTPresetCategoryFromString();
  return v5;
}

+ (int64_t)colorIndexForKey:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (AVTAvatarEditorColorDefaultsProvider)initWithColorDefaultsDictionary:(id)a3 editingColors:(id)a4
{
  id v6;
  id v7;
  AVTAvatarEditorColorDefaultsProvider *v8;
  AVTAvatarEditorColorDefaultsProvider *v9;
  uint64_t v10;
  NSDictionary *categoryMapping;
  uint64_t v12;
  NSDictionary *definitions;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarEditorColorDefaultsProvider;
  v8 = -[AVTAvatarEditorColorDefaultsProvider init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_editingColors, a4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mapping"));
    v10 = objc_claimAutoreleasedReturnValue();
    categoryMapping = v9->_categoryMapping;
    v9->_categoryMapping = (NSDictionary *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("definitions"));
    v12 = objc_claimAutoreleasedReturnValue();
    definitions = v9->_definitions;
    v9->_definitions = (NSDictionary *)v12;

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTAvatarEditorColorDefaultsProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVTAvatarEditorColorDefaultsProvider *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = [AVTAvatarEditorColorDefaultsProvider alloc];
  v11[0] = CFSTR("mapping");
  -[AVTAvatarEditorColorDefaultsProvider categoryMapping](self, "categoryMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("definitions");
  v12[0] = v5;
  -[AVTAvatarEditorColorDefaultsProvider definitions](self, "definitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorColorDefaultsProvider editingColors](self, "editingColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTAvatarEditorColorDefaultsProvider initWithColorDefaultsDictionary:editingColors:](v4, "initWithColorDefaultsDictionary:editingColors:", v7, v8);

  return v9;
}

- (id)defaultColorForCategory:(int64_t)a3 destination:(int64_t)a4 withConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "keyForCategory:colorIndex:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorColorDefaultsProvider categoryMapping](self, "categoryMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend((id)objc_opt_class(), "categoryForKey:", v11);
  v13 = objc_msgSend((id)objc_opt_class(), "colorIndexForKey:", v11);
  -[AVTAvatarEditorColorDefaultsProvider definitions](self, "definitions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = AVTColorSettingKind(v12, v13);
  objc_msgSend(v8, "colorPresetForSettingKind:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "colorPreset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorColorDefaultsProvider editingColors](self, "editingColors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = AVTColorSettingKind(a3, a4);
  objc_msgSend(v22, "colorForSettingKind:identifier:", v23, v24, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)defaultColorPresetForCategory:(int64_t)a3 destination:(int64_t)a4 withConfiguration:(id)a5
{
  void *v5;
  void *v6;

  -[AVTAvatarEditorColorDefaultsProvider defaultColorForCategory:destination:withConfiguration:](self, "defaultColorForCategory:destination:withConfiguration:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseColorPreset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AVTEditingModelColors)editingColors
{
  return self->_editingColors;
}

- (void)setEditingColors:(id)a3
{
  objc_storeStrong((id *)&self->_editingColors, a3);
}

- (NSDictionary)categoryMapping
{
  return self->_categoryMapping;
}

- (void)setCategoryMapping:(id)a3
{
  objc_storeStrong((id *)&self->_categoryMapping, a3);
}

- (NSDictionary)definitions
{
  return self->_definitions;
}

- (void)setDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_definitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_categoryMapping, 0);
  objc_storeStrong((id *)&self->_editingColors, 0);
}

@end

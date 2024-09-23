@implementation AVTAvatarAttributeEditorCategory

- (AVTAvatarAttributeEditorCategory)initWithSectionProviders:(id)a3 localizedName:(id)a4 previewMode:(id)a5 modelGroup:(id)a6 symbolNames:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AVTAvatarAttributeEditorCategory *v17;
  uint64_t v18;
  NSArray *sectionProviders;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *sections;
  uint64_t v29;
  NSString *localizedName;
  id v32;
  id v33;
  id v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)AVTAvatarAttributeEditorCategory;
  v17 = -[AVTAvatarAttributeEditorCategory init](&v41, sel_init);
  if (v17)
  {
    v32 = v16;
    v33 = v15;
    v34 = v14;
    obj = a7;
    v36 = v13;
    v18 = objc_msgSend(v12, "copy");
    sectionProviders = v17->_sectionProviders;
    v17->_sectionProviders = (NSArray *)v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v25), "sections");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObjectsFromArray:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v23);
    }

    v27 = objc_msgSend(v20, "copy");
    sections = v17->_sections;
    v17->_sections = (NSArray *)v27;

    v13 = v36;
    v29 = objc_msgSend(v36, "copy");
    localizedName = v17->_localizedName;
    v17->_localizedName = (NSString *)v29;

    objc_storeStrong((id *)&v17->_previewMode, a5);
    objc_storeStrong((id *)&v17->_modelGroup, a6);
    objc_storeStrong((id *)&v17->_symbolNames, obj);

    v15 = v33;
    v14 = v34;
    v16 = v32;
  }

  return v17;
}

- (id)symbolNameProvider
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[AVTAvatarAttributeEditorCategory symbolNames](self, "symbolNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AVTAvatarAttributeEditorCategory_symbolNameProvider__block_invoke;
  v6[3] = &unk_1EA51CE10;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

id __54__AVTAvatarAttributeEditorCategory_symbolNameProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorCategory;
  -[AVTAvatarAttributeEditorCategory description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorCategory localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorCategory sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avt_description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorCategory symbolNames](self, "symbolNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@, sections: %@, symbols: %@"), v5, v7, v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v10;
}

- (NSArray)sectionProviders
{
  return self->_sectionProviders;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (AVTAvatarAttributeEditorPreviewMode)previewMode
{
  return self->_previewMode;
}

- (NSDictionary)symbolNames
{
  return self->_symbolNames;
}

- (AVTCoreModelGroup)modelGroup
{
  return self->_modelGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelGroup, 0);
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_previewMode, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionProviders, 0);
}

- (id)representedAVTPresetResources
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  AVTPresetResources *v16;
  void *v17;
  AVTPresetResources *v18;
  void *v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[AVTAvatarAttributeEditorCategory modelGroup](self, "modelGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v22 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "presets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
              v16 = [AVTPresetResources alloc];
              objc_msgSend(v15, "preset");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[AVTPresetResources initWithPreset:](v16, "initWithPreset:", v17);

              objc_msgSend(v3, "addObject:", v18);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_msgSend(v3, "copy");
  return v19;
}

@end

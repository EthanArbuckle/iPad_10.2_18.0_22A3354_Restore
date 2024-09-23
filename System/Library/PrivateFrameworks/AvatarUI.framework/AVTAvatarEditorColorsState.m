@implementation AVTAvatarEditorColorsState

- (AVTAvatarEditorColorsState)initWithVariationStore:(id)a3
{
  id v5;
  AVTAvatarEditorColorsState *v6;
  AVTAvatarEditorColorsState *v7;
  uint64_t v8;
  NSMutableDictionary *colorStorage;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarEditorColorsState;
  v6 = -[AVTAvatarEditorColorsState init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_variationStore, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    colorStorage = v7->_colorStorage;
    v7->_colorStorage = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)selectedColorForCategory:(int64_t)a3 destinationIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AVTAvatarEditorColorsState colorStorage](self, "colorStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)selectedColorPresetForCategory:(int64_t)a3 destinationIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[AVTAvatarEditorColorsState selectedColorForCategory:destinationIndex:](self, "selectedColorForCategory:destinationIndex:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseColorPreset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorColorsState variationStore](self, "variationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTAvatarEditorColorsState variationStore](self, "variationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorPresetFromColor:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }

  return v6;
}

- (void)setSelectedColorPreset:(id)a3 forCoreModelColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarEditorColorsState variationStore](self, "variationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveColorPreset:forColor:", v7, v6);

  objc_msgSend(v6, "baseColorPreset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorColorsState storageForCategory:](self, "storageForCategory:", objc_msgSend(v9, "category"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "settingKind"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v10);

}

- (id)storageForCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTAvatarEditorColorsState colorStorage](self, "colorStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarEditorColorsState colorStorage](self, "colorStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (NSMutableDictionary)colorStorage
{
  return self->_colorStorage;
}

- (void)setColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_colorStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorStorage, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
}

@end

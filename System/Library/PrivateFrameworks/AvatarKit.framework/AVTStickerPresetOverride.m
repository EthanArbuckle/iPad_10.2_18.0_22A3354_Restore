@implementation AVTStickerPresetOverride

+ (id)presetOverrideFromDictionary:(id)a3 forCategoryName:(id)a4
{
  id v5;
  id v6;
  AVTStickerPresetOverride *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AVTStickerPresetOverride *v11;

  v5 = a4;
  v6 = a3;
  v7 = [AVTStickerPresetOverride alloc];
  v8 = AVTPresetCategoryFromString(v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unless"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AVTStickerPresetOverride initWithCategory:presetIdentifier:unless:](v7, "initWithCategory:presetIdentifier:unless:", v8, v9, v10);
  return v11;
}

- (AVTStickerPresetOverride)initWithCategory:(int64_t)a3 presetIdentifier:(id)a4 unless:(id)a5
{
  id v9;
  id v10;
  AVTStickerPresetOverride *v11;
  AVTStickerPresetOverride *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTStickerPresetOverride;
  v11 = -[AVTStickerPresetOverride init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    objc_storeStrong((id *)&v11->_unlessIdentifiers, a5);
    objc_storeStrong((id *)&v12->_presetIdentifier, a4);
  }

  return v12;
}

- (void)applyToAvatar:(id)a3 reversionContext:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  AVTStickerPresetOverride *v15;
  int64_t v16;
  void *v17;
  void *v18;
  AVTStickerPresetOverride *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v20;
    v8 = -[AVTStickerPresetOverride category](self, "category");
    -[AVTStickerPresetOverride presetIdentifier](self, "presetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTPreset presetWithCategory:identifier:](AVTPreset, "presetWithCategory:identifier:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "presetForCategory:", -[AVTStickerPresetOverride category](self, "category"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerPresetOverride unlessIdentifiers](self, "unlessIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      if (v6)
      {
        v15 = [AVTStickerPresetOverride alloc];
        v16 = -[AVTStickerPresetOverride category](self, "category");
        objc_msgSend(v11, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTStickerPresetOverride unlessIdentifiers](self, "unlessIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[AVTStickerPresetOverride initWithCategory:presetIdentifier:unless:](v15, "initWithCategory:presetIdentifier:unless:", v16, v17, v18);

        objc_msgSend(v6, "savePresetOverride:", v19);
      }
      objc_msgSend(v7, "setPreset:forCategory:animated:", v10, -[AVTStickerPresetOverride category](self, "category"), 0);
    }

  }
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)presetIdentifier
{
  return self->_presetIdentifier;
}

- (NSArray)unlessIdentifiers
{
  return self->_unlessIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlessIdentifiers, 0);
  objc_storeStrong((id *)&self->_presetIdentifier, 0);
}

@end

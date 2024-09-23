@implementation AVTAvatarColorVariationStore

- (AVTAvatarColorVariationStore)init
{
  AVTAvatarColorVariationStore *v2;
  uint64_t v3;
  NSMutableDictionary *colorPresets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarColorVariationStore;
  v2 = -[AVTAvatarColorVariationStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    colorPresets = v2->_colorPresets;
    v2->_colorPresets = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)colorVariationFromColor:(id)a3
{
  id v4;
  void *v5;
  AVTCoreModelColorVariation *v6;

  v4 = a3;
  -[AVTAvatarColorVariationStore colorPresetFromColor:](self, "colorPresetFromColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", v4, v5);

  return v6;
}

- (id)colorPresetFromColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[AVTAvatarColorVariationStore keyForColor:](self, "keyForColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorVariationStore colorPresets](self, "colorPresets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "baseColorPreset");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)saveColorPreset:(id)a3 forColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarColorVariationStore colorPresets](self, "colorPresets");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarColorVariationStore keyForColor:](self, "keyForColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forKey:", v7, v8);
}

- (id)keyForColor:(id)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = objc_msgSend(v4, "settingKind");
  AVTAvatarSettingKindIdentifier(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)resetValues
{
  id v2;

  -[AVTAvatarColorVariationStore colorPresets](self, "colorPresets");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableDictionary)colorPresets
{
  return self->_colorPresets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPresets, 0);
}

@end

@implementation AVTPresetResources

- (AVTPresetResources)initWithPreset:(id)a3
{
  id v5;
  AVTPresetResources *v6;
  AVTPresetResources *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTPresetResources;
  v6 = -[AVTPresetResources init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preset, a3);

  return v7;
}

- (NSString)presetIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[AVTPresetResources preset](self, "preset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (id)resources
{
  void *v2;
  void *v3;

  -[AVTPresetResources preset](self, "preset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "cache");

  return v3;
}

- (id)volatileIdentifierForScope:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AVTPresetResources preset](self, "preset", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "category");
  -[AVTPresetResources preset](self, "preset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld_%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)costForScope:(id)a3
{
  return 1;
}

- (BOOL)requiresEncryption
{
  return 1;
}

- (AVTPreset)preset
{
  return self->_preset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preset, 0);
}

@end

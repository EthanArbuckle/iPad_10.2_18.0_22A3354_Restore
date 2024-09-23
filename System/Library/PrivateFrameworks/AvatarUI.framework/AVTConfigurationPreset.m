@implementation AVTConfigurationPreset

- (AVTConfigurationPreset)initWithPreset:(id)a3 settingKind:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v8;
  AVTConfigurationPreset *v9;
  AVTConfigurationPreset *v10;
  objc_super v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTConfigurationPreset;
  v9 = -[AVTConfigurationPreset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_preset, a3);
    v10->_settingKind.destination = var0;
    v10->_settingKind.category = var1;
  }

  return v10;
}

- (AVTConfigurationPreset)initWithDefaultPresetForSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  AVTConfigurationPreset *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)AVTConfigurationPreset;
  result = -[AVTConfigurationPreset init](&v6, sel_init);
  if (result)
  {
    result->_defaultPreset = 1;
    result->_settingKind.destination = var0;
    result->_settingKind.category = var1;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTConfigurationPreset;
  -[AVTConfigurationPreset description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[AVTConfigurationPreset isDefaultPreset](self, "isDefaultPreset"))
  {
    objc_msgSend(v4, "appendString:", CFSTR("default"));
  }
  else
  {
    -[AVTConfigurationPreset preset](self, "preset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTConfigurationPreset *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v5 = (AVTConfigurationPreset *)a3;
  if (v5 == self)
  {
    v16 = 1;
    goto LABEL_11;
  }
  v6 = -[AVTConfigurationPreset isDefaultPreset](self, "isDefaultPreset");
  if (v6 != -[AVTConfigurationPreset isDefaultPreset](v5, "isDefaultPreset"))
    goto LABEL_10;
  -[AVTConfigurationPreset preset](self, "preset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[AVTConfigurationPreset preset](v5, "preset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_7;
  }
  -[AVTConfigurationPreset preset](self, "preset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTConfigurationPreset preset](v5, "preset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v7)
  {

    if ((v10 & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }

  if (!v10)
    goto LABEL_10;
LABEL_7:
  v11 = -[AVTConfigurationPreset settingKind](self, "settingKind");
  v13 = v12;
  v14 = -[AVTConfigurationPreset settingKind](v5, "settingKind");
  v16 = AVTAvatarSettingKindEqual(v11, v13, v14, v15);
LABEL_11:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (-[AVTConfigurationPreset isDefaultPreset](self, "isDefaultPreset"))
  {
    v3 = 0;
  }
  else
  {
    -[AVTConfigurationPreset preset](self, "preset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hash");

  }
  v5 = -[AVTConfigurationPreset settingKind](self, "settingKind");
  return AVTAvatarSettingKindHash(v5, v6) ^ __ROR8__(v3, 32);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind
{
  int64_t category;
  int64_t destination;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  category = self->_settingKind.category;
  destination = self->_settingKind.destination;
  result.var1 = category;
  result.var0 = destination;
  return result;
}

- (id)preset
{
  return self->_preset;
}

- (BOOL)isDefaultPreset
{
  return self->_defaultPreset;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preset, 0);
}

@end

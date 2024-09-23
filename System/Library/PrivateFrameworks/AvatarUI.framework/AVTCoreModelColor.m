@implementation AVTCoreModelColor

- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 derivedColorsByCategories:(id)a6
{
  double v6;
  double v7;

  LODWORD(v6) = -1.0;
  LODWORD(v7) = 1.0;
  return -[AVTCoreModelColor initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:](self, "initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:", a3, a4.var0, a4.var1, a5, 0, a6, v6, v7);
}

- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 showSlider:(BOOL)a6 rangeMin:(float)a7 rangeMax:(float)a8 derivedColorsByCategories:(id)a9
{
  int64_t var1;
  int64_t var0;
  id v18;
  id v19;
  AVTCoreModelColor *v20;
  AVTCoreModelColor *v21;
  uint64_t v22;
  NSDictionary *derivedColorsByCategories;
  objc_super v25;

  var1 = a4.var1;
  var0 = a4.var0;
  v18 = a3;
  v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelColor;
  v20 = -[AVTCoreModelColor init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_settingKind.destination = var0;
    v20->_settingKind.category = var1;
    objc_storeStrong((id *)&v20->_baseColorPreset, a3);
    v21->_order = a5;
    v21->_showSlider = a6;
    v21->_rangeMin = a7;
    v21->_rangeMax = a8;
    v22 = objc_msgSend(v19, "copy");
    derivedColorsByCategories = v21->_derivedColorsByCategories;
    v21->_derivedColorsByCategories = (NSDictionary *)v22;

  }
  return v21;
}

- (id)copyWithRangeMin:(float)a3 rangeMax:(float)a4 showSlider:(BOOL)a5
{
  _BOOL8 v5;
  AVTCoreModelColor *v9;
  double v10;
  double v11;

  v5 = a5;
  v9 = [AVTCoreModelColor alloc];
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  return -[AVTCoreModelColor initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:](v9, "initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:", self->_baseColorPreset, self->_settingKind.destination, self->_settingKind.category, self->_order, v5, self->_derivedColorsByCategories, v10, v11);
}

- (id)copyForPairedCategory:(int64_t)a3
{
  return -[AVTCoreModelColor copyForCategory:destination:](self, "copyForCategory:destination:", a3, -[AVTCoreModelColor settingKind](self, "settingKind"));
}

- (id)copyForCategory:(int64_t)a3 destination:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTCoreModelColor *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  AVTCoreModelColor *v18;

  v6 = AVTAvatarSettingColorIndexForColorDestination(a4);
  v7 = (void *)MEMORY[0x1E0D00660];
  -[AVTCoreModelColor baseColorPreset](self, "baseColorPreset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelColor baseColorPreset](self, "baseColorPreset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "variation");
  objc_msgSend(v7, "colorPresetWithName:category:colorIndex:variation:", v9, a3, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [AVTCoreModelColor alloc];
  v13 = AVTColorSettingKind(a3, v6);
  v15 = v14;
  v16 = -[AVTCoreModelColor order](self, "order");
  -[AVTCoreModelColor derivedColorsByCategories](self, "derivedColorsByCategories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v12, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v11, v13, v15, v16, v17);

  return v18;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  -[AVTCoreModelColor baseColorPreset](self, "baseColorPreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[AVTCoreModelColor baseColorPreset](self, "baseColorPreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTCoreModelColor;
  -[AVTCoreModelColor description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" %lu"), -[AVTCoreModelColor order](self, "order"));
  -[AVTCoreModelColor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@"), v5);

  AVTAvatarSettingKindDescription(-[AVTCoreModelColor settingKind](self, "settingKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" setting: %@"), v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTCoreModelColor *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = (AVTCoreModelColor *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTCoreModelColor identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[AVTCoreModelColor identifier](v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AVTCoreModelColor identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTCoreModelColor identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {

          if (!v9)
            goto LABEL_15;
        }
        else
        {

          if ((v9 & 1) == 0)
            goto LABEL_15;
        }
      }
      v11 = -[AVTCoreModelColor settingKind](self, "settingKind");
      v13 = v12;
      v14 = -[AVTCoreModelColor settingKind](v5, "settingKind");
      if (AVTAvatarSettingKindEqual(v11, (uint64_t)v13, v14, v15))
      {
        -[AVTCoreModelColor derivedColorsByCategories](self, "derivedColorsByCategories");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          || (-[AVTCoreModelColor derivedColorsByCategories](v5, "derivedColorsByCategories"),
              (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[AVTCoreModelColor derivedColorsByCategories](self, "derivedColorsByCategories");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTCoreModelColor derivedColorsByCategories](v5, "derivedColorsByCategories");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v17, "isEqual:", v18);

          if (v16)
          {
LABEL_19:

            goto LABEL_16;
          }
        }
        else
        {
          v10 = 1;
        }

        goto LABEL_19;
      }
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  -[AVTCoreModelColor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTCoreModelColor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v4;
  *(_QWORD *)&v6 = objc_msgSend(v5, "hash");
  v7 = -[AVTCoreModelColor settingKind](self, "settingKind");
  v9 = AVTAvatarSettingKindHash(v7, v8) ^ (v6 >> 32);

  return v9;
}

- (AVTColorPreset)baseColorPreset
{
  return self->_baseColorPreset;
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

- (unint64_t)order
{
  return self->_order;
}

- (BOOL)canShowSlider
{
  return self->_showSlider;
}

- (float)rangeMin
{
  return self->_rangeMin;
}

- (float)rangeMax
{
  return self->_rangeMax;
}

- (NSDictionary)derivedColorsByCategories
{
  return self->_derivedColorsByCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedColorsByCategories, 0);
  objc_storeStrong((id *)&self->_baseColorPreset, 0);
}

- (id)volatileIdentifierForScope:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVTCoreModelColor settingKind](self, "settingKind");
  AVTAvatarSettingKindIdentifier(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelColor identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("color_%@_%@"), v7, v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (unint64_t)costForScope:(id)a3
{
  return 1600;
}

- (BOOL)requiresEncryption
{
  return 0;
}

- (id)thumbnail
{
  void *v2;
  void *v3;

  -[AVTCoreModelColor baseColorPreset](self, "baseColorPreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

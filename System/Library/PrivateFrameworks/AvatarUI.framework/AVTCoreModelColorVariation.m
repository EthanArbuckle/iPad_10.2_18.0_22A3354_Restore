@implementation AVTCoreModelColorVariation

- (AVTCoreModelColorVariation)initWithColor:(id)a3 colorPreset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  AVTCoreModelColorVariation *v10;
  AVTCoreModelColorVariation *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Missing color or colorPreset!"));
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelColorVariation;
  v10 = -[AVTCoreModelColorVariation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_color, a3);
    objc_storeStrong((id *)&v11->_colorPreset, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTCoreModelColorVariation *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = (AVTCoreModelColorVariation *)a3;
  if (v5 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTCoreModelColorVariation color](self, "color");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[AVTCoreModelColorVariation color](v5, "color");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_7:
          -[AVTCoreModelColorVariation colorPreset](self, "colorPreset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10
            || (-[AVTCoreModelColorVariation colorPreset](v5, "colorPreset"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[AVTCoreModelColorVariation colorPreset](self, "colorPreset");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTCoreModelColorVariation colorPreset](v5, "colorPreset");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if (v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            v13 = 1;
          }

          goto LABEL_16;
        }
      }
      -[AVTCoreModelColorVariation color](self, "color");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTCoreModelColorVariation color](v5, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {

        if (v9)
          goto LABEL_7;
      }
      else
      {

        if ((v9 & 1) != 0)
          goto LABEL_7;
      }
    }
    v13 = 0;
  }
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[AVTCoreModelColorVariation color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTCoreModelColorVariation color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v4;
  *(_QWORD *)&v6 = objc_msgSend(v5, "hash");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AVTCoreModelColorVariation colorPreset](self, "colorPreset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variation");
  objc_msgSend(v7, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") ^ (v6 >> 32);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVTCoreModelColorVariation;
  -[AVTCoreModelColorVariation description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelColorVariation colorPreset](self, "colorPreset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@"), v6);

  -[AVTCoreModelColorVariation color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarSettingKindDescription(objc_msgSend(v7, "settingKind"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" settingKind: %@"), v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[AVTCoreModelColorVariation colorPreset](self, "colorPreset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "variation");
  objc_msgSend(v9, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" variation: %@"), v11);

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (AVTColorPreset)colorPreset
{
  return self->_colorPreset;
}

- (AVTCoreModelColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_colorPreset, 0);
}

@end

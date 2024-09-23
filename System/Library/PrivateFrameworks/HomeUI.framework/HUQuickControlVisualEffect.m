@implementation HUQuickControlVisualEffect

+ (id)effectWithType:(unint64_t)a3
{
  HUQuickControlVisualEffect *v4;

  v4 = objc_alloc_init(HUQuickControlVisualEffect);
  v4->_effectType = a3;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = -[HUQuickControlVisualEffect effectType](self, "effectType");
  return v4;
}

- (id)effectConfig
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = -[HUQuickControlVisualEffect effectType](self, "effectType");
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0CEAF78];
      v6 = *MEMORY[0x1E0CD2DD8];
      v5 = v3;
    }
    else
    {
      if (v2)
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0CEAF78];
      v5 = v3;
      v6 = 0;
    }
    objc_msgSend(v4, "layerWithTintColor:filterType:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    objc_msgSend(MEMORY[0x1E0CEAF70], "configWithContentConfig:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.4, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAF80], "layerWithVibrantColor:tintColor:filterType:filterAttributes:", v7, v8, *MEMORY[0x1E0CD2F20], &unk_1E7043018);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAF70], "configWithContentConfig:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

@end

@implementation MTTintingMaterialSettings

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (MTTintingMaterialSettings)initWithTintingDescription:(id)a3 andDescendantDescriptions:(id)a4
{
  id v6;
  id v7;
  MTTintingMaterialSettings *v8;
  MTTintingMaterialSettings *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MTTintingMaterialSettings;
  v8 = -[MTTintingMaterialSettings init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTTintingMaterialSettings _processTintingDescription:defaultingToIdentity:](v8, "_processTintingDescription:defaultingToIdentity:", v6, 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != v16)
            -[MTTintingMaterialSettings _processTintingDescription:defaultingToIdentity:](v9, "_processTintingDescription:defaultingToIdentity:", v15, 0);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (void)_processTintingDescription:(id)a3 defaultingToIdentity:(BOOL)a4
{
  NSDictionary *v6;
  NSDictionary *tintColorDescription;
  id v8;
  CGColorRef v9;
  CGColor *tintColor;
  CGColor **p_tintColor;
  void *v12;
  void *v13;
  float v14;
  double tintAlpha;
  NSString *v16;
  NSString *tintColorName;
  void *v18;
  void *v19;
  uint64_t tintColorUIStyle;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKey:", CFSTR("tintColor"));
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  tintColorDescription = self->_tintColorDescription;
  self->_tintColorDescription = v6;

  if (self->_tintColorDescription)
  {
    +[MTColor colorWithDescription:](MTColor, "colorWithDescription:");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = CGColorRetain((CGColorRef)objc_msgSend(v8, "CGColor"));

    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (v9 != tintColor)
    {
      if (!tintColor)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else
  {
    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (a4)
    {
      if (!tintColor)
        goto LABEL_12;
      v9 = 0;
LABEL_8:
      CGColorRelease(tintColor);
LABEL_9:
      *p_tintColor = v9;
      goto LABEL_12;
    }
  }
  if (tintColor)
    CGColorRelease(tintColor);
LABEL_12:
  objc_msgSend(v21, "objectForKey:", CFSTR("tintAlpha"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "floatValue");
    tintAlpha = v14;
  }
  else
  {
    tintAlpha = 0.0;
    if (!a4)
      tintAlpha = self->_tintAlpha;
  }
  self->_tintAlpha = tintAlpha;
  objc_msgSend(v21, "objectForKey:", CFSTR("tintColorName"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  tintColorName = v16;
  if (!v16)
  {
    tintColorName = 0;
    if (!a4)
      tintColorName = self->_tintColorName;
  }
  objc_storeStrong((id *)&self->_tintColorName, tintColorName);

  objc_msgSend(v21, "objectForKey:", CFSTR("tintColorUIStyle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    tintColorUIStyle = objc_msgSend(v18, "integerValue");
  }
  else if (a4)
  {
    tintColorUIStyle = 0;
  }
  else
  {
    tintColorUIStyle = self->_tintColorUIStyle;
  }
  self->_tintColorUIStyle = tintColorUIStyle;

}

- (void)dealloc
{
  CGColor *tintColor;
  objc_super v4;

  tintColor = self->_tintColor;
  if (tintColor)
    CGColorRelease(tintColor);
  v4.receiver = self;
  v4.super_class = (Class)MTTintingMaterialSettings;
  -[MTTintingMaterialSettings dealloc](&v4, sel_dealloc);
}

- (NSDictionary)tintColorDescription
{
  return self->_tintColorDescription;
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (int64_t)tintColorUIStyle
{
  return self->_tintColorUIStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_tintColorDescription, 0);
}

@end

@implementation AVTMaterial

- (id)copyWithZone:(_NSZone *)a3
{
  AVTMaterial *v4;

  v4 = objc_alloc_init(AVTMaterial);
  objc_storeStrong((id *)&v4->_baseColor, self->_baseColor);
  objc_storeStrong((id *)&v4->_additionalPropertyColors, self->_additionalPropertyColors);
  return v4;
}

- (void)applyToSceneKitMaterial:(id)a3
{
  id v4;
  UIColor *baseColor;
  void *v6;
  NSDictionary *additionalPropertyColors;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  baseColor = self->_baseColor;
  objc_msgSend(v4, "diffuse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", baseColor);

  additionalPropertyColors = self->_additionalPropertyColors;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__AVTMaterial_applyToSceneKitMaterial___block_invoke;
  v9[3] = &unk_1EA61E298;
  v10 = v4;
  v8 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](additionalPropertyColors, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __39__AVTMaterial_applyToSceneKitMaterial___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringByAppendingString:", CFSTR(".contents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v5;
    v12 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4:", AVTGetColorComponents(v5, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    v12 = v13;
  }
  objc_msgSend(v10, "setValue:forKeyPath:", v11, v12);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UIColor *baseColor;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  baseColor = self->_baseColor;
  -[NSDictionary allKeys](self->_additionalPropertyColors, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, base color: %@, additional properties: %@>"), v5, self, baseColor, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (void)setBaseColor:(id)a3
{
  objc_storeStrong((id *)&self->_baseColor, a3);
}

- (NSDictionary)additionalPropertyColors
{
  return self->_additionalPropertyColors;
}

- (void)setAdditionalPropertyColors:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPropertyColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPropertyColors, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end

@implementation LPARAssetProperties

- (id)copyWithZone:(_NSZone *)a3
{
  LPARAssetProperties *v4;
  void *v5;
  void *v6;
  LPARAssetProperties *v7;

  v4 = +[LPARAssetProperties allocWithZone:](LPARAssetProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[LPVisualMediaProperties accessibilityText](self, "accessibilityText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[LPVisualMediaProperties setAccessibilityText:](v4, "setAccessibilityText:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LPARAssetProperties;
  if (-[LPVisualMediaProperties isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "accessibilityText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPVisualMediaProperties accessibilityText](self, "accessibilityText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9)
        v5 = objc_msgSend((id)v8, "isEqual:", v9);
      else
        v5 = 1;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end

@implementation LPVisualMediaProperties

- (id)copyWithZone:(_NSZone *)a3
{
  LPVisualMediaProperties *v4;
  void *v5;
  void *v6;
  LPVisualMediaProperties *v7;

  v4 = +[LPVisualMediaProperties allocWithZone:](LPVisualMediaProperties, "allocWithZone:", a3);
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
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPVisualMediaProperties;
  if (-[LPVisualMediaProperties isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objectsAreEqual_3(v4[1], self->_accessibilityText);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_accessibilityText, "hash");
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end

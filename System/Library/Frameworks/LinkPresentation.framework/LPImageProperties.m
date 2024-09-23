@implementation LPImageProperties

- (id)copyWithZone:(_NSZone *)a3
{
  LPImageProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LPImageProperties *v9;

  v4 = +[LPImageProperties allocWithZone:](LPImageProperties, "allocWithZone:", a3);
  if (v4)
  {
    -[LPImageProperties accessibilityText](self, "accessibilityText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[LPImageProperties setAccessibilityText:](v4, "setAccessibilityText:", v6);

    -[LPImageProperties setType:](v4, "setType:", -[LPImageProperties type](self, "type"));
    -[LPImageProperties overlaidTextColor](self, "overlaidTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageProperties setOverlaidTextColor:](v4, "setOverlaidTextColor:", v7);

    -[LPImageProperties dominantColor](self, "dominantColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageProperties setDominantColor:](v4, "setDominantColor:", v8);

    -[LPImageProperties setHasSingleDominantColor:](v4, "setHasSingleDominantColor:", -[LPImageProperties hasSingleDominantColor](self, "hasSingleDominantColor"));
    v9 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPImageProperties;
  if (-[LPImageProperties isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual(v6[2], self->_accessibilityText) & 1) != 0
        && v6[3] == (void *)self->_type
        && objectsAreEqual(v6[4], self->_overlaidTextColor)
        && objectsAreEqual(v6[5], self->_dominantColor)
        && *((unsigned __int8 *)v6 + 8) == self->_hasSingleDominantColor;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_accessibilityText, "hash");
  v4 = -[UIColor hash](self->_overlaidTextColor, "hash") ^ v3;
  return v4 ^ -[UIColor hash](self->_dominantColor, "hash");
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIColor)overlaidTextColor
{
  return self->_overlaidTextColor;
}

- (void)setOverlaidTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overlaidTextColor, a3);
}

- (UIColor)dominantColor
{
  return self->_dominantColor;
}

- (void)setDominantColor:(id)a3
{
  objc_storeStrong((id *)&self->_dominantColor, a3);
}

- (BOOL)hasSingleDominantColor
{
  return self->_hasSingleDominantColor;
}

- (void)setHasSingleDominantColor:(BOOL)a3
{
  self->_hasSingleDominantColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColor, 0);
  objc_storeStrong((id *)&self->_overlaidTextColor, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end

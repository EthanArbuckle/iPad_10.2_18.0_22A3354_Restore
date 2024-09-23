@implementation ICFontCacheKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  NSString *fontName;
  NSString *v8;
  NSString *v9;
  char v10;
  int traits;
  double pointSize;
  double v13;
  UIFontDescriptor *fontDescriptor;
  uint64_t v15;
  void *v16;
  UIFontDescriptor *v17;
  void *v18;

  v5 = a3;
  v6 = -[ICFontCacheKey hash](self, "hash");
  if (v6 == objc_msgSend(v5, "hash"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      fontName = self->_fontName;
      objc_msgSend(v5, "fontName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (fontName == v8
        || (v9 = self->_fontName,
            objc_msgSend(v5, "fontName"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v9, "isEqualToString:", v3)))
      {
        traits = self->_traits;
        if (traits == objc_msgSend(v5, "traits")
          && (pointSize = self->_pointSize, objc_msgSend(v5, "pointSize"), vabdd_f64(pointSize, v13) < 0.00000011920929))
        {
          fontDescriptor = self->_fontDescriptor;
          objc_msgSend(v5, "fontDescriptor");
          v15 = objc_claimAutoreleasedReturnValue();
          if (fontDescriptor == (UIFontDescriptor *)v15)
          {

            v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            v17 = self->_fontDescriptor;
            objc_msgSend(v5, "fontDescriptor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[UIFontDescriptor isEqual:](v17, "isEqual:", v18);

          }
        }
        else
        {
          v10 = 0;
        }
        if (fontName == v8)
          goto LABEL_14;
      }
      else
      {
        v10 = 0;
      }

LABEL_14:
      goto LABEL_15;
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_fontName, "hash") ^ self->_traits;
  return v3 ^ -[UIFontDescriptor hash](self->_fontDescriptor, "hash") ^ vcvtmd_u64_f64(self->_pointSize * 100.0);
}

- (ICFontCacheKey)initWithFont:(id)a3
{
  id v4;
  ICFontCacheKey *v5;
  void *v6;
  uint64_t v7;
  NSString *fontName;
  double v9;
  void *v10;
  uint64_t v11;
  UIFontDescriptor *fontDescriptor;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICFontCacheKey;
  v5 = -[ICFontCacheKey init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "fontName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v7;

    v5->_traits = objc_msgSend(v4, "traits");
    objc_msgSend(v4, "pointSize");
    v5->_pointSize = v9;
    objc_msgSend(v4, "fontDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    fontDescriptor = v5->_fontDescriptor;
    v5->_fontDescriptor = (UIFontDescriptor *)v11;

  }
  return v5;
}

- (int)traits
{
  return self->_traits;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

@end

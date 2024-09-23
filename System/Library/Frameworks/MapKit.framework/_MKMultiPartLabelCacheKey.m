@implementation _MKMultiPartLabelCacheKey

- (_MKMultiPartLabelCacheKey)initWithAttributedString:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  _MKMultiPartLabelCacheKey *v8;
  uint64_t v9;
  NSAttributedString *attributedString;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKMultiPartLabelCacheKey;
  v8 = -[_MKMultiPartLabelCacheKey init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    attributedString = v8->_attributedString;
    v8->_attributedString = (NSAttributedString *)v9;

    v8->_size.width = width;
    v8->_size.height = height;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:size:", self->_attributedString, self->_size.width, self->_size.height);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    -[_MKMultiPartLabelCacheKey size](self, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "size");
    if (v7 == v11 && v9 == v10)
    {
      -[_MKMultiPartLabelCacheKey attributedString](self, "attributedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 || (objc_msgSend(v5, "attributedString"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[_MKMultiPartLabelCacheKey attributedString](self, "attributedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "attributedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "isEqual:", v16);

        if (v14)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v13 = 1;
      }

      goto LABEL_13;
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  double v3;
  long double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;

  -[_MKMultiPartLabelCacheKey size](self, "size");
  if (v3 < 0.0)
    v3 = -v3;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  v6 = fmod(v4, 1.84467441e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0)
    v10 = v9;
  else
    v10 = v8;
  -[_MKMultiPartLabelCacheKey size](self, "size");
  v12 = -v11;
  if (v11 >= 0.0)
    v12 = v11;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = fmod(v13, 1.84467441e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabs(v14);
  if (v14 < 0.0)
    v19 = v18;
  else
    v19 = v17;
  -[_MKMultiPartLabelCacheKey attributedString](self, "attributedString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ v10 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_MKMultiPartLabelCacheKey size](self, "size");
  NSStringFromCGSize(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKMultiPartLabelCacheKey attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p\nsize=%@\nattributedString =%@\n>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end

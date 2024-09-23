@implementation SUUIGridViewGradientLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIGridViewGradientLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[IKColor copy](self->_gradientColor, "copy");
  v6 = (void *)v4[44];
  v4[44] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SUUIGridViewGradientLayoutAttributes *v4;
  IKColor *gradientColor;
  BOOL v6;
  objc_super v8;

  v4 = (SUUIGridViewGradientLayoutAttributes *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((gradientColor = v4->_gradientColor, gradientColor == self->_gradientColor)
       || -[IKColor isEqual:](gradientColor, "isEqual:")))
    {
      v8.receiver = self;
      v8.super_class = (Class)SUUIGridViewGradientLayoutAttributes;
      v6 = -[UICollectionViewLayoutAttributes isEqual:](&v8, sel_isEqual_, v4);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIGridViewGradientLayoutAttributes;
  v3 = -[UICollectionViewLayoutAttributes hash](&v5, sel_hash);
  return -[IKColor hash](self->_gradientColor, "hash") ^ v3;
}

- (IKColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
}

@end

@implementation CSComplicationLayoutElement

- (CSComplicationLayoutElement)initWithIdentifier:(id)a3 complicationFamily:(unint64_t)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  CSComplicationLayoutElement *v11;
  CSComplicationLayoutElement *v12;
  objc_super v14;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSComplicationLayoutElement;
  v11 = -[CSComplicationLayoutElement init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_complicationFamily = a4;
    v12->_size.width = width;
    v12->_size.height = height;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CSComplicationLayoutElement *v4;
  NSString *identifier;
  void *v6;
  unint64_t complicationFamily;
  double v8;
  double v9;
  BOOL v10;

  v4 = (CSComplicationLayoutElement *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[CSComplicationLayoutElement identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](identifier, "isEqualToString:", v6)
        && (complicationFamily = self->_complicationFamily,
            complicationFamily == -[CSComplicationLayoutElement complicationFamily](v4, "complicationFamily")))
      {
        -[CSComplicationLayoutElement size](v4, "size");
        v10 = self->_size.height == v9 && self->_size.width == v8;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_complicationFamily);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size.height * self->_size.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (int64_t)gridWidth
{
  if (-[CSComplicationLayoutElement complicationFamily](self, "complicationFamily"))
    return 2;
  else
    return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CSComplicationLayoutElement initWithIdentifier:complicationFamily:size:]([CSComplicationLayoutElement alloc], "initWithIdentifier:complicationFamily:size:", self->_identifier, self->_complicationFamily, self->_size.width, self->_size.height);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)complicationFamily
{
  return self->_complicationFamily;
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

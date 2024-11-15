@implementation PKSwatchColor

+ (PKSwatchColor)swatchColor:(void *)a3 identifier:
{
  id v4;
  id v5;
  PKSwatchColor *v6;
  id v7;
  id v8;
  PKSwatchColor *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = [PKSwatchColor alloc];
  v7 = v5;
  v8 = v4;
  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)PKSwatchColor;
    v9 = (PKSwatchColor *)objc_msgSendSuper2(&v13, sel_init);
    v6 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_color, a2);
      v10 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v10;

    }
  }

  return v6;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end

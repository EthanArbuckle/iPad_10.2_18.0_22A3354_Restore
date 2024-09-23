@implementation CLKUITimeLabelStyle

- (CLKFont)designatorFont
{
  return self->_designatorFont;
}

- (BOOL)isEqual:(id)a3
{
  CLKUITimeLabelStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CLKUITimeLabelStyle *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CLKUITimeLabelStyle threeDigitFont](v4, "threeDigitFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", self->_threeDigitFont))
      {
        -[CLKUITimeLabelStyle fourDigitFont](v4, "fourDigitFont");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqual:", self->_fourDigitFont))
        {
          -[CLKUITimeLabelStyle designatorFont](v4, "designatorFont");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isEqual:", self->_designatorFont))
          {
            -[CLKUITimeLabelStyle stringAttributes](v4, "stringAttributes");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "isEqual:", self->_stringAttributes);

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (CLKFont)threeDigitFont
{
  return self->_threeDigitFont;
}

- (CLKFont)fourDigitFont
{
  return self->_fourDigitFont;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setThreeDigitFont:", self->_threeDigitFont);
  objc_msgSend(v4, "setFourDigitFont:", self->_fourDigitFont);
  objc_msgSend(v4, "setDesignatorFont:", self->_designatorFont);
  objc_msgSend(v4, "setStringAttributes:", self->_stringAttributes);
  return v4;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;

  v3 = (double)(unint64_t)-[CLKFont hash](self->_threeDigitFont, "hash");
  v4 = (double)(unint64_t)-[CLKFont hash](self->_fourDigitFont, "hash") * 1000.0 + v3 * 100.0;
  v5 = v4 + (double)(unint64_t)-[CLKFont hash](self->_designatorFont, "hash") * 10000.0;
  return (unint64_t)(v5
                          + (double)(unint64_t)-[NSDictionary hash](self->_stringAttributes, "hash") * 100000.0);
}

- (void)setThreeDigitFont:(id)a3
{
  objc_storeStrong((id *)&self->_threeDigitFont, a3);
}

- (void)setFourDigitFont:(id)a3
{
  objc_storeStrong((id *)&self->_fourDigitFont, a3);
}

- (void)setDesignatorFont:(id)a3
{
  objc_storeStrong((id *)&self->_designatorFont, a3);
}

- (NSDictionary)stringAttributes
{
  return self->_stringAttributes;
}

- (void)setStringAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_stringAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringAttributes, 0);
  objc_storeStrong((id *)&self->_designatorFont, 0);
  objc_storeStrong((id *)&self->_fourDigitFont, 0);
  objc_storeStrong((id *)&self->_threeDigitFont, 0);
}

@end

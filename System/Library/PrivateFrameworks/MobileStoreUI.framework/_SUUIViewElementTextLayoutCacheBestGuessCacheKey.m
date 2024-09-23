@implementation _SUUIViewElementTextLayoutCacheBestGuessCacheKey

- (BOOL)isEqual:(id)a3
{
  _SUUIViewElementTextLayoutCacheBestGuessCacheKey *v4;
  NSString *text;
  UIFont *font;
  BOOL v7;

  v4 = (_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((text = v4->_text, text == self->_text) || -[NSString isEqual:](text, "isEqual:"))
      && ((font = v4->_font, font == self->_font) || -[UIFont isEqual:](font, "isEqual:"))
      && v4->_width == self->_width;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_text, "hash");
  return -[UIFont hash](self->_font, "hash") ^ v3 ^ self->_width;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end

@implementation SUUICompressedImage

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = -[SUUICompressedImage cornerType](self, "cornerType");
  v4 = CFSTR("SUUICornerTypeArc");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("SUUICornerTypeContinuous");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)SUUICompressedImage;
  -[SUUICompressedImage description](&v15, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICompressedImage cornerRadius](self, "cornerRadius");
  v9 = v8;
  -[SUUICompressedImage borderWidth](self, "borderWidth");
  v11 = v10;
  -[SUUICompressedImage borderColor](self, "borderColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: {%@, %f}; {%f, %@};"), v7, v5, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)cornerType
{
  return self->_cornerType;
}

- (void)setCornerType:(int64_t)a3
{
  self->_cornerType = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end

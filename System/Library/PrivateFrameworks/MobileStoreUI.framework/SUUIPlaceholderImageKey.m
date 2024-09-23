@implementation SUUIPlaceholderImageKey

- (SUUIPlaceholderImageKey)initWithSize:(CGSize)a3 imageTreatment:(int64_t)a4 placeholderBackgroundColor:(id)a5
{
  double height;
  double width;
  id v10;
  SUUIPlaceholderImageKey *v11;
  SUUIPlaceholderImageKey *v12;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPlaceholderImageKey;
  v11 = -[SUUIPlaceholderImageKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_height = (uint64_t)height;
    v11->_imageTreatment = a4;
    v11->_width = (uint64_t)width;
    objc_storeStrong((id *)&v11->_placeholderBackgroundColor, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_width + self->_imageTreatment;
  return v2 + -[IKColor hash](self->_placeholderBackgroundColor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  IKColor *placeholderBackgroundColor;
  char v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_height == v4[1] && self->_width == v4[3] && self->_imageTreatment == v4[2])
  {
    placeholderBackgroundColor = self->_placeholderBackgroundColor;
    if (placeholderBackgroundColor == (IKColor *)v4[4])
      v7 = 1;
    else
      v7 = -[IKColor isEqual:](placeholderBackgroundColor, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIPlaceholderImageKey;
  -[SUUIPlaceholderImageKey description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {%ld, %ld}, %ld, %@"), v4, self->_width, self->_height, self->_imageTreatment, self->_placeholderBackgroundColor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderBackgroundColor, 0);
}

@end

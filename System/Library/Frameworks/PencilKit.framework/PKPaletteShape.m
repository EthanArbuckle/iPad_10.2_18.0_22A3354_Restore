@implementation PKPaletteShape

+ (id)shapeWithType:(int64_t)a3
{
  return -[PKPaletteShape initWithShapeType:]([PKPaletteShape alloc], "initWithShapeType:", a3);
}

- (PKPaletteShape)initWithShapeType:(int64_t)a3
{
  PKPaletteShape *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaletteShape;
  result = -[PKPaletteShape init](&v5, sel_init);
  if (result)
    result->_shapeType = a3;
  return result;
}

- (UIImage)image
{
  UIImage *image;
  int64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  UIImage *v11;

  image = self->_image;
  if (!image)
  {
    v4 = -[PKPaletteShape shapeType](self, "shapeType");
    if ((unint64_t)(v4 - 1) > 8)
      v5 = 0;
    else
      v5 = off_1E77789C0[v4 - 1];
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v7, 0);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_image;
    self->_image = v8;

    -[UIImage imageWithRenderingMode:](self->_image, "imageWithRenderingMode:", 2);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_image;
    self->_image = v10;

    image = self->_image;
  }
  return image;
}

- (int64_t)shapeType
{
  return self->_shapeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end

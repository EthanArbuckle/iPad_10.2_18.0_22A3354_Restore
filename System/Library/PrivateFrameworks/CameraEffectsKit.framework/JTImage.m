@implementation JTImage

- (JTImage)initWithPVImage:(id)a3
{
  id v5;
  JTImage *v6;
  JTImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JTImage;
  v6 = -[JTImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pvImageBuffer, a3);

  return v7;
}

- (JTImage)initWithUIImage:(id)a3
{
  id v5;
  JTImage *v6;
  JTImage *v7;
  uint64_t v8;
  PVImageBuffer *pvImageBuffer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JTImage;
  v6 = -[JTImage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    objc_msgSend(MEMORY[0x24BE79030], "imageWithUIImage:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    pvImageBuffer = v7->_pvImageBuffer;
    v7->_pvImageBuffer = (PVImageBuffer *)v8;

  }
  return v7;
}

+ (JTImage)jtImageWithUIImage:(id)a3
{
  id v3;
  JTImage *v4;

  v3 = a3;
  v4 = -[JTImage initWithUIImage:]([JTImage alloc], "initWithUIImage:", v3);

  return v4;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v4;
  UIImage *v5;

  image = self->_image;
  if (!image)
  {
    -[PVImageBuffer uiImage](self->_pvImageBuffer, "uiImage");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (id)bluredImageWithFlippedXAxis:(BOOL)a3
{
  _BOOL8 v3;
  UIImage *image;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  image = self->_image;
  if (image)
  {
    -[UIImage bluredImageWithFlippedXAxis:](image, "bluredImageWithFlippedXAxis:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[JTImage pvImageBuffer](self, "pvImageBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canCreateCVPixelBuffer");

    if ((v8 & 1) != 0)
      objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", -[PVImageBuffer cvPixelBuffer](self->_pvImageBuffer, "cvPixelBuffer"));
    else
      -[JTImage image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bluredImageWithFlippedXAxis:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)hasPVImageBufferAndCanCreateCVPixelBufferWithoutCopy
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[JTImage pvImageBuffer](self, "pvImageBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JTImage pvImageBuffer](self, "pvImageBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "canCreateCVPixelBuffer"))
    {
      -[JTImage pvImageBuffer](self, "pvImageBuffer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "cvPixelBufferRequiresCopy") ^ 1;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (PVImageBuffer)pvImageBuffer
{
  return self->_pvImageBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pvImageBuffer, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

@implementation INUISearchFoundationImageAdapter

+ (void)initialize
{
  id v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___INUISearchFoundationImageAdapter;
  objc_msgSendSuper2(&v4, sel_initialize);
  if ((id)objc_opt_class() == a1)
    v3 = (id)objc_msgSend(a1, "_sharedImageLoader");
}

+ (id)_sharedImageLoader
{
  if (_sharedImageLoader_onceToken != -1)
    dispatch_once(&_sharedImageLoader_onceToken, &__block_literal_global_1514);
  return (id)_sharedImageLoader_sSharedImageLoader;
}

void __54__INUISearchFoundationImageAdapter__sharedImageLoader__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[INUIImageLoader registeredImageLoaderWithScreenDelegate](INUIImageLoader, "registeredImageLoaderWithScreenDelegate");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedImageLoader_sSharedImageLoader;
  _sharedImageLoader_sSharedImageLoader = v0;

}

- (INUISearchFoundationImageAdapter)initWithPayloadImage:(id)a3
{
  id v4;
  INUISearchFoundationImageAdapter *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  INImage *intentsImage;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INUISearchFoundationImageAdapter;
  v5 = -[INUISearchFoundationImageAdapter init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CBDD28]);
    objc_msgSend(v4, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);
    INIntentSlotValueTransformFromImageValue();
    v9 = objc_claimAutoreleasedReturnValue();
    intentsImage = v5->_intentsImage;
    v5->_intentsImage = (INImage *)v9;

    -[INUISearchFoundationImageAdapter setIsTemplate:](v5, "setIsTemplate:", objc_msgSend(v4, "isTemplate"));
    -[INUISearchFoundationImageAdapter setCornerRoundingStyle:](v5, "setCornerRoundingStyle:", objc_msgSend(v4, "cornerRoundingStyle"));
    objc_msgSend(v4, "scale");
    -[INUISearchFoundationImageAdapter setScale:](v5, "setScale:");
    objc_msgSend(v4, "size");
    -[INUISearchFoundationImageAdapter setSize:](v5, "setSize:");
    objc_msgSend(v4, "contentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[INUISearchFoundationImageAdapter setContentType:](v5, "setContentType:", v12);

    objc_msgSend(v4, "keyColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[INUISearchFoundationImageAdapter setKeyColor:](v5, "setKeyColor:", v14);

    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[INUISearchFoundationImageAdapter setIdentifier:](v5, "setIdentifier:", v16);

    -[INUISearchFoundationImageAdapter setSource:](v5, "setSource:", objc_msgSend(v4, "source"));
  }

  return v5;
}

- (INUISearchFoundationImageAdapter)initWithIntentsImage:(id)a3
{
  id v4;
  INUISearchFoundationImageAdapter *v5;
  INUISearchFoundationImageAdapter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INUISearchFoundationImageAdapter;
  v5 = -[INUISearchFoundationImageAdapter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[INUISearchFoundationImageAdapter setIntentsImage:](v5, "setIntentsImage:", v4);

  return v6;
}

- (unint64_t)hash
{
  return -[INImage hash](self->_intentsImage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  INUISearchFoundationImageAdapter *v5;
  INUISearchFoundationImageAdapter *v6;
  INImage *intentsImage;
  uint64_t v8;
  INImage *v9;
  INImage *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (INUISearchFoundationImageAdapter *)v4;
    v6 = v5;
    if (self == v5)
    {
      v12 = 1;
    }
    else
    {
      intentsImage = self->_intentsImage;
      -[INUISearchFoundationImageAdapter intentsImage](v5, "intentsImage");
      v8 = objc_claimAutoreleasedReturnValue();
      if (intentsImage == (INImage *)v8)
      {
        v12 = 1;
      }
      else
      {
        v9 = (INImage *)v8;
        v10 = self->_intentsImage;
        -[INUISearchFoundationImageAdapter intentsImage](v6, "intentsImage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[INImage isEqual:](v10, "isEqual:", v11);

        intentsImage = v9;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)payloadImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[INUISearchFoundationImageAdapter copy](self, "copy");
  INIntentSlotValueTransformToImageValue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageData:", v4);

  return v2;
}

- (int)source
{
  return 2;
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  NSValue *sizeValue;
  double v7;
  double v8;
  BOOL v9;
  NSValue *v10;
  NSValue *v11;

  height = a3.height;
  width = a3.width;
  sizeValue = self->_sizeValue;
  if (!sizeValue
    || ((-[NSValue CGSizeValue](sizeValue, "CGSizeValue"), v8 == width) ? (v9 = v7 == height) : (v9 = 0), !v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
    v10 = (NSValue *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sizeValue;
    self->_sizeValue = v10;

  }
}

- (CGSize)size
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (self->_sizeValue)
  {
    -[NSValue CGSizeValue](self->_sizeValue, "CGSizeValue");
  }
  else
  {
    -[INUISearchFoundationImageAdapter intentsImage](self, "intentsImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_imageSize");
    v6 = v5;
    v8 = v7;

    v2 = v6;
    v3 = v8;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (INImage)intentsImage
{
  return self->_intentsImage;
}

- (void)setIntentsImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsImage, 0);
  objc_storeStrong((id *)&self->_sizeValue, 0);
}

@end

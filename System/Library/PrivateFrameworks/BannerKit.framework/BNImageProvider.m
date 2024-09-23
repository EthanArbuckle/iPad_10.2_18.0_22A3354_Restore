@implementation BNImageProvider

- (id)_initWithImageSource:(id)a3 ofType:(int64_t)a4 fromBundle:(id)a5
{
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  BNImageProvider *v16;
  BNImageProvider *v17;
  void *v18;
  uint64_t v19;
  NSURL *bundleURL;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageSource"));

  }
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 63, CFSTR("Invalid image source type: %ld"), a4);

  }
  else if (a4 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("image");
    goto LABEL_14;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("[UNKNOWN]");
    if (a4 == 2)
      v13 = CFSTR("imageName");
    if (a4 == 3)
      v13 = CFSTR("systemImageName");
LABEL_14:
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 64, CFSTR("Image source (%@) is not of specified type (%@)"), v10, v13);

  }
LABEL_15:
  v22.receiver = self;
  v22.super_class = (Class)BNImageProvider;
  v16 = -[BNImageProvider init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_imageSource, a3);
    v17->_imageSourceType = a4;
    objc_msgSend(v11, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    bundleURL = v17->_bundleURL;
    v17->_bundleURL = (NSURL *)v19;

  }
  return v17;
}

- (BNImageProvider)initWithImage:(id)a3
{
  id v5;
  BNImageProvider *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v6 = -[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v5, 1, 0);

  return v6;
}

- (BNImageProvider)initWithImageName:(id)a3
{
  id v5;
  BNImageProvider *v6;
  void *v8;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[imageName length] > 0"));

  }
  v6 = -[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v5, 2, 0);

  return v6;
}

- (BNImageProvider)initWithImageName:(id)a3 fromBundle:(id)a4
{
  id v7;
  id v8;
  BNImageProvider *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[imageName length] > 0"));

  }
  v9 = -[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v7, 2, v8);

  return v9;
}

- (BNImageProvider)initWithSystemImageName:(id)a3
{
  id v5;
  BNImageProvider *v6;
  void *v8;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNImageProvider.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[systemImageName length] > 0"));

  }
  v6 = -[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v5, 3, 0);

  return v6;
}

- (BOOL)isImageProvider
{
  return 1;
}

- (UIImage)image
{
  int64_t imageSourceType;
  UIImage *v4;
  void *v5;
  UIImage *v6;
  UIImage *image;

  if (!self->_image)
  {
    imageSourceType = self->_imageSourceType;
    switch(imageSourceType)
    {
      case 3:
        objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", self->_imageSource);
        v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
        if (self->_bundleURL)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:withConfiguration:", self->_imageSource, v5, 0);
        v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
        image = self->_image;
        self->_image = v6;

        goto LABEL_12;
      case 1:
        v4 = (UIImage *)self->_imageSource;
LABEL_7:
        v5 = self->_image;
        self->_image = v4;
LABEL_12:

        break;
    }
  }
  return self->_image;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *bundleURL;
  unint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_imageSourceType, CFSTR("imageSourceType"));
  bundleURL = self->_bundleURL;
  if (bundleURL)
    objc_msgSend(v6, "encodeObject:forKey:", bundleURL, CFSTR(" bundleURL"));
  v5 = self->_imageSourceType - 1;
  if (v5 <= 2)
    objc_msgSend(v6, "encodeObject:forKey:", self->_imageSource, off_1E7044F38[v5]);

}

- (BNImageProvider)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  BNImageProvider *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageSourceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR(" bundleURL"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 == 1)
  {
    v8 = CFSTR("image");
  }
  else
  {
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      v9 = 0;
      if (v6)
        goto LABEL_6;
LABEL_8:
      v11 = (BNImageProvider *)-[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v9, v5, 0);
      goto LABEL_9;
    }
    v8 = CFSTR("imageName");
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (BNImageProvider *)-[BNImageProvider _initWithImageSource:ofType:fromBundle:](self, "_initWithImageSource:ofType:fromBundle:", v9, v5, v10);

LABEL_9:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong(&self->_imageSource, 0);
}

@end

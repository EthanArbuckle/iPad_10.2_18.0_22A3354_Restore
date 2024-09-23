@implementation AKIcon

- (AKIcon)initWithData:(id)a3 scale:(double)a4
{
  id v7;
  AKIcon *v8;
  AKIcon *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIcon;
  v8 = -[AKIcon init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    v9->_scale = a4;
  }

  return v9;
}

- (AKIcon)initWithPresentationContext:(id)a3
{
  id v4;
  AKIcon *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSData *data;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKIcon;
  v5 = -[AKIcon init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "iconData");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v4, "iconScale"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      objc_msgSend(v4, "iconData");
      v9 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v9;

      objc_msgSend(v4, "iconScale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v5->_scale = v12;

    }
    else
    {
      objc_msgSend(v4, "iconName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v4, "iconName");
        v14 = objc_claimAutoreleasedReturnValue();
        name = v5->_name;
        v5->_name = (NSString *)v14;
      }
      else
      {
        objc_msgSend(v4, "bundleID");
        v16 = objc_claimAutoreleasedReturnValue();
        name = v5->_bundleID;
        v5->_bundleID = (NSString *)v16;
      }

      v5->_size = (CGSize)vdupq_n_s64(0x404B000000000000uLL);
    }
  }

  return v5;
}

- (AKIcon)initWithIconContext:(id)a3
{
  id v4;
  AKIcon *v5;
  uint64_t v6;
  NSData *data;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIcon;
  v5 = -[AKIcon init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "scale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_scale = v9;

    v5->_maskingStyle = objc_msgSend(v4, "maskingStyle");
  }

  return v5;
}

- (AKIcon)initWithName:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  AKIcon *v9;
  AKIcon *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKIcon;
  v9 = -[AKIcon init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_size.width = width;
    v10->_size.height = height;
  }

  return v10;
}

- (AKIcon)initWithBundleID:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  AKIcon *v9;
  AKIcon *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKIcon;
  v9 = -[AKIcon init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    v10->_size.width = width;
    v10->_size.height = height;
  }

  return v10;
}

+ (id)iconWithData:(id)a3 scale:(double)a4
{
  id v5;
  AKIcon *v6;

  v5 = a3;
  v6 = -[AKIcon initWithData:scale:]([AKIcon alloc], "initWithData:scale:", v5, a4);

  return v6;
}

+ (id)iconWithPresentationContext:(id)a3
{
  id v3;
  AKIcon *v4;

  v3 = a3;
  v4 = -[AKIcon initWithPresentationContext:]([AKIcon alloc], "initWithPresentationContext:", v3);

  return v4;
}

+ (id)iconWithIconContext:(id)a3
{
  id v3;
  AKIcon *v4;

  v3 = a3;
  v4 = -[AKIcon initWithIconContext:]([AKIcon alloc], "initWithIconContext:", v3);

  return v4;
}

+ (id)iconWithName:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  AKIcon *v7;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = -[AKIcon initWithName:size:]([AKIcon alloc], "initWithName:size:", v6, width, height);

  return v7;
}

+ (id)iconWithBundleID:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  AKIcon *v7;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = -[AKIcon initWithBundleID:size:]([AKIcon alloc], "initWithBundleID:size:", v6, width, height);

  return v7;
}

- (id)unmaskedImage
{
  NSData *data;
  void *v3;
  NSString *name;
  NSString *bundleID;

  data = self->_data;
  if (data)
  {
    -[AKIcon _imageWithData:scale:masked:](self, "_imageWithData:scale:masked:", data, 0, self->_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    name = self->_name;
    if (name)
    {
      -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, 0, self->_size.width, self->_size.height);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, 0, self->_size.width, self->_size.height);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (id)maskedImage
{
  NSData *data;
  void *v3;
  NSString *name;
  NSString *bundleID;

  data = self->_data;
  if (data)
  {
    -[AKIcon _imageWithData:scale:masked:](self, "_imageWithData:scale:masked:", data, 1, self->_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    name = self->_name;
    if (name)
    {
      -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, 1, self->_size.width, self->_size.height);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, 1, self->_size.width, self->_size.height);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (id)automaskedImage
{
  _BOOL8 v3;
  NSData *data;
  void *v5;
  NSString *name;
  NSString *bundleID;

  v3 = -[AKIcon _shouldMaskImage](self, "_shouldMaskImage");
  data = self->_data;
  if (data)
  {
    -[AKIcon _imageWithData:scale:masked:](self, "_imageWithData:scale:masked:", data, v3, self->_scale);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    name = self->_name;
    if (name)
    {
      -[AKIcon _imageWithName:size:masked:](self, "_imageWithName:size:masked:", name, v3, self->_size.width, self->_size.height);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      bundleID = self->_bundleID;
      if (bundleID)
      {
        -[AKIcon _imageWithBundleID:size:masked:](self, "_imageWithBundleID:size:masked:", bundleID, v3, self->_size.width, self->_size.height);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5;
}

- (id)unmaskedImageData
{
  void *v3;
  void *v4;

  -[AKIcon unmaskedImage](self, "unmaskedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIcon _dataForImage:](self, "_dataForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)maskedImageData
{
  void *v3;
  void *v4;

  -[AKIcon maskedImage](self, "maskedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIcon _dataForImage:](self, "_dataForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)automaskedImageData
{
  void *v3;
  void *v4;

  -[AKIcon automaskedImage](self, "automaskedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIcon _dataForImage:](self, "_dataForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)iconType
{
  unint64_t v2;
  void *v3;

  if (self->_data)
    return 2;
  if (self->_name)
  {
    -[AKIcon _catalogueImageWithName:](self, "_catalogueImageWithName:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 2 * (v3 != 0);

  }
  else if (self->_bundleID)
  {
    if (-[AKIcon _hasInstalledApplicationWithBundleID:](self, "_hasInstalledApplicationWithBundleID:"))
      return 2;
    else
      return 1;
  }
  else
  {
    return 0;
  }
  return v2;
}

- (id)_catalogueImageWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_imageWithData:(id)a3 scale:(double)a4 masked:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:scale:", a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v7)
  {
    -[AKIcon _iconWithImage:](self, "_iconWithImage:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
    v11 = v9;
  else
    v11 = v8;
  v12 = v11;

  return v12;
}

- (id)_imageWithBundleID:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  -[AKIcon _applicationProxyForBundleID:](self, "_applicationProxyForBundleID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithResourceProxy:", v9);
  -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_imageWithName:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  -[AKIcon _catalogueImageWithName:](self, "_catalogueImageWithName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIcon _iconWithImage:](self, "_iconWithImage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIcon _imageWithIcon:size:masked:](self, "_imageWithIcon:size:masked:", v10, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = v9;
  v13 = v11;

  return v13;
}

- (id)_iconWithImage:(id)a3
{
  id v4;
  CGImage *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AKIcon _CGImageForImage:](self, "_CGImageForImage:", v4);
  objc_msgSend(v4, "scale");
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A810]), "initWithCGImage:scale:", v5, v7);
  v9 = objc_alloc(MEMORY[0x1E0D3A820]);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithImages:", v10);

  return v11;
}

- (id)_imageWithIcon:(id)a3 size:(CGSize)a4 masked:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_screenScale");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", width, height, v9);
  objc_msgSend(v10, "setShape:", 0);
  objc_msgSend(v10, "setShouldApplyMask:", v5);
  objc_msgSend(v10, "setDrawBorder:", 1);
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareImagesForImageDescriptors:", v11);

  objc_msgSend(v8, "imageForDescriptor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA638];
  v14 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_dataForImage:(id)a3
{
  CGImage *Copy;
  __CFData *Mutable;
  __CFString *v5;
  CGImageDestination *v6;

  Copy = -[AKIcon _CGImageForImage:](self, "_CGImageForImage:", a3);
  if (Copy)
  {
    Mutable = CFDataCreateMutable(0, 0);
    objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageDestinationCreateWithData(Mutable, v5, 1uLL, 0);

    CGImageDestinationAddImage(v6, Copy, 0);
    LODWORD(v5) = CGImageDestinationFinalize(v6);
    CFRelease(v6);
    Copy = 0;
    if ((_DWORD)v5)
      Copy = CFDataCreateCopy(0, Mutable);
    CFRelease(Mutable);
  }
  return Copy;
}

- (CGImage)_CGImageForImage:(id)a3
{
  return (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
}

- (BOOL)_hasInstalledApplicationWithBundleID:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[AKIcon _applicationProxyForBundleID:](self, "_applicationProxyForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  return v5;
}

- (id)_applicationProxyForBundleID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a3);
}

- (BOOL)_shouldMaskImage
{
  unint64_t maskingStyle;

  maskingStyle = self->_maskingStyle;
  if (maskingStyle)
    return maskingStyle == 1;
  if (self->_data || self->_name)
    return 1;
  return self->_bundleID != 0;
}

+ (double)_screenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

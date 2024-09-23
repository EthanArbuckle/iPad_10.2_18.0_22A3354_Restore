@implementation CARManufacturerIcon

- (CARManufacturerIcon)initWithDictionary:(id)a3
{
  id v4;
  CARManufacturerIcon *v5;
  void *v6;
  char isKindOfClass;
  double v8;
  double v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CARManufacturerIcon;
  v5 = -[CARManufacturerIcon init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("widthPixels"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = 0.0;
    v9 = 0.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "floatValue", 0.0);
      v9 = v10;
    }
    v5->_pixelSize.width = v9;
    objc_msgSend(v4, "valueForKey:", CFSTR("heightPixels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      v8 = v12;
    }
    v5->_pixelSize.height = v8;
    objc_msgSend(v4, "valueForKey:", CFSTR("imageData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&v5->_imageData, v14);
    objc_msgSend(v4, "valueForKey:", CFSTR("prerendered"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = objc_msgSend(v15, "BOOLValue");
    else
      v16 = 1;
    v5->_prerendered = v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CARManufacturerIcon;
  -[CARManufacturerIcon description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARManufacturerIcon pixelSize](self, "pixelSize");
  v6 = v5;
  -[CARManufacturerIcon pixelSize](self, "pixelSize");
  v8 = v7;
  -[CARManufacturerIcon isPrerendered](self, "isPrerendered");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARManufacturerIcon imageData](self, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <size: %f x %f, prerendered: %@, data length: %lu>"), v4, v6, v8, v9, objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isPrerendered
{
  return self->_prerendered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end

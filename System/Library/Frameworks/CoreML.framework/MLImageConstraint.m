@implementation MLImageConstraint

- (MLImageConstraint)initWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6
{
  id v11;
  MLImageConstraint *v12;
  MLImageConstraint *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MLImageConstraint;
  v12 = -[MLImageConstraint init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_pixelsHigh = a4;
    v12->_pixelsWide = a3;
    v12->_pixelType = a5;
    objc_storeStrong((id *)&v12->_sizeConstraint, a6);
  }

  return v13;
}

- (OSType)pixelFormatType
{
  unint64_t pixelType;
  OSType v3;

  pixelType = self->_pixelType;
  if (pixelType == 40)
    v3 = 1278226536;
  else
    v3 = 1111970369;
  if (pixelType == 10)
    return 1278226488;
  else
    return v3;
}

- (id)_stringForAllowedOSTypes
{
  unint64_t pixelType;
  const __CFString *v3;

  pixelType = self->_pixelType;
  v3 = CFSTR("32BGRA or 32ARGB");
  if (pixelType == 40)
    v3 = CFSTR("OneComponent16Half");
  if (pixelType == 10)
    return CFSTR("OneComponent8");
  else
    return (id)v3;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if ((objc_msgSend(v6, "isUndefined") & 1) != 0 || !objc_msgSend(v6, "imageBufferValue"))
  {
    if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Image constraint can not accept missing values."));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = -[MLImageConstraint allowsPixelBuffer:error:](self, "allowsPixelBuffer:error:", objc_msgSend(v6, "imageBufferValue"), a4);
  }

  return v7;
}

- (BOOL)allowsPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t PixelFormatType;
  uint64_t v8;
  unint64_t pixelType;
  int v10;
  size_t Width;
  MLImageSize *v12;
  BOOL v13;
  void *v15;
  void *v16;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = PixelFormatType;
  pixelType = self->_pixelType;
  if (pixelType == 10)
  {
    v10 = 1278226488;
  }
  else if (pixelType == 40)
  {
    v10 = 1278226536;
  }
  else
  {
    if ((_DWORD)PixelFormatType == 32)
      goto LABEL_8;
    v10 = 1111970369;
  }
  if ((_DWORD)PixelFormatType != v10)
  {
    if (a4)
    {
      -[MLImageConstraint _stringForAllowedOSTypes](self, "_stringForAllowedOSTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stringForPixelFormatType:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Image is not expected type %@, instead is %@"), v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
LABEL_8:
  if (self->_sizeConstraint)
  {
    Width = CVPixelBufferGetWidth(a3);
    v12 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", Width, CVPixelBufferGetHeight(a3));
    v13 = -[MLImageSizeConstraint isAllowedImageSize:error:](self->_sizeConstraint, "isAllowedImageSize:error:", v12, a4);

    return v13;
  }
  if (a4)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Image constraint doesn't have size constraint"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MLImageConstraint initWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:](+[MLImageConstraint allocWithZone:](MLImageConstraint, "allocWithZone:", a3), "initWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:", self->_pixelsWide, self->_pixelsHigh, self->_pixelType, self->_sizeConstraint);
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[MLImageConstraint pixelType](self, "pixelType") == 10)
    v4 = CFSTR("Grayscale");
  else
    v4 = CFSTR("Color");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLImageConstraint pixelsWide](self, "pixelsWide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLImageConstraint pixelsHigh](self, "pixelsHigh"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@ x %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageConstraint pixelsWide](self, "pixelsWide"), CFSTR("pixelsWide"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLImageConstraint pixelsHigh](self, "pixelsHigh"), CFSTR("pixelsHigh"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLImageConstraint pixelType](self, "pixelType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pixelType"));

  -[MLImageConstraint sizeConstraint](self, "sizeConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sizeConstraint"));

}

- (MLImageConstraint)initWithCoder:(id)a3
{
  id v4;
  MLImageConstraint *v5;
  void *v6;
  uint64_t v7;
  MLImageSizeConstraint *sizeConstraint;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLImageConstraint;
  v5 = -[MLImageConstraint init](&v10, sel_init);
  if (v5)
  {
    v5->_pixelsWide = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelsWide"));
    v5->_pixelsHigh = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelsHigh"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizeConstraint"));
    v7 = objc_claimAutoreleasedReturnValue();
    sizeConstraint = v5->_sizeConstraint;
    v5->_sizeConstraint = (MLImageSizeConstraint *)v7;

  }
  return v5;
}

- (NSInteger)pixelsHigh
{
  return self->_pixelsHigh;
}

- (NSInteger)pixelsWide
{
  return self->_pixelsWide;
}

- (MLImageSizeConstraint)sizeConstraint
{
  return self->_sizeConstraint;
}

- (unint64_t)pixelType
{
  return self->_pixelType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeConstraint, 0);
}

+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5 sizeConstraint:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:", a3, a4, a5, v10);

  return (MLImageConstraint *)v11;
}

+ (MLImageConstraint)constraintWithPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 pixelType:(unint64_t)a5
{
  MLImageSize *v9;
  MLImageSizeConstraint *v10;
  void *v11;
  MLImageSizeConstraint *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", a3, a4);
  v10 = [MLImageSizeConstraint alloc];
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MLImageSizeConstraint initWithEnumeratedImageSizes:](v10, "initWithEnumeratedImageSizes:", v11);
  objc_msgSend(a1, "constraintWithPixelsWide:pixelsHigh:pixelType:sizeConstraint:", a3, a4, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLImageConstraint *)v13;
}

+ (id)stringForPixelFormatType:(unsigned int)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if ((int)a3 <= 1111970368)
  {
    if ((int)a3 > 842285638)
    {
      if (a3 == 842285639)
      {
        v3 = CFSTR("24BGRA");
        return v3;
      }
      if (a3 == 875704438)
      {
        v3 = CFSTR("420v");
        return v3;
      }
    }
    else
    {
      if (a3 == 24)
      {
        v3 = CFSTR("24RGB");
        return v3;
      }
      if (a3 == 32)
      {
        v3 = CFSTR("32ARGB");
        return v3;
      }
    }
LABEL_22:
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Unsupported (%@)"), v5);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if ((int)a3 <= 1278226535)
  {
    if (a3 == 1111970369)
    {
      v3 = CFSTR("32BGRA");
      return v3;
    }
    if (a3 == 1278226488)
    {
      v3 = CFSTR("OneComponent8");
      return v3;
    }
    goto LABEL_22;
  }
  if (a3 == 1278226536)
  {
    v3 = CFSTR("OneComponent16Half");
    return v3;
  }
  if (a3 == 1380401729)
  {
    v3 = CFSTR("32RGBA");
    return v3;
  }
  if (a3 != 1647719521)
    goto LABEL_22;
  v3 = CFSTR("64ARGB");
  return v3;
}

+ (id)stringForImagePixelType:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("Unknown");
  v4 = CFSTR("RGB8");
  v5 = CFSTR("BGR8");
  v6 = CFSTR("Gray16Half");
  if (a3 != 40)
    v6 = CFSTR("Unknown");
  if (a3 != 30)
    v5 = v6;
  if (a3 != 20)
    v4 = v5;
  if (a3 == 10)
    v3 = CFSTR("Gray8");
  if (!a3)
    v3 = CFSTR("Invalid");
  if ((uint64_t)a3 <= 19)
    return (id)v3;
  else
    return (id)v4;
}

+ (unint64_t)imagePixelTypeFromOSType:(unsigned int)a3
{
  if ((int)a3 > 1278226487)
  {
    if (a3 != 1278226488)
    {
      if (a3 == 1278226536)
        return 40;
      return 0;
    }
    return 10;
  }
  else
  {
    if (a3 != 32)
    {
      if (a3 == 1111970369)
        return 30;
      return 0;
    }
    return 20;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

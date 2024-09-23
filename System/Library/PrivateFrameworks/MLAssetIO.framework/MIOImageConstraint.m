@implementation MIOImageConstraint

- (MIOImageConstraint)initWithSpecification:(const void *)a3
{
  char *v4;
  MIOImageConstraint *v5;
  MIOImageSizeConstraint *v6;
  MIOImageSizeConstraint *sizeConstraint;
  MIOImageSizeConstraint *v8;
  MIOImageSize *v9;
  void *v10;
  uint64_t v11;
  MIOImageSize *v12;
  MIOImageSize *imageSize;
  objc_super v15;
  _BYTE v16[16];
  __int128 v17;

  v15.receiver = self;
  v15.super_class = (Class)MIOImageConstraint;
  v4 = -[MIOImageConstraint init](&v15, sel_init);
  v5 = (MIOImageConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::ImageFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    v6 = -[MIOImageSizeConstraint initWithSpecification:]([MIOImageSizeConstraint alloc], "initWithSpecification:", a3);
    sizeConstraint = v5->_sizeConstraint;
    v5->_sizeConstraint = v6;

    v8 = v5->_sizeConstraint;
    v9 = 0;
    if (*((_QWORD *)a3 + 2) && *((_QWORD *)a3 + 3))
    {
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      v17 = *((_OWORD *)a3 + 1);
      v9 = -[MIOImageSize initWithSpecification:]([MIOImageSize alloc], "initWithSpecification:", v16);
      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
    }
    if (-[MIOImageSizeConstraint type](v8, "type") == 2)
    {
      if (!v9 || !-[MIOImageSizeConstraint allowsImageSize:](v8, "allowsImageSize:", v9))
      {
        -[MIOImageSizeConstraint enumeratedImageSizes](v8, "enumeratedImageSizes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (MIOImageSize *)v11;
        goto LABEL_13;
      }
LABEL_15:

      imageSize = v5->_imageSize;
      v5->_imageSize = v9;

      return v5;
    }
    if (-[MIOImageSizeConstraint type](v8, "type") == 3)
    {
      if (v9 && -[MIOImageSizeConstraint allowsImageSize:](v8, "allowsImageSize:", v9))
        goto LABEL_15;
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      *(_QWORD *)&v17 = -[MIOImageSizeConstraint pixelsWideRange](v8, "pixelsWideRange");
      *((_QWORD *)&v17 + 1) = -[MIOImageSizeConstraint pixelsHighRange](v8, "pixelsHighRange");
      v12 = -[MIOImageSize initWithSpecification:]([MIOImageSize alloc], "initWithSpecification:", v16);

      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      v9 = v12;
    }
LABEL_13:
    if (!v9)
    {
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      v17 = 0uLL;
      v9 = -[MIOImageSize initWithSpecification:]([MIOImageSize alloc], "initWithSpecification:", v16);
      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
    }
    goto LABEL_15;
  }
  return v5;
}

- (const)imageFeatureTypeSpecification
{
  return &self->_imageFeatureTypeParams;
}

- (NSString)description
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MIOImageConstraint imageSize](self, "imageSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIOImageConstraint pixelFormatType](self, "pixelFormatType");
  if (v5 > 1278226487)
  {
    if (v5 == 1278226488)
    {
      v6 = CFSTR("OneComponent8");
      goto LABEL_11;
    }
    if (v5 == 1278226536)
    {
      v6 = CFSTR("OneComponent16Half");
      goto LABEL_11;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v5 == 32)
  {
    v6 = CFSTR("32ARGB");
    goto LABEL_11;
  }
  if (v5 != 1111970369)
    goto LABEL_10;
  v6 = CFSTR("32BGRA");
LABEL_11:
  -[MIOImageConstraint sizeConstraint](self, "sizeConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("MIOImageConstraint { imageSize: %@ format: %@ sizeConstraint: %@ }"), v4, v6, v7);

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  MIOImageConstraint *v4;
  MIOImageConstraint *v5;
  void *v6;
  void *v7;
  char v8;
  unsigned int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (MIOImageConstraint *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOImageConstraint imageSize](self, "imageSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOImageConstraint imageSize](v5, "imageSize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0
        && (v9 = -[MIOImageConstraint pixelFormatType](self, "pixelFormatType"),
            v9 == -[MIOImageConstraint pixelFormatType](v5, "pixelFormatType")))
      {
        -[MIOImageConstraint sizeConstraint](self, "sizeConstraint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOImageConstraint sizeConstraint](v5, "sizeConstraint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unsigned)pixelFormatType
{
  unsigned int result;
  int v4;
  int *p_colorspace;
  int colorspace;

  result = 1278226488;
  colorspace = self->_imageFeatureTypeParams.colorspace_;
  p_colorspace = &self->_imageFeatureTypeParams.colorspace_;
  v4 = colorspace;
  if (colorspace > 29)
  {
    if (v4 == 30)
      return 1111970369;
    if (v4 == 40)
      return 1278226536;
  }
  else
  {
    if (v4 == 10)
      return result;
    if (v4 == 20)
      return 32;
  }
  result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (result)
  {
    -[MIOImageConstraint pixelFormatType].cold.1(p_colorspace);
    return 0;
  }
  return result;
}

- (MIOImageSize)imageSize
{
  return self->_imageSize;
}

- (MIOImageSizeConstraint)sizeConstraint
{
  return self->_sizeConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeConstraint, 0);
  objc_storeStrong((id *)&self->_imageSize, 0);
  CoreML::Specification::ImageFeatureType::~ImageFeatureType((CoreML::Specification::ImageFeatureType *)&self->_imageFeatureTypeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::ImageFeatureType::ImageFeatureType((CoreML::Specification::ImageFeatureType *)&self->_imageFeatureTypeParams);
  return self;
}

- (void)pixelFormatType
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image pixel type %d is not supported.", (uint8_t *)v2, 8u);
}

@end

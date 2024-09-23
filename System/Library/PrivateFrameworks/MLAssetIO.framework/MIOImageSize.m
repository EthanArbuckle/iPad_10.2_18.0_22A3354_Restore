@implementation MIOImageSize

- (MIOImageSize)initWithSpecification:(const void *)a3
{
  char *v4;
  MIOImageSize *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MIOImageSize;
  v4 = -[MIOImageSize init](&v7, sel_init);
  v5 = (MIOImageSize *)v4;
  if (v4)
    CoreML::Specification::ImageFeatureType_ImageSize::CopyFrom((std::string *)(v4 + 8), (const CoreML::Specification::Int64Range *)a3);
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIOImageSize {%zd, %zd}"), -[MIOImageSize pixelsWide](self, "pixelsWide"), -[MIOImageSize pixelsHigh](self, "pixelsHigh"));
}

- (BOOL)isEqual:(id)a3
{
  MIOImageSize *v4;
  MIOImageSize *v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (MIOImageSize *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIOImageSize pixelsWide](self, "pixelsWide");
      if (v6 == -[MIOImageSize pixelsWide](v5, "pixelsWide"))
      {
        v7 = -[MIOImageSize pixelsHigh](self, "pixelsHigh");
        v8 = v7 == -[MIOImageSize pixelsHigh](v5, "pixelsHigh");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[MIOImageSize pixelsWide](self, "pixelsWide");
  return -[MIOImageSize pixelsHigh](self, "pixelsHigh") ^ v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MIOImageSize pixelsWide](self, "pixelsWide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "pixelsWide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MIOImageSize pixelsHigh](self, "pixelsHigh"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "pixelsHigh"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

  }
  return v7;
}

- (int64_t)pixelsWide
{
  return self->_imageSizeParams.width_;
}

- (int64_t)pixelsHigh
{
  return self->_imageSizeParams.height_;
}

- (void).cxx_destruct
{
  CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)&self->_imageSizeParams);
}

- (id).cxx_construct
{
  CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)&self->_imageSizeParams);
  return self;
}

@end

@implementation FigMetalTextureStub

- (FigMetalTextureStub)initWithDescriptor:(id)a3
{
  id v4;
  FigMetalTextureStub *v5;
  FigMetalTextureStub *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FigMetalTextureStub *v16;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)FigMetalTextureStub;
    v5 = -[FigMetalTextureStub init](&v18, sel_init);
    v6 = v5;
    if (v5)
    {
      v5->_offset = 0;
      objc_msgSend(v4, "desc");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_width = objc_msgSend(v7, "width");

      objc_msgSend(v4, "desc");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_height = objc_msgSend(v8, "height");

      objc_msgSend(v4, "desc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_depth = objc_msgSend(v9, "depth");

      objc_msgSend(v4, "desc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_usage = objc_msgSend(v10, "usage");

      objc_msgSend(v4, "desc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_textureType = objc_msgSend(v11, "textureType");

      objc_msgSend(v4, "desc");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_pixelFormat = objc_msgSend(v12, "pixelFormat");

      objc_msgSend(v4, "desc");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_arrayLength = objc_msgSend(v13, "arrayLength");

      objc_msgSend(v4, "desc");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_sampleCount = objc_msgSend(v14, "sampleCount");

      objc_msgSend(v4, "desc");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_mipmapLevelCount = objc_msgSend(v15, "mipmapLevelCount");

    }
    self = v6;
    v16 = self;
  }
  else
  {
    FigSignalErrorAt();
    v16 = 0;
  }

  return v16;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

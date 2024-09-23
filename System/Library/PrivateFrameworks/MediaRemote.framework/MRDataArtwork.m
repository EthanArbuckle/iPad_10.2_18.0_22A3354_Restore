@implementation MRDataArtwork

- (MRDataArtwork)initWithImageData:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  id v9;
  NSObject *v10;
  MRDataArtwork *v11;
  MRDataArtwork *v12;
  MRDataArtwork *v13;
  objc_super v15;
  id v16;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    v16 = 0;
    +[MRImageUtilities imageDimensionsForImageData:error:](MRImageUtilities, "imageDimensionsForImageData:error:", v4, &v16);
    v6 = v5;
    v8 = v7;
    v9 = v16;
    if (v9)
    {
      _MRLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MRDataArtwork initWithImageData:].cold.1(v10);

      v11 = 0;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)MRDataArtwork;
      v12 = -[MRDataArtwork init](&v15, sel_init);
      v13 = v12;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_imageData, v4);
        v13->_dimensions.width = v6;
        v13->_dimensions.height = v8;
      }
      self = v13;
      v11 = self;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRDataArtwork imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDataArtwork dimensions](self, "dimensions");
  v7 = v6;
  -[MRDataArtwork dimensions](self, "dimensions");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: data=%@, dim={%g,%g}"), v4, v5, v7, v8);

  return v9;
}

- (MRDataArtwork)initWithProtobuf:(id)a3
{
  id v4;
  MRDataArtwork *v5;
  void *v6;
  MRDataArtwork *v7;

  v4 = a3;
  objc_msgSend(v4, "imageData");
  v5 = (MRDataArtwork *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRDataArtwork initWithImageData:](self, "initWithImageData:", v6);

    self = v7;
    v5 = self;
  }

  return v5;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)initWithImageData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[MRArtwork] Failed to determine dimensions for provided image data.", v1, 2u);
}

@end

@implementation MSVArtworkServiceResizeRequestDestination

- (MSVArtworkServiceResizeRequestDestination)initWithFormat:(int64_t)a3 size:(CGSize)a4 compressionQuality:(double)a5 destinationURL:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  MSVArtworkServiceResizeRequestDestination *v13;
  MSVArtworkServiceResizeRequestDestination *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MSVArtworkServiceResizeRequestDestination;
  v13 = -[MSVArtworkServiceResizeRequestDestination init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_size.width = width;
    v13->_size.height = height;
    v13->_compressionQuality = a5;
    objc_storeStrong((id *)&v13->_destinationURL, a6);
    v14->_format = a3;
  }

  return v14;
}

- (MSVArtworkServiceResizeRequestDestination)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkServiceResizeRequestDestination *v5;
  float v6;
  CGFloat v7;
  float v8;
  float v9;
  uint64_t v10;
  NSURL *destinationURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSVArtworkServiceResizeRequestDestination;
  v5 = -[MSVArtworkServiceResizeRequestDestination init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationSizeWidth"));
    v7 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationSizeHeight"));
    v5->_size.width = v7;
    v5->_size.height = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationCompressionQuality"));
    v5->_compressionQuality = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSVArtworkServiceResizeRequestDestinationURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v10;

    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationFormat"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MSVArtworkServiceResizeRequestDestination size](self, "size");
  *(float *)&v4 = v4;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationSizeWidth"), v4);
  -[MSVArtworkServiceResizeRequestDestination size](self, "size");
  *(float *)&v6 = v5;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationSizeHeight"), v6);
  -[MSVArtworkServiceResizeRequestDestination compressionQuality](self, "compressionQuality");
  *(float *)&v7 = v7;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceResizeRequestDestinationCompressionQuality"), v7);
  -[MSVArtworkServiceResizeRequestDestination destinationURL](self, "destinationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("MSVArtworkServiceResizeRequestDestinationURL"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[MSVArtworkServiceResizeRequestDestination format](self, "format"), CFSTR("MSVArtworkServiceResizeRequestDestinationFormat"));
}

- (id)description
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;

  v4 = -[MSVArtworkServiceResizeRequestDestination format](self, "format");
  if (v4 == 2)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v16 = v15;
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v18 = v17;
    -[MSVArtworkServiceResizeRequestDestination destinationURL](self, "destinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<size={%g, %g} format=ASTC -- %@>"), v16, v18, v13, v26);
  }
  else if (v4 == 1)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v21 = v20;
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v23 = v22;
    -[MSVArtworkServiceResizeRequestDestination destinationURL](self, "destinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<size={%g, %g} format=PNG -- %@>"), v21, v23, v13, v26);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceResizeRequest.m"), 88, CFSTR("Unknown MSVImageFormat"));
      v24 = 0;
      goto LABEL_9;
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v7 = v6;
    -[MSVArtworkServiceResizeRequestDestination size](self, "size");
    v9 = v8;
    -[MSVArtworkServiceResizeRequestDestination compressionQuality](self, "compressionQuality");
    v11 = v10;
    -[MSVArtworkServiceResizeRequestDestination destinationURL](self, "destinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<size={%g, %g} quality=%g format=JPEG -- %@>"), v7, v9, v11, v13);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v24;
}

- (int64_t)format
{
  return self->_format;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

+ (id)destinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5
{
  double height;
  double width;
  id v8;
  void *v9;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:size:compressionQuality:destinationURL:", a3, v8, width, height, 0.0);

  return v9;
}

+ (id)jpegDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5
{
  double height;
  double width;
  id v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormat:size:compressionQuality:destinationURL:", 0, v8, width, height, a4);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

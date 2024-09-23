@implementation MSVArtworkServiceConversionRequest

- (MSVArtworkServiceConversionRequest)initWithSourceURL:(id)a3 destinationURL:(id)a4 destinationFormat:(int64_t)a5
{
  id v8;
  id v9;
  MSVArtworkServiceConversionRequest *v10;
  uint64_t v11;
  NSURL *sourceURL;
  uint64_t v13;
  NSURL *destinationURL;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSVArtworkServiceConversionRequest;
  v10 = -[MSVArtworkServiceRequest init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    sourceURL = v10->_sourceURL;
    v10->_sourceURL = (NSURL *)v11;

    v13 = objc_msgSend(v9, "copy");
    destinationURL = v10->_destinationURL;
    v10->_destinationURL = (NSURL *)v13;

    v10->_destinationFormat = a5;
    -[MSVArtworkServiceRequest addSandboxExtensionIfNeededForURL:](v10, "addSandboxExtensionIfNeededForURL:", v10->_sourceURL);
    -[NSURL URLByDeletingLastPathComponent](v10->_destinationURL, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceRequest addSandboxExtensionIfNeededForURL:](v10, "addSandboxExtensionIfNeededForURL:", v15);

  }
  return v10;
}

- (MSVArtworkServiceConversionRequest)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkServiceConversionRequest *v5;
  uint64_t v6;
  NSURL *sourceURL;
  uint64_t v8;
  NSURL *destinationURL;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSVArtworkServiceConversionRequest;
  v5 = -[MSVArtworkServiceRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSVArtworkServiceConversionRequestSourceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSVArtworkServiceConversionRequestDestinationURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v8;

    v5->_destinationFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MSVArtworkServiceConversionRequestDestinationFormat"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MSVArtworkServiceConversionRequestDestinationCompressionQuality"));
    v5->_destinationCompressionQuality = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSVArtworkServiceConversionRequest;
  v4 = a3;
  -[MSVArtworkServiceRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[MSVArtworkServiceConversionRequest sourceURL](self, "sourceURL", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MSVArtworkServiceConversionRequestSourceURL"));

  -[MSVArtworkServiceConversionRequest destinationURL](self, "destinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MSVArtworkServiceConversionRequestDestinationURL"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MSVArtworkServiceConversionRequest destinationFormat](self, "destinationFormat"), CFSTR("MSVArtworkServiceConversionRequestDestinationFormat"));
  -[MSVArtworkServiceConversionRequest destinationCompressionQuality](self, "destinationCompressionQuality");
  *(float *)&v7 = v7;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MSVArtworkServiceConversionRequestDestinationCompressionQuality"), v7);

}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (int64_t)operationPriority
{
  return 4;
}

- (id)debugDescription
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v4 = -[MSVArtworkServiceConversionRequest destinationFormat](self, "destinationFormat");
  if (v4 == 2)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_opt_class();
    -[MSVArtworkServiceConversionRequest sourceURL](self, "sourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceConversionRequest destinationURL](self, "destinationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationFormat: ASTC"), v11, self, v7, v8, v16);
  }
  else if (v4 == 1)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    -[MSVArtworkServiceConversionRequest sourceURL](self, "sourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceConversionRequest destinationURL](self, "destinationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationFormat: PNG"), v13, self, v7, v8, v16);
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceConversionRequest.m"), 83, CFSTR("Unknown MSVImageFormat"));
      v14 = 0;
      goto LABEL_9;
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    -[MSVArtworkServiceConversionRequest sourceURL](self, "sourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceConversionRequest destinationURL](self, "destinationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceConversionRequest destinationCompressionQuality](self, "destinationCompressionQuality");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>\nsourceURL: %@\ndestinationURL: %@\ndestinationCompressionQuality: %g\ndestinationFormat: JPEG"), v6, self, v7, v8, v9);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)destinationFormat
{
  return self->_destinationFormat;
}

- (void)setDestinationFormat:(int64_t)a3
{
  self->_destinationFormat = a3;
}

- (double)destinationCompressionQuality
{
  return self->_destinationCompressionQuality;
}

- (void)setDestinationCompressionQuality:(double)a3
{
  self->_destinationCompressionQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

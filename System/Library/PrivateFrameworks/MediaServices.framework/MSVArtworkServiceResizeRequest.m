@implementation MSVArtworkServiceResizeRequest

- (MSVArtworkServiceResizeRequest)initWithSourceURL:(id)a3
{
  id v5;
  MSVArtworkServiceResizeRequest *v6;
  MSVArtworkServiceResizeRequest *v7;
  uint64_t v8;
  NSMutableArray *resizeDestinations;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVArtworkServiceResizeRequest;
  v6 = -[MSVArtworkServiceRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceURL, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    resizeDestinations = v7->_resizeDestinations;
    v7->_resizeDestinations = (NSMutableArray *)v8;

    -[MSVArtworkServiceRequest addSandboxExtensionIfNeededForURL:](v7, "addSandboxExtensionIfNeededForURL:", v7->_sourceURL);
  }

  return v7;
}

- (MSVArtworkServiceResizeRequest)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkServiceResizeRequest *v5;
  uint64_t v6;
  NSURL *sourceURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *resizeDestinations;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSVArtworkServiceResizeRequest;
  v5 = -[MSVArtworkServiceRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSVArtworkServiceResizeRequestSourceURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("MSVArtworkServiceResizeRequestDestinations"));
    v11 = objc_claimAutoreleasedReturnValue();
    resizeDestinations = v5->_resizeDestinations;
    v5->_resizeDestinations = (NSMutableArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSVArtworkServiceResizeRequest;
  v4 = a3;
  -[MSVArtworkServiceRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[MSVArtworkServiceResizeRequest sourceURL](self, "sourceURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MSVArtworkServiceResizeRequestSourceURL"));

  -[MSVArtworkServiceResizeRequest resizeDestinations](self, "resizeDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MSVArtworkServiceResizeRequestDestinations"));

}

- (void)addDestinationWithFormat:(int64_t)a3 size:(CGSize)a4 url:(id)a5
{
  double height;
  double width;
  NSMutableArray *resizeDestinations;
  id v10;
  void *v11;
  id v12;

  height = a4.height;
  width = a4.width;
  resizeDestinations = self->_resizeDestinations;
  v10 = a5;
  +[MSVArtworkServiceResizeRequestDestination destinationWithFormat:size:url:](MSVArtworkServiceResizeRequestDestination, "destinationWithFormat:size:url:", a3, v10, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](resizeDestinations, "addObject:", v11);

  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[MSVArtworkServiceRequest addSandboxExtensionIfNeededForURL:](self, "addSandboxExtensionIfNeededForURL:", v12);
}

- (void)addJPEGDestinationWithSize:(CGSize)a3 compressionQuality:(double)a4 url:(id)a5
{
  double height;
  double width;
  NSMutableArray *resizeDestinations;
  id v10;
  void *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  resizeDestinations = self->_resizeDestinations;
  v10 = a5;
  +[MSVArtworkServiceResizeRequestDestination jpegDestinationWithSize:compressionQuality:url:](MSVArtworkServiceResizeRequestDestination, "jpegDestinationWithSize:compressionQuality:url:", v10, width, height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](resizeDestinations, "addObject:", v11);

  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[MSVArtworkServiceRequest addSandboxExtensionIfNeededForURL:](self, "addSandboxExtensionIfNeededForURL:", v12);
}

- (void)enumerateDestinationsUsingBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceResizeRequest.m"), 152, CFSTR("Cannot enumerate destinations without a block"));

  }
  -[MSVArtworkServiceResizeRequest resizeDestinations](self, "resizeDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MSVArtworkServiceResizeRequest_enumerateDestinationsUsingBlock___block_invoke;
  v9[3] = &unk_1E43E9E68;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MSVArtworkServiceResizeRequest sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVArtworkServiceResizeRequest resizeDestinations](self, "resizeDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\nsourceURL: %@\ndestinations: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)resizeDestinations
{
  return self->_resizeDestinations;
}

- (void)setResizeDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_resizeDestinations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeDestinations, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

uint64_t __66__MSVArtworkServiceResizeRequest_enumerateDestinationsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

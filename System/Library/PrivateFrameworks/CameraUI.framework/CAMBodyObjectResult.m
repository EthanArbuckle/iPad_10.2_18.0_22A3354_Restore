@implementation CAMBodyObjectResult

- (CAMBodyObjectResult)initWithBodyObject:(id)a3
{
  id v5;
  CAMBodyObjectResult *v6;
  CAMBodyObjectResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  CAMBodyObjectResult *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMBodyObjectResult;
  v6 = -[CAMBodyObjectResult init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataBodyObject, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %ld"), v9, objc_msgSend(v5, "bodyID"));
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v10;

    v12 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBodyObjectResult _metadataBodyObject](self, "_metadataBodyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBodyObjectResult _metadataBodyObject](self, "_metadataBodyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type: %@ identifier: %ld>"), v5, self, v7, objc_msgSend(v8, "bodyID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)metadataType
{
  void *v2;
  void *v3;

  -[CAMBodyObjectResult _metadataBodyObject](self, "_metadataBodyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)syntheticFocusMode
{
  void *v2;
  unint64_t v3;

  -[CAMBodyObjectResult underlyingMetadataObject](self, "underlyingMetadataObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", objc_msgSend(v2, "syntheticFocusMode"));

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataBodyObject)_metadataBodyObject
{
  return self->__metadataBodyObject;
}

- (void)set_metadataBodyObject:(id)a3
{
  objc_storeStrong((id *)&self->__metadataBodyObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataBodyObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end

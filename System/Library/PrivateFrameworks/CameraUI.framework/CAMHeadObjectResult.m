@implementation CAMHeadObjectResult

- (CAMHeadObjectResult)initWithHeadObject:(id)a3
{
  id v5;
  CAMHeadObjectResult *v6;
  CAMHeadObjectResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  CAMHeadObjectResult *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMHeadObjectResult;
  v6 = -[CAMHeadObjectResult init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataHeadObject, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMHeadObjectResult _metadataHeadObject](self, "_metadataHeadObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type: %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)metadataType
{
  void *v2;
  void *v3;

  -[CAMHeadObjectResult _metadataHeadObject](self, "_metadataHeadObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)syntheticFocusMode
{
  void *v2;
  unint64_t v3;

  -[CAMHeadObjectResult underlyingMetadataObject](self, "underlyingMetadataObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", objc_msgSend(v2, "syntheticFocusMode"));

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataObject)_metadataHeadObject
{
  return self->__metadataHeadObject;
}

- (void)set_metadataHeadObject:(id)a3
{
  objc_storeStrong((id *)&self->__metadataHeadObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataHeadObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end

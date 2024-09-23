@implementation PHAssetResourceCreationOptions

- (PHAssetResourceCreationOptions)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  PHAssetResourceCreationOptions *v5;
  uint64_t v6;
  NSString *originalFilename;
  uint64_t v8;
  NSString *uniformTypeIdentifier;
  void *v10;
  uint64_t v11;
  NSDate *alternateImportImageDate;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *forcePairingIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetResourceCreationOptions;
  v5 = -[PHAssetResourceCreationOptions init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalFilename"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniformTypeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldMoveFile"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldMoveFile = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateImportImageDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    alternateImportImageDate = v5->_alternateImportImageDate;
    v5->_alternateImportImageDate = (NSDate *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("burstPickType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_burstPickType = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldIngestInPlace"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldIngestInPlace = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forcePairingIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    forcePairingIdentifier = v5->_forcePairingIdentifier;
    v5->_forcePairingIdentifier = (NSString *)v15;

  }
  return v5;
}

- (id)propertyListRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *forcePairingIdentifier;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_originalFilename, CFSTR("originalFilename"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uniformTypeIdentifier, CFSTR("uniformTypeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldMoveFile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("shouldMoveFile"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_alternateImportImageDate, CFSTR("alternateImportImageDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_burstPickType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("burstPickType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldIngestInPlace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("shouldIngestInPlace"));

  forcePairingIdentifier = self->_forcePairingIdentifier;
  if (forcePairingIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", forcePairingIdentifier, CFSTR("forcePairingIdentifier"));
  return v3;
}

- (BOOL)ensureOptionsAreCompleteForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  if (v4)
  {
    -[PHAssetResourceCreationOptions uniformTypeIdentifier](self, "uniformTypeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v4, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeWithFilenameExtension:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetResourceCreationOptions setUniformTypeIdentifier:](self, "setUniformTypeIdentifier:", v9);

    }
    -[PHAssetResourceCreationOptions originalFilename](self, "originalFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v4, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetResourceCreationOptions setOriginalFilename:](self, "setOriginalFilename:", v11);

    }
  }
  -[PHAssetResourceCreationOptions uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PHAssetResourceCreationOptions originalFilename](self, "originalFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetResourceCreationOptions *v4;

  v4 = objc_alloc_init(PHAssetResourceCreationOptions);
  -[PHAssetResourceCreationOptions setOriginalFilename:](v4, "setOriginalFilename:", self->_originalFilename);
  -[PHAssetResourceCreationOptions setUniformTypeIdentifier:](v4, "setUniformTypeIdentifier:", self->_uniformTypeIdentifier);
  -[PHAssetResourceCreationOptions setShouldMoveFile:](v4, "setShouldMoveFile:", self->_shouldMoveFile);
  -[PHAssetResourceCreationOptions setAlternateImportImageDate:](v4, "setAlternateImportImageDate:", self->_alternateImportImageDate);
  -[PHAssetResourceCreationOptions setBurstPickType:](v4, "setBurstPickType:", self->_burstPickType);
  -[PHAssetResourceCreationOptions setShouldIngestInPlace:](v4, "setShouldIngestInPlace:", self->_shouldIngestInPlace);
  -[PHAssetResourceCreationOptions setForcePairingIdentifier:](v4, "setForcePairingIdentifier:", self->_forcePairingIdentifier);
  return v4;
}

- (NSDate)alternateImportImageDate
{
  return self->_alternateImportImageDate;
}

- (void)setAlternateImportImageDate:(id)a3
{
  objc_storeStrong((id *)&self->_alternateImportImageDate, a3);
}

- (int)burstPickType
{
  return self->_burstPickType;
}

- (void)setBurstPickType:(int)a3
{
  self->_burstPickType = a3;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(NSString *)originalFilename
{
  objc_setProperty_nonatomic_copy(self, a2, originalFilename, 24);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(NSString *)uniformTypeIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, uniformTypeIdentifier, 32);
}

- (BOOL)shouldMoveFile
{
  return self->_shouldMoveFile;
}

- (void)setShouldMoveFile:(BOOL)shouldMoveFile
{
  self->_shouldMoveFile = shouldMoveFile;
}

- (BOOL)shouldIngestInPlace
{
  return self->_shouldIngestInPlace;
}

- (void)setShouldIngestInPlace:(BOOL)a3
{
  self->_shouldIngestInPlace = a3;
}

- (NSString)forcePairingIdentifier
{
  return self->_forcePairingIdentifier;
}

- (void)setForcePairingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_forcePairingIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcePairingIdentifier, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_alternateImportImageDate, 0);
}

@end

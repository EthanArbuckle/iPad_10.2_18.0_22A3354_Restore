@implementation ICDocCamDocumentInfo

- (ICDocCamDocumentInfo)init
{
  ICDocCamDocumentInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamDocumentInfo;
  result = -[ICDocCamDocumentInfo init](&v3, sel_init);
  if (result)
    result->_currentOrientation = 0;
  return result;
}

- (ICDocCamDocumentInfo)initWithDelegate:(id)a3
{
  id v4;
  ICDocCamDocumentInfo *v5;
  ICDocCamDocumentInfo *v6;

  v4 = a3;
  v5 = -[ICDocCamDocumentInfo init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (DCScanDataDelegate)scanDataDelegate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICDocCamDocumentInfo scanDataDelegateIdentifier](self, "scanDataDelegateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDocCamDocumentInfo delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo scanDataDelegateIdentifier](self, "scanDataDelegateIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scanDataDelegateWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (DCScanDataDelegate *)v6;
}

- (BOOL)hasFilter
{
  return -[ICDocCamDocumentInfo currentFilter](self, "currentFilter") != 0;
}

- (id)allUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamDocumentInfo croppedAndFilteredImageUUID](self, "croppedAndFilteredImageUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICDocCamDocumentInfo croppedAndFilteredImageUUID](self, "croppedAndFilteredImageUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[ICDocCamDocumentInfo croppedButNotFilteredImageUUID](self, "croppedButNotFilteredImageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICDocCamDocumentInfo croppedButNotFilteredImageUUID](self, "croppedButNotFilteredImageUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[ICDocCamDocumentInfo fullImageUUID](self, "fullImageUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICDocCamDocumentInfo fullImageUUID](self, "fullImageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[ICDocCamDocumentInfo meshAnimImageUUID](self, "meshAnimImageUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICDocCamDocumentInfo meshAnimImageUUID](self, "meshAnimImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const char *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nself: %p\n"), self);
  -[ICDocCamDocumentInfo imageQuad](self, "imageQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  imageQuad                      : %p\n"), v4);

  -[ICDocCamDocumentInfo croppedAndFilteredImageUUID](self, "croppedAndFilteredImageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  croppedAndFilteredImageUUID    : %@\n"), v5);

  -[ICDocCamDocumentInfo croppedButNotFilteredImageUUID](self, "croppedButNotFilteredImageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  croppedButNotFilteredImageUUID : %@\n"), v6);

  -[ICDocCamDocumentInfo fullImageUUID](self, "fullImageUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  fullImageUUID                  : %@\n"), v7);

  -[ICDocCamDocumentInfo meshAnimImageUUID](self, "meshAnimImageUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  meshAnimImageUUID              : %@\n"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("  currentFilter                  : %d\n"), -[ICDocCamDocumentInfo currentFilter](self, "currentFilter"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  currentOrientation             : %ld\n"), -[ICDocCamDocumentInfo currentOrientation](self, "currentOrientation"));
  -[ICDocCamDocumentInfo scanDataDelegateIdentifier](self, "scanDataDelegateIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  scanDataDelegateIdentifier     : %@\n"), v9);

  -[ICDocCamDocumentInfo scanDataDelegate](self, "scanDataDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  scanDataDelegate               : %p\n"), v10);

  v11 = -[ICDocCamDocumentInfo hasFilter](self, "hasFilter");
  v12 = "NO";
  if (v11)
    v12 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR("  hasFilter                      : %s\n"), v12);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamDocumentInfo)initWithCoder:(id)a3
{
  id v4;
  ICDocCamDocumentInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICDocCamDocumentInfo;
  v5 = -[ICDocCamDocumentInfo init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kMetadataFieldCodingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setMetaData:](v5, "setMetaData:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kImageQuadFieldCodingKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setImageQuad:](v5, "setImageQuad:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCroppedAndFilteredImageUUIDFieldCodingKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v5, "setCroppedAndFilteredImageUUID:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCroppedButNotFilteredImageUUIDFieldCodingKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setCroppedButNotFilteredImageUUID:](v5, "setCroppedButNotFilteredImageUUID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFullImageUUIDFieldCodingKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setFullImageUUID:](v5, "setFullImageUUID:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMeshAnimImageUUIDFieldCodingKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setMeshAnimImageUUID:](v5, "setMeshAnimImageUUID:", v14);

    -[ICDocCamDocumentInfo setCurrentFilter:](v5, "setCurrentFilter:", (__int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kCurrentFilterUUIDFieldCodingKey")));
    -[ICDocCamDocumentInfo setCurrentOrientation:](v5, "setCurrentOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCurrentOrientationFieldCodingKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kScanDataDelegateIdentifierFieldCodingKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setScanDataDelegateIdentifier:](v5, "setScanDataDelegateIdentifier:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMarkupModelDataFieldCodingKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamDocumentInfo setMarkupModelData:](v5, "setMarkupModelData:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[ICDocCamDocumentInfo metaData](self, "metaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kMetadataFieldCodingKey"));

  -[ICDocCamDocumentInfo imageQuad](self, "imageQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kImageQuadFieldCodingKey"));

  -[ICDocCamDocumentInfo croppedAndFilteredImageUUID](self, "croppedAndFilteredImageUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCroppedAndFilteredImageUUIDFieldCodingKey"));

  -[ICDocCamDocumentInfo croppedButNotFilteredImageUUID](self, "croppedButNotFilteredImageUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCroppedButNotFilteredImageUUIDFieldCodingKey"));

  -[ICDocCamDocumentInfo fullImageUUID](self, "fullImageUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kFullImageUUIDFieldCodingKey"));

  -[ICDocCamDocumentInfo meshAnimImageUUID](self, "meshAnimImageUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kMeshAnimImageUUIDFieldCodingKey"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[ICDocCamDocumentInfo currentFilter](self, "currentFilter"), CFSTR("kCurrentFilterUUIDFieldCodingKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICDocCamDocumentInfo currentOrientation](self, "currentOrientation"), CFSTR("kCurrentOrientationFieldCodingKey"));
  -[ICDocCamDocumentInfo scanDataDelegateIdentifier](self, "scanDataDelegateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kScanDataDelegateIdentifierFieldCodingKey"));

  -[ICDocCamDocumentInfo markupModelData](self, "markupModelData");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kMarkupModelDataFieldCodingKey"));

}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (ICDocCamImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
  objc_storeStrong((id *)&self->_imageQuad, a3);
}

- (NSString)croppedAndFilteredImageUUID
{
  return self->_croppedAndFilteredImageUUID;
}

- (void)setCroppedAndFilteredImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_croppedAndFilteredImageUUID, a3);
}

- (NSString)croppedButNotFilteredImageUUID
{
  return self->_croppedButNotFilteredImageUUID;
}

- (void)setCroppedButNotFilteredImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_croppedButNotFilteredImageUUID, a3);
}

- (NSString)fullImageUUID
{
  return self->_fullImageUUID;
}

- (void)setFullImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_fullImageUUID, a3);
}

- (NSString)meshAnimImageUUID
{
  return self->_meshAnimImageUUID;
}

- (void)setMeshAnimImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_meshAnimImageUUID, a3);
}

- (signed)currentFilter
{
  return self->_currentFilter;
}

- (void)setCurrentFilter:(signed __int16)a3
{
  self->_currentFilter = a3;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (NSString)scanDataDelegateIdentifier
{
  return self->_scanDataDelegateIdentifier;
}

- (void)setScanDataDelegateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scanDataDelegateIdentifier, a3);
}

- (NSData)markupModelData
{
  return self->_markupModelData;
}

- (void)setMarkupModelData:(id)a3
{
  objc_storeStrong((id *)&self->_markupModelData, a3);
}

- (ICDocCamViewControllerDelegate)delegate
{
  return (ICDocCamViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)constantColor
{
  return self->_constantColor;
}

- (void)setConstantColor:(BOOL)a3
{
  self->_constantColor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markupModelData, 0);
  objc_storeStrong((id *)&self->_scanDataDelegateIdentifier, 0);
  objc_storeStrong((id *)&self->_meshAnimImageUUID, 0);
  objc_storeStrong((id *)&self->_fullImageUUID, 0);
  objc_storeStrong((id *)&self->_croppedButNotFilteredImageUUID, 0);
  objc_storeStrong((id *)&self->_croppedAndFilteredImageUUID, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

@end

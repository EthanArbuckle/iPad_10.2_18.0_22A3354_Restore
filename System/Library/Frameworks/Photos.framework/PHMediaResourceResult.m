@implementation PHMediaResourceResult

- (PHMediaResourceResult)initWithRequestID:(int)a3 assetResource:(id)a4
{
  uint64_t v5;
  id v7;
  PHMediaResourceResult *v8;
  PHMediaResourceResult *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PHMediaResourceResult;
  v8 = -[PHCompositeMediaResult initWithRequestID:](&v11, sel_initWithRequestID_, v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_assetResource, a4);

  return v9;
}

- (BOOL)containsValidData
{
  void *v2;
  BOOL v3;

  if (!self->_assetResourceFileURL && !self->_assetResourceData)
    return 0;
  -[PHCompositeMediaResult error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)allowedInfoKeys
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHMediaResourceResult;
  -[PHCompositeMediaResult allowedInfoKeys](&v6, sel_allowedInfoKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[PHAssetResource type](self->_assetResource, "type") == PHAssetResourceTypeAdjustmentData
    || -[PHAssetResource type](self->_assetResource, "type") == 16)
  {
    objc_msgSend(v4, "addObject:", CFSTR("PHAdjustmentDataKey"));
  }
  return v4;
}

- (id)sanitizedInfoDictionary
{
  void *v3;
  objc_super v5;

  if (-[PHAssetResource type](self->_assetResource, "type") == PHAssetResourceTypeAdjustmentData
    || -[PHAssetResource type](self->_assetResource, "type") == 16)
  {
    -[PHMediaResourceResult adjustmentData](self, "adjustmentData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", v3, CFSTR("PHAdjustmentDataKey"));

  }
  v5.receiver = self;
  v5.super_class = (Class)PHMediaResourceResult;
  -[PHCompositeMediaResult sanitizedInfoDictionary](&v5, sel_sanitizedInfoDictionary);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)imageURL
{
  return self->_assetResourceFileURL;
}

- (id)exifOrientation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PHAssetResource orientation](self->_assetResource, "orientation"));
}

- (id)videoURL
{
  return self->_assetResourceFileURL;
}

- (id)uniformTypeIdentifier
{
  return -[PHAssetResource uniformTypeIdentifier](self->_assetResource, "uniformTypeIdentifier");
}

- (id)adjustmentData
{
  NSData *assetResourceData;
  void *v4;
  PHAdjustmentData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHAdjustmentData *v10;
  void *v11;
  uint64_t v13;

  if (-[PHAssetResource type](self->_assetResource, "type") != PHAssetResourceTypeAdjustmentData
    && -[PHAssetResource type](self->_assetResource, "type") != 16)
  {
    return 0;
  }
  assetResourceData = self->_assetResourceData;
  if (!assetResourceData)
    return 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", assetResourceData, 0, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [PHAdjustmentData alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D73390]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:](v5, "initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:", v6, v7, v8, v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D73378]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAdjustmentData setEditorBundleID:](v10, "setEditorBundleID:", v11);

  }
  else
  {
    -[PHCompositeMediaResult setErrorIfNone:](self, "setErrorIfNone:", v13);
    v10 = 0;
  }

  return v10;
}

- (id)adjustmentSecondaryDataURL
{
  return self->_assetResourceFileURL;
}

- (id)mediaMetadata
{
  if (-[PHAssetResource type](self->_assetResource, "type") == 104
    || -[PHAssetResource type](self->_assetResource, "type") == 105)
  {
    return self->_assetResourceData;
  }
  else
  {
    return 0;
  }
}

- (NSData)assetResourceData
{
  return self->_assetResourceData;
}

- (void)setAssetResourceData:(id)a3
{
  objc_storeStrong((id *)&self->_assetResourceData, a3);
}

- (NSURL)assetResourceFileURL
{
  return self->_assetResourceFileURL;
}

- (void)setAssetResourceFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetResourceFileURL, 0);
  objc_storeStrong((id *)&self->_assetResourceData, 0);
  objc_storeStrong((id *)&self->_assetResource, 0);
}

@end

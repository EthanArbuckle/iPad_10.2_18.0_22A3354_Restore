@implementation PHAssetCreationMetadataCopyOptions

- (PHAssetCreationMetadataCopyOptions)init
{
  PHAssetCreationMetadataCopyOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  result = -[PHAssetCreationMetadataCopyOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_shouldCopyTitleDescriptionAndKeywords = 0;
    result->_shouldCopyLocationData = 1;
  }
  return result;
}

- (PHAssetCreationMetadataCopyOptions)initWithXPCDict:(id)a3
{
  id v4;
  PHAssetCreationMetadataCopyOptions *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PHAssetCreationMetadataCopyOptions init](self, "init");
  if (v5)
  {
    xpc_dictionary_get_value(v4, "metadataCopyOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5->_shouldCopyTitleDescriptionAndKeywords = xpc_dictionary_get_BOOL(v6, "titleDescriptionAndKeywords");
      v5->_shouldCopySpatialOverCaptureResources = xpc_dictionary_get_BOOL(v7, "spatialOverCaptureResources");
      v5->_shouldCopyLocationData = xpc_dictionary_get_BOOL(v7, "shouldCopyLocationData");
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetCreationMetadataCopyOptions *v4;

  v4 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  -[PHAssetCreationMetadataCopyOptions setShouldCopyTitleDescriptionAndKeywords:](v4, "setShouldCopyTitleDescriptionAndKeywords:", self->_shouldCopyTitleDescriptionAndKeywords);
  -[PHAssetCreationMetadataCopyOptions setShouldCopySpatialOverCaptureResources:](v4, "setShouldCopySpatialOverCaptureResources:", self->_shouldCopySpatialOverCaptureResources);
  -[PHAssetCreationMetadataCopyOptions setShouldCopyLocationData:](v4, "setShouldCopyLocationData:", self->_shouldCopyLocationData);
  return v4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "metadataCopyOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "titleDescriptionAndKeywords", self->_shouldCopyTitleDescriptionAndKeywords);
  xpc_dictionary_set_BOOL(xdict, "spatialOverCaptureResources", self->_shouldCopySpatialOverCaptureResources);
  xpc_dictionary_set_BOOL(xdict, "shouldCopyLocationData", self->_shouldCopyLocationData);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  -[PHAssetCreationMetadataCopyOptions description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" shouldCopyTitleDescriptionAndKeywords=%d"), self->_shouldCopyTitleDescriptionAndKeywords);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" shouldCopySpatialOverCaptureResources=%d"), self->_shouldCopySpatialOverCaptureResources);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" shouldCopyLocationData=%d"), self->_shouldCopyLocationData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)plRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D71890]);
  copyPropertiesFromObjectAToObjectB(self, v3);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 shouldCopyTitleDescriptionAndKeywords;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 shouldCopySpatialOverCaptureResources;
  void *v9;
  _BOOL8 shouldCopyLocationData;
  id v11;

  shouldCopyTitleDescriptionAndKeywords = self->_shouldCopyTitleDescriptionAndKeywords;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", "titleDescriptionAndKeywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldCopyTitleDescriptionAndKeywords, v7);

  shouldCopySpatialOverCaptureResources = self->_shouldCopySpatialOverCaptureResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "spatialOverCaptureResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldCopySpatialOverCaptureResources, v9);

  shouldCopyLocationData = self->_shouldCopyLocationData;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldCopyLocationData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldCopyLocationData, v11);

}

- (PHAssetCreationMetadataCopyOptions)initWithCoder:(id)a3
{
  id v4;
  PHAssetCreationMetadataCopyOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHAssetCreationMetadataCopyOptions;
  v5 = -[PHAssetCreationMetadataCopyOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "titleDescriptionAndKeywords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldCopyTitleDescriptionAndKeywords = objc_msgSend(v4, "decodeBoolForKey:", v6);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "spatialOverCaptureResources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldCopySpatialOverCaptureResources = objc_msgSend(v4, "decodeBoolForKey:", v7);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldCopyLocationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldCopyLocationData = objc_msgSend(v4, "decodeBoolForKey:", v8);

  }
  return v5;
}

- (BOOL)shouldCopyTitleDescriptionAndKeywords
{
  return self->_shouldCopyTitleDescriptionAndKeywords;
}

- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3
{
  self->_shouldCopyTitleDescriptionAndKeywords = a3;
}

- (BOOL)shouldCopySpatialOverCaptureResources
{
  return self->_shouldCopySpatialOverCaptureResources;
}

- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3
{
  self->_shouldCopySpatialOverCaptureResources = a3;
}

- (BOOL)shouldCopyLocationData
{
  return self->_shouldCopyLocationData;
}

- (void)setShouldCopyLocationData:(BOOL)a3
{
  self->_shouldCopyLocationData = a3;
}

+ (id)metadataCopyOptionsForPublishingOriginals
{
  PHAssetCreationMetadataCopyOptions *v2;

  v2 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  -[PHAssetCreationMetadataCopyOptions setShouldCopyTitleDescriptionAndKeywords:](v2, "setShouldCopyTitleDescriptionAndKeywords:", 1);
  -[PHAssetCreationMetadataCopyOptions setShouldCopySpatialOverCaptureResources:](v2, "setShouldCopySpatialOverCaptureResources:", 1);
  -[PHAssetCreationMetadataCopyOptions setShouldCopyLocationData:](v2, "setShouldCopyLocationData:", 1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

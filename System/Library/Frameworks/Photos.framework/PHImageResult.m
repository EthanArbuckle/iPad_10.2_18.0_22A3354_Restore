@implementation PHImageResult

- (id)sanitizedInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHImageResult;
  -[PHCompositeMediaResult sanitizedInfoDictionary](&v7, sel_sanitizedInfoDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHImageResult isDegraded](self, "isDegraded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PHImageResultIsDegradedKey"));

  if (-[PHImageResult isPlaceholder](self, "isPlaceholder"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsPlaceholderKey"));
  if (-[PHImageResult isDerivedFromDeferredPreview](self, "isDerivedFromDeferredPreview"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultIsDerivedFromDeferredPreviewKey"));
  -[PHImageResult uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PHImageFileUTIKey"));

  return v3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return self->_isDerivedFromDeferredPreview;
}

- (id)allowedInfoKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PHImageResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  if (allowedInfoKeys_onceToken_15659 != -1)
    dispatch_once(&allowedInfoKeys_onceToken_15659, block);
  return (id)allowedInfoKeys_allowedKeys_15660;
}

- (void)setImageRef:(CGImage *)a3
{
  CGImageRetain(a3);
  CGImageRelease(self->_imageRef);
  self->_imageRef = a3;
}

- (void)setDegraded:(BOOL)a3
{
  self->_degraded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_exifOrientation, 0);
}

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (BOOL)isDegraded
{
  return self->_degraded;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setExifOrientation:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_exifOrientation, a3);
  if (v6)
  {
    -[NSNumber intValue](self->_exifOrientation, "intValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromExifOrientation());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", v5, CFSTR("PHImageFileOrientationKey"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->super._mutableInfo, "removeObjectForKey:", CFSTR("PHImageFileOrientationKey"));
  }

}

- (BOOL)containsValidData
{
  BOOL v2;
  void *v4;
  void *v5;

  if (self->_imageRef)
    return 1;
  -[PHImageResult imageURL](self, "imageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = 1;
  }
  else
  {
    -[PHImageResult imageData](self, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5 != 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PHImageResult;
  -[PHImageResult dealloc](&v3, sel_dealloc);
}

void __32__PHImageResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHImageResult;
  objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSet:", v3);

  v8[0] = CFSTR("PHImageResultIsDegradedKey");
  v8[1] = CFSTR("PHImageResultIsPlaceholderKey");
  v8[2] = CFSTR("PHImageFileURLKey");
  v8[3] = CFSTR("PHImageFileDataKey");
  v8[4] = CFSTR("PHImageFileOrientationKey");
  v8[5] = CFSTR("PHImageFileUTIKey");
  v8[6] = CFSTR("PHImageFileHighDynamicRangeGainMapKey");
  v8[7] = CFSTR("PHImageFileHighDynamicRangeGainMapOrientationKey");
  v8[8] = CFSTR("PHImageFileHighDynamicRangeGainMapValueKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)allowedInfoKeys_allowedKeys_15660;
  allowedInfoKeys_allowedKeys_15660 = (uint64_t)v4;

}

- (void)setHighDynamicRangeGainMap:(__CVBuffer *)a3 orientation:(unsigned int)a4 averagePixelLuminance:(id)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  objc_msgSend(v8, "numberWithUnsignedInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", v9, CFSTR("PHImageFileHighDynamicRangeGainMapOrientationKey"));

  v10 = (void *)objc_msgSend(MEMORY[0x1E0D75130], "createImageRefFromAuxiliaryImagePixelBuffer:applyingOrientation:scaleFactor:", a3, v5, 1.0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", v10, CFSTR("PHImageFileHighDynamicRangeGainMapKey"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", v11, CFSTR("PHImageFileHighDynamicRangeGainMapValueKey"));
}

- (void)setImageURL:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHImageFileURLKey"));
}

- (id)imageURL
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mutableInfo, "objectForKeyedSubscript:", CFSTR("PHImageFileURLKey"));
}

- (void)setImageData:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHImageFileDataKey"));
}

- (id)imageData
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mutableInfo, "objectForKeyedSubscript:", CFSTR("PHImageFileDataKey"));
}

- (int64_t)uiOrientation
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._mutableInfo, "objectForKeyedSubscript:", CFSTR("PHImageFileOrientationKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setIsDerivedFromDeferredPreview:(BOOL)a3
{
  self->_isDerivedFromDeferredPreview = a3;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (NSNumber)exifOrientation
{
  return self->_exifOrientation;
}

@end

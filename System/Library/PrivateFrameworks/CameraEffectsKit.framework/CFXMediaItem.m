@implementation CFXMediaItem

- (CFXMediaItem)init
{
  CFXMediaItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXMediaItem;
  result = -[CFXMediaItem init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_type = xmmword_226AB74B0;
    result->_cameraPosition = 0;
    result->_initializedWithoutSettingAllProperties = 1;
  }
  return result;
}

- (CFXMediaItem)initWithCameraMode:(int64_t)a3 clip:(id)a4 assetMediaURL:(id)a5 assetMetadataURL:(id)a6 cameraPosition:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  CFXMediaItem *v16;
  CFXMediaItem *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CFXMediaItem;
  v16 = -[CFXMediaItem init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_cameraMode = a3;
    objc_storeStrong((id *)&v16->_clip, a4);
    v17->_type = objc_msgSend(v13, "isVideo");
    objc_storeStrong((id *)&v17->_originalAssetURL, a5);
    objc_storeStrong((id *)&v17->_metadataURL, a6);
    v17->_cameraPosition = a7;
  }

  return v17;
}

- (CFXMediaItem)initWithType:(int64_t)a3 originalAssetURL:(id)a4 adjustmentsData:(id)a5
{
  id v9;
  id v10;
  CFXMediaItem *v11;
  CFXMediaItem *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CFXMediaItem;
  v11 = -[CFXMediaItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_originalAssetURL, a4);
    -[CFXMediaItem setAdjustmentsData:](v12, "setAdjustmentsData:", v10);
    if (!(v12->_cameraPosition | a3))
      -[CFXMediaItem CFX_updateCameraPositionForPhotoType](v12, "CFX_updateCameraPositionForPhotoType");
  }

  return v12;
}

- (NSData)adjustmentsData
{
  int64_t v3;
  void *v4;
  void *v5;
  CFXMediaItemAdjustmentsData *v6;
  void *v7;
  CFXMediaItemAdjustmentsData *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v3 = -[CFXMediaItem cameraMode](self, "cameraMode");
  -[CFXMediaItem clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [CFXMediaItemAdjustmentsData alloc];
  -[CFXMediaItem metadataURL](self, "metadataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CFXMediaItemAdjustmentsData initWithCameraMode:metadataURL:cameraPosition:effectStack:](v6, "initWithCameraMode:metadataURL:cameraPosition:effectStack:", v3, v7, -[CFXMediaItem cameraPosition](self, "cameraPosition"), v5);

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    JFXLog_core();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CFXMediaItem adjustmentsData].cold.1((uint64_t)v10, v11);

  }
  return (NSData *)v9;
}

- (void)setAdjustmentsData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSURL *v9;
  NSURL *metadataURL;
  void *v11;
  int64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  -[CFXMediaItem setAdjustmentsDataWasSet:](self, "setAdjustmentsDataWasSet:", 1);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1620];
    +[CFXMediaItemAdjustmentsData secureCodingClassWhitelist](CFXMediaItemAdjustmentsData, "secureCodingClassWhitelist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    self->_cameraMode = objc_msgSend(v7, "cameraMode");
    objc_msgSend(v7, "metadataURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    metadataURL = self->_metadataURL;
    self->_metadataURL = v9;

    self->_cameraPosition = objc_msgSend(v7, "cameraPosition");
    objc_msgSend(v7, "effectStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = -[CFXMediaItem type](self, "type");
  -[CFXMediaItem originalAssetURL](self, "originalAssetURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXMediaItem createClipForMediaType:assetURL:cameraMode:effectStack:](self, "createClipForMediaType:assetURL:cameraMode:effectStack:", v12, v13, -[CFXMediaItem cameraMode](self, "cameraMode"), v11);

}

- (void)setOriginalAssetURL:(id)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_originalAssetURL, a3);
  v5 = a3;
  v6 = -[CFXMediaItem type](self, "type");
  v7 = -[CFXMediaItem cameraMode](self, "cameraMode");
  -[CFXMediaItem clip](self, "clip");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXMediaItem createClipForMediaType:assetURL:cameraMode:effectStack:](self, "createClipForMediaType:assetURL:cameraMode:effectStack:", v6, v5, v7, v8);

}

- (void)setType:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id v8;

  self->_type = a3;
  -[CFXMediaItem originalAssetURL](self, "originalAssetURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CFXMediaItem cameraMode](self, "cameraMode");
  -[CFXMediaItem clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXMediaItem createClipForMediaType:assetURL:cameraMode:effectStack:](self, "createClipForMediaType:assetURL:cameraMode:effectStack:", a3, v8, v5, v7);

}

- (void)createClipForMediaType:(int64_t)a3 assetURL:(id)a4 cameraMode:(int64_t)a5 effectStack:(id)a6
{
  unint64_t v10;
  id v11;
  uint64_t v12;
  CFXClip *v13;
  CFXClip *clip;
  _QWORD v15[5];

  v10 = (unint64_t)a4;
  v11 = a6;
  if (v10 | (unint64_t)self->_clip)
  {
    if (!-[CFXMediaItem initializedWithoutSettingAllProperties](self, "initializedWithoutSettingAllProperties")
      || a3 != 2 && v10 && -[CFXMediaItem adjustmentsDataWasSet](self, "adjustmentsDataWasSet"))
    {
      v12 = JFXMaximumVideoDimensionForCameraMode(a5);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __71__CFXMediaItem_createClipForMediaType_assetURL_cameraMode_effectStack___block_invoke;
      v15[3] = &unk_24EE59BC0;
      v15[4] = self;
      +[CFXClip createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:](CFXClip, "createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:", v10, v11, a3 == 1, v12, v15);
      if (!self->_cameraPosition && !self->_type)
        -[CFXMediaItem CFX_updateCameraPositionForPhotoType](self, "CFX_updateCameraPositionForPhotoType");
    }
  }
  else
  {
    +[CFXClip createCaptureClip](CFXClip, "createCaptureClip");
    v13 = (CFXClip *)objc_claimAutoreleasedReturnValue();
    clip = self->_clip;
    self->_clip = v13;

    -[CFXClip addEffectStack:](self->_clip, "addEffectStack:", v11);
  }

}

void __71__CFXMediaItem_createClipForMediaType_assetURL_cameraMode_effectStack___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
}

- (void)CFX_updateCameraPositionForPhotoType
{
  CGImageSource *v3;
  CGImageSource *v4;
  CFDictionaryRef v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;

  v3 = CGImageSourceCreateWithURL((CFURLRef)self->_originalAssetURL, 0);
  if (v3)
  {
    v4 = v3;
    v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    if (v5)
    {
      v6 = *MEMORY[0x24BDD9470];
      v7 = *MEMORY[0x24BDD94D8];
      v8 = v5;
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsString:", CFSTR("front"));
      v12 = objc_msgSend(v10, "containsString:", CFSTR("back"));
      if (v11)
        v12 = 2;
      self->_cameraPosition = v12;
      CFRelease(v8);

    }
    CFRelease(v4);
  }
}

- (CFXClip)clip
{
  return self->_clip;
}

- (BOOL)initializedWithoutSettingAllProperties
{
  return self->_initializedWithoutSettingAllProperties;
}

- (void)setInitializedWithoutSettingAllProperties:(BOOL)a3
{
  self->_initializedWithoutSettingAllProperties = a3;
}

- (NSURL)adjustedAssetURL
{
  return self->_adjustedAssetURL;
}

- (void)setAdjustedAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)originalAssetURL
{
  return self->_originalAssetURL;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)adjustmentsDataWasSet
{
  return self->_adjustmentsDataWasSet;
}

- (void)setAdjustmentsDataWasSet:(BOOL)a3
{
  self->_adjustmentsDataWasSet = a3;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_originalAssetURL, 0);
  objc_storeStrong((id *)&self->_adjustedAssetURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

- (void)adjustmentsData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "Error encoding adjustments data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

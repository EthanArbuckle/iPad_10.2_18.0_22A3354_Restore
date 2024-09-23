@implementation AVAssetDownloadConfiguration

- (AVAssetDownloadConfiguration)initWithAsset:(id)a3 title:(id)a4
{
  AVAssetDownloadConfiguration *v7;
  AVAssetDownloadConfiguration *v8;
  uint64_t v9;
  __int128 v10;
  AVAssetDownloadDefaultAuxiliaryContentConfiguration *v11;
  AVAssetDownloadConfiguration *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  AVAssetDownloadConfiguration *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AVAssetDownloadConfiguration;
  v7 = -[AVAssetDownloadConfiguration init](&v24, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a4)
      {
        v7->_asset = (AVURLAsset *)a3;
        v8->_title = (NSString *)objc_msgSend(a4, "copy");
        v8->_primaryContentConfiguration = (AVAssetDownloadContentConfiguration *)objc_alloc_init(AVAssetDownloadDefaultPrimaryContentConfiguration);
        *(_WORD *)&v8->_optimizesAuxiliaryContentConfigurations = 1;
        v9 = MEMORY[0x1E0CA2E40];
        v10 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)&v8->_timeRange.start.value = *MEMORY[0x1E0CA2E40];
        *(_OWORD *)&v8->_timeRange.start.epoch = v10;
        *(_OWORD *)&v8->_timeRange.duration.timescale = *(_OWORD *)(v9 + 32);
        v11 = objc_alloc_init(AVAssetDownloadDefaultAuxiliaryContentConfiguration);
        v8->_auxiliaryContentConfigurations = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, 0);

        return v8;
      }
      v22 = v7;
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99778];
      v21 = "title != nil";
    }
    else
    {
      v13 = v7;
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99778];
      v21 = "asset != nil";
    }
    v23 = (void *)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)v21), 0);
    objc_exception_throw(v23);
  }
  return v8;
}

+ (AVAssetDownloadConfiguration)downloadConfigurationWithAsset:(AVURLAsset *)asset title:(NSString *)title
{
  return (AVAssetDownloadConfiguration *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:title:", asset, title);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadConfiguration;
  -[AVAssetDownloadConfiguration dealloc](&v3, sel_dealloc);
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(NSData *)artworkData
{
  objc_setProperty_nonatomic_copy(self, a2, artworkData, 24);
}

- (AVAssetDownloadContentConfiguration)primaryContentConfiguration
{
  return self->_primaryContentConfiguration;
}

- (NSArray)auxiliaryContentConfigurations
{
  return self->_auxiliaryContentConfigurations;
}

- (void)setAuxiliaryContentConfigurations:(NSArray *)auxiliaryContentConfigurations
{
  objc_setProperty_nonatomic_copy(self, a2, auxiliaryContentConfigurations, 40);
}

- (BOOL)optimizesAuxiliaryContentConfigurations
{
  return self->_optimizesAuxiliaryContentConfigurations;
}

- (void)setOptimizesAuxiliaryContentConfigurations:(BOOL)optimizesAuxiliaryContentConfigurations
{
  self->_optimizesAuxiliaryContentConfigurations = optimizesAuxiliaryContentConfigurations;
}

- (BOOL)downloadsInterstitialAssets
{
  return self->_downloadsInterstitialAssets;
}

- (void)setDownloadsInterstitialAssets:(BOOL)a3
{
  self->_downloadsInterstitialAssets = a3;
}

- (NSString)_assetTitle
{
  return self->_title;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (NSURL)_destinationURL
{
  return self->_destinationURL;
}

- (void)_setDestinationURL:(id)a3
{
  NSURL *v4;

  v4 = (NSURL *)objc_msgSend(a3, "copy");

  self->_destinationURL = v4;
}

- (AVURLAsset)_asset
{
  return self->_asset;
}

- (FigStreamingAssetDownloadConfig)_copyFigDownloadConfig
{
  __int128 v3;
  NSArray *auxiliaryContentConfigurations;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  FigStreamingAssetDownloadConfig *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  if (!FigStreamingAssetDownloadConfigCreate())
  {
    FigStreamingAssetDownloadConfigSetAssetNameAndImage();
    v3 = *(_OWORD *)&self->_timeRange.start.epoch;
    v14 = *(_OWORD *)&self->_timeRange.start.value;
    v15 = v3;
    v16 = *(_OWORD *)&self->_timeRange.duration.timescale;
    FigStreamingAssetDownloadConfigSetTimeRange();
    -[AVAssetDownloadContentConfiguration _serializeIntoDownloadConfig:asset:](self->_primaryContentConfiguration, "_serializeIntoDownloadConfig:asset:", v17, self->_asset);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    auxiliaryContentConfigurations = self->_auxiliaryContentConfigurations;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](auxiliaryContentConfigurations, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(auxiliaryContentConfigurations);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_serializeIntoDownloadConfig:asset:", v17, self->_asset);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](auxiliaryContentConfigurations, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      }
      while (v6);
    }
    FigStreamingAssetDownloadConfigSetOptimizesAuxiliaryContentConfigurations();
    FigStreamingAssetDownloadConfigSetDownloadsInterstitialAssets();
  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSURL *v11;
  id v12;
  const __CFAllocator *v13;
  __int128 v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  void *v17;
  CMTimeRange v18;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, v18.start.value), 0);
    objc_exception_throw(v17);
  }
  v11 = -[AVURLAsset URL](self->_asset, "URL");
  v12 = -[AVURLAsset _serializableCreationOptions](self->_asset, "_serializableCreationOptions");
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("assetURL"));
  objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("assetCreationOptions"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[AVURLAsset downloadToken](self->_asset, "downloadToken"), CFSTR("downloadToken"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_artworkData, CFSTR("artworkData"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_primaryContentConfiguration, CFSTR("primaryContentConfig"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_auxiliaryContentConfigurations, CFSTR("auxiliaryContentConfigs"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_destinationURL, CFSTR("destinationURL"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_optimizesAuxiliaryContentConfigurations, CFSTR("optimizesAuxiliaryContentConfigs"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_downloadsInterstitialAssets, CFSTR("downloadInterstitialAssets"));
  if ((self->_timeRange.start.flags & 1) != 0
    && (self->_timeRange.duration.flags & 1) != 0
    && !self->_timeRange.duration.epoch
    && (self->_timeRange.duration.value & 0x8000000000000000) == 0)
  {
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v14 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&v18.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&v18.start.epoch = v14;
    *(_OWORD *)&v18.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    v15 = CMTimeRangeCopyAsDictionary(&v18, v13);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("timeRange"));
      CFRelease(v16);
    }
  }
}

- (AVAssetDownloadConfiguration)initWithCoder:(id)a3
{
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  AVURLAsset *v10;
  AVURLAsset *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  AVAssetDownloadConfiguration *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  CMTimeRange v33;
  objc_super v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v25 = self;
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v26, v27, v28, v29, v30, v32), 0);
    objc_exception_throw(v31);
  }
  v34.receiver = self;
  v34.super_class = (Class)AVAssetDownloadConfiguration;
  v6 = -[AVAssetDownloadConfiguration init](&v34, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetURL"));
    v8 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetCreationOptions"));
    v9 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("downloadToken"));
    v10 = [AVURLAsset alloc];
    v35 = CFSTR("AVURLAssetDownloadTokenKey");
    v36[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
    v11 = -[AVURLAsset initWithURL:options:](v10, "initWithURL:options:", 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
    *((_QWORD *)v6 + 1) = v11;
    if (!v11 && v7)
    {
      v11 = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v7, objc_msgSend(v8, "creationOptions"));
      *((_QWORD *)v6 + 1) = v11;
    }
    if (v11)
    {
      *((_QWORD *)v6 + 2) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      *((_QWORD *)v6 + 3) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkData"));
      *((_QWORD *)v6 + 4) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryContentConfig"));
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      *((_QWORD *)v6 + 5) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0), CFSTR("auxiliaryContentConfigs"));
      *((_QWORD *)v6 + 12) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationURL"));
      v6[106] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("optimizesAuxiliaryContentConfigs"));
      v6[107] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("downloadInterstitialAssets"));
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0), CFSTR("timeRange"));
      v18 = v6 + 48;
      if (v17)
      {
        CMTimeRangeMakeFromDictionary(&v33, v17);
        v19 = *(_OWORD *)&v33.start.epoch;
        *v18 = *(_OWORD *)&v33.start.value;
        *((_OWORD *)v6 + 4) = v19;
        v20 = *(_OWORD *)&v33.duration.timescale;
      }
      else
      {
        v22 = MEMORY[0x1E0CA2E40];
        v23 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *v18 = *MEMORY[0x1E0CA2E40];
        *((_OWORD *)v6 + 4) = v23;
        v20 = *(_OWORD *)(v22 + 32);
      }
      *((_OWORD *)v6 + 5) = v20;
    }
    else
    {
      v21 = v6;
      return 0;
    }
  }
  return (AVAssetDownloadConfiguration *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

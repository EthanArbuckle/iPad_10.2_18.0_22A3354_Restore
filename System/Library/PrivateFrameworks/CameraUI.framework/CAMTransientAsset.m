@implementation CAMTransientAsset

- (CAMTransientAsset)initWithAsset:(id)a3 convertible:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CAMTransientAsset *v10;
  uint64_t v11;
  NSObject *v12;
  CAMTransientAsset *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    v7 = v6;
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAMTransientAsset initWithAsset:uuid:](self, "initWithAsset:uuid:", v6, v9);
  if (v10)
  {
    v11 = objc_msgSend(v6, "mediaType");
    if (!v11)
    {
      v11 = objc_msgSend(v8, "mediaType");
      v10->_mediaType = v11;
    }
    v10->_isTemporaryPlaceholder = objc_msgSend(v8, "isTransientAssetTemporaryPlaceholder");
    switch(v11)
    {
      case 0:
      case 3:
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 134217984;
          v16 = v11;
          _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to populate a transient asset for an unsupported media type %ld", (uint8_t *)&v15, 0xCu);
        }

        break;
      case 1:
        -[CAMTransientAsset _populateStillImageTransientAssetFromConvertible:](v10, "_populateStillImageTransientAssetFromConvertible:", v8);
        break;
      case 2:
        -[CAMTransientAsset _populateVideoTransientAssetFromConvertible:](v10, "_populateVideoTransientAssetFromConvertible:", v8);
        break;
      default:
        break;
    }
    v13 = v10;
  }

  return v10;
}

- (CAMTransientAsset)initWithAsset:(id)a3 uuid:(id)a4
{
  id v6;
  CAMTransientAsset *v7;
  double v8;
  uint64_t v9;
  NSDate *creationDate;
  uint64_t v11;
  NSDate *modificationDate;
  $95D729B680665BEAEFA1D6FCA8238556 *p_photoIrisStillDisplayTime;
  uint64_t v14;
  UIImage *placeholderImage;
  CAMTransientAsset *v16;
  __int128 v18;
  int64_t v19;

  v6 = a3;
  v7 = -[CAMTransientAsset initWithUUID:](self, "initWithUUID:", a4);
  if (v7)
  {
    v7->_mediaType = objc_msgSend(v6, "mediaType");
    v7->_mediaSubtypes = objc_msgSend(v6, "mediaSubtypes");
    v7->_pixelWidth = objc_msgSend(v6, "pixelWidth");
    v7->_pixelHeight = objc_msgSend(v6, "pixelHeight");
    objc_msgSend(v6, "duration");
    v7->_duration = v8;
    objc_msgSend(v6, "creationDate");
    v9 = objc_claimAutoreleasedReturnValue();
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v9;

    objc_msgSend(v6, "modificationDate");
    v11 = objc_claimAutoreleasedReturnValue();
    modificationDate = v7->_modificationDate;
    v7->_modificationDate = (NSDate *)v11;

    v7->_playbackVariation = objc_msgSend(v6, "playbackVariation");
    v7->_canPlayPhotoIris = objc_msgSend(v6, "canPlayPhotoIris");
    p_photoIrisStillDisplayTime = &v7->_photoIrisStillDisplayTime;
    if (v6)
    {
      objc_msgSend(v6, "photoIrisStillDisplayTime");
      *(_OWORD *)&p_photoIrisStillDisplayTime->value = v18;
      v7->_photoIrisStillDisplayTime.epoch = v19;
      objc_msgSend(v6, "photoIrisVideoDuration");
    }
    else
    {
      p_photoIrisStillDisplayTime->value = 0;
      *(_QWORD *)&v7->_photoIrisStillDisplayTime.timescale = 0;
      v7->_photoIrisStillDisplayTime.epoch = 0;
      v18 = 0uLL;
      v19 = 0;
    }
    *(_OWORD *)&v7->_photoIrisVideoDuration.value = v18;
    v7->_photoIrisVideoDuration.epoch = v19;
    objc_msgSend(v6, "placeholderImage");
    v14 = objc_claimAutoreleasedReturnValue();
    placeholderImage = v7->_placeholderImage;
    v7->_placeholderImage = (UIImage *)v14;

    v7->_isTemporaryPlaceholder = objc_msgSend(v6, "isTemporaryPlaceholder");
    v16 = v7;
  }

  return v7;
}

- (CAMTransientAsset)initWithUUID:(id)a3
{
  id v4;
  CAMTransientAsset *v5;
  uint64_t v6;
  NSString *uuid;
  CAMTransientAsset *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMTransientAsset;
  v5 = -[CAMTransientAsset init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_mediaType = 0;
    v8 = v5;
  }

  return v5;
}

- (void)_populateStillImageTransientAssetFromConvertible:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDate *v10;
  NSDate *localCreationDate;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  $95D729B680665BEAEFA1D6FCA8238556 *p_photoIrisStillDisplayTime;
  __int128 v22;
  int64_t v23;

  v4 = a3;
  objc_msgSend(v4, "finalExpectedPixelSize");
  self->_pixelWidth = (unint64_t)v5;
  objc_msgSend(v4, "finalExpectedPixelSize");
  self->_pixelHeight = (unint64_t)v6;
  objc_msgSend(v4, "captureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_creationDate, v7);
  objc_storeStrong((id *)&self->_modificationDate, v7);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "secondsFromGMTForDate:", v7);

  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)v9);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  localCreationDate = self->_localCreationDate;
  self->_localCreationDate = v10;

  objc_msgSend(v4, "burstIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfRepresentedAssets = objc_msgSend(v4, "numberOfRepresentedAssets");
  self->_representsBurst = v12 != 0;
  objc_storeStrong((id *)&self->_burstIdentifier, v12);
  v13 = self->_mediaSubtypes | objc_msgSend(v4, "mediaSubtypes");
  self->_mediaSubtypes = v13;
  self->_HDR = (v13 & 2) != 0;
  objc_msgSend(v4, "placeholderImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage size](self->_placeholderImage, "size");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v14, "size");
  if (v20 > v16 && v19 > v18)
    objc_storeStrong((id *)&self->_placeholderImage, v14);
  if (objc_msgSend(v4, "isExpectingPairedVideo"))
  {
    self->_canPlayPhotoIris = 1;
    self->_mediaSubtypes |= 8uLL;
    self->_isPhotoIrisPlaceholder = 1;
    p_photoIrisStillDisplayTime = &self->_photoIrisStillDisplayTime;
    if (v4)
    {
      objc_msgSend(v4, "irisStillDisplayTime");
      *(_OWORD *)&p_photoIrisStillDisplayTime->value = v22;
      self->_photoIrisStillDisplayTime.epoch = v23;
      objc_msgSend(v4, "duration");
    }
    else
    {
      p_photoIrisStillDisplayTime->value = 0;
      *(_QWORD *)&self->_photoIrisStillDisplayTime.timescale = 0;
      self->_photoIrisStillDisplayTime.epoch = 0;
      v22 = 0uLL;
      v23 = 0;
    }
    *(_OWORD *)&self->_photoIrisVideoDuration.value = v22;
    self->_photoIrisVideoDuration.epoch = v23;
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (int64_t)playbackStyle
{
  unint64_t v3;

  v3 = -[CAMTransientAsset mediaType](self, "mediaType");
  if (!v3 || v3 == 3)
    return 0;
  if (v3 != 1)
    return 4;
  if (-[CAMTransientAsset isLivePhoto](self, "isLivePhoto"))
    return 3;
  return 1;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (BOOL)canPlayPhotoIris
{
  return self->_canPlayPhotoIris;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (double)aspectRatio
{
  double v3;

  if (!-[CAMTransientAsset pixelHeight](self, "pixelHeight"))
    return 1.0;
  v3 = (double)-[CAMTransientAsset pixelWidth](self, "pixelWidth");
  return v3 / (double)-[CAMTransientAsset pixelHeight](self, "pixelHeight");
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (CLLocation)location
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (BOOL)isLivePhoto
{
  return -[CAMTransientAsset canPlayPhotoIris](self, "canPlayPhotoIris")
      || -[CAMTransientAsset isPhotoIrisPlaceholder](self, "isPhotoIrisPlaceholder");
}

- (unint64_t)deferredLogInfo
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAMTransientAsset *v4;
  void *v5;
  CAMTransientAsset *v6;

  v4 = [CAMTransientAsset alloc];
  -[CAMTransientAsset uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMTransientAsset initWithAsset:uuid:](v4, "initWithAsset:uuid:", self, v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMTransientAsset uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientAsset creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientAsset creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  -[CAMTransientAsset modificationDate](self, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientAsset modificationDate](self, "modificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;
  v14 = -[CAMTransientAsset representsBurst](self, "representsBurst");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YES, %ld frames"), -[CAMTransientAsset numberOfRepresentedAssets](self, "numberOfRepresentedAssets"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("NO");
  }
  -[CAMTransientAsset burstIdentifier](self, "burstIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid:%@ creationDate:%@ (%.6f) modificationDate:%@ (%.3f) burst:%@ burstIdentifier:%@>"), v4, v5, v6, v9, v10, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  return (NSString *)v17;
}

- (CAMTransientAsset)init
{
  -[CAMTransientAsset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMTransientAsset initWithUUID:](self, "initWithUUID:", &stru_1EA3325A0);
}

- (void)_populateVideoTransientAssetFromConvertible:(id)a3
{
  id v4;
  char v5;
  void *v6;
  UIImage *v7;
  UIImage *placeholderImage;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *persistenceURL;
  double v13;
  double v14;
  double height;
  double width;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  NSDate *v28;
  NSDate *modificationDate;
  NSDate *v30;
  NSString *burstIdentifier;
  CMTime time;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v4 = a3;
  v5 = objc_msgSend(v4, "isTransientAssetTemporaryPlaceholder");
  objc_msgSend(v4, "placeholderImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "placeholderImage");
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = v7;

  }
  objc_msgSend(v4, "persistenceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v5 & 1) == 0)
  {
    v11 = (NSURL *)objc_msgSend(v9, "copy");
    persistenceURL = self->_persistenceURL;
    self->_persistenceURL = v11;

  }
  objc_msgSend(v4, "finalExpectedPixelSize");
  if (v13 == 0.0 || (height = v14, v14 == 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = *MEMORY[0x1E0C9D538];
      v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v19, "naturalSize");
      v23 = v22;
      v25 = v24;
      objc_msgSend(v19, "preferredTransform");
      v34.origin.x = v20;
      v34.origin.y = v21;
      v34.size.width = v23;
      v34.size.height = v25;
      v35 = CGRectApplyAffineTransform(v34, &v33);
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      v36 = CGRectStandardize(v35);
      width = v36.size.width;
      height = v36.size.height;
    }
    else
    {
      -[UIImage size](self->_placeholderImage, "size");
      width = v26;
      height = v27;
    }

  }
  else
  {
    width = v13;
  }
  if (width > 0.0 && height > 0.0)
  {
    self->_pixelWidth = (unint64_t)width;
    self->_pixelHeight = (unint64_t)height;
  }
  if ((v5 & 1) == 0)
  {
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&time, 0, sizeof(time));
    self->_duration = CMTimeGetSeconds(&time);
  }
  objc_msgSend(v4, "captureDate");
  v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_creationDate, v28);
  modificationDate = self->_modificationDate;
  self->_modificationDate = v28;
  v30 = v28;

  self->_representsBurst = 0;
  burstIdentifier = self->_burstIdentifier;
  self->_burstIdentifier = 0;

  self->_numberOfRepresentedAssets = 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return self->_HDR;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  CAMTransientAsset *v4;
  CAMTransientAsset *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v4 = (CAMTransientAsset *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_14;
  -[CAMTransientAsset uuid](v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientAsset uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
  {
    v11 = v5 == 0;
    goto LABEL_15;
  }
  v9 = -[CAMTransientAsset mediaType](self, "mediaType");
  v10 = -[CAMTransientAsset canPlayPhotoIris](self, "canPlayPhotoIris");
  if (v9 == 2 || v10)
  {
    -[CAMTransientAsset persistenceURL](self, "persistenceURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_opt_respondsToSelector() & 1) == 0)
    {

    }
    else
    {
      -[CAMTransientAsset persistenceURL](v5, "persistenceURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_5;
    }
    if (-[CAMTransientAsset isTemporaryPlaceholder](self, "isTemporaryPlaceholder"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_5;
    }
LABEL_14:
    v11 = 2;
    goto LABEL_15;
  }
LABEL_5:
  v11 = 1;
LABEL_15:

  return v11;
}

- (NSDate)localCreationDate
{
  return self->_localCreationDate;
}

- (BOOL)isTemporaryPlaceholder
{
  return self->_isTemporaryPlaceholder;
}

- (BOOL)canPlayLoopingVideo
{
  return self->_canPlayLoopingVideo;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return self->_isPhotoIrisPlaceholder;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (BOOL)isHDR
{
  return self->_HDR;
}

- (BOOL)representsBurst
{
  return self->_representsBurst;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_numberOfRepresentedAssets;
}

@end

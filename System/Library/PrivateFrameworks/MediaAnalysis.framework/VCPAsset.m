@implementation VCPAsset

+ (void)unimplementedExceptionForMethodName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPAsset %@] should not be called"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("NotImplementedException"), v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)mediaType
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("mediaType"));
  return 0;
}

- (unint64_t)mediaSubtypes
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("mediaSubtypes"));
  return 0;
}

- (unint64_t)pixelWidth
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("pixelWidth"));
  return 0;
}

- (unint64_t)pixelHeight
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("pixelHeight"));
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (VCPFingerprint)fingerprint
{
  return 0;
}

- (BOOL)isImage
{
  return -[VCPAsset mediaType](self, "mediaType") == 1;
}

- (BOOL)isMovie
{
  return -[VCPAsset mediaType](self, "mediaType") == 2;
}

- (NSString)localIdentifier
{
  return 0;
}

- (NSURL)mainFileURL
{
  return 0;
}

- (NSArray)allScenes
{
  return 0;
}

- (NSDictionary)scenes
{
  return 0;
}

- (PHFetchResult)faces
{
  return 0;
}

- (id)typeDescription
{
  char v3;
  const __CFString *v4;
  const __CFString *v5;
  BOOL v6;
  unint64_t v7;

  if (-[VCPAsset mediaType](self, "mediaType") == 1)
  {
    if ((-[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 8) != 0)
      return CFSTR("Live Photo");
    if ((-[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 1) != 0)
      return CFSTR("Pano Photo");
    if ((-[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 4) != 0)
      return CFSTR("Screenshot");
    if ((-[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 2) != 0)
      return CFSTR("HDR Photo");
    v3 = -[VCPAsset mediaSubtypes](self, "mediaSubtypes");
    v4 = CFSTR("SDOF Photo");
    v5 = CFSTR("Photo");
    v6 = (v3 & 0x10) == 0;
  }
  else
  {
    if (-[VCPAsset mediaType](self, "mediaType") != 2)
      return CFSTR("Unknown");
    if ((-[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 0x20000) != 0)
      return CFSTR("Slow-mo Movie");
    v7 = -[VCPAsset mediaSubtypes](self, "mediaSubtypes");
    v4 = CFSTR("Timelapse Movie");
    v5 = CFSTR("Movie");
    v6 = (v7 & 0x40000) == 0;
  }
  if (v6)
    return (id)v5;
  else
    return (id)v4;
}

- (BOOL)isPano
{
  return -[VCPAsset mediaSubtypes](self, "mediaSubtypes") & 1;
}

- (BOOL)isLivePhoto
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 3) & 1;
}

- (BOOL)isScreenshot
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 2) & 1;
}

- (BOOL)isHDR
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 1) & 1;
}

- (BOOL)isSDOF
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 4) & 1;
}

- (NSDictionary)exif
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("exif"));
  return 0;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("imageWithPreferredDimension:"));
  return 0;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("imageWithPreferredDimension:orientation"));
  return 0;
}

- (BOOL)hadFlash
{
  void *v2;
  void *v3;
  char v4;

  -[VCPAsset exif](self, "exif");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "vcp_flashFired");
  else
    v4 = 0;

  return v4;
}

- (float)exposureTimeSeconds
{
  float v3;
  void *v4;
  void *v5;
  float v6;

  v3 = 0.0;
  if (-[VCPAsset isLivePhoto](self, "isLivePhoto"))
  {
    -[VCPAsset exif](self, "exif");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "vcp_scaledExposureTime");
      v3 = v6;
    }
    else
    {
      v3 = 0.0333;
    }

  }
  return v3;
}

- (float)photoOffsetSeconds
{
  _BOOL4 v2;
  float result;

  v2 = -[VCPAsset isLivePhoto](self, "isLivePhoto");
  result = 1.6;
  if (!v2)
    return 0.0;
  return result;
}

- (float)originalPhotoOffsetSeconds
{
  _BOOL4 v2;
  float result;

  v2 = -[VCPAsset isLivePhoto](self, "isLivePhoto");
  result = 1.6;
  if (!v2)
    return 0.0;
  return result;
}

- (BOOL)isSlowmo
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 17) & 1;
}

- (BOOL)isTimelapse
{
  return (-[VCPAsset mediaSubtypes](self, "mediaSubtypes") >> 18) & 1;
}

- (BOOL)isShortMovie
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("isShortMovie"));
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (float)slowmoRate
{
  return 1.0;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)slomoRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (float)timelapseRate
{
  _BOOL4 v2;
  float result;

  v2 = -[VCPAsset isTimelapse](self, "isTimelapse");
  result = 0.66667;
  if (!v2)
    return 1.0;
  return result;
}

- (id)movie
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("movie:"));
  return 0;
}

- (BOOL)isMovieResourceLocalAvailable
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("isMovieResourceLocalAvailable:"));
  return 0;
}

- (id)streamedMovie:(BOOL)a3
{
  return 0;
}

- (id)originalMovie
{
  objc_msgSend((id)objc_opt_class(), "unimplementedExceptionForMethodName:", CFSTR("originalMovie:"));
  return 0;
}

- (CGSize)originalMovieSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end

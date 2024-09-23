@implementation AVMomentCaptureMovieRecordingResolvedSettings

+ (AVMomentCaptureMovieRecordingResolvedSettings)movieRecordingResolvedSettingsWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7
{
  return (AVMomentCaptureMovieRecordingResolvedSettings *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", a3, a4, a5, a6, a7);
}

- (id)_initWithUniqueID:(int64_t)a3 torchEnabled:(BOOL)a4 movieURL:(id)a5 spatialOverCaptureURL:(id)a6 movieDimensions:(id)a7
{
  AVMomentCaptureMovieRecordingResolvedSettings *v12;
  AVMomentCaptureMovieRecordingResolvedSettings *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMomentCaptureMovieRecordingResolvedSettings;
  v12 = -[AVMomentCaptureMovieRecordingResolvedSettings init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_uniqueID = a3;
    v12->_torchEnabled = a4;
    v12->_movieURL = (NSURL *)objc_msgSend(a5, "copy");
    v13->_spatialOverCaptureURL = (NSURL *)objc_msgSend(a6, "copy");
    v13->_movieDimensions = ($470D365275581EF16070F5A11344F73E)a7;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRecordingResolvedSettings;
  -[AVMomentCaptureMovieRecordingResolvedSettings dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uid:%lld torch:%d dims:%dx%d url:%@ socurl:%@"), self->_uniqueID, self->_torchEnabled, self->_movieDimensions.width, self->_movieDimensions.height, -[NSURL lastPathComponent](self->_movieURL, "lastPathComponent"), -[NSURL lastPathComponent](self->_spatialOverCaptureURL, "lastPathComponent"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVMomentCaptureMovieRecordingResolvedSettings debugDescription](self, "debugDescription"));
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)isTorchEnabled
{
  return self->_torchEnabled;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (NSURL)spatialOverCaptureURL
{
  return self->_spatialOverCaptureURL;
}

- ($2825F4736939C4A6D3AD43837233062D)movieDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_movieDimensions, 8, 1, 0);
  return dest;
}

@end

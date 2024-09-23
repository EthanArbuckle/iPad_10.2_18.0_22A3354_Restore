@implementation CAMVideoCaptureResponse

- (CAMVideoCaptureResponse)initWithUUID:(id)a3 captureMode:(int64_t)a4 captureSession:(unsigned __int16)a5 url:(id)a6 captureDate:(id)a7 duration:(id *)a8 stillPersistenceUUID:(id)a9 stillDisplayTime:(id *)a10 reason:(int64_t)a11 videoZoomFactor:(double)a12 finalExpectedPixelSize:(CGSize)a13 imageWellImage:(id)a14 previewImage:(id)a15 coordinationInfo:(id)a16 slowWriterFrameDrops:(BOOL)a17
{
  CGFloat height;
  CGFloat width;
  uint64_t v23;
  id v26;
  id v27;
  CAMVideoCaptureResponse *v28;
  CAMVideoCaptureResponse *v29;
  uint64_t v30;
  NSString *persistenceUUID;
  uint64_t v32;
  NSURL *localPersistenceURL;
  int64_t var3;
  uint64_t v35;
  NSString *stillPersistenceUUID;
  int64_t v37;
  CAMVideoCaptureResponse *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  height = a13.height;
  width = a13.width;
  v23 = a5;
  v43 = a3;
  v26 = a6;
  v42 = a7;
  v27 = a9;
  v41 = a14;
  v40 = a15;
  v44.receiver = self;
  v44.super_class = (Class)CAMVideoCaptureResponse;
  v28 = -[CAMCaptureResponse initWithType:captureSession:coordinationInfo:](&v44, sel_initWithType_captureSession_coordinationInfo_, 1, v23, a16);
  v29 = v28;
  if (v28)
  {
    v28->_captureMode = a4;
    v30 = objc_msgSend(v43, "copy");
    persistenceUUID = v29->_persistenceUUID;
    v29->_persistenceUUID = (NSString *)v30;

    v32 = objc_msgSend(v26, "copy");
    localPersistenceURL = v29->_localPersistenceURL;
    v29->_localPersistenceURL = (NSURL *)v32;

    objc_storeStrong((id *)&v29->_captureDate, a7);
    var3 = a8->var3;
    *(_OWORD *)&v29->_duration.value = *(_OWORD *)&a8->var0;
    v29->_duration.epoch = var3;
    v35 = objc_msgSend(v27, "copy");
    stillPersistenceUUID = v29->_stillPersistenceUUID;
    v29->_stillPersistenceUUID = (NSString *)v35;

    v37 = a10->var3;
    *(_OWORD *)&v29->_stillDisplayTime.value = *(_OWORD *)&a10->var0;
    v29->_stillDisplayTime.epoch = v37;
    v29->_reason = a11;
    v29->_videoZoomFactor = a12;
    v29->_finalExpectedPixelSize.width = width;
    v29->_finalExpectedPixelSize.height = height;
    objc_storeStrong((id *)&v29->_imageWellImage, a14);
    objc_storeStrong((id *)&v29->_previewImage, a15);
    v29->_slowWriterFrameDrops = a17;
    v38 = v29;
  }

  return v29;
}

- (BOOL)stoppedUnexpectedly
{
  return -[CAMVideoCaptureResponse reason](self, "reason") != 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMVideoCaptureResponse persistenceUUID](self, "persistenceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMCaptureResponse sessionIdentifier](self, "sessionIdentifier");
  -[CAMVideoCaptureResponse captureDate](self, "captureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoCaptureResponse captureDate](self, "captureDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;
  -[CAMVideoCaptureResponse localPersistenceURL](self, "localPersistenceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ persistenceUUID:%@ sessionIdentifier:%d, captureDate:%@ (%.3f), localPersistenceURL:%@>"), v4, v5, v6, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)mediaType
{
  return 2;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (NSString)uuid
{
  return self->_persistenceUUID;
}

- (NSURL)persistenceURL
{
  return self->_localPersistenceURL;
}

- (UIImage)placeholderImage
{
  return self->_imageWellImage;
}

- (NSDictionary)stillImageMetadata
{
  return 0;
}

- (NSString)burstIdentifier
{
  return 0;
}

- (unint64_t)numberOfRepresentedAssets
{
  return 0;
}

- (BOOL)isTransientAssetTemporaryPlaceholder
{
  return -[CAMVideoCaptureResponse captureMode](self, "captureMode") == 7;
}

- (NSString)irisStillImageUUID
{
  return self->_stillPersistenceUUID;
}

- (BOOL)isExpectingPairedVideo
{
  return 0;
}

- (NSURL)irisVideoPersistenceURL
{
  return self->_localPersistenceURL;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (CGSize)finalExpectedPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_finalExpectedPixelSize.width;
  height = self->_finalExpectedPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSURL)localPersistenceURL
{
  return self->_localPersistenceURL;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (int64_t)reason
{
  return self->_reason;
}

- (BOOL)slowWriterFrameDrops
{
  return self->_slowWriterFrameDrops;
}

- (double)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (UIImage)imageWellImage
{
  return self->_imageWellImage;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSString)stillPersistenceUUID
{
  return self->_stillPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_imageWellImage, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_localPersistenceURL, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

@end

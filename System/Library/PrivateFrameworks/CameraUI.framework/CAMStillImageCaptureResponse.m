@implementation CAMStillImageCaptureResponse

- (UIImage)imageWellImage
{
  return self->_imageWellImage;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSString)uuid
{
  return self->_persistenceUUID;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)mediaType
{
  return 1;
}

- (NSDictionary)stillImageMetadata
{
  return self->_metadata;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_burstRepresentedCount;
}

- (unint64_t)mediaSubtypes
{
  void *v3;
  int v4;
  unint64_t v5;

  -[CAMCaptureResponse coordinationInfo](self, "coordinationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHDR");

  if (v4)
    v5 = 2;
  else
    v5 = 0;
  if (-[CAMStillImageCaptureResponse isExpectingPairedVideo](self, "isExpectingPairedVideo"))
    return v5 | 8;
  else
    return v5;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (UIImage)placeholderImage
{
  return self->_imageWellImage;
}

- (BOOL)flashFired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  -[CAMStillImageCaptureResponse metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CBCB88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "unsignedShortValue") & 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAnalysisImage, 0);
  objc_storeStrong((id *)&self->_imageWellImage, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

- (CAMStillImageCaptureResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 captureDate:(id)a5 metadata:(id)a6 burstIdentifier:(id)a7 burstRepresentedCount:(unint64_t)a8 imageWellImage:(id)a9 textAnalysisImage:(id)a10 coordinationInfo:(id)a11 finalExpectedPixelSize:(CGSize)a12 expectingPairedVideo:(BOOL)a13 captureID:(int64_t)a14 semanticEnhanceScene:(int64_t)a15
{
  CGFloat height;
  CGFloat width;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  id v25;
  CAMStillImageCaptureResponse *v26;
  uint64_t v27;
  NSString *persistenceUUID;
  uint64_t v29;
  NSDictionary *metadata;
  uint64_t v31;
  NSString *burstIdentifier;
  CAMStillImageCaptureResponse *v33;
  id v36;
  id v37;
  objc_super v38;

  height = a12.height;
  width = a12.width;
  v20 = a4;
  v22 = a3;
  v37 = a5;
  v23 = a6;
  v24 = a7;
  v36 = a9;
  v25 = a10;
  v38.receiver = self;
  v38.super_class = (Class)CAMStillImageCaptureResponse;
  v26 = -[CAMCaptureResponse initWithType:captureSession:coordinationInfo:](&v38, sel_initWithType_captureSession_coordinationInfo_, 0, v20, a11);
  if (v26)
  {
    v27 = objc_msgSend(v22, "copy");
    persistenceUUID = v26->_persistenceUUID;
    v26->_persistenceUUID = (NSString *)v27;

    objc_storeStrong((id *)&v26->_captureDate, a5);
    v29 = objc_msgSend(v23, "copy");
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v29;

    v31 = objc_msgSend(v24, "copy");
    burstIdentifier = v26->_burstIdentifier;
    v26->_burstIdentifier = (NSString *)v31;

    v26->_burstRepresentedCount = a8;
    objc_storeStrong((id *)&v26->_imageWellImage, a9);
    objc_storeStrong((id *)&v26->_textAnalysisImage, a10);
    v26->_expectingPairedVideo = a13;
    v26->_finalExpectedPixelSize.width = width;
    v26->_finalExpectedPixelSize.height = height;
    v26->_captureID = a14;
    v26->_semanticEnhanceScene = a15;
    v33 = v26;
  }

  return v26;
}

- (NSString)description
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (self->_burstIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YES, %ld frames"), self->_burstRepresentedCount);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("NO");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[CAMStillImageCaptureResponse captureID](self, "captureID");
  -[CAMStillImageCaptureResponse persistenceUUID](self, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMCaptureResponse sessionIdentifier](self, "sessionIdentifier");
  -[CAMStillImageCaptureResponse captureDate](self, "captureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStillImageCaptureResponse captureDate](self, "captureDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;
  -[CAMStillImageCaptureResponse burstIdentifier](self, "burstIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ captureID:%lld persistenceUUID:%@ sessionIdentifier:%d, captureDate:%@ (%.3f), burst:%@, burstIdentifier:%@>"), v5, v6, v7, v8, v9, v12, v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (NSURL)persistenceURL
{
  return 0;
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (NSString)irisStillImageUUID
{
  return 0;
}

- (NSURL)irisVideoPersistenceURL
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (BOOL)isTransientAssetTemporaryPlaceholder
{
  return 0;
}

- (unint64_t)burstRepresentedCount
{
  return self->_burstRepresentedCount;
}

- (UIImage)textAnalysisImage
{
  return self->_textAnalysisImage;
}

- (int64_t)captureID
{
  return self->_captureID;
}

- (int64_t)semanticEnhanceScene
{
  return self->_semanticEnhanceScene;
}

@end

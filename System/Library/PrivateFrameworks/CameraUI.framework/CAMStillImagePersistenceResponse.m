@implementation CAMStillImagePersistenceResponse

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (NSDictionary)stillImageMetadata
{
  return self->_metadata;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_burstRepresentedCount;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (CAMStillImagePersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 finalExpectedPixelSize:(CGSize)a8 metadata:(id)a9 burstIdentifier:(id)a10 burstRepresentedCount:(unint64_t)a11 expectingPairedVideo:(BOOL)a12 coordinationInfo:(id)a13
{
  double height;
  double width;
  uint64_t v18;
  id v21;
  id v22;
  CAMStillImagePersistenceResponse *v23;
  uint64_t v24;
  NSDictionary *metadata;
  uint64_t v26;
  NSString *burstIdentifier;
  CAMStillImagePersistenceResponse *v28;
  objc_super v30;

  height = a8.height;
  width = a8.width;
  v18 = a4;
  v21 = a9;
  v22 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CAMStillImagePersistenceResponse;
  v23 = -[CAMPersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:pixelSize:coordinationInfo:](&v30, sel_initWithUUID_captureSession_url_creationDate_scrubberImage_pixelSize_coordinationInfo_, a3, v18, a5, a6, a7, a13, width, height);
  if (v23)
  {
    v24 = objc_msgSend(v21, "copy");
    metadata = v23->_metadata;
    v23->_metadata = (NSDictionary *)v24;

    v26 = objc_msgSend(v22, "copy");
    burstIdentifier = v23->_burstIdentifier;
    v23->_burstIdentifier = (NSString *)v26;

    v23->_burstRepresentedCount = a11;
    v23->_expectingPairedVideo = a12;
    v28 = v23;
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  -[CAMStillImagePersistenceResponse burstIdentifier](self, "burstIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("YES, %ld frames"), -[CAMStillImagePersistenceResponse burstRepresentedCount](self, "burstRepresentedCount"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("NO");
  }

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[CAMPersistenceResponse persistenceUUID](self, "persistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMPersistenceResponse sessionIdentifier](self, "sessionIdentifier");
  -[CAMPersistenceResponse creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceResponse creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;
  -[CAMPersistenceResponse persistenceURL](self, "persistenceURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceResponse coordinationInfo](self, "coordinationInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ persistenceUUID:%@ sessionIdentifier:%d burst:%@ creationDate:%@ (%.3f) persistenceURL:%@ coordinationInfo:%@>"), v6, v7, v8, v4, v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (unint64_t)mediaType
{
  return 1;
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

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (unint64_t)burstRepresentedCount
{
  return self->_burstRepresentedCount;
}

@end

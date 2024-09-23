@implementation CAMPersistenceResponse

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UIImage)scrubberImage
{
  return self->_scrubberImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_scrubberImage, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
}

- (CAMPersistenceResponse)initWithUUID:(id)a3 captureSession:(unsigned __int16)a4 url:(id)a5 creationDate:(id)a6 scrubberImage:(id)a7 pixelSize:(CGSize)a8 coordinationInfo:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CAMPersistenceResponse *v22;
  uint64_t v23;
  NSString *persistenceUUID;
  uint64_t v25;
  NSURL *persistenceURL;
  CAMPersistenceResponse *v27;
  objc_super v29;

  height = a8.height;
  width = a8.width;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CAMPersistenceResponse;
  v22 = -[CAMPersistenceResponse init](&v29, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v17, "copy");
    persistenceUUID = v22->_persistenceUUID;
    v22->_persistenceUUID = (NSString *)v23;

    v22->_sessionIdentifier = a4;
    v25 = objc_msgSend(v18, "copy");
    persistenceURL = v22->_persistenceURL;
    v22->_persistenceURL = (NSURL *)v25;

    objc_storeStrong((id *)&v22->_creationDate, a6);
    objc_storeStrong((id *)&v22->_scrubberImage, a7);
    v22->_pixelSize.width = width;
    v22->_pixelSize.height = height;
    objc_storeStrong((id *)&v22->_coordinationInfo, a9);
    v27 = v22;
  }

  return v22;
}

- (id)description
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
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMPersistenceResponse persistenceUUID](self, "persistenceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMPersistenceResponse sessionIdentifier](self, "sessionIdentifier");
  -[CAMPersistenceResponse creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceResponse creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;
  -[CAMPersistenceResponse persistenceURL](self, "persistenceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPersistenceResponse coordinationInfo](self, "coordinationInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ persistenceUUID:%@ sessionIdentifier:%d creationDate:%@ (%.3f) persistenceURL:%@ coordinationInfo:%@>"), v4, v5, v6, v7, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

@end

@implementation CAMCaptureRequest

- (CAMCaptureRequest)initWithType:(int64_t)a3
{
  CAMCaptureRequest *v4;
  CAMCaptureRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *persistenceUUID;
  CAMCaptureRequest *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMCaptureRequest;
  v4 = -[CAMCaptureRequest init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_captureDevice = 0;
    v4->_captureMode = 0;
    v4->_captureOrientation = 1;
    v4->_captureMirrored = 0;
    v4->_pressType = -1;
    v4->_origin = 0;
    v4->_deferredPersistenceOptions = 0;
    v4->_temporaryPersistenceOptions = 0;
    v4->_persistenceOptions = 2;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    persistenceUUID = v5->_persistenceUUID;
    v5->_persistenceUUID = (NSString *)v7;

    *(_WORD *)&v5->_shouldExtractDiagnosticsFromMetadata = 257;
    v5->_shouldDelayRemotePersistence = 0;
    v5->_audioConfiguration = 0;
    v9 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (int64_t)origin
{
  return self->_origin;
}

- (int64_t)videoEncodingBehavior
{
  return self->_videoEncodingBehavior;
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (unint64_t)deferredPersistenceOptions
{
  return self->_deferredPersistenceOptions;
}

- (int64_t)temporaryPersistenceOptions
{
  return self->_temporaryPersistenceOptions;
}

- (BOOL)shouldExtractDiagnosticsFromMetadata
{
  return self->_shouldExtractDiagnosticsFromMetadata;
}

- (BOOL)shouldPersistDiagnosticsToSidecar
{
  return self->_shouldPersistDiagnosticsToSidecar;
}

- (BOOL)shouldDelayRemotePersistence
{
  return self->_shouldDelayRemotePersistence;
}

- (CLLocation)location
{
  return self->_location;
}

- (CLHeading)heading
{
  return self->_heading;
}

- (BOOL)capturedFromPhotoBooth
{
  return self->_capturedFromPhotoBooth;
}

- (unsigned)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (BOOL)shouldPersistToIncomingDirectory
{
  return objc_msgSend((id)objc_opt_class(), "shouldPersistToIncomingDirectoryWithPersistenceOptions:temporaryPersistenceOptions:", -[CAMCaptureRequest persistenceOptions](self, "persistenceOptions"), -[CAMCaptureRequest temporaryPersistenceOptions](self, "temporaryPersistenceOptions"));
}

+ (BOOL)shouldPersistToIncomingDirectoryWithPersistenceOptions:(int64_t)a3 temporaryPersistenceOptions:(int64_t)a4
{
  return (a4 | 2) == 2 && a3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_sharedLibraryDiagnostics, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
}

- (BOOL)shouldProtectPersistence
{
  return -[CAMCaptureRequest persistenceOptions](self, "persistenceOptions") == 2;
}

- (CAMCaptureRequest)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Instances of CAMCaptureRequest must be initialized with -initWithType:"));

  return 0;
}

- (CAMCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CAMCaptureRequest *v9;
  uint64_t v10;
  NSURL *localDestinationURL;
  void *v12;
  uint64_t v13;
  NSString *persistenceUUID;
  uint64_t v15;
  uint64_t v16;
  CLLocation *location;
  uint64_t v18;
  CLHeading *heading;
  uint64_t v20;
  NSArray *contactIDsInProximity;
  uint64_t v22;
  NSDictionary *sharedLibraryDiagnostics;
  void *v24;
  CAMAnalyticsCaptureEvent *v25;
  void *v26;
  uint64_t v27;
  CAMAnalyticsCaptureEvent *analyticsEvent;
  CAMCaptureRequest *v29;
  objc_super v31;

  v5 = a5;
  v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CAMCaptureRequest;
  v9 = -[CAMCaptureRequest init](&v31, sel_init);
  if (v9)
  {
    v9->_type = objc_msgSend(v8, "type");
    v9->_captureDevice = objc_msgSend(v8, "captureDevice");
    v9->_captureMode = objc_msgSend(v8, "captureMode");
    v9->_captureOrientation = objc_msgSend(v8, "captureOrientation");
    v9->_captureMirrored = objc_msgSend(v8, "isCaptureMirrored");
    v9->_pressType = objc_msgSend(v8, "pressType");
    v9->_origin = objc_msgSend(v8, "origin");
    v9->_videoEncodingBehavior = objc_msgSend(v8, "videoEncodingBehavior");
    v9->_photoEncodingBehavior = objc_msgSend(v8, "photoEncodingBehavior");
    objc_msgSend(v8, "localDestinationURL");
    v10 = objc_claimAutoreleasedReturnValue();
    localDestinationURL = v9->_localDestinationURL;
    v9->_localDestinationURL = (NSURL *)v10;

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = objc_claimAutoreleasedReturnValue();
      persistenceUUID = v9->_persistenceUUID;
      v9->_persistenceUUID = (NSString *)v13;

    }
    else
    {
      objc_msgSend(v8, "persistenceUUID");
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = v9->_persistenceUUID;
      v9->_persistenceUUID = (NSString *)v15;
    }

    v9->_sessionIdentifier = objc_msgSend(v8, "sessionIdentifier");
    v9->_persistenceOptions = objc_msgSend(v8, "persistenceOptions");
    v9->_deferredPersistenceOptions = objc_msgSend(v8, "deferredPersistenceOptions");
    v9->_temporaryPersistenceOptions = objc_msgSend(v8, "temporaryPersistenceOptions");
    v9->_shouldExtractDiagnosticsFromMetadata = objc_msgSend(v8, "shouldExtractDiagnosticsFromMetadata");
    v9->_shouldPersistDiagnosticsToSidecar = objc_msgSend(v8, "shouldPersistDiagnosticsToSidecar");
    v9->_shouldDelayRemotePersistence = objc_msgSend(v8, "shouldDelayRemotePersistence");
    objc_msgSend(v8, "location");
    v16 = objc_claimAutoreleasedReturnValue();
    location = v9->_location;
    v9->_location = (CLLocation *)v16;

    objc_msgSend(v8, "heading");
    v18 = objc_claimAutoreleasedReturnValue();
    heading = v9->_heading;
    v9->_heading = (CLHeading *)v18;

    v9->_capturedFromPhotoBooth = objc_msgSend(v8, "capturedFromPhotoBooth");
    v9->_assertionIdentifier = objc_msgSend(v8, "assertionIdentifier");
    objc_msgSend(v8, "contactIDsInProximity");
    v20 = objc_claimAutoreleasedReturnValue();
    contactIDsInProximity = v9->_contactIDsInProximity;
    v9->_contactIDsInProximity = (NSArray *)v20;

    v9->_sharedLibraryMode = objc_msgSend(v8, "sharedLibraryMode");
    objc_msgSend(v8, "sharedLibraryDiagnostics");
    v22 = objc_claimAutoreleasedReturnValue();
    sharedLibraryDiagnostics = v9->_sharedLibraryDiagnostics;
    v9->_sharedLibraryDiagnostics = (NSDictionary *)v22;

    v9->_audioConfiguration = objc_msgSend(v8, "audioConfiguration");
    if (v5)
    {
      objc_msgSend(v8, "analyticsEvent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = [CAMAnalyticsCaptureEvent alloc];
        objc_msgSend(v8, "analyticsEvent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[CAMAnalyticsCaptureEvent initWithEvent:](v25, "initWithEvent:", v26);
        analyticsEvent = v9->_analyticsEvent;
        v9->_analyticsEvent = (CAMAnalyticsCaptureEvent *)v27;

      }
    }
    v29 = v9;
  }

  return v9;
}

- (int64_t)captureDevicePosition
{
  int64_t v2;

  v2 = -[CAMCaptureRequest captureDevice](self, "captureDevice");
  if ((unint64_t)(v2 - 1) > 0xA)
    return 0;
  else
    return qword_1DB9A6B20[v2 - 1];
}

- (id)distinctPersistenceCopy
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequest:distinctPersistence:includeAnalytics:", self, 1, 0);
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (CAMAnalyticsCaptureEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (NSDictionary)sharedLibraryDiagnostics
{
  return self->_sharedLibraryDiagnostics;
}

- (int64_t)rawFileFormatBehavior
{
  return self->_rawFileFormatBehavior;
}

@end

@implementation CAMMutablePanoramaCaptureRequest

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CAMPanoramaCaptureRequest initWithRequest:distinctPersistence:includeAnalytics:]([CAMPanoramaCaptureRequest alloc], "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequest:distinctPersistence:includeAnalytics:", self, 0, 1);
}

- (CAMAnalyticsCaptureEvent)analyticsEvent
{
  return self->super.super._analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  CAMAnalyticsCaptureEvent *v5;
  CAMAnalyticsCaptureEvent *v6;

  v5 = (CAMAnalyticsCaptureEvent *)a3;
  if (self->super.super._analyticsEvent != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super.super._analyticsEvent, a3);
    v5 = v6;
  }

}

- (void)setDelegate:(id)a3
{
  CAMPanoramaCaptureRequestDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->super._delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)setCaptureOrientation:(int64_t)a3
{
  if (self->super.super._captureOrientation != a3)
    self->super.super._captureOrientation = a3;
}

- (void)setCaptureDevice:(int64_t)a3
{
  if (self->super.super._captureDevice != a3)
    self->super.super._captureDevice = a3;
}

- (void)setCaptureMode:(int64_t)a3
{
  if (self->super.super._captureMode != a3)
    self->super.super._captureMode = a3;
}

- (void)setPressType:(int64_t)a3
{
  if (self->super.super._pressType != a3)
    self->super.super._pressType = a3;
}

- (void)setSessionIdentifier:(unsigned __int16)a3
{
  if (self->super.super._sessionIdentifier != a3)
    self->super.super._sessionIdentifier = a3;
}

- (void)setPersistenceUUID:(id)a3
{
  NSString *v4;
  NSString *persistenceUUID;

  if (self->super.super._persistenceUUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    persistenceUUID = self->super.super._persistenceUUID;
    self->super.super._persistenceUUID = v4;

  }
}

- (void)setPersistenceOptions:(int64_t)a3
{
  if (self->super.super._persistenceOptions != a3)
    self->super.super._persistenceOptions = a3;
}

- (void)setDeferredPersistenceOptions:(unint64_t)a3
{
  if (self->super.super._deferredPersistenceOptions != a3)
    self->super.super._deferredPersistenceOptions = a3;
}

- (void)setTemporaryPersistenceOptions:(int64_t)a3
{
  if (self->super.super._temporaryPersistenceOptions != a3)
    self->super.super._temporaryPersistenceOptions = a3;
}

- (void)setLocalDestinationURL:(id)a3
{
  NSURL **p_localDestinationURL;
  id v5;

  p_localDestinationURL = &self->super.super._localDestinationURL;
  v5 = a3;
  if ((-[NSURL isEqual:](*p_localDestinationURL, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_localDestinationURL, a3);

}

- (void)setShouldExtractDiagnosticsFromMetadata:(BOOL)a3
{
  if (self->super.super._shouldExtractDiagnosticsFromMetadata != a3)
    self->super.super._shouldExtractDiagnosticsFromMetadata = a3;
}

- (void)setShouldPersistDiagnosticsToSidecar:(BOOL)a3
{
  if (self->super.super._shouldPersistDiagnosticsToSidecar != a3)
    self->super.super._shouldPersistDiagnosticsToSidecar = a3;
}

- (void)setShouldDelayRemotePersistence:(BOOL)a3
{
  if (self->super.super._shouldDelayRemotePersistence != a3)
    self->super.super._shouldDelayRemotePersistence = a3;
}

- (void)setLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *v6;

  v5 = (CLLocation *)a3;
  if (self->super.super._location != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super.super._location, a3);
    v5 = v6;
  }

}

- (void)setHeading:(id)a3
{
  CLHeading *v5;
  CLHeading *v6;

  v5 = (CLHeading *)a3;
  if (self->super.super._heading != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super.super._heading, a3);
    v5 = v6;
  }

}

- (void)setOrigin:(int64_t)a3
{
  if (self->super.super._origin != a3)
    self->super.super._origin = a3;
}

- (void)setAssertionIdentifier:(unsigned int)a3
{
  self->super.super._assertionIdentifier = a3;
}

- (void)setPhotoEncodingBehavior:(int64_t)a3
{
  self->super.super._photoEncodingBehavior = a3;
}

- (void)setContactIDsInProximity:(id)a3
{
  NSArray *v4;
  NSArray *contactIDsInProximity;

  if (self->super.super._contactIDsInProximity != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    contactIDsInProximity = self->super.super._contactIDsInProximity;
    self->super.super._contactIDsInProximity = v4;

  }
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->super.super._sharedLibraryMode != a3)
    self->super.super._sharedLibraryMode = a3;
}

- (void)setSharedLibraryDiagnostics:(id)a3
{
  NSDictionary *v4;
  NSDictionary *sharedLibraryDiagnostics;

  if (self->super.super._sharedLibraryDiagnostics != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    sharedLibraryDiagnostics = self->super.super._sharedLibraryDiagnostics;
    self->super.super._sharedLibraryDiagnostics = v4;

  }
}

@end

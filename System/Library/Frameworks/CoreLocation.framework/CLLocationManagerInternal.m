@implementation CLLocationManagerInternal

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableSet *fRangedRegions;
  __CLClient *fClient;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CLClient *v16;
  objc_super v17;
  _QWORD v18[5];
  _QWORD v19[5];

  objc_msgSend_setClientKeyForIdentityValidation_(self, a2, 0, v2);
  objc_msgSend_setMonitorLedgerAccessKey_(self, v4, 0, v5);

  self->fPlaceInferenceTimer = 0;
  fRangedRegions = self->fRangedRegions;
  if (fRangedRegions)
  {
    self->fRangedRegions = 0;
    fClient = self->fClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_18F5D9C10;
    v18[3] = &unk_1E2990E30;
    v18[4] = fRangedRegions;
    if (fClient)
    {
      v11 = (void *)*((_QWORD *)fClient + 29);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_18F5CCF7C;
      v19[3] = &unk_1E2990E30;
      v19[4] = v18;
      objc_msgSend_async_(v11, v6, (uint64_t)v19, v8);
    }
  }
  objc_msgSend_invalidate(self->fPlaceInferenceHandler, v6, v7, v8);

  self->fPlaceInferenceHandler = 0;
  v15 = *(void **)&self->fLocation.fromSimulationController;
  if (v15)
  {
    objc_msgSend_invalidate(*(void **)&self->fLocation.fromSimulationController, v12, v13, v14);

    *(_QWORD *)&self->fLocation.fromSimulationController = 0;
  }
  v16 = self->fClient;
  if (v16)
  {
    CLClientInvalidate((uint64_t)v16);
    CFRelease(self->fClient);
    self->fClient = 0;
  }

  *(_QWORD *)&self->fIsMasquerading = 0;
  self->fState = 0;
  v17.receiver = self;
  v17.super_class = (Class)CLLocationManagerInternal;
  -[CLLocationManagerInternal dealloc](&v17, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->fDelegate, a3);
}

- (void)performCourtesyPromptIfNeeded
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend_courtesyPromptNeeded(self->fState, a2, v2, v3))
    CLClientRequestAuthorization(self->fClient, 3);
}

- (CLLocationManager)manager
{
  return (CLLocationManager *)objc_loadWeak((id *)&self->fManager);
}

- (CLLocationManagerDelegate)delegate
{
  return (CLLocationManagerDelegate *)objc_loadWeak((id *)&self->fDelegate);
}

- (void)setPausesLocationUpdatesAutomatically:(int)a3
{
  uint64_t v3;
  __CLClient *fClient;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  objc_msgSend_setPausesLocationUpdatesAutomatically_(self->fState, a2, *(uint64_t *)&a3, v3);
  fClient = self->fClient;
  v9 = objc_msgSend_pausesLocationUpdatesAutomatically(self->fState, v6, v7, v8);
  sub_18F5CC314((uint64_t)fClient, v9);
}

- (NSString)clientKeyForIdentityValidation
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (CLLocationManagerInternal)initWithInfo:(id)a3 bundleIdentifier:(id)a4 bundlePath:(id)a5 websiteIdentifier:(id)a6 delegate:(id)a7 silo:(id)a8
{
  char *v14;
  CLLocationManagerStateTracker *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __int128 v23;
  void *(*v24)(void *);
  void (__cdecl *v25)(id);
  uint64_t v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CLLocationManagerInternal;
  v14 = -[CLLocationManagerInternal init](&v27, sel_init);
  if (v14)
  {
    v15 = [CLLocationManagerStateTracker alloc];
    *((_QWORD *)v14 + 4) = objc_msgSend_initWithQueue_identifier_state_(v15, v16, MEMORY[0x1E0C80D38], (uint64_t)a3, &unk_1E29901B0);
    *((_QWORD *)v14 + 36) = a8;
    objc_storeWeak((id *)v14 + 2, a7);
    objc_storeWeak((id *)v14 + 3, a3);
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = v14;
    v24 = sub_18F5C3854;
    v25 = j__objc_release;
    v26 = 0;
    v17 = CLClientCreateWithBundleIdentifierAndPathWithWebsiteOnSilo(*MEMORY[0x1E0C9AE00], (uint64_t)sub_18F5C3878, &v23, (uint64_t)a4, (unint64_t)a5, (uint64_t)a6, *((void **)v14 + 36));
    *((_QWORD *)v14 + 1) = v17;
    v14[272] = *(_BYTE *)(v17 + 17) != 0;
    *(_QWORD *)(v14 + 60) = 0xBFF0000000000000;
    *((_QWORD *)v14 + 26) = 0;
    *((_QWORD *)v14 + 27) = 0x4024000000000000;
    *((_DWORD *)v14 + 56) = 1;
    *((_QWORD *)v14 + 29) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    *((_QWORD *)v14 + 30) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend_setClientKeyForIdentityValidation_(v14, v18, 0, v19);
    objc_msgSend_setMonitorLedgerAccessKey_(v14, v20, 0, v21);
    *((_QWORD *)v14 + 35) = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return (CLLocationManagerInternal *)v14;
}

- (void)setMonitorLedgerAccessKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void)setClientKeyForIdentityValidation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void)invalidate
{
  __CLClient *fClient;

  fClient = self->fClient;
  if (fClient)
    CLClientInvalidate((uint64_t)fClient);
}

- (void)cancelLocationRequest
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_setRequestingLocation_(self->fState, a2, 0, v2);
  v7 = *(void **)&self->fLocation.fromSimulationController;
  if (v7)
  {
    objc_msgSend_invalidate(*(void **)&self->fLocation.fromSimulationController, v4, v5, v6);

    *(_QWORD *)&self->fLocation.fromSimulationController = 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->fManager);
  objc_destroyWeak((id *)&self->fDelegate);
}

- (int)PausesLocationUpdatesAutomatically
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_pausesLocationUpdatesAutomatically(self->fState, a2, v2, v3);
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;

  v4 = a3;
  objc_msgSend_setAllowsBackgroundLocationUpdates_(self->fState, a2, a3, v3);
  sub_18F5D3F38((uint64_t)self->fClient, v4);
}

- (BOOL)allowsBackgroundLocationUpdates
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_allowsBackgroundLocationUpdates(self->fState, a2, v2, v3);
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;

  v4 = a3;
  objc_msgSend_setShowsBackgroundLocationIndicator_(self->fState, a2, a3, v3);
  sub_18F5D3FEC((uint64_t)self->fClient, v4);
}

- (BOOL)showsBackgroundLocationIndicator
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_showsBackgroundLocationIndicator(self->fState, a2, v2, v3);
}

- (void)stopUpdatingLocationAutoPaused
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_setUpdatingLocation_(self->fState, a2, 0, v2);
  objc_msgSend_setPaused_(self->fState, v4, 1, v5);
  CLClientStopLocationUpdates_0((uint64_t)self->fClient);
}

- (NSMutableSet)rangedRegions
{
  return *(NSMutableSet **)&self->fLocationRequestTimeout;
}

- (NSMutableSet)rangedConstraints
{
  return *(NSMutableSet **)&self->fHeadingOrientation;
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->fManager, a3);
}

- (NSData)monitorLedgerAccessKey
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

@end

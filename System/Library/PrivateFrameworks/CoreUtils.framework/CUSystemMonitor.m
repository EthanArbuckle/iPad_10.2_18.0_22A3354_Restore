@implementation CUSystemMonitor

- (BOOL)screenOn
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 488) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (id)systemUIChangedHandler
{
  return objc_getProperty(self, a2, 240, 1);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)firstUnlocked
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 616) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)wifiFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 640);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenSaverActive
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 496) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (NSString)primaryAppleID
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 368);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (CUSystemMonitor)init
{
  CUSystemMonitor *v2;
  CUSystemMonitor *v3;
  CUSystemMonitor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUSystemMonitor;
  v2 = -[CUSystemMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  self->_invalidateCalled = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CUSystemMonitor_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int)activeCallCount
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 64);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- ($D91DDCA3822F03E96939068EA8DE741A)bluetoothAddress48
{
  unint64_t v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(unsigned int *)(gCUSystemMonitor + 24) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 28) << 32);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (NSData)bluetoothAddressData
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 32);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- (int)callCountIncomingConnected
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 72);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountIncomingUnconnected
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 76);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountOutgoingConnected
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 80);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)callCountOutgoingUnconnected
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 84);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)callFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 68);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)clamshellMode
{
  return 0;
}

- (int)connectedCallCount
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 92);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)consoleUserID
{
  return 0;
}

- (NSString)consoleUserName
{
  return 0;
}

- (NSArray)familyMembers
{
  void *v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = (void *)objc_msgSend(*(id *)(gCUSystemMonitor + 104), "copy");
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSArray *)v2;
}

- (NSString)foregroundAppBundleID
{
  return 0;
}

- (unsigned)locationVisitsFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 144);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)manateeAvailable
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 148) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)manateeState
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 152);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (void)forceManateeStateRefresh
{
  objc_msgSend((id)gCUSystemMonitor, "_forceManateeStateRefresh");
}

- (NSString)meDeviceFMFDeviceID
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 184);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceIDSDeviceID
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 192);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)meDeviceName
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 200);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (BOOL)meDeviceIsMe
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 208) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)meDeviceValid
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 209) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)motionFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 248);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)motionOrientation
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 264);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (unsigned)netFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 288);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)powerUnlimited
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 364) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)primaryAppleIDIsHSA2
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 377) != 0;
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr
{
  uint64_t v4;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(gCUSystemMonitor + 304);
    retstr->var0 = *(sockaddr *)(v4 + 292);
  }
  else
  {
    *(_QWORD *)&retstr->var0.sa_len = 0;
    *(_QWORD *)retstr->var2.sin6_addr.__u6_addr8 = 0;
    retstr->var2.sin6_scope_id = 0;
    *(_QWORD *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0;
  }
  return ($9D4F243E34B80324A1B90A38B57CFE16 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr
{
  uint64_t v4;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v4 = gCUSystemMonitor;
  if (gCUSystemMonitor)
  {
    retstr->var0 = *(sockaddr *)(gCUSystemMonitor + 320);
    *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)(v4 + 332);
  }
  else
  {
    *(_QWORD *)&retstr->var0.sa_len = 0;
    *(_QWORD *)retstr->var2.sin6_addr.__u6_addr8 = 0;
    retstr->var2.sin6_scope_id = 0;
    *(_QWORD *)&retstr->var2.sin6_addr.__u6_addr32[2] = 0;
  }
  return ($9D4F243E34B80324A1B90A38B57CFE16 *)pthread_mutex_unlock(&gCUSystemMonitorLock);
}

- (NSString)primaryNetworkSignature
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 352);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionISOCountryCode
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 408);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionMobileCountryCode
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 416);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionRoutineCountry
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 432);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (NSString)regionRoutineState
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 448);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- ($D91DDCA3822F03E96939068EA8DE741A)rotatingIdentifier48
{
  unint64_t v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(unsigned int *)(gCUSystemMonitor + 456) | ((unint64_t)*(unsigned __int16 *)(gCUSystemMonitor + 460) << 32);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return ($D91DDCA3822F03E96939068EA8DE741A)v2;
}

- (NSData)rotatingIdentifierData
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 464);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSData *)v3;
}

- (BOOL)screenLocked
{
  BOOL v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_BYTE *)(gCUSystemMonitor + 480) != 0;
  else
    v2 = 1;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)screenLockedSync
{
  void *v2;

  if (SpringBoardServicesLibrary_sOnce != -1)
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_1106);
  if (SpringBoardServicesLibrary_sLib)
  {
    v2 = dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSGetScreenLockStatus");
    if (v2)
      LOBYTE(v2) = softLinkSBSGetScreenLockStatus(0) != 0;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (int)screenState
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 512);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)systemLockState
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 584);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (int)systemLockStateSync
{
  unsigned int v2;

  v2 = MKBGetDeviceLockState();
  if (v2 <= 4)
    return 4 - v2;
  else
    return 0;
}

- (NSString)systemName
{
  void *v2;
  id v3;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  v2 = (void *)gCUSystemMonitor;
  if (gCUSystemMonitor)
    v2 = *(void **)(gCUSystemMonitor + 576);
  v3 = v2;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return (NSString *)v3;
}

- (unsigned)systemUIFlags
{
  unsigned int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 596);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (BOOL)firstUnlockedSync
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

- (int)wifiState
{
  int v2;

  pthread_mutex_lock(&gCUSystemMonitorLock);
  if (gCUSystemMonitor)
    v2 = *(_DWORD *)(gCUSystemMonitor + 644);
  else
    v2 = 0;
  pthread_mutex_unlock(&gCUSystemMonitorLock);
  return v2;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)bluetoothAddressChangedHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setBluetoothAddressChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)callChangedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCallChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)clamshellModeChangedHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setClamshellModeChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)consoleUserChangedHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setConsoleUserChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)familyUpdatedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFamilyUpdatedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)foregroundAppChangedHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setForegroundAppChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSBundle)locationVisitsBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLocationVisitsBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)locationVisitsChangedHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setLocationVisitsChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (id)manateeChangedHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setManateeChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (BOOL)meDeviceUseFindMyLocate
{
  return self->_meDeviceUseFindMyLocate;
}

- (void)setMeDeviceUseFindMyLocate:(BOOL)a3
{
  self->_meDeviceUseFindMyLocate = a3;
}

- (id)meDeviceChangedHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setMeDeviceChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)motionHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setMotionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)netFlagsChangedHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setNetFlagsChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (id)netInterfacesChangedHandler
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setNetInterfacesChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (id)primaryIPChangedHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)primaryNetworkChangedHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)powerUnlimitedChangedHandler
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setPowerUnlimitedChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (id)primaryAppleIDChangedHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPrimaryAppleIDChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (id)regionChangedHandler
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setRegionChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (id)rotatingIdentifierChangedHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setRotatingIdentifierChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (id)screenLockedChangedHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setScreenLockedChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)screenOnChangedHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setScreenOnChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (id)screenSaverChangedHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setScreenSaverChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (id)screenStateChangedHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setScreenStateChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (id)systemLockStateChangedHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setSystemLockStateChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (id)systemNameChangedHandler
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setSystemNameChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void)setSystemUIChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (id)firstUnlockHandler
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setFirstUnlockHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (id)wifiStateChangedHandler
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setWifiStateChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wifiStateChangedHandler, 0);
  objc_storeStrong(&self->_firstUnlockHandler, 0);
  objc_storeStrong(&self->_systemUIChangedHandler, 0);
  objc_storeStrong(&self->_systemNameChangedHandler, 0);
  objc_storeStrong(&self->_systemLockStateChangedHandler, 0);
  objc_storeStrong(&self->_screenStateChangedHandler, 0);
  objc_storeStrong(&self->_screenSaverChangedHandler, 0);
  objc_storeStrong(&self->_screenOnChangedHandler, 0);
  objc_storeStrong(&self->_screenLockedChangedHandler, 0);
  objc_storeStrong(&self->_rotatingIdentifierChangedHandler, 0);
  objc_storeStrong(&self->_regionChangedHandler, 0);
  objc_storeStrong(&self->_primaryAppleIDChangedHandler, 0);
  objc_storeStrong(&self->_powerUnlimitedChangedHandler, 0);
  objc_storeStrong(&self->_primaryNetworkChangedHandler, 0);
  objc_storeStrong(&self->_primaryIPChangedHandler, 0);
  objc_storeStrong(&self->_netInterfacesChangedHandler, 0);
  objc_storeStrong(&self->_netFlagsChangedHandler, 0);
  objc_storeStrong(&self->_motionHandler, 0);
  objc_storeStrong(&self->_meDeviceChangedHandler, 0);
  objc_storeStrong(&self->_manateeChangedHandler, 0);
  objc_storeStrong(&self->_locationVisitsChangedHandler, 0);
  objc_storeStrong((id *)&self->_locationVisitsBundle, 0);
  objc_storeStrong(&self->_foregroundAppChangedHandler, 0);
  objc_storeStrong(&self->_familyUpdatedHandler, 0);
  objc_storeStrong(&self->_consoleUserChangedHandler, 0);
  objc_storeStrong(&self->_clamshellModeChangedHandler, 0);
  objc_storeStrong(&self->_callChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothAddressChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __29__CUSystemMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void (**v63)(void);
  uint64_t v64;

  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 25))
  {
    *(_BYTE *)(v8 + 25) = 1;
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v64);
    }
    pthread_mutex_lock(&gCUSystemMonitorLock);
    objc_msgSend((id)gCUSystemMonitor, "removeMonitor:", *(_QWORD *)(a1 + 32));
    pthread_mutex_unlock(&gCUSystemMonitorLock);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = 0;

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 56);
    *(_QWORD *)(v14 + 56) = 0;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = 0;

    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 72);
    *(_QWORD *)(v18 + 72) = 0;

    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 96);
    *(_QWORD *)(v20 + 96) = 0;

    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 104);
    *(_QWORD *)(v22 + 104) = 0;

    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 112);
    *(_QWORD *)(v24 + 112) = 0;

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 120);
    *(_QWORD *)(v26 + 120) = 0;

    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 128);
    *(_QWORD *)(v28 + 128) = 0;

    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(void **)(v30 + 136);
    *(_QWORD *)(v30 + 136) = 0;

    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v32 + 160);
    *(_QWORD *)(v32 + 160) = 0;

    v34 = *(_QWORD *)(a1 + 32);
    v35 = *(void **)(v34 + 168);
    *(_QWORD *)(v34 + 168) = 0;

    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(void **)(v36 + 144);
    *(_QWORD *)(v36 + 144) = 0;

    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(void **)(v38 + 152);
    *(_QWORD *)(v38 + 152) = 0;

    v40 = *(_QWORD *)(a1 + 32);
    v41 = *(void **)(v40 + 176);
    *(_QWORD *)(v40 + 176) = 0;

    v42 = *(_QWORD *)(a1 + 32);
    v43 = *(void **)(v42 + 184);
    *(_QWORD *)(v42 + 184) = 0;

    v44 = *(_QWORD *)(a1 + 32);
    v45 = *(void **)(v44 + 192);
    *(_QWORD *)(v44 + 192) = 0;

    v46 = *(_QWORD *)(a1 + 32);
    v47 = *(void **)(v46 + 200);
    *(_QWORD *)(v46 + 200) = 0;

    v48 = *(_QWORD *)(a1 + 32);
    v49 = *(void **)(v48 + 208);
    *(_QWORD *)(v48 + 208) = 0;

    v50 = *(_QWORD *)(a1 + 32);
    v51 = *(void **)(v50 + 216);
    *(_QWORD *)(v50 + 216) = 0;

    v52 = *(_QWORD *)(a1 + 32);
    v53 = *(void **)(v52 + 224);
    *(_QWORD *)(v52 + 224) = 0;

    v54 = *(_QWORD *)(a1 + 32);
    v55 = *(void **)(v54 + 232);
    *(_QWORD *)(v54 + 232) = 0;

    v56 = *(_QWORD *)(a1 + 32);
    v57 = *(void **)(v56 + 240);
    *(_QWORD *)(v56 + 240) = 0;

    v58 = *(_QWORD *)(a1 + 32);
    v59 = *(void **)(v58 + 248);
    *(_QWORD *)(v58 + 248) = 0;

    v60 = *(_QWORD *)(a1 + 32);
    v61 = *(void **)(v60 + 256);
    *(_QWORD *)(v60 + 256) = 0;

    v62 = *(_QWORD *)(a1 + 32);
    v63 = *(void (***)(void))(v62 + 32);
    if (v63)
    {
      v63[2]();
      v62 = *(_QWORD *)(a1 + 32);
      v63 = *(void (***)(void))(v62 + 32);
    }
    *(_QWORD *)(v62 + 32) = 0;

  }
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  const char *v11;
  void *v12;
  CUSystemMonitorImp *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned __int8 *)(v9 + 8);
  *(_BYTE *)(v9 + 8) = 1;
  if (v10)
  {
    if (gLogCategory_CUSystemMonitor <= 30
      && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
    {
      v11 = "Activating (again)\n";
LABEL_8:
      LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)v11, a5, a6, a7, a8, v19);
    }
  }
  else if (gLogCategory_CUSystemMonitor <= 30
         && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    v11 = "Activating\n";
    goto LABEL_8;
  }
  pthread_mutex_lock(&gCUSystemMonitorLock);
  v12 = (void *)gCUSystemMonitor;
  if (!gCUSystemMonitor)
  {
    v13 = objc_alloc_init(CUSystemMonitorImp);
    v14 = (void *)gCUSystemMonitor;
    gCUSystemMonitor = (uint64_t)v13;

    v12 = (void *)gCUSystemMonitor;
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v16 = *(_QWORD *)(v15 + 16);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_2;
    v22[3] = &unk_1E25DF300;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v12, "updateWithQueue:completion:", v16, v22);
    v17 = v23;
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__CUSystemMonitor_activateWithCompletion___block_invoke_3;
    v20[3] = &unk_1E25DE600;
    v20[4] = v15;
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v12, "addMonitor:completion:", v15, v20);
    v17 = v21;
  }

  return pthread_mutex_unlock(&gCUSystemMonitorLock);
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_2", 0x1Eu, (uint64_t)"Activated (again)\n", a5, a6, a7, a8, v10);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __42__CUSystemMonitor_activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  if (gLogCategory_CUSystemMonitor <= 30
    && (gLogCategory_CUSystemMonitor != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUSystemMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUSystemMonitor, (uint64_t)"-[CUSystemMonitor activateWithCompletion:]_block_invoke_3", 0x1Eu, (uint64_t)"Activated\n", a5, a6, a7, a8, v10);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end

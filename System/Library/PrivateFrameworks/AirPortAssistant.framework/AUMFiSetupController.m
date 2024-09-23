@implementation AUMFiSetupController

+ (id)setupController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"+[AUMFiSetupController setupController]", 800, (uint64_t)"\n", v2, v3, v4, v5, vars0);
  return objc_alloc_init(AUMFiSetupController);
}

- (AUMFiSetupController)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AUMFiSetupController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AUMFiSetupController;
  v6 = -[AUSetupController init](&v8, sel_init);
  if (v6)
    v6->_mfiSetupDelegates = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v8.receiver);
  v6->_successfullyEstablishedLinkOnTargetDeviceSWAP = 0;
  v6->_successfullyEstablishedLinkOnDestinationAP = 0;
  v6->_promptedUserForDestinationWiFiPSK = 0;
  v6->_postediAPAccessoryConfiguredNotification = 0;
  v6->_destinationNetworkPasswordAccepted = 0;
  v6->_setupEnded = 0;
  v6->_waitingForLinkState = 0;
  v6->_easyConfigPreConfigMetrics.hitJoiningTargetSWAPTimeout = 0;
  v6->_easyConfigPostConfigMetrics.hitJoiningDestinationAPTimeout = 0;
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *askUserForPasswordSemaphore;
  NSObject *linkUpOnTargetSWAPSemaphore;
  objc_super v14;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController dealloc]", 800, (uint64_t)"\n", v3, v4, v5, v6, (uint64_t)v14.receiver);
  objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, a2, v2);
  objc_msgSend_stopListeningToAllNotifications(self, v8, v9);
  objc_msgSend_closeAllConnections(self, v10, v11);

  self->_mfiSetupDelegates = 0;
  self->_autoGuessRecommendationDict = 0;

  self->_setupOptionsDict = 0;
  self->_destinationNetworkScanRecord = 0;

  self->_targetMFiDeviceScanRecord = 0;
  self->_destinationNetworkSSID = 0;

  self->_destinationNetworkPassword = 0;
  self->_accessoryResponseDict = 0;
  askUserForPasswordSemaphore = self->_askUserForPasswordSemaphore;
  if (askUserForPasswordSemaphore)
    dispatch_release(askUserForPasswordSemaphore);
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  if (linkUpOnTargetSWAPSemaphore)
    dispatch_release(linkUpOnTargetSWAPSemaphore);
  self->_askUserForPasswordSemaphore = 0;
  self->_linkUpOnTargetSWAPSemaphore = 0;
  v14.receiver = self;
  v14.super_class = (Class)AUMFiSetupController;
  -[AUSetupController dealloc](&v14, sel_dealloc);
}

- (int)cancelSetup
{
  int v3;
  NSObject *linkUpOnTargetSWAPSemaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUMFiSetupController;
  v3 = -[AUSetupController cancelSetup](&v6, sel_cancelSetup);
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  if (linkUpOnTargetSWAPSemaphore)
    dispatch_semaphore_signal(linkUpOnTargetSWAPSemaphore);
  if (v3 == -6771)
    return 0;
  else
    return v3;
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  NSDictionary *setupOptionsDict;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  NSString *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  NSDictionary *v21;
  int result;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  NSString *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  NSString *postConfigTargetDeviceFriendlyName;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  OS_dispatch_semaphore *v68;

  self->_easyConfigPreConfigMetrics.startTime = CFAbsoluteTimeGetCurrent();
  self->_autoGuessRecommendationDict = (NSDictionary *)a3;
  setupOptionsDict = (NSDictionary *)a4;
  self->_setupOptionsDict = setupOptionsDict;
  if (self->_autoGuessRecommendationDict)
    v13 = setupOptionsDict == 0;
  else
    v13 = 1;
  if (v13)
    return -6762;
  if (dword_2550F4C10 <= 800)
  {
    if (dword_2550F4C10 != -1
      || (v14 = sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u), setupOptionsDict = self->_setupOptionsDict, v14))
    {
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"Setup Options: %@\n", v9, v10, v11, v12, (uint64_t)setupOptionsDict);
      setupOptionsDict = self->_setupOptionsDict;
    }
  }
  v15 = (NSString *)objc_msgSend_objectForKey_(setupOptionsDict, v8, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
  self->_postConfigTargetDeviceFriendlyName = v15;
  if (!objc_msgSend_length(v15, v16, v17))
    return -6762;
  self->_destinationNetworkScanRecord = (NSDictionary *)(id)objc_msgSend_objectForKey_(self->_setupOptionsDict, v18, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_SourceNetwork"));
  v21 = (NSDictionary *)(id)objc_msgSend_objectForKey_(self->_setupOptionsDict, v19, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  self->_targetMFiDeviceScanRecord = v21;
  result = -6762;
  if (self->_destinationNetworkScanRecord && v21)
  {
    v23 = (void *)objc_msgSend_objectForKey_(v21, v20, (uint64_t)CFSTR("SNR"));
    v25 = (void *)objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v24, (uint64_t)CFSTR("RSSI"));
    v27 = (void *)objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v26, (uint64_t)CFSTR("CHANNEL"));
    self->_easyConfigPreConfigMetrics.snrOfSWAP = objc_msgSend_integerValue(v23, v28, v29);
    self->_easyConfigPreConfigMetrics.rssiOfSWAP = objc_msgSend_integerValue(v25, v30, v31);
    self->_easyConfigPreConfigMetrics.channelOfSWAP = objc_msgSend_integerValue(v27, v32, v33);
    v35 = (void *)objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v34, (uint64_t)CFSTR("SNR"));
    v37 = (void *)objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v36, (uint64_t)CFSTR("RSSI"));
    v39 = (void *)objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v38, (uint64_t)CFSTR("CHANNEL"));
    self->_easyConfigPostConfigMetrics.snrOfDestinationAP = objc_msgSend_integerValue(v35, v40, v41);
    self->_easyConfigPostConfigMetrics.rssiOfDestinationAP = objc_msgSend_integerValue(v37, v42, v43);
    self->_easyConfigPostConfigMetrics.channelOfDestinationAP = objc_msgSend_integerValue(v39, v44, v45);
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController setupFromAutoguessRecommendation:withOptions:]", 800, (uint64_t)"Destination Network Scan Record: %@\n", v46, v47, v48, v49, (uint64_t)self->_destinationNetworkScanRecord);
    v50 = objc_alloc(MEMORY[0x24BDD17C8]);
    v52 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v51, (uint64_t)self->_destinationNetworkScanRecord);
    v54 = (NSString *)objc_msgSend_initWithString_(v50, v53, v52);
    self->_destinationNetworkSSID = v54;
    if (v54)
    {
      v56 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, v55, (uint64_t)CFSTR("BSAutoGuess_SourceNetwork"));
      v58 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v57, v56);
      self->_easyConfigPreConfigMetrics.destinationNetworkRecommendationUsed = objc_msgSend_isEqualToString_(self->_destinationNetworkSSID, v59, v58);
      postConfigTargetDeviceFriendlyName = self->_postConfigTargetDeviceFriendlyName;
      v62 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v61, (uint64_t)self->_targetMFiDeviceScanRecord);
      self->_easyConfigPreConfigMetrics.userChangedFriendlyName = objc_msgSend_isEqualToString_(postConfigTargetDeviceFriendlyName, v63, v62) ^ 1;
      v66 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v64, v65);
      objc_msgSend_setAutoJoinState_(v66, v67, 0);
      v68 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      result = 0;
      self->_linkUpOnTargetSWAPSemaphore = v68;
      return result;
    }
    return -6762;
  }
  return result;
}

- (int)updateSettingsAsync
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21A732540;
  block[3] = &unk_24DD04D48;
  block[4] = self;
  dispatch_async(global_queue, block);
  return 0;
}

- (void)linkChangeNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const __CFString *v18;
  int *v19;
  void *v20;
  const char *v21;
  const char *v22;
  int waitingForLinkState;
  uint64_t v24;
  int v25;
  int v26;
  const char *v27;
  uint64_t v28;

  if (!self->_waitingForLinkState || (v8 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3)) == 0)
  {
    v24 = 0;
LABEL_22:
    v18 = &stru_24DD08368;
    goto LABEL_23;
  }
  v10 = (void *)v8;
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"linkDict: %@\n", v3, v4, v5, v6, (uint64_t)v10);
  v11 = (void *)objc_msgSend_objectForKey_(v10, v9, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_LinkState"));
  v14 = objc_msgSend_integerValue(v11, v12, v13);
  if (v14 != 1)
  {
    v24 = v14;
    goto LABEL_22;
  }
  objc_msgSend_objectForKey_(v10, v15, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_IfName"));
  v18 = (const __CFString *)objc_msgSend_objectForKey_(v10, v16, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_WiFiName"));
  if (v18)
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"Link Up on SSID: %@\n", v3, v4, v5, v6, (uint64_t)v18);
    if (self->_waitingForLinkState == 1)
      v19 = &OBJC_IVAR___AUMFiSetupController__targetMFiDeviceScanRecord;
    else
      v19 = &OBJC_IVAR___AUMFiSetupController__destinationNetworkScanRecord;
    v20 = (void *)objc_msgSend_objectForKey_(*(void **)((char *)&self->super.super.super.isa + *v19), v17, (uint64_t)CFSTR("SSID_STR"));
    if (objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v18))
    {
      waitingForLinkState = self->_waitingForLinkState;
      if (waitingForLinkState == 2)
      {
        objc_msgSend_linkUpOnDestinationAP_(self, v22, (uint64_t)v18);
      }
      else if (waitingForLinkState == 1)
      {
        objc_msgSend_linkUpOnSWAP_(self, v22, (uint64_t)v18);
      }
    }
  }
  v24 = 1;
LABEL_23:
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"eWaitingForLinkState: %d\n", v3, v4, v5, v6, self->_waitingForLinkState);
  v25 = self->_waitingForLinkState;
  if (!v25)
    return;
  if (!v24)
  {
    if (dword_2550F4C10 > 800 || dword_2550F4C10 == -1 && !sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      return;
    v27 = "Link Down\n";
LABEL_43:
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)v27, v3, v4, v5, v6, v28);
    return;
  }
  if (!v18)
  {
    if (dword_2550F4C10 > 800 || dword_2550F4C10 == -1 && !sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      return;
    v27 = "No SSID Associated\n";
    goto LABEL_43;
  }
  if (v25 == 1)
  {
    if (self->_successfullyEstablishedLinkOnTargetDeviceSWAP)
      return;
    v26 = dword_2550F4C10;
    if (dword_2550F4C10 > 800)
      return;
  }
  else
  {
    if (v25 != 2)
      return;
    if (self->_successfullyEstablishedLinkOnDestinationAP)
      return;
    v26 = dword_2550F4C10;
    if (dword_2550F4C10 >= 801)
      return;
  }
  if (v26 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkChangeNotification:]", 800, (uint64_t)"ERROR: Currently associated to: %@, expected: %@\n", v3, v4, v5, v6, (uint64_t)v18);
}

- (void)linkUpOnSWAP:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP = CFAbsoluteTimeGetCurrent() - self->_timeSWAPJoinStarted;
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkUpOnSWAP:]", 800, (uint64_t)"SSID: %@\n", v5, v6, v7, v8, (uint64_t)a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_linkUpOnTargetSWAPSemaphore);
  self->_successfullyEstablishedLinkOnTargetDeviceSWAP = 1;
  self->_waitingForLinkState = 0;
}

- (void)linkUpOnDestinationAP:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination = CFAbsoluteTimeGetCurrent()
                                                                     - self->_timeDestinationAPJoinStarted;
  objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, v5, v6);
  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"), 0);
  objc_msgSend_resumePostConfig(self->_easyConfigDevice, v11, v12);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController linkUpOnDestinationAP:]", 800, (uint64_t)"SSID: %@\n", v13, v14, v15, v16, (uint64_t)a3);
  self->_successfullyEstablishedLinkOnDestinationAP = 1;
  self->_waitingForLinkState = 0;
}

- (int)joinTargetSWAP
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  self->_waitingForLinkState = 1;
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
  {
    v3 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, a2, (uint64_t)CFSTR("SSID_STR"));
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController joinTargetSWAP]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, v3);
  }
  self->_timeSWAPJoinStarted = CFAbsoluteTimeGetCurrent();
  v10 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v8, v9);
  objc_msgSend_addObserver_selector_name_object_(v10, v11, (uint64_t)self, sel_joinSWAPDone_, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  v14 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v12, v13);
  return objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v14, v15, (uint64_t)self->_targetMFiDeviceScanRecord, 0, 1);
}

- (void)joinDestinationNetworkTimeoutFired:(id)a3
{
  NSTimer *linkUpOnDestinationNetworkTimer;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  linkUpOnDestinationNetworkTimer = self->_linkUpOnDestinationNetworkTimer;
  if (linkUpOnDestinationNetworkTimer)
  {
    if (objc_msgSend_isValid(linkUpOnDestinationNetworkTimer, a2, (uint64_t)a3))
    {
      objc_msgSend_invalidateLinkUpOnDestinationNetworkTimer(self, v5, v6);
      if (!self->_successfullyEstablishedLinkOnDestinationAP)
      {
        self->_easyConfigPostConfigMetrics.hitJoiningDestinationAPTimeout = 1;
        v9 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v7, v8);
        objc_msgSend_cancelAsync(v9, v10, v11);
        if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController joinDestinationNetworkTimeoutFired:]", 800, (uint64_t)"ERROR: Did not successfully join destination network. Hit %d sec timeout.\n", v13, v14, v15, v16, 60);
        objc_msgSend_endSetup_(self, v12, 4294960574);
      }
    }
  }
}

- (void)joinDestinationAPDone:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  v9 = (void *)objc_msgSend_userInfo(a3, v7, v8);
  v11 = (void *)objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("WiFiUtils_OSStatus"));
  if (v11)
  {
    v14 = objc_msgSend_integerValue(v11, v12, v13);
    v20 = v14;
    if ((_DWORD)v14)
    {
      if ((_DWORD)v14 == -16)
      {
        if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController joinDestinationAPDone:]", 800, (uint64_t)"ERROR: Incorrect destination network password for %@\n", v16, v17, v18, v19, (uint64_t)self->_destinationNetworkSSID);
        objc_msgSend_endSetup_(self, v15, 4294960534);
        LODWORD(v20) = -16;
      }
      else if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      {
        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController joinDestinationAPDone:]", 800, (uint64_t)"ERROR: %#m\n", v16, v17, v18, v19, v20);
      }
    }
    else
    {
      self->_destinationNetworkPasswordAccepted = 1;
    }
  }
  else
  {
    LODWORD(v20) = -6705;
  }
  self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError = v20;
}

- (void)joinSWAPDone:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  v9 = (void *)objc_msgSend_userInfo(a3, v7, v8);
  v11 = (void *)objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("WiFiUtils_OSStatus"));
  if (v11)
    v14 = objc_msgSend_integerValue(v11, v12, v13);
  else
    v14 = -6705;
  self->_easyConfigPreConfigMetrics.wifiJoinSWAPError = v14;
}

- (void)invalidateLinkUpOnDestinationNetworkTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController invalidateLinkUpOnDestinationNetworkTimer]", 800, (uint64_t)"\n", v3, v4, v5, v6, v9);
  objc_msgSend_invalidate(self->_linkUpOnDestinationNetworkTimer, a2, v2);
  objc_msgSend_setLinkUpOnDestinationNetworkTimer_(self, v8, 0);
}

- (void)acquireDestinationNetworkPassword
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t NetworkPassword;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController acquireDestinationNetworkPassword]", 800, (uint64_t)"\n", v2, v3, v4, v5, v18);
  v19 = 0;
  if (objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, (uint64_t)self->_destinationNetworkScanRecord, 0, &v19))
  {
    if (v19)
    {
      if (dword_2550F4C10 > 800 || dword_2550F4C10 == -1 && !sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        goto LABEL_12;
      v12 = "ERROR: Destination network has Enterprise security.\n";
LABEL_11:
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController acquireDestinationNetworkPassword]", 800, (uint64_t)v12, v8, v9, v10, v11, v18);
LABEL_12:
      objc_msgSend_endSetup_(self, v7, 4294960534);
      return;
    }
    NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, v7, (uint64_t)self->_destinationNetworkScanRecord);
    objc_msgSend_setDestinationNetworkPassword_(self, v14, NetworkPassword);
    self->_easyConfigPostConfigMetrics.destinationNetworkPSKInKeychain = 1;
    if (!self->_destinationNetworkPassword)
    {
      self->_askUserForPasswordSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel_askUserForNetworkPassword_, self->_destinationNetworkSSID, 0);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_askUserForPasswordSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      self->_easyConfigPostConfigMetrics.destinationNetworkPSKInKeychain = 0;
      if (!objc_msgSend_length(self->_destinationNetworkPassword, v16, v17))
      {
        if (dword_2550F4C10 > 800 || dword_2550F4C10 == -1 && !sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
          goto LABEL_12;
        v12 = "ERROR: Network is secure, but _destinationNetworkPassword is zero length!\n";
        goto LABEL_11;
      }
    }
  }
}

- (void)startListeningForEasyConfigDeviceStatusNotifications
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController startListeningForEasyConfigDeviceStatusNotifications]", 800, (uint64_t)"\n", v3, v4, v5, v6, v14);
  v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)self, sel_handleEasyConfigProgress_, *MEMORY[0x24BE2E2E8], 0);
  v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11);
  objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)self, sel_handleEasyConfigStopped_, *MEMORY[0x24BE2E2F0], 0);
}

- (void)stopListeningToEasyConfigDeviceStatusNotifications
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController stopListeningToEasyConfigDeviceStatusNotifications]", 800, (uint64_t)"\n", v3, v4, v5, v6, v14);
  v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, *MEMORY[0x24BE2E2E8], 0);
  v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11);
  objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)self, *MEMORY[0x24BE2E2F0], 0);
}

- (void)handleEasyConfigProgress:(id)a3
{
  unint64_t lastHeardEasyConfigProgressNotification;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  lastHeardEasyConfigProgressNotification = self->_lastHeardEasyConfigProgressNotification;
  v6 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  v8 = (void *)objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x24BE2E338]);
  v11 = objc_msgSend_integerValue(v8, v9, v10);
  self->_lastHeardEasyConfigProgressNotification = v11;
  if (v11 == 50)
  {
    MEMORY[0x24BEDD108](self, sel_handleEasyConfigProgressSearchingForPostConfigDevice_, a3);
    return;
  }
  v17 = v11;
  if (v11 != 40)
  {
    if (v11 == 10)
    {
      if (lastHeardEasyConfigProgressNotification >= 0xB
        && dword_2550F4C10 <= 800
        && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      {
        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"RETRY: EasyConfig backed up states\n", v13, v14, v15, v16, v32);
      }
      return;
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 == -1)
    {
      if (!sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        return;
      v17 = self->_lastHeardEasyConfigProgressNotification;
    }
    if (v17 <= 29)
    {
      v18 = "Start";
      switch(v17)
      {
        case 1:
          goto LABEL_47;
        case 2:
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Final");
          break;
        case 3:
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Error");
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_41;
        case 10:
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Search for pre-config device");
          break;
        default:
          if (v17 != 20)
            goto LABEL_41;
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Authenticating pre-config device");
          break;
      }
      goto LABEL_48;
    }
    if (v17 <= 49)
    {
      if (v17 == 30)
      {
        v18 = "Applying configuration to device";
LABEL_47:
        v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)v18);
        goto LABEL_48;
      }
      if (v17 == 40)
      {
        v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Applied configuration to device");
        goto LABEL_48;
      }
    }
    else
    {
      switch(v17)
      {
        case '2':
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Searching for post-config device");
          goto LABEL_48;
        case '<':
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Performing post-config check of device");
          goto LABEL_48;
        case 'F':
          v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Performed post-config check of device");
LABEL_48:
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"Unhandled: %@\n", v20, v21, v22, v23, v19);
          return;
      }
    }
LABEL_41:
    if (v17 == 100)
      v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Configuration complete");
    else
      v19 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"?");
    goto LABEL_48;
  }
  if (lastHeardEasyConfigProgressNotification <= 0x27)
  {
    MEMORY[0x24BEDD108](self, sel_handleEasyConfigProgressAppliedConfigurationToDevice_, a3);
    return;
  }
  if (dword_2550F4C10 <= 800)
  {
    if (dword_2550F4C10 != -1)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_22;
    }
    if (!sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      return;
    v31 = self->_lastHeardEasyConfigProgressNotification;
    v24 = (void *)MEMORY[0x24BDD17C8];
    if (v31 <= 29)
    {
      v25 = "Start";
      switch(v31)
      {
        case 1:
          goto LABEL_23;
        case 2:
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Final");
          break;
        case 3:
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Error");
          break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_65;
        case 10:
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Search for pre-config device");
          break;
        default:
          if (v31 != 20)
            goto LABEL_65;
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Authenticating pre-config device");
          break;
      }
      goto LABEL_24;
    }
    if (v31 <= 49)
    {
      if (v31 == 30)
      {
        v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Applying configuration to device");
        goto LABEL_24;
      }
      if (v31 == 40)
      {
LABEL_22:
        v25 = "Applied configuration to device";
LABEL_23:
        v26 = objc_msgSend_stringWithUTF8String_(v24, v12, (uint64_t)v25);
        goto LABEL_24;
      }
    }
    else
    {
      switch(v31)
      {
        case '2':
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Searching for post-config device");
          goto LABEL_24;
        case '<':
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Performing post-config check of device");
          goto LABEL_24;
        case 'F':
          v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Performed post-config check of device");
LABEL_24:
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgress:]", 800, (uint64_t)"Ignoring duplicate %@\n", v27, v28, v29, v30, v26);
          return;
      }
    }
LABEL_65:
    if (v31 == 100)
      v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"Configuration complete");
    else
      v26 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v12, (uint64_t)"?");
    goto LABEL_24;
  }
}

- (void)handleEasyConfigProgressAppliedConfigurationToDevice:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgressAppliedConfigurationToDevice:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v26);
  self->_waitingForLinkState = 2;
  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_addObserver_selector_name_object_(v9, v10, (uint64_t)self, sel_joinDestinationAPDone_, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController handleEasyConfigProgressAppliedConfigurationToDevice:]", 800, (uint64_t)"Asking WiFiUtils to join destination network: %@\n", v11, v12, v13, v14, (uint64_t)self->_destinationNetworkSSID);
  self->_timeDestinationAPJoinStarted = CFAbsoluteTimeGetCurrent();
  v17 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v15, v16);
  objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v17, v18, (uint64_t)self->_destinationNetworkScanRecord, self->_destinationNetworkPassword, 2);
  v20 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v19, (uint64_t)self, sel_joinDestinationNetworkTimeoutFired_, 0, 0, 60.0);
  objc_msgSend_setLinkUpOnDestinationNetworkTimer_(self, v21, v20);
  v24 = (void *)objc_msgSend_userInfo(a3, v22, v23);
  self->_accessoryResponseDict = (NSDictionary *)(id)objc_msgSend_objectForKey_(v24, v25, *MEMORY[0x24BE2E348]);
}

- (void)handleEasyConfigProgressSearchingForPostConfigDevice:(id)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;

  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = objc_msgSend_objectForKey_(self->_setupOptionsDict, a2, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
  v7 = objc_msgSend_dictionaryWithObject_forKey_(v4, v6, v5, CFSTR("BSAssistantProgressKey_StringParameter"));
  objc_msgSend_sendProgressToUI_withParamDict_(self, v8, 7, v7);
}

- (void)handleEasyConfigStopped:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v4 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x24BE2E340]);
  v9 = objc_msgSend_code(v6, v7, v8);
  objc_msgSend_endSetup_(self, v10, v9);
}

- (void)createEasyConfigDeviceConfiguration
{
  uint64_t v3;
  const char *v4;
  EasyConfigDevice *v5;
  const char *v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];

  v3 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, a2, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  v5 = (EasyConfigDevice *)(id)objc_msgSend_deviceWithScanRecord_(MEMORY[0x24BE2E368], v4, v3);
  self->_easyConfigDevice = v5;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_21A733B00;
  v26[3] = &unk_24DD07B48;
  v26[4] = self;
  objc_msgSend_setPromptForSetupCodeHandler_(v5, v6, (uint64_t)v26);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setObject_forKey_(v7, v8, (uint64_t)self->_destinationNetworkSSID, *MEMORY[0x24BE2E360]);
  objc_msgSend_acquireDestinationNetworkPassword(self, v9, v10);
  if (objc_msgSend_length(self->_destinationNetworkPassword, v11, v12))
    objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)self->_destinationNetworkPassword, *MEMORY[0x24BE2E358]);
  objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)self->_postConfigTargetDeviceFriendlyName, *MEMORY[0x24BE2E328]);
  if (objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, v14, (uint64_t)self->_targetMFiDeviceScanRecord))
  {
    v16 = (void *)objc_msgSend_objectForKey_(self->_setupOptionsDict, v15, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_AirPlayPassword"));
    v19 = objc_msgSend_length(v16, v17, v18);
    v20 = v19 != 0;
    if (v19)
      objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)v16, *MEMORY[0x24BE2E330]);
    self->_easyConfigPreConfigMetrics.playPasswordSet = v20;
  }
  objc_msgSend_setConfiguration_(self->_easyConfigDevice, v15, (uint64_t)v7);
  objc_msgSend_setPausesAfterApply_(self->_easyConfigDevice, v21, 1);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController createEasyConfigDeviceConfiguration]", 800, (uint64_t)"Config dict: %@\n", v22, v23, v24, v25, (uint64_t)v7);
}

- (void)startEasyConfigWhenReady
{
  const char *v3;
  uint64_t v4;

  if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, a2, (uint64_t)self->_targetMFiDeviceScanRecord) & 1) != 0|| !objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v3, (uint64_t)self->_targetMFiDeviceScanRecord))
  {
    MEMORY[0x24BEDD108](self, sel__startEasyConfigWhenReady, v4);
  }
  else
  {
    MEMORY[0x24BEDD108](self, sel_askUserForUncertified, v4);
  }
}

- (void)_startEasyConfigWhenReady
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *linkUpOnTargetSWAPSemaphore;
  dispatch_time_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 successfullyEstablishedLinkOnTargetDeviceSWAP;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21A733E1C;
  block[3] = &unk_24DD04D48;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend_createEasyConfigDeviceConfiguration(self, v4, v5);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"_joinTargetSWAPCompleteSemaphore - WAITING\n", v6, v7, v8, v9, v21);
  linkUpOnTargetSWAPSemaphore = self->_linkUpOnTargetSWAPSemaphore;
  v11 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(linkUpOnTargetSWAPSemaphore, v11);
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"_joinTargetSWAPCompleteSemaphore - DONE\n", v14, v15, v16, v17, v21);
  successfullyEstablishedLinkOnTargetDeviceSWAP = self->_successfullyEstablishedLinkOnTargetDeviceSWAP;
  self->_easyConfigPreConfigMetrics.hitJoiningTargetSWAPTimeout = !successfullyEstablishedLinkOnTargetDeviceSWAP;
  if (successfullyEstablishedLinkOnTargetDeviceSWAP)
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"Successfully joined target device SWAP\n", v14, v15, v16, v17, v21);
    objc_msgSend_startListeningForEasyConfigDeviceStatusNotifications(self, v12, v13);
    objc_msgSend_start(self->_easyConfigDevice, v19, v20);
  }
  else
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController _startEasyConfigWhenReady]", 800, (uint64_t)"ERROR: Did not successfully join target device SWAP. Hit %d sec timeout\n", v14, v15, v16, v17, 30);
    v22[0] = v3;
    v22[1] = 3221225472;
    v22[2] = sub_21A733E2C;
    v22[3] = &unk_24DD04D48;
    v22[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v22);
  }
}

- (id)targetBaseInfoDict
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  NSString *destinationNetworkSSID;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSDictionary *accessoryResponseDict;

  v4 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  v7 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6);
  v9 = objc_msgSend_objectForKey_(self->_autoGuessRecommendationDict, v8, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  objc_msgSend_setObject_forKey_(v4, v10, v9, CFSTR("BSAutoGuess_Recommendation"));
  objc_msgSend_setObject_forKey_(v4, v11, (uint64_t)self->_autoGuessRecommendationDict, CFSTR("kSetupBaseStationInfoKey_RecommendationInfo"));
  objc_msgSend_setObject_forKey_(v4, v12, (uint64_t)self->_targetMFiDeviceScanRecord, CFSTR("kSetupBaseStationInfoKey_BrowseRecord"));
  destinationNetworkSSID = self->_destinationNetworkSSID;
  v14 = sub_21A690CA4(1918979693);
  objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)destinationNetworkSSID, v14);
  objc_msgSend_setObject_forKey_(v4, v16, (uint64_t)v7, CFSTR("kSetupBaseStationInfoKey_RadioInfo"));
  accessoryResponseDict = self->_accessoryResponseDict;
  if (accessoryResponseDict)
    objc_msgSend_setObject_forKey_(v4, v17, (uint64_t)accessoryResponseDict, CFSTR("kSetupBaseStationInfoKey_MFiAccessoryResponse"));
  return v4;
}

- (void)askUserForUncertified
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController askUserForUncertified]", 800, (uint64_t)"\n", v2, v3, v4, v5, v7);
  MEMORY[0x24BEDD108](self->super.super._uiDelegate, sel_callbackAskUserForUncertifiedForController_, self);
}

- (void)callbackAskUserForUncertifiedResult:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (a3)
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForUncertifiedResult:]", 800, (uint64_t)"User denied uncertified accessory.\n", v3, v4, v5, v6, v8);
    objc_msgSend_endSetup_(self, a2, 4294960573);
  }
  else
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForUncertifiedResult:]", 800, (uint64_t)"User approved uncertified accessory.\n", v3, v4, v5, v6, v8);
    objc_msgSend_performSelectorInBackground_withObject_(self, a2, (uint64_t)sel__startEasyConfigWhenReady, 0);
  }
}

- (void)askUserForSetupCodeWithRetryStatus:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController askUserForSetupCodeWithRetryStatus:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v8);
  MEMORY[0x24BEDD108](self->super.super._uiDelegate, sel_callbackAskUserForSetupCode_isRetry_forController_, 2);
}

- (void)callbackAskUserForSetupCodeResult:(int)a3 password:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  if (a3)
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForSetupCodeResult:password:]", 800, (uint64_t)"Failed to obtain MFi setup code from user.\n", v4, v5, v6, v7, v10);
    objc_msgSend_stop(self->_easyConfigDevice, a2, *(uint64_t *)&a3);
  }
  else
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForSetupCodeResult:password:]", 800, (uint64_t)"Successfully obtained MFi setup code from user.\n", v4, v5, v6, v7, v10);
    MEMORY[0x24BEDD108](self->_easyConfigDevice, sel_trySetupCode_, a4);
  }
}

- (void)askUserForNetworkPassword:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  self->_promptedUserForDestinationWiFiPSK = 1;
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController askUserForNetworkPassword:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v9);
  objc_msgSend_callbackAskUserForPassword_param_forController_(self->super.super._uiDelegate, a2, 1, a3, self);
}

- (void)callbackAskUserForPasswordResult:(int)a3 password:(id)a4 remember:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForPasswordResult:password:remember:]", 800, (uint64_t)"Did NOT get destination network password from user\n", *(uint64_t *)&a5, v5, v6, v7, v21);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (id)objc_msgSend_copy(self->_mfiSetupDelegates, a2, *(uint64_t *)&a3, 0);
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v18 = objc_msgSend_targetBaseInfoDict(self, v16, v17);
            objc_msgSend_setupCompleteWithResult_baseStationInfo_forController_(v15, v19, 4294960527, v18, self);
          }
        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v21, v25, 16);
      }
      while (v12);
    }
  }
  else
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController callbackAskUserForPasswordResult:password:remember:]", 800, (uint64_t)"Successfully obtained destination network password from user.\n", *(uint64_t *)&a5, v5, v6, v7, v21);
    objc_msgSend_setDestinationNetworkPassword_(self, a2, (uint64_t)a4);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askUserForPasswordSemaphore);
  }
}

- (int)sendProgressToUI:(int)a3 withParamDict:(id)a4
{
  NSMutableSet *mfiSetupDelegates;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  void *v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  mfiSetupDelegates = self->_mfiSetupDelegates;
  if (!mfiSetupDelegates)
    return -6762;
  v7 = *(_QWORD *)&a3;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_msgSend_copy(mfiSetupDelegates, a2, *(uint64_t *)&a3, 0);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (!v10)
    return -6700;
  v11 = v10;
  v12 = *(_QWORD *)v19;
  v13 = -6700;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_setupProgressUpdated_status_paramDict_forController_(v15, v16, v7, 0, a4, self);
        v13 = 0;
      }
    }
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v18, v22, 16);
  }
  while (v11);
  return v13;
}

- (int)sendSetupCompleteToUIWithResult:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *mfiSetupDelegates;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v7 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController sendSetupCompleteToUIWithResult:]", 800, (uint64_t)"%#m\n", v3, v4, v5, v6, v7);
  mfiSetupDelegates = self->_mfiSetupDelegates;
  if (!mfiSetupDelegates)
    return -6762;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_msgSend_copy(mfiSetupDelegates, a2, *(uint64_t *)&a3);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v27, 16);
  if (!v12)
    return -6700;
  v13 = v12;
  v14 = *(_QWORD *)v24;
  v15 = -6700;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = objc_msgSend_targetBaseInfoDict(self, v18, v19);
        objc_msgSend_setupCompleteWithResult_baseStationInfo_forController_(v17, v21, v7, v20, self);
        v15 = 0;
      }
    }
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v18, (uint64_t)&v23, v27, 16);
  }
  while (v13);
  return v15;
}

- (int)sendiAPOverWiFiDeviceConfiguredXPCMessage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _xpc_connection_s *mach_service;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  int v22;
  uint64_t v24;

  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController sendiAPOverWiFiDeviceConfiguredXPCMessage]", 800, (uint64_t)"\n", v2, v3, v4, v5, v24);
  mach_service = xpc_connection_create_mach_service("com.apple.iaptransportd.xpc", 0, 0);
  qword_2550F4DE0 = (uint64_t)mach_service;
  if (!mach_service && dword_2550F4C10 <= 800)
  {
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController sendiAPOverWiFiDeviceConfiguredXPCMessage]", 800, (uint64_t)"ERROR: Unable to get iaptransportd xpc connection\n", v8, v9, v10, v11, v24);
    mach_service = (_xpc_connection_s *)qword_2550F4DE0;
  }
  if (mach_service
    && (xpc_connection_set_event_handler(mach_service, &unk_24DD07B88),
        xpc_connection_resume((xpc_connection_t)qword_2550F4DE0),
        (v12 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    v13 = v12;
    xpc_dictionary_set_string(v12, "requestType", "kAirPortAssistantKey_ConfigurediAP");
    v15 = (const char *)objc_msgSend_cStringUsingEncoding_(self->_postConfigTargetDeviceFriendlyName, v14, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_Name", v15);
    v17 = (void *)objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v16, (uint64_t)CFSTR("BSSID"));
    v19 = (const char *)objc_msgSend_cStringUsingEncoding_(v17, v18, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_MAC_Address", v19);
    v21 = (const char *)objc_msgSend_cStringUsingEncoding_(self->_destinationNetworkSSID, v20, 4);
    xpc_dictionary_set_string(v13, "kAirPortAssistantKey_ConfigurediAP_Destination_Network_SSID", v21);
    xpc_connection_send_message((xpc_connection_t)qword_2550F4DE0, v13);
    xpc_release(v13);
    v22 = 0;
    self->_postediAPAccessoryConfiguredNotification = 1;
  }
  else
  {
    v22 = -6762;
  }
  xpc_release((xpc_object_t)qword_2550F4DE0);
  return v22;
}

- (int)endSetup:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BSConfigurationContext *configContext;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  EasyConfigDevice *easyConfigDevice;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v28;

  v7 = *(_QWORD *)&a3;
  if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController endSetup:]", 800, (uint64_t)"%#m\n", v3, v4, v5, v6, v7);
  objc_msgSend_stopListeningToAllNotifications(self, a2, *(uint64_t *)&a3);
  if (self->_setupEnded)
  {
    v11 = 0;
  }
  else
  {
    self->_setupEnded = 1;
    objc_msgSend_sendSetupCompleteToUIWithResult_(self, v9, v7);
    if ((_DWORD)v7
      || !objc_msgSend_scanInfoIsiAPOverWiFiDevice_(WiFiUtils, v12, (uint64_t)self->_targetMFiDeviceScanRecord))
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_msgSend_sendiAPOverWiFiDeviceConfiguredXPCMessage(self, v12, v13);
      if (v11 && dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController endSetup:]", 800, (uint64_t)"ERROR: Unable to send iAP Accessory Configured XPC message\n", v14, v15, v16, v17, v28);
    }
    objc_msgSend_logCompletionStatus_(self, v12, v7);
  }
  configContext = self->super._configContext;
  if (configContext)
  {
    v19 = sub_21A6DD5FC((uint64_t)configContext);
    sub_21A70DDCC(v19);
  }
  v20 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v9, v10);
  objc_msgSend_setAutoJoinState_(v20, v21, 1);
  easyConfigDevice = self->_easyConfigDevice;
  if (easyConfigDevice)
  {
    objc_msgSend_setPreConfigMetrics_(easyConfigDevice, v22, (uint64_t)&self->_easyConfigPreConfigMetrics);
    objc_msgSend_setPostConfigMetrics_(self->_easyConfigDevice, v24, (uint64_t)&self->_easyConfigPostConfigMetrics);
    objc_msgSend_stop(self->_easyConfigDevice, v25, v26);
  }
  return v11;
}

- (void)stopListeningToAllNotifications
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  objc_msgSend_stopListeningToEasyConfigDeviceStatusNotifications(self, a2, v2);
  v6 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v4, v5);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"), 0);
  v10 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v8, v9);
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
}

- (void)logCompletionStatus:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const __CFString *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  CFAbsoluteTime Current;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int64_t lastHeardEasyConfigProgressNotification;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const __CFString *v134;
  const __CFString *v135;
  const __CFString *v136;
  const __CFString *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;

  v7 = *(_QWORD *)&a3;
  if (dword_2550F4C10 <= 800)
  {
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"************************ MFI CONFIG RESULTS *************************\n", v3, v4, v5, v6, v138);
    if (dword_2550F4C10 <= 800)
    {
      if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"TARGET INFO:\n", v3, v4, v5, v6, v138);
      if (dword_2550F4C10 <= 800)
      {
        if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        {
          v10 = (void *)MEMORY[0x24BDD17C8];
          if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v9, (uint64_t)self->_targetMFiDeviceScanRecord))
          {
            if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v11, (uint64_t)self->_targetMFiDeviceScanRecord) == 1)
            {
              v13 = objc_msgSend_stringWithUTF8String_(v10, v12, (uint64_t)"Base Station");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v12, (uint64_t)self->_targetMFiDeviceScanRecord) == 2)
            {
              v13 = objc_msgSend_stringWithUTF8String_(v10, v18, (uint64_t)"Apple AirPlay Device");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v18, (uint64_t)self->_targetMFiDeviceScanRecord) == 3)
            {
              v13 = objc_msgSend_stringWithUTF8String_(v10, v19, (uint64_t)"MFi AirPlay Device");
            }
            else if (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v19, (uint64_t)self->_targetMFiDeviceScanRecord) == 4)
            {
              v13 = objc_msgSend_stringWithUTF8String_(v10, v20, (uint64_t)"MFi Device");
            }
            else
            {
              v13 = objc_msgSend_stringWithUTF8String_(v10, v20, (uint64_t)"?");
            }
          }
          else
          {
            v13 = objc_msgSend_stringWithUTF8String_(v10, v11, (uint64_t)"Unknown");
          }
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DEVICE KIND..: %@\n", v14, v15, v16, v17, v13);
        }
        if (dword_2550F4C10 <= 800)
        {
          if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
          {
            v21 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v9, (uint64_t)self->_targetMFiDeviceScanRecord);
            sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    FRIENDLY NAME: %@\n", v22, v23, v24, v25, v21);
          }
          if (dword_2550F4C10 <= 800)
          {
            if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
            {
              v26 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v9, (uint64_t)CFSTR("SSID_STR"));
              sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    SSID.........: %@\n", v27, v28, v29, v30, v26);
            }
            if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
            {
              v31 = objc_msgSend_objectForKey_(self->_targetMFiDeviceScanRecord, v9, (uint64_t)CFSTR("BSSID"));
              sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    MAC..........: %@\n", v32, v33, v34, v35, v31);
            }
          }
        }
      }
    }
  }
  if (self->_accessoryResponseDict)
  {
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    APP MATCHING VALUES:\n", v3, v4, v5, v6, v138);
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v37 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E2F8]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        BUNDLE SEED ID: %@\n", v38, v39, v40, v41, v37);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v42 = (void *)objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E310]);
      v44 = objc_msgSend_componentsJoinedByString_(v42, v43, (uint64_t)CFSTR(", "));
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        PROTOCOLS.....: %@\n", v45, v46, v47, v48, v44);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v49 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E328]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        NAME..........: %@\n", v50, v51, v52, v53, v49);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v54 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E318]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MANUFACTURER..: %@\n", v55, v56, v57, v58, v54);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v59 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E320]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MODEL.........: %@\n", v60, v61, v62, v63, v59);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v64 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E300]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        FIRMWARE REV..: %@\n", v65, v66, v67, v68, v64);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v69 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E308]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        HARDWARE REV..: %@\n", v70, v71, v72, v73, v69);
    }
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
    {
      v139 = objc_msgSend_objectForKey_(self->_accessoryResponseDict, v36, *MEMORY[0x24BE2E350]);
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SERIAL NUMBER.: %@\n", v74, v75, v76, v77, v139);
    }
  }
  else
  {
    if (dword_2550F4C10 > 800)
      return;
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    APP MATCHING VALUES: <<NULL>>\n", v3, v4, v5, v6, v138);
  }
  if (dword_2550F4C10 <= 800)
  {
    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"CONFIGURATION:\n", v3, v4, v5, v6, v138);
    if (dword_2550F4C10 <= 800)
    {
      if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    FRIENDLY NAME: %@\n", v3, v4, v5, v6, (uint64_t)self->_postConfigTargetDeviceFriendlyName);
      if (dword_2550F4C10 <= 800)
      {
        if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
        {
          v83 = objc_msgSend_objectForKey_(self->_setupOptionsDict, v78, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_AirPlayPassword"));
          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    PLAY PASSWORD: %@\n", v84, v85, v86, v87, v83);
        }
        if (dword_2550F4C10 <= 800)
        {
          if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
            sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DESTINATION:\n", v79, v80, v81, v82, v138);
          if (dword_2550F4C10 <= 800)
          {
            if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
              sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SSID...........: %@\n", v79, v80, v81, v82, (uint64_t)self->_destinationNetworkSSID);
            if (dword_2550F4C10 <= 800)
            {
              if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
              {
                v89 = objc_msgSend_objectForKey_(self->_destinationNetworkScanRecord, v88, (uint64_t)CFSTR("BSSID"));
                sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        MAC............: %@\n", v90, v91, v92, v93, v89);
              }
              if (dword_2550F4C10 <= 800)
              {
                if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                {
                  if (objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v88, (uint64_t)self->_destinationNetworkScanRecord, 0, 0))v99 = CFSTR("Yes");
                  else
                    v99 = CFSTR("No");
                  sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SECURED........: %@\n", v95, v96, v97, v98, (uint64_t)v99);
                }
                if (dword_2550F4C10 <= 800)
                {
                  if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                  {
                    if (objc_msgSend_length(self->_destinationNetworkPassword, v88, v94))
                      v108 = CFSTR("Yes");
                    else
                      v108 = CFSTR("No");
                    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        WIFI PSK VALID.: %@\n", v104, v105, v106, v107, (uint64_t)v108);
                  }
                  if (dword_2550F4C10 <= 800)
                  {
                    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                    {
                      if (self->_promptedUserForDestinationWiFiPSK)
                        v109 = CFSTR("User");
                      else
                        v109 = CFSTR("Keychain");
                      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        WIFI PSK ORIGIN: %@\n", v100, v101, v102, v103, (uint64_t)v109);
                    }
                    if (dword_2550F4C10 <= 800)
                    {
                      if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"AWD:\n", v100, v101, v102, v103, v138);
                      if (dword_2550F4C10 <= 800)
                      {
                        if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    SWAP:\n", v100, v101, v102, v103, v138);
                        if (dword_2550F4C10 <= 800)
                        {
                          if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                            sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        LINK UP TIME: %.3f seconds\n", v100, v101, v102, v103, *(_QWORD *)&self->_easyConfigPreConfigMetrics.secondsToGetLinkUpOnSWAP);
                          if (dword_2550F4C10 <= 800)
                          {
                            if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                              sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        JOIN ERROR..: %#m\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.wifiJoinSWAPError);
                            if (dword_2550F4C10 <= 800)
                            {
                              if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        RSSI........: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.rssiOfSWAP);
                              if (dword_2550F4C10 <= 800)
                              {
                                if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                  sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SNR.........: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.snrOfSWAP);
                                if (dword_2550F4C10 <= 800)
                                {
                                  if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        CHANNEL.....: %d\n", v100, v101, v102, v103, self->_easyConfigPreConfigMetrics.channelOfSWAP);
                                  if (dword_2550F4C10 <= 800)
                                  {
                                    if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    DESTINATION AP:\n", v100, v101, v102, v103, v138);
                                    if (dword_2550F4C10 <= 800)
                                    {
                                      if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        LINK UP TIME: %.3f seconds\n", v100, v101, v102, v103, *(_QWORD *)&self->_easyConfigPostConfigMetrics.secondsToGetLinkUpOnDestination);
                                      if (dword_2550F4C10 <= 800)
                                      {
                                        if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        JOIN ERROR..: %#m\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.wifiJoinDestinationAPError);
                                        if (dword_2550F4C10 <= 800)
                                        {
                                          if (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                            sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        RSSI........: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.rssiOfDestinationAP);
                                          if (dword_2550F4C10 <= 800)
                                          {
                                            if (dword_2550F4C10 != -1
                                              || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                            {
                                              sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        SNR.........: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.snrOfDestinationAP);
                                            }
                                            if (dword_2550F4C10 <= 800)
                                            {
                                              if (dword_2550F4C10 != -1
                                                || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                              {
                                                sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"        CHANNEL.....: %d\n", v100, v101, v102, v103, self->_easyConfigPostConfigMetrics.channelOfDestinationAP);
                                              }
                                              if (dword_2550F4C10 <= 800)
                                              {
                                                if (dword_2550F4C10 != -1
                                                  || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                {
                                                  if (self->_easyConfigPreConfigMetrics.destinationNetworkRecommendationUsed)
                                                    v110 = CFSTR("Yes");
                                                  else
                                                    v110 = CFSTR("No");
                                                  sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    AUTOGUESS NETWORK USED....: %@\n", v100, v101, v102, v103, (uint64_t)v110);
                                                }
                                                if (dword_2550F4C10 <= 800)
                                                {
                                                  if (dword_2550F4C10 != -1
                                                    || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                  {
                                                    if (self->_easyConfigPreConfigMetrics.userChangedFriendlyName)
                                                      v111 = CFSTR("Yes");
                                                    else
                                                      v111 = CFSTR("No");
                                                    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    USER CHANGED FRIENDLY NAME: %@\n", v100, v101, v102, v103, (uint64_t)v111);
                                                  }
                                                  if (dword_2550F4C10 <= 800)
                                                  {
                                                    if (dword_2550F4C10 != -1
                                                      || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                    {
                                                      if (self->_easyConfigPreConfigMetrics.playPasswordSet)
                                                        v112 = CFSTR("Yes");
                                                      else
                                                        v112 = CFSTR("No");
                                                      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    PLAY PASSWORD SET.........: %@\n", v100, v101, v102, v103, (uint64_t)v112);
                                                    }
                                                    if (dword_2550F4C10 <= 800)
                                                    {
                                                      if (dword_2550F4C10 != -1
                                                        || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                      {
                                                        Current = CFAbsoluteTimeGetCurrent();
                                                        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"    TOTAL TIME TO CONFIG......: %.3f seconds\n", v118, v119, v120, v121, COERCE__INT64(Current - self->_easyConfigPreConfigMetrics.startTime));
                                                      }
                                                      if (dword_2550F4C10 <= 800)
                                                      {
                                                        if (dword_2550F4C10 != -1
                                                          || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                        {
                                                          sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"STATUS:\n", v113, v114, v115, v116, v138);
                                                        }
                                                        if (dword_2550F4C10 <= 800)
                                                        {
                                                          if (dword_2550F4C10 == -1
                                                            && !sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                          {
LABEL_229:
                                                            if (dword_2550F4C10 <= 800)
                                                            {
                                                              if (dword_2550F4C10 != -1
                                                                || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                              {
                                                                if (self->_successfullyEstablishedLinkOnTargetDeviceSWAP)
                                                                  v134 = CFSTR("Yes");
                                                                else
                                                                  v134 = CFSTR("No");
                                                                sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     ESTABLISHED LINK ON TARGET SWAP...: %@\n", v123, v124, v125, v126, (uint64_t)v134);
                                                              }
                                                              if (dword_2550F4C10 <= 800)
                                                              {
                                                                if (dword_2550F4C10 != -1
                                                                  || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                                {
                                                                  if (self->_successfullyEstablishedLinkOnDestinationAP)
                                                                    v135 = CFSTR("Yes");
                                                                  else
                                                                    v135 = CFSTR("No");
                                                                  sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     ESTABLISHED LINK ON DESTINATION AP: %@\n", v123, v124, v125, v126, (uint64_t)v135);
                                                                }
                                                                if (dword_2550F4C10 <= 800)
                                                                {
                                                                  if (dword_2550F4C10 != -1
                                                                    || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                                  {
                                                                    if (self->_destinationNetworkPasswordAccepted)
                                                                      v136 = CFSTR("Yes");
                                                                    else
                                                                      v136 = CFSTR("No");
                                                                    sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     DESTINATION AP PASSWORD ACCEPTED..: %@\n", v123, v124, v125, v126, (uint64_t)v136);
                                                                  }
                                                                  if (dword_2550F4C10 <= 800)
                                                                  {
                                                                    if (dword_2550F4C10 != -1
                                                                      || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                                    {
                                                                      if (self->_postediAPAccessoryConfiguredNotification)
                                                                        v137 = CFSTR("Yes");
                                                                      else
                                                                        v137 = CFSTR("No");
                                                                      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     POSTED iAP OVER WIFI NOTIFICATION.: %@\n", v123, v124, v125, v126, (uint64_t)v137);
                                                                    }
                                                                    if (dword_2550F4C10 <= 800)
                                                                    {
                                                                      if (dword_2550F4C10 != -1
                                                                        || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u))
                                                                      {
                                                                        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     RESULT............................: %#m\n", v123, v124, v125, v126, v7);
                                                                      }
                                                                      if (dword_2550F4C10 <= 800
                                                                        && (dword_2550F4C10 != -1
                                                                         || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
                                                                      {
                                                                        sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"*********************************************************************\n", v123, v124, v125, v126, v140);
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                            return;
                                                          }
                                                          lastHeardEasyConfigProgressNotification = self->_lastHeardEasyConfigProgressNotification;
                                                          if (lastHeardEasyConfigProgressNotification <= 29)
                                                          {
                                                            v128 = "Start";
                                                            switch(lastHeardEasyConfigProgressNotification)
                                                            {
                                                              case 1:
                                                                goto LABEL_227;
                                                              case 2:
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Final");
                                                                break;
                                                              case 3:
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Error");
                                                                break;
                                                              case 4:
                                                              case 5:
                                                              case 6:
                                                              case 7:
                                                              case 8:
                                                              case 9:
                                                                goto LABEL_221;
                                                              case 10:
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Search for pre-config device");
                                                                break;
                                                              default:
                                                                if (lastHeardEasyConfigProgressNotification != 20)
                                                                  goto LABEL_221;
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Authenticating pre-config device");
                                                                break;
                                                            }
                                                            goto LABEL_228;
                                                          }
                                                          if (lastHeardEasyConfigProgressNotification <= 49)
                                                          {
                                                            if (lastHeardEasyConfigProgressNotification == 30)
                                                            {
                                                              v128 = "Applying configuration to device";
LABEL_227:
                                                              v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)v128);
                                                              goto LABEL_228;
                                                            }
                                                            if (lastHeardEasyConfigProgressNotification == 40)
                                                            {
                                                              v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Applied configuration to device");
                                                              goto LABEL_228;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            switch(lastHeardEasyConfigProgressNotification)
                                                            {
                                                              case '2':
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Searching for post-config device");
                                                                goto LABEL_228;
                                                              case '<':
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Performing post-config check of device");
                                                                goto LABEL_228;
                                                              case 'F':
                                                                v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Performed post-config check of device");
LABEL_228:
                                                                sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"-[AUMFiSetupController logCompletionStatus:]", 800, (uint64_t)"     LAST EASYCONFIG NOTIFICATION......: %@\n", v130, v131, v132, v133, v129);
                                                                goto LABEL_229;
                                                            }
                                                          }
LABEL_221:
                                                          if (lastHeardEasyConfigProgressNotification == 100)
                                                            v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"Configuration complete");
                                                          else
                                                            v129 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v122, (uint64_t)"?");
                                                          goto LABEL_228;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (NSMutableSet)setupDelegates
{
  return self->_mfiSetupDelegates;
}

- (NSTimer)linkUpOnDestinationNetworkTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLinkUpOnDestinationNetworkTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)destinationNetworkPassword
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDestinationNetworkPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

@end

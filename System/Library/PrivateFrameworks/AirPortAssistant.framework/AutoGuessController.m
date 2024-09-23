@implementation AutoGuessController

- (AutoGuessController)init
{
  const char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AutoGuessController;
  v4 = -[AssistantCallbackController init](&v33, sel_init);
  if (v4)
  {
    v5 = objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v2, v3);
    objc_msgSend_set_browsedBases_(v4, v6, v5);
    objc_msgSend_setWiFiScanStatus_(v4, v7, 0);
    objc_msgSend_setBonjourBrowseStatus_(v4, v8, 0);
    sub_21A702958((const void ***)v4 + 9, v9, v10, v11, v12, v13, v14, v15);
    v16 = *((_QWORD *)v4 + 9);
    v19 = objc_msgSend_assistantCallback(v4, v17, v18);
    sub_21A702AD4(v16, v19, (uint64_t)v4, v20, v21, v22, v23, v24);
    sub_21A702B70(*((_QWORD *)v4 + 9), (uint64_t)sub_21A674D1C, (uint64_t)v4, v25, v26, v27, v28, v29);
  }
  v30 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v2, v3);
  objc_msgSend_addSuiteNamed_(v30, v31, (uint64_t)CFSTR("com.apple.airport.airportassistant"));
  return (AutoGuessController *)v4;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v18;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, CFSTR("com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification"), 0);
  sub_21A702A48((const void **)self->_guessContext, v6, v7, v8, v9, v10, v11, v12);
  self->_guessContext = 0;
  objc_msgSend_set_browsedBases_(self, v13, 0);
  v16 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v14, v15);
  objc_msgSend_removeSuiteNamed_(v16, v17, (uint64_t)CFSTR("com.apple.airport.airportassistant"));
  v18.receiver = self;
  v18.super_class = (Class)AutoGuessController;
  -[AssistantCallbackController dealloc](&v18, sel_dealloc);
}

- (int)startWiFiScanner
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v18;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController startWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v18);
  v8 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (objc_msgSend_airPortIsOn(v8, v9, v10))
  {
    objc_msgSend_setWiFiScanStatus_(self, v11, 1);
    v14 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v12, v13);
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)self, sel_wirelessScanDone_, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
    objc_msgSend_asyncWiFiScan_wifiType_merge_maxAge_(v8, v16, 0, 3, 0, 0);
  }
  else
  {
    objc_msgSend_setWiFiScanStatus_(self, v11, 2);
  }
  return 0;
}

- (int)runAutoGuessWithWifiScanInfos:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const __CFArray *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  if (!objc_msgSend_targetMACAddress(self, a2, (uint64_t)a3)
    && !objc_msgSend_targetScanRecord(self, v5, v6)
    && !objc_msgSend_targetBrowseRecord(self, v5, v6))
  {
    return -6705;
  }
  self->_updatedTargetInfo = 0;
  v7 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6);
  objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)self, sel_uiAssetsUpdated_, CFSTR("com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification"), 0);
  if (a3)
  {
    v13 = objc_msgSend_count(a3, v9, v10) ? (const __CFArray *)a3 : 0;
    if (!objc_msgSend_targetScanRecord(self, v11, v12))
    {
      if (v13)
      {
        if (objc_msgSend_targetMACAddress(self, v9, v10))
        {
          v14 = (const __CFString *)objc_msgSend_targetMACAddress(self, v9, v10);
          v15 = sub_21A68F8D8(v14, 0, v13);
          if (v15 != -1)
          {
            v16 = objc_msgSend_objectAtIndex_(v13, v9, v15);
            objc_msgSend_setTargetScanRecord_(self, v17, v16);
          }
        }
      }
    }
  }
  if (!objc_msgSend_targetMACAddress(self, v9, v10))
  {
    v20 = (void *)objc_msgSend_targetInfo(self, v18, v19);
    if (!v20)
      return -6705;
    v22 = objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("kRecommendationTargetInfoKey_MACAddress"));
    objc_msgSend_setTargetMACAddress_(self, v23, v22);
  }
  if (!objc_msgSend_targetMACAddress(self, v18, v19))
    return -6705;
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_autoguessProgressUpdated_paramString_(self->_delegate, v24, 15, 0);
  }
  objc_msgSend_setGuessCompletionDict_(self, v24, 0);
  v27 = objc_msgSend_targetMACAddress(self, v25, v26);
  return MEMORY[0x24BEDD108](self, sel_startAutoGuessForUnconfiguredMACAddress_withWifiScanInfos_, v27);
}

- (int)cancelAutoGuess
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_autoguessProgressUpdated_paramString_(self->_delegate, a2, 19, 0);
  objc_msgSend_cancel(self->_autoGuessThread, a2, v2);
  if (objc_msgSend_wifiScanStatus(self, v4, v5) == 1)
    objc_msgSend_cancelWiFiScanner(self, v6, v7);
  else
    objc_msgSend_setWiFiScanStatus_(self, v6, 3);
  if (objc_msgSend_bonjourBrowseStatus(self, v8, v9) == 1)
    objc_msgSend_cancelBonjourBrowser(self, v10, v11);
  else
    objc_msgSend_setBonjourBrowseStatus_(self, v10, 3);
  return sub_21A7093A4((uint64_t)self->_guessContext, v12, v13, v14, v15, v16, v17, v18);
}

- (NSString)targetMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetMACAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)targetScanRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetScanRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)targetBrowseRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTargetBrowseRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSTimer)_browseReadyTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_browseReadyTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)_browsedBases
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)set_browsedBases:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)_wifiScanInfos
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)set_wifiScanInfos:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (AutoGuessUIDelegate)delegate
{
  return (AutoGuessUIDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSString)lastParamString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastParamString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)currentParamString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentParamString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)lastAutoGuessUISelector
{
  return self->_lastAutoGuessUISelector;
}

- (void)setLastAutoGuessUISelector:(int)a3
{
  self->_lastAutoGuessUISelector = a3;
}

- (int)currentAutoGuessUISelector
{
  return self->_currentAutoGuessUISelector;
}

- (void)setCurrentAutoGuessUISelector:(int)a3
{
  self->_currentAutoGuessUISelector = a3;
}

- (NSDictionary)unconfiguredDeviceThatIsBeingSetup
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUnconfiguredDeviceThatIsBeingSetup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDictionary)lastInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastInstrumentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)guessCompletionDict
{
  return self->_guessCompletionDict;
}

- (void)setGuessCompletionDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (int)startAutoGuessForUnconfiguredMACAddress:(id)a3 withWifiScanInfos:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  int result;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
  {
    objc_msgSend_count(a4, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startAutoGuessForUnconfiguredMACAddress:withWifiScanInfos:]", 100, (uint64_t)"macAddress: %@ [scanInfos count]: %d\n", v7, v8, v9, v10, (uint64_t)a3);
  }
  if (!a3 || !objc_msgSend_length(a3, a2, (uint64_t)a3))
    return -6705;
  objc_msgSend_removeAllObjects(self->_browsedBases, v11, v12);
  if (a4)
    objc_msgSend_set_wifiScanInfos_(self, v13, (uint64_t)a4);
  if (objc_msgSend_targetScanRecord(self, v13, v14)
    && (v17 = objc_msgSend_targetScanRecord(self, v15, v16),
        objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, v18, v17)))
  {
    objc_msgSend_setBonjourBrowseStatus_(self, v15, 2);
  }
  else
  {
    result = objc_msgSend_startBonjourBrowser(self, v15, v16);
    if (result)
      return result;
  }
  if (self->_wifiScanInfos
    || objc_msgSend_wifiScanStatus(self, v19, v20)
    || (result = objc_msgSend_startWiFiScanner(self, v19, v20)) == 0)
  {
    objc_msgSend_startAutoGuessIfReady(self, v19, v20);
    return 0;
  }
  return result;
}

- (void)startAutoGuessIfReady
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSThread *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startAutoGuessIfReady]", 100, (uint64_t)"\n", v3, v4, v5, v6, v21);
  if (!self->_autoGuessThread
    && objc_msgSend_wifiScanStatus(self, a2, v2) != 3
    && objc_msgSend_bonjourBrowseStatus(self, v8, v9) != 3)
  {
    objc_msgSend_updateTargetInfo_(self, v10, 0);
    if ((self->_wifiScanInfos || objc_msgSend_wifiScanStatus(self, v11, v12) == 2)
      && objc_msgSend_bonjourBrowseStatus(self, v11, v12) == 2)
    {
      v13 = objc_allocWithZone(MEMORY[0x24BDD17F0]);
      v16 = objc_msgSend_targetMACAddress(self, v14, v15);
      v18 = (NSThread *)(id)objc_msgSend_initWithTarget_selector_object_(v13, v17, (uint64_t)self, sel_runAutoGuessThread_, v16);
      self->_autoGuessThread = v18;
      objc_msgSend_start(v18, v19, v20);
    }
  }
}

- (void)autoGuessEngineComplete
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
  AutoGuessController *v14;
  uint64_t v15;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) autoGuessEngineComplete]", 100, (uint64_t)"\n", v3, v4, v5, v6, v15);
  v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, CFSTR("com.apple.airport.airportutility.DataCache.UIAssets.Refresh.Notification"), 0);
  if (self->_autoJoinState)
  {
    v12 = (void *)objc_msgSend_sharedInstanceRef(WiFiUtils, v10, v11);
    objc_msgSend_setAutoJoinState_(v12, v13, self->_autoJoinState);
  }
  self->_autoJoinState = 0;
  v14 = self;
}

- (id)targetInfo
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  unsigned int v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;

  if (!objc_msgSend_targetScanRecord(self, a2, v2) && !objc_msgSend_targetBrowseRecord(self, v4, v5))
    return 0;
  v6 = (void *)objc_msgSend_targetBrowseRecord(self, v4, v5);
  v8 = (void *)objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("syAP"));
  v13 = objc_msgSend_integerValue(v8, v9, v10);
  if (v13)
  {
    v14 = objc_msgSend_targetBrowseRecord(self, v11, v12);
    v22 = sub_21A68E344(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v25 = objc_msgSend_targetScanRecord(self, v11, v12);
    v13 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v26, v25);
    v29 = objc_msgSend_targetScanRecord(self, v27, v28);
    v22 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v30, v29);
  }
  v31 = v22;
  if (v22 - 3 > 1)
  {
    v37 = (void *)objc_msgSend_targetBrowseRecord(self, v23, v24);
    v39 = objc_msgSend_objectForKey_(v37, v38, (uint64_t)CFSTR("name"));
    if (v39)
      goto LABEL_11;
    v40 = (void *)objc_msgSend_targetScanRecord(self, v35, v36);
    v34 = objc_msgSend_objectForKey_(v40, v41, (uint64_t)CFSTR("SSID_STR"));
  }
  else
  {
    v32 = objc_msgSend_targetScanRecord(self, v23, v24);
    v34 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v33, v32);
  }
  v39 = v34;
LABEL_11:
  v42 = (void *)objc_msgSend_targetBrowseRecord(self, v35, v36);
  v46 = objc_msgSend_objectForKey_(v42, v43, (uint64_t)CFSTR("raMA"));
  if (v46)
  {
    if (!v39)
      return 0;
  }
  else
  {
    v47 = (void *)objc_msgSend_targetScanRecord(self, v44, v45);
    v46 = objc_msgSend_objectForKey_(v47, v48, (uint64_t)CFSTR("BSSID"));
    if (!v39)
      return 0;
  }
  if (v46)
  {
    v49 = (void *)MEMORY[0x24BDBCE70];
    v50 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v44, v13);
    v52 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v51, v31);
    return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v49, v53, v39, CFSTR("kRecommendationTargetInfoKey_BaseName"), v50, CFSTR("kRecommendationTargetInfoKey_ProductID"), v46, CFSTR("kRecommendationTargetInfoKey_MACAddress"), v52, CFSTR("kRecommendationTargetInfoKey_DeviceKind"), 0);
  }
  return 0;
}

- (void)updateTargetInfo:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v7 = a3;
  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) updateTargetInfo:]", 100, (uint64_t)"inForceUpdate: %d _updatedTargetInfo: %d\n", v3, v4, v5, v6, v7);
  if (!self->_updatedTargetInfo || v7)
  {
    v10 = objc_msgSend_targetInfo(self, a2, a3);
    if (v10)
    {
      v11 = v10;
      if (self->_delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend_autoguessUpdateTargetInfo_(self->_delegate, v12, v11);
          self->_updatedTargetInfo = 1;
        }
      }
    }
  }
}

- (void)uiAssetsUpdated:(id)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v4 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  if (v4)
  {
    v6 = (void *)objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("productID"));
    v11 = objc_msgSend_integerValue(v6, v7, v8);
    if ((_DWORD)v11)
    {
      v12 = (void *)objc_msgSend_targetInfo(self, v9, v10);
      v14 = (void *)objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("kRecommendationTargetInfoKey_ProductID"));
      v22 = objc_msgSend_integerValue(v14, v15, v16);
      if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) uiAssetsUpdated:]", 100, (uint64_t)"asset updated id: %d my target id: %d\n", v18, v19, v20, v21, v11);
      if (v22)
      {
        if ((_DWORD)v11 == v22)
          objc_msgSend_updateTargetInfo_(self, v17, 1);
      }
    }
  }
}

- (BOOL)okToSwitchToShortBonjourTimeout:(id)a3
{
  _BOOL4 onShortTimer;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (self->_onShortTimer)
  {
    return 1;
  }
  else
  {
    v6 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
    if ((objc_msgSend_airPortIsOn(v6, v7, v8) & 1) != 0)
    {
      onShortTimer = sub_21A68E5C0((const __CFString *)a3, v9, v10, v11, v12, v13, v14, v15);
      self->_onShortTimer = onShortTimer;
      if (dword_2550EE3B0 <= 100)
      {
        if (dword_2550EE3B0 != -1
          || (v17 = sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u), onShortTimer = self->_onShortTimer, v17))
        {
          objc_msgSend_objectForKey_(a3, v16, (uint64_t)CFSTR("raMA"));
          sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) okToSwitchToShortBonjourTimeout:]", 100, (uint64_t)"_onShortTimer: %d inBaseStation: %@\n", v18, v19, v20, v21, onShortTimer);
          return self->_onShortTimer;
        }
      }
    }
    else
    {
      onShortTimer = 1;
      self->_onShortTimer = 1;
    }
  }
  return onShortTimer;
}

- (void)setWiFiScanStatus:(int)a3
{
  objc_sync_enter(self);
  self->_wifiScanStatus = a3;
  objc_sync_exit(self);
}

- (int)wifiScanStatus
{
  int wifiScanStatus;

  objc_sync_enter(self);
  wifiScanStatus = self->_wifiScanStatus;
  objc_sync_exit(self);
  return wifiScanStatus;
}

- (void)setBonjourBrowseStatus:(int)a3
{
  objc_sync_enter(self);
  self->_bonjourBrowseStatus = a3;
  objc_sync_exit(self);
}

- (int)bonjourBrowseStatus
{
  int bonjourBrowseStatus;

  objc_sync_enter(self);
  bonjourBrowseStatus = self->_bonjourBrowseStatus;
  objc_sync_exit(self);
  return bonjourBrowseStatus;
}

- (int)startBonjourBrowser
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  ACPBrowserSession **p_acpBrowserSession;
  int result;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  BOOL v23;
  double v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) startBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v28);
  p_acpBrowserSession = &self->_acpBrowserSession;
  if (self->_acpBrowserSession)
    objc_msgSend_stopBonjourBrowser(self, a2, v2);
  result = sub_21A67945C("com.apple.bonjour.txt.Updated", "com.apple.bonjour.txt.Removed", "AutoGuess:BrowseSession", (uint64_t *)&self->_acpBrowserSession);
  if (!result)
  {
    if (*p_acpBrowserSession)
    {
      v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11);
      objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)self, sel_bonjourTXTUpdated_, CFSTR("com.apple.bonjour.txt.Updated"), 0);
      v16 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15);
      objc_msgSend_addObserver_selector_name_object_(v16, v17, (uint64_t)self, sel_bonjourTXTRemoved_, CFSTR("com.apple.bonjour.txt.Removed"), 0);
      self->_onShortTimer = 0;
      v18 = (uint64_t)*p_acpBrowserSession;
      v21 = objc_msgSend_UTF8String(0, v19, v20);
      result = sub_21A67992C(v18, v21);
      if (result)
        v23 = result == -6745;
      else
        v23 = 1;
      if (v23)
      {
        v24 = 15.0;
        if (result == -6745)
          v24 = 0.0;
        v25 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v22, (uint64_t)self, sel_browseReadyTimerCallback_, 0, 0, v24);
        objc_msgSend_set_browseReadyTimer_(self, v26, v25);
        objc_msgSend_setBonjourBrowseStatus_(self, v27, 1);
        return 0;
      }
    }
    else
    {
      return -6728;
    }
  }
  return result;
}

- (void)cancelBonjourBrowser
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) cancelBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v9);
  objc_msgSend_stopBonjourBrowser(self, a2, v2);
  objc_msgSend_setBonjourBrowseStatus_(self, v8, 3);
}

- (void)stopBonjourBrowser
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  ACPBrowserSession *acpBrowserSession;
  uint64_t v19;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) stopBonjourBrowser]", 100, (uint64_t)"\n", v3, v4, v5, v6, v19);
  objc_msgSend_invalidate(self->_browseReadyTimer, a2, v2);
  objc_msgSend_set_browseReadyTimer_(self, v8, 0);
  v11 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v9, v10);
  objc_msgSend_removeObserver_name_object_(v11, v12, (uint64_t)self, CFSTR("com.apple.bonjour.txt.Updated"), 0);
  v15 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v13, v14);
  objc_msgSend_removeObserver_name_object_(v15, v16, (uint64_t)self, CFSTR("com.apple.bonjour.txt.Removed"), 0);
  acpBrowserSession = self->_acpBrowserSession;
  if (acpBrowserSession)
  {
    if (!sub_21A679B38((dispatch_queue_t *)acpBrowserSession))
      sub_21A679BF8(self->_acpBrowserSession);
    self->_acpBrowserSession = 0;
  }
  objc_msgSend_setBonjourBrowseStatus_(self, v17, 0);
}

- (void)wirelessScanDone:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) wirelessScanDone:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v23);
  objc_msgSend_stopWiFiScanner(self, a2, (uint64_t)a3);
  v10 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v8, v9);
  v13 = objc_msgSend_unmergedScanInfoArray(v10, v11, v12);
  objc_msgSend_set_wifiScanInfos_(self, v14, v13);
  if (!objc_msgSend_targetScanRecord(self, v15, v16))
  {
    v19 = (const __CFString *)objc_msgSend_targetMACAddress(self, v17, v18);
    v20 = sub_21A68F8D8(v19, 0, (CFArrayRef)self->_wifiScanInfos);
    if (v20 != -1)
    {
      v21 = objc_msgSend_objectAtIndex_(self->_wifiScanInfos, v17, v20);
      objc_msgSend_setTargetScanRecord_(self, v22, v21);
    }
  }
  objc_msgSend_startAutoGuessIfReady(self, v17, v18);
}

- (void)cancelWiFiScanner
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) cancelWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v14);
  v8 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  objc_msgSend_cancelAsync(v8, v9, v10);
  objc_msgSend_stopWiFiScanner(self, v11, v12);
  objc_msgSend_setWiFiScanStatus_(self, v13, 3);
}

- (void)stopWiFiScanner
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

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) stopWiFiScanner]", 100, (uint64_t)"\n", v3, v4, v5, v6, v11);
  v8 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v8, v9, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
  objc_msgSend_setWiFiScanStatus_(self, v10, 2);
}

- (void)browseReadyTimerCallback:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFArray *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) browseReadyTimerCallback:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v24);
  objc_msgSend_invalidate(self->_browseReadyTimer, a2, (uint64_t)a3);
  objc_msgSend_set_browseReadyTimer_(self, v8, 0);
  if (objc_msgSend_bonjourBrowseStatus(self, v9, v10) != 3)
  {
    if (!objc_msgSend_targetBrowseRecord(self, v11, v12))
    {
      v15 = objc_msgSend_allValues(self->_browsedBases, v13, v14);
      if (v15)
      {
        v16 = (const __CFArray *)v15;
        v17 = (const __CFString *)objc_msgSend_targetMACAddress(self, v13, v14);
        v18 = sub_21A68F3C8(v16, v17);
        if (v18 != -1)
        {
          v19 = objc_msgSend_objectAtIndex_(v16, v13, v18);
          objc_msgSend_setTargetBrowseRecord_(self, v20, v19);
        }
      }
    }
    objc_msgSend_stopBonjourBrowser(self, v13, v14);
    objc_msgSend_setBonjourBrowseStatus_(self, v21, 2);
    objc_msgSend_startAutoGuessIfReady(self, v22, v23);
  }
}

- (void)bonjourTXTUpdated:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  double v12;
  NSTimer *browseReadyTimer;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("name"));
  if (v4)
  {
    v8 = v6;
    if (v6)
    {
      v9 = objc_msgSend_objectForKey_(v4, v7, (uint64_t)CFSTR("raMA"));
      if (objc_msgSend_okToSwitchToShortBonjourTimeout_(self, v10, (uint64_t)v4))
        v12 = 2.0;
      else
        v12 = 5.0;
      objc_msgSend_setObject_forKey_(self->_browsedBases, v11, (uint64_t)v4, v8);
      browseReadyTimer = self->_browseReadyTimer;
      v16 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v14, v15, v12);
      objc_msgSend_setFireDate_(browseReadyTimer, v17, v16);
      if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) bonjourTXTUpdated:]", 100, (uint64_t)"MAC: %@\n", v18, v19, v20, v21, v9);
    }
  }
}

- (void)bonjourTXTRemoved:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSTimer *browseReadyTimer;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("name"));
  if (v4)
  {
    v8 = v6;
    if (v6)
    {
      v9 = objc_msgSend_objectForKey_(v4, v7, (uint64_t)CFSTR("raMA"));
      objc_msgSend_removeObjectForKey_(self->_browsedBases, v10, v8);
      browseReadyTimer = self->_browseReadyTimer;
      v14 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v12, v13, 5.0);
      objc_msgSend_setFireDate_(browseReadyTimer, v15, v14);
      if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) bonjourTXTRemoved:]", 100, (uint64_t)"MAC: %@\n", v16, v17, v18, v19, v9);
    }
  }
}

- (void)runAutoGuessThread:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t PreferredNetworks;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  NSArray *wifiScanInfos;
  uint64_t v43;
  const char *v44;
  uint64_t CurrentAssociationInfo;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *guessContext;
  const char *v53;
  uint64_t v54;
  int AutoJoinState;
  const char *v56;
  AutoGuessController *v57;
  id v58;

  v58 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if ((objc_msgSend_isCancelled(self->_autoGuessThread, v5, v6) & 1) == 0)
  {
    if (dword_2550EE3B0 <= 100 && (dword_2550EE3B0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE3B0, 0x64u)))
      sub_21A698FDC((uint64_t)&dword_2550EE3B0, (uint64_t)"-[AutoGuessController(EngineControllerPrivate) runAutoGuessThread:]", 100, (uint64_t)"unconfiguredMACAddress: %@\n", v9, v10, v11, v12, (uint64_t)a3);
    v13 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v7, v8);
    v16 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v14, v15);
    v19 = objc_msgSend_airPortIsOn(v16, v17, v18);
    v21 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v20, v19 ^ 1u);
    objc_msgSend_setValue_forKey_(v13, v22, v21, CFSTR("BSAutoGuessContext_HostNotUsingWireless"));
    v24 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v23, 1);
    objc_msgSend_setValue_forKey_(v13, v25, v24, CFSTR("BSAutoGuessContext_HostHasPreferredNetworkSupport"));
    PreferredNetworks = objc_msgSend_getPreferredNetworks_(v16, v26, 0);
    if (PreferredNetworks)
      objc_msgSend_setObject_forKey_(v13, v28, PreferredNetworks, CFSTR("BSAutoGuessContext_HostPreferredNetworks"));
    v30 = (void *)MEMORY[0x24BDBCE30];
    v31 = objc_msgSend_allValues(self->_browsedBases, v28, v29);
    v33 = objc_msgSend_arrayWithArray_(v30, v32, v31);
    if (v33)
      objc_msgSend_setObject_forKey_(v13, v34, v33, CFSTR("BSAutoGuessContext_HostBrowsedBaseStations"));
    if (a3)
    {
      if (objc_msgSend_targetBrowseRecord(self, v34, v35))
      {
        v38 = objc_msgSend_targetBrowseRecord(self, v36, v37);
        objc_msgSend_setObject_forKey_(v13, v39, v38, CFSTR("BSAutoGuessContext_ChosenUnconfiguredBrowseRecord"));
      }
      else if (objc_msgSend_targetScanRecord(self, v36, v37))
      {
        v40 = objc_msgSend_targetScanRecord(self, v34, v35);
        objc_msgSend_setObject_forKey_(v13, v41, v40, CFSTR("BSAutoGuessContext_ChosenUnconfiguredScanRecord"));
      }
    }
    if (v19)
    {
      wifiScanInfos = self->_wifiScanInfos;
      if (wifiScanInfos)
      {
        v43 = objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v34, (uint64_t)wifiScanInfos);
        objc_msgSend_setObject_forKey_(v13, v44, v43, CFSTR("BSAutoGuessContext_HostScannedNetworks"));
      }
      if (objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v16, v34, 0))
      {
        CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v16, v34, v35);
        if (CurrentAssociationInfo)
          objc_msgSend_setObject_forKey_(v13, v34, CurrentAssociationInfo, CFSTR("BSAutoGuessContext_HostCurrentWirelessAssociation"));
      }
    }
    self->super._callbackContext = 0;
    if ((objc_msgSend_isCancelled(self->_autoGuessThread, v34, v35) & 1) == 0)
    {
      guessContext = (uint64_t *)self->_guessContext;
      if (guessContext)
      {
        if (!sub_21A702C0C(guessContext, (CFDictionaryRef)v13, v46, v47, v48, v49, v50, v51))
        {
          AutoJoinState = objc_msgSend_getAutoJoinState(v16, v53, v54);
          self->_autoJoinState = AutoJoinState;
          if (AutoJoinState)
            objc_msgSend_setAutoJoinState_(v16, v56, 0);
          v57 = self;
        }
      }
    }
  }
  self->_autoGuessThread = 0;

}

+ (id)recommendationToActionChoice:(id)a3
{
  uint64_t v3;

  if (a3 && (v3 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_Recommendation"))) != 0)
    return (id)sub_21A690C10(v3, qword_2550F4DE8);
  else
    return 0;
}

+ (BOOL)isRestoreAnOptionForTheRecommendations:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuessComplete_Suggestions"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, v16, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v3);
          v10 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v6, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
          if (v10 && (objc_msgSend_isEqualToString_(v10, v6, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore")) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            return v5;
          }
        }
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, v16, 16);
        LOBYTE(v5) = 0;
        if (v7)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)shortProductNameFromBaseStationDictionary:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("syAP"));
  if (!v4)
    return 0;
  v7 = objc_msgSend_integerValue(v4, v5, v6);
  v15 = sub_21A68E344((uint64_t)a3, v8, v9, v10, v11, v12, v13, v14);
  return (id)sub_21A690D80(v7, v15, 0);
}

+ (id)shortProductNameForUnconfiguredDeviceFromAutoGuessResults:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  int v19;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuessComplete_Suggestions"));
  if (!v4)
    return 0;
  v7 = v4;
  if (!objc_msgSend_count(v4, v5, v6))
    return 0;
  v9 = (void *)objc_msgSend_objectAtIndex_(v7, v8, 0);
  if (!v9)
    return 0;
  v11 = v9;
  v12 = objc_msgSend_valueForKey_(v9, v10, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  if (v12)
    return (id)MEMORY[0x24BEDD108](a1, sel_shortProductNameFromBaseStationDictionary_, v12);
  v14 = objc_msgSend_valueForKey_(v11, v13, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  if (!v14)
    return 0;
  v16 = v14;
  v17 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v15, v14);
  v19 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v18, v16);
  return (id)sub_21A690D80(v17, v19, 0);
}

+ (id)sourceBaseStationFromRecommendation:(id)a3
{
  if (a3)
    return (id)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
  else
    return 0;
}

+ (id)sourceNetworkFromRecommendation:(id)a3
{
  if (a3)
    return (id)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_SourceNetwork"));
  else
    return 0;
}

+ (id)unconfiguredBaseStationFromGuessCompleteDict:(id)a3
{
  id result;
  const char *v4;
  id v5;
  const char *v6;

  result = (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("primaryRecommendationDict"));
  if (result)
  {
    v5 = result;
    result = (id)objc_msgSend_valueForKey_(result, v4, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
    if (!result)
      return (id)objc_msgSend_valueForKey_(v5, v6, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  }
  return result;
}

+ (id)unconfiguredBaseStationFromRecommendation:(id)a3
{
  if (a3)
    return (id)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  else
    return 0;
}

+ (BOOL)shouldShowPasswordUIForRecommendation:(id)a3
{
  const char *v4;
  int isEqualToString;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")) & 1) != 0
    || (isEqualToString = objc_msgSend_isEqualToString_(a3, v4, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork"))) != 0)
  {
    LOBYTE(isEqualToString) = 1;
  }
  return isEqualToString;
}

+ (id)restoreOfferFromCompletionDict:(id)a3
{
  void *v3;
  const char *v4;

  if (!a3)
    return 0;
  v3 = (void *)objc_msgSend_restoreRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)a3);
  return (id)objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
}

+ (id)recommendationStringFromCompletionDict:(id)a3
{
  if (a3)
    return (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("recommendationText"));
  else
    return 0;
}

+ (id)unconfiguredBaseStationCanBeConfiguredFromCompletionDict:(id)a3
{
  if (a3)
    return (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("baseStationCanBeConfigured"));
  else
    return 0;
}

+ (id)primaryRecommendationDictionaryFromCompletionDict:(id)a3
{
  if (a3)
    return (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("primaryRecommendationDict"));
  else
    return 0;
}

+ (id)restoreRecommendationDictionaryFromCompletionDict:(id)a3
{
  if (a3)
    return (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("restoreRecommendationDict"));
  else
    return 0;
}

+ (id)fullAutoGuessDictionaryFromCompletionDict:(id)a3
{
  if (a3)
    return (id)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("fullGuessResults"));
  else
    return 0;
}

- (id)createCompletionDictFromAutoGuessResults:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  __CFString *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t valid;
  const char *v51;
  const __CFString *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  BOOL v64;
  const __CFString *v65;
  const __CFString *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  unint64_t v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  const __CFString *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  id obj;
  id v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  int v148;
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v148 = 0;
  v143 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, (uint64_t)a3);
  v140 = a3;
  sub_21A693B94((const __CFString *)a3, (uint64_t)&v148, (UInt8 *)"%ks:int", v4, v5, v6, v7, v8, (uint64_t)"BSAutoGuessComplete_ErrorResult");
  if (v10)
    return v143;
  if (v148 == -6723)
  {
    v118 = (void *)MEMORY[0x24BDD16A8];
    v119 = qword_2550F4DE8;
    v120 = CFSTR("kSetup_SetupRecommendationErrorCanceled");
    goto LABEL_76;
  }
  if (v148)
  {
    v118 = (void *)MEMORY[0x24BDD16A8];
    v119 = qword_2550F4DE8;
    v120 = CFSTR("kSetup_SetupRecommendationErrorGeneric");
LABEL_76:
    v121 = sub_21A690C10((uint64_t)v120, v119);
    v123 = objc_msgSend_stringWithString_(v118, v122, v121);
    v124 = 0;
    v137 = 0;
    v138 = 0;
    if (!v123)
      return v143;
LABEL_77:
    v125 = v123;
    objc_msgSend_setValue_forKey_(v143, v15, (uint64_t)v140, CFSTR("fullGuessResults"));
    objc_msgSend_setValue_forKey_(v143, v126, v125, CFSTR("recommendationText"));
    v128 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v127, v124);
    objc_msgSend_setValue_forKey_(v143, v129, v128, CFSTR("baseStationCanBeConfigured"));
    if (v138)
      objc_msgSend_setValue_forKey_(v143, v130, v138, CFSTR("primaryRecommendationDict"));
    if (v137)
      objc_msgSend_setValue_forKey_(v143, v130, v137, CFSTR("restoreRecommendationDict"));
    return v143;
  }
  obj = (id)objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("BSAutoGuessComplete_Suggestions"));
  if (!obj)
    return v143;
  v136 = (void *)objc_msgSend_string(MEMORY[0x24BDD16A8], v12, v13);
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v144, v149, 16);
  if (v142)
  {
    v137 = 0;
    v138 = 0;
    v141 = *(_QWORD *)v145;
    v135 = 1;
LABEL_8:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v145 != v141)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v16);
      v18 = objc_msgSend_objectForKey_(v17, v15, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
      if (!v18)
        return v143;
      v20 = (void *)v18;
      v21 = (void *)objc_msgSend_objectForKey_(v17, v19, (uint64_t)CFSTR("BSAutoGuess_AskUserList"));
      v23 = (__CFString *)objc_msgSend_objectForKey_(v17, v22, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
      v25 = objc_msgSend_objectForKey_(v17, v24, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
      v33 = (void *)v25;
      if (v23)
        break;
      if (v25)
      {
        v34 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v26, v25);
        v42 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v53, (uint64_t)v33);
        if ((v42 - 3) > 1)
          v43 = objc_msgSend_shortProductNameForUnconfiguredDeviceFromAutoGuessResults_(AutoGuessController, v54, (uint64_t)v140);
        else
          v43 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v54, (uint64_t)v33);
        goto LABEL_14;
      }
      v44 = 0;
      v34 = 0;
      v42 = 0;
LABEL_15:
      v45 = sub_21A690D10(v34, v42);
      if (objc_msgSend_isEqualToString_(v20, v46, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")))
      {
        v48 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v47, (uint64_t)CFSTR("PrimarySetupRecommendation_Create%@"), v45);
LABEL_19:
        valid = sub_21A690C10(v48, qword_2550F4DE8);
        goto LABEL_20;
      }
      if (objc_msgSend_isEqualToString_(v20, v47, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendOverEthernet")))
      {
        v48 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v49, (uint64_t)CFSTR("PrimarySetupRecommendation_ExtendEthernet%@"), v45);
        goto LABEL_19;
      }
      if (objc_msgSend_isEqualToString_(v20, v49, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendWirelessly")))
      {
        v56 = (void *)objc_msgSend_objectForKey_(v17, v55, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
        v58 = (void *)objc_msgSend_valueForKey_(v56, v57, (uint64_t)CFSTR("raNm"));
        v61 = objc_msgSend_length(v58, v59, v60);
        v63 = (void *)MEMORY[0x24BDD17C8];
        v64 = v61 == 0;
        v65 = CFSTR("PrimarySetupRecommendation_ExtendWireless.Specific%@");
        v66 = CFSTR("PrimarySetupRecommendation_ExtendWireless%@");
LABEL_34:
        if (v64)
          v73 = objc_msgSend_stringWithFormat_(v63, v62, (uint64_t)v66, v45);
        else
          v73 = objc_msgSend_stringWithFormat_(v63, v62, (uint64_t)v65, v45);
        v52 = (const __CFString *)sub_21A690C10(v73, qword_2550F4DE8);
        if (!objc_msgSend_length(v58, v74, v75))
          goto LABEL_21;
        v76 = (void *)MEMORY[0x24BDD17C8];
        v131 = (uint64_t)v58;
        goto LABEL_42;
      }
      if (objc_msgSend_isEqualToString_(v20, v55, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")))
      {
        v68 = (void *)objc_msgSend_objectForKey_(v17, v67, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
        v58 = (void *)objc_msgSend_valueForKey_(v68, v69, (uint64_t)CFSTR("raNm"));
        v72 = objc_msgSend_length(v58, v70, v71);
        v63 = (void *)MEMORY[0x24BDD17C8];
        v64 = v72 == 0;
        v65 = CFSTR("PrimarySetupRecommendation_Join.Specific%@");
        v66 = CFSTR("PrimarySetupRecommendation_Join%@");
        goto LABEL_34;
      }
      if (objc_msgSend_isEqualToString_(v20, v67, (uint64_t)CFSTR("BSSetupRecommend_OfferReplace")))
      {
        v78 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v77, (uint64_t)CFSTR("PrimarySetupRecommendation_Replace%@"), v45);
        v80 = (void *)objc_msgSend_objectForKey_(v17, v79, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
        v81 = (void *)MEMORY[0x24BDD17C8];
        v52 = (const __CFString *)sub_21A690C10(v78, qword_2550F4DE8);
        v131 = objc_msgSend_objectForKey_(v80, v82, (uint64_t)CFSTR("raNm"));
        v76 = v81;
LABEL_42:
        v83 = (uint64_t)v52;
LABEL_43:
        valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v76, v51, v83, CFSTR("%@"), 0, v131, v132, v134);
        goto LABEL_20;
      }
      if ((objc_msgSend_isEqualToString_(v20, v77, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore")) & 1) != 0
        || (objc_msgSend_isEqualToString_(v20, v51, (uint64_t)CFSTR("BSSetupRecommend_OfferNoRestore")) & 1) != 0)
      {
        v137 = (uint64_t)v17;
LABEL_47:
        v52 = &stru_24DD08368;
        goto LABEL_21;
      }
      if (objc_msgSend_isEqualToString_(v20, v51, (uint64_t)CFSTR("BSSetupRecommend_TellUserCannotFindDevices"))|| objc_msgSend_isEqualToString_(v20, v84, (uint64_t)CFSTR("BSSetupRecommend_WaitForBaseStation")))
      {
        v86 = qword_2550F4DE8;
        v87 = CFSTR("kProgress_NothingNewFoundError");
LABEL_51:
        v88 = sub_21A690C10((uint64_t)v87, v86);
        goto LABEL_52;
      }
      if (objc_msgSend_isEqualToString_(v20, v85, (uint64_t)CFSTR("BSSetupRecommend_DeviceIsTooNewToSetUp")))
      {
        v87 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v89, (uint64_t)CFSTR("BaseStationTooNew%@"), v45);
        v86 = qword_2550F4DE8;
        goto LABEL_51;
      }
      if (objc_msgSend_isEqualToString_(v20, v89, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWired"))|| objc_msgSend_isEqualToString_(v20, v90, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWireless")))
      {
        v92 = objc_msgSend_count(v21, v90, v91);
        v93 = (void *)MEMORY[0x24BDD17C8];
        if (v92 <= 3)
        {
          v94 = sub_21A690C10((uint64_t)CFSTR("CantPickNamedBasesToExtend"), qword_2550F4DE8);
          v96 = objc_msgSend_valueForKey_(v23, v95, (uint64_t)CFSTR("name"));
          v97 = (const char *)sub_21A690C10((uint64_t)CFSTR("Conjunction_Or"), qword_2550F4DE8);
          v99 = sub_21A6774B8(v21, v97, v98);
          goto LABEL_62;
        }
        v101 = sub_21A690C10((uint64_t)CFSTR("CantPickOneOfManyBasesToExtend"), qword_2550F4DE8);
        v133 = objc_msgSend_valueForKey_(v23, v102, (uint64_t)CFSTR("name"));
        valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v93, v103, v101, CFSTR("%@%@"), 0, v44, v133, v134);
LABEL_20:
        v52 = (const __CFString *)valid;
        goto LABEL_21;
      }
      if (objc_msgSend_isEqualToString_(v20, v90, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseNetworkToJoin")))
      {
        v93 = (void *)MEMORY[0x24BDD17C8];
        v94 = sub_21A690C10((uint64_t)CFSTR("CantPickNamedBasesToJoin"), qword_2550F4DE8);
        v96 = objc_msgSend_valueForKey_(v23, v105, (uint64_t)CFSTR("name"));
        v106 = (const char *)sub_21A690C10((uint64_t)CFSTR("Conjunction_Or"), qword_2550F4DE8);
        v99 = sub_21A677690(v21, v106, v107);
LABEL_62:
        valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v93, v100, v94, CFSTR("%@%@%@"), 0, v44, v96, v99);
        goto LABEL_20;
      }
      if ((objc_msgSend_isEqualToString_(v20, v104, (uint64_t)CFSTR("BSSetupRecommend_UseAUFor80211g")) & 1) == 0
        && !objc_msgSend_isEqualToString_(v20, v51, (uint64_t)CFSTR("BSSetupRecommend_FirmwareUpdateRequired")))
      {
        if (objc_msgSend_isEqualToString_(v20, v51, (uint64_t)CFSTR("BSSetupRecommend_NoNetworkToJoin")))
        {
          v116 = (void *)MEMORY[0x24BDD17C8];
          v83 = sub_21A690C10((uint64_t)CFSTR("CantFindNetworksToJoin"), qword_2550F4DE8);
          v131 = v44;
          v76 = v116;
          goto LABEL_43;
        }
        goto LABEL_47;
      }
      if (v23)
      {
        v108 = (void *)MEMORY[0x24BDD17C8];
        v109 = sub_21A690C10((uint64_t)CFSTR("UseAirPortUtilityFor80211g"), qword_2550F4DE8);
        v132 = objc_msgSend_valueForKey_(v23, v110, (uint64_t)CFSTR("name"));
        v88 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v108, v111, v109, CFSTR("%@%@"), 0, v44);
      }
      else
      {
        if (!v33)
        {
          v135 = 0;
          goto LABEL_47;
        }
        v112 = (void *)MEMORY[0x24BDD17C8];
        v113 = sub_21A690C10((uint64_t)CFSTR("UseAirPortUtilityFor80211g"), qword_2550F4DE8);
        v132 = objc_msgSend_valueForKey_(v33, v114, (uint64_t)CFSTR("SSID_STR"));
        v88 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v112, v115, v113, CFSTR("%@%@"), 0, v44);
      }
LABEL_52:
      v52 = (const __CFString *)v88;
      v135 = 0;
LABEL_21:
      if ((objc_msgSend_isEqualToString_(v20, v51, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore")) & 1) == 0
        && (objc_msgSend_isEqualToString_(v20, v15, (uint64_t)CFSTR("BSSetupRecommend_OfferNoRestore")) & 1) == 0)
      {
        objc_msgSend_setString_(v136, v15, (uint64_t)v52);
        v138 = (uint64_t)v17;
      }
      if (v142 == ++v16)
      {
        v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v144, v149, 16);
        v142 = v117;
        if (v117)
          goto LABEL_8;
        goto LABEL_82;
      }
    }
    v34 = (uint64_t)sub_21A68E368(v23, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    v42 = sub_21A68E344((uint64_t)v23, v35, v36, v37, v38, v39, v40, v41);
    v43 = (uint64_t)sub_21A690D80(v34, v42, 0);
LABEL_14:
    v44 = v43;
    goto LABEL_15;
  }
  v137 = 0;
  v138 = 0;
  v135 = 1;
LABEL_82:
  v124 = v135 & 1;
  v123 = (uint64_t)v136;
  if (v136)
    goto LABEL_77;
  return v143;
}

@end

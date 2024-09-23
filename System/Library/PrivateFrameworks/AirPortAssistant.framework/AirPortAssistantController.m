@implementation AirPortAssistantController

+ (id)sharedInstance
{
  id result;

  result = (id)qword_2550F4CB8;
  if (!qword_2550F4CB8)
  {
    result = objc_alloc_init(AirPortAssistantController);
    qword_2550F4CB8 = (uint64_t)result;
  }
  return result;
}

+ (id)assistantUIViewControllerWithParameters:(id)a3
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  AssistantUIViewController *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;

  v3 = a3;
  if (a3)
  {
    v4 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("scanRecord"));
    v6 = objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("currentWiFiScan"));
    v8 = objc_msgSend_objectForKey_(v3, v7, (uint64_t)CFSTR("deviceMACAddr"));
    if (!(v4 | v8))
      return 0;
    v11 = v8;
    v3 = (void *)objc_msgSend_sharedInstance(AirPortAssistantController, v9, v10);
    if (v3)
    {
      v12 = [AssistantUIViewController alloc];
      v14 = (void *)objc_msgSend_initWithNibName_bundle_(v12, v13, 0, 0);
      if (v14)
      {
        v16 = v14;
        objc_msgSend_setAssistantDelegate_(v14, v15, (uint64_t)v3);
        objc_msgSend_setMacAddress_(v16, v17, v11);
        objc_msgSend_setScanInfoRecord_(v16, v18, v4);
        objc_msgSend_setParamScanResults_(v16, v19, v6);
        objc_msgSend_setViewController_(v3, v20, (uint64_t)v16);

        v22 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v21, v4);
        objc_msgSend_setConfiguredSSID_(v3, v23, v22);
        return v3;
      }

      return 0;
    }
  }
  return v3;
}

+ (void)cancelAirPortAssistantController
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;

  objc_msgSend_downloadAssetsCancel(AirPortAssistantController, a2, v2);
  if (qword_2550F4CB0)
  {
    v5 = (void *)objc_msgSend_uiAlert((void *)qword_2550F4CB0, v3, v4);
    objc_msgSend_dismissWithCancelActionAnimated_(v5, v6, 0);
  }
  if (qword_2550F4CB8)
  {
    v7 = (void *)objc_msgSend_delegate((void *)qword_2550F4CB8, v3, v4);
    objc_msgSend_setDelegate_((void *)qword_2550F4CB8, v8, 0);
    v11 = (void *)objc_msgSend_viewController((void *)qword_2550F4CB8, v9, v10);
    objc_msgSend_handeImmediateCancel(v11, v12, v13);
    v14 = (id)qword_2550F4CB8;
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v18 = qword_2550F4CB8;
        v19 = objc_msgSend_context((void *)qword_2550F4CB8, v16, v17);
        objc_msgSend_airPortAssistantComplete_result_context_animated_(v7, v20, v18, 4294960573, v19, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_airPortAssistantComplete_animated_(v7, v21, qword_2550F4CB8, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_airPortAssistantComplete_(v7, v15, qword_2550F4CB8);
      }
    }
    objc_msgSend_setContext_((void *)qword_2550F4CB8, v15, 0);
  }
}

- (void)assistantCompleteWithResult:(int)a3
{
  uint64_t v3;
  AirPortAssistantController *v5;
  const char *v6;
  char v7;
  uint64_t v8;
  id delegate;
  uint64_t v10;
  const char *v11;
  char v12;
  id v13;

  v3 = *(_QWORD *)&a3;
  v5 = self;
  if (self->_delegate)
  {
    v7 = objc_opt_respondsToSelector();
    delegate = self->_delegate;
    if ((v7 & 1) != 0)
    {
      v10 = objc_msgSend_context(self, v6, v8);
      objc_msgSend_airPortAssistantComplete_result_context_animated_(delegate, v11, (uint64_t)self, v3, v10, 1);
    }
    else if (delegate)
    {
      v12 = objc_opt_respondsToSelector();
      v13 = self->_delegate;
      if ((v12 & 1) != 0)
      {
        objc_msgSend_airPortAssistantComplete_animated_(v13, v6, (uint64_t)self, 1);
      }
      else if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_airPortAssistantComplete_(self->_delegate, v6, (uint64_t)self);
      }
    }
  }
  objc_msgSend_setContext_(self, v6, 0);
}

+ (BOOL)isAirPlayDevice:(id)a3
{
  return (objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, (uint64_t)a3) & 0xFFFFFFFE) == 2;
}

+ (BOOL)isSTAOnlyDevice:(id)a3
{
  return objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, (uint64_t)a3);
}

+ (BOOL)isGenericMFiAccessory:(id)a3
{
  return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, (uint64_t)a3) == 4;
}

+ (BOOL)isHomeKitSecureWACDevice:(id)a3
{
  return MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoIsHomeKitSecureWAC_, a3);
}

+ (BOOL)isUnconfiguredDevice:(id)a3
{
  const char *v4;
  int IsUnconfigured;
  const char *v6;
  char v7;
  const char *v8;
  char v9;
  const char *v10;
  char v11;
  const char *v12;
  int v13;
  char v14;

  objc_msgSend_downloadAssetsIfNeeded(AirPortAssistantController, a2, (uint64_t)a3);
  IsUnconfigured = objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, v4, (uint64_t)a3);
  v7 = objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v6, (uint64_t)a3);
  v9 = objc_msgSend_scanInfoSupportsACPConfigV1_(WiFiUtils, v8, (uint64_t)a3);
  v11 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v10, (uint64_t)a3);
  v13 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v12, (uint64_t)a3);
  if (!IsUnconfigured)
    return 0;
  if (v13)
    v14 = 1;
  else
    v14 = v7;
  return v14 | v9 | v11;
}

+ (id)unconfiguredDeviceName:(id)a3
{
  const char *v4;

  v4 = (const char *)objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  return (id)sub_21A690F78((uint64_t)a3, v4, 0);
}

+ (id)unconfiguredDeviceID:(id)a3
{
  return (id)objc_msgSend_scanInfoDeviceID_(WiFiUtils, a2, (uint64_t)a3);
}

+ (id)uniqueBaseStationName:(id)a3 withBssid:(id)a4
{
  char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;

  v5 = (char *)sub_21A69114C(a4, 0, (uint64_t)a3);
  v6 = (void *)MEMORY[0x24BDD16A8];
  v8 = objc_msgSend_substringFromIndex_(v5, v7, 9);
  v10 = (void *)objc_msgSend_stringWithString_(v6, v9, v8);
  v13 = objc_msgSend_length(v10, v11, v12);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v10, v14, (uint64_t)CFSTR(":"), &stru_24DD08368, 0, 0, v13 - 1);
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("%@ %@"), a3, v10);
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5
{
  return MEMORY[0x24BEDD108](AirPortAssistantController, sel_launchAUForNetwork_withMacAddress_getAUFromAppStore_viewController_, a3);
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5 viewController:(id)a6
{
  _BOOL4 v7;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  AUUIAlert *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;

  v7 = a5;
  v11 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("apmanage://manage?"));
  if (a4)
    v11 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%@macaddr=%@"), v11, a4);
  if (a3)
  {
    v12 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%@&network=%@"), v11, a3);
    v15 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v13, v14);
    v11 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v12, v16, v15);
  }
  v17 = objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v10, v11);
  v18 = sub_21A72DE24(v17);
  if (!v18 && v7)
  {
    sub_21A690BB0(CFSTR("SetupRecommendations"));
    v19 = [AUUIAlert alloc];
    v21 = (id)objc_msgSend_initWithViewController_(v19, v20, (uint64_t)a6);
    v22 = sub_21A690C10((uint64_t)CFSTR("AskToGetAirPortUtility1"), qword_2550F4DE8);
    objc_msgSend_setTitle_(v21, v23, v22);
    v24 = sub_21A690C10((uint64_t)CFSTR("AskToGetAirPortUtility2"), qword_2550F4DE8);
    objc_msgSend_setMessage_(v21, v25, v24);
    v26 = sub_21A690C10((uint64_t)CFSTR("kOK"), qword_2550F4DE8);
    objc_msgSend_setOkButtonTitle_(v21, v27, v26);
    v28 = sub_21A690C10((uint64_t)CFSTR("kCancel"), qword_2550F4DE8);
    objc_msgSend_setCancelButtonTitle_(v21, v29, v28);
    qword_2550F4CB0 = objc_alloc_init(AUUIAlertDelegateClass);
    objc_msgSend_setDelegate_(v21, v30, qword_2550F4CB0);
    objc_msgSend_setUiAlert_((void *)qword_2550F4CB0, v31, (uint64_t)v21);
    objc_msgSend_show(v21, v32, v33);
  }
  return v18;
}

- (int)start2_4WiFiScan
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;

  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (!v4)
    return -6728;
  v7 = v4;
  if (!objc_msgSend_airPortIsOn(v4, v5, v6))
    return -6729;
  if ((objc_msgSend_isScanningActive(v7, v8, v9) & 1) != 0)
    return -6709;
  objc_msgSend_setUnconfiguredWACDevices_(self, v10, 0);
  objc_msgSend_clearScanCache(v7, v12, v13);
  objc_msgSend_setPeriodicScanType_(v7, v14, 1);
  objc_msgSend_setPeriodicScanInterval_(v7, v15, v16, 10.0);
  objc_msgSend_activateScanning_(v7, v17, 1);
  v20 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v18, v19);
  objc_msgSend_addObserver_selector_name_object_(v20, v21, (uint64_t)self, sel_wirelessScanDone_, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
  return 0;
}

- (void)stop2_4WiFiScan
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  if (v4)
  {
    v7 = v4;
    if (objc_msgSend_isScanningActive(v4, v5, v6))
    {
      objc_msgSend_activateScanning_(v7, v5, 0);
      objc_msgSend_cancelAsync(v7, v8, v9);
    }
  }
  v10 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6);
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Scan.Complete"), 0);
}

- (int)configureUIViewControllerWithParameters:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  AssistantUIViewController *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return -6762;
  v5 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("scanRecord"));
  v7 = objc_msgSend_objectForKey_(a3, v6, (uint64_t)CFSTR("currentWiFiScan"));
  v9 = objc_msgSend_objectForKey_(a3, v8, (uint64_t)CFSTR("deviceMACAddr"));
  v11 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("wacShouldHideFindAppUI"));
  if (!(v5 | v9))
    return -6762;
  v12 = v11;
  v13 = [AssistantUIViewController alloc];
  v15 = (void *)objc_msgSend_initWithNibName_bundle_(v13, v14, 0, 0);
  if (!v15)
    return -6762;
  v17 = v15;
  objc_msgSend_setAssistantDelegate_(v15, v16, (uint64_t)self);
  objc_msgSend_setMacAddress_(v17, v18, v9);
  objc_msgSend_setScanInfoRecord_(v17, v19, v5);
  objc_msgSend_setParamScanResults_(v17, v20, v7);
  if (v12)
  {
    v25 = CFSTR("wacShouldHideFindAppUI");
    v26[0] = v12;
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)v26, &v25, 1);
    objc_msgSend_setCallerParamDict_(v17, v23, v22);
  }
  objc_msgSend_setViewController_(self, v21, (uint64_t)v17);

  return 0;
}

- (void)wirelessScanDone:(id)a3
{
  uint64_t v4;

  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self, sel_updateWACListeners, v4);
  }
}

- (void)updateWACListeners
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  id delegate;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  AirPortAssistantController *v82;
  void *v83;
  id obj;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
  v7 = (void *)objc_msgSend_mergedScanInfoArray(v4, v5, v6);
  v10 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v8, v9);
  v83 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v11, v12);
  if (objc_msgSend_count(self->_unconfiguredWACDevices, v13, v14))
  {
    v17 = (void *)MEMORY[0x24BDBCED8];
    v18 = objc_msgSend_unconfiguredWACDevices(self, v15, v16);
    v85 = (void *)objc_msgSend_dictionaryWithDictionary_(v17, v19, v18);
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v20, (uint64_t)&v94, v104, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v95 != v25)
            objc_enumerationMutation(v7);
          v27 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
          if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v22, v27) & 1) != 0
            || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v22, v27))
          {
            v29 = (void *)objc_msgSend_unconfiguredWACDevices(self, v22, v28);
            v31 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v30, v27);
            if (!objc_msgSend_objectForKey_(v29, v32, v31))
            {
              v33 = (void *)objc_msgSend_WACDeviceFromScanInfo_(self, v22, v27);
              v35 = objc_msgSend_objectForKey_(v33, v34, (uint64_t)CFSTR("wacMACAddress"));
              objc_msgSend_setObject_forKey_(v10, v36, (uint64_t)v33, v35);
              objc_msgSend_setObject_forKey_(v85, v37, (uint64_t)v33, v35);
            }
          }
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v22, (uint64_t)&v94, v104, 16);
      }
      while (v24);
    }
    v38 = (void *)objc_msgSend_unconfiguredWACDevices(self, v22, v23);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = (id)objc_msgSend_allValues(v38, v39, v40);
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v90, v103, 16);
    if (v42)
    {
      v44 = v42;
      v81 = v10;
      v82 = self;
      v45 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v91 != v45)
            objc_enumerationMutation(obj);
          v47 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          v48 = (void *)objc_msgSend_objectForKey_(v47, v43, (uint64_t)CFSTR("wacMACAddress"));
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v49, (uint64_t)&v86, v102, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v87;
LABEL_20:
            v53 = 0;
            while (1)
            {
              if (*(_QWORD *)v87 != v52)
                objc_enumerationMutation(v7);
              v54 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v43, *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v53));
              if ((objc_msgSend_isEqualToString_(v48, v55, v54) & 1) != 0)
                break;
              if (v51 == ++v53)
              {
                v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v43, (uint64_t)&v86, v102, 16);
                if (v51)
                  goto LABEL_20;
                goto LABEL_26;
              }
            }
          }
          else
          {
LABEL_26:
            objc_msgSend_setObject_forKey_(v83, v43, (uint64_t)v47, v48);
            objc_msgSend_removeObjectForKey_(v85, v56, (uint64_t)v48);
          }
        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v90, v103, 16);
      }
      while (v44);
      v10 = v81;
      self = v82;
    }
    objc_msgSend_setUnconfiguredWACDevices_(self, v43, (uint64_t)v85);
  }
  else
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v98, v105, 16);
    v61 = (uint64_t)v10;
    if (v59)
    {
      v62 = v59;
      v63 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v99 != v63)
            objc_enumerationMutation(v7);
          v65 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * k);
          if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v60, v65) & 1) != 0
            || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v60, v65))
          {
            v66 = (void *)objc_msgSend_WACDeviceFromScanInfo_(self, v60, v65);
            v68 = objc_msgSend_objectForKey_(v66, v67, (uint64_t)CFSTR("wacMACAddress"));
            objc_msgSend_setObject_forKey_(v10, v69, (uint64_t)v66, v68);
          }
        }
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v60, (uint64_t)&v98, v105, 16);
      }
      while (v62);
      v61 = (uint64_t)v10;
    }
    objc_msgSend_setUnconfiguredWACDevices_(self, v60, v61);
  }
  if (objc_msgSend_count(v10, v57, v58) || objc_msgSend_count(v83, v70, v71))
  {
    delegate = self->_delegate;
    v73 = objc_msgSend_allValues(v10, v70, v71);
    v76 = objc_msgSend_allValues(v83, v74, v75);
    objc_msgSend_wacDevicesAdded_andWACDevicesRemoved_withController_(delegate, v77, v73, v76, self);
  }
  v78 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v70, v71);
  objc_msgSend_clearScanCache(v78, v79, v80);
}

- (id)WACDeviceFromScanInfo:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t IsMFIAirPlayDevice;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v36;

  v4 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, (uint64_t)a3);
  v5 = (void *)MEMORY[0x24BDD16E0];
  IsMFIAirPlayDevice = objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, v6, (uint64_t)a3);
  v36 = objc_msgSend_numberWithBool_(v5, v8, IsMFIAirPlayDevice);
  v9 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v10, (uint64_t)a3);
  v13 = objc_msgSend_numberWithBool_(v9, v12, v11);
  v14 = (void *)MEMORY[0x24BDD16E0];
  v16 = objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v15, (uint64_t)a3);
  v18 = objc_msgSend_numberWithBool_(v14, v17, v16);
  v20 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v19, (uint64_t)a3);
  v22 = objc_msgSend_scanInfoDeviceID_(WiFiUtils, v21, (uint64_t)a3);
  v24 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v23, (uint64_t)a3);
  v26 = objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, v25, (uint64_t)a3);
  v28 = objc_msgSend_scanInfoModelName_(WiFiUtils, v27, (uint64_t)a3);
  v30 = objc_msgSend_scanInfoManufacturerName_(WiFiUtils, v29, (uint64_t)a3);
  objc_msgSend_setObject_forKey_(v4, v31, v36, CFSTR("wacSupportsAirPlay"));
  objc_msgSend_setObject_forKey_(v4, v32, v13, CFSTR("wacSupportsSpruce"));
  objc_msgSend_setObject_forKey_(v4, v33, v18, CFSTR("wacSupportsSecureWAC"));
  if (v20)
    objc_msgSend_setObject_forKey_(v4, v34, v20, CFSTR("wacFriendlyName"));
  if (v22)
    objc_msgSend_setObject_forKey_(v4, v34, v22, CFSTR("wacDeviceID"));
  if (v24)
    objc_msgSend_setObject_forKey_(v4, v34, v24, CFSTR("wacSSID"));
  if (v26)
    objc_msgSend_setObject_forKey_(v4, v34, v26, CFSTR("wacMACAddress"));
  if (v28)
    objc_msgSend_setObject_forKey_(v4, v34, v28, CFSTR("wacModelName"));
  if (v30)
    objc_msgSend_setObject_forKey_(v4, v34, v30, CFSTR("wacManufacturerName"));
  return v4;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  objc_super v6;

  qword_2550F4CB8 = 0;
  objc_msgSend_sharedInstanceRelease(WiFiUtils, v3, v4);

  self->_configuredSSID = 0;
  objc_msgSend_setUnconfiguredWACDevices_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)AirPortAssistantController;
  -[AirPortAssistantController dealloc](&v6, sel_dealloc);
}

- (AirPortAssistantControllerDelegate)delegate
{
  return (AirPortAssistantControllerDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)viewController
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)context
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)configuredSSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguredSSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)unconfiguredWACDevices
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnconfiguredWACDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end

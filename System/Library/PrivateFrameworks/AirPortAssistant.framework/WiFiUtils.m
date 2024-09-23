@implementation WiFiUtils

+ (id)sharedInstance
{
  id result;

  result = (id)qword_2550F4D20;
  if (!qword_2550F4D20)
  {
    result = objc_alloc_init(WiFiUtils);
    qword_2550F4D20 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedInstanceRef
{
  return (id)qword_2550F4D20;
}

+ (void)sharedInstanceRelease
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;

  if (qword_2550F4D20)
  {
    v3 = (void *)objc_msgSend__scanTimer((void *)qword_2550F4D20, a2, v2);
    objc_msgSend_invalidate(v3, v4, v5);
    objc_msgSend_set_scanTimer_((void *)qword_2550F4D20, v6, 0);

    qword_2550F4D20 = 0;
  }
}

- (WiFiUtils)init
{
  WiFiUtils *v2;
  const char *v3;
  uint64_t v4;
  WiFiUtils *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)WiFiUtils;
  v2 = -[WiFiUtils init](&v41, sel_init);
  v5 = v2;
  if (v2)
  {
    v6 = objc_msgSend_openWiFi(v2, v3, v4);
    if ((_DWORD)v6)
    {
      if (dword_2550EED68 <= 800)
      {
        v12 = v6;
        if (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
          sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils init]", 800, (uint64_t)"Could not init WIFi err: %ld\n", v8, v9, v10, v11, v12);
      }
    }
    objc_msgSend_setPeriodicScanType_(v5, v7, 3);
    objc_msgSend_setPeriodicScanInterval_(v5, v13, v14, 15.0);
    v5->_wifiBusy = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v5->_missingBSSIDCounts = (NSMutableDictionary *)(id)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v15, v16);
    v19 = objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v17, v18);
    objc_msgSend_setUnmergedScanInfoDict_(v5, v20, v19);
    v21 = (void *)MEMORY[0x24BDBCF40];
    v24 = (void *)objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v22, v23);
    v27 = objc_msgSend_date(MEMORY[0x24BDBCE60], v25, v26);
    objc_msgSend_timeIntervalSinceDate_(v24, v28, v27);
    v30 = objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(v21, v29, (uint64_t)v5, sel_scanTimerCallback_, 0, 1);
    objc_msgSend_set_scanTimer_(v5, v31, v30);
    v34 = (void *)objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], v32, v33);
    v37 = objc_msgSend__scanTimer(v5, v35, v36);
    objc_msgSend_addTimer_forMode_(v34, v38, v37, *MEMORY[0x24BDBCA90]);
    objc_msgSend_activateScanning_(v5, v39, 0);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  objc_super v10;

  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils dealloc]", 800, (uint64_t)"%s\n", v2, v3, v4, v5, (uint64_t)"-[WiFiUtils dealloc]");
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_closeWiFi(self, v7, v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
  dispatch_release((dispatch_object_t)self->_wifiBusy);
  self->_wifiBusy = 0;
  objc_msgSend_setUnmergedScanInfoDict_(self, v9, 0);

  self->_missingBSSIDCounts = 0;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUtils;
  -[WiFiUtils dealloc](&v10, sel_dealloc);
}

- (BOOL)airPortIsOn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_21A729678((uint64_t)self->_wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7) != 0;
}

- (void)setScanOnlyWhenAppActive:(BOOL)a3
{
  if (self->_scanOnlyWhenAppActive != a3)
  {
    self->_scanOnlyWhenAppActive = a3;
    if (!a3 && self->_scanningActive)
      MEMORY[0x24BEDD108](self, sel_triggerScan, a3);
  }
}

- (void)activateScanning:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;

  v7 = a3;
  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils activateScanning:]", 800, (uint64_t)"flag: %d _scanningActive: %d\n", v3, v4, v5, v6, v7);
  if (self->_scanningActive != v7)
  {
    self->_scanningActive = v7;
    if (v7)
      MEMORY[0x24BEDD108](self, sel_triggerScan, a3);
  }
}

- (BOOL)isScanningActive
{
  return self->_scanningActive;
}

- (BOOL)isScanInProgress
{
  BOOL scanInProgress;

  objc_sync_enter(self);
  scanInProgress = self->_scanInProgress;
  objc_sync_exit(self);
  return scanInProgress;
}

- (BOOL)isJoinInProgress
{
  BOOL joinInProgress;

  objc_sync_enter(self);
  joinInProgress = self->_joinInProgress;
  objc_sync_exit(self);
  return joinInProgress;
}

- (void)cancelAsync
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils cancelAsync]", 800, (uint64_t)"%s\n", v3, v4, v5, v6, (uint64_t)"-[WiFiUtils cancelAsync]");
  if (objc_msgSend_isScanInProgress(self, a2, v2))
  {
    sub_21A72A82C((uint64_t)self->_wifiShim, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
    objc_msgSend_setScanInProgress_(self, v15, 0);
  }
  else
  {
    if (!objc_msgSend_isJoinInProgress(self, v8, v9))
      return;
    sub_21A72A82C((uint64_t)self->_wifiShim, v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend_setJoinInProgress_(self, v23, 0);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
}

- (void)clearScanCache
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  objc_msgSend_setUnmergedScanInfoDict_(self, v5, v4);
}

- (id)unmergedScanInfoArray
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend_unmergedScanInfoDict(self, a2, v2);
  return (id)objc_msgSend_allValues(v3, v4, v5);
}

- (id)mergedScanInfoArray
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  v7 = (void *)objc_msgSend_unmergedScanInfoArray(self, v5, v6);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v7);
        v15 = *(__CFString **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend_objectForKey_(v15, v10, (uint64_t)CFSTR("SSID_STR"));
        if (v16)
        {
          v17 = v16;
          v18 = (const char *)objc_msgSend_objectForKey_(v4, v10, v16);
          if (!v18 || sub_21A68F1A4(v15, v18))
            objc_msgSend_setObject_forKey_(v4, v10, (uint64_t)v15, v17);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v20, v24, 16);
    }
    while (v12);
  }
  return (id)objc_msgSend_allValues(v4, v10, v11);
}

- (id)unconfiguredScanInfosOfType:(int)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, *(uint64_t *)&a3);
  v8 = (void *)objc_msgSend_unmergedScanInfoArray(self, v6, v7);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, v11, (uint64_t)v15))
        {
          v16 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v11, (uint64_t)v15);
          if ((a3 & 2) != 0)
            v17 = 0;
          else
            v17 = v16;
          if (v17 == 1 || ((a3 | v16) & 1) == 0)
          {
            if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
            {
              v24 = objc_msgSend_objectForKey_(v15, v11, (uint64_t)CFSTR("SSID_STR"));
              objc_msgSend_objectForKey_(v15, v25, (uint64_t)CFSTR("CHANNEL"));
              sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils unconfiguredScanInfosOfType:]", 800, (uint64_t)"Skipping Unconfigured %@ for Channel %@\n", v26, v27, v28, v29, v24);
            }
          }
          else
          {
            if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
            {
              v18 = objc_msgSend_objectForKey_(v15, v11, (uint64_t)CFSTR("SSID_STR"));
              objc_msgSend_objectForKey_(v15, v19, (uint64_t)CFSTR("CHANNEL"));
              sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils unconfiguredScanInfosOfType:]", 800, (uint64_t)"Adding Unconfigured %@ for Channel %@\n", v20, v21, v22, v23, v18);
            }
            objc_msgSend_addObject_(v5, v11, (uint64_t)v15);
          }
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }
  return v5;
}

- (id)resetScanInfosOfType:(int)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, *(uint64_t *)&a3);
  v8 = (void *)objc_msgSend_unmergedScanInfoArray(self, v6, v7);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend_scanInfoIsInSoftReset_(WiFiUtils, v11, (uint64_t)v15))
        {
          v16 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v11, (uint64_t)v15);
          if ((a3 & 2) != 0)
            v17 = 0;
          else
            v17 = v16;
          if (v17 == 1 || ((a3 | v16) & 1) == 0)
          {
            if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
            {
              v24 = objc_msgSend_objectForKey_(v15, v11, (uint64_t)CFSTR("SSID_STR"));
              objc_msgSend_objectForKey_(v15, v25, (uint64_t)CFSTR("CHANNEL"));
              sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils resetScanInfosOfType:]", 800, (uint64_t)"Skipping reset %@ for Channel %@\n", v26, v27, v28, v29, v24);
            }
          }
          else
          {
            if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
            {
              v18 = objc_msgSend_objectForKey_(v15, v11, (uint64_t)CFSTR("SSID_STR"));
              objc_msgSend_objectForKey_(v15, v19, (uint64_t)CFSTR("CHANNEL"));
              sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils resetScanInfosOfType:]", 800, (uint64_t)"Adding reset %@ for Channel %@\n", v20, v21, v22, v23, v18);
            }
            objc_msgSend_addObject_(v5, v11, (uint64_t)v15);
          }
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v31, v35, 16);
    }
    while (v12);
  }
  return v5;
}

- (id)scanInfoForMACAddress:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("00:00:00:00:00:00")) & 1) != 0)
    return 0;
  v7 = (void *)objc_msgSend_unmergedScanInfoArray(self, v5, v6);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (!v9)
    return 0;
  v11 = v9;
  v12 = *(_QWORD *)v18;
LABEL_5:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v12)
      objc_enumerationMutation(v7);
    v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
    v15 = (const __CFString *)objc_msgSend_objectForKey_(v14, v10, (uint64_t)CFSTR("BSSID"));
    if ((sub_21A6D039C((const __CFString *)a3, v15) & 1) != 0)
      return v14;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      v14 = 0;
      if (v11)
        goto LABEL_5;
      return v14;
    }
  }
}

- (id)scanInfoForName:(id)a3 wifiType:(int)a4
{
  void *v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v7 = (void *)objc_msgSend_unmergedScanInfoArray(self, a2, (uint64_t)a3);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v20;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v4 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v14 = objc_msgSend_scanInfoIs5GHz_(WiFiUtils, v10, (uint64_t)v4);
        v15 = (a4 & 2) != 0 ? 0 : v14;
        if (v15 != 1 && ((a4 | v14) & 1) != 0)
        {
          v16 = objc_msgSend_objectForKey_(v4, v10, (uint64_t)CFSTR("SSID_STR"));
          if ((objc_msgSend_isEqualToString_(a3, v17, v16) & 1) != 0)
            break;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v19, v23, 16);
          v4 = 0;
          if (v11)
            goto LABEL_5;
          return v4;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (id)scanInfoNetworkName:(id)a3
{
  return (id)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("SSID_STR"));
}

+ (id)scanInfoBSSIDStr:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v9 = 0;
  if (!a3)
    return 0;
  sub_21A693B94((const __CFString *)a3, (uint64_t)&v9, (UInt8 *)"%kO", v3, v4, v5, v6, v7, (uint64_t)CFSTR("BSSID"));
  return v9;
}

+ (id)scanInfoFriendlyName:(id)a3
{
  return (id)MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoDeviceID:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  const char *v10;

  v3 = (void *)objc_msgSend_scanInfoDataFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 7);
  if (v3
    && (v6 = v3, objc_msgSend_length(v3, v4, v5) == 6)
    && (v9 = (unsigned __int8 *)objc_msgSend_bytes(v6, v7, v8)) != 0)
  {
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%02x%02x%02x%02x%02x%02x"), *v9, v9[1], v9[2], v9[3], v9[4], v9[5]);
  }
  else
  {
    return 0;
  }
}

+ (id)scanInfoManufacturerName:(id)a3
{
  return (id)MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoModelName:(id)a3
{
  return (id)MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoStringFromAppleDeviceIE_forType_, a3);
}

+ (id)scanInfoStringFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  unsigned __int8 v4;
  const __CFData *Value;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  int v8;
  id result;
  int v10;
  id v11;
  const char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned __int8 *v16;

  if (!a3)
    return 0;
  v4 = a4;
  v15 = 0;
  v16 = 0;
  v13 = 0;
  v14 = 0;
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
  Length = CFDataGetLength(Value);
  v8 = sub_21A69C578(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v14, &v13, 0);
  result = 0;
  if (!v8)
  {
    v10 = sub_21A69C508(v14, (unint64_t)&v14[v13], v4, &v16, &v15, 0);
    result = 0;
    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x24BDD17C8]);
      return (id)objc_msgSend_initWithBytes_length_encoding_(v11, v12, (uint64_t)v16, v15, 4);
    }
  }
  return result;
}

+ (id)scanInfoDataFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  unsigned __int8 v4;
  const __CFData *Value;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  int v8;
  id result;
  const char *v10;
  int v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;

  if (!a3)
    return 0;
  v4 = a4;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
  Length = CFDataGetLength(Value);
  v8 = sub_21A69C578(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v13, &v12, 0);
  result = 0;
  if (!v8)
  {
    result = 0;
    if (v13)
    {
      if (v12)
      {
        v11 = sub_21A69C508(v13, (unint64_t)&v13[v12], v4, &v15, &v14, 0);
        result = 0;
        if (!v11)
        {
          if (v15)
          {
            if (v14)
              return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)v15);
          }
        }
      }
    }
  }
  return result;
}

+ (id)scanInfoAirPortUniqueIdentifier:(id)a3
{
  int v3;
  id result;
  const char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v10 = 0;
  v8 = 0;
  v9 = 0;
  v7 = 0;
  v3 = sub_21A6A5644((CFDictionaryRef)a3, &v10, &v8);
  result = 0;
  if (!v3)
  {
    v6 = sub_21A69C720(v10, (unint64_t)&v10[v8], 1, &v9, &v7, 0);
    result = 0;
    if (!v6)
      return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v5, (uint64_t)v9, v7);
  }
  return result;
}

+ (unsigned)scanInfoSubAppleProductID:(id)a3
{
  BOOL v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;

  v9 = 0;
  v7 = 0;
  v8 = 0;
  if (!sub_21A6A5644((CFDictionaryRef)a3, &v9, &v7)
    && ((v6 = 0, !sub_21A69C720(v9, (unint64_t)&v9[v7], 2, &v8, &v6, 0))
      ? (v3 = v8 == 0)
      : (v3 = 1),
        !v3 ? (v4 = v6 == 1) : (v4 = 0),
        v4))
  {
    return *v8;
  }
  else
  {
    return 0;
  }
}

+ (unsigned)scanInfoAppleProductID:(id)a3
{
  const __CFData *Value;
  const __CFData *v4;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  int v7;
  unsigned __int8 v9;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v4 = Value;
      v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v4);
      v7 = sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], &v9, 0);
      LODWORD(Value) = 0;
      if (!v7)
        LODWORD(Value) = v9;
    }
  }
  else
  {
    LODWORD(Value) = 0;
  }
  return Value;
}

+ (int)scanInfoDeviceKind:(id)a3
{
  const char *v4;
  const char *v6;
  const char *v7;

  if (!a3)
    return 0;
  if ((objc_msgSend_scanInfoIsMFIAirPlayDevice_(WiFiUtils, a2, (uint64_t)a3) & 1) != 0)
    return 3;
  if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v4, (uint64_t)a3) & 1) != 0
    || objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v6, (uint64_t)a3)
    && !objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v7, (uint64_t)a3))
  {
    return 4;
  }
  if (objc_msgSend_scanInfoIsAirPlayDevice_(WiFiUtils, v7, (uint64_t)a3))
    return 2;
  return 1;
}

+ (BOOL)scanInfoIsUnconfigured:(id)a3
{
  const __CFData *Value;
  const __CFData *v5;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  const char *v8;
  unsigned __int16 v10;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v5 = Value;
      v10 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v5);
      if (sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], 0, &v10))
        LOBYTE(Value) = objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, v8, (uint64_t)a3, 1);
      else
        LODWORD(Value) = (v10 >> 1) & 1;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsGuestNetwork:(id)a3
{
  const __CFData *Value;
  const __CFData *v4;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  int v7;
  unsigned __int16 v9;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v4 = Value;
      v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v4);
      v7 = sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], 0, &v9);
      LOBYTE(Value) = 0;
      if (!v7)
        LODWORD(Value) = (v9 >> 3) & 1;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsAudioDevice:(id)a3
{
  const __CFData *Value;
  const __CFData *v5;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  const char *v8;
  unsigned __int16 v10;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v5 = Value;
      v10 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v5);
      if (sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], 0, &v10))
        LOBYTE(Value) = objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, v8, (uint64_t)a3, 0);
      else
        LODWORD(Value) = (v10 >> 11) & 1;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsSTAOnly:(id)a3
{
  const __CFData *Value;
  const __CFData *v5;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  const char *v8;
  const char *v9;
  unsigned __int16 v11;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v5 = Value;
      v11 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v5);
      if (sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], 0, &v11))
      {
        if ((objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, v8, (uint64_t)a3) & 1) != 0)
          LOBYTE(Value) = 1;
        else
          LOBYTE(Value) = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v9, (uint64_t)a3);
      }
      else
      {
        LODWORD(Value) = (v11 >> 7) & 1;
      }
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoSupportsMFIConfigV1:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 2);
}

+ (BOOL)scanInfoSupportsSpruce:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 17);
}

+ (BOOL)scanInfoSupportsACPConfigV1:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 12);
}

+ (BOOL)scanInfoSupportsSecureWAC:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 20);
}

+ (BOOL)scanInfoSupportsSoftwareTokenAuth:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 22);
}

+ (BOOL)scanInfoIsMFIAirPlayDevice:(id)a3
{
  int v4;
  const char *v5;

  v4 = objc_msgSend_scanInfoSupportsMFIConfigV1_(WiFiUtils, a2, (uint64_t)a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend_scanInfoIsAirPlayDevice_(WiFiUtils, v5, (uint64_t)a3);
  return v4;
}

+ (BOOL)scanInfoIsWPA3:(id)a3
{
  return sub_21A728DFC(a3, a2) == 13;
}

+ (BOOL)scanInfoIsHomeKitSecureWAC:(id)a3
{
  int v4;
  const char *v5;

  v4 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, a2, (uint64_t)a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend_scanInfoSupportsSecureWAC_(WiFiUtils, v5, (uint64_t)a3);
  return v4;
}

+ (BOOL)scanInfoIsAirPlayDevice:(id)a3
{
  int IsSTAOnly;

  IsSTAOnly = objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, (uint64_t)a3);
  if (IsSTAOnly)
    LOBYTE(IsSTAOnly) = MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoIsAudioDevice_, a3);
  return IsSTAOnly;
}

+ (BOOL)scanInfoIsiAPOverWiFiDevice:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 9);
}

+ (BOOL)scanInfoTestBitFromAppleDeviceIE:(id)a3 forType:(int64_t)a4
{
  const __CFData *Value;
  const __CFData *v6;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  unsigned __int8 *v9;
  int v10;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v6 = Value;
      v13 = 0;
      v14 = 0;
      v12 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v6);
      if (!sub_21A69C578(BytePtr, (unint64_t)&BytePtr[Length], 10502144, &v14, &v12, 0))
      {
        v9 = &v14[v12];
        v12 = 0;
        v10 = sub_21A69C508(v14, (unint64_t)v9, 0, &v13, &v12, 0);
        LOBYTE(Value) = 0;
        if (v10)
          return (char)Value;
        if (a4 < (unint64_t)(8 * v12))
        {
          LODWORD(Value) = (v13[a4 / 8] >> (~(_BYTE)a4 & 7)) & 1;
          return (char)Value;
        }
      }
      LOBYTE(Value) = 0;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIsInSoftReset:(id)a3
{
  const __CFData *Value;
  const __CFData *v4;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  int v7;
  unsigned __int16 v9;

  if (a3)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("IE"));
    if (Value)
    {
      v4 = Value;
      v9 = 0;
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v4);
      v7 = sub_21A69C604(BytePtr, (unint64_t)&BytePtr[Length], 0, &v9);
      LOBYTE(Value) = 0;
      if (!v7)
        LODWORD(Value) = (v9 >> 10) & 1;
    }
  }
  else
  {
    LOBYTE(Value) = 0;
  }
  return (char)Value;
}

+ (BOOL)scanInfoIs5GHz:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("CHANNEL"));
  return objc_msgSend_integerValue(v3, v4, v5) > 14;
}

+ (BOOL)scanInfoIsIBSS:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return sub_21A728FE0((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) != 0;
}

+ (BOOL)scanInfoIsDWDSCapable:(id)a3 isDWDSEnabled:(BOOL *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL result;
  BOOL v13;
  int v14;
  BOOL v15;
  BOOL v16;
  int v17;

  if (!a3)
    return 0;
  v11 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  result = 0;
  v13 = v11 > 3 || v11 == 2;
  if (v13 && v11 != 102)
  {
    if (a4)
    {
      v17 = 0;
      sub_21A693B94((const __CFString *)a3, (uint64_t)&v17, (UInt8 *)"%kO.%kO:int", v6, v7, v8, v9, v10, (uint64_t)CFSTR("DWDS_IE"));
      if (v14)
        v15 = 1;
      else
        v15 = v17 == 0;
      v16 = !v15;
      *a4 = v16;
    }
    return 1;
  }
  return result;
}

+ (BOOL)scanInfoCanJoin2_4GHzNetworks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 14);
}

+ (BOOL)scanInfoCanJoin5GHzNetworks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 15);
}

+ (BOOL)scanInfoCanJoinWPA3Networks:(id)a3
{
  return objc_msgSend_scanInfoTestBitFromAppleDeviceIE_forType_(WiFiUtils, a2, (uint64_t)a3, 27);
}

- (int)joinNetworkWithScanInfoAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  char v32;

  v32 = 0;
  if (!a3)
  {
    v11 = -6705;
LABEL_7:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v11;
  }
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    v11 = -6735;
    goto LABEL_7;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
    return -6721;
  if (objc_msgSend_length(a4, v9, v10))
    v14 = a4;
  else
    v14 = 0;
  if (!v14
    && objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v13, (uint64_t)a3, 0, &v32)&& !v32)
  {
    v11 = -16;
    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a5);
  v17 = objc_msgSend_dictionaryWithObjectsAndKeys_(v15, v16, (uint64_t)a3);
  if (!v17)
  {
    v11 = -6728;
    goto LABEL_7;
  }
  v18 = v17;
  v19 = objc_allocWithZone(MEMORY[0x24BDD17F0]);
  v21 = (id)objc_msgSend_initWithTarget_selector_object_(v19, v20, (uint64_t)self, sel_joinNetworkWithScanInfoThread_, v18);
  objc_msgSend_start(v21, v22, v23);
  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils joinNetworkWithScanInfoAsync:password:rememberChoice:]", 800, (uint64_t)"starting Join thread\n", v26, v27, v28, v29, (uint64_t)CFSTR("JoinParam_ScanInfo"));
  v30 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v24, v25);
  objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v30, v31, (uint64_t)CFSTR("com.apple.WiFiUtils.Join.Start"), self, a3, 0);
  return 0;
}

- (int)joinNetworkWithNameAsync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  const char *v8;
  int v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;

  if (!a3)
  {
    v9 = -6705;
LABEL_7:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v9;
  }
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    v9 = -6735;
    goto LABEL_7;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
    return -6721;
  v11 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, a5);
  v13 = objc_msgSend_dictionaryWithObjectsAndKeys_(v11, v12, (uint64_t)a3);
  if (!v13)
  {
    v9 = -6728;
    goto LABEL_7;
  }
  v14 = v13;
  v15 = objc_allocWithZone(MEMORY[0x24BDD17F0]);
  v17 = (id)objc_msgSend_initWithTarget_selector_object_(v15, v16, (uint64_t)self, sel_joinNetworkWithNameThread_, v14);
  objc_msgSend_start(v17, v18, v19);
  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils joinNetworkWithNameAsync:password:rememberChoice:]", 800, (uint64_t)"starting Join (with name) thread\n", v22, v23, v24, v25, (uint64_t)CFSTR("JoinParam_Name"));
  v26 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v20, v21);
  objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v26, v27, (uint64_t)CFSTR("com.apple.WiFiUtils.Join.Start"), self, 0, 0);
  return 0;
}

- (int)disassociateSync
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int result;
  int v12;
  WiFiShimContext *wifiShim;

  if (!objc_msgSend_airPortIsOn(self, a2, v2))
  {
    v12 = -6735;
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
    return -6721;
  wifiShim = self->_wifiShim;
  if (!wifiShim)
  {
    v12 = -6718;
    goto LABEL_5;
  }
  v12 = sub_21A72A2F0((uint64_t)wifiShim, v4, v5, v6, v7, v8, v9, v10);
  result = -6721;
  if (v12 != -6721)
  {
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v12;
  }
  return result;
}

- (int)clearScanCacheSync
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int result;
  int v12;
  WiFiShimContext *wifiShim;

  if (!objc_msgSend_airPortIsOn(self, a2, v2))
  {
    v12 = -6735;
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
    return -6721;
  wifiShim = self->_wifiShim;
  if (!wifiShim)
  {
    v12 = -6718;
    goto LABEL_5;
  }
  v12 = sub_21A72971C((uint64_t)wifiShim, v4, v5, v6, v7, v8, v9, v10);
  result = -6721;
  if (v12 != -6721)
  {
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v12;
  }
  return result;
}

- (id)getCurrentAssociationInfo
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  int v9;
  id v10;
  id v11;

  v11 = 0;
  result = self->_wifiShim;
  if (result)
  {
    v9 = sub_21A729AE4((uint64_t)result, &v11, v2, v3, v4, v5, v6, v7);
    result = v11;
    if (!v9)
    {
      if (v11)
      {
        v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

- (id)getCurrentAssociationInfoOrNil
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_airPortIsOn(self, a2, v2))
    return (id)objc_msgSend_getCurrentAssociationInfo(self, v4, v5);
  else
    return 0;
}

- (id)getCurrentAssociationScanInfo
{
  uint64_t v2;
  void *CurrentAssociationInfo;
  const char *v5;
  id result;
  const char *v7;

  CurrentAssociationInfo = (void *)objc_msgSend_getCurrentAssociationInfo(self, a2, v2);
  result = (id)objc_msgSend_objectForKey_(CurrentAssociationInfo, v5, (uint64_t)CFSTR("BSSID"));
  if (result)
    return (id)objc_msgSend_scanInfoForMACAddress_(self, v7, (uint64_t)result);
  return result;
}

- (id)getIfList
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  int v9;
  id v10;
  id v11;

  v11 = 0;
  result = self->_wifiShim;
  if (result)
  {
    v9 = sub_21A72A91C((uint64_t)result, (uint64_t *)&v11, v2, v3, v4, v5, v6, v7);
    result = v11;
    if (!v9)
    {
      if (v11)
      {
        v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

- (id)getLinkStatus
{
  id result;
  int v3;
  int v4;
  id v5;
  id v6;

  v6 = 0;
  result = self->_wifiShim;
  if (result)
  {
    sub_21A728BD8((CFArrayRef *)result, (char *)&v6);
    v4 = v3;
    result = v6;
    if (!v4)
    {
      if (v6)
      {
        v5 = v6;
        return v6;
      }
    }
  }
  return result;
}

- (int)setAutoJoinState:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WiFiShimContext *wifiShim;

  wifiShim = self->_wifiShim;
  if (wifiShim)
    return sub_21A72A05C((uint64_t)wifiShim, a3, a3, v3, v4, v5, v6, v7);
  else
    return -6718;
}

- (BOOL)getAutoJoinState
{
  WiFiShimContext *wifiShim;
  int v3;
  BOOL v5;

  wifiShim = self->_wifiShim;
  if (wifiShim)
  {
    v5 = 0;
    v3 = sub_21A72AAE4((uint64_t)wifiShim, &v5);
    LOBYTE(wifiShim) = 0;
    if (!v3)
      LOBYTE(wifiShim) = v5;
  }
  return (char)wifiShim;
}

+ (id)getNetworkPassword:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v10;

  v10 = 0;
  if (!a3)
    return 0;
  sub_21A72AB30((uint64_t)a3, (const __CFString **)&v10, (uint64_t)a3, v3, v4, v5, v6, v7);
  v8 = v10;
  return v10;
}

- (BOOL)isCurrentlyAssociatedToAnInfrastructureNetwork:(BOOL *)a3
{
  void *CurrentAssociationInfo;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t CurrentAssociationScanInfo;
  const char *v18;

  CurrentAssociationInfo = (void *)objc_msgSend_getCurrentAssociationInfo(self, a2, (uint64_t)a3);
  if (CurrentAssociationInfo)
  {
    v7 = CurrentAssociationInfo;
    v8 = (void *)objc_msgSend_objectForKey_(CurrentAssociationInfo, v6, (uint64_t)CFSTR("STATE"));
    if (objc_msgSend_integerValue(v8, v9, v10) == 4
      && (v12 = (void *)objc_msgSend_objectForKey_(v7, v11, (uint64_t)CFSTR("AP_MODE")),
          objc_msgSend_integerValue(v12, v13, v14) == 2))
    {
      if (a3)
      {
        *a3 = 0;
        CurrentAssociationScanInfo = objc_msgSend_getCurrentAssociationScanInfo(self, v15, v16);
        if (CurrentAssociationScanInfo)
          *a3 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v18, CurrentAssociationScanInfo) != 0;
      }
      LOBYTE(CurrentAssociationInfo) = 1;
    }
    else
    {
      LOBYTE(CurrentAssociationInfo) = 0;
    }
  }
  return (char)CurrentAssociationInfo;
}

+ (BOOL)networkIsSecure:(id)a3 secMode:(int *)a4 isEnterprise:(BOOL *)a5
{
  int v7;

  v7 = sub_21A728DFC(a3, a2);
  if (a4)
    *a4 = v7;
  if (a5)
    *a5 = (v7 - 9) < 4;
  return v7 != 1;
}

+ (BOOL)networkIsApple:(id)a3 productID:(unsigned int *)a4
{
  unsigned int v5;

  v5 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);
  if (a4)
    *a4 = v5;
  return v5 != 0;
}

- (id)getPreferredNetworks:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  int v9;
  id v10;
  id v11;

  v11 = 0;
  result = self->_wifiShim;
  if (result)
  {
    v9 = sub_21A7297C0(result, (const char *)a3, &v11, v3, v4, v5, v6, v7);
    result = v11;
    if (!v9)
    {
      if (v11)
      {
        v10 = v11;
        return v11;
      }
    }
  }
  return result;
}

+ (id)copyFilteredNetworks:(id)a3 ignoreOptions:(int)a4
{
  uint64_t v4;
  const char *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v6, (uint64_t)&v15, v19, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(a3);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend_network_shouldBeIgnored_(WiFiUtils, v9, v13, v4) & 1) == 0)
            objc_msgSend_addObject_(v7, v9, v13);
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v15, v19, 16);
      }
      while (v10);
    }
  }
  return v7;
}

+ (BOOL)network:(id)a3 shouldBeIgnored:(int)a4
{
  __int16 v4;
  const char *v6;
  unsigned int v7;
  BOOL result;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  if ((a4 & 1) != 0 && !objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this non-Apple network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 2) != 0 && objc_msgSend_scanInfoIsIBSS_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this IBSS network:%@ (%@)\n";
LABEL_60:
    v10 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("SSID_STR"));
    objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("BSSID"));
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"+[WiFiUtils network:shouldBeIgnored:]", 800, (uint64_t)v6, v12, v13, v14, v15, v10);
    return 1;
  }
  if ((v4 & 0x20) != 0 && objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this unconfigured network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x40) != 0 && objc_msgSend_scanInfoIsGuestNetwork_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this guest network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x80) != 0
    && (objc_msgSend_scanInfoIsDWDSCapable_isDWDSEnabled_(WiFiUtils, a2, (uint64_t)a3, 0) & 1) == 0)
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this DWDS Incapable network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 0x100) != 0 && objc_msgSend_scanInfoIs5GHz_(WiFiUtils, a2, (uint64_t)a3))
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this 5GHz network:%@ (%@)\n";
    goto LABEL_60;
  }
  v7 = sub_21A728DFC(a3, a2);
  if (v7 == 1)
  {
    if ((v4 & 0x10) == 0)
      return 0;
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this unsecured network:%@ (%@)\n";
    goto LABEL_60;
  }
  v9 = v7;
  if ((v4 & 4) != 0 && v7 - 9 <= 3)
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this Enterprise network:%@ (%@)\n";
    goto LABEL_60;
  }
  if ((v4 & 8) != 0 && v7 <= 0xB && ((1 << v7) & 0xB5C) != 0 || (result = 0, (v4 & 0x200) != 0) && v9 == 13)
  {
    if (dword_2550EED68 > 800 || dword_2550EED68 == -1 && !sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u))
      return 1;
    v6 = "Ignoring this legacy Sec Mode network:%@ (%@)\n";
    goto LABEL_60;
  }
  return result;
}

+ (int)barsForRSSI:(int)a3
{
  int v3;
  int result;
  uint64_t v5;
  int v6;

  v3 = a3 - 100;
  if (a3 < 0)
    v3 = a3;
  if (v3 < -99)
    return 0;
  v5 = 0;
  while (v5 != 3)
  {
    result = v5 + 1;
    v6 = dword_21A73EF80[++v5];
    if (v3 < v6)
      return result;
  }
  return 4;
}

- (id)getNetworkPasswordForNetworkNamed:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id result;
  const char *v7;

  v3 = (void *)objc_msgSend_scanInfoForName_wifiType_(self, a2, (uint64_t)a3, 3);
  result = (id)objc_msgSend_count(v3, v4, v5);
  if (result)
    return (id)objc_msgSend_getNetworkPassword_(WiFiUtils, v7, (uint64_t)v3);
  return result;
}

- (int)_asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6 isPeriodic:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  const char *v13;
  int v14;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;

  v7 = a7;
  v9 = a5;
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
  {
    v14 = -6735;
LABEL_5:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    return v14;
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_wifiBusy, 0))
  {
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, a4);
    v19 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v18, v7);
    v21 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v20, a6);
    v23 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v22, v9);
    v25 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v24, v17, CFSTR("ScanParam_WiFiType"), v19, CFSTR("ScanParam_IsPeriodic"), v21, CFSTR("ScanParam_MaxAge"), v23, CFSTR("ScanParam_MergeResults"), a3, CFSTR("ScanParam_Name"), 0);
    if (v25)
    {
      v26 = v25;
      v27 = objc_allocWithZone(MEMORY[0x24BDD17F0]);
      v29 = (id)objc_msgSend_initWithTarget_selector_object_(v27, v28, (uint64_t)self, sel_asyncWiFiScanThread_, v26);
      objc_msgSend_start(v29, v30, v31);
      return 0;
    }
    v14 = -6728;
    goto LABEL_5;
  }
  return -6721;
}

- (int)asyncWiFiScan:(id)a3 wifiType:(int)a4 merge:(BOOL)a5 maxAge:(unint64_t)a6
{
  return objc_msgSend__asyncWiFiScan_wifiType_merge_maxAge_isPeriodic_(self, a2, (uint64_t)a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (int)openWiFi
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WiFiShimContext **p_wifiShim;
  int result;

  p_wifiShim = &self->_wifiShim;
  result = sub_21A729430(&self->_wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!result)
  {
    if (*p_wifiShim)
      return 0;
    else
      return -6728;
  }
  return result;
}

- (int)closeWiFi
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WiFiShimContext *wifiShim;
  int result;

  wifiShim = self->_wifiShim;
  if (!wifiShim)
    return -6718;
  result = sub_21A729558((uint64_t)wifiShim, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  self->_wifiShim = 0;
  return result;
}

- (void)scanTimerCallback:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;

  if (self->_scanOnlyWhenAppActive)
  {
    v5 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, (uint64_t)a3);
    v8 = objc_msgSend_applicationState(v5, v6, v7) == 0;
  }
  else
  {
    v8 = 1;
  }
  objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3);
  if (self->_scanningActive && v8)
  {
    if (objc_msgSend_airPortIsOn(self, v9, v10))
    {
      v18 = objc_msgSend_periodicScanType(self, v12, v13);
      if (objc_msgSend__asyncWiFiScan_wifiType_merge_maxAge_isPeriodic_(self, v19, 0, v18, 0, 0, 1))
      {
        v22 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend_periodicScanInterval(self, v20, v21);
        v25 = objc_msgSend_dateWithTimeIntervalSinceNow_(v22, v23, v24);
        objc_msgSend_setFireDate_(a3, v26, v25);
      }
    }
  }
  else
  {
    v27 = objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], v9, v10);
    objc_msgSend_setFireDate_(a3, v28, v27);
    objc_msgSend_activateScanning_(self, v29, 0);
  }
  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils scanTimerCallback:]", 800, (uint64_t)"_scanOnlyWhenAppActive: %d scanRightNow: %d airPortIsOn: %d asyncWiFiScan err: %d\n", v14, v15, v16, v17, self->_scanOnlyWhenAppActive);
}

- (void)triggerScan
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSTimer *scanTimer;
  uint64_t v9;
  const char *v10;

  if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils triggerScan]", 800, (uint64_t)"_scanningActive: %d\n", v3, v4, v5, v6, self->_scanningActive);
  if (self->_scanningActive)
  {
    scanTimer = self->_scanTimer;
    v9 = objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2);
    objc_msgSend_setFireDate_(scanTimer, v10, v9);
  }
}

- (void)setScanInProgress:(BOOL)a3
{
  objc_sync_enter(self);
  self->_scanInProgress = a3;
  objc_sync_exit(self);
}

- (void)setJoinInProgress:(BOOL)a3
{
  objc_sync_enter(self);
  self->_joinInProgress = a3;
  objc_sync_exit(self);
}

- (void)joinNetworkWithScanInfoThread:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  id v28;

  v28 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (a3
    && (v7 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_ScanInfo"))) != 0
    && (v8 = v7, (v9 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_RememberChoice"))) != 0))
  {
    v10 = (void *)v9;
    v11 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_Password"));
    objc_msgSend_setJoinInProgress_(self, v12, 1);
    v15 = objc_msgSend_integerValue(v10, v13, v14);
    v17 = (int)objc_msgSend_joinNetworkWithScanInfoSync_password_rememberChoice_(self, v16, v8, v11, v15);
  }
  else
  {
    v17 = -6705;
  }
  if (objc_msgSend_isJoinInProgress(self, v5, v6))
  {
    objc_msgSend_setJoinInProgress_(self, v18, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    v21 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v19, v20);
    v22 = (void *)MEMORY[0x24BDBCE70];
    v24 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v23, v17);
    v26 = objc_msgSend_dictionaryWithObject_forKey_(v22, v25, v24, CFSTR("WiFiUtils_OSStatus"));
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v21, v27, (uint64_t)CFSTR("com.apple.WiFiUtils.Join.Complete"), self, v26, 0);
  }

}

- (void)joinNetworkWithNameThread:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const char *v12;
  WiFiShimContext *wifiShim;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  id v30;

  v30 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (a3
    && (v7 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_Name"))) != 0
    && (v8 = (const char *)v7, (v9 = objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_RememberChoice"))) != 0))
  {
    v10 = (void *)v9;
    v11 = (const __CFString *)objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("JoinParam_Password"));
    objc_msgSend_setJoinInProgress_(self, v12, 1);
    wifiShim = self->_wifiShim;
    v16 = objc_msgSend_integerValue(v10, v14, v15);
    v19 = (int)sub_21A728C54((uint64_t)wifiShim, v8, v11, 3, v16, 0, v17, v18);
  }
  else
  {
    v19 = -6705;
  }
  if (objc_msgSend_isJoinInProgress(self, v5, v6))
  {
    objc_msgSend_setJoinInProgress_(self, v20, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    v23 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v21, v22);
    v24 = (void *)MEMORY[0x24BDBCE70];
    v26 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v25, v19);
    v28 = objc_msgSend_dictionaryWithObject_forKey_(v24, v27, v26, CFSTR("WiFiUtils_OSStatus"));
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v23, v29, (uint64_t)CFSTR("com.apple.WiFiUtils.Join.Complete"), self, v28, 0);
  }

}

- (int)joinNetworkWithScanInfoSync:(id)a3 password:(id)a4 rememberChoice:(int)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WiFiShimContext *wifiShim;

  v5 = *(_QWORD *)&a5;
  if (!objc_msgSend_airPortIsOn(self, a2, (uint64_t)a3))
    return -6735;
  if (!a3)
    return -6705;
  wifiShim = self->_wifiShim;
  if (wifiShim)
    return sub_21A729CC4((uint64_t)wifiShim, (uint64_t)a3, (const __CFString *)a4, v5, v9, v10, v11, v12);
  else
    return -6718;
}

- (void)asyncWiFiScanThread:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  WiFiShimContext *wifiShim;
  char v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;

  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v53 = 0;
  if (self->_wifiShim)
  {
    if (a3)
    {
      v8 = (const char *)objc_msgSend_objectForKey_(a3, v5, (uint64_t)CFSTR("ScanParam_Name"));
      v10 = (void *)objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("ScanParam_IsPeriodic"));
      v12 = (void *)objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("ScanParam_WiFiType"));
      v14 = (void *)objc_msgSend_objectForKey_(a3, v13, (uint64_t)CFSTR("ScanParam_MaxAge"));
      v16 = (void *)objc_msgSend_objectForKey_(a3, v15, (uint64_t)CFSTR("ScanParam_MergeResults"));
      objc_msgSend_setScanInProgress_(self, v17, 1);
      wifiShim = self->_wifiShim;
      if (v12)
        v21 = objc_msgSend_integerValue(v12, v18, v19);
      else
        v21 = 3;
      v23 = objc_msgSend_BOOLValue(v16, v18, v19);
      v26 = objc_msgSend_unsignedIntegerValue(v14, v24, v25);
      v22 = sub_21A72A39C((uint64_t)wifiShim, v8, v21, v23, v26, (uint64_t)&v53, v27, v28);
      if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils asyncWiFiScanThread:]", 800, (uint64_t)"err: %d\n", v29, v30, v31, v32, v22);
      if (!(_DWORD)v22)
      {
        v6 = v53;
        if (v53)
          objc_msgSend_mergeScanResults_ageOut_(self, v5, v53, v8 == 0);
        LODWORD(v22) = 0;
      }
    }
    else
    {
      v10 = 0;
      LODWORD(v22) = -6705;
    }
  }
  else
  {
    v10 = 0;
    LODWORD(v22) = -6718;
  }
  if (objc_msgSend_isScanInProgress(self, v5, v6))
  {
    objc_msgSend_setScanInProgress_(self, v33, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_wifiBusy);
    v37 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v35, v36);
    v38 = (void *)MEMORY[0x24BDBCE70];
    v40 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v39, (int)v22);
    v42 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v41, v40, CFSTR("WiFiUtils_OSStatus"), v53, CFSTR("WiFiUtils_ScanInfos"), 0);
    objc_msgSend_postNotificationNameOnMainThread_object_userInfo_waitUntilDone_(v37, v43, (uint64_t)CFSTR("com.apple.WiFiUtils.Scan.Complete"), self, v42, 0);
  }
  if (objc_msgSend_BOOLValue(v10, v33, v34))
  {
    v46 = 1.0;
    if ((_DWORD)v22 != 16)
    {
      objc_msgSend_periodicScanInterval(self, v44, v45);
      v46 = v47;
    }
    v48 = (void *)objc_msgSend__scanTimer(self, v44, v45);
    v51 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v49, v50, v46);
    objc_msgSend_setFireDate_(v48, v52, v51);
  }

}

+ (BOOL)stringArray:(id)a3 containsBSSID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        if ((sub_21A6D039C(*(const __CFString **)(*((_QWORD *)&v12 + 1) + 8 * v9), (const __CFString *)a4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v12, v16, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (void)mergeScanResults:(id)a3 ageOut:(BOOL)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSMutableDictionary *missingBSSIDCounts;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  _BOOL4 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v54 = a4;
    v6 = (void *)objc_msgSend_unmergedScanInfoDict(self, a2, (uint64_t)a3);
    v9 = (id)objc_msgSend_mutableCopy(v6, v7, v8);
    v10 = (void *)MEMORY[0x24BDBCEB8];
    v55 = v9;
    v13 = objc_msgSend_allKeys(v9, v11, v12);
    v15 = (void *)objc_msgSend_arrayWithArray_(v10, v14, v13);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v16, (uint64_t)&v60, v65, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v61 != v20)
            objc_enumerationMutation(a3);
          v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          v23 = objc_msgSend_objectForKey_(v22, v18, (uint64_t)CFSTR("BSSID"));
          if (v23)
          {
            v24 = v23;
            v25 = objc_msgSend_indexOfObject_(v15, v18, v23);
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend_removeObjectAtIndex_(v15, v26, v25);
            objc_msgSend_setObject_forKey_(v55, v26, (uint64_t)v22, v24);
            objc_msgSend_removeObjectForKey_(self->_missingBSSIDCounts, v27, v24);
          }
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v18, (uint64_t)&v60, v65, 16);
      }
      while (v19);
    }
    if (v54)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v56, v64, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v57 != v30)
              objc_enumerationMutation(v15);
            v32 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
            v33 = objc_msgSend_objectForKey_(self->_missingBSSIDCounts, v18, v32);
            if (v33 && (v33 = objc_msgSend_integerValue((void *)v33, v34, v35), v33 > 1))
            {
              if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
              {
                v46 = (void *)objc_msgSend_objectForKey_(v55, v34, v32);
                v48 = objc_msgSend_objectForKey_(v46, v47, (uint64_t)CFSTR("SSID_STR"));
                sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils mergeScanResults:ageOut:]", 800, (uint64_t)"Network: %@ is GONE\n", v49, v50, v51, v52, v48);
              }
              objc_msgSend_removeObjectForKey_(v55, v34, v32);
              objc_msgSend_removeObjectForKey_(self->_missingBSSIDCounts, v53, v32);
            }
            else
            {
              missingBSSIDCounts = self->_missingBSSIDCounts;
              v37 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v34, v33 + 1);
              objc_msgSend_setObject_forKey_(missingBSSIDCounts, v38, v37, v32);
              if (dword_2550EED68 <= 800 && (dword_2550EED68 != -1 || sub_21A69876C((uint64_t)&dword_2550EED68, 0x320u)))
              {
                v39 = (void *)objc_msgSend_objectForKey_(v55, v18, v32);
                v41 = objc_msgSend_objectForKey_(v39, v40, (uint64_t)CFSTR("SSID_STR"));
                sub_21A698FDC((uint64_t)&dword_2550EED68, (uint64_t)"-[WiFiUtils mergeScanResults:ageOut:]", 800, (uint64_t)"Network: %@ is %ld scan(s) old\n", v42, v43, v44, v45, v41);
              }
            }
          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v56, v64, 16);
        }
        while (v29);
      }
    }
    objc_msgSend_setUnmergedScanInfoDict_(self, v18, (uint64_t)v55);
  }
}

- (id)unmergedScanInfoDict
{
  NSDictionary *v3;

  objc_sync_enter(self);
  v3 = self->_unmergedScanInfoDict;
  objc_sync_exit(self);
  return v3;
}

- (void)setUnmergedScanInfoDict:(id)a3
{
  id v5;

  objc_sync_enter(self);
  if (self->_unmergedScanInfoDict != a3)
  {
    v5 = a3;

    self->_unmergedScanInfoDict = (NSDictionary *)a3;
  }
  objc_sync_exit(self);
}

- (NSTimer)_scanTimer
{
  return self->_scanTimer;
}

- (void)set_scanTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)periodicScanType
{
  return self->_periodicScanType;
}

- (void)setPeriodicScanType:(int)a3
{
  self->_periodicScanType = a3;
}

- (double)periodicScanInterval
{
  return self->_periodicScanInterval;
}

- (void)setPeriodicScanInterval:(double)a3
{
  self->_periodicScanInterval = a3;
}

@end

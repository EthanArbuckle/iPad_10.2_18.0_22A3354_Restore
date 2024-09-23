@implementation CRKClassSessionBeaconBrowser

- (void)dealloc
{
  objc_super v3;

  -[CRKClassSessionBeaconBrowser stopBrowsing](self, "stopBrowsing");
  v3.receiver = self;
  v3.super_class = (Class)CRKClassSessionBeaconBrowser;
  -[CRKClassSessionBeaconBrowser dealloc](&v3, sel_dealloc);
}

- (CRKClassSessionBeaconBrowser)init
{
  CRKClassSessionBeaconBrowser *v2;
  uint64_t v3;
  NSMutableSet *mScanningZones;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKClassSessionBeaconBrowser;
  v2 = -[CRKClassSessionBeaconBrowser init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mScanningZones = v2->mScanningZones;
    v2->mScanningZones = (NSMutableSet *)v3;

  }
  return v2;
}

- (void)setOrganizationUUIDs:(id)a3
{
  NSSet *organizationUUIDs;
  void *v6;
  char v7;
  NSSet *v8;
  NSSet *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v13 = (unint64_t)a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBeaconBrowser.m"), 64, CFSTR("%@ must be called from the main thread"), v12);

  }
  organizationUUIDs = self->_organizationUUIDs;
  v6 = (void *)v13;
  if (v13 | (unint64_t)organizationUUIDs)
  {
    v7 = -[NSSet isEqual:](organizationUUIDs, "isEqual:", v13);
    v6 = (void *)v13;
    if ((v7 & 1) == 0)
    {
      v8 = (NSSet *)objc_msgSend((id)v13, "copy");
      v9 = self->_organizationUUIDs;
      self->_organizationUUIDs = v8;

      v10 = -[CRKClassSessionBeaconBrowser isBrowsing](self, "isBrowsing");
      v6 = (void *)v13;
      if (v10)
      {
        -[CRKClassSessionBeaconBrowser updateZones](self, "updateZones");
        v6 = (void *)v13;
      }
    }
  }

}

- (void)setAllowInvitationSessions:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBeaconBrowser.m"), 78, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (self->_allowInvitationSessions != v3)
  {
    self->_allowInvitationSessions = v3;
    if (-[CRKClassSessionBeaconBrowser isBrowsing](self, "isBrowsing"))
      -[CRKClassSessionBeaconBrowser updateZones](self, "updateZones");
  }
}

- (void)startBrowsing
{
  NSObject *v4;
  CRKWiProxTrackerScanner *v5;
  void *v6;
  void *v7;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBeaconBrowser.m"), 94, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (!-[CRKClassSessionBeaconBrowser isBrowsing](self, "isBrowsing"))
  {
    _CRKLogBluetooth_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Initializing bluetooth tracker and scanner", buf, 2u);
    }

    v5 = -[CRKWiProxTrackerScanner initWithDelegate:]([CRKWiProxTrackerScanner alloc], "initWithDelegate:", self);
    -[CRKClassSessionBeaconBrowser setTrackerScanner:](self, "setTrackerScanner:", v5);

    -[CRKClassSessionBeaconBrowser updateZones](self, "updateZones");
    -[CRKClassSessionBeaconBrowser setIsBrowsing:](self, "setIsBrowsing:", 1);
    -[CRKClassSessionBeaconBrowser startInitialScan](self, "startInitialScan");
  }
}

- (void)stopBrowsing
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBeaconBrowser.m"), 110, CFSTR("%@ must be called from the main thread"), v9);

  }
  if (-[CRKClassSessionBeaconBrowser isBrowsing](self, "isBrowsing"))
  {
    _CRKLogBluetooth_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Stop browsing", buf, 2u);
    }

    -[CRKClassSessionBeaconBrowser setIsBrowsing:](self, "setIsBrowsing:", 0);
    -[CRKClassSessionBeaconBrowser stopScanningForDevicesInAllZones](self, "stopScanningForDevicesInAllZones");
    -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterAllZoneChanges");

    -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[CRKClassSessionBeaconBrowser setTrackerScanner:](self, "setTrackerScanner:", 0);
    self->mZoneTrackerLastState = 0;
    -[CRKClassSessionBeaconBrowser setIsScanning:](self, "setIsScanning:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeaconBrowser setTrackingUUIDs:](self, "setTrackingUUIDs:", v7);

  }
}

- (void)increaseScanFrequencyForDuration:(double)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassSessionBeaconBrowser.m"), 129, CFSTR("%@ must be called from the main thread"), v8);

  }
  _CRKLogBluetooth_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "Increasing bluetooth scan rate for %f seconds", buf, 0xCu);
  }

  ++self->mIncreasedScanRequestCount;
  -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");
  -[CRKClassSessionBeaconBrowser performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_increasedScanDurationElapsed, 0, a3);
}

- (id)stateDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  NSMutableSet *v42;
  CRKClassSessionBeaconBrowser *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  const __CFString *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zoneTrackerState");

  if (v4 == 3)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[CRKClassSessionBeaconBrowser organizationUUIDs](self, "organizationUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v9);
    }

    if (-[CRKClassSessionBeaconBrowser allowInvitationSessions](self, "allowInvitationSessions"))
      objc_msgSend(v6, "addObject:", CFSTR("436C6173-7372-6F6F-6D49-6E7669746531"));
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Monitoring Zones"));

    }
    v40 = v5;
    v41 = v6;
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:");
    -[CRKClassSessionBeaconBrowser zoneDataForAdvertisementUUID:](self, "zoneDataForAdvertisementUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v43 = self;
    v17 = self->mScanningZones;
    v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v49;
      v21 = 0x24BDBC000uLL;
      v42 = v17;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(*(id *)(v21 + 3664), "data");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToData:", v24);

          if (v25)
          {
            v26 = v14;
            v27 = CFSTR("Initial Scan");
LABEL_22:
            objc_msgSend(v26, "addObject:", v27);
            continue;
          }
          if (objc_msgSend(v23, "isEqualToData:", v16))
          {
            v26 = v14;
            v27 = CFSTR("436C6173-7372-6F6F-6D49-6E7669746531");
            goto LABEL_22;
          }
          v28 = v16;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          -[CRKClassSessionBeaconBrowser organizationUUIDsMatchingZoneData:](v43, "organizationUUIDsMatchingZoneData:", v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v45;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v45 != v32)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "UUIDString");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObject:", v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
            }
            while (v31);
          }

          v16 = v28;
          v17 = v42;
          v21 = 0x24BDBC000;
        }
        v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v19);
    }

    v35 = v40;
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v36, CFSTR("Scanning Zones"));

    }
    v37 = v41;
    if (v43->mIncreasedScanRequestCount)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("Ranging"));

  }
  else
  {
    v59 = CFSTR("Bluetooth State");
    v38 = (void *)MEMORY[0x24BDD16E0];
    -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v37, "zoneTrackerState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (id)zoneDataForOrganizationUUID:(id)a3
{
  void *v3;
  _QWORD v5[3];

  v3 = a3;
  v5[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)zoneDataForAdvertisementUUID:(id)a3
{
  void *v3;
  _QWORD v5[3];

  v3 = a3;
  v5[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v5);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)organizationUUIDsMatchingZoneData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0xC)
  {
    if ((unint64_t)objc_msgSend(v4, "length") >= 0xD)
    {
      objc_msgSend(v4, "subdataWithRange:", 0, 12);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    v5 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CRKClassSessionBeaconBrowser organizationUUIDs](self, "organizationUUIDs", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[CRKClassSessionBeaconBrowser zoneDataForOrganizationUUID:](self, "zoneDataForOrganizationUUID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToData:", v4);

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

+ (id)invitationUUID
{
  if (invitationUUID_onceToken != -1)
    dispatch_once(&invitationUUID_onceToken, &__block_literal_global_83);
  return (id)invitationUUID_invitationUUID;
}

void __46__CRKClassSessionBeaconBrowser_invitationUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("436C6173-7372-6F6F-6D49-6E7669746531"));
  v1 = (void *)invitationUUID_invitationUUID;
  invitationUUID_invitationUUID = v0;

}

- (void)updateZones
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _BYTE v67[128];
  const __CFString *v68;
  void *v69;
  uint8_t buf[4];
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zoneTrackerState");

  if (v4 == 2)
  {
    _CRKLogBluetooth_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Tracking off; unregistering all zones", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeaconBrowser setTrackingUUIDs:](self, "setTrackingUUIDs:", v6);

    -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterAllZoneChanges");

    -[CRKClassSessionBeaconBrowser stopScanningForDevicesInAllZones](self, "stopScanningForDevicesInAllZones");
    return;
  }
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "zoneTrackerState");

  if (v9 == 3)
  {
    v10 = (void *)objc_opt_new();
    v52 = (void *)objc_opt_new();
    v11 = (void *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[CRKClassSessionBeaconBrowser organizationUUIDs](self, "organizationUUIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v10, "addObject:", v17);
          -[CRKClassSessionBeaconBrowser trackingUUIDs](self, "trackingUUIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v17);

          if ((v19 & 1) == 0)
          {
            -[CRKClassSessionBeaconBrowser zoneDataForOrganizationUUID:](self, "zoneDataForOrganizationUUID:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v52, "addObject:", v20);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      }
      while (v14);
    }

    objc_msgSend((id)objc_opt_class(), "invitationUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeaconBrowser trackingUUIDs](self, "trackingUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "crk_setBySubtractingSet:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(v24, "removeObject:", v21);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v25);
          -[CRKClassSessionBeaconBrowser zoneDataForOrganizationUUID:](self, "zoneDataForOrganizationUUID:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v11, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
      }
      while (v27);
    }

    if (-[CRKClassSessionBeaconBrowser allowInvitationSessions](self, "allowInvitationSessions"))
    {
      objc_msgSend(v10, "addObject:", v21);
      -[CRKClassSessionBeaconBrowser trackingUUIDs](self, "trackingUUIDs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "containsObject:", v21);

      v33 = v52;
      if ((v32 & 1) == 0)
      {
        -[CRKClassSessionBeaconBrowser zoneDataForAdvertisementUUID:](self, "zoneDataForAdvertisementUUID:", v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = v52;
LABEL_36:
          objc_msgSend(v35, "addObject:", v34);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    else
    {
      -[CRKClassSessionBeaconBrowser trackingUUIDs](self, "trackingUUIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "containsObject:", v21);

      v33 = v52;
      if (v38)
      {
        -[CRKClassSessionBeaconBrowser zoneDataForAdvertisementUUID:](self, "zoneDataForAdvertisementUUID:", v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = v11;
          goto LABEL_36;
        }
LABEL_37:

      }
    }
    if (objc_msgSend(v11, "count"))
    {
      _CRKLogBluetooth_2();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v71 = v40;
        _os_log_impl(&dword_218C99000, v39, OS_LOG_TYPE_INFO, "Removing %{public}@ no-longer-needed zones", buf, 0xCu);

      }
      -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("ZTZonesArray");
      v69 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "unregisterForZoneChanges:", v42);

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v43 = v11;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v54;
        do
        {
          for (k = 0; k != v45; ++k)
          {
            if (*(_QWORD *)v54 != v46)
              objc_enumerationMutation(v43);
            -[CRKClassSessionBeaconBrowser stopScanningForDevicesInZone:](self, "stopScanningForDevicesInZone:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        }
        while (v45);
      }

      v33 = v52;
    }
    if (objc_msgSend(v33, "count"))
    {
      _CRKLogBluetooth_2();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v71 = v49;
        _os_log_impl(&dword_218C99000, v48, OS_LOG_TYPE_INFO, "Adding %{public}@ zones", buf, 0xCu);

      }
      -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = CFSTR("ZTZonesArray");
      v65[1] = CFSTR("ZTZoneEntry");
      v66[0] = v33;
      v66[1] = MEMORY[0x24BDBD1C8];
      v65[2] = CFSTR("ZTZoneExit");
      v66[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "registerForZoneChangesMatching:", v51);

    }
    -[CRKClassSessionBeaconBrowser setTrackingUUIDs:](self, "setTrackingUUIDs:", v10);

    return;
  }
  _CRKLogBluetooth_2();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218C99000, v36, OS_LOG_TYPE_INFO, "Tracking state indeterminate; waiting for update", buf, 2u);
  }

}

- (void)startInitialScan
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBeaconBrowser startScanningForDevicesInZone:](self, "startScanningForDevicesInZone:", v3);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopScanningForDevicesInZone_, v3);
  -[CRKClassSessionBeaconBrowser performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_stopScanningForDevicesInZone_, v3, 5.0);

}

- (void)startScanningForDevicesInZone:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogBluetooth_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Start scanning for devices in zone: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableSet addObject:](self->mScanningZones, "addObject:", v4);
  -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");

}

- (void)stopScanningForDevicesInZone:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_stopScanningForDevicesInZone_, v4);
  if (-[NSMutableSet containsObject:](self->mScanningZones, "containsObject:", v4))
  {
    _CRKLogBluetooth_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Stop scanning in zone: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    -[NSMutableSet removeObject:](self->mScanningZones, "removeObject:", v4);
    -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");
  }

}

- (void)stopScanningForDevicesInAllZones
{
  NSObject *v3;
  uint8_t v4[16];

  _CRKLogBluetooth_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Stop scanning all zones", v4, 2u);
  }

  -[NSMutableSet removeAllObjects](self->mScanningZones, "removeAllObjects");
  -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");
}

- (void)increasedScanDurationElapsed
{
  int64_t v2;
  NSObject *v4;
  uint8_t v5[16];

  v2 = self->mIncreasedScanRequestCount - 1;
  self->mIncreasedScanRequestCount = v2;
  if (!v2)
  {
    _CRKLogBluetooth_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Decreasing bluetooth scan rate", v5, 2u);
    }

    -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");
  }
}

- (void)updateScanner
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  _CRKLogBluetooth_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "deviceScannerState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableSet count](self->mScanningZones, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->mIncreasedScanRequestCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Updating scanner: scanner state = %{public}@, zones count = %{public}@, increased scan request count = %{public}@", buf, 0x20u);

  }
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "deviceScannerState") == 3)
  {
    v10 = -[NSMutableSet count](self->mScanningZones, "count");

    if (v10)
    {
      if (self->mIncreasedScanRequestCount <= 0)
        v11 = CFSTR("WPPuckBeaconNoRanging");
      else
        v11 = CFSTR("WPPuckCompany");
      v12 = v11;
      -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12;
      v20 = CFSTR("kPuckTypes");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerForDevicesMatching:options:", v15, MEMORY[0x24BDBD1B8]);

      if (!-[CRKClassSessionBeaconBrowser isScanning](self, "isScanning"))
      {
        +[CRKNetworkPowerAssertion increment](CRKNetworkPowerAssertion, "increment");
        -[CRKClassSessionBeaconBrowser setIsScanning:](self, "setIsScanning:", 1);
      }

      return;
    }
  }
  else
  {

  }
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "deviceScannerState") == 2)
  {

  }
  else
  {
    v17 = -[NSMutableSet count](self->mScanningZones, "count");

    if (v17)
      return;
  }
  -[CRKClassSessionBeaconBrowser trackerScanner](self, "trackerScanner");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unregisterAllDeviceChanges");

  if (-[CRKClassSessionBeaconBrowser isScanning](self, "isScanning"))
  {
    -[CRKClassSessionBeaconBrowser setIsScanning:](self, "setIsScanning:", 0);
    +[CRKNetworkPowerAssertion decrement](CRKNetworkPowerAssertion, "decrement");
  }
}

- (void)trackerScanner:(id)a3 didUpdateZoneTrackerState:(id)a4
{
  id v5;
  int64_t mZoneTrackerLastState;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  mZoneTrackerLastState = self->mZoneTrackerLastState;
  v7 = objc_msgSend(v5, "state");
  self->mZoneTrackerLastState = objc_msgSend(v5, "state");
  _CRKLogBluetooth_2();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "state");
    v10 = CFSTR("YES");
    if (mZoneTrackerLastState == v7)
      v10 = CFSTR("NO");
    v11 = v10;
    v12 = 134349314;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Zone tracker state %{public}ld, is changed: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (mZoneTrackerLastState != v7 && objc_msgSend(v5, "state") == 3)
  {
    -[CRKClassSessionBeaconBrowser updateZones](self, "updateZones");
    -[CRKClassSessionBeaconBrowser startInitialScan](self, "startInitialScan");
  }

}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 enteredZone:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  _CRKLogBluetooth_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Zone entered %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[CRKClassSessionBeaconBrowser startScanningForDevicesInZone:](self, "startScanningForDevicesInZone:", v6);
}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 exitedZone:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  _CRKLogBluetooth_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Zone exited %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[CRKClassSessionBeaconBrowser stopScanningForDevicesInZone:](self, "stopScanningForDevicesInZone:", v6);
}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 didFailToRegisterZones:(id)a5 withError:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD1398];
  v12[0] = a6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CRKErrorWithCodeAndUserInfo(103, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBeaconBrowser delegateDidFailWithError:](self, "delegateDidFailWithError:", v10);

}

- (void)trackerScanner:(id)a3 didUpdateDeviceScannerState:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _CRKLogBluetooth_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "Device scanner state %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[CRKClassSessionBeaconBrowser updateScanner](self, "updateScanner");

}

- (void)trackerScanner:(id)a3 scanner:(id)a4 foundRequestedDevices:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a5;
  _CRKLogBluetooth_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)trackerScanner:(id)a3 scanner:(id)a4 foundDevice:(id)a5 withData:(id)a6
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  CRKRemoteEndpoint *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  __int128 buf;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a6;
  _CRKLogBluetooth_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Found device %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPuckCompanyUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPuckCompanyMajor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shortValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPuckCompanyMinor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v9) = objc_msgSend(v11, "shortValue");

  v12 = (unsigned __int16)v9 | (v10 << 16);
  if (-[CRKClassSessionBeaconBrowser allowInvitationSessions](self, "allowInvitationSessions")
    && (objc_msgSend(v8, "UUIDString"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("436C6173-7372-6F6F-6D49-6E7669746531")),
        v13,
        v14))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "crk_stringWithIPAddress:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CRKRemoteEndpoint initWithIPAddress:port:]([CRKRemoteEndpoint alloc], "initWithIPAddress:port:", v15, (unsigned __int16)CRKClassroomServicePortNumberV2);
    -[CRKClassSessionBeaconBrowser delegateDidFindInvitationSessionWithEndpoint:](self, "delegateDidFindInvitationSessionWithEndpoint:", v16);

  }
  else
  {
    v29 = v6;
    buf = 0uLL;
    objc_msgSend(v8, "getUUIDBytes:", &buf);
    v17 = HIWORD(buf);
    v18 = WORD6(buf);
    v28 = v8;
    -[CRKClassSessionBeaconBrowser zoneDataForOrganizationUUID:](self, "zoneDataForOrganizationUUID:", v8);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeaconBrowser organizationUUIDsMatchingZoneData:](self, "organizationUUIDsMatchingZoneData:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = bswap32(v17) >> 16;
      v23 = bswap32(v18) >> 16;
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v19);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7F0]), "initWithOrganizationUUID:groupID:leaderIP:port:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25), v22, v12, (unsigned __int16)CRKClassroomServicePortNumberV2);
          -[CRKClassSessionBeaconBrowser delegateDidFindClassSession:flags:](self, "delegateDidFindClassSession:flags:", v26, v23);

          ++v25;
        }
        while (v21 != v25);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v21);
    }

    v8 = v28;
    v6 = v29;
  }

}

- (void)trackerScanner:(id)a3 scanner:(id)a4 didFailToRegisterDevices:(id)a5 withError:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a5;
  v8 = a6;
  _CRKLogBluetooth_2();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CRKClassSessionBeaconBrowser trackerScanner:scanner:didFailToRegisterDevices:withError:].cold.1((uint64_t)v8, (uint64_t)v7, v9);

}

- (void)delegateDidFindClassSession:(id)a3 flags:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beaconBrowser:didFindBeaconForClassSession:flags:", self, v9, v4);

  }
}

- (void)delegateDidFindInvitationSessionWithEndpoint:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beaconBrowser:didFindBeaconForInvitationSessionWithEndpoint:", self, v7);

  }
}

- (void)delegateDidFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKClassSessionBeaconBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beaconBrowser:didFailWithError:", self, v7);

  }
}

- (CRKClassSessionBeaconBrowserDelegate)delegate
{
  return (CRKClassSessionBeaconBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)organizationUUIDs
{
  return self->_organizationUUIDs;
}

- (BOOL)allowInvitationSessions
{
  return self->_allowInvitationSessions;
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (CRKWiProxTrackerScanner)trackerScanner
{
  return self->_trackerScanner;
}

- (void)setTrackerScanner:(id)a3
{
  objc_storeStrong((id *)&self->_trackerScanner, a3);
}

- (NSSet)trackingUUIDs
{
  return self->_trackingUUIDs;
}

- (void)setTrackingUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingUUIDs, 0);
  objc_storeStrong((id *)&self->_trackerScanner, 0);
  objc_storeStrong((id *)&self->_organizationUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mScanningZones, 0);
}

- (void)trackerScanner:(os_log_t)log scanner:didFailToRegisterDevices:withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end

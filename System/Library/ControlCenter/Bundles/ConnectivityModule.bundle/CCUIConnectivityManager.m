@implementation CCUIConnectivityManager

+ (CCUIConnectivityManager)sharedInstance
{
  if (qword_25414CC28 != -1)
    dispatch_once(&qword_25414CC28, &unk_24FFCAB00);
  return (CCUIConnectivityManager *)(id)qword_25414CC30;
}

- (CCUIConnectivityManager)init
{
  const char *v2;
  uint64_t v3;
  CCUIConnectivityManager *v4;
  uint64_t v5;
  NSHashTable *vpnViewControllersObservingStateChanges;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSHashTable *wifiViewControllersObservingStateChanges;
  id v11;
  const char *v12;
  uint64_t v13;
  NEVPNConnectivityManager *vpnConnectivityManager;
  WFControlCenterStateMonitor *v15;
  WFControlCenterStateMonitor *wifiStateMonitor;
  WFPersonalHotspotStateMonitor *v17;
  WFPersonalHotspotStateMonitor *hotspotStateMonitor;
  WFControlCenterStateMonitor *v19;
  const char *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CCUIConnectivityManager;
  v4 = -[CCUIConnectivityManager init](&v25, sel_init);
  if (v4)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    vpnViewControllersObservingStateChanges = v4->_vpnViewControllersObservingStateChanges;
    v4->_vpnViewControllersObservingStateChanges = (NSHashTable *)v5;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    wifiViewControllersObservingStateChanges = v4->_wifiViewControllersObservingStateChanges;
    v4->_wifiViewControllersObservingStateChanges = (NSHashTable *)v9;

    v11 = objc_alloc(MEMORY[0x24BDE2750]);
    v13 = objc_msgSend_initWithDelegate_(v11, v12, (uint64_t)v4);
    vpnConnectivityManager = v4->_vpnConnectivityManager;
    v4->_vpnConnectivityManager = (NEVPNConnectivityManager *)v13;

    v15 = (WFControlCenterStateMonitor *)objc_alloc_init(MEMORY[0x24BEC28D8]);
    wifiStateMonitor = v4->_wifiStateMonitor;
    v4->_wifiStateMonitor = v15;

    v17 = (WFPersonalHotspotStateMonitor *)objc_alloc_init(MEMORY[0x24BEC28F0]);
    hotspotStateMonitor = v4->_hotspotStateMonitor;
    v4->_hotspotStateMonitor = v17;

    objc_initWeak(&location, v4);
    v19 = v4->_wifiStateMonitor;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_230FAD130;
    v22[3] = &unk_24FFCAB50;
    objc_copyWeak(&v23, &location);
    objc_msgSend_setHandler_(v19, v20, (uint64_t)v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)addVPNViewControllerObservingStateChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_vpnViewControllersObservingStateChanges(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v7, (uint64_t)v4);

}

- (void)removeVPNViewControllerObservingStateChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_vpnViewControllersObservingStateChanges(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v8, v7, (uint64_t)v4);

}

- (void)addWiFiViewControllerObservingStateChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_wifiViewControllersObservingStateChanges(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v7, (uint64_t)v4);

}

- (void)removeWiFiViewControllerObservingStateChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_wifiViewControllersObservingStateChanges(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v8, v7, (uint64_t)v4);

}

- (void)connectivityManagerDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FAD42C;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (NEVPNConnectivityManager)vpnConnectivityManager
{
  return self->_vpnConnectivityManager;
}

- (WFPersonalHotspotStateMonitor)hotspotStateMonitor
{
  return self->_hotspotStateMonitor;
}

- (WFControlCenterStateMonitor)wifiStateMonitor
{
  return self->_wifiStateMonitor;
}

- (NSHashTable)vpnViewControllersObservingStateChanges
{
  return self->_vpnViewControllersObservingStateChanges;
}

- (void)setVpnViewControllersObservingStateChanges:(id)a3
{
  objc_storeStrong((id *)&self->_vpnViewControllersObservingStateChanges, a3);
}

- (NSHashTable)wifiViewControllersObservingStateChanges
{
  return self->_wifiViewControllersObservingStateChanges;
}

- (void)setWifiViewControllersObservingStateChanges:(id)a3
{
  objc_storeStrong((id *)&self->_wifiViewControllersObservingStateChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiViewControllersObservingStateChanges, 0);
  objc_storeStrong((id *)&self->_vpnViewControllersObservingStateChanges, 0);
  objc_storeStrong((id *)&self->_wifiStateMonitor, 0);
  objc_storeStrong((id *)&self->_hotspotStateMonitor, 0);
  objc_storeStrong((id *)&self->_vpnConnectivityManager, 0);
}

@end

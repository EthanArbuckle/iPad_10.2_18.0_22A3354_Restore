@implementation BUNetworkMonitor

- (BUNetworkMonitor)initWithQueue:(id)a3
{
  id v5;
  BUNetworkMonitor *v6;
  BUNetworkMonitor *v7;
  RadiosPreferences *v8;
  RadiosPreferences *radiosPreferences;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BUNetworkMonitor;
  v6 = -[BUNetworkMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monitorQueue, a3);
    v8 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04790]);
    radiosPreferences = v7->_radiosPreferences;
    v7->_radiosPreferences = v8;

  }
  return v7;
}

- (void)start
{
  NSObject *monitorQueue;
  _QWORD block[5];

  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E55BF0;
  block[3] = &unk_24CED9E10;
  block[4] = self;
  dispatch_async(monitorQueue, block);
}

- (void)stop
{
  NSObject *monitorQueue;
  _QWORD block[5];

  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E55E90;
  block[3] = &unk_24CED9E10;
  block[4] = self;
  dispatch_async(monitorQueue, block);
}

- (BOOL)hasCellularCapability
{
  if (qword_254B69F78 != -1)
    dispatch_once(&qword_254B69F78, &unk_24CEDA128);
  return byte_254B69F70;
}

- (BOOL)hasWAPICapability
{
  if (qword_254B69F88 != -1)
    dispatch_once(&qword_254B69F88, &unk_24CEDA148);
  return byte_254B69F80;
}

- (BOOL)isAirplaneModeEnabled
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_radiosPreferences(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refresh(v4, v5, v6);

  objc_msgSend_radiosPreferences(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend_airplaneMode(v9, v10, v11);

  return (char)v4;
}

- (BOOL)hasCellularConnection
{
  uint64_t v2;
  NSObject *currentPath;

  return objc_msgSend_isConnected(self, a2, v2)
      && (currentPath = self->_currentPath) != 0
      && nw_path_uses_interface_type(currentPath, nw_interface_type_cellular);
}

- (BOOL)hasWifiConnection
{
  uint64_t v2;
  NSObject *currentPath;

  return objc_msgSend_isConnected(self, a2, v2)
      && (currentPath = self->_currentPath) != 0
      && nw_path_uses_interface_type(currentPath, nw_interface_type_wifi);
}

- (BOOL)isConnected
{
  NSObject *currentPath;

  currentPath = self->_currentPath;
  return !currentPath || (nw_path_get_status(currentPath) & 0xFFFFFFFD) != 0;
}

- (void)setCurrentPath:(id)a3
{
  OS_nw_path *v5;
  OS_nw_path **p_currentPath;
  OS_nw_path *currentPath;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  OS_nw_path *v12;

  v5 = (OS_nw_path *)a3;
  currentPath = self->_currentPath;
  p_currentPath = &self->_currentPath;
  if (currentPath != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)p_currentPath, a3);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v10, v11, (uint64_t)CFSTR("BUNetworkMonitorInterfaceDidChangeNotification"), 0);

    v5 = v12;
  }

}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_monitorQueue, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pathMonitor, a3);
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
}

@end

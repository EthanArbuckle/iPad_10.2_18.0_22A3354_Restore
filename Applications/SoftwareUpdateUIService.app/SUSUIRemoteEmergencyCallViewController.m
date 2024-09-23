@implementation SUSUIRemoteEmergencyCallViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id WeakRetained;
  os_log_type_t type;
  os_log_t oslog;
  id location[2];
  SUSUIRemoteEmergencyCallViewController *v7;
  uint8_t v8[24];

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100003488((uint64_t)v8, (uint64_t)v7, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "View Service terminated with error: %@ -> %@", v8, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
  if (WeakRetained)
    objc_msgSend(WeakRetained, "emergencyCallViewController:didExitWithError:", v7, location[0]);
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(location, 0);
}

- (void)dismiss
{
  NSObject *log;
  os_log_type_t type;
  id WeakRetained;
  uint8_t v5[7];
  os_log_type_t v6;
  id location[2];
  SUSUIRemoteEmergencyCallViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogEmergencyCallUI();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    type = v6;
    sub_1000020A4(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismissing SUSUIRemoteEmergencyCallViewController", v5, 2u);
  }
  objc_storeStrong(location, 0);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
  if (WeakRetained)
    objc_msgSend(WeakRetained, "dismissEmergencyCallViewController:", v8);
  objc_storeStrong(&WeakRetained, 0);
}

- (SUSUIRemoteEmergencyCallViewControllerDelegate)delegate
{
  return (SUSUIRemoteEmergencyCallViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

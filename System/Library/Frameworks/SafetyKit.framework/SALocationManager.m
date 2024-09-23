@implementation SALocationManager

- (SALocationManager)init
{
  SALocationManager *v2;
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SALocationManager;
  v2 = -[SALocationManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBFA88]);
    +[SABundleManager locationBundle](SABundleManager, "locationBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithEffectiveBundle:delegate:onQueue:", v4, v2, MEMORY[0x24BDAC9B8]);
    -[SALocationManager setLocationManager:](v2, "setLocationManager:", v5);

    -[CLLocationManager setDesiredAccuracy:](v2->_locationManager, "setDesiredAccuracy:", 10.0);
  }
  return v2;
}

- (void)notifyLocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[SALocationManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "locationManager:didUpdateLocation:", self, v4);
  }
  else
  {
    sa_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SALocationManager notifyLocation:].cold.1(v6);

  }
}

- (void)startMonitoringLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sa_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SALocationManager startMonitoringLocation]";
    _os_log_impl(&dword_23457A000, v3, OS_LOG_TYPE_DEFAULT, "%s, Starting location updates", (uint8_t *)&v6, 0xCu);
  }

  -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
  -[CLLocationManager location](self->_locationManager, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLLocationManager location](self->_locationManager, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SALocationManager notifyLocation:](self, "notifyLocation:", v5);

  }
}

- (void)stopMonitoringLocation
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SALocationManager stopMonitoringLocation]";
  _os_log_debug_impl(&dword_23457A000, log, OS_LOG_TYPE_DEBUG, "%s, Stopping location updates", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v5 = a4;
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SALocationManager locationManager:didUpdateLocations:].cold.1(v5, v6);

  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SALocationManager notifyLocation:](self, "notifyLocation:", v8);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SALocationManager locationManager:didFailWithError:].cold.1();

}

- (SALocationManagerProtocol)delegate
{
  return (SALocationManagerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)notifyLocation:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[SALocationManager notifyLocation:]";
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "%{public}s, Unable to deliver location updates", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)locationManager:(void *)a1 didUpdateLocations:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23457A000, a2, OS_LOG_TYPE_DEBUG, "%s, Location update received, %@", (uint8_t *)v4, 0x16u);

}

- (void)locationManager:didFailWithError:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23457A000, v0, OS_LOG_TYPE_ERROR, "%s, Location manager error, %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end

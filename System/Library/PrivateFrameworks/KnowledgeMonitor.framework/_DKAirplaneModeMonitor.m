@implementation _DKAirplaneModeMonitor

+ (id)_eventWithState:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "airplaneModeStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithStream:startDate:endDate:value:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_BMEventWithState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE0C310]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStarting:", v5);

  return v6;
}

+ (id)eventStream
{
  return CFSTR("AirplaneMode");
}

- (void)dealloc
{
  objc_super v3;

  -[_DKAirplaneModeMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKAirplaneModeMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

- (void)start
{
  int v2;
  int v3[6];

  v2 = OUTLINED_FUNCTION_6();
  SCErrorString(v2);
  v3[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_219056000, a1, OS_LOG_TYPE_DEBUG, "%s: SCPreferencesSetDispatchQueue() %s", (uint8_t *)v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKAirplaneModeMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKAirplaneModeMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  OUTLINED_FUNCTION_0(&dword_219056000, a1, a3, "%s: Deactivated _DKAirplaneModeMonitor", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateAirplaneModeStatus
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[_DKAirplaneModeMonitor updateAirplaneModeStatus]";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "%s: Current AirplaneMode Status:%d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (NSNumber)airplaneModeStatus
{
  return self->_airplaneModeStatus;
}

- (void)setAirplaneModeStatus:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneModeStatus, a3);
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplaneModeStatus, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end

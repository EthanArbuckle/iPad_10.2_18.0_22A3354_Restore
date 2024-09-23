@implementation ACCFeaturePluginHID

- (void)initPlugin
{
  init_logging();
  -[ACCFeaturePluginHID setHidProvider:](self, "setHidProvider:", 0);
  -[ACCFeaturePluginHID setIsRunning:](self, "setIsRunning:", 0);
}

- (void)startPlugin
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A9A3000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHID startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21A9A3000, v5, OS_LOG_TYPE_DEFAULT, "Stopping HID feature plugin...", v7, 2u);
  }

  -[ACCFeaturePluginHID hidProvider](self, "hidProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopHIDProvider");

  -[ACCFeaturePluginHID setHidProvider:](self, "setHidProvider:", 0);
  -[ACCFeaturePluginHID setIsRunning:](self, "setIsRunning:", 0);
}

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCFeaturePluginHID pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCFeaturePluginHID isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCFeaturePluginHIDProvider)hidProvider
{
  return self->_hidProvider;
}

- (void)setHidProvider:(id)a3
{
  objc_storeStrong((id *)&self->_hidProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidProvider, 0);
}

@end

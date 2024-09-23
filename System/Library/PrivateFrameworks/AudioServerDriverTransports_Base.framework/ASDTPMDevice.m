@implementation ASDTPMDevice

+ (id)pmDeviceWithConfig:(id)a3 forSequencer:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_msgSend(v5, "asdtSubclass");
  if ((-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithConfig:forSequencer:", v5, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDTPMDevice pmDeviceWithConfig:forSequencer:].cold.1(v5);
    v8 = 0;
  }

  return v8;
}

- (ASDTPMDevice)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  id v7;
  ASDTPMDevice *v8;
  ASDTPMDevice *v9;
  void *v10;
  ASDTPMDevice *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDTPMDevice;
  v8 = -[ASDTPMDevice init](&v13, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  -[ASDTPMDevice setParentSequencer:](v8, "setParentSequencer:", v7);
  -[ASDTPMDevice setPowerState:](v9, "setPowerState:", 0);
  -[ASDTPMDevice setPmNoStateChangeOnFailure:](v9, "setPmNoStateChangeOnFailure:", objc_msgSend(v6, "asdtPMNoStateChangeOnFailure"));
  objc_msgSend(v6, "asdtName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMDevice setName:](v9, "setName:", v10);

  if ((objc_msgSend(v6, "asdtPMOrder:forPowerUp:", &v9->_pmOrderPowerUp, 1) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMDevice initWithConfig:forSequencer:].cold.2(v9);
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "asdtPMOrder:forPowerUp:", &v9->_pmOrderPowerDown, 0) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMDevice initWithConfig:forSequencer:].cold.1(v9);
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v11 = v9;
LABEL_10:

  return v11;
}

- (id)deviceName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)name
{
  NSString *name;
  void *v4;

  name = self->_name;
  if (!name)
  {
    -[ASDTPMDevice deviceName](self, "deviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMDevice setName:](self, "setName:", v4);

    name = self->_name;
  }
  return name;
}

- (int)performPowerStateSleep
{
  return 0;
}

- (int)performPowerStateIdle:(int)a3
{
  return 0;
}

- (int)performPowerStatePrepare:(int)a3
{
  return 0;
}

- (int)performPowerStatePrewarm:(int)a3
{
  return 0;
}

- (int)performPowerStateOn
{
  return 0;
}

- (int)powerState
{
  return self->powerState;
}

- (void)setPowerState:(int)a3
{
  self->powerState = a3;
}

- (ASDTPMSequencer)parentSequencer
{
  return (ASDTPMSequencer *)objc_loadWeakRetained((id *)&self->_parentSequencer);
}

- (void)setParentSequencer:(id)a3
{
  objc_storeWeak((id *)&self->_parentSequencer, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)pmOrderPowerUp
{
  return self->_pmOrderPowerUp;
}

- (void)setPmOrderPowerUp:(unsigned int)a3
{
  self->_pmOrderPowerUp = a3;
}

- (unsigned)pmOrderPowerDown
{
  return self->_pmOrderPowerDown;
}

- (void)setPmOrderPowerDown:(unsigned int)a3
{
  self->_pmOrderPowerDown = a3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  return self->_pmNoStateChangeOnFailure;
}

- (void)setPmNoStateChangeOnFailure:(BOOL)a3
{
  self->_pmNoStateChangeOnFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parentSequencer);
}

+ (void)pmDeviceWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Subclass"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "Invalid subclass name: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Invalid or missing PMOrder (power down) property.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Invalid or missing PMOrder (power up) property.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

@end

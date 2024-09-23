@implementation _GCHapticLogicalDevice

- (_GCHapticLogicalDevice)initWithIdentifier:(id)a3 clientConnection:(id)a4
{
  id v7;
  id v8;
  _GCHapticLogicalDevice *v9;
  _GCHapticLogicalDevice *v10;
  uint64_t v11;
  NSMutableArray *hapticClients;
  uint64_t v13;
  NSMutableArray *hapticPlayers;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _GCDriverClientHapticInterface *driver;
  _GCLogicalDevice *logicalDevice;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_GCHapticLogicalDevice;
  v9 = -[_GCHapticLogicalDevice init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    +[NSMutableArray array](&off_254DEBB20, "array");
    v11 = objc_claimAutoreleasedReturnValue();
    hapticClients = v10->_hapticClients;
    v10->_hapticClients = (NSMutableArray *)v11;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    hapticPlayers = v10->_hapticPlayers;
    v10->_hapticPlayers = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_clientConnection, a4);
    if ((objc_msgSend(v8, "isMockClient") & 1) == 0)
    {
      +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logicalDevices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v10->_identifier);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "conformsToProtocol:", &unk_254DCA340))
      {
        v18 = v17;
        objc_msgSend(v18, "hapticDriver");
        v19 = objc_claimAutoreleasedReturnValue();
        driver = v10->_driver;
        v10->_driver = (_GCDriverClientHapticInterface *)v19;

      }
      logicalDevice = v10->_logicalDevice;
      v10->_logicalDevice = (_GCLogicalDevice *)v17;

    }
  }

  return v10;
}

- (void)registerHapticClient:(id)a3
{
  -[NSMutableArray addObject:](self->_hapticClients, "addObject:", a3);
}

- (void)unregisterHapticClient:(id)a3
{
  -[NSMutableArray removeObject:](self->_hapticClients, "removeObject:", a3);
}

- (BOOL)hasClients
{
  return -[NSMutableArray count](self->_hapticClients, "count") != 0;
}

- (void)stopAllHaptics
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSCopying *identifier;
  int v13;
  NSCopying *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      v13 = 138412290;
      v14 = identifier;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Stop all haptics for %@", (uint8_t *)&v13, 0xCu);
    }

  }
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  -[_GCDriverClientHapticInterface setHapticMotor:frequency:amplitude:](self->_driver, "setHapticMotor:frequency:amplitude:", 0, v3, v4);
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  -[_GCDriverClientHapticInterface setHapticMotor:frequency:amplitude:](self->_driver, "setHapticMotor:frequency:amplitude:", 1, v5, v6);
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  -[_GCDriverClientHapticInterface setHapticMotor:frequency:amplitude:](self->_driver, "setHapticMotor:frequency:amplitude:", 2, v7, v8);
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  -[_GCDriverClientHapticInterface setHapticMotor:frequency:amplitude:](self->_driver, "setHapticMotor:frequency:amplitude:", 3, v9, v10);
  -[_GCDriverClientHapticInterface enableHaptics](self->_driver, "enableHaptics");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_hapticClients, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logicalDevice, 0);
}

@end

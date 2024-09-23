@implementation CFXThermalPolicyManager

- (void)setRecordingPolicy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_recordingPolicy != a3)
  {
    v3 = a3;
    self->_recordingPolicy = a3;
    -[CFXThermalPolicyManager policyManager](self, "policyManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPolicyType:active:", objc_opt_class(), v3);

    -[CFXThermalPolicyManager CFX_notifyPolicyChanged](self, "CFX_notifyPolicyChanged");
  }
}

- (CFXThermalPolicyManager)init
{
  CFXThermalPolicyManager *v2;
  CFXDefaultThermalPolicy *v3;
  JFXThermalPolicyManager *v4;
  JFXThermalPolicyManager *policyManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXThermalPolicyManager;
  v2 = -[CFXThermalPolicyManager init](&v7, sel_init);
  v3 = objc_alloc_init(CFXDefaultThermalPolicy);
  v4 = -[JFXThermalPolicyManager initWithDefaultPolicy:]([JFXThermalPolicyManager alloc], "initWithDefaultPolicy:", v3);
  policyManager = v2->_policyManager;
  v2->_policyManager = v4;

  return v2;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  id v12;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  -[CFXThermalPolicyManager policyManager](self, "policyManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "highestPriorityPolicy");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "cameraFPSForThermalLevel:deviceType:minRate:maxRate:", v8, v10, a5, a6);
}

- (void)CFX_notifyPolicyChanged
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  JFXLog_thermals();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXThermalPolicyManager policyManager](self, "policyManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "highestPriorityPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Thermal Policy Changed:\n\t%@", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CFXThermalPolicyManager_CFX_notifyPolicyChanged__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__CFXThermalPolicyManager_CFX_notifyPolicyChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("JFXThermalPolicyChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)recordingPolicy
{
  return self->_recordingPolicy;
}

- (JFXThermalPolicyManager)policyManager
{
  return self->_policyManager;
}

- (void)setPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_policyManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyManager, 0);
}

@end

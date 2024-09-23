@implementation CDPRecoveryTestController

- (CDPRecoveryTestController)initWithDevices:(id)a3 andNavigationController:(id)a4
{
  id v7;
  id v8;
  CDPRecoveryTestController *v9;
  CDPRecoveryTestController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryTestController;
  v9 = -[CDPRecoveryTestController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mockDevices, a3);
    objc_storeStrong((id *)&v10->_navController, a4);
  }

  return v10;
}

- (void)setUp
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CDPDBackupInfoRecoveryFlowController *v8;
  CDPDBackupInfoRecoveryFlowController *recoveryController;
  id v10;

  -[NSArray enumerateObjectsUsingBlock:](self->_mockDevices, "enumerateObjectsUsingBlock:", &__block_literal_global);
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdmsRecovery:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v3, "setContext:", v10);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA10]), "initWithPresentingViewController:", self->_navController);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A498]), "initWithUIProvider:", v4);
  v6 = objc_alloc(MEMORY[0x24BE1A9C8]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A9E0]), "initWithContext:uiProvider:delegate:", v10, v5, 0);
  v8 = (CDPDBackupInfoRecoveryFlowController *)objc_msgSend(v6, "initWithContext:uiProvider:secureBackupController:circleProxy:octagonProxy:", v3, v5, v7, 0, 0);
  recoveryController = self->_recoveryController;
  self->_recoveryController = v8;

}

uint64_t __34__CDPRecoveryTestController_setUp__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRemainingAttempts:", 10);
}

- (id)dummyRecoveryInfo
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE1A338];
  v9[0] = *MEMORY[0x24BE1A340];
  v9[1] = v2;
  v10[0] = CFSTR("mockMID");
  v10[1] = CFSTR("mockPRK");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE17C40];
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_mockDevices, 0);
  objc_storeStrong((id *)&self->_recoveryController, 0);
}

@end

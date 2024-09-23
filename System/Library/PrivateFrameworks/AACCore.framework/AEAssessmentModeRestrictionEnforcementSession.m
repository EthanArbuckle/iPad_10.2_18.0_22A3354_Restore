@implementation AEAssessmentModeRestrictionEnforcementSession

- (void)dealloc
{
  objc_super v3;

  -[AEAssessmentModeRestrictionEnforcementSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AEAssessmentModeRestrictionEnforcementSession;
  -[AEAssessmentModeRestrictionEnforcementSession dealloc](&v3, sel_dealloc);
}

- (id)initWithRestrictionEnforcer:(void *)a3 machServiceName:
{
  id v5;
  id v6;
  id *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)AEAssessmentModeRestrictionEnforcementSession;
    v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 1, a3);
      objc_storeWeak(a1 + 2, v5);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v6);
      v9 = a1[3];
      a1[3] = (id)v8;

      objc_msgSend(a1[3], "setDelegate:", a1);
      objc_msgSend(a1[3], "activate");
    }
  }

  return a1;
}

- (void)invalidate
{
  if (self)
    self = (AEAssessmentModeRestrictionEnforcementSession *)self->_xpcListener;
  -[AEAssessmentModeRestrictionEnforcementSession invalidate](self, "invalidate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.automatic-assessment-configuration.restrictor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v7, "invalidate");
    v10 = 0;
  }
  else
  {
    objc_initWeak(&location, v7);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke;
    v15 = &unk_24FA21A70;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "setInterruptionHandler:", &v12);
    if (self)
      self = (AEAssessmentModeRestrictionEnforcementSession *)objc_loadWeakRetained((id *)&self->_enforcer);
    objc_msgSend(v7, "setExportedObject:", self, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E02068);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "activate");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    v10 = 1;
  }

  return v10;
}

void __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  AECoreLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_enforcer);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __84__AEAssessmentModeRestrictionEnforcementSession_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E279000, log, OS_LOG_TYPE_ERROR, "EnforcementSession connection interrupted", v1, 2u);
}

@end

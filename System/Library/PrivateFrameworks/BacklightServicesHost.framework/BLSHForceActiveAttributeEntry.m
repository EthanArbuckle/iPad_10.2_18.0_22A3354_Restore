@implementation BLSHForceActiveAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  v8 = (objc_class *)MEMORY[0x24BE0B848];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  v13 = objc_alloc(MEMORY[0x24BE0B858]);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "explanation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (clientPid:%d) - force active"), v16, objc_msgSend(v17, "clientPid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 1, v18, mach_continuous_time(), 11, 0);
  v20 = (id)objc_msgSend(v12, "performChangeRequest:", v19);

  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForAttribute:fromAssertion:forService:", v11, v10, v9);
  return v21;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHForceActiveAttributeEntry *v11;
  id *p_isa;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHForceActiveAttributeEntry;
  v11 = -[BLSHForceActiveAttributeEntry init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 2, v9);
    objc_storeWeak(p_isa + 3, v10);
  }

  return p_isa;
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

- (BLSAttribute)attribute
{
  return (BLSAttribute *)objc_loadWeakRetained((id *)&self->_attribute);
}

- (BLSAssertionServiceResponding)assertion
{
  return (BLSAssertionServiceResponding *)objc_loadWeakRetained((id *)&self->_assertion);
}

- (BLSHAssertionAttributeHandlerService)service
{
  return (BLSHAssertionAttributeHandlerService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_destroyWeak((id *)&self->_attribute);
}

@end

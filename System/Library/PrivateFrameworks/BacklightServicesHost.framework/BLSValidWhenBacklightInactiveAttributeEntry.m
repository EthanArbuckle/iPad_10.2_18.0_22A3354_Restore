@implementation BLSValidWhenBacklightInactiveAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  char isKindOfClass;
  __objc2_class **v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = &off_24D1BB290;
  if ((isKindOfClass & 1) == 0)
    v12 = off_24D1BAFE8;
  v13 = (void *)objc_msgSend(objc_alloc(*v12), "initForAttribute:fromAssertion:forService:", v8, v10, v9);

  return v13;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSValidWhenBacklightInactiveAttributeEntry *v11;
  id *p_isa;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSValidWhenBacklightInactiveAttributeEntry;
  v11 = -[BLSValidWhenBacklightInactiveAttributeEntry init](&v14, sel_init);
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

@implementation BLSHDisableAlwaysOnAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForService:provider:", v7, v6);

  objc_msgSend(v8, "setupService");
  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSHDisableAlwaysOnAttributeHandler;
  v8 = -[BLSHLocalCountingAssertionAttributeHandler initForService:](&v11, sel_initForService_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 6, a4);

  return v9;
}

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
  -[BLSHDisableAlwaysOnProvider setAlwaysOnDisabledByAssertion:](self->_provider, "setAlwaysOnDisabledByAssertion:", 1);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  -[BLSHDisableAlwaysOnProvider setAlwaysOnDisabledByAssertion:](self->_provider, "setAlwaysOnDisabledByAssertion:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end

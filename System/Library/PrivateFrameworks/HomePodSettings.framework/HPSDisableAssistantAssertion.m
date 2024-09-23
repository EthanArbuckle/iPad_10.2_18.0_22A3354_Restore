@implementation HPSDisableAssistantAssertion

- (HPSDisableAssistantAssertion)initWithIdentifier:(id)a3
{
  return -[HPSDisableAssistantAssertion initWithIdentifier:connectionProvider:](self, "initWithIdentifier:connectionProvider:", a3, 0);
}

- (HPSDisableAssistantAssertion)initWithIdentifier:(id)a3 connectionProvider:(id)a4
{
  id v6;
  id v7;
  HPSDisableAssistantAssertion *v8;
  HPSAssertion *v9;
  HPSAssertion *assertion;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPSDisableAssistantAssertion;
  v8 = -[HPSDisableAssistantAssertion init](&v12, sel_init);
  if (v8)
  {
    v9 = -[HPSAssertion initWithIdentifier:assertionType:connectionProvider:]([HPSAssertion alloc], "initWithIdentifier:assertionType:connectionProvider:", v6, 1, v7);
    assertion = v8->_assertion;
    v8->_assertion = v9;

  }
  return v8;
}

+ (NSString)label
{
  return (NSString *)CFSTR("DisableAssistant");
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[HPSDisableAssistantAssertion assertion](self, "assertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HPSDisableAssistantAssertion assertion](self, "assertion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateWithCompletion:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HPSDisableAssistantAssertion assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HPSDisableAssistantAssertion;
  -[HPSDisableAssistantAssertion dealloc](&v4, sel_dealloc);
}

- (HPSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end

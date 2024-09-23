@implementation CRKUnionAssertionProvider

+ (id)activeIDSClassSessionAssertionProviderWithPrefix:(id)a3
{
  void *v3;
  CRKUnionAssertionProvider *v4;
  void *v5;
  CRKOSTransactionAssertionProvider *v6;
  void *v7;
  CRKOSTransactionAssertionProvider *v8;
  void *v9;
  CRKUnionAssertionProvider *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.active-ids-class-session"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CRKUnionAssertionProvider alloc];
  v5 = (void *)objc_opt_new();
  v12[0] = v5;
  v6 = [CRKOSTransactionAssertionProvider alloc];
  v7 = (void *)objc_opt_new();
  v8 = -[CRKOSTransactionAssertionProvider initWithReverseDNSReason:primitives:](v6, "initWithReverseDNSReason:primitives:", v3, v7);
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKUnionAssertionProvider initWithAssertionProviders:](v4, "initWithAssertionProviders:", v9);

  return v10;
}

- (CRKUnionAssertionProvider)initWithAssertionProviders:(id)a3
{
  id v4;
  CRKUnionAssertionProvider *v5;
  uint64_t v6;
  NSArray *assertionProviders;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKUnionAssertionProvider;
  v5 = -[CRKUnionAssertionProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assertionProviders = v5->_assertionProviders;
    v5->_assertionProviders = (NSArray *)v6;

  }
  return v5;
}

- (id)acquireAssertion
{
  void *v2;
  void *v3;
  void *v4;

  -[CRKUnionAssertionProvider assertionProviders](self, "assertionProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_82);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C740]), "initWithCancellables:", v3);
  return v4;
}

uint64_t __45__CRKUnionAssertionProvider_acquireAssertion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "acquireAssertion");
}

- (NSArray)assertionProviders
{
  return self->_assertionProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionProviders, 0);
}

@end

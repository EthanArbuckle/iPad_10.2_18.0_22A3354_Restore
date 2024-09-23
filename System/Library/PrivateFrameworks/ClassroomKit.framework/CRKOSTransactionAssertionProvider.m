@implementation CRKOSTransactionAssertionProvider

- (CRKOSTransactionAssertionProvider)initWithReverseDNSReason:(id)a3 primitives:(id)a4
{
  id v6;
  id v7;
  CRKOSTransactionAssertionProvider *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKOSTransactionAssertionProvider;
  v8 = -[CRKOSTransactionAssertionProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeStrong((id *)&v8->_primitives, a4);
  }

  return v8;
}

- (id)acquireAssertion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[CRKOSTransactionAssertionProvider primitives](self, "primitives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKOSTransactionAssertionProvider reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionWithReverseDNSReason:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE2C740]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__CRKOSTransactionAssertionProvider_acquireAssertion__block_invoke;
  v10[3] = &unk_24D9C7020;
  v11 = v5;
  v7 = v5;
  v8 = (void *)objc_msgSend(v6, "initWithCancellationBlock:", v10);

  return v8;
}

uint64_t __53__CRKOSTransactionAssertionProvider_acquireAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (NSString)reason
{
  return self->_reason;
}

- (CRKOSTransactionPrimitives)primitives
{
  return self->_primitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end

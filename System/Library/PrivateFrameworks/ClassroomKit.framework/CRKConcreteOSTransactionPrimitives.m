@implementation CRKConcreteOSTransactionPrimitives

- (int64_t)transactionCount
{
  return (int)atomic_load((unsigned int *)&underlyingTransactionCount);
}

- (id)transactionWithReverseDNSReason:(id)a3
{
  id v4;
  CRKOSTransactionToken *v5;
  CRKOSTransactionToken *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[CRKConcreteOSTransactionPrimitives incrementCount](self, "incrementCount");
  objc_initWeak(&location, self);
  v5 = [CRKOSTransactionToken alloc];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CRKConcreteOSTransactionPrimitives_transactionWithReverseDNSReason___block_invoke;
  v8[3] = &unk_24D9C7A60;
  objc_copyWeak(&v9, &location);
  v6 = -[CRKOSTransactionToken initWithReason:completionHandler:](v5, "initWithReason:completionHandler:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __70__CRKConcreteOSTransactionPrimitives_transactionWithReverseDNSReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "decrementCount");

}

- (void)incrementCount
{
  unsigned int v2;

  do
    v2 = __ldaxr((unsigned int *)&underlyingTransactionCount);
  while (__stlxr(v2 + 1, (unsigned int *)&underlyingTransactionCount));
}

- (void)decrementCount
{
  unsigned int v2;

  do
    v2 = __ldaxr((unsigned int *)&underlyingTransactionCount);
  while (__stlxr(v2 - 1, (unsigned int *)&underlyingTransactionCount));
}

@end

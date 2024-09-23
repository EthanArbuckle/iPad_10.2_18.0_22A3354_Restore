@implementation MTConfigAMSMetricsDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

void __37__MTConfigAMSMetricsDelegate_sources__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a4);
  }
  else
  {
    +[MTReflectUtil objectAsDictionary:](MTReflectUtil, "objectAsDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");

    v9 = *(void **)(a1 + 32);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithResult:", v10);

    v6 = (id)v8;
  }

}

- (id)sources
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  -[MTConfigAMSMetricsDelegate bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = (void *)objc_opt_new();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__MTConfigAMSMetricsDelegate_sources__block_invoke;
    v15[3] = &unk_24C7A08A8;
    v11 = v10;
    v16 = v11;
    objc_msgSend(v3, "valueWithCompletion:", v15);

  }
  else
  {
    MTConfigurationError(103, CFSTR("AMSBag doesn't have metrics key in the registered keyset."), v4, v5, v6, v7, v8, v9, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (MTConfigAMSMetricsDelegate)initWithAMSBag:(id)a3
{
  id v4;
  MTConfigAMSMetricsDelegate *v5;
  MTConfigAMSMetricsDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTConfigAMSMetricsDelegate;
  v5 = -[MTConfigAMSMetricsDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MTConfigAMSMetricsDelegate setBag:](v5, "setBag:", v4);
    objc_msgSend(MEMORY[0x24BE08058], "registerBagKeySetForMetricsConfiguration:", v4);
  }

  return v6;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

@end

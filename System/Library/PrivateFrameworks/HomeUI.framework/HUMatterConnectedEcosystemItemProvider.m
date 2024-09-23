@implementation HUMatterConnectedEcosystemItemProvider

- (id)futureFilteringOutSystemCommissionerEcosystem:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke;
  v7[3] = &unk_1E6F51E78;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "na_filter:", &__block_literal_global_67);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "count");

  objc_msgSend(WeakRetained, "setHasSystemCommissionerEcosystem:", v6 > objc_msgSend(v5, "count"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __88__HUMatterConnectedEcosystemItemProvider_futureFilteringOutSystemCommissionerEcosystem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "vendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemCommissionerVendor") ^ 1;

  return v3;
}

- (BOOL)hasSystemCommissionerEcosystem
{
  return self->_hasSystemCommissionerEcosystem;
}

- (void)setHasSystemCommissionerEcosystem:(BOOL)a3
{
  self->_hasSystemCommissionerEcosystem = a3;
}

@end

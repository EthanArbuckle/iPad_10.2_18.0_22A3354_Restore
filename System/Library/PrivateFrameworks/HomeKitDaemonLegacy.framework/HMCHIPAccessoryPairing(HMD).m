@implementation HMCHIPAccessoryPairing(HMD)

- (uint64_t)initWithHMMTRPairing:()HMD
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0CBA6B0]);
    objc_msgSend(v5, "vendorID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vendorName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithIdentifier:name:", v7, v8);

    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAppleVendor:", objc_msgSend(v10, "integerValue") == 4937);

    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSystemCommissionerVendor:", objc_msgSend(v11, "integerValue") == 4996);

    v12 = objc_alloc(MEMORY[0x1E0CBA390]);
    objc_msgSend(v5, "rootPublicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRootPublicKey:vendor:", v13, v9);

    v15 = objc_alloc(MEMORY[0x1E0CBA398]);
    objc_msgSend(v5, "fabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fabricID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fabricLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithIdentifier:index:name:ecosystem:", v16, v17, v18, v14);

    objc_msgSend(v5, "nodeID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(a1, "initWithIdentifier:home:", v20, v19);

    return v21;
  }
  else
  {
    v23 = _HMFPreconditionFailure();
    return -[HMCHIPAccessoryPairing(HMD) chipPluginPairing](v23);
  }
}

- (id)chipPluginPairing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v14 = objc_alloc(MEMORY[0x1E0D332A0]);
  objc_msgSend(a1, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ecosystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rootPublicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ecosystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ecosystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vendor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithNodeID:fabricID:fabricLabel:rootPublicKey:vendorID:vendorName:", v20, v2, v3, v4, v7, v11);

  return v15;
}

@end

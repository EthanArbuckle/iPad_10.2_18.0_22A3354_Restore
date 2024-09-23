@implementation HULinkedApplicationInternalStoreItem

- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3
{
  id v5;
  HULinkedApplicationInternalStoreItem *v6;
  HULinkedApplicationInternalStoreItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationInternalStoreItem;
  v6 = -[HULinkedApplicationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (HULinkedApplicationInternalStoreItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4
{
  id v6;
  HULinkedApplicationInternalStoreItem *v7;
  HULinkedApplicationInternalStoreItem *v8;

  v6 = a4;
  v7 = -[HULinkedApplicationInternalStoreItem initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a3);
  v8 = v7;
  if (v7)
    -[HULinkedApplicationItem setAssociatedAccessories:](v7, "setAssociatedAccessories:", v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HULinkedApplicationInternalStoreItem bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[HULinkedApplicationItem associatedAccessories](self, "associatedAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:associatedAccessories:", v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HULinkedApplicationInternalStoreItem;
  -[HULinkedApplicationItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HULinkedApplicationInternalStoreItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __68__HULinkedApplicationInternalStoreItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("https://appshack.swe.apple.com/apps/%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("HFResultApplicationStoreURL"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = (void *)MEMORY[0x1E0D31178];
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "canHandleBundleID:", v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("HFResultApplicationIsInstalled"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

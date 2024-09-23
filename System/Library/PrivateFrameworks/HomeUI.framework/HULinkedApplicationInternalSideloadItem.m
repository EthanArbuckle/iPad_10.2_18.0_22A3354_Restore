@implementation HULinkedApplicationInternalSideloadItem

- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3
{
  id v5;
  HULinkedApplicationInternalSideloadItem *v6;
  HULinkedApplicationInternalSideloadItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationInternalSideloadItem;
  v6 = -[HULinkedApplicationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (HULinkedApplicationInternalSideloadItem)initWithBundleIdentifier:(id)a3 associatedAccessories:(id)a4
{
  id v6;
  HULinkedApplicationInternalSideloadItem *v7;
  HULinkedApplicationInternalSideloadItem *v8;

  v6 = a4;
  v7 = -[HULinkedApplicationInternalSideloadItem initWithBundleIdentifier:](self, "initWithBundleIdentifier:", a3);
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
  -[HULinkedApplicationInternalSideloadItem bundleIdentifier](self, "bundleIdentifier");
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
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HULinkedApplicationInternalSideloadItem;
  -[HULinkedApplicationItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HULinkedApplicationInternalSideloadItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __71__HULinkedApplicationInternalSideloadItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (void *)MEMORY[0x1E0D31178];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "canHandleBundleID:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HFResultApplicationIsInstalled"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

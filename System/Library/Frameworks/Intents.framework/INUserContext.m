@implementation INUserContext

- (void)becomeCurrent
{
  INUserContextStore *store;
  void *v4;
  id v5;

  store = self->_store;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUserContextStore storeUserContextViaHelper:forBundleIdentifier:](store, "storeUserContextViaHelper:forBundleIdentifier:", self, v4);

}

- (id)_init
{
  INUserContext *v2;
  uint64_t v3;
  INUserContextStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INUserContext;
  v2 = -[INUserContext init](&v6, sel_init);
  if (v2)
  {
    +[INUserContextStore sharedStore](INUserContextStore, "sharedStore");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (INUserContextStore *)v3;

  }
  return v2;
}

- (void)_setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void)_becomeCurrentNoHelper
{
  INUserContextStore *store;
  void *v4;
  id v5;

  store = self->_store;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUserContextStore storeUserContext:forBundleIdentifier:](store, "storeUserContext:forBundleIdentifier:", self, v4);

}

- (INUserContext)initWithCoder:(id)a3
{

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

+ (int64_t)_type
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end

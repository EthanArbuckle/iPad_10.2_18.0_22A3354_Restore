@implementation LSAskManagerMCStateProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

- (id)initWithRestrictionsManager:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LSAskManagerMCStateProvider;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)restrictedBundleIDs
{
  return -[LSApplicationRestrictionsManager restrictedBundleIDs]((uint64_t)self->_manager);
}

- (BOOL)isAllowlistEnabled
{
  return -[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)self->_manager);
}

- (id)allowlistedBundleIDs
{
  return -[LSApplicationRestrictionsManager allowlistedBundleIDs](self->_manager);
}

@end

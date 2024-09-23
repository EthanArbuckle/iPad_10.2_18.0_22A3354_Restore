@implementation SGContactStoreFactory

+ (id)contactStore
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(&_mockContactStore);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (contactStore_onceToken != -1)
      dispatch_once(&contactStore_onceToken, &__block_literal_global_12794);
    v3 = (void *)contactStore__instance;
  }
  v4 = v3;

  return v4;
}

+ (id)contactStoreWithDonatedContacts
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(&_mockContactStore);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (contactStoreWithDonatedContacts_onceToken != -1)
      dispatch_once(&contactStoreWithDonatedContacts_onceToken, &__block_literal_global_1);
    v3 = (void *)contactStoreWithDonatedContacts__instance;
  }
  v4 = v3;

  return v4;
}

void __56__SGContactStoreFactory_contactStoreWithDonatedContacts__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C97298]);
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setIncludeDonatedContacts:", 1);
  v1 = objc_msgSend(v0, "initWithConfiguration:", v3);
  v2 = (void *)contactStoreWithDonatedContacts__instance;
  contactStoreWithDonatedContacts__instance = v1;

}

void __37__SGContactStoreFactory_contactStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)contactStore__instance;
  contactStore__instance = v0;

}

+ (void)useMockContactStore:(id)a3
{
  objc_storeWeak(&_mockContactStore, a3);
}

@end

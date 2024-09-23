@implementation CRKKeychainProvider

- (CRKKeychainProvider)initWithKeychain:(id)a3
{
  id v5;
  CRKKeychainProvider *v6;
  CRKKeychainProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeychainProvider;
  v6 = -[CRKKeychainProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keychain, a3);

  return v7;
}

+ (CRKKeychainProvider)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CRKKeychainProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, block);
  return (CRKKeychainProvider *)(id)sharedProvider_keychainProvider;
}

void __37__CRKKeychainProvider_sharedProvider__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "makeKeychainForCurrentEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithKeychain:", v4);
  v3 = (void *)sharedProvider_keychainProvider;
  sharedProvider_keychainProvider = v2;

}

+ (id)makeKeychainForCurrentEnvironment
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "crk_isBeingTested") & 1) != 0)
  {
    v3 = objc_opt_new();
  }
  else
  {
    +[CRKConcreteKeychain defaultKeychain](CRKConcreteKeychain, "defaultKeychain");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychain, 0);
}

@end

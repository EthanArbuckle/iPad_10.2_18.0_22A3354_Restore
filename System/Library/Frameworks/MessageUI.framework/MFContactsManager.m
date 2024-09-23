@implementation MFContactsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_15);
  return (id)sharedManager_sharedManager_0;
}

void __34__MFContactsManager_sharedManager__block_invoke()
{
  MFContactsManager *v0;
  void *v1;

  v0 = objc_alloc_init(MFContactsManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;

}

+ (BOOL)isAuthorizedToUseContacts
{
  if (isAuthorizedToUseContacts_onceToken != -1)
    dispatch_once(&isAuthorizedToUseContacts_onceToken, &__block_literal_global_1_0);
  return isAuthorizedToUseContacts_sIsAuthorizedToUseContacts;
}

uint64_t __46__MFContactsManager_isAuthorizedToUseContacts__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  isAuthorizedToUseContacts_sIsAuthorizedToUseContacts = (unint64_t)(result - 3) < 0xFFFFFFFFFFFFFFFELL;
  return result;
}

- (MFContactsManager)init
{
  void *v3;
  MFContactsManager *v4;

  MSSharedContactStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFContactsManager initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (MFContactsManager)initWithContactStore:(id)a3
{
  id v5;
  MFContactsManager *v6;
  MFContactsManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFContactsManager;
  v6 = -[MFContactsManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end

@implementation CSContactsWrapper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_29);
  return (id)sharedInstance_sContactsWrapper;
}

void __35__CSContactsWrapper_sharedInstance__block_invoke()
{
  CSContactsWrapper *v0;
  void *v1;

  v0 = objc_alloc_init(CSContactsWrapper);
  v1 = (void *)sharedInstance_sContactsWrapper;
  sharedInstance_sContactsWrapper = (uint64_t)v0;

}

+ (Class)CNContactClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCNContactClass_softClass;
  v9 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNContactClass_block_invoke;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getCNContactClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)CNContactFetchRequestClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCNContactFetchRequestClass_softClass;
  v9 = getCNContactFetchRequestClass_softClass;
  if (!getCNContactFetchRequestClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNContactFetchRequestClass_block_invoke;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getCNContactFetchRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)CNContactFormatterClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass;
  v9 = getCNContactFormatterClass_softClass;
  if (!getCNContactFormatterClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNContactFormatterClass_block_invoke;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getCNContactFormatterClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (Class)CNContactStoreClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCNContactStoreClass_softClass_0;
  v9 = getCNContactStoreClass_softClass_0;
  if (!getCNContactStoreClass_softClass_0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNContactStoreClass_block_invoke_0;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getCNContactStoreClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (id)CNContactNicknameKey
{
  id *v2;
  void *v3;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  v9 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    v3 = (void *)ContactsLibrary_0();
    v2 = (id *)dlsym(v3, "CNContactNicknameKey");
    v7[3] = (uint64_t)v2;
    getCNContactNicknameKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  return *v2;
}

- (Class)CNContactPropertyClass
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getCNContactPropertyClass_softClass;
  v9 = getCNContactPropertyClass_softClass;
  if (!getCNContactPropertyClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNContactPropertyClass_block_invoke;
    v5[3] = &unk_1E2401140;
    v5[4] = &v6;
    __getCNContactPropertyClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

- (NSString)CNContactEmailAddressesKeyString
{
  id *v2;
  void *v3;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  v9 = getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_0)
  {
    v3 = (void *)ContactsLibrary_0();
    v2 = (id *)dlsym(v3, "CNContactEmailAddressesKey");
    v7[3] = (uint64_t)v2;
    getCNContactEmailAddressesKeySymbolLoc_ptr_0 = (uint64_t)v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  return (NSString *)*v2;
}

@end

@implementation CNKeychainFacade

- (id)createSymmetricKeyIfNeededWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F877AC4);
}

- (id)existingSymmetricKeyWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F876F58);
}

- (id)removeEncryptionKeyWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F8786AC);
}

- (_TtC18ContactsFoundation16CNKeychainFacade)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNKeychainFacade();
  return -[CNKeychainFacade init](&v3, sel_init);
}

@end

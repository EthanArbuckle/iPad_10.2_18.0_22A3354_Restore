@implementation CNDataEncryptor

+ (id)encryptData:(id)a3 keyLabel:(id)a4
{
  return sub_18F87A2E0((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))_s18ContactsFoundation15CNDataEncryptorC7encrypt_8keyLabel0B04DataVSgAH_SStFZ_0);
}

+ (id)decryptData:(id)a3 keyLabel:(id)a4
{
  return sub_18F87A2E0((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))_s18ContactsFoundation15CNDataEncryptorC7decrypt_8keyLabel0B04DataVSgAH_SStFZ_0);
}

- (_TtC18ContactsFoundation15CNDataEncryptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return -[CNDataEncryptor init](&v3, sel_init);
}

@end

@implementation CNKeychainFacadeTestDouble

- (id)createSymmetricKeyIfNeededWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F87519C);
}

- (id)existingSymmetricKeyWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F8758BC);
}

- (id)removeEncryptionKeyWithLabel:(id)a3
{
  return sub_18F874F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_18F875D20);
}

- (_TtC18ContactsFoundation26CNKeychainFacadeTestDouble)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict) = (Class)MEMORY[0x1E0DEE9E0];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNKeychainFacadeTestDouble();
  return -[CNKeychainFacadeTestDouble init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

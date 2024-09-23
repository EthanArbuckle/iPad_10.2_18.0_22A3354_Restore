@implementation CryptoKitWrapper

+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4
{
  return sub_212FE4E54((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_212FE53D4);
}

+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4
{
  return sub_212FE4E54((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_212FE5658);
}

+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_212FE6F08();
  v13 = v12;

  v14 = sub_212FE6F08();
  v16 = v15;

  v17 = sub_212FE6F08();
  v19 = v18;

  v20 = sub_212FE58B8(v11, v13, v14, v16, v17, v19);
  v22 = v21;
  sub_212FE67E0(v17, v19);
  sub_212FE67E0(v14, v16);
  sub_212FE67E0(v11, v13);
  v23 = (void *)sub_212FE6EF0();
  sub_212FE67E0((uint64_t)v20, v22);
  return v23;
}

+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5
{
  id v6;
  __SecCertificate *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_212FE6F08();
  v10 = v9;

  sub_212FE5DAC(v8, v10, v7);
  sub_212FE67E0(v8, v10);
  v11 = (void *)sub_212FE6FD4();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return -[CryptoKitWrapper init](&v3, sel_init);
}

@end

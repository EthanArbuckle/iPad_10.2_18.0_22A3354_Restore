@implementation HKDF

+ (id)deriveKeyWith:(id)a3 salt:(id)a4 outputSize:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)specialized static HKDF.deriveKeyWith(_:salt:outputSize:)((uint64_t)v6, (uint64_t)v7);

  return v8;
}

- (_TtC17MessageProtection4HKDF)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HKDF();
  return -[HKDF init](&v3, sel_init);
}

@end

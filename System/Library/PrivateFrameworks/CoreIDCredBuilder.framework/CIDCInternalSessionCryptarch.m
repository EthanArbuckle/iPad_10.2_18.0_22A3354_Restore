@implementation CIDCInternalSessionCryptarch

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5
{
  return (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *)CIDCInternalSessionCryptarch.init(role:curve:variant:)(a3, a4, a5);
}

- (BOOL)setRemoteKey:(id)a3 error:(id *)a4
{
  id v5;
  _TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a3;
  v6 = self;
  v7 = sub_219C07ED0();
  v9 = v8;

  sub_219C07FC0();
  sub_219C034A4(v7, v9);
  return 1;
}

- (BOOL)deriveSessionKeysWithSessionTranscript:(id)a3 ikm:(id)a4 error:(id *)a5
{
  id v7;
  _TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a3;
  v8 = self;
  v9 = a4;
  v10 = sub_219C07ED0();
  v12 = v11;

  if (v9)
  {
    v13 = sub_219C07ED0();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  sub_219C07FB4();

  sub_219C03490(v13, v15);
  sub_219C034A4(v10, v12);
  return 1;
}

- (id)decryptWithData:(id)a3 error:(id *)a4
{
  return sub_219C02E24(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x24BE1D210]);
}

- (id)encryptWithData:(id)a3 error:(id *)a4
{
  return sub_219C02E24(self, (uint64_t)a2, a3, (uint64_t)a4, MEMORY[0x24BE1D218]);
}

- (NSData)publicKey
{
  _TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_219C07FFC();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_219C07EC4();
    sub_219C03490(v3, v5);
  }
  return (NSData *)v6;
}

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)init
{
  _TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *result;

  result = (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

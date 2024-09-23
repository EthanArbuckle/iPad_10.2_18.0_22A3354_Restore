@implementation CNDataEncoder

+ (id)encodeAddressingGrammar:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v4 = sub_18F87F668();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  sub_18F87F65C();

  v9 = _s18ContactsFoundation13CNDataEncoderC6encodey0B04DataVSgAE13TermOfAddressVFZ_0();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = 0;
  if (v11 >> 60 != 15)
  {
    v12 = (void *)sub_18F87F6D4();
    sub_18F879AB4(v9, v11);
  }
  return v12;
}

+ (id)decodeAddressingGrammarData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE176B48);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  v8 = sub_18F87F6E0();
  v10 = v9;

  static CNDataEncoder.decode(_:)((uint64_t)v6);
  sub_18F8791B8(v8, v10);
  v11 = sub_18F87F668();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_18F87F650();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (_TtC18ContactsFoundation13CNDataEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNDataEncoder();
  return -[CNDataEncoder init](&v3, sel_init);
}

@end

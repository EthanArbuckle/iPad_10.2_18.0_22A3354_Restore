@implementation AccountDetailsDataModel

- (_TtC6HomeUI23AccountDetailsDataModel)initWithMeContact:(id)a3
{
  return (_TtC6HomeUI23AccountDetailsDataModel *)AccountDetailsDataModel.init(meContact:)(a3);
}

- (NSString)phoneNumberServer
{
  _TtC6HomeUI23AccountDetailsDataModel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  AccountDetailsDataModel.phoneNumberServer.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)getInfoWithTafFieldKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC6HomeUI23AccountDetailsDataModel *v7;
  Swift::String v8;
  void *object;
  void *v10;

  v4 = sub_1B93EDDB4();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = AccountDetailsDataModel.getInfo(tafFieldKey:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)deserializeWithResults:(id)a3
{
  uint64_t v4;
  _TtC6HomeUI23AccountDetailsDataModel *v5;

  v4 = sub_1B93EDD00();
  v5 = self;
  AccountDetailsDataModel.deserialize(results:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (_TtC6HomeUI23AccountDetailsDataModel)init
{
  _TtC6HomeUI23AccountDetailsDataModel *result;

  result = (_TtC6HomeUI23AccountDetailsDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__contact;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF210B98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6HomeUI23AccountDetailsDataModel__didSubmitInfo;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EBE8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

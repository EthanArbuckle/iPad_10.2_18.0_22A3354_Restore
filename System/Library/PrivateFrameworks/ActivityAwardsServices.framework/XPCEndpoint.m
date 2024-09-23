@implementation XPCEndpoint

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC22ActivityAwardsServices11XPCEndpoint *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D2A9C65C(v7);

  return v9 & 1;
}

- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC22ActivityAwardsServices11XPCEndpoint *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1D2AB6808();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EFC9B198;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EFC9AF18;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1D2AAFD18((uint64_t)v11, (uint64_t)&unk_1EFC9AF20, (uint64_t)v16);
  swift_release();
}

- (_TtC22ActivityAwardsServices11XPCEndpoint)init
{
  _TtC22ActivityAwardsServices11XPCEndpoint *result;

  result = (_TtC22ActivityAwardsServices11XPCEndpoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

}

- (void)transportEvent:(unint64_t)a3 data:(id)a4
{
  void *v4;
  _TtC22ActivityAwardsServices11XPCEndpoint *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC22ActivityAwardsServices11XPCEndpoint *v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;

  v4 = a4;
  if (a4)
  {
    v5 = self;
    v6 = v4;
    v4 = (void *)sub_1D2AB6550();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  if (qword_1ED9788D8 != -1)
    swift_once();
  v10 = sub_1D2AB6634();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED9786E8);
  v11._countAndFlagsBits = 0xD000000000000061;
  v11._object = (void *)0x80000001D2AB8D90;
  v12._object = (void *)0x80000001D2AB8E00;
  v12._countAndFlagsBits = 0xD000000000000017;
  Logger.trace(file:function:)(v11, v12);
  sub_1D2A9E2D0((uint64_t)v4, v8);

}

@end

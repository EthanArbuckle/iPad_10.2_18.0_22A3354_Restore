@implementation XPCListener

- (_TtC15FitnessCoaching11XPCListener)init
{
  id v2;
  char *v3;

  v2 = objc_allocWithZone((Class)type metadata accessor for XPCListener());
  v3 = XPCListener.init(machServiceName:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC15FitnessCoaching11XPCListener *)v3;
}

- (void)dealloc
{
  uint64_t v2;
  _TtC15FitnessCoaching11XPCListener *v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  void *v7;
  objc_super v8;

  v2 = qword_1ED89DE58;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_1CC43AA7C();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED89DA90);
  v5._object = (void *)0x80000001CC441CA0;
  v5._countAndFlagsBits = 0xD00000000000005BLL;
  v6._countAndFlagsBits = 0x6164696C61766E69;
  v6._object = (void *)0xEC00000029286574;
  Logger.trace(file:function:)(v5, v6);
  v7 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC15FitnessCoaching11XPCListener_listener);
  objc_msgSend(v7, sel_setDelegate_, 0);
  objc_msgSend(v7, sel_invalidate);
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for XPCListener();
  -[XPCListener dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC15FitnessCoaching11XPCListener *v9;
  char v10;

  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15FitnessCoaching11XPCListener_requiredEntitlements);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1CC42C2D0(v8, v6);
  if ((v10 & 1) != 0)
    sub_1CC42B000(v8);

  return v10 & 1;
}

- (void)transportMessage:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
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
  _TtC15FitnessCoaching11XPCListener *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED89DAC0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CC43AC98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF9CBA10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF9CBA18;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1CC42C184((uint64_t)v11, (uint64_t)&unk_1EF9CBA20, (uint64_t)v16);
  swift_release();
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
  _TtC15FitnessCoaching11XPCListener *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED89DAC0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CC43AC98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF9CB9D0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF9CB9E0;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_1CC42C184((uint64_t)v11, (uint64_t)&unk_1EF9CB9F0, (uint64_t)v16);
  swift_release();
}

@end

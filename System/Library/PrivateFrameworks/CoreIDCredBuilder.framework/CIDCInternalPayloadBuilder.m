@implementation CIDCInternalPayloadBuilder

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)initWithDelegate:(id)a3 payloadBuilder:(id)a4
{
  id v5;
  _TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *v6;

  swift_unknownObjectRetain();
  v5 = a4;
  v6 = (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *)sub_219C078A4();
  swift_unknownObjectRelease();

  return v6;
}

- (void)buildPayloadWithDetails:(CIDCPayloadBuilderDetails *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CIDCPayloadBuilderDetails *v15;
  _TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF9C8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_219C0817C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2550AF9D8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2550AF9E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_219C06964((uint64_t)v9, (uint64_t)&unk_2550AF9F8, (uint64_t)v14);
  swift_release();
}

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)init
{
  _TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *result;

  result = (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder));
}

@end

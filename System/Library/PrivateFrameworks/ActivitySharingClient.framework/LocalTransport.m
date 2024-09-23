@implementation LocalTransport

- (_TtC21ActivitySharingClient14LocalTransport)init
{
  uint64_t v3;
  objc_class *v4;
  _TtC21ActivitySharingClient14LocalTransport *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC21ActivitySharingClient14LocalTransport_transportDispatchService;
  type metadata accessor for TransportDispatchService();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *((_QWORD *)v4 + 14) = MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.isa + v3) = v4;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC21ActivitySharingClient14LocalTransport_proxy) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for LocalTransport();
  return -[LocalTransport init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

- (void)transportMessage:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC21ActivitySharingClient14LocalTransport *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C650;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C658;
  v14[5] = v13;
  v15 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C660, (uint64_t)v14);
  swift_release();
}

- (void)transportMessage:(int64_t)a3 data:(NSData *)a4 completionHandler:(id)a5
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
  _TtC21ActivitySharingClient14LocalTransport *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C630;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C638;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C640, (uint64_t)v16);
  swift_release();
}

- (void)transportRequest:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC21ActivitySharingClient14LocalTransport *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C610;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C618;
  v14[5] = v13;
  v15 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C620, (uint64_t)v14);
  swift_release();
}

- (void)transportRequest:(int64_t)a3 data:(NSData *)a4 completionHandler:(id)a5
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
  _TtC21ActivitySharingClient14LocalTransport *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C600;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C1C0;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C1C8, (uint64_t)v16);
  swift_release();
}

@end

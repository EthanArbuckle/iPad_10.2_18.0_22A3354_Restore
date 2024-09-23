@implementation XPCClientProxy

- (_TtC11HomeKitCore14XPCClientProxy)init
{
  _TtC11HomeKitCore14XPCClientProxy *result;

  result = (_TtC11HomeKitCore14XPCClientProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

- (void)fetchModelsWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC11HomeKitCore14XPCClientProxy *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559C1B50);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HomeKitCore14XPCClientProxy_homesStore);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_22884640C;
  *(_QWORD *)(v13 + 24) = v11;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = v12;
  v15 = sub_2288670D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2559C4EA0;
  v16[5] = v14;
  v16[6] = sub_228846558;
  v16[7] = v13;
  v17 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_228834EAC((uint64_t)v9, (uint64_t)&unk_2559C4EB0, (uint64_t)v16);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchModelsWithTypes:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _TtC11HomeKitCore14XPCClientProxy *v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559C1B50);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_228866FCC();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HomeKitCore14XPCClientProxy_homesStore);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_228846294;
  *(_QWORD *)(v13 + 24) = v11;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  *(_QWORD *)(v14 + 24) = v12;
  v15 = sub_2288670D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2559C4E78;
  v16[5] = v14;
  v16[6] = sub_228846558;
  v16[7] = v13;
  v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_228834EAC((uint64_t)v8, (uint64_t)&unk_2559C4E88, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)registerObserver:(id)a3 modelTypes:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC11HomeKitCore14XPCClientProxy *v10;

  v7 = _Block_copy(a5);
  v8 = sub_228866FCC();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  swift_unknownObjectRetain();
  v10 = self;
  sub_228844920((uint64_t)a3, v8, (uint64_t)sub_228845AE0, v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end

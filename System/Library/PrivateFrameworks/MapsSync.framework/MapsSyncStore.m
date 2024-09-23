@implementation MapsSyncStore

+ (_TtC8MapsSync13MapsSyncStore)sharedStore
{
  if (qword_1ED1AB880 != -1)
    swift_once();
  return (_TtC8MapsSync13MapsSyncStore *)(id)qword_1ED1AB9F0;
}

- (_TtC8MapsSync19MapsSyncStoreConfig)config
{
  return (_TtC8MapsSync19MapsSyncStoreConfig *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config));
}

- (void)setConfig:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config) = (Class)a3;
  v3 = a3;

}

+ (id)withStoreWithConfig:(id)a3
{
  objc_class *v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  objc_super v13;

  v4 = (objc_class *)type metadata accessor for MapsSyncStore();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = OBJC_IVAR____TtC8MapsSync13MapsSyncStore_containerInstanceLock;
  v7 = objc_allocWithZone(MEMORY[0x1E0CB3740]);
  v8 = a3;
  v9 = v5;
  *(_QWORD *)&v5[v6] = objc_msgSend(v7, sel_init);
  *(_QWORD *)&v9[OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config] = v8;
  v10 = v8;

  v13.receiver = v9;
  v13.super_class = v4;
  v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

+ (void)withDefaultStoreWithBlock:(void *)aBlock
{
  void (**v3)(void *, uint64_t, _QWORD);

  v3 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  if (qword_1ED1AB880 != -1)
    swift_once();
  v3[2](v3, qword_1ED1AB9F0, 0);
  _Block_release(v3);
}

- (_TtC8MapsSync13MapsSyncStore)initWithConfig:(id)a3
{
  uint64_t v5;
  id v6;
  objc_class *v7;
  _TtC8MapsSync13MapsSyncStore *v8;
  objc_class *v9;
  _TtC8MapsSync13MapsSyncStore *v10;
  objc_super v12;

  v5 = OBJC_IVAR____TtC8MapsSync13MapsSyncStore_containerInstanceLock;
  v6 = objc_allocWithZone(MEMORY[0x1E0CB3740]);
  v7 = (objc_class *)a3;
  v8 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncStore_config) = v7;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for MapsSyncStore();
  v10 = -[MapsSyncStore init](&v12, sel_init);

  return v10;
}

- (void)resetContainer
{
  uint64_t v2;
  _TtC8MapsSync13MapsSyncStore *v3;
  void *v4;

  v2 = qword_1ED1ABCB8;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (void *)sub_1A415AD64(MEMORY[0x1E0DEE9D8]);
  swift_beginAccess();
  off_1ED1ABCB0 = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)saveWithObjects:(id)a3 error:(id *)a4
{
  return sub_1A4155814(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1A4154D78);
}

- (BOOL)deleteWithObjects:(id)a3 error:(id *)a4
{
  return sub_1A4155814(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1A4155304);
}

- (void)saveWithObjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC8MapsSync13MapsSyncStore *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE70F1A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE70F1B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A423B080((uint64_t)v9, (uint64_t)&unk_1EE70F1B8, (uint64_t)v14);
  swift_release();
}

- (void)deleteWithObjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC8MapsSync13MapsSyncStore *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A423C29C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE70F198;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE70E650;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A423B080((uint64_t)v9, (uint64_t)&unk_1EE70E4C8, (uint64_t)v14);
  swift_release();
}

- (void)withManagedObjects:(id)a3 block:(id)a4
{
  void *v5;
  unint64_t v6;
  _TtC8MapsSync13MapsSyncStore *v7;

  v5 = _Block_copy(a4);
  type metadata accessor for MapsSyncObject();
  v6 = sub_1A423C1C4();
  _Block_copy(v5);
  v7 = self;
  sub_1A415BA84(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)subscribe:(id)a3
{
  _TtC8MapsSync13MapsSyncStore *v5;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1A415A76C((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)unsubscribe:(id)a3
{
  _TtC8MapsSync13MapsSyncStore *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A4154774();
  sub_1A412D680((uint64_t)a3);
  swift_release();
  sub_1A4154780();
  sub_1A412D680((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC8MapsSync13MapsSyncStore)init
{
  _TtC8MapsSync13MapsSyncStore *result;

  result = (_TtC8MapsSync13MapsSyncStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

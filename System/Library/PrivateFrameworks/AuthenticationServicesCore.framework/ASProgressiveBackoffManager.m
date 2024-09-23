@implementation ASProgressiveBackoffManager

- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)initWithNumberOfOperationsBeforeTriggeringBackoff:(int64_t)a3 minimumCooldownDurationSeconds:(double)a4
{
  objc_class *v6;
  uint64_t v7;
  _TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *v8;
  objc_super v10;

  v6 = (objc_class *)type metadata accessor for ASProgressiveBackoffManager();
  v7 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain();
  *(_QWORD *)(v7 + 128) = sub_20E6A5FA4(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v7 + 112) = a3;
  *(double *)(v7 + 120) = a4;
  swift_release();
  v10.receiver = (id)v7;
  v10.super_class = v6;
  v8 = -[ASProgressiveBackoffManager init](&v10, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)performAfterBackoffForContext:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A2F878;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_254A2EFD0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_20E6E2380((uint64_t)v9, (uint64_t)&unk_254A2E918, (uint64_t)v14);
  swift_release();
}

- (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager)init
{
  _TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *result;

  swift_defaultActor_initialize();
  result = (_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

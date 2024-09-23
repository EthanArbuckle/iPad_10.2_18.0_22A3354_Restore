@implementation AppUserEmbeddingManager

- (_TtC19NewsPersonalization23AppUserEmbeddingManager)init
{
  _TtC19NewsPersonalization23AppUserEmbeddingManager *result;

  result = (_TtC19NewsPersonalization23AppUserEmbeddingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization23AppUserEmbeddingManager_sessionDataProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization23AppUserEmbeddingManager_userEmbeddingConfigurationService);
}

- (void)generateUserEmbeddingIfNeededWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC19NewsPersonalization23AppUserEmbeddingManager *v12;
  uint64_t v13;

  sub_1D5B4C624(0, (unint64_t *)&qword_1ED9C0100, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - v6;
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_1D5D1F034();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1D5CF8F94;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1D5BA02BC((uint64_t)v7, (uint64_t)&unk_1EFF9CD18, (uint64_t)v11);

  swift_release();
  swift_release();
}

@end

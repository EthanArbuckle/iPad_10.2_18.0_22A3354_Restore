@implementation TranslationSessionViewModel

- (_TtC20_Translation_SwiftUI27TranslationSessionViewModel)init
{
  _TtC20_Translation_SwiftUI27TranslationSessionViewModel *result;

  result = (_TtC20_Translation_SwiftUI27TranslationSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightConfiguration));
  sub_23570D478(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel__preflightCompletion));
  v3 = (char *)self + OBJC_IVAR____TtC20_Translation_SwiftUI27TranslationSessionViewModel___observationRegistrar;
  v4 = sub_2357146B8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)needsUserInterventionForTextSession:(id)a3 configuration:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC20_Translation_SwiftUI27TranslationSessionViewModel *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_23570F5A8(v11, (uint64_t)sub_23570F5A0, v9);

  swift_release();
}

@end

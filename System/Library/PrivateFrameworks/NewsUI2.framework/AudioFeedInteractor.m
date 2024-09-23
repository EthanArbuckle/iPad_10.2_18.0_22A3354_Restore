@implementation AudioFeedInteractor

- (_TtC7NewsUI219AudioFeedInteractor)init
{
  _TtC7NewsUI219AudioFeedInteractor *result;

  result = (_TtC7NewsUI219AudioFeedInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_delegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_modifierFactory);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  char *v10;

  result = MEMORY[0x1D82919D4](&a1[OBJC_IVAR____TtC7NewsUI219AudioFeedInteractor_delegate]);
  if (result)
  {
    v6 = result;
    v7 = MEMORY[0x1D82919D4](result + 16);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = a3;
      v10 = a1;
      sub_1D68F3D0C(v6, v8);

      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

@end

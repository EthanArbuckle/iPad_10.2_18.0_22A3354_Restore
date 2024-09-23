@implementation MagazineSectionsInteractor

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  uint64_t result;
  uint64_t v6;
  id v7;
  char *v8;

  result = MEMORY[0x1D82919D4](&a1[OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_delegate]);
  if (result)
  {
    v6 = result;
    v7 = a3;
    v8 = a1;
    sub_1D6888544(v6);

    return swift_unknownObjectRelease();
  }
  return result;
}

- (_TtC7NewsUI226MagazineSectionsInteractor)init
{
  _TtC7NewsUI226MagazineSectionsInteractor *result;

  result = (_TtC7NewsUI226MagazineSectionsInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineSectionsInteractor_magazinesBadgingCoordinator);

}

@end

@implementation FAFamilyImageLoader

+ (_TtC14FamilyCircleUI19FAFamilyImageLoader)shared
{
  if (qword_2549F5FE8 != -1)
    swift_once();
  return (_TtC14FamilyCircleUI19FAFamilyImageLoader *)off_2549FDB50;
}

- (NSDictionary)_authResults
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20E07D4FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)set_authResults:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_20E07D514();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader__authResults);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDictionary)authResults
{
  _TtC14FamilyCircleUI19FAFamilyImageLoader *v3;
  void *v4;

  swift_getKeyPath();
  sub_20DF7F470();
  v3 = self;
  sub_20E07BD20();
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  v4 = (void *)sub_20E07D4FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v4;
}

- (void)setAuthResults:(id)a3
{
  _TtC14FamilyCircleUI19FAFamilyImageLoader *v4;

  sub_20E07D514();
  swift_getKeyPath();
  sub_20DF7F470();
  v4 = self;
  sub_20E07BD14();
  swift_bridgeObjectRelease();
  swift_release();

}

- (_TtC14FamilyCircleUI19FAFamilyImageLoader)init
{
  _TtC14FamilyCircleUI19FAFamilyImageLoader *result;

  result = (_TtC14FamilyCircleUI19FAFamilyImageLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader__imageProvider);
  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI19FAFamilyImageLoader___observationRegistrar;
  v4 = sub_20E07BD50();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

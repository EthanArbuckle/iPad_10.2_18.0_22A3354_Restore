@implementation StateCaptureItem

- (void)dealloc
{
  _TtC10ChronoCore16StateCaptureItem *v3;
  _TtC10ChronoCore16StateCaptureItem *v4;
  objc_super v5;
  _QWORD v6[3];
  uint64_t v7;

  sub_1D28D291C((uint64_t)self + OBJC_IVAR____TtC10ChronoCore16StateCaptureItem_invalidatable, (uint64_t)v6);
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(v6, v7);
    v3 = self;
    sub_1D28D0388();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    v4 = self;
    sub_1D28D2964((uint64_t)v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StateCaptureItem();
  -[StateCaptureItem dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D28D2964((uint64_t)self + OBJC_IVAR____TtC10ChronoCore16StateCaptureItem_invalidatable);
}

- (_TtC10ChronoCore16StateCaptureItem)init
{
  _TtC10ChronoCore16StateCaptureItem *result;

  result = (_TtC10ChronoCore16StateCaptureItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

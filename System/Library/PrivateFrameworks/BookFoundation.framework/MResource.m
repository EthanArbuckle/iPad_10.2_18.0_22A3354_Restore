@implementation MResource

- (NSString)id
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21C458E40();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC14BookFoundation9MResource)init
{
  _TtC14BookFoundation9MResource *result;

  result = (_TtC14BookFoundation9MResource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C403328(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14BookFoundation9MResource____lazy_storage___relationships));
  sub_21C403328(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14BookFoundation9MResource____lazy_storage___views));
}

@end

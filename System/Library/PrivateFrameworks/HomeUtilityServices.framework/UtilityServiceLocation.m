@implementation UtilityServiceLocation

- (_TtC19HomeUtilityServices22UtilityServiceLocation)initWithServiceLocationID:(id)a3 address:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v6 = sub_23EC2E780();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices22UtilityServiceLocation_serviceLocationID);
  *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices22UtilityServiceLocation_address) = (Class)a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UtilityServiceLocation();
  v9 = a4;
  return -[UtilityServiceLocation init](&v11, sel_init);
}

- (_TtC19HomeUtilityServices22UtilityServiceLocation)init
{
  _TtC19HomeUtilityServices22UtilityServiceLocation *result;

  result = (_TtC19HomeUtilityServices22UtilityServiceLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end

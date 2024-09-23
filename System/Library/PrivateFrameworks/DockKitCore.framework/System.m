@implementation System

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)components
{
  void *v2;

  type metadata accessor for Component();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A690DB0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setComponents:(id)a3
{
  type metadata accessor for Component();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)sub_23A690DBC();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC11DockKitCore6System *v2;
  void *v3;

  v2 = self;
  sub_23A62E8FC();

  v3 = (void *)sub_23A690E04();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11DockKitCore6System)initWithId:(int64_t)a3 type:(int64_t)a4 name:(id)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  objc_super v12;

  v8 = sub_23A690E1C();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_components) = (Class)MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_id) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore6System_type) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore6System_name);
  *v9 = v8;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for System();
  return -[System init](&v12, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC11DockKitCore6System *v4;
  _TtC11DockKitCore6System *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A6911F4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_23A62EC18((uint64_t)v8);

  sub_23A62F610((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC11DockKitCore6System *v3;
  int64_t v4;

  sub_23A691608();
  sub_23A6915CC();
  sub_23A6915CC();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_23A690E7C();
  swift_bridgeObjectRelease();
  v4 = sub_23A6915F0();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore6System *v5;

  v4 = a3;
  v5 = self;
  sub_23A62E48C(v4);

}

- (_TtC11DockKitCore6System)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore6System *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore6System *)sub_23A62F264();

  return v4;
}

- (_TtC11DockKitCore6System)init
{
  _TtC11DockKitCore6System *result;

  result = (_TtC11DockKitCore6System *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

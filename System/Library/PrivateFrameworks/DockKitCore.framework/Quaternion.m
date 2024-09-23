@implementation Quaternion

- (_TtC11DockKitCore10Quaternion)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_x) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_y) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_z) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_w) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Quaternion();
  return -[Quaternion init](&v3, sel_init);
}

- (_TtC11DockKitCore10Quaternion)initWithX:(double)a3 y:(double)a4 z:(double)a5 w:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v6 = OBJC_IVAR____TtC11DockKitCore10Quaternion_y;
  v7 = OBJC_IVAR____TtC11DockKitCore10Quaternion_z;
  v8 = OBJC_IVAR____TtC11DockKitCore10Quaternion_w;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore10Quaternion_x) = a3;
  *(double *)((char *)&self->super.isa + v6) = a4;
  *(double *)((char *)&self->super.isa + v7) = a5;
  *(double *)((char *)&self->super.isa + v8) = a6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Quaternion();
  return -[Quaternion init](&v10, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A68D8C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_23A68D5A8);
}

- (int64_t)hash
{
  return sub_23A68D6AC();
}

@end

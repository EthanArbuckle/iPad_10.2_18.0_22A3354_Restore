@implementation Vector3

- (_TtC11DockKitCore7Vector3)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore7Vector3_x) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore7Vector3_y) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore7Vector3_z) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Vector3();
  return -[Vector3 init](&v3, sel_init);
}

- (_TtC11DockKitCore7Vector3)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v5 = OBJC_IVAR____TtC11DockKitCore7Vector3_y;
  v6 = OBJC_IVAR____TtC11DockKitCore7Vector3_z;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore7Vector3_x) = a3;
  *(double *)((char *)&self->super.isa + v5) = a4;
  *(double *)((char *)&self->super.isa + v6) = a5;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Vector3();
  return -[Vector3 init](&v8, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A68D8C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_23A68AF2C);
}

- (int64_t)hash
{
  return sub_23A68B018();
}

@end

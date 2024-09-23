@implementation Pose

- (BOOL)isEqual:(id)a3
{
  return sub_23A68D8C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_23A68D77C);
}

- (int64_t)hash
{
  void *v3;
  _TtC11DockKitCore4Pose *v4;
  id v5;
  id v6;
  int64_t v7;

  sub_23A691608();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore4Pose_position);
  v4 = self;
  v5 = v3;
  sub_23A691188();

  v6 = *(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC11DockKitCore4Pose_rotation);
  sub_23A691188();

  v7 = sub_23A6915F0();
  return v7;
}

- (_TtC11DockKitCore4Pose)init
{
  uint64_t v3;
  id v4;
  _TtC11DockKitCore4Pose *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC11DockKitCore4Pose_position;
  v4 = objc_allocWithZone((Class)type metadata accessor for Vector3());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC11DockKitCore4Pose_rotation;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Orientation()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for Pose();
  return -[Pose init](&v8, sel_init);
}

- (void).cxx_destruct
{

}

@end

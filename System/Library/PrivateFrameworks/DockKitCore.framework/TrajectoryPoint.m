@implementation TrajectoryPoint

- (_TtC11DockKitCore15TrajectoryPoint)init
{
  objc_class *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_time) = 0;
  v2 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_positions) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_velocities) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrajectoryPoint();
  return -[TrajectoryPoint init](&v4, sel_init);
}

- (_TtC11DockKitCore15TrajectoryPoint)initWithTime:(double)a3 positions:(id)a4 velocities:(id)a5
{
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v7 = (objc_class *)sub_23A690F18();
  v8 = (objc_class *)sub_23A690F18();
  v9 = OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_positions;
  v10 = OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_velocities;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15TrajectoryPoint_time) = a3;
  *(Class *)((char *)&self->super.isa + v9) = v7;
  *(Class *)((char *)&self->super.isa + v10) = v8;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TrajectoryPoint();
  return -[TrajectoryPoint init](&v12, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_23A5C01B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))sub_23A5C0108);
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))sub_23A5C0278);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

@implementation RoomScanKeyframe

- (id)copyWithZone:(void *)a3
{
  _TtC8RoomPlan16RoomScanKeyframe *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2264EC6B8(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_22655D550();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_2264ED0D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_identifier);
}

- (void)setIdentifier:(id)a3
{
  sub_2264ED1C8(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_identifier);
}

- (double)cameraPose
{
  double result;

  *(_QWORD *)&result = sub_2264ED2D0(a1, a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_cameraPose).n128_u64[0];
  return result;
}

- (uint64_t)setCameraPose:(__n128)a3
{
  return sub_2264ED2F0(a1, a3, a4, a5, a6, a2, &OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_cameraPose);
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_count);
}

- (void)setCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_count) = (Class)a3;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_points);
}

- (void)setPoints:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_points) = v2;
}

- (uint64_t)pointsToWorld
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_pointsToWorld);
}

- (void)setPointsToWorld:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_pointsToWorld) = v2;
}

- (uint64_t)semanticLabels
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticLabels);
}

- (void)setSemanticLabels:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticLabels) = v2;
}

- (uint64_t)semanticVotes
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticVotes);
}

- (void)setSemanticVotes:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_semanticVotes) = v2;
}

- (uint64_t)colors
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_colors);
}

- (void)setColors:(_TtC8RoomPlan16RoomScanKeyframe *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_colors) = v2;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_timestamp);
}

- (void)setTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_timestamp) = a3;
}

- (_TtC8RoomPlan16RoomScanKeyframe)init
{
  _TtC8RoomPlan16RoomScanKeyframe *result;

  result = (_TtC8RoomPlan16RoomScanKeyframe *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22643D7E4((uint64_t)self + OBJC_IVAR____TtC8RoomPlan16RoomScanKeyframe_identifier, (uint64_t *)&unk_255849AC0);

}

@end

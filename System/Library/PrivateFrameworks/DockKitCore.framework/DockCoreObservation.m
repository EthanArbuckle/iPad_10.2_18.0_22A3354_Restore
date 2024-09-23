@implementation DockCoreObservation

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_type);
}

- (int64_t)identifier
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_identifier);
}

- (double)X
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_X);
}

- (double)Y
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_Y);
}

- (double)width
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_width);
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_height);
}

- (int64_t)trackerID
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_trackerID);
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_confidence);
}

- (BOOL)newTrack
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore19DockCoreObservation_newTrack);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore19DockCoreObservation *v5;

  v4 = a3;
  v5 = self;
  sub_23A6849B8(v4);

}

- (_TtC11DockKitCore19DockCoreObservation)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore19DockCoreObservation *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore19DockCoreObservation *)sub_23A6885F0(v3);

  return v4;
}

- (_TtC11DockKitCore19DockCoreObservation)init
{
  _TtC11DockKitCore19DockCoreObservation *result;

  result = (_TtC11DockKitCore19DockCoreObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation BlastDoorWorkoutPreview

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)activityType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorWorkoutPreview_workoutPreview);
}

- (BOOL)isIndoor
{
  return self->workoutPreview[OBJC_IVAR___BlastDoorWorkoutPreview_workoutPreview];
}

- (int64_t)configurationType
{
  return sub_1AD4CE6F0();
}

- (NSString)configurationName
{
  return (NSString *)sub_1AD4CFC08();
}

- (unint64_t)goalTypeIdentifier
{
  return sub_1AD4CE764();
}

- (BlastDoorWorkoutPreview)init
{
  BlastDoorWorkoutPreview *result;

  result = (BlastDoorWorkoutPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

@implementation BlastDoorLocationCoordinate2D

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)latitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorLocationCoordinate2D_locationCoordinate2D);
}

- (double)longitude
{
  return *(double *)&self->locationCoordinate2D[OBJC_IVAR___BlastDoorLocationCoordinate2D_locationCoordinate2D];
}

- (BlastDoorLocationCoordinate2D)init
{
  BlastDoorLocationCoordinate2D *result;

  result = (BlastDoorLocationCoordinate2D *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

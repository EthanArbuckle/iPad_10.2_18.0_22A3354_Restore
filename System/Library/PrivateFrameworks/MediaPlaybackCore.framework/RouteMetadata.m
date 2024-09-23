@implementation RouteMetadata

- (BOOL)isAirplay
{
  return self->isAirplay[0];
}

- (NSString)routeDescription
{
  void *v2;

  if (*(_QWORD *)&self->routeDescription[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_210E92B84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

@end

@implementation NHOAccessoryIntent

- (NSString)homeID
{
  return (NSString *)sub_24295776C(self);
}

- (void)setHomeID:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)homeName
{
  return (NSString *)sub_24295776C(self);
}

- (void)setHomeName:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)accessoryID
{
  return (NSString *)sub_24295776C(self);
}

- (void)setAccessoryID:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)accessoryName
{
  return (NSString *)sub_24295776C(self);
}

- (void)setAccessoryName:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)icon
{
  return (NSString *)sub_24295776C(self);
}

- (void)setIcon:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)serviceType
{
  return (NSString *)sub_24295776C(self);
}

- (void)setServiceType:(id)a3
{
  sub_2429577EC(self);
}

- (BOOL)useHomeKitRecommendations
{
  NHOAccessoryIntent *v2;
  BOOL v4;

  v2 = self;
  swift_retain();
  sub_242963764();

  swift_release();
  return v4;
}

- (void)setUseHomeKitRecommendations:(BOOL)a3
{
  NHOAccessoryIntent *v3;

  v3 = self;
  swift_retain();
  sub_242963770();

  swift_release();
}

- (NSString)accessoriesAndScenes
{
  return (NSString *)sub_24295776C(self);
}

- (void)setAccessoriesAndScenes:(id)a3
{
  sub_2429577EC(self);
}

- (NHOAccessoryIntent)init
{
  return (NHOAccessoryIntent *)NHOAccessoryIntent.init()();
}

- (NSString)description
{
  NHOAccessoryIntent *v2;
  void *v3;

  v2 = self;
  NHOAccessoryIntent.description.getter();

  v3 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end

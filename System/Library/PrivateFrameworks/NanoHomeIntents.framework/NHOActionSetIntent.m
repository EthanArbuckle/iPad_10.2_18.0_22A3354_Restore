@implementation NHOActionSetIntent

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

- (NSString)actionSetID
{
  return (NSString *)sub_24295776C(self);
}

- (void)setActionSetID:(id)a3
{
  sub_2429577EC(self);
}

- (NSString)actionSetName
{
  return (NSString *)sub_24295776C(self);
}

- (void)setActionSetName:(id)a3
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

- (BOOL)useHomeKitRecommendations
{
  NHOActionSetIntent *v2;
  BOOL v4;

  v2 = self;
  swift_retain();
  sub_242963764();

  swift_release();
  return v4;
}

- (void)setUseHomeKitRecommendations:(BOOL)a3
{
  NHOActionSetIntent *v3;

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

- (NHOActionSetIntent)init
{
  return (NHOActionSetIntent *)NHOActionSetIntent.init()();
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

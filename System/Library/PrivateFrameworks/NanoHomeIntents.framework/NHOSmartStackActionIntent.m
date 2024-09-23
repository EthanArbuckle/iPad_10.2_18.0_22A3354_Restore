@implementation NHOSmartStackActionIntent

- (NSString)homeID
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setHomeID:(id)a3
{
  sub_242949290(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSString)homeName
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setHomeName:(id)a3
{
  sub_242949290(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSString)actionID
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setActionID:(id)a3
{
  sub_242949290(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSString)actionName
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setActionName:(id)a3
{
  sub_242949290(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSString)icon
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setIcon:(id)a3
{
  sub_242949290(self, (uint64_t)a2, (uint64_t)a3);
}

- (BOOL)useHomeKitRecommendations
{
  NHOSmartStackActionIntent *v2;
  BOOL v4;

  v2 = self;
  swift_retain();
  sub_242963764();

  swift_release();
  return v4;
}

- (void)setUseHomeKitRecommendations:(BOOL)a3
{
  NHOSmartStackActionIntent *v3;

  v3 = self;
  swift_retain();
  sub_242963770();

  swift_release();
}

- (NSString)accessoriesAndScenes
{
  NHOSmartStackActionIntent *v2;
  void *v3;

  v2 = self;
  swift_retain();
  sub_242963764();

  swift_release();
  v3 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAccessoriesAndScenes:(id)a3
{
  NHOSmartStackActionIntent *v4;

  sub_242963A88();
  v4 = self;
  swift_retain();
  sub_242963770();

  swift_release();
}

- (NHOSmartStackActionIntent)init
{
  return (NHOSmartStackActionIntent *)NHOSmartStackActionIntent.init()();
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

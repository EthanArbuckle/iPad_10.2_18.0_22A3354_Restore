@implementation NHOElectricityUsageIntent

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

- (NHOElectricityUsageIntent)init
{
  return (NHOElectricityUsageIntent *)ElectricityUsageIntent.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end

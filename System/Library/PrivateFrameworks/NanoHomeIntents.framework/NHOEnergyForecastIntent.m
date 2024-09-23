@implementation NHOEnergyForecastIntent

- (NSString)homeIdentifier
{
  return (NSString *)sub_2429491BC(self);
}

- (void)setHomeIdentifier:(id)a3
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

- (NHOEnergyForecastIntent)init
{
  return (NHOEnergyForecastIntent *)EnergyForecastIntent.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end

@implementation MURealTimeEVChargerUtility

+ (id)evPlugIconWithConfiguration:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s6MapsUI24RealTimeEVChargerUtilityC10evPlugIcon13configurationSo7UIImageCSgSo0K13ConfigurationC_tFZ_0(v3);

  return v4;
}

+ (id)getRealTimeChargerInfoWithGarage:(id)a3 charger:(id)a4
{
  id v6;
  char **v7;
  void *v8;

  v6 = a3;
  v7 = (char **)a4;
  v8 = (void *)_s6MapsUI24RealTimeEVChargerUtilityC03getcD11ChargerInfo6garage7chargerSo06MURealdE0CSo15VGVirtualGarageCSg_So24GEOEVChargerAvailabilityCtFZ_0(a3, v7);

  return v8;
}

- (MURealTimeEVChargerUtility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MURealTimeEVChargerUtility init](&v3, sel_init);
}

@end

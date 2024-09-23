@implementation WFGetWeatherForecastAction

- (WFGetWeatherForecastAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = (void *)sub_22D6665A8();
  v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D80020);
    a5 = (id)sub_22D6664B8();
  }
  v10 = a4;
  return (WFGetWeatherForecastAction *)GetWeatherForecastAction.init(identifier:definition:serializedParameters:)(v7, v9, a4, (uint64_t)a5);
}

- (WFGetWeatherForecastAction)init
{
  return (WFGetWeatherForecastAction *)GetWeatherForecastAction.init()();
}

- (void).cxx_destruct
{
  sub_22D36803C((uint64_t)self + OBJC_IVAR___WFGetWeatherForecastAction____lazy_storage___provider, &qword_255D80138);
}

@end

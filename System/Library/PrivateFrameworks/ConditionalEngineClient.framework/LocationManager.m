@implementation LocationManager

- (_TtC23ConditionalEngineClient15LocationManager)init
{
  _TtC23ConditionalEngineClient15LocationManager *result;

  LocationManager.init()();
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC23ConditionalEngineClient15LocationManager *v8;

  sub_238455238(0, (unint64_t *)&unk_25690A9B0);
  v6 = sub_23849276C();
  v7 = a3;
  v8 = self;
  sub_238491508(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC23ConditionalEngineClient15LocationManager *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_238491780(v8);

}

- (void).cxx_destruct
{

  sub_238491C10((uint64_t)self + OBJC_IVAR____TtC23ConditionalEngineClient15LocationManager_locationContinuation);
}

@end

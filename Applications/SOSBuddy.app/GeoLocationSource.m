@implementation GeoLocationSource

- (_TtC8SOSBuddy17GeoLocationSource)init
{
  return (_TtC8SOSBuddy17GeoLocationSource *)sub_1000A3768();
}

- (void)dealloc
{
  _TtC8SOSBuddy17GeoLocationSource *v2;

  v2 = self;
  sub_1000A3D74();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy17GeoLocationSource_locationAuthorizationChanged));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17GeoLocationSource_locationReceived));

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8SOSBuddy17GeoLocationSource *v10;

  v7 = sub_10006477C(0, &qword_10031D148, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1000A51FC(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC8SOSBuddy17GeoLocationSource *v5;

  v4 = a3;
  v5 = self;
  sub_1000A4C3C(v4);

}

@end

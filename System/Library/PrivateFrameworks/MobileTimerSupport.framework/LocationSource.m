@implementation LocationSource

- (NSString)description
{
  _TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *v2;
  void *v3;

  v2 = self;
  sub_1B8DCFF04();

  v3 = (void *)sub_1B8DFDB5C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource)init
{
  _TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *result;

  result = (_TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_distanceFilter;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF1E2B60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B8DD3F6C();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_inUseAssertion));
  sub_1B8DD4868(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource____lazy_storage___locationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_locationQueue));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *v8;

  sub_1B8D9E394(0, &qword_1EF1E2F38);
  v6 = sub_1B8DFDC64();
  v7 = a3;
  v8 = self;
  sub_1B8DD0750(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1B8DD2670((uint64_t)v8);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *v5;

  v4 = a3;
  v5 = self;
  sub_1B8DD286C();

}

@end

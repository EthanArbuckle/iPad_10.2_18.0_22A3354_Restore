@implementation LocationSource

- (NSString)description
{
  _TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *v2;
  void *v3;

  v2 = self;
  sub_237ED42BC();

  v3 = (void *)sub_237EE2A54();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource)init
{
  _TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *result;

  result = (_TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *)_swift_stdlib_reportUnimplementedInitializer();
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
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_distanceFilter;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_237E7E5F0();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion));
  sub_237ED864C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  NSObject *v7;
  _TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *v8;

  sub_237E74A2C(0, &qword_25689DA18);
  v6 = sub_237EE2BD4();
  v7 = a3;
  v8 = self;
  sub_237ED4E58(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_237ED7E44(v8);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource *v5;

  v4 = a3;
  v5 = self;
  sub_237ED82D0();

}

@end

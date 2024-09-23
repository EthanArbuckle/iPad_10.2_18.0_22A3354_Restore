@implementation ScheduledQueryETARunner

- (_TtC23ConditionalEngineClient23ScheduledQueryETARunner)init
{
  uint64_t v3;
  _TtC23ConditionalEngineClient23ScheduledQueryETARunner *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC23ConditionalEngineClient23ScheduledQueryETARunner_dispatchGroup;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)dispatch_group_create();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC23ConditionalEngineClient23ScheduledQueryETARunner_currentLocation) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ScheduledQueryETARunner();
  return -[ScheduledQueryETARunner init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ConditionalEngineClient23ScheduledQueryETARunner_dispatchGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ConditionalEngineClient23ScheduledQueryETARunner_currentLocation));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v6;
  objc_class *v7;
  _TtC23ConditionalEngineClient23ScheduledQueryETARunner *v8;
  CLLocationManager v9;
  Swift::OpaquePointer v10;

  sub_238455238(0, (unint64_t *)&unk_25690A9B0);
  v6 = (void *)sub_23849276C();
  v7 = (objc_class *)a3;
  v8 = self;
  v9.super.isa = v7;
  v9._internal = v6;
  ScheduledQueryETARunner.locationManager(_:didUpdateLocations:)(v9, v10);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC23ConditionalEngineClient23ScheduledQueryETARunner *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2384549D0();

}

@end

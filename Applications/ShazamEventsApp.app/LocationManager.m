@implementation LocationManager

- (_TtC15ShazamEventsApp15LocationManager)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC15ShazamEventsApp15LocationManager *v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = OBJC_IVAR____TtC15ShazamEventsApp15LocationManager_manager;
  v5 = objc_allocWithZone((Class)CLLocationManager);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, "init");
  v7 = (char *)v6 + OBJC_IVAR____TtC15ShazamEventsApp15LocationManager_checkedThrowingContinuation;
  v8 = sub_100007D50(&qword_10015A140);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return -[LocationManager init](&v10, "init");
}

- (void).cxx_destruct
{

  sub_1000412F4((uint64_t)self + OBJC_IVAR____TtC15ShazamEventsApp15LocationManager_checkedThrowingContinuation);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  id v9;
  _TtC15ShazamEventsApp15LocationManager *v10;

  v7 = sub_100041270();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100040FAC(v9, v8);

  swift_bridgeObjectRelease(v8);
}

@end

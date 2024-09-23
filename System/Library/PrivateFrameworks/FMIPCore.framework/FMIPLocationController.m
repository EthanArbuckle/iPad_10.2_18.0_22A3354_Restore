@implementation FMIPLocationController

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  _TtC8FMIPCore22FMIPLocationController *v7;

  v6 = a3;
  v7 = self;
  sub_1CC9D2FD0(a4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC8FMIPCore22FMIPLocationController *v8;

  sub_1CC9C30A8(0, (unint64_t *)&qword_1EF9E2898);
  v6 = sub_1CCB63B38();
  v7 = a3;
  v8 = self;
  sub_1CC9FAD84(v6);

  swift_bridgeObjectRelease();
}

- (_TtC8FMIPCore22FMIPLocationController)init
{
  return (_TtC8FMIPCore22FMIPLocationController *)sub_1CC9DAA68();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC8FMIPCore22FMIPLocationController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1CCB121A4(v8);

}

- (void).cxx_destruct
{

  swift_release();
  sub_1CCA2F610((uint64_t)self + OBJC_IVAR____TtC8FMIPCore22FMIPLocationController_delegate);

}

@end

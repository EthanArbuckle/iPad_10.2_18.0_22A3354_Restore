@implementation FMFMyLocationController

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  _TtC7FMFCore23FMFMyLocationController *v7;

  v6 = a3;
  v7 = self;
  sub_21191881C(a4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC7FMFCore23FMFMyLocationController *v8;

  sub_211911824(0, &qword_254ACDE78);
  v6 = sub_211A47AA8();
  v7 = a3;
  v8 = self;
  sub_21192DF4C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC7FMFCore23FMFMyLocationController)init
{
  _TtC7FMFCore23FMFMyLocationController *result;

  result = (_TtC7FMFCore23FMFMyLocationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_211962AB8((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_delegate);

  sub_211921C54((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myLocation);
  sub_211921C54((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myUnshiftedLocation);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myLocationUpdatingQueue));
  sub_211931C34((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_interactionController);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC7FMFCore23FMFMyLocationController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_211A03068(v8);

}

@end

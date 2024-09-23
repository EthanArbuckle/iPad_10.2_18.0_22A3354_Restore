@implementation ODILocationHelper.LocationManagerDelegate

- (void)dealloc
{
  _TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *v2;

  v2 = self;
  sub_20A4CB8E8();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_logger);
  sub_20A4CDC1C((uint64_t)self + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_parent);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate__locationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_lock));
  swift_release();
  sub_20A44CE2C((uint64_t)self+ OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_locationFetchRequestedAt, &qword_253EB4990);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  _TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *v7;
  id v8;

  sub_20A459574(0, &qword_2545FAC50);
  v6 = sub_20A5B8AA4();
  v8 = a3;
  v7 = self;
  sub_20A4CD2E4(v6);
  swift_bridgeObjectRelease();

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_20A4CCA34((uint64_t)v6);

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  void *v6;
  _TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *v7;
  id v8;

  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_lock);
  v8 = a3;
  v7 = self;
  objc_msgSend(v6, sel_lock);
  if (MEMORY[0x20BD26E90]((char *)v7 + OBJC_IVAR____TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate_parent))
  {
    sub_20A4CB5C8(a4);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v6, sel_unlock);

}

- (_TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate)init
{
  _TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *result;

  result = (_TtCC17CoreODIEssentials17ODILocationHelper23LocationManagerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

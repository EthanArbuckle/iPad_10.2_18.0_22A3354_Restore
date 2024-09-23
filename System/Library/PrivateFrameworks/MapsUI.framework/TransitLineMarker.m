@implementation TransitLineMarker

- (_TtC6MapsUI17TransitLineMarker)init
{
  _TtC6MapsUI17TransitLineMarker *result;

  result = (_TtC6MapsUI17TransitLineMarker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (id)mapItemIdentifier
{
  _TtC6MapsUI17TransitLineMarker *v2;
  id v3;

  v2 = self;
  v3 = sub_191E25790();

  return v3;
}

- (id)labelText
{
  _TtC6MapsUI17TransitLineMarker *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_191E2592C();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_191EEAF9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)artwork
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI17TransitLineMarker_transitLine), sel_artwork);
}

@end

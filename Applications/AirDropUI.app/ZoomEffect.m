@implementation ZoomEffect

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)initWithCoder:(id)a3
{
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *result;

  result = (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/VisualEffectView.swift", 32, 2, 103, 0);
  __break(1u);
  return result;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *v11;
  char *v12;

  v8 = objc_allocWithZone((Class)type metadata accessor for ZoomEffectViewEntry());
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = (char *)objc_msgSend(v8, "init");
  *(_QWORD *)&v12[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount] = *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect_magnitude);
  objc_msgSend(v9, "addViewEffect:", v12);

}

- (BOOL)isEqual:(id)a3
{
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *v5;
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *v6;
  BOOL v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_10005F7CC((uint64_t)v9);

  sub_10005FB4C((uint64_t)v9);
  return v7;
}

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect)init
{
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *result;

  result = (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A10ZoomEffect *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.ZoomEffect", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

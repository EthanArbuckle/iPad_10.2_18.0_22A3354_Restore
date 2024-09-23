@implementation ZoomEffectViewEntry

- (BOOL)shouldAnimateProperty:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v3;
  if (v4 == 1836019578 && v3 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    v6 = 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(1836019578, 0xE400000000000000, v4, v3, 0);
    swift_bridgeObjectRelease(v5);
  }
  return v6 & 1;
}

- (void)applyRequestedEffectToView:(id)a3
{
  _TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  v5 = objc_msgSend(v8, "layer");
  v6 = objc_opt_self(CABackdropLayer);
  v7 = (void *)swift_dynamicCastObjCClass(v5, v6);
  if (v7)
    objc_msgSend(v7, "setZoom:", *(double *)&v4->_UIVisualEffectViewEntry_opaque[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount]);

}

- (void)applyIdentityEffectToView:(void *)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = a1;
  v5 = objc_msgSend(v8, "layer");
  v6 = objc_opt_self(CABackdropLayer);
  v7 = (void *)swift_dynamicCastObjCClass(v5, v6);
  if (v7)
    objc_msgSend(v7, "setZoom:", 0.0);

}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (_TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry)init
{
  objc_super v3;

  *(_QWORD *)&self->_UIVisualEffectViewEntry_opaque[OBJC_IVAR____TtC9AirDropUIP33_770A69880D158B2CCABA56C42FC2E35A19ZoomEffectViewEntry_zoomAmount] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ZoomEffectViewEntry();
  return -[ZoomEffectViewEntry init](&v3, "init");
}

@end

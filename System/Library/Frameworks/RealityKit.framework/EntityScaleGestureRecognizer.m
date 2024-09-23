@implementation EntityScaleGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10RealityKit28EntityScaleGestureRecognizer *v8;

  type metadata accessor for UITouch();
  lazy protocol witness table accessor for type related decl 'e' for ARErrorCode and conformance related decl 'e' for ARErrorCode((unint64_t *)&lazy protocol witness table cache variable for type UITouch and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for UITouch, MEMORY[0x1E0DEFCF8]);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a4;
  v8 = self;
  EntityScaleGestureRecognizer.touchesBegan(_:with:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC10RealityKit28EntityScaleGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = EntityScaleGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (_TtC10RealityKit28EntityScaleGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC10RealityKit28EntityScaleGestureRecognizer *)EntityScaleGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

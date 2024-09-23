@implementation UnclippedGradientLayer

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)init
{
  return (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer *)UnclippedGradientLayer.init()();
}

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer)initWithCoder:(id)a3
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)layoutSublayers
{
  _TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34122UnclippedGradientLayer *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = self;
  v3 = -[UnclippedGradientLayer sublayers](v2, sel_sublayers);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for CAPresentationModifier(0, (unint64_t *)&lazy cache variable for type metadata for CALayer);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if ((v5 & 0xC000000000000001) != 0)
    {
      v6 = (id)MEMORY[0x23B7C6D9C](0, v5);
      goto LABEL_5;
    }
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v6 = *(id *)(v5 + 32);
LABEL_5:
      v7 = v6;
      swift_bridgeObjectRelease();
      -[UnclippedGradientLayer bounds](v2, sel_bounds);
      objc_msgSend(v7, sel_setFrame_);

      return;
    }
    __break(1u);
  }
  __break(1u);
}

@end

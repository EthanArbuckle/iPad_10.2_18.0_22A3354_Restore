@implementation __EntityAccessibilityWrapper

- (_TtC10RealityKit28__EntityAccessibilityWrapper)rootEntityWrapper
{
  return (_TtC10RealityKit28__EntityAccessibilityWrapper *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper);
}

- (unint64_t)identifier
{
  unint64_t result;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v4;
  unint64_t v5;

  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = self;
    v5 = Entity.id.getter();

    swift_release();
    return v5;
  }
  return result;
}

- (CGRect)calculateScreenBoundingRectIn:(id)a3
{
  char *v5;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  if (swift_weakLoadStrong())
  {
    v5 = (char *)a3;
    v6 = self;
    Entity.__calculateScreenBoundingRect(in:)(v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    swift_release();
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)isEntityRoot
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E0CD45A8]);
}

- (BOOL)isEntityAccessible
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E0CD45B8]);
}

- (NSString)entityLabel
{
  return (NSString *)@objc __EntityAccessibilityWrapper.entityLabel.getter(self, (uint64_t)a2, __EntityAccessibilityWrapper.entityLabel.getter);
}

- (NSString)entityDescription
{
  void *Strong;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    v4 = self;
    v5 = Entity.__accessibilityDescription.getter();
    v7 = v6;

    swift_release();
    if (v7)
    {
      Strong = (void *)MEMORY[0x1DF090310](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      Strong = 0;
    }
  }
  return (NSString *)Strong;
}

- (NSString)entityValue
{
  return (NSString *)@objc __EntityAccessibilityWrapper.entityLabel.getter(self, (uint64_t)a2, __EntityAccessibilityWrapper.entityValue.getter);
}

- (BOOL)isEntityActive
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E0CD4618]);
}

- (unint64_t)entityAccessibilityTraits
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v7;
  unint64_t v8;
  uint64_t v10;

  v3 = type metadata accessor for AccessibilityComponent();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!swift_weakLoadStrong())
    return 0;
  v7 = self;
  Entity.accessibilityComponent.getter((uint64_t)v6);
  v8 = AccessibilityComponent.traitsRawValue.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_release();
  return v8;
}

- (NSArray)entityAccessibilityCustomRotors
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v7;
  unint64_t v8;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v9;
  Class isa;
  _BYTE v12[16];

  v3 = type metadata accessor for AccessibilityComponent();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (swift_weakLoadStrong())
  {
    v7 = self;
    Entity.accessibilityComponent.getter((uint64_t)v6);
    v8 = AccessibilityComponent.customRotors.getter();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    swift_release();
    v9 = v7;
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay17RealityFoundation22AccessibilityComponentV0D3KitE9RotorTypeOG_So021UIAccessibilityCustomI0Cs5NeverOTg504_s10d13Kit28__Entityf19WrapperC06entityD12l14RotorsSaySo015k2G5i23CGvgAF0A10Foundation0D9g7VAAE0J4J6OXEfU_AI02__pfQ0CTf1cn_nTf4ng_n(v8, v9);
    swift_bridgeObjectRelease();

  }
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomRotor);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSArray)entityAccessibilityCustomActions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t Strong;
  uint64_t v8;
  _TtC10RealityKit28__EntityAccessibilityWrapper *v9;
  uint64_t v10;
  Class isa;
  _BYTE v13[16];

  v3 = type metadata accessor for AccessibilityComponent();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    v9 = self;
    Entity.accessibilityComponent.getter((uint64_t)v6);
    v10 = AccessibilityComponent.customActions.getter();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    swift_retain();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation23LocalizedStringResourceVG_So27UIAccessibilityCustomActionCs5NeverOTg5056_s10RealityKit28__EntityAccessibilityWrapperC06entityD13i15ActionsSaySo015h2G6j20CGvgAF10Foundation23efG6VXEfU_0M3Kit0O0CTf1cn_nTf4ng_n(v10, v8);

    swift_bridgeObjectRelease();
    swift_release_n();
  }
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomAction);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSArray)entityAccessibilityCustomContent
{
  _TtC10RealityKit28__EntityAccessibilityWrapper *v2;
  Class isa;

  v2 = self;
  __EntityAccessibilityWrapper.entityAccessibilityCustomContent.getter();

  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for AXCustomContent);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)entitySupportsAccessibilityActivateAction
{
  _TtC10RealityKit28__EntityAccessibilityWrapper *v2;
  char v3;

  v2 = self;
  v3 = __EntityAccessibilityWrapper.entitySupportsAccessibilityActivateAction.getter();

  return v3 & 1;
}

- (void)entityPerformAccessibilityActivate
{
  @objc __EntityAccessibilityWrapper.entityPerformAccessibilityActivate()(self, (uint64_t)a2, (uint64_t)&type metadata for AccessibilityEvents.Activate, (uint64_t)&protocol witness table for AccessibilityEvents.Activate);
}

- (void)entityPerformAccessibilityIncrement
{
  @objc __EntityAccessibilityWrapper.entityPerformAccessibilityActivate()(self, (uint64_t)a2, (uint64_t)&type metadata for AccessibilityEvents.Increment, (uint64_t)&protocol witness table for AccessibilityEvents.Increment);
}

- (void)entityPerformAccessibilityDecrement
{
  @objc __EntityAccessibilityWrapper.entityPerformAccessibilityActivate()(self, (uint64_t)a2, (uint64_t)&type metadata for AccessibilityEvents.Decrement, (uint64_t)&protocol witness table for AccessibilityEvents.Decrement);
}

- (_TtC10RealityKit28__EntityAccessibilityWrapper)init
{
  _TtC10RealityKit28__EntityAccessibilityWrapper *result;

  result = (_TtC10RealityKit28__EntityAccessibilityWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  swift_weakDestroy();
  v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

@end

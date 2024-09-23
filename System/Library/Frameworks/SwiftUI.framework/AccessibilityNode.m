@implementation AccessibilityNode

- (BOOL)isAccessibilityElement
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unsigned __int8 v4;
  char v5;

  v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(0, &v4, &v5);

  return (v5 & 0xF) == 0;
}

- (unint64_t)accessibilityTraits
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v2 = self;
  v3 = AccessibilityNode.resolvedTraits.getter();
  AccessibilityNode.platformElement.getter();
  if (v4)
  {
    v5 = v4;
    v6 = (unint64_t)objc_msgSend(v4, sel_accessibilityTraits);

    v3 |= v6;
  }
  else
  {

  }
  return v3;
}

- (NSString)accessibilityLabel
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.resolvedPlainTextLabel.getter);
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = AccessibilityNode.accessibilityUserInputLabels.getter((uint64_t (*)(uint64_t, id))specialized Sequence.compactMap<A>(_:));

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (NSArray)accessibilityAttributedUserInputLabels
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = AccessibilityNode.accessibilityUserInputLabels.getter((uint64_t (*)(uint64_t, id))specialized Sequence.compactMap<A>(_:));

  if (v3)
  {
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for NSAttributedString);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AccessibilityNode.resolvedAttributedLabel.getter();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityValue
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.resolvedPlainTextValue.getter);
}

- (NSAttributedString)accessibilityAttributedValue
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AccessibilityNode.resolvedAttributedValue.getter();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityHint
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.resolvedPlainTextHint.getter);
}

- (NSAttributedString)accessibilityAttributedHint
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  void *v6;
  uint64_t v8[2];
  Swift::OpaquePointer_optional v9;

  v2 = self;
  AccessibilityNode.attachment.getter(v8);
  v3 = v8[0];

  v8[0] = v3;
  v4 = (void *)AccessibilityProperties.hints.getter();
  swift_bridgeObjectRelease();
  v9.value._rawValue = v4;
  v9.is_nil = 1;
  v5._countAndFlagsBits = 0xE200000000000000;
  v6 = (void *)AccessibilityNode.resolvedAttributedTexts(_:includeDefaultAttributes:separator:)(v9, 44, v5);

  swift_bridgeObjectRelease();
  return (NSAttributedString *)v6;
}

- (NSString)accessibilityLanguage
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.accessibilityLanguage.getter);
}

- (NSString)accessibilityTextualContext
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;
  void *v4;

  v2 = self;
  AccessibilityNode.accessibilityTextualContext.getter();
  v4 = v3;

  return (NSString *)v4;
}

- (id)_accessibilityHeadingLevel
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  int v4;
  Class isa;
  uint64_t v7[2];

  v2 = self;
  AccessibilityNode.attachment.getter(v7);

  v3 = swift_bridgeObjectRetain();
  v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  if (v4 == 7)
    isa = 0;
  else
    isa = UInt._bridgeToObjectiveC()().super.super.isa;

  return isa;
}

- (CGRect)accessibilityFrame
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = AccessibilityNode.accessibilityFrame.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UIBezierPath)accessibilityPath
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  UIBezierPath *v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityPath.getter();

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  Swift::Int v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilitySortPriority()();

  return v3;
}

- (BOOL)_accessibilityIsHostNode
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unsigned int v5;

  v2 = self;
  AccessibilityNode.visibility.getter((int *)&v5);

  return (v5 >> 5) & 1;
}

- (_TtP7SwiftUI36PlatformAccessibilityElementProtocol_)_accessibilityNodeRepresentedElement
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  _TtC7SwiftUI17AccessibilityNode *v3;
  _TtC7SwiftUI17AccessibilityNode *v4;

  v2 = self;
  AccessibilityNode.platformElement.getter();
  if (v3)
  {
    v4 = v3;

    v2 = v4;
  }
  return (_TtP7SwiftUI36PlatformAccessibilityElementProtocol_ *)v2;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  _TtC7SwiftUI17AccessibilityNode *v5;
  __C::_NSRange v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  __C::CGRect v15;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6.location = location;
  v6.length = length;
  v15 = AccessibilityNode._accessibilityBounds(for:)(v6);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;

  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSArray)_accessibilityNodeChildrenUnsorted
{
  return (NSArray *)@objc AccessibilityNode._accessibilityNodeChildrenUnsorted.getter(self, (uint64_t)a2, 0, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityIncrementalLayoutNode.accessibilityElements.getter);
}

- (NSArray)accessibilityElements
{
  return (NSArray *)@objc AccessibilityNode._accessibilityNodeChildrenUnsorted.getter(self, (uint64_t)a2, 2, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityIncrementalLayoutNode.accessibilityElements.getter);
}

- (NSArray)automationElements
{
  unint64_t *v3;
  unint64_t v4;
  _TtC7SwiftUI17AccessibilityNode *v5;
  Class isa;

  v3 = (unint64_t *)((char *)self + OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_children);
  swift_beginAccess();
  v4 = *v3;
  swift_getKeyPath();
  v5 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SwiftUI17AccessibilityNodeCG_yps5NeverOTg503_s7d4UI17fg16CAA08PlatformC15b35Protocol_So8NSObjectCXcIeggo_ACyps5H11OIegnrzr_TRAhF0lfbN0_So0P0CXcIeggo_Tf1cn_nTf4ng_n(v4, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityIncrementalLayoutNode.accessibilityElements.getter);

  swift_bridgeObjectRelease();
  swift_release_n();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)accessibilityContainer
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  void *v9;
  __int128 v11;
  uint64_t v12;

  v2 = self;
  AccessibilityNode.accessibilityContainer()(&v11);

  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(&v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4, v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v5 + 16))(v8, v6);
  v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  return v9;
}

- (CGPoint)accessibilityActivationPoint
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = self;
  v3 = AccessibilityNode.accessibilityActivationPoint.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)@objc AccessibilityNode.accessibilityDragSourceDescriptors.getter(self, (uint64_t)a2, (uint64_t (*)(_QWORD))AccessibilityNode.resolvedDragPoints(with:));
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)@objc AccessibilityNode.accessibilityDragSourceDescriptors.getter(self, (uint64_t)a2, (uint64_t (*)(_QWORD))AccessibilityNode.resolvedDropPoints(with:));
}

- (BOOL)accessibilityViewIsModal
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityViewIsModal.getter();

  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unsigned __int8 v4;
  char v5;

  v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(0, &v4, &v5);

  return v5 == 3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v4 = 4;
  v2 = self;
  AccessibilityNode.impliedVisibility(consideringParent:with:)(1, &v4, (char *)&v5);

  return v5 - 1 < 2;
}

- (int64_t)accessibilityNavigationStyle
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  int64_t v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityNavigationStyle.getter();

  return v3;
}

- (int64_t)accessibilityContainerType
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  char v4;
  int64_t v5;
  objc_super v7;

  v2 = self;
  v3 = AccessibilityNode.resolvedContainerType.getter();
  if ((v4 & 1) != 0)
  {
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for AccessibilityNode();
    v3 = -[AccessibilityNode accessibilityContainerType](&v7, sel_accessibilityContainerType);
  }
  v5 = v3;

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  char v3;
  BOOL v4;
  char v5;
  objc_super v7;

  v2 = self;
  v3 = AccessibilityNode.resolvedIsInteractive.getter();
  if (v3 == 2)
  {
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for AccessibilityNode();
    v4 = -[AccessibilityNode accessibilityRespondsToUserInteraction](&v7, sel_accessibilityRespondsToUserInteraction);

  }
  else
  {
    v5 = v3;

    return v5 & 1;
  }
  return v4;
}

- (BOOL)_accessibilityExplicitlyNonInteractable
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  BOOL v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityExplicitlyNonInteractable.getter();

  return v3;
}

- (void)accessibilityIncrement
{
  _TtC7SwiftUI17AccessibilityNode *v2;

  v2 = self;
  specialized AccessibilityNode.sendAction<A>(_:value:)(2, 0);

}

- (void)accessibilityDecrement
{
  _TtC7SwiftUI17AccessibilityNode *v2;

  v2 = self;
  specialized AccessibilityNode.sendAction<A>(_:value:)(2, 1);

}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC7SwiftUI17AccessibilityNode *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[AccessibilityNode accessibilityFrame](v5, sel_accessibilityFrame);
  UnitPoint.init(_:in:)();
  v10[0] = 0;
  v11 = v6;
  v12 = v7;
  v13 = x;
  v14 = y;
  v8 = specialized AccessibilityNode.sendAction<A>(_:value:)((uint64_t)v10);

  return v8 & 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC7SwiftUI17AccessibilityNode *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v10[8];
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[AccessibilityNode accessibilityFrame](v5, sel_accessibilityFrame);
  UnitPoint.init(_:in:)();
  v10[0] = 1;
  v11 = v6;
  v12 = v7;
  v13 = x;
  v14 = y;
  v8 = specialized AccessibilityNode.sendAction<A>(_:value:)((uint64_t)v10);

  return v8 & 1;
}

- (NSArray)accessibilityCustomActions
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = AccessibilityNode.accessibilityCustomActions.getter();

  if (v3)
  {
    type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomAction);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (unint64_t)accessibilityDirectTouchOptions
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  id v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityDirectTouchOptions.getter();

  return (unint64_t)v3;
}

- (BOOL)accessibilityActivate
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  char v3;

  v2 = self;
  v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 0);

  return v3 & 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[4];
  uint64_t v8[2];
  _OWORD v9[2];

  memset(v9, 0, sizeof(v9));
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  v3 = swift_bridgeObjectRetain();
  v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  v7[2] = v9;
  v5 = specialized Sequence.contains(where:)((uint64_t (*)(uint64_t))closure #1 in AccessibilityNode.hasAction<A>(_:)specialized partial apply, (uint64_t)v7, v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  char v3;

  v2 = self;
  v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 1);

  return v3 & 1;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[4];
  uint64_t v8[2];
  _QWORD v9[4];

  memset(v9, 0, 24);
  v9[3] = 1;
  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  v3 = swift_bridgeObjectRetain();
  v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();
  v7[2] = v9;
  v5 = specialized Sequence.contains(where:)((uint64_t (*)(uint64_t))partial apply for specialized closure #1 in AccessibilityNode.hasAction<A>(_:), (uint64_t)v7, v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  char v3;

  v2 = self;
  v3 = specialized AccessibilityNode.sendAction<A>(_:value:)(0, 0, 0, 2);

  return v3 & 1;
}

- (id)accessibilityURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC7SwiftUI17AccessibilityNode *v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>(0, (unint64_t *)&lazy cache variable for type metadata for URL?, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v14 - v5;
  v7 = self;
  AccessibilityNode.accessibilityURL()((uint64_t)v6);

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v11;
}

- (NSArray)_accessibilityUserDefinedLinkedUIElements
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  char *v3;
  NSArray v4;

  v2 = self;
  v3 = AccessibilityNode._accessibilityUserDefinedLinkedUIElements.getter();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;

  v4 = self;
  LOBYTE(a3) = AccessibilityNode.accessibilityScroll(_:)((UIAccessibilityScrollDirection)a3);

  return a3 & 1;
}

- (BOOL)_accessibilityCanPerformAction:(unsigned int)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;

  v4 = self;
  LOBYTE(a3) = AccessibilityNode._accessibilityCanPerformAction(_:)(a3);

  return a3 & 1;
}

- (NSArray)accessibilityCustomRotors
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  Class isa;

  v2 = self;
  AccessibilityNode.resolvedCustomRotors.getter();

  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomRotor);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)_accessibilityIsRTL
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  BOOL v4;

  v2 = self;
  EnvironmentValues.layoutDirection.getter();

  return v4;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, AccessibilityNode.accessibilityIdentifier.getter);
}

- (unint64_t)_accessibilityAutomationType
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  id v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityAutomationType()();

  return (unint64_t)v3;
}

- (id)_accessibilityRoleDescription
{
  return @objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode._accessibilityRoleDescription());
}

- (double)_accessibilityMinValue
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityMinValue()((void (*)(__int128 *__return_ptr, uint64_t))MEMORY[0x1E0CE5DF8]);

  return v3;
}

- (double)_accessibilityMaxValue
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityMinValue()((void (*)(__int128 *__return_ptr, uint64_t))MEMORY[0x1E0CE5DF0]);

  return v3;
}

- (double)_accessibilityNumberValue
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityNumberValue()();

  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  int64_t v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityExpandedStatus()();

  return v3;
}

- (id)accessibilityDataTableCellElementForRow:(int64_t)a3 column:(int64_t)a4
{
  _TtC7SwiftUI17AccessibilityNode *v6;
  void *v7;

  v6 = self;
  v7 = (void *)AccessibilityNode.accessibilityDataTableCellElement(forRow:column:)(a3, a4);

  return v7;
}

- (int64_t)accessibilityRowCount
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  int64_t v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityRowCount()(AccessibilityCollectionViewTableDataSource.rowCount.getter);

  return v3;
}

- (int64_t)accessibilityColumnCount
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  int64_t v3;

  v2 = self;
  v3 = AccessibilityNode.accessibilityRowCount()(AccessibilityCollectionViewTableDataSource.columnCount.getter);

  return v3;
}

- (id)accessibilityHeaderElementsForRow:(int64_t)a3
{
  return 0;
}

- (id)accessibilityHeaderElementsForColumn:(int64_t)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;
  unint64_t v5;
  NSArray v6;

  v4 = self;
  v5 = (unint64_t)AccessibilityNode.accessibilityHeaderElements(forColumn:)(a3);

  if (v5)
  {
    type metadata accessor for UIAccessibilityContainerDataTableCell();
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

- (_NSRange)accessibilityColumnRange
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  __C::_NSRange v3;
  Swift::Int location;
  Swift::Int length;
  _NSRange result;

  v2 = self;
  v3 = AccessibilityNode.accessibilityColumnRange()();

  location = v3.location;
  length = v3.length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)accessibilityRowRange
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  __C::_NSRange v3;
  Swift::Int location;
  Swift::Int length;
  _NSRange result;

  v2 = self;
  v3 = AccessibilityNode.accessibilityRowRange()();

  location = v3.location;
  length = v3.length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)_accessibilityIsFirstSiblingForType:(unint64_t)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;

  v4 = self;
  LOBYTE(a3) = AccessibilityNode._accessibilityIsFirstSibling(for:)(a3);

  return a3 & 1;
}

- (id)_accessibilityDataSeriesName
{
  return @objc AccessibilityNode.accessibilityLabel.getter(self, (uint64_t)a2, (uint64_t (*)(void))AccessibilityNode._accessibilityDataSeriesName());
}

- (int64_t)_accessibilityDataSeriesType
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  int64_t v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityDataSeriesType()();

  return v3;
}

- (BOOL)_accessibilityDataSeriesSupportsSummarization
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[312];
  _BYTE v7[312];
  uint64_t v8[6];
  BOOL v9;

  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  v4 = MEMORY[0x1E0CE6800];
  outlined init with take of Image.Resolved?((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E0CE6800]);
  outlined init with take of Image.Resolved?((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (BOOL)_accessibilityDataSeriesSupportsSonification
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[312];
  _BYTE v7[312];
  uint64_t v8[4];
  BOOL v9;

  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  v4 = MEMORY[0x1E0CE6800];
  outlined init with take of Image.Resolved?((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E0CE6800]);
  outlined init with take of Image.Resolved?((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (BOOL)_accessibilityDataSeriesIncludesTrendlineInSonification
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[312];
  _BYTE v7[312];
  uint64_t v8[6];
  BOOL v9;

  v2 = self;
  AccessibilityNode.attachment.getter(v8);

  v3 = swift_bridgeObjectRetain();
  specialized AccessibilityProperties.subscript.getter(v3, (uint64_t)v6);
  swift_bridgeObjectRelease_n();
  v4 = MEMORY[0x1E0CE6800];
  outlined init with take of Image.Resolved?((uint64_t)v6, (uint64_t)v7, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, MEMORY[0x1E0CE6800]);
  outlined init with take of Image.Resolved?((uint64_t)v7, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for AccessibilityDataSeriesConfiguration?, v4);
  if (getEnumTag for AccessibilityActionCategory.Category((uint64_t)v8) == 1)
  {

    return 0;
  }
  else
  {
    outlined release of AccessibilityDataSeriesConfiguration?((uint64_t)v7);

    return v9;
  }
}

- (double)_accessibilityDataSeriesSonificationDuration
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  double v3;

  v2 = self;
  v3 = AccessibilityNode._accessibilityDataSeriesSonificationDuration()();

  return v3;
}

- (id)_accessibilityDataSeriesValuesForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:)(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))AccessibilityNode._accessibilityDataSeriesValues(for:));
}

- (id)_accessibilityDataSeriesTitleForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesTitle(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesTitle(for:));
}

- (id)_accessibilityDataSeriesUnitLabelForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesTitle(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesUnitLabel(for:));
}

- (id)_accessibilityDataSeriesMinimumValueForAxis:(int64_t)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;
  Class v5;

  v4 = self;
  v5 = AccessibilityNode._accessibilityDataSeriesMinimumValue(for:)(a3);

  return v5;
}

- (id)_accessibilityDataSeriesMaximumValueForAxis:(int64_t)a3
{
  _TtC7SwiftUI17AccessibilityNode *v4;
  Class v5;

  v4 = self;
  v5 = AccessibilityNode._accessibilityDataSeriesMaximumValue(for:)(a3);

  return v5;
}

- (id)_accessibilityDataSeriesGridlinePositionsForAxis:(int64_t)a3
{
  return @objc AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:)(self, (uint64_t)a2, a3, AccessibilityNode._accessibilityDataSeriesGridlinePositions(for:));
}

- (id)_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4
{
  _TtC7SwiftUI17AccessibilityNode *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = self;
  v7 = AccessibilityNode._accessibilityDataSeriesValueDescription(forPosition:axis:)(a4, a3);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x18D75CC88](v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)dealloc
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v2 = self;
  AccessibilityNode.platformElement.getter();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setAccessibilityNodeForPlatformElement_, 0);

  }
  if (-[AccessibilityNode respondsToSelector:](v2, sel_respondsToSelector_, sel__accessibilityUnregister))
    -[AccessibilityNode _accessibilityUnregister](v2, sel__accessibilityUnregister);
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for AccessibilityNode();
  -[AccessibilityNode dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_viewRendererHost);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of AccessibilityAttachment?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_cachedCombinedAttachment), *(void **)((char *)&self->super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17AccessibilityNode_cachedCombinedAttachment));
  swift_bridgeObjectRelease();
  swift_release();
}

- (UIResponder)nextResponder
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AccessibilityNode.next.getter();

  return (UIResponder *)v3;
}

- (_TtC7SwiftUI17AccessibilityNode)init
{
  _TtC7SwiftUI17AccessibilityNode *result;

  result = (_TtC7SwiftUI17AccessibilityNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)accessibilityCustomAttribute:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7SwiftUI17AccessibilityNode *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  AccessibilityNode.accessibilityCustomAttribute(_:)(v4, v6, &v16);

  swift_bridgeObjectRelease();
  v8 = v17;
  if (!v17)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(&v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v9, v9);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v10 + 16))(v13, v11);
  v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  return v14;
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  void *v3;

  v2 = self;
  v3 = (void *)AccessibilityNode.accessibilityChartDescriptor.getter();

  return (AXChartDescriptor *)v3;
}

- (BOOL)_accessibilityIsChartElement
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6[2];

  v2 = self;
  AccessibilityNode.attachment.getter(v6);

  v3 = swift_bridgeObjectRetain();
  v4 = specialized AccessibilityProperties.subscript.getter(v3);
  swift_bridgeObjectRelease_n();

  if (v4)
    swift_release();
  return v4 != 0;
}

- (id)accessibilityCustomContent
{
  _TtC7SwiftUI17AccessibilityNode *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = (unint64_t)AccessibilityNode.accessibilityCustomContent()();

  if (v3)
  {
    type metadata accessor for AXCustomContent();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

@end

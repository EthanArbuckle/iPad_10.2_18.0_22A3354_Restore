@implementation UIKitFocusableViewResponderItem

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  v5 = *(double *)&self->base[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame) = a3;
}

- (BOOL)canBecomeFocused
{
  uint64_t Strong;
  char v3;

  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (!*(_QWORD *)(Strong + 240))
    {
      __break(1u);
      return Strong;
    }
    v3 = *(_BYTE *)(Strong + 228);
    swift_release();
  }
  else
  {
    v3 = 0;
  }
  LOBYTE(Strong) = v3;
  return Strong;
}

- (UIResponder)nextResponder
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitFocusableViewResponderItem.next.getter();

  return (UIResponder *)v3;
}

- (NSString)swiftui_focusGroupIdentifier
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = UIKitFocusableViewResponderItem.swiftui_focusGroupIdentifier.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)(id)MEMORY[0x18D760234]((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_host, a2);
}

- (NSArray)preferredFocusEnvironments
{
  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (UIFocusItemContainer)focusItemContainer
{
  return (UIFocusItemContainer *)0;
}

- (void)setNeedsFocusUpdate
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v3;
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v4;
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v5;
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v6;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusSystem);
  v6 = self;
  v3 = (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *)static UIFocusSystem.focusSystem(for:)();
  if (v3)
  {
    v4 = v3;
    -[UIKitFocusableViewResponderItem requestFocusUpdateToEnvironment:](v3, sel_requestFocusUpdateToEnvironment_, v6);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (void)updateFocusIfNeeded
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v3;
  id v4;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusSystem);
  v3 = self;
  v4 = (id)static UIFocusSystem.focusSystem(for:)();
  objc_msgSend(v4, sel_updateFocusIfNeeded);

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = UIKitFocusableViewResponderItem.shouldUpdateFocus(in:)(v4);

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized UIKitFocusableViewResponderItem.didUpdateFocus(in:with:)(v6);

}

- (UIFocusEffect)focusEffect
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitFocusableViewResponderItem.focusEffect.getter();

  return (UIFocusEffect *)v3;
}

- (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem)init
{
  _TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *result;

  result = (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  outlined consume of Path?(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath), *(_QWORD *)&self->base[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath], self->host[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath]);
}

@end

@implementation UIKitFocusableFillerItem

- (CGRect)frame
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_focusableFrame);
  if ((self->axis[OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_focusableFrame] & 1) != 0)
    v2 = (double *)((char *)self
                  + OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_logicalFrame);
  v3 = v2[2];
  v4 = v2[3];
  v5 = *v2;
  v6 = v2[1];
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)(id)MEMORY[0x18D760234]((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_host, a2);
}

- (UIFocusItemContainer)focusItemContainer
{
  return (UIFocusItemContainer *)0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized UIKitFocusableFillerItem.didUpdateFocus(in:with:)();

}

- (_TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem)init
{
  _TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem *result;

  result = (_TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end

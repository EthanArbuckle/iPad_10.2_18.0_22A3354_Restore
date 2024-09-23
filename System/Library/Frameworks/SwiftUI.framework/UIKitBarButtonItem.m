@implementation UIKitBarButtonItem

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI18UIKitBarButtonItem)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UIKitBarButtonItem.init(coder:)();
}

- (void)performAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC7SwiftUI18UIKitBarButtonItem *v10;
  _TtC7SwiftUI18UIKitBarButtonItem *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD v16[2];

  type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>(0, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)v16 - v8 + 16;
  if (a3)
  {
    v10 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v11 = self;
  }
  v12 = (char *)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_platformItem;
  swift_beginAccess();
  outlined init with copy of UTType?((uint64_t)v12, (uint64_t)v9, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  outlined init with take of SwipeActions.Value?((uint64_t)v9, v14 + v13, (uint64_t)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t)type metadata accessor for PlatformItemList.Item, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>);
  static Update.enqueueAction(_:)();

  swift_release();
  outlined destroy of AccessibilityTableContext?((uint64_t)v16, (unint64_t *)&lazy cache variable for type metadata for Any?, MEMORY[0x1E0DEE9B8] + 8);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityIdentifier);
}

- (NSString)accessibilityLabel
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityLabel);
}

- (NSString)accessibilityHint
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityHint);
}

- (NSString)accessibilityValue
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityValue);
}

- (unint64_t)accessibilityTraits
{
  _TtC7SwiftUI18UIKitBarButtonItem *v2;
  id v3;

  v2 = self;
  v3 = UIKitBarButtonItem.accessibilityTraits.getter();

  return (unint64_t)v3;
}

- (NSArray)accessibilityCustomActions
{
  _TtC7SwiftUI18UIKitBarButtonItem *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = UIKitBarButtonItem.accessibilityCustomActions.getter();

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

- (_TtC7SwiftUI18UIKitBarButtonItem)init
{
  _TtC7SwiftUI18UIKitBarButtonItem *result;

  result = (_TtC7SwiftUI18UIKitBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of TaskPriority?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_item, &lazy cache variable for type metadata for ToolbarStorage.Item?, type metadata accessor for ToolbarStorage.Item);
  outlined destroy of AccessibilityTableContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_listView, &lazy cache variable for type metadata for _ViewList_View?, MEMORY[0x1E0CE0A40]);

  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_menuDelegate);
  outlined destroy of TaskPriority?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_platformItem, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item);
}

@end

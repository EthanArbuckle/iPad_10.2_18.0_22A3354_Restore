@implementation UIKitSearchSuggestion

- (NSString)localizedSuggestion
{
  void *v2;
  _TtC7SwiftUI21UIKitSearchSuggestion *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, sel_string);
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

    v2 = (void *)MEMORY[0x18D75CC88](v5, v7);
    swift_bridgeObjectRelease();
  }
  return (NSString *)v2;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem));
}

- (id)representedObject
{
  return 0;
}

- (void)setRepresentedObject:(id)a3
{
  _TtC7SwiftUI21UIKitSearchSuggestion *v4;
  _TtC7SwiftUI21UIKitSearchSuggestion *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  outlined destroy of TableRowList?((uint64_t)v6, (uint64_t)&lazy cache variable for type metadata for Any?, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))type metadata accessor for _EnvironmentKeyWritingModifier<Bool>);

}

- (NSString)localizedDescription
{
  return (NSString *)0;
}

- (UIImage)iconImage
{
  _TtC7SwiftUI21UIKitSearchSuggestion *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitSearchSuggestion.iconImage.getter();

  return (UIImage *)v3;
}

- (_TtC7SwiftUI21UIKitSearchSuggestion)init
{
  _TtC7SwiftUI21UIKitSearchSuggestion *result;

  result = (_TtC7SwiftUI21UIKitSearchSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem, (uint64_t (*)(_QWORD))type metadata accessor for PlatformItemList.Item);
}

@end

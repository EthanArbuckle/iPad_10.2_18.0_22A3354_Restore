@implementation WidgetPersonality

- (NSString)extensionBundleIdentifier
{
  return (NSString *)sub_2384CF26C();
}

- (NSString)kind
{
  return (NSString *)sub_2384CF26C();
}

- (BOOL)matchesPersonality:(id)a3
{
  _TtC26ContextualSuggestionClient17WidgetPersonality *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_2384CF3D8(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (_TtC26ContextualSuggestionClient17WidgetPersonality)init
{
  _TtC26ContextualSuggestionClient17WidgetPersonality *result;

  result = (_TtC26ContextualSuggestionClient17WidgetPersonality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

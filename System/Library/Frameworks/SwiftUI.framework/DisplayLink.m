@implementation DisplayLink

- (void)displayLinkTimer:(id)a3
{
  id v4;
  _TtC7SwiftUI11DisplayLink *v5;

  v4 = a3;
  v5 = self;
  DisplayLink.displayLinkTimer(_:)(v4);

}

+ (void)asyncThreadWithArg:(id)a3
{
  _OWORD v3[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  specialized static DisplayLink.asyncThread(arg:)();
  outlined destroy of AccessibilityTableContext?((uint64_t)v3, (unint64_t *)&lazy cache variable for type metadata for Any?, MEMORY[0x1E0DEE9B8] + 8);
}

- (_TtC7SwiftUI11DisplayLink)init
{
  _TtC7SwiftUI11DisplayLink *result;

  result = (_TtC7SwiftUI11DisplayLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI11DisplayLink_host);

  swift_bridgeObjectRelease();
}

@end

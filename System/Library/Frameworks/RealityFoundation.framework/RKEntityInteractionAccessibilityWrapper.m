@implementation RKEntityInteractionAccessibilityWrapper

- (NSString)accessibilityDescription
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper_interaction);
  v3 = (uint64_t *)(v2 + 48);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 56);
  if (!v4)
    return (NSString *)0;
  v5 = *v3;
  swift_bridgeObjectRetain();
  v6 = (void *)MEMORY[0x220768C3C](v5, v4);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper)init
{
  _TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper *result;

  result = (_TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

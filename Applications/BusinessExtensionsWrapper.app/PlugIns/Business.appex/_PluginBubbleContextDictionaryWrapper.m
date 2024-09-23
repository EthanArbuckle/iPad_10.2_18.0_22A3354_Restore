@implementation _PluginBubbleContextDictionaryWrapper

- (NSDictionary)dictionaryValue
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Business37_PluginBubbleContextDictionaryWrapper_dictionaryValue);
  swift_bridgeObjectRetain(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setDictionaryValue:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Business37_PluginBubbleContextDictionaryWrapper_dictionaryValue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business37_PluginBubbleContextDictionaryWrapper_dictionaryValue) = v4;
  swift_bridgeObjectRelease(v5);
}

- (_TtC8Business37_PluginBubbleContextDictionaryWrapper)init
{
  _TtC8Business37_PluginBubbleContextDictionaryWrapper *result;

  result = (_TtC8Business37_PluginBubbleContextDictionaryWrapper *)_swift_stdlib_reportUnimplementedInitializer("Business._PluginBubbleContextDictionaryWrapper", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Business37_PluginBubbleContextDictionaryWrapper_dictionaryValue));
}

@end

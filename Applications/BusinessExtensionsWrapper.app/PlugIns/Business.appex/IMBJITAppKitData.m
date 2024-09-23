@implementation IMBJITAppKitData

- (NSDictionary)dictionaryValue
{
  uint64_t v2;
  Class isa;

  v2 = *(_QWORD *)self->dictionaryValue;
  swift_bridgeObjectRetain(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setDictionaryValue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v5 = *(_QWORD *)self->dictionaryValue;
  *(_QWORD *)self->dictionaryValue = v4;
  v6 = swift_retain(self);
  swift_release(v6);
  swift_bridgeObjectRelease(v5);
}

@end

@implementation SettingsAppNavigationModel

- (BOOL)shouldContinueActiveURLRoutingForURLResourceDictionary:(id)a3
{
  uint64_t v4;
  BOOL v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_retain(self);
  v5 = sub_1000EB980(v4);
  swift_release(self);
  swift_bridgeObjectRelease(v4);
  return v5;
}

@end

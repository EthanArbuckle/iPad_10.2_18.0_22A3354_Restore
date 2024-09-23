@implementation DaemonConnection

- (void)broadcast:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a3;
  swift_retain();
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v4;
  DaemonConnection.broadcast(_:)(v5, v4);
  outlined consume of Data._Representation(v5, v6);

  swift_release();
}

@end

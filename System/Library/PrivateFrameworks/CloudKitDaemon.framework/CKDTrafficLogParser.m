@implementation CKDTrafficLogParser

- (BOOL)parse:(id)a3 error:(id *)a4
{
  uint64_t v5;
  CKDTrafficLogParser *v6;

  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1BE9EDE90(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (id)consumeParsedTrafficLogsAndReturnError:(id *)a3
{
  CKDTrafficLogParser *v3;
  Class isa;

  v3 = self;
  sub_1BE9EE528();

  type metadata accessor for TrafficLogMessage();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (CKDTrafficLogParser)init
{
  return (CKDTrafficLogParser *)TrafficLogParser.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end

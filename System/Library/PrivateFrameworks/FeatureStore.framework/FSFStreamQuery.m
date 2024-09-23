@implementation FSFStreamQuery

- (NSDate)startDate
{
  return (NSDate *)@objc StreamQuery.startDate.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))StreamQuery.startDate.getter);
}

- (void)setStartDate:(id)a3
{
  @objc StreamQuery.startDate.setter(self, (uint64_t)a2, (uint64_t)a3, StreamQuery.startDate.setter);
}

- (NSDate)endDate
{
  return (NSDate *)@objc StreamQuery.startDate.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))StreamQuery.endDate.getter);
}

- (void)setEndDate:(id)a3
{
  @objc StreamQuery.startDate.setter(self, (uint64_t)a2, (uint64_t)a3, StreamQuery.endDate.setter);
}

- (NSArray)interactionIds
{
  Class isa;

  StreamQuery.interactionIds.getter();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setInteractionIds:(id)a3
{
  uint64_t v4;
  FSFStreamQuery *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  StreamQuery.interactionIds.setter(v4);

}

- (NSString)description
{
  FSFStreamQuery *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = StreamQuery.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x212BEE02C](v3, v5);
  OUTLINED_FUNCTION_9_5();
  return (NSString *)OUTLINED_FUNCTION_6_1(v6);
}

- (FSFStreamQuery)init
{
  StreamQuery.init()();
}

- (void).cxx_destruct
{
  outlined destroy of Date?((uint64_t)self + OBJC_IVAR___FSFStreamQuery_startDate);
  outlined destroy of Date?((uint64_t)self + OBJC_IVAR___FSFStreamQuery_endDate);
  swift_bridgeObjectRelease();
}

@end

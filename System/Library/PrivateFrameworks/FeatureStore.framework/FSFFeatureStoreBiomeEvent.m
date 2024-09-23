@implementation FSFFeatureStoreBiomeEvent

- (NSString)interactionId
{
  void *v2;

  FeatureStoreBiomeEvent.interactionId.getter();
  v2 = (void *)MEMORY[0x212BEE02C]();
  OUTLINED_FUNCTION_18_1();
  return (NSString *)v2;
}

- (NSData)featureData
{
  Class isa;
  uint64_t v3;
  unint64_t v4;

  FeatureStoreBiomeEvent.featureData.getter();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v3 = OUTLINED_FUNCTION_31_0();
  outlined consume of Data._Representation(v3, v4);
  return (NSData *)OUTLINED_FUNCTION_6_1(isa);
}

- (double)timestamp
{
  return FeatureStoreBiomeEvent.timestamp.getter();
}

- (void)setTimestamp:(double)a3
{
  FeatureStoreBiomeEvent.timestamp.setter(a3);
  OUTLINED_FUNCTION_20_1();
}

- (unsigned)dataVersion
{
  return FeatureStoreBiomeEvent.dataVersion.getter();
}

- (void)setDataVersion:(unsigned int)a3
{
  FeatureStoreBiomeEvent.dataVersion.setter(a3);
  OUTLINED_FUNCTION_20_1();
}

- (FSFFeatureStoreBiomeEvent)initWithInteractionId:(id)a3 featureData:(id)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = a4;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  return (FSFFeatureStoreBiomeEvent *)FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(a6, v9, v11, v13, v15, a5);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)static FeatureStoreBiomeEvent.event(with:dataVersion:)(v6, v8, a4);
  outlined consume of Data._Representation(v6, v8);
  return v9;
}

- (id)serialize
{
  FSFFeatureStoreBiomeEvent *v2;
  unint64_t v3;
  unint64_t v4;
  Class isa;
  uint64_t v7;
  unint64_t v8;

  v2 = self;
  FeatureStoreBiomeEvent.serialize()();
  v4 = v3;

  if (v4 >> 60 == 15)
    return OUTLINED_FUNCTION_6_1(0);
  OUTLINED_FUNCTION_31_0();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v7 = OUTLINED_FUNCTION_31_0();
  outlined consume of Data?(v7, v8);
  return OUTLINED_FUNCTION_6_1(isa);
}

- (FSFFeatureStoreBiomeEvent)init
{
  FeatureStoreBiomeEvent.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData), *(_QWORD *)&self->interactionId[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData]);
}

@end

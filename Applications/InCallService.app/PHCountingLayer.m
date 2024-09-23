@implementation PHCountingLayer

- (int64_t)value
{
  return sub_100122878();
}

- (void)setValue:(int64_t)a3
{
  _TtC13InCallService15PHCountingLayer *v4;

  v4 = self;
  sub_1001228C8(a3);

}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_getObjCClassMetadata(a1);
  LOBYTE(a1) = sub_1001229BC();
  swift_bridgeObjectRelease(v5);
  return a1 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13InCallService15PHCountingLayer *v7;
  void *v8;
  void *v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100122AB4(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (_TtC13InCallService15PHCountingLayer)init
{
  return (_TtC13InCallService15PHCountingLayer *)sub_100122C38();
}

- (_TtC13InCallService15PHCountingLayer)initWithLayer:(id)a3
{
  _TtC13InCallService15PHCountingLayer *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  sub_100122C94(v5);
  return result;
}

- (_TtC13InCallService15PHCountingLayer)initWithCoder:(id)a3
{
  return (_TtC13InCallService15PHCountingLayer *)sub_100122D50(a3);
}

@end

@implementation PHRingLayer

- (double)percentage
{
  return sub_10014A0DC();
}

- (void)setPercentage:(double)a3
{
  _TtC13InCallService11PHRingLayer *v4;

  v4 = self;
  sub_10014A130(a3);

}

- (_TtC13InCallService11PHRingLayer)init
{
  return (_TtC13InCallService11PHRingLayer *)sub_10014A14C();
}

- (_TtC13InCallService11PHRingLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC13InCallService11PHRingLayer *)sub_10014A270(v5);
}

- (_TtC13InCallService11PHRingLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014A4C8();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_getObjCClassMetadata(a1);
  LOBYTE(a1) = sub_10014A5E4();
  swift_bridgeObjectRelease(v5);
  return a1 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13InCallService11PHRingLayer *v7;
  id v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_10014A6D8(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC13InCallService11PHRingLayer *v5;

  v4 = a3;
  v5 = self;
  sub_10014A864(v4);

}

- (void).cxx_destruct
{

}

@end

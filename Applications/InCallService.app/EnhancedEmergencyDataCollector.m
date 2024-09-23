@implementation EnhancedEmergencyDataCollector

- (_TtC13InCallService30EnhancedEmergencyDataCollector)init
{
  return (_TtC13InCallService30EnhancedEmergencyDataCollector *)sub_100145A54();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13InCallService30EnhancedEmergencyDataCollector_bitRateArray));
  sub_10014812C(OBJC_IVAR____TtC13InCallService30EnhancedEmergencyDataCollector_frameRateArray);
  sub_10014812C(OBJC_IVAR____TtC13InCallService30EnhancedEmergencyDataCollector_packetLossArray);
  sub_10014812C(OBJC_IVAR____TtC13InCallService30EnhancedEmergencyDataCollector_jitterRateArray);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13InCallService30EnhancedEmergencyDataCollector_requestMetricDataSet));
}

@end

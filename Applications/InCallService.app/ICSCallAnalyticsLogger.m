@implementation ICSCallAnalyticsLogger

- (ICSCallAnalyticsLogger)init
{
  return (ICSCallAnalyticsLogger *)sub_100175870();
}

- (void)createAnalyticsViewForCall:(id)a3 initialPresentationMode:(int64_t)a4 bannersEnabled:(BOOL)a5
{
  id v6;
  ICSCallAnalyticsLogger *v7;

  v6 = a3;
  v7 = self;
  sub_1001759A8();

}

- (void)createAnsweredBannerAnalyticsViewWithIsHandsfreeAudioRoute:(BOOL)a3
{
  ICSCallAnalyticsLogger *v4;

  v4 = self;
  sub_100175C58(a3);

}

- (void)setBannerDismissalReasonForAnalyticsSource:(id)a3 callUUID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  ICSCallAnalyticsLogger *v14;
  uint64_t v15;

  v7 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = type metadata accessor for UUID(0);
    v12 = 0;
  }
  else
  {
    v11 = type metadata accessor for UUID(0);
    v12 = 1;
  }
  sub_100108600((uint64_t)v10, v12, 1, v11);
  v13 = a3;
  v14 = self;
  sub_100175D2C();

  sub_1001209C8((uint64_t)v10, &qword_1002D7D78);
}

- (void)setPresentationMode:(int64_t)a3 callUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  ICSCallAnalyticsLogger *v12;
  uint64_t v13;

  v6 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = type metadata accessor for UUID(0);
    v11 = 0;
  }
  else
  {
    v10 = type metadata accessor for UUID(0);
    v11 = 1;
  }
  sub_100108600((uint64_t)v9, v11, 1, v10);
  v12 = self;
  sub_100175F98();

  sub_1001209C8((uint64_t)v9, &qword_1002D7D78);
}

- (void)ringerMutedForCallUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  ICSCallAnalyticsLogger *v11;
  uint64_t v12;

  v5 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for UUID(0);
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    v10 = 1;
  }
  sub_100108600((uint64_t)v8, v10, 1, v9);
  v11 = self;
  sub_100176198();

  sub_1001209C8((uint64_t)v8, &qword_1002D7D78);
}

- (void)bannerDidDisconnect
{
  ICSCallAnalyticsLogger *v2;

  v2 = self;
  sub_10017639C();

}

- (void)submitCAMetric:(id)a3 viewId:(id)a4
{
  id v6;
  id v7;
  ICSCallAnalyticsLogger *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100176410((uint64_t)v6, (uint64_t)v7);

}

- (void)callStatusChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  ICSCallAnalyticsLogger *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100176528();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___ICSCallAnalyticsLogger_incomingCallAnalyticsViews));
}

@end

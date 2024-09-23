@implementation PHSOSUIWebViewEventsHelper

- (_TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper)init
{
  return (_TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *)sub_100134B78();
}

- (void)webRTCErrorWithError:(id)a3
{
  id v4;
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v5;

  v4 = a3;
  v5 = self;
  sub_100134D68();

}

- (void)videoStreamQualityChangedWithQuality:(id)a3
{
  id v4;
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v5;

  v4 = a3;
  v5 = self;
  sub_100134E08((uint64_t)v4);

}

- (void)videoStreamLost
{
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v2;

  v2 = self;
  sub_100134E68();

}

- (void)stateChangeWithState:(id)a3
{
  id v4;
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v5;

  v4 = a3;
  v5 = self;
  sub_100134EE0((uint64_t)v4);

}

- (int64_t)serverAuthenticationChallengeWithChallenge:(id)a3
{
  id v4;
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100134F9C((uint64_t)v4);

  return v6;
}

- (void)connectedWithAddresses:(id)a3
{
  uint64_t v4;
  _TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = self;
  sub_100135050();

  swift_bridgeObjectRelease(v4);
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self+ OBJC_IVAR____TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper_delegate);
}

@end

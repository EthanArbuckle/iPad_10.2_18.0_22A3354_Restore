@implementation CallProviderWrapper

- (void)providerDidReset:(id)a3
{
  sub_233AE7250((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidReset);
}

- (void)providerDidBegin:(id)a3
{
  sub_233AE7250((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidBegin);
}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidActivateAudioSession);
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidDeactivateAudioSession);
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderTimedOutPerformingAction);
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformStartCallAction);
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAnswerCallAction);
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformEndCallAction);
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetHeldCallAction);
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetMutedCallAction);
}

- (void)provider:(id)a3 performSetGroupCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetGroupCallAction);
}

- (void)provider:(id)a3 performPlayDTMFCallAction:(id)a4
{
  sub_233AE7320((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformPlayDTMFCallAction);
}

- (_TtC20LiveCommunicationKit19CallProviderWrapper)init
{
  return (_TtC20LiveCommunicationKit19CallProviderWrapper *)sub_233AE7398();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end

@implementation VideoStream

- (void)dealloc
{
  _TtC17ContinuityDisplay11VideoStream *v2;

  v2 = self;
  VideoStream.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC17ContinuityDisplay11VideoStream_session, a2);

  v3 = (char *)self + OBJC_IVAR____TtC17ContinuityDisplay11VideoStream_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)qosMonitor:(id)a3 didReceiveReport:(id)a4 streamToken:(int64_t)a5
{
  uint64_t v7;
  id v8;
  _TtC17ContinuityDisplay11VideoStream *v9;

  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable, a5);
  v8 = a3;
  v9 = self;
  VideoStream.qosMonitor(_:didReceiveReport:streamToken:)((uint64_t)v9, v7);

  swift_bridgeObjectRelease(v7);
}

- (_TtC17ContinuityDisplay11VideoStream)init
{
  VideoStream.init()();
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7;
  _TtC17ContinuityDisplay11VideoStream *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a5;
  VideoStream.stream(_:didStart:error:)();

}

- (void)streamDidStop:(id)a3
{
  id v4;
  _TtC17ContinuityDisplay11VideoStream *v5;

  v4 = a3;
  v5 = self;
  VideoStream.streamDidStop(_:)();

}

- (void)streamDidServerDie:(id)a3
{
  id v4;
  _TtC17ContinuityDisplay11VideoStream *v5;

  v4 = a3;
  v5 = self;
  VideoStream.streamDidServerDie(_:)();

}

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4;
  _TtC17ContinuityDisplay11VideoStream *v5;

  v4 = a3;
  v5 = self;
  VideoStream.streamDidRTPTimeOut(_:)();

}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v4;
  _TtC17ContinuityDisplay11VideoStream *v5;

  v4 = a3;
  v5 = self;
  VideoStream.streamDidRTCPTimeOut(_:)();

}

@end

@implementation CaptionsClientParticipantCaptionsProvider

- (void)dealloc
{
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v2;

  v2 = self;
  CaptionsClientParticipantCaptionsProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider_logger;
  v4 = OUTLINED_FUNCTION_17_2();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider_participantCaptionsProviderDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider_avcCaptionsClient));
}

- (_TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider)init
{
  CaptionsClientParticipantCaptionsProvider.init()();
}

- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  id v8;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didEnableCaptions:error:)((uint64_t)v10, a4, (uint64_t)a5);

}

- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  id v8;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didDisableCaptions:error:)((uint64_t)v10, a4, (uint64_t)a5);

}

- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didStartCaptioningWith:)((uint64_t)v7, v4);

}

- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didStopCaptioningWith:)((uint64_t)v7, v4);

}

- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5
{
  id v8;
  id v9;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didUpdateCaptions:source:)((uint64_t)v10, a4, a5);

}

- (void)captionsServerDidDie:(id)a3
{
  id v4;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v5;

  v4 = a3;
  v5 = self;
  CaptionsClientParticipantCaptionsProvider.captionsServerDidDie(_:)();

}

- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4
{
  id v6;
  _TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider *v7;

  v6 = a3;
  v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didDetectGibberish:)((uint64_t)v7, a4);

}

@end

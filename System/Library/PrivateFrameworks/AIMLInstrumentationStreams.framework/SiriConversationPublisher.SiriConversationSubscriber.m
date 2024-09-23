@implementation SiriConversationPublisher.SiriConversationSubscriber

- (void)receiveSubscription:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_downstream), sel_receiveSubscription_, a3);
}

- (int64_t)receiveInput:(id)a3
{
  _TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *v4;
  int64_t v5;
  char *v7;
  _BYTE v8[32];
  _BYTE v9[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC71DC8();
  swift_unknownObjectRelease();
  sub_21DC13D44((uint64_t)v9, (uint64_t)v8);
  type metadata accessor for SiriTurn();
  if (swift_dynamicCast())
  {
    sub_21DC59940(v7);
    sub_21DC59668();
    v5 = BPSDemandMax();

    v4 = (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *)v7;
  }
  else
  {
    v5 = BPSDemandMax();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *v5;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_upstreamFinished) = 1;
  v4 = a3;
  v5 = self;
  sub_21DC59668();
  objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_downstream), sel_receiveCompletion_, v4);

}

- (void)cancel
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_upstreamFinished) = 1;
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber_downstream), sel_cancel);
}

- (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber)init
{
  _TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *result;

  result = (_TtCC26AIMLInstrumentationStreams25SiriConversationPublisher26SiriConversationSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

@end

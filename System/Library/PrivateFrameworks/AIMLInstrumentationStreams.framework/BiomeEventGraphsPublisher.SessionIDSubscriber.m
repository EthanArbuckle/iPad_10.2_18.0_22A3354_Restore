@implementation BiomeEventGraphsPublisher.SessionIDSubscriber

- (void)receiveSubscription:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_downstream), sel_receiveSubscription_, a3);
}

- (int64_t)receiveInput:(id)a3
{
  _TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber *v4;
  int64_t v5;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC71DC8();
  swift_unknownObjectRelease();
  v5 = sub_21DC1D2B8((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber *v5;

  v4 = a3;
  v5 = self;
  sub_21DC1D3EC((uint64_t)v4);

}

- (void)cancel
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_upstreamFinished) = 1;
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_downstream), sel_cancel);
}

- (_TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber)init
{
  _TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber *result;

  result = (_TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher19SessionIDSubscriber_logger;
  v4 = sub_21DC719D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

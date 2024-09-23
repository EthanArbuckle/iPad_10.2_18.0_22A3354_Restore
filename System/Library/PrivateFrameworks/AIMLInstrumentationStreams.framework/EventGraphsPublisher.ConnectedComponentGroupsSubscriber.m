@implementation EventGraphsPublisher.ConnectedComponentGroupsSubscriber

- (void)receiveSubscription:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_downstream), sel_receiveSubscription_, a3);
}

- (int64_t)receiveInput:(id)a3
{
  _TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber *v4;
  int64_t v5;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC71DC8();
  swift_unknownObjectRelease();
  v5 = sub_21DC32EE4((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber *v5;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_upstreamFinished) = 1;
  v4 = a3;
  v5 = self;
  sub_21DC33108();
  objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_downstream), sel_receiveCompletion_, v4);

}

- (void)cancel
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_upstreamFinished) = 1;
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_downstream), sel_cancel);
}

- (_TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber)init
{
  _TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber *result;

  result = (_TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC26AIMLInstrumentationStreams20EventGraphsPublisher34ConnectedComponentGroupsSubscriber_logger;
  v4 = sub_21DC719D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

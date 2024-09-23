@implementation SiriConversationPublisher

- (void)subscribe:(id)a3
{
  _TtC26AIMLInstrumentationStreams25SiriConversationPublisher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC58F20();
  swift_unknownObjectRelease();

}

- (NSArray)bookmarkableUpstreams
{
  _TtC26AIMLInstrumentationStreams25SiriConversationPublisher *v2;
  void *v3;

  v2 = self;
  sub_21DC59048();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A8930);
  v3 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  unint64_t v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A8930);
  v6 = sub_21DC71B70();
  v7 = a3;
  swift_unknownObjectRetain();
  v8 = (void *)sub_21DC60984(v6);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC26AIMLInstrumentationStreams25SiriConversationPublisher)init
{
  _TtC26AIMLInstrumentationStreams25SiriConversationPublisher *result;

  result = (_TtC26AIMLInstrumentationStreams25SiriConversationPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25SiriConversationPublisher_upstream));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25SiriConversationPublisher_inner));
}

@end

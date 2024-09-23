@implementation EventGraphsPublisher

- (void)subscribe:(id)a3
{
  _TtC26AIMLInstrumentationStreams20EventGraphsPublisher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC32C50();
  swift_unknownObjectRelease();

}

- (NSArray)bookmarkableUpstreams
{
  _TtC26AIMLInstrumentationStreams20EventGraphsPublisher *v2;
  void *v3;

  v2 = self;
  sub_21DC32D94();

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
  v8 = (void *)_s26AIMLInstrumentationStreams20EventGraphsPublisherC9publisher4with9upstreams13bookmarkStateSo014BMBookmarkableE0_So12BPSPublisherCyyXlGXcSgSoAH_AKXc_SayAKGSo10BMBookmark_pSgtFZ_0(v7, v6);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC26AIMLInstrumentationStreams20EventGraphsPublisher)init
{
  _TtC26AIMLInstrumentationStreams20EventGraphsPublisher *result;

  result = (_TtC26AIMLInstrumentationStreams20EventGraphsPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_upstream));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_inner));
  v3 = (char *)self + OBJC_IVAR____TtC26AIMLInstrumentationStreams20EventGraphsPublisher_logger;
  v4 = sub_21DC719D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

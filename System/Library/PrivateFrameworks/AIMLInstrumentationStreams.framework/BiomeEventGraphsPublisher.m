@implementation BiomeEventGraphsPublisher

- (void)subscribe:(id)a3
{
  _TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_21DC1D0A8();
  swift_unknownObjectRelease();

}

- (NSArray)bookmarkableUpstreams
{
  _TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher *v2;
  void *v3;

  v2 = self;
  sub_21DC1D1EC();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A8930);
  v3 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher)init
{
  _TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher *result;

  result = (_TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher_mergedStream));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AIMLInstrumentationStreams25BiomeEventGraphsPublisher_inner));
}

@end

@implementation SpotlightOutputSink

- (_TtC21DocumentUnderstanding19SpotlightOutputSink)init
{
  uint64_t v3;
  id v4;
  _TtC21DocumentUnderstanding19SpotlightOutputSink *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC21DocumentUnderstanding19SpotlightOutputSink_iOSOutputSink;
  v4 = objc_allocWithZone((Class)type metadata accessor for SpotlightiOSFileOutputSink());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC21DocumentUnderstanding19SpotlightOutputSink_coreSpotlightOutputSink;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreSpotlightOutputSink()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for SpotlightOutputSink();
  return -[SpotlightOutputSink init](&v8, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding19SpotlightOutputSink_iOSOutputSink));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding19SpotlightOutputSink_coreSpotlightOutputSink));
}

@end

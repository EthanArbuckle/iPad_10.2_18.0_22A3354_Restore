@implementation SpotlightiOSFileOutputSink

- (_TtC21DocumentUnderstanding26SpotlightiOSFileOutputSink)init
{
  uint64_t v3;
  id v4;
  _TtC21DocumentUnderstanding26SpotlightiOSFileOutputSink *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC21DocumentUnderstanding26SpotlightiOSFileOutputSink_coreSpotlightOutputSink;
  v4 = objc_allocWithZone((Class)type metadata accessor for CoreSpotlightOutputSink());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SpotlightiOSFileOutputSink();
  return -[SpotlightiOSFileOutputSink init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding26SpotlightiOSFileOutputSink_coreSpotlightOutputSink));
}

@end

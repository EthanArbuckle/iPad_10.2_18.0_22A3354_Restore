@implementation JSSharedWithYouHighlightsProvider

- (JSValue)isSupported
{
  _TtC7MusicUI33JSSharedWithYouHighlightsProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D5974E0();

  return (JSValue *)v3;
}

- (JSValue)isEnabled
{
  _TtC7MusicUI33JSSharedWithYouHighlightsProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D5976D0();

  return (JSValue *)v3;
}

- (void)startIfNeeded
{
  _TtC7MusicUI33JSSharedWithYouHighlightsProvider *v2;

  v2 = self;
  sub_21D597630();

}

- (JSValue)highlights
{
  _TtC7MusicUI33JSSharedWithYouHighlightsProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D5976D0();

  return (JSValue *)v3;
}

- (_TtC7MusicUI33JSSharedWithYouHighlightsProvider)init
{
  sub_21D59786C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI33JSSharedWithYouHighlightsProvider_highlightsProvider));
}

@end

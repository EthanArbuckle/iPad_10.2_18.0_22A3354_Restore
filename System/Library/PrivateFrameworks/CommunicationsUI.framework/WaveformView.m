@implementation WaveformView

- (void)setNeedsLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[WaveformView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (_TtC16CommunicationsUI12WaveformView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_238399118();
}

- (_TtC16CommunicationsUI12WaveformView)initWithFrame:(CGRect)a3
{
  sub_238398CDC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_localBarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView_remoteBarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___localAudioView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI12WaveformView____lazy_storage___remoteAudioView));
}

@end

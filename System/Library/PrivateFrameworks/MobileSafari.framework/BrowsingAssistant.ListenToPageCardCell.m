@implementation BrowsingAssistant.ListenToPageCardCell

- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell *)sub_18B9A2D14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18B9A5E0C();
}

- (void)playOrPause
{
  _TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell *v2;

  v2 = self;
  sub_18B9A443C();

}

- (void)skipBackward
{
  sub_18B9A4664(self, (uint64_t)a2, (SEL *)&selRef_skipBackward);
}

- (void)skipForward
{
  sub_18B9A4664(self, (uint64_t)a2, (SEL *)&selRef_skipForward);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_speechRatePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_forwardButton));
}

@end

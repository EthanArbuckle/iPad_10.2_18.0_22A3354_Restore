@implementation TabSwitcher.HUD

- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabSwitcher3HUD *)sub_18B987498(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabSwitcher3HUD *)sub_18B987664(a3);
}

- (void)layoutSubviews
{
  _TtCC12MobileSafari11TabSwitcher3HUD *v2;

  v2 = self;
  sub_18B987D40();

}

- (void)sceneDidEnterBackground:(id)a3
{
  sub_18B987F24(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)sceneWillEnterForeground:(id)a3
{
  sub_18B987F24(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void).cxx_destruct
{
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_content, &qword_1EDFEA4E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_captureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_blurrableContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_materialView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_systemSnapshotBackgroundView));
}

@end

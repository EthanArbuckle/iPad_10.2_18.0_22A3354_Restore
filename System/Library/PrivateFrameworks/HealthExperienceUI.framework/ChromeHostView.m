@implementation ChromeHostView

- (_TtC18HealthExperienceUI14ChromeHostView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI14ChromeHostView *)ChromeHostView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI14ChromeHostView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI14ChromeHostView *)ChromeHostView.init(coder:)(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI14ChromeHostView *v6;

  v5 = a3;
  v6 = self;
  sub_1A98C83B4(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI14ChromeHostView_header));
}

@end

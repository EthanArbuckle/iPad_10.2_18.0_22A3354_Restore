@implementation HostedSpecifierViewController

- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI29HostedSpecifierViewController *result;

  result = (_TtC18HealthExperienceUI29HostedSpecifierViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI29HostedSpecifierViewController *v2;

  v2 = self;
  sub_1A968E774();

}

- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI29HostedSpecifierViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI29HostedSpecifierViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HostedSpecifierViewController_specifierViewController));
}

- (void)viewControllerWillEnterAdaptiveModal
{
  _TtC18HealthExperienceUI29HostedSpecifierViewController *v2;

  v2 = self;
  _s18HealthExperienceUI29HostedSpecifierViewControllerC04viewG22WillEnterAdaptiveModalyyF_0();

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;
  id v3;
  _TtC18HealthExperienceUI29HostedSpecifierViewController *v4;

  v4 = self;
  v2 = -[HostedSpecifierViewController traitCollection](v4, sel_traitCollection);
  v3 = objc_msgSend(v2, sel_horizontalSizeClass);

  if (v3 == (id)1)
    sub_1A968E9B4();

}

@end

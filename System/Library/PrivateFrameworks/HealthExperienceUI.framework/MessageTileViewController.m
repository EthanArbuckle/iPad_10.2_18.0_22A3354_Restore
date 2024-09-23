@implementation MessageTileViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI25MessageTileViewController *v2;

  v2 = self;
  sub_1A967BD28();

}

- (_TtC18HealthExperienceUI25MessageTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18HealthExperienceUI25MessageTileViewController *)MessageTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI25MessageTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI25MessageTileViewController *)MessageTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageTileViewController_messageView));
}

@end

@implementation ElectrocardiogramUpdateViewController

- (void)viewDidLoad
{
  _TtC5Heart37ElectrocardiogramUpdateViewController *v2;

  v2 = self;
  sub_231408648();

}

- (NSString)title
{
  uint64_t v2;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v3;
  void *v4;

  v2 = qword_25415E610;
  v3 = self;
  if (v2 != -1)
    swift_once();
  sub_231411374();

  v4 = (void *)sub_23141468C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_2314146BC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_231409788(v5, v7, a4);
}

- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithCoder:(id)a3
{
  return (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_231409920(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_2312CEBD4((uint64_t)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_context, (uint64_t (*)(_QWORD))sub_2313EF504);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController____lazy_storage___tileView));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_detail;
  v4 = sub_231412718();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_deselectionBehavior;
  v6 = sub_231412970();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)didDismissOnboarding
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager) = 0;

}

- (void)didCompleteOnboarding
{
  void *v2;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v3;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v4;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v5;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v6;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v7;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v8;
  _TtC5Heart37ElectrocardiogramUpdateViewController *v9;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager) = 0;
  v9 = self;

  v3 = (_TtC5Heart37ElectrocardiogramUpdateViewController *)-[ElectrocardiogramUpdateViewController tabBarController](v9, sel_tabBarController);
  if (v3)
  {
    v4 = v3;
    v5 = (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_2314090E4();
    if (v5)
    {
      v6 = v5;
      sub_231328348(v5, 0);

      v7 = v4;
      v4 = v6;
    }
    else
    {
      v7 = v9;
    }

    v8 = v4;
  }
  else
  {
    v8 = v9;
  }

}

@end

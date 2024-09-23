@implementation ActivityIndicatorViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI31ActivityIndicatorViewController *v2;

  v2 = self;
  sub_1A97AB6C4();

}

- (void)didTapCancel:(id)a3
{
  _TtC18HealthExperienceUI31ActivityIndicatorViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[ActivityIndicatorViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC18HealthExperienceUI31ActivityIndicatorViewController *v9;
  objc_super v11;

  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
    v6 = a4;
    v7 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityIndicatorViewController();
  v9 = -[ActivityIndicatorViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC18HealthExperienceUI31ActivityIndicatorViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityIndicatorViewController();
  return -[ActivityIndicatorViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ActivityIndicatorViewController____lazy_storage___cancelBarButtonItem));
}

@end

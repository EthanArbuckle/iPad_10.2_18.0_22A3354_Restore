@implementation HealthDetailsViewController

- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI27HealthDetailsViewController *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_shouldSaveItems) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController____lazy_storage___healthDetailsDataSource) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI27HealthDetailsViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI27HealthDetailsViewController *v2;

  v2 = self;
  sub_1A9A39590();

}

- (void)resetCharacteristics
{
  _TtC18HealthExperienceUI27HealthDetailsViewController *v2;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_shouldSaveItems) = 0;
  v2 = self;
  _s18HealthExperienceUI0A21DetailsViewControllerC10dataSource3forAA021CompoundSectionedDataH0CSo06UIViewF0C_tF_0();
  swift_retain();
  swift_release();
  sub_1A990635C();
  swift_release();
  -[HealthDetailsViewController setEditing:animated:](v2, sel_setEditing_animated_, 0, 1);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC18HealthExperienceUI27HealthDetailsViewController *v6;

  v6 = self;
  sub_1A9A397D8(a3, a4);

}

- (_TtC18HealthExperienceUI27HealthDetailsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI27HealthDetailsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI27HealthDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27HealthDetailsViewController_healthStore));
  swift_release();
}

@end

@implementation ProfileSharingWithYouOptionsViewController

- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *result;

  result = (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfileSharingWithYouOptionsViewController();
  v2 = v3.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A9818138();

}

- (void)dismissOptions:(id)a3
{
  _TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[ProfileSharingWithYouOptionsViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI42ProfileSharingWithYouOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end

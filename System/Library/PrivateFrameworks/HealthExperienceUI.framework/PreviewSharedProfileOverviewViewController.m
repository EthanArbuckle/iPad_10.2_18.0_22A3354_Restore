@implementation PreviewSharedProfileOverviewViewController

- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9672AB4();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PreviewSharedProfileOverviewViewController();
  v2 = v6.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1A9671F9C();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  _TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *v2;

  v2 = self;
  sub_1A9671E00();

}

- (void)doneButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[PreviewSharedProfileOverviewViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController_gradientColorProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController____lazy_storage___previewSummariesLabel));
}

- (void)ttrButtonTapped
{
  uint64_t v3;
  _TtC18HealthExperienceUI42PreviewSharedProfileOverviewViewController *v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  sub_1A9958B20(0xD000000000000016, 0x80000001A9AE68C0, (uint64_t)sub_1A99594F8, v3);

  swift_release();
}

@end

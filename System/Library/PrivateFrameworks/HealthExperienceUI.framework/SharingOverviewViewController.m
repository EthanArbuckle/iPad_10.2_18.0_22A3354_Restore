@implementation SharingOverviewViewController

- (NSString)sidebarSelectionIdentifier
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_sidebarSelectionIdentifier))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18HealthExperienceUI29SharingOverviewViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController____lazy_storage___store) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_syncObserver) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_sidebarSelectionIdentifier);
  *v4 = 0xD000000000000019;
  v4[1] = 0x80000001A9AC8F00;
  v5 = a3;

  result = (_TtC18HealthExperienceUI29SharingOverviewViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI29SharingOverviewViewController *v2;

  v2 = self;
  sub_1A964C558();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SharingOverviewViewController();
  v4 = v7.receiver;
  -[CompoundDataSourceCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = objc_msgSend(v4, sel_userActivity, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, sel_submitUserActivityForRestoration_, v5);

    v4 = v6;
  }

}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI29SharingOverviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A964CBAC((uint64_t)v4);

}

- (_TtC18HealthExperienceUI29SharingOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI29SharingOverviewViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI29SharingOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SharingOverviewViewController____lazy_storage___store));
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)ttrButtonTapped
{
  uint64_t v3;
  _TtC18HealthExperienceUI29SharingOverviewViewController *v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  sub_1A9958380(0x532068746C616548, 0xEE00676E69726168, (uint64_t)sub_1A9959C84, v3);

  swift_release();
}

@end

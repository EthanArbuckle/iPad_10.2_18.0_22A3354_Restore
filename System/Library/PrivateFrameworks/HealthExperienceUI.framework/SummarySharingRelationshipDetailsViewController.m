@implementation SummarySharingRelationshipDetailsViewController

- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A96D9C64();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *v2;

  v2 = self;
  sub_1A96D0F00();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A96D12D0((uint64_t)a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A96D1538((uint64_t)v4);

}

- (void)didTapCancel
{
  -[SummarySharingRelationshipDetailsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_healthExperienceStore);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_sharingEntryStore));
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_sharingProfileInformation;
  v4 = sub_1A9A9346C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_flow, type metadata accessor for SummarySharingSelectionFlow);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController____lazy_storage___doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController____lazy_storage___activitySpinnerItem));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)doneButtonTapped
{
  _TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *v2;

  v2 = self;
  sub_1A96D2AC0();

}

@end

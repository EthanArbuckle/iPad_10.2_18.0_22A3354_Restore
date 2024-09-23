@implementation SummarySharingAlertsSelectionViewController

- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_cancellables) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = a3;

  result = (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *v2;

  v2 = self;
  sub_1A996E67C();

}

- (void)done
{
  _TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *v2;

  v2 = self;
  sub_1A996E810();

}

- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_delegate);
  swift_release();
  swift_bridgeObjectRelease();
}

@end

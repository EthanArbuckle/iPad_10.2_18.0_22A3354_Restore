@implementation ImprovementDataCollectionOptInViewController

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *v2;

  v2 = self;
  sub_1BC36F3CC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ImprovementDataCollectionOptInViewController();
  v4 = v6.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  if (qword_1ED6A3198 != -1)
    swift_once();
  v5 = (id)qword_1ED6A42A0;
  sub_1BC4E5384(1, 2, 0);

}

- (void)hxui_primaryFooterButtonTapped
{
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *v2;

  v2 = self;
  sub_1BC36FA34();

}

- (void)hxui_secondaryFooterButtonTapped
{
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *v2;

  v2 = self;
  sub_1BC36FD70();

}

- (void)accessoryButtonTapped
{
  uint64_t v2;
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *v3;
  id v4;
  id v5;
  id v6;

  v2 = qword_1ED6A31B0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = objc_msgSend((id)qword_1ED6A4670, sel_makeImproveHealthRecordsPrivacyPresenter);
  v5 = -[ImprovementDataCollectionOptInViewController navigationController](v3, sel_navigationController);
  objc_msgSend(v4, sel_presentInNavigationStack_, v5);

  if (qword_1ED6A3198 != -1)
    swift_once();
  v6 = (id)qword_1ED6A42A0;
  sub_1BC4E5384(1, 2, 1);

}

- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *result;

  result = (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *result;

  v6 = a5;
  result = (_TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI44ImprovementDataCollectionOptInViewController_account));
}

@end

@implementation OnboardingTileViewController

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithCoder:(id)a3
{
  _TtC15HealthRecordsUI28OnboardingTileViewController *result;

  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI28OnboardingTileViewController *v2;

  v2 = self;
  sub_1BC4BB8B8();

}

- (void)closeButtonTapped
{
  -[OnboardingTileViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)tapToRadar:(id)a3
{
  _TtC15HealthRecordsUI28OnboardingTileViewController *v4;
  _TtC15HealthRecordsUI28OnboardingTileViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1BC39BD2C((uint64_t)v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI28OnboardingTileViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC4BC320();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC15HealthRecordsUI28OnboardingTileViewController *v12;
  id v13;
  id v14;
  uint64_t v15;

  v8 = sub_1BC62A970();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  sub_1BC62AEE0();
  if (swift_dynamicCastClass())
  {
    v12 = self;
    v13 = a3;
    v14 = a4;
    sub_1BC62AEC8();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15HealthRecordsUI28OnboardingTileViewController *v14;
  uint64_t v15;

  v8 = sub_1BC62A970();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  sub_1BC62AEE0();
  if (swift_dynamicCastClass())
  {
    v12 = a3;
    v13 = a4;
    v14 = self;
    sub_1BC62AEC8();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC15HealthRecordsUI28OnboardingTileViewController *result;

  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI28OnboardingTileViewController *result;

  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI28OnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI28OnboardingTileViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI28OnboardingTileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28OnboardingTileViewController_profile));
}

@end

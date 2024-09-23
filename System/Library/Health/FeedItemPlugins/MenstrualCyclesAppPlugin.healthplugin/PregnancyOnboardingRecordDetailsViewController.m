@implementation PregnancyOnboardingRecordDetailsViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *v2;

  v2 = self;
  sub_23192D4DC();

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *v9;
  _BYTE v10[16];
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v4 = sub_231C9D150();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController_viewModel);
  v9 = self;
  sub_231C9D06C();
  swift_getKeyPath();
  v11 = v8;
  v12 = v7;
  v13 = v8;
  sub_23190BE38((unint64_t *)&qword_255F3E500, (uint64_t (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel, (uint64_t)&unk_231CB5BC8);
  sub_231C9D450();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);

}

- (void)hxui_primaryFooterButtonTapped
{
  char v2;
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *v3;

  v2 = *((_BYTE *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController_onboardingStep);
  v3 = self;
  swift_retain();
  sub_231C67D00(v2, 2);

  swift_release();
}

- (void)hxui_secondaryFooterButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *v2;

  v2 = self;
  sub_23192DE48();

}

- (void)hxui_cancelButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *v2;

  v2 = self;
  sub_23192DF0C();

}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController____lazy_storage___addPregnancyButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController____lazy_storage___hostingController));
}

@end

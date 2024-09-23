@implementation VerificationSymptomDateEntryViewController

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v2;

  v2 = self;
  VerificationSymptomDateEntryViewController.viewDidLoad()();

}

- (void)updateSymptomsDateCell:(id)a3
{
  id v4;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21CCF8F88(v4);

}

- (void)datePickerValueChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255326288);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v8, sel_date);
  sub_21CD76328();

  v11 = sub_21CD76340();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 1, v11);
  v12 = (uint64_t)v9
      + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_symptomOnsetDate;
  swift_beginAccess();
  sub_21CCFC7C4((uint64_t)v7, v12);
  swift_endAccess();
  sub_21CCF7860();
  sub_21CCFD41C((uint64_t)v7, (uint64_t *)&unk_255326288);

}

- (void)viewDidLayoutSubviews
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v7;
  id v8;
  uint64_t v9;
  _BOOL8 v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255326278);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v7 = self;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  v8 = objc_retain(*(id *)((char *)&v7->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_primaryButton));
  sub_21CCF7A30(v6);
  v9 = type metadata accessor for SymptomOnset(0);
  v10 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v6, 1, v9) != 1;
  sub_21CCFD41C((uint64_t)v6, (uint64_t *)&unk_255326278);
  objc_msgSend(v8, sel_setEnabled_, v10);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v11;
  uint64_t v13;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_21CCFC700();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v11;
  uint64_t v12;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  VerificationSymptomDateEntryViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_21CCFC854(a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_21CCFC944(a4);
  v9 = v8;

  return v9;
}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v2;

  v2 = self;
  sub_21CCF9C00();

}

- (void)didTapCancel
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *result;

  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *result;

  v5 = a5;
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *result;

  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_healthAgencyModel));
  sub_21CCFD41C((uint64_t)self+ OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_symptomOnsetDate, (uint64_t *)&unk_255326288);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_secondaryButton));
}

@end

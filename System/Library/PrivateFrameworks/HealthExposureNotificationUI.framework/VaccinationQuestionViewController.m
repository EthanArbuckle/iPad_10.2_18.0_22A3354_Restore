@implementation VaccinationQuestionViewController

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v2;

  v2 = self;
  VaccinationQuestionViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_primaryButton], sel_setEnabled_, v2[OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_isVaccinated] != 2, v3.receiver, v3.super_class);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  BOOL result;
  void *v11;
  id v12;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  unsigned __int8 v17;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_21CD763B8();
  v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_dataSource);
  if (v11)
  {
    v12 = a3;
    v13 = self;
    v14 = v11;
    sub_21CD7649C();

    if (v17 - 1 < 2)
    {
      v15 = 1;
LABEL_6:

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return v15;
    }
    if (!v17)
    {
      v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v11;
  uint64_t v12;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  VaccinationQuestionViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_21CD6EBC0(a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_21CD6ECAC(a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v11;
  double v12;
  double v13;
  uint64_t v15;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  VaccinationQuestionViewController.tableView(_:heightForRowAt:)();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)didTapPrimaryButton
{
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v2;

  v2 = self;
  sub_21CD6E148();

}

- (void)didTapSecondaryButton
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();

}

- (void)didTapCancel
{
  uint64_t v3;
  void (*v4)(void);
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *v5;

  v3 = *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();

}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *result;

  result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *result;

  v5 = a5;
  result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *result;

  result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *result;

  v6 = a5;
  result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_vaccinatedCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_notVaccinatedCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_secondaryButton));
}

@end

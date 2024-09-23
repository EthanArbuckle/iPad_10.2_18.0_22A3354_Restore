@implementation DeviationsFactorsConfirmationViewController

- (void)viewWillLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v2;

  v2 = self;
  sub_231B7D2E0();

}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v2;

  v2 = self;
  sub_231B7D3CC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[OBTableWelcomeController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNeedsLayout);

    v7 = objc_msgSend(v4, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_layoutIfNeeded);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)nextButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v2;

  v2 = self;
  sub_231B7E294();

}

- (void)cancel
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v2;

  v2 = self;
  sub_231B7E638();

}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *result;

  v5 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_nextButton));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_scaleFactorConfiguration);
  swift_bridgeObjectRelease();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231B7EBD4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v7;
  char *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_231B7F950((char *)a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double result;

  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController_dataSource))
  {
    v6 = a3;
    v7 = self;
    swift_retain();
    sub_2319E5150(a4);
    v9 = v8;
    swift_release();
    swift_bridgeObjectRelease();
    if (v9)
      v10 = *MEMORY[0x24BEBE770];
    else
      v10 = 0.0;

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin43DeviationsFactorsConfirmationViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_231B7F2B4(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x24BEBE770];
  if (a4)
    return 10.0;
  return result;
}

@end

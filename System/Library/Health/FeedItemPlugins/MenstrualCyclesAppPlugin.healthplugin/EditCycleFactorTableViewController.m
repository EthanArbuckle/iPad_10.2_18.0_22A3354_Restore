@implementation EditCycleFactorTableViewController

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231B7CC64();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  int64_t v5;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_sections);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return self;
  }
  if ((*(_BYTE *)(v4 + a4 + 32) & 1) != 0)
  {
    v5 = self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_deleteRows;
  }
  else
  {
    v5 = self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_dateRows;
    swift_beginAccess();
  }
  return *(_QWORD *)(*(_QWORD *)v5 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231B7766C();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231B78558(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)doneSaveAndDismiss
{
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v2;

  v2 = self;
  sub_231B79DD0();

}

- (void)cancelAndDismiss
{
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v2;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v3;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v4;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *v5;

  v5 = self;
  v2 = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)-[EditCycleFactorTableViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[EditCycleFactorTableViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithStyle:(int64_t)a3
{
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_factorSample));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_analysisProvider));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_startDate;
  v4 = sub_231C9D150();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_endDate, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController____lazy_storage___doneBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController____lazy_storage___cancelBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34EditCycleFactorTableViewController_nanoSyncControl));
}

@end

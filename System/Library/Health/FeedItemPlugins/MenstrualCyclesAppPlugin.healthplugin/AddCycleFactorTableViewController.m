@implementation AddCycleFactorTableViewController

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231BFF100();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *v2;

  v2 = self;
  sub_231BF7C94();

}

- (void)saveNewFactorAndDismiss
{
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *v2;

  v2 = self;
  sub_231BF7E68();

}

- (void)cancelAndDismiss
{
  -[AddCycleFactorTableViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_231BFF274(a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *v11;
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
  sub_231BF91F8();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_231BFA5CC(v6, a4);
  v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231BFAB38(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithStyle:(int64_t)a3
{
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController____lazy_storage___addBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController____lazy_storage___cancelBarButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_startDate;
  v4 = sub_231C9D150();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_endDate, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_manualEntryItemContraceptive));
  swift_release();
}

@end

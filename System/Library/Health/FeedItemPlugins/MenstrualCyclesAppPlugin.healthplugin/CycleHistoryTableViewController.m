@implementation CycleHistoryTableViewController

- (BOOL)axFilterSelected
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_selectedFilter) != 51;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231B30798();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v2;

  v2 = self;
  sub_231B2C820();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleHistoryTableViewController();
  v4 = (char *)v5.receiver;
  -[CycleHistoryTableViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_presentedPDFProvider] = 0;

  swift_release();
}

- (void)respondToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v2;

  v2 = self;
  sub_231B2E47C();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryTableViewController();
  v2 = v3.receiver;
  -[CycleHistoryTableViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  sub_231B2E47C();

}

- (void)pushFilterView
{
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v2;

  v2 = self;
  sub_231B2EB78();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_231B2F9AC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_231B2ED14(v6, a4);
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
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231B2F15C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_years;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_231B30878(a4);

  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithStyle:(int64_t)a3
{
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController____lazy_storage___yearDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_analysis));
  sub_23191BE64(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController____lazy_storage___healthStore));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_calendarCache));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_gregorianCalendar;
  v4 = sub_231C9D36C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_today;
  v6 = sub_231CA1A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_analysisProvider));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_eventSubmissionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_headerView));
  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231B30A10(v7);

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

@end

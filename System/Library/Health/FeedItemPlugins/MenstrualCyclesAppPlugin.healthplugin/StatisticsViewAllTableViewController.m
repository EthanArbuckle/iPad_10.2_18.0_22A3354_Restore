@implementation StatisticsViewAllTableViewController

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231AF8B20();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v2;

  v2 = self;
  sub_231AF4CBC();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_231AF583C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_231AF6EEC(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  sub_231AF8C28(a4);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  char *v6;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v7;
  void *v8;
  void *v9;

  v6 = (char *)a3;
  v7 = self;
  sub_231AF7C3C(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  char *v5;
  double result;

  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_sections;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  result = *MEMORY[0x24BEBE770];
  if (!*(_BYTE *)(*(_QWORD *)v5 + a4 + 32))
    return 0.0;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_231AF8CE0(a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v14;
  uint64_t v15;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  objc_msgSend(v13, sel__setShouldHaveFullLengthBottomSeparator_, 0);
  objc_msgSend(v13, sel__setShouldHaveFullLengthTopSeparator_, 0);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithStyle:(int64_t)a3
{
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_statistics));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_analysis));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_analysisProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController____lazy_storage___yearsMonthsDaysFormatter));
  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231AF8D8C(v7);

}

@end

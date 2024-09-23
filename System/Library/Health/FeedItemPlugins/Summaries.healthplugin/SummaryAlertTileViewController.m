@implementation SummaryAlertTileViewController

- (void)viewDidLoad
{
  _TtC9Summaries30SummaryAlertTileViewController *v2;

  v2 = self;
  sub_2321DBF3C();

}

- (_TtC9Summaries30SummaryAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_232200EC4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9Summaries30SummaryAlertTileViewController *)sub_2321DD370(v5, v7, a4);
}

- (_TtC9Summaries30SummaryAlertTileViewController)initWithCoder:(id)a3
{
  return (_TtC9Summaries30SummaryAlertTileViewController *)sub_2321DD4C0(a3);
}

- (void).cxx_destruct
{
  sub_23200040C((uint64_t)self + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_dataModel, &qword_255FA1468, (void (*)(uint64_t))MEMORY[0x24BE43328]);
  sub_2320254AC((uint64_t)self + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController_context, &qword_255FA1490, &qword_255FA1498);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Summaries30SummaryAlertTileViewController____lazy_storage___tileView));
  swift_release();
}

- (NSString)title
{
  _TtC9Summaries30SummaryAlertTileViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2321DDACC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_232200E94();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end

@implementation AccountStatusUpgradeSummaryTileFeedItemViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountStatusUpgradeSummaryTileFeedItemViewController(0);
  v4 = v6.receiver;
  -[AccountStatusUpgradeSummaryTileFeedItemViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  sub_2312629EC();
  v5 = (void *)sub_2312629E0();
  sub_231258E18();
  sub_2312629BC();

}

- (NSString)title
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *v12;
  void *v13;
  uint64_t v15;

  v3 = sub_231262B60();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8];
  sub_2311735E0(0, (unint64_t *)&qword_254151918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - v9;
  v11 = sub_231261EAC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = self;
  sub_231262B54();
  sub_2312632EC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_231189628((uint64_t)v10, (unint64_t *)&qword_254151918, v7);

  v13 = (void *)sub_23126406C();
  swift_bridgeObjectRelease();
  return (NSString *)v13;
}

- (void)viewDidLoad
{
  _TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *v2;

  v2 = self;
  sub_23125AA54();

}

- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23126409C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *)sub_23125C484(v5, v7, a4);
}

- (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController *)sub_23125C620(a3);
}

- (void).cxx_destruct
{
  sub_231189628((uint64_t)self + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_accountData, &qword_255EB85D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE498E0]);
  sub_231178498((uint64_t)self + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_context, (uint64_t (*)(_QWORD))sub_2311BA2F0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords53AccountStatusUpgradeSummaryTileFeedItemViewController_tileView));
}

@end

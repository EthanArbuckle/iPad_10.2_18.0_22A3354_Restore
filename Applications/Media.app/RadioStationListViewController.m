@implementation RadioStationListViewController

- (void)viewDidLoad
{
  _TtC5Media30RadioStationListViewController *v2;

  v2 = self;
  sub_100010E14();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Media30RadioStationListViewController *v4;

  v4 = self;
  sub_10001169C(a3);

}

- (void)invalidate
{
  _TtC5Media30RadioStationListViewController *v2;

  v2 = self;
  sub_1000118D0();

}

- (void)nowPlayingTapped
{
  uint64_t Strong;
  _TtC5Media30RadioStationListViewController *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Media30RadioStationListViewController_carManager);
  if (Strong)
  {
    v5 = (id)Strong;
    v4 = self;
    sub_10000B4B0();

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media30RadioStationListViewController *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100011ED0(v11, v10, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = UITableViewAutomaticDimension;
  if ((*(_BYTE **)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Media30RadioStationListViewController_dataSource))[OBJC_IVAR____TtC5Media22RadioStationDataSource_groupingStrategy])
    return 0.0;
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media30RadioStationListViewController *v12;
  double v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000126C4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media30RadioStationListViewController_carManager);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media30RadioStationListViewController_cancelSet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media30RadioStationListViewController_dataSource));
}

@end

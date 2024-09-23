@implementation B389DoneViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService22B389DoneViewController *v4;

  v4 = self;
  sub_100052FE8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389DoneViewController();
  -[B389DoneViewController viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (void)dismissPressed
{
  uint64_t v2;
  _TtC18SharingViewService22B389DoneViewController *v3;

  v3 = self;
  sub_100054128((uint64_t)v3, v2);

}

- (void)customizePressed
{
  _TtC18SharingViewService22B389DoneViewController *v2;

  v2 = self;
  sub_10005429C();

}

- (_TtC18SharingViewService22B389DoneViewController)initWithMainController:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC18SharingViewService22B389DoneViewController *v8;
  uint64_t v9;
  _TtC18SharingViewService22B389DoneViewController *v10;
  objc_super v12;

  v5 = OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_tv;
  v6 = objc_allocWithZone((Class)UITableView);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:style:", 0, 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_mapViewController) = 0;
  v9 = OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_data;
  *(Class *)((char *)&v8->super.super.super.super.isa + v9) = (Class)sub_1000529A4();

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for B389DoneViewController();
  v10 = -[SVSBaseViewController initWithMainController:](&v12, "initWithMainController:", v7);

  return v10;
}

- (_TtC18SharingViewService22B389DoneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService22B389DoneViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100054A78);
}

- (_TtC18SharingViewService22B389DoneViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService22B389DoneViewController *)sub_100054BF0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_tv));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_mapViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_data));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_data))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18SharingViewService22B389DoneViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100054D60(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

@end

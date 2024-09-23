@implementation HeadphoneAnnounceCustomizeViewController

- (_TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  return (_TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController *)sub_100059CB4(a3, v5);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[HeadphoneAnnounceCustomizeViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{

  sub_1000558E8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController_viewModel]);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController_presenter]);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_10005B024(a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC20HeadphoneProxService40HeadphoneAnnounceCustomizeViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_10005A6AC(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = UITableViewAutomaticDimension;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
    return 0.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return sub_10005B0E8(a4);
}

@end

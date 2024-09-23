@implementation VSNotificationDetailViewController

- (void)viewDidLoad
{
  _TtC12AutoSettings34VSNotificationDetailViewController *v2;

  v2 = self;
  sub_10000365C();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1000038F0(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))sub_1000045B8);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1000038F0(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (void (*)(id))sub_1000046AC);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(_QWORD *)(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions]
                   + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12AutoSettings34VSNotificationDetailViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100003974(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 44.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC12AutoSettings34VSNotificationDetailViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_10000593C(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12AutoSettings34VSNotificationDetailViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100003CF4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)dismissPT
{
  _TtC12AutoSettings34VSNotificationDetailViewController *v2;

  v2 = self;
  sub_1000046AC();

}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC12AutoSettings34VSNotificationDetailViewController *v9;
  char *v10;
  uint64_t v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  v10 = sub_1000031E4();
  v11 = *(_QWORD *)&v9->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v9->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v10;
  swift_bridgeObjectRelease(v11);
  objc_msgSend(*(id *)&v9->superclass_opaque[direct field offset for CAFUITableViewController.tableView], "reloadData");

  swift_bridgeObjectRelease(v7);
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC12AutoSettings34VSNotificationDetailViewController *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = sub_100005888((uint64_t *)&unk_100027E70);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  v14 = sub_1000031E4();
  v15 = *(_QWORD *)&v13->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v13->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v14;
  swift_bridgeObjectRelease(v15);
  objc_msgSend(*(id *)&v13->superclass_opaque[direct field offset for CAFUITableViewController.tableView], "reloadData");

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)historicalNotificationService:(void *)a3 didUpdateName:
{
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;

  v4 = a3;
  v7 = a1;
  v5 = sub_1000031E4();
  v6 = *(_QWORD *)&v7[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v7[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v5;
  swift_bridgeObjectRelease(v6);
  objc_msgSend(*(id *)&v7[direct field offset for CAFUITableViewController.tableView], "reloadData");

}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5;
  char *v6;
  uint64_t v7;
  _TtC12AutoSettings34VSNotificationDetailViewController *v8;

  v5 = a3;
  v8 = self;
  v6 = sub_1000031E4();
  v7 = *(_QWORD *)&v8->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v8->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v6;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(*(id *)&v8->superclass_opaque[direct field offset for CAFUITableViewController.tableView], "reloadData");

}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  _TtC12AutoSettings34VSNotificationDetailViewController *v10;

  v6 = a3;
  v7 = a4;
  v10 = self;
  v8 = sub_1000031E4();
  v9 = *(_QWORD *)&v10->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v10->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v8;
  swift_bridgeObjectRelease(v9);
  objc_msgSend(*(id *)&v10->superclass_opaque[direct field offset for CAFUITableViewController.tableView], "reloadData");

}

- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v5;
  char *v6;
  uint64_t v7;
  _TtC12AutoSettings34VSNotificationDetailViewController *v8;

  v5 = a3;
  v8 = self;
  v6 = sub_1000031E4();
  v7 = *(_QWORD *)&v8->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  *(_QWORD *)&v8->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = v6;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(*(id *)&v8->superclass_opaque[direct field offset for CAFUITableViewController.tableView], "reloadData");

}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC12AutoSettings34VSNotificationDetailViewController *v6;
  id v7;
  id v8;

  if (a4
    && (self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] & 1) == 0)
  {
    self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] = 1;
    v5 = a3;
    v6 = self;
    v8 = -[VSNotificationDetailViewController navigationController](v6, "navigationController");
    v7 = objc_msgSend(v8, "popViewControllerAnimated:", 1);

  }
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier
                                                              + 8]);
}

@end

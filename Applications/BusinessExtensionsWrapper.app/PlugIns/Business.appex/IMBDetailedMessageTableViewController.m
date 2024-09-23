@implementation IMBDetailedMessageTableViewController

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IMBDetailedMessageTableViewController();
  v2 = v4.receiver;
  v3 = -[IMBDetailedMessageViewController viewDidLoad](&v4, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x128))(v3);
  sub_100082E4C();

}

- (void)viewDidLayoutSubviews
{
  _TtC8Business37IMBDetailedMessageTableViewController *v2;

  v2 = self;
  sub_100083884();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002BLL, 0x80000001000BACB0, "Business/IMBDetailedMessageTableViewController.swift", 52, 2, 159, 0);
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000026, 0x80000001000BAC80, "Business/IMBDetailedMessageTableViewController.swift", 52, 2, 163, 0);
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id result;

  type metadata accessor for IndexPath(0, a2, a3);
  __chkstk_darwin();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000022, 0x80000001000BAC50, "Business/IMBDetailedMessageTableViewController.swift", 52, 2, 167, 0);
  __break(1u);
  return result;
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
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return objc_msgSend(objc_allocWithZone((Class)UIView), "init");
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (_TtC8Business37IMBDetailedMessageTableViewController)initWithCoder:(id)a3
{
  return (_TtC8Business37IMBDetailedMessageTableViewController *)sub_100083D38(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___tableViewHeader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarViewController));
}

@end

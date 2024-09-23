@implementation HomePodSetupWiFiInfoTableView

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC14HDSViewService29HomePodSetupWiFiInfoTableView *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100080FA8(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements) = (Class)_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HomePodSetupWiFiInfoTableView();
  return -[HomePodSetupWiFiInfoTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC14HDSViewService29HomePodSetupWiFiInfoTableView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupWiFiInfoTableView();
  return -[HomePodSetupWiFiInfoTableView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC14HDSViewService29HomePodSetupWiFiInfoTableView_elements));
}

@end

@implementation ConsentNoticeTableViewController

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t (*v11)(id, int64_t, uint64_t, uint64_t);
  id v12;
  id v13;
  int64_t v14;

  if (!a4)
    return 1;
  v4 = (void *)self;
  v5 = self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate;
  v6 = *(_QWORD *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate);
  if (v6)
  {
    v7 = a4 - 1;
    if (!__OFSUB__(a4, 1))
    {
      ObjectType = swift_getObjectType(*(_QWORD *)(self+ OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate), a2);
      v10 = *(_QWORD *)(v5 + 8);
      v11 = *(uint64_t (**)(id, int64_t, uint64_t, uint64_t))(v10 + 16);
      v12 = a3;
      v13 = v4;
      swift_unknownObjectRetain(v6);
      v14 = v11(v12, v7, ObjectType, v10);

      swift_unknownObjectRelease(v6);
      return v14;
    }
    __break(1u);
  }
  __break(1u);
  return self;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics32ConsentNoticeTableViewController *v12;
  double v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000A0FCC((uint64_t)v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  BOOL v7;

  if (!*(_QWORD *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate))
    goto LABEL_5;
  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(self+ OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate), a2);
  v6 = (*(uint64_t (**)(id, uint64_t, uint64_t))(v4 + 40))(a3, ObjectType, v4);
  v7 = __OFADD__(v6, 1);
  self = v6 + 1;
  if (v7)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics32ConsentNoticeTableViewController *v12;
  char *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000A1350((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics32ConsentNoticeTableViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000A1530(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return a4 != 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = IndexPath.section.getter(v9) != 0;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (char)a4;
}

- (_TtC11Diagnostics32ConsentNoticeTableViewController)init
{
  return (_TtC11Diagnostics32ConsentNoticeTableViewController *)sub_1000A17A0();
}

- (_TtC11Diagnostics32ConsentNoticeTableViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics32ConsentNoticeTableViewController *)sub_1000A18A4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_tableView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController_consentTableViewDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics32ConsentNoticeTableViewController____lazy_storage___headerCell));
}

@end

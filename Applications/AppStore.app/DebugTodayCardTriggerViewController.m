@implementation DebugTodayCardTriggerViewController

- (_TtC8AppStore35DebugTodayCardTriggerViewController)initWithCoder:(id)a3
{
  _TtC8AppStore35DebugTodayCardTriggerViewController *result;

  result = (_TtC8AppStore35DebugTodayCardTriggerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/DebugTodayCardTriggerViewController.swift", 50, 2, 72, 0);
  __break(1u);
  return result;
}

- (void)refreshContent
{
  _TtC8AppStore35DebugTodayCardTriggerViewController *v2;

  v2 = self;
  sub_10018BF40();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_sections))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_sections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
    {
      v5 = *(_QWORD *)(v4 + 32 * a4 + 40);
      swift_bridgeObjectRetain(v5);
      v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v5);
      return v6;
    }
  }
  __break(1u);
  return self;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_sections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 32 * a4 + 48) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v11;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v12;
  NSString v13;
  id v14;
  id v15;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC8AppStore35DebugTodayCardTriggerViewController *)a3;
  v12 = self;
  v13 = String._bridgeToObjectiveC()();
  v14 = -[DebugTodayCardTriggerViewController dequeueReusableCellWithIdentifier:](v11, "dequeueReusableCellWithIdentifier:", v13);

  if (!v14)
  {
    v15 = objc_allocWithZone((Class)UITableViewCell);
    v16 = (_TtC8AppStore35DebugTodayCardTriggerViewController *)String._bridgeToObjectiveC()();
    v14 = objc_msgSend(v15, "initWithStyle:reuseIdentifier:", 3, v16);

    v11 = v12;
    v12 = v16;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v15;
  __n128 v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10018D4C0(v14, v16);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v15;
  __n128 v16;
  id result;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  Class isa;
  uint64_t v22;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10007B804((uint64_t *)&unk_100834600);
  __chkstk_darwin(v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  result = (id)IndexPath.section.getter(v16);
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  v18 = *(uint64_t *)((char *)&v15->super.super.super.super.isa
                   + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_sections);
  if ((unint64_t)result >= *(_QWORD *)(v18 + 16))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (*(_BYTE *)(v18 + 32 * (_QWORD)result + 56) == 2)
  {
    v19 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
    v19 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v13, v19, 1, v7);

  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
    return 0;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v20(v13, v7);
  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore35DebugTodayCardTriggerViewController *v12;
  __n128 v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10018D648(v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC8AppStore35DebugTodayCardTriggerViewController)initWithStyle:(int64_t)a3
{
  _TtC8AppStore35DebugTodayCardTriggerViewController *result;

  result = (_TtC8AppStore35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.DebugTodayCardTriggerViewController", 44, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore35DebugTodayCardTriggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore35DebugTodayCardTriggerViewController *result;

  v4 = a4;
  result = (_TtC8AppStore35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.DebugTodayCardTriggerViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_triggerController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35DebugTodayCardTriggerViewController_sections));
}

@end

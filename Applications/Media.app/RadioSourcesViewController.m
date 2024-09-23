@implementation RadioSourcesViewController

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioSourcesViewController();
  v2 = (char *)v3.receiver;
  -[RadioPopoverViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView], "setDataSource:", v2, v3.receiver, v3.super_class);

}

- (void)invalidate
{
  uint64_t *v2;
  uint64_t v3;
  _BYTE v4[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media26RadioSourcesViewController_cancelSet);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media26RadioSourcesViewController_cancelSet, v4, 1, 0);
  v3 = *v2;
  *v2 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t Strong;
  int64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Media26RadioSourcesViewController *v10;
  uint64_t v11;
  uint64_t v13;

  Strong = swift_weakLoadStrong((char *)self + OBJC_IVAR____TtC5Media26RadioSourcesViewController_nowPlaying);
  v7 = Strong;
  if (Strong)
  {
    v8 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Media18NowPlayingObserver_mediaSourceObservers);
    swift_bridgeObjectRetain(v8);
    v9 = a3;
    v10 = self;
    swift_release(v7, v11);
    if (v8)
    {
      if ((unint64_t)v8 >> 62)
      {
        if (v8 >= 0)
          v13 = v8 & 0xFFFFFFFFFFFFFF8;
        else
          v13 = v8;
        swift_bridgeObjectRetain(v8);
        v7 = _CocoaArrayWrapper.endIndex.getter(v13);

        swift_bridgeObjectRelease_n(v8, 2);
      }
      else
      {
        v7 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease(v8);
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media26RadioSourcesViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10005EDBC(v11);

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
  _TtC5Media26RadioSourcesViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10005F20C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Media26RadioSourcesViewController_nowPlaying);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media26RadioSourcesViewController_cancelSet));
  sub_100010074(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Media26RadioSourcesViewController_completionBlock), *(_QWORD *)&self->super.super.tableView[OBJC_IVAR____TtC5Media26RadioSourcesViewController_completionBlock]);
}

@end

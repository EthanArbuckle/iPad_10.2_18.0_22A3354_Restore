@implementation CellularLoggingViewController

- (void)viewDidLoad
{
  _TtC13FTMInternal_429CellularLoggingViewController *v2;

  v2 = self;
  sub_1001DC3C4();

}

- (void)didTapStart
{
  _TtC13FTMInternal_429CellularLoggingViewController *v2;

  v2 = self;
  sub_1001DC524();

}

- (void)didTapStop
{
  _TtC13FTMInternal_429CellularLoggingViewController *v2;

  v2 = self;
  sub_1001DCA78();

}

- (void)didTapReset
{
  _TtC13FTMInternal_429CellularLoggingViewController *v2;

  v2 = self;
  sub_1001DCE54();

}

- (void)didTapConfig
{
  _TtC13FTMInternal_429CellularLoggingViewController *v2;

  v2 = self;
  sub_1001DD234();

}

- (void)didChangedChunkFileSliderValue:(id)a3
{
  id v4;
  _TtC13FTMInternal_429CellularLoggingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001DD340(v4);

}

- (void)didChangedMaxLogsSlider:(id)a3
{
  id v4;
  _TtC13FTMInternal_429CellularLoggingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001DD620(v4);

}

- (_TtC13FTMInternal_429CellularLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13FTMInternal_429CellularLoggingViewController *)sub_1001DF3E0(v5, v7, a4);
}

- (_TtC13FTMInternal_429CellularLoggingViewController)initWithCoder:(id)a3
{
  return (_TtC13FTMInternal_429CellularLoggingViewController *)sub_1001DF664(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_transition));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularLoggingService));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularConfigurations));
  swift_bridgeObjectRelease(*(_QWORD *)&self->transition[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_currentLogConfiguration]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->transition[OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_loadingViewContext]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_maxNumberOfLogs));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___currentConfigButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___startButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___resetButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___stopButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___chunkFileSizeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController____lazy_storage___maxNumberOfLogsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_containerView));
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC13FTMInternal_429CellularLoggingViewController *v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = qword_1002B39C0;
  v12 = a3;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_1002B39C0, sub_10016A8FC);
  v14 = *(double *)&qword_1002BEFB8;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC13FTMInternal_429CellularLoggingViewController *v12;
  _BYTE v13[24];

  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13FTMInternal_429CellularLoggingViewController_cellularData, v13, 0, 0);
  v7 = *v6;
  if (!v7)
    return 0;
  if (!((unint64_t)v7 >> 62))
    return *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7 >= 0)
    v10 = v7 & 0xFFFFFFFFFFFFFF8;
  else
    v10 = v7;
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v10);

  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_429CellularLoggingViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1001E0278(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13FTMInternal_429CellularLoggingViewController *v11;
  id v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1001E1358();
  swift_unknownObjectRetain(v12, v13);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC13FTMInternal_429CellularLoggingViewController *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  v5 = self;
  v6 = sub_1001E1454();
  swift_unknownObjectRetain(v6, v7);

  return v6;
}

@end

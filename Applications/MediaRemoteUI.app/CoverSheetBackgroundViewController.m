@implementation CoverSheetBackgroundViewController

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  v8 = a3;

  result = (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 32, 0);
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v5;
  id v6;

  v3 = type metadata accessor for CoverSheetBackgroundView();
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  -[CoverSheetBackgroundViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v2;

  v2 = self;
  sub_10000E8F4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v4;

  v4 = self;
  sub_10000EAB0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v4;

  v4 = self;
  sub_10000EED0(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double *v8;
  void *v9;
  double *v10;
  id v11;
  _QWORD v12[5];
  double *v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[CoverSheetBackgroundViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = (double *)swift_allocObject(&unk_1000459F8, 40, 7);
  *((_QWORD *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v12[4] = sub_10000F9A0;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000F01C;
  v12[3] = &unk_100045A10;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  swift_release(v10);
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10000F17C((uint64_t)a3);

}

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *result;

  v4 = a4;
  result = (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.CoverSheetBackgroundViewController", 48, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FAD4((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController));
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v7;
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_10000DA70((uint64_t)a4, 1);
  swift_unknownObjectRelease(a3);

}

- (int64_t)layout
{
  return 0;
}

- (MRUArtworkView)artworkView
{
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  MRUArtworkView *v7;
  MRUArtworkView *result;

  v2 = self;
  v3 = -[CoverSheetBackgroundViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for CoverSheetBackgroundView();
    v6 = swift_dynamicCastClass(v4, v5);
    if (v6)
    {
      v7 = (MRUArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)(v6
                                                                     + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView));

      return v7;
    }

  }
  result = (MRUArtworkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
  __break(1u);
  return result;
}

- (void)setArtworkVisible:(BOOL)a3
{
  _TtC13MediaRemoteUI34CoverSheetBackgroundViewController *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = self;
  v7 = -[CoverSheetBackgroundViewController view](v4, "view");
  if (v7)
  {
    v5 = type metadata accessor for CoverSheetBackgroundView();
    v6 = swift_dynamicCastClass(v7, v5);
    if (v6)
    {
      *(_BYTE *)(v6 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) = a3;
      sub_10000885C();

      return;
    }

  }
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
  __break(1u);
}

@end

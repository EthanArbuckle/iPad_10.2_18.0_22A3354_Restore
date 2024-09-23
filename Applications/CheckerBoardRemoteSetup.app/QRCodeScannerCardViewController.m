@implementation QRCodeScannerCardViewController

- (_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController)initWithContentView:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *)sub_10000AB04(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *v3;

  v3 = self;
  sub_10000B224();
  sub_10000BBD4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *v3;

  if (*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession])
  {
    objc_msgSend(*(id *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession], "startRunning", a3);
  }
  else
  {
    v3 = self;
    sub_10000B118();

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  _TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *v6;
  id v7;
  id v8;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession;
  v4 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession];
  if (v4)
  {
    v6 = self;
    v7 = v4;
    objc_msgSend(v7, "stopRunning");
    v8 = *(id *)&self->PRXCardContentViewController_opaque[v3];
    *(_QWORD *)&self->PRXCardContentViewController_opaque[v3] = 0;

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[QRCodeScannerCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_10001CE70, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_10000C460;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000AFBC;
  v12[3] = &unk_10001CE88;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  swift_release(v10);
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *v13;

  v9 = sub_100003720(0, &qword_100023A78, AVMetadataObject_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_10000C1A4(v10);

  swift_bridgeObjectRelease(v10);
}

- (void).cxx_destruct
{

}

@end

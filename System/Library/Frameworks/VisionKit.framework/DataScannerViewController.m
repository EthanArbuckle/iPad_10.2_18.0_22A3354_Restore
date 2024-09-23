@implementation DataScannerViewController

- (_TtC9VisionKit25DataScannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_20CF76BC4();
}

- (_TtC9VisionKit25DataScannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_20CF76BC4();
}

- (void)dealloc
{
  void *v3;
  _TtC9VisionKit25DataScannerViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DataScannerViewController();
  -[DataScannerViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20CF688DC((uint64_t)self + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView));
  swift_bridgeObjectRelease();
  sub_20CF688DC((uint64_t)self + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
  swift_bridgeObjectRelease();
}

- (void)didEnterBackground
{
  void *v2;
  unsigned __int8 v3;
  _TtC9VisionKit25DataScannerViewController *v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  v4 = self;
  v3 = objc_msgSend(v2, sel_isProcessing);
  *((_BYTE *)&v4->super.super.super.isa
  + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground) = v3;
  objc_msgSend(v2, sel_stopRunning);

}

- (void)willEnterForeground
{
  void *v2;
  _TtC9VisionKit25DataScannerViewController *v3;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  v3 = self;
  objc_msgSend(v2, sel_startRunning);
  if (*((_BYTE *)&v3->super.super.super.isa
       + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground) == 1)
    objc_msgSend(v2, sel_startProcessing);

}

- (void)loadView
{
  _TtC9VisionKit25DataScannerViewController *v2;

  v2 = self;
  sub_20CF72F78();

}

- (void)viewDidLoad
{
  _TtC9VisionKit25DataScannerViewController *v2;

  v2 = self;
  sub_20CF7334C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9VisionKit25DataScannerViewController *v4;

  v4 = self;
  sub_20CF73634(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9VisionKit25DataScannerViewController *v4;

  v4 = self;
  sub_20CF737B4(a3);

}

- (void)removeFromParentViewController
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DataScannerViewController();
  v2 = (char *)v3.receiver;
  -[DataScannerViewController removeFromParentViewController](&v3, sel_removeFromParentViewController);
  sub_20CF74AE0();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning, v3.receiver, v3.super_class);

}

- (void)onTap:(id)a3
{
  id v4;
  _TtC9VisionKit25DataScannerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_20CF73EC8(v4);

}

- (void)onPinch:(id)a3
{
  id v4;
  _TtC9VisionKit25DataScannerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_20CF743FC(v4);

}

@end

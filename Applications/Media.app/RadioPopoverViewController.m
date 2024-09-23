@implementation RadioPopoverViewController

- (void)viewDidLoad
{
  _TtC5Media26RadioPopoverViewController *v2;

  v2 = self;
  sub_10000E168();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  char *v3;
  char *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RadioPopoverViewController();
  v2 = (char *)v6.receiver;
  -[RadioPopoverViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = (char *)objc_msgSend(v2, "popoverPresentationController", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView], "contentSize");
    objc_msgSend(v4, "setPopoverContentSize:", 270.0, v5 + 12.0);

    v2 = v4;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  char *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RadioPopoverViewController();
  v4 = (char *)v8.receiver;
  -[RadioPopoverViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = (char *)objc_msgSend(v4, "popoverPresentationController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView], "contentSize");
    objc_msgSend(v6, "setPopoverContentSize:", 270.0, v7 + 12.0);

    v4 = v6;
  }

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
  return 40.0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v3;
  __objc2_prot *v4;

  v4 = &OBJC_PROTOCOL___BSInvalidatable;
  v3 = (void *)swift_dynamicCastObjCProtocolConditional(self, 1, &v4);
  if (v3)
    objc_msgSend(v3, "invalidate");
}

@end

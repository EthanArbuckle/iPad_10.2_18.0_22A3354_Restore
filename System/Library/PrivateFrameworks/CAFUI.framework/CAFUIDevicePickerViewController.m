@implementation CAFUIDevicePickerViewController

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  v4 = (char *)v8.receiver;
  -[CAFUICollectionViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  v5 = OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton;
  v6 = *(void **)&v4[OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton];
  if (v6)
  {
    objc_msgSend(v6, sel_removeFromSuperview, v8.receiver, v8.super_class);
    v7 = *(void **)&v4[v5];
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)&v4[v5] = 0;

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  v4 = v5.receiver;
  -[CAFUIDevicePickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  CAFUIDevicePickerViewController.updatePTButton()();

}

- (void)dealloc
{
  void *v3;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (void *)MEMORY[0x23B812F68](v6);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_removeObserver_, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  -[CAFUIDevicePickerViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pairedDevices));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_limitedUIView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pageControlHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_carSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_spinnerTimer));
  outlined destroy of IndexPath?((uint64_t)self + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_spinningCellIndexPath);
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC5CAFUI31CAFUIDevicePickerViewController *v2;

  v2 = self;
  CAFUIDevicePickerViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  v2 = v3.receiver;
  -[CAFUIDevicePickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  CAFUIDevicePickerViewController.updateFlowLayout()();
  CAFUIDevicePickerViewController.updatePageControl()();

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = CAFUIDevicePickerViewController.cellSize.getter();
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = type metadata accessor for IndexPath();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  v12 = (void *)CAFUIDevicePickerViewController.collectionView(_:cellForItemAt:)(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (char *)a3;
  v11 = self;
  CAFUIDevicePickerViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  specialized CAFUIDevicePickerViewController.collectionView(_:layout:insetForSectionAt:)(v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = specialized CAFUIDevicePickerViewController.collectionView(_:numberOfItemsInSection:)();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = specialized CAFUIDevicePickerViewController.numberOfSections(in:)();

  return v6;
}

- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4
{
  id v6;
  id v7;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFUIDevicePickerViewController.pairedDevicesInformationService(_:didUpdatePairedDeviceList:)(v6, v7);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v5;

  v4 = a3;
  v5 = self;
  specialized CAFUIDevicePickerViewController.scrollViewDidScroll(_:)();

}

- (void)devicePickerButtonTapped
{
  _TtC5CAFUI31CAFUIDevicePickerViewController *v2;

  v2 = self;
  CAFUIDevicePickerViewController.devicePickerButtonTapped()();

}

- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4
{
  id v5;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v6;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_punchThroughState) = 1;
  v5 = a3;
  v6 = self;
  CAFUIDevicePickerViewController.updatePTButton()();

}

- (void)pairedDevicesActionService:(id)a3 didUpdatePairedDeviceActionRequest:(id)a4
{
  id v6;
  id v7;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CAFUIDevicePickerViewController.pairedDevicesActionService(_:didUpdatePairedDeviceActionRequest:)(a4);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _TtC5CAFUI31CAFUIDevicePickerViewController *v7;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _TtC5CAFUI31CAFUIDevicePickerViewController *v13;
  id v14;

  v14 = a3;
  v7 = (_TtC5CAFUI31CAFUIDevicePickerViewController *)a4;
  v8 = self;
  v9 = -[CAFUIDevicePickerViewController collectionView](v8, sel_collectionView);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, sel_indexPathsForSelectedItems);

    if (v11)
    {
      type metadata accessor for IndexPath();
      v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      v13 = v8;
      specialized Sequence.forEach(_:)(v12, v13);

      swift_bridgeObjectRelease();
      v7 = v13;
    }

  }
  else
  {
    __break(1u);
  }
}

@end

@implementation OnboardingRegionSelectionViewController

- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD2B300();
}

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v2;

  v2 = self;
  OnboardingRegionSelectionViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t ObjectType;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  -[OnboardingRegionSelectionViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 0, v3);

  }
  v7 = *(_QWORD *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow + 8];
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v7 + 16))(0, ObjectType, v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[OnboardingRegionSelectionViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v7.receiver, v7.super_class))
  {
    v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow + 8];
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v5 + 64))(MEMORY[0x24BEE4AF8], ObjectType, v5);
  }

}

- (void)didTapDone
{
  -[OnboardingRegionSelectionViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)didTapCancel
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(_QWORD, uint64_t, uint64_t);
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v6;

  v3 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_flow);
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  v5(MEMORY[0x24BEE4AF8], ObjectType, v3);
  (*(void (**)(_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 128))(v6, &protocol witness table for OnboardingRegionSelectionViewController, ObjectType, v3);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = *(_QWORD *)(sub_21CD28820() + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  v12 = (void *)OnboardingRegionSelectionViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v11;
  uint64_t v12;

  v6 = sub_21CD763D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD763B8();
  v10 = a3;
  v11 = self;
  OnboardingRegionSelectionViewController.tableView(_:didSelectRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v6;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  OnboardingRegionSelectionViewController.traitCollectionDidChange(_:)(v8);

}

- (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *result;

  v4 = a4;
  result = (_TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI39OnboardingRegionSelectionViewController_regionTableView));
  swift_release();
}

@end

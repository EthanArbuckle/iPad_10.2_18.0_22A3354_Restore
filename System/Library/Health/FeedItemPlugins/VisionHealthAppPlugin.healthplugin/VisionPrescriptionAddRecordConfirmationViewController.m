@implementation VisionPrescriptionAddRecordConfirmationViewController

- (void)viewDidLoad
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v2;

  v2 = self;
  VisionPrescriptionAddRecordConfirmationViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VisionPrescriptionAddRecordConfirmationViewController();
  v4 = v7.receiver;
  -[OBTableWelcomeController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);

    v4 = v6;
  }

}

- (void)addRecord
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v2;

  v2 = self;
  sub_2322AE650();

}

- (void)dismissPreview
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v2;

  v2 = self;
  sub_2322AE8AC();

}

- (void)dismissAnimated:(id)a3
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v4;
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v5;
  __int128 v6;
  __int128 v7;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2322B926C();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = self;
  }
  -[VisionPrescriptionAddRecordConfirmationViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_232262F64((uint64_t)&v6, (uint64_t (*)(_QWORD))sub_232250ABC);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_2322B8150();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2322B8114();
  v10 = a3;
  v11 = self;
  v12 = VisionPrescriptionAddRecordConfirmationViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  uint64_t v6;
  id v7;
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *v8;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v6 = qword_255FAB900;
    v7 = a3;
    v8 = self;
    if (v6 != -1)
      swift_once();
    sub_2322B7F58();

    v4 = (void *)sub_2322B8DEC();
    swift_bridgeObjectRelease();
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v10;

  v4 = sub_2322B8150();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2322B8114();
  v8 = *MEMORY[0x24BEBE770];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x24BEBE770];
  if (!a4)
    return 10.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *result;

  result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *result;

  v5 = a5;
  result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *result;

  result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *result;

  v6 = a5;
  result = (_TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_addToHealthButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_visionPrescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_profileStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_sampleType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_samplePredicate));
  sub_232258500((uint64_t)self+ OBJC_IVAR____TtC21VisionHealthAppPlugin53VisionPrescriptionAddRecordConfirmationViewController_pinnedContentManager);
}

@end

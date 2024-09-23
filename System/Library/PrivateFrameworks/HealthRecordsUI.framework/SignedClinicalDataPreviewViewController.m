@implementation SignedClinicalDataPreviewViewController

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v2;

  v2 = self;
  sub_1BC5873A4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v4;

  v4 = self;
  sub_1BC587C08(a3);

}

- (void)addRecords
{
  void *v2;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v3;
  uint64_t v4;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_addToHealthButton);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_showsBusyIndicator);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    v5 = v3;
    sub_1BC4EF644((uint64_t)sub_1BC58AF14, v4);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)dismissPreview
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v2;

  v2 = self;
  sub_1BC58833C();

}

- (void)learnMoreButtonTapped:(id)a3
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v4;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1BC588884();

  sub_1BC39BD2C((uint64_t)v6);
}

- (void)dismissAnimated:(id)a3
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v4;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v5;
  __int128 v6;
  __int128 v7;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = self;
  }
  -[SignedClinicalDataPreviewViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1BC39BD2C((uint64_t)&v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t v3;
  id v6;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v7;
  int64_t v8;

  v3 = (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_handler))[3];
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = a3;
  v7 = self;
  swift_bridgeObjectRetain();
  v8 = sub_1BC62D3B8();

  swift_bridgeObjectRelease();
  return v8;
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
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = sub_1BC588EB0(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  uint64_t v6;
  id v7;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *v8;
  id v9;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v6 = qword_1EF428588;
    v7 = a3;
    v8 = self;
    if (v6 != -1)
      swift_once();
    v9 = (id)qword_1EF42F740;
    swift_bridgeObjectRetain();
    sub_1BC62A4A8();

    swift_bridgeObjectRelease();
    v4 = (void *)sub_1BC62C650();
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

  v4 = sub_1BC62A970();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v8 = *MEMORY[0x1E0DC53D8];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
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

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *result;

  result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *result;

  v5 = a5;
  result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *result;

  result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *result;

  v6 = a5;
  result = (_TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController_addToHealthButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI39SignedClinicalDataPreviewViewController____lazy_storage___gmtDateFormatter));
}

@end

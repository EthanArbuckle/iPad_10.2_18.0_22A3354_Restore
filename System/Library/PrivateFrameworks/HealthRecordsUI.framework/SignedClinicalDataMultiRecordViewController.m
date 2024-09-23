@implementation SignedClinicalDataMultiRecordViewController

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithCoder:(id)a3
{
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *result;

  result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *v2;

  v2 = self;
  sub_1BC361DCC();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *v10;

  v5 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_1BC62D3B8();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v7;
  int64_t result;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *v12;
  id v13;
  id v14;
  id v15;
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *v16;

  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups);
  result = swift_beginAccess();
  v9 = *v7;
  if ((v9 & 0xC000000000000001) != 0)
  {
    v15 = a3;
    v16 = self;
    swift_bridgeObjectRetain();
    v13 = (id)MEMORY[0x1BCCF24CC](a4, v9);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v10 = *(void **)(v9 + 8 * a4 + 32);
    v11 = a3;
    v12 = self;
    v13 = v10;
LABEL_5:
    v14 = objc_msgSend(v13, sel_numberOfDisplayItems);

    return (int64_t)v14;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  sub_1BC362A98(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *result;

  result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *result;

  result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_profile));
  swift_bridgeObjectRelease();
}

@end

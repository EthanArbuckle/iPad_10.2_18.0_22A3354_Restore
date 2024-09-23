@implementation MedicationsInternalSettingsViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  v2 = v7.receiver;
  -[MedicationsInternalSettingsViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_tableView, v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for MedicationsSettingsTableCell();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v6 = (void *)sub_2318D558C();
    objc_msgSend(v4, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v6);

  }
  else
  {
    __break(1u);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_2318D2B80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2318D2B38();
  v10 = a3;
  v11 = self;
  v12 = sub_2318A0144(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  return -[MedicationsInternalSettingsViewController initWithStyle:](&v5, sel_initWithStyle_, a3);
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_2318D55BC();
    v6 = a4;
    v7 = (void *)sub_2318D558C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationsInternalSettingsViewController();
  v9 = -[MedicationsInternalSettingsViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController)initWithCoder:(id)a3
{
  uint64_t v3;

  return (_TtC26MedicationsHealthAppPlugin41MedicationsInternalSettingsViewController *)sub_2318A00C8(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsInternalSettingsViewController);
}

@end

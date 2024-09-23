@implementation ICloudPlusViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  _TtC14FamilyCircleUI24ICloudPlusViewController *v9;
  uint64_t v10;
  _TtC14FamilyCircleUI24ICloudPlusViewController *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ICloudPlusViewController();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  -[HelpfulRemoteUiHostingVC viewDidAppear:](&v15, sel_viewDidAppear_, v3);
  v10 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_20E07D838();
  v11 = v9;
  v12 = sub_20E07D82C();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_20DE89F9C((uint64_t)v7, (uint64_t)&unk_254A03820, (uint64_t)v13);

  swift_release();
}

- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC14FamilyCircleUI24ICloudPlusViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_20E07D5D4();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
    v6 = a4;
    v7 = (void *)sub_20E07D5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ICloudPlusViewController();
  v9 = -[HelpfulRemoteUiHostingVC initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ICloudPlusViewController();
  return -[HelpfulRemoteUiHostingVC initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

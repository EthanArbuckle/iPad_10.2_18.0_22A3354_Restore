@implementation ActivityPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return sub_1DD30FD90((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls30ActivityPickerServiceInterface_);
}

+ (id)exportedInterface
{
  return sub_1DD30FD90((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls29ActivityPickerClientInterface_);
}

- (ActivityPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  ActivityPickerRemoteViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_1DD342798();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
    *v6 = 0;
    v6[1] = 0;
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
    *v7 = 0;
    v7[1] = 0;
    v8 = a4;
    v9 = (void *)sub_1DD34278C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
    *v10 = 0;
    v10[1] = 0;
    v11 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ActivityPickerRemoteViewController();
  v13 = -[ActivityPickerRemoteViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v9, a4);

  return v13;
}

- (ActivityPickerRemoteViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
  v7 = (objc_class *)type metadata accessor for ActivityPickerRemoteViewController();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[ActivityPickerRemoteViewController initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1DD30F608(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback));
  sub_1DD30F608(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback));
}

- (void)didSelectWithApplications:(id)a3 categories:(id)a4 webDomains:(id)a5 untokenizedApplications:(id)a6 untokenizedCategories:(id)a7 untokenizedWebDomains:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  ActivityPickerRemoteViewController *v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  v9 = sub_1DD34281C();
  v10 = sub_1DD34281C();
  v11 = sub_1DD34281C();
  v12 = sub_1DD34281C();
  v13 = sub_1DD34281C();
  v14 = sub_1DD34281C();
  v15 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v16 = self;
  v17 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v15();
  if (v17)
  {
    v18 = (uint64_t)v17;
    v17(v9, v10, v11, v12, v13, v14);
    sub_1DD30F608(v18);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)didCancel
{
  uint64_t (*v2)(void);
  void (*v3)(void);
  uint64_t v4;
  ActivityPickerRemoteViewController *v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0x78);
  v5 = self;
  v3 = (void (*)(void))v2();
  if (v3)
  {
    v4 = (uint64_t)v3;
    v3();
    sub_1DD30F608(v4);
  }

}

@end

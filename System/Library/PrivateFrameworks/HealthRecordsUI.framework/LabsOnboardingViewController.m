@implementation LabsOnboardingViewController

- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI28LabsOnboardingViewController *v5;

  v4 = objc_allocWithZone((Class)type metadata accessor for LabsOnboardingViewController());
  v5 = (_TtC15HealthRecordsUI28LabsOnboardingViewController *)sub_1BC528B54(0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15HealthRecordsUI28LabsOnboardingViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI28LabsOnboardingViewController *v2;

  v2 = self;
  sub_1BC527608();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1BC52823C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1BC527EC4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1BC52823C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1BC5280BC);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI28LabsOnboardingViewController *v7;
  void *v8;
  id v9;
  objc_super v10;

  sub_1BC34B6A0(0, &qword_1EF4357E0);
  sub_1BC528E9C();
  sub_1BC62C9E0();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_1BC62C9D4();
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for LabsOnboardingViewController();
  -[LabsOnboardingViewController touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v8, v6);

  if (*((_BYTE *)&v7->super.super.super.isa
       + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_isPresentingInPopover) == 1)
  {
    v9 = sub_1BC5272D8();
    objc_msgSend(v9, sel_setTextColor_, *(Class *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_accessoryColor));

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1BC5291C0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_providedHealthStore));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_headerType;
  v4 = sub_1BC62ADE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController____lazy_storage___tipsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController____lazy_storage___accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_accessoryColor));
}

@end

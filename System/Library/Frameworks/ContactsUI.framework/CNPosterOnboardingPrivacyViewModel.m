@implementation CNPosterOnboardingPrivacyViewModel

- (void)setWithItems:(id)a3
{
  unint64_t v4;
  _TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel *v5;

  type metadata accessor for DeviceListServiceDeviceInfo();
  v4 = sub_18AF4FD34();
  v5 = self;
  sub_18ACB583C(v4);

  swift_bridgeObjectRelease();
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel_model;
  type metadata accessor for CNPosterOnboardingPrivacyView.Model(0);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x1E0DEE9D8];
  *(_BYTE *)(v4 + 24) = 1;
  v5 = self;
  sub_18AF4E5F4();
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CNPosterOnboardingPrivacyViewModel();
  return -[CNPosterOnboardingPrivacyViewModel init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

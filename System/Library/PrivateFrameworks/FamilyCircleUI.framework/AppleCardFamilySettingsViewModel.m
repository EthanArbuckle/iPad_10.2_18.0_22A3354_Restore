@implementation AppleCardFamilySettingsViewModel

- (void)dealloc
{
  void *ObjCClassFromMetadata;
  _TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel *v4;
  id v5;
  objc_super v6;

  sub_20DE9432C(0, (unint64_t *)&qword_253D2DE80);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = objc_msgSend(ObjCClassFromMetadata, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AppleCardFamilySettingsViewModel();
  -[AppleCardFamilySettingsViewModel dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel_familyCircleStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel_appleCardStore);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__showShareAppleCardFlow;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FB190);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__showAppleCardFamilyScreen, v4);
  v6 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__subLabel;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FB198);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__sharingCardWithFamilyMembers;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FBA78);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel__shouldHideShareCardButton, v4);
  sub_20DEB3FE8();
  swift_bridgeObjectRelease();
}

- (void)serviceAccountDidChange
{
  _TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel *v2;

  v2 = self;
  sub_20DF265CC();

}

- (_TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel)init
{
  _TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel *result;

  result = (_TtC14FamilyCircleUI32AppleCardFamilySettingsViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

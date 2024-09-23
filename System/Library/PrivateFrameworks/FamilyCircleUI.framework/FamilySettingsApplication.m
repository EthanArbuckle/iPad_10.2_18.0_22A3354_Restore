@implementation FamilySettingsApplication

- (_TtC14FamilyCircleUI25FamilySettingsApplication)init
{
  return (_TtC14FamilyCircleUI25FamilySettingsApplication *)sub_20DFC8948();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication__state;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DDB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_aidaAccountManager));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_servicesOwnerManager));
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI25FamilySettingsApplication_launchDate;
  v6 = sub_20E07BBB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4;
  _TtC14FamilyCircleUI25FamilySettingsApplication *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_20DFCBBA8();

  type metadata accessor for AIDAServiceType(0);
  sub_20DE9432C(0, (unint64_t *)&qword_253D2DEB0);
  sub_20DE86C10((unint64_t *)&unk_253D2DE40, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_20E084324);
  v6 = (void *)sub_20E07D4FC();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)appMovedToForeground
{
  sub_20DFCAC08(self, (uint64_t)a2, &qword_253D2D030, &qword_253D2D028);
}

- (void)appMovedToBackground
{
  sub_20DFCAC08(self, (uint64_t)a2, &qword_253D2D048, &qword_253D2D038);
}

@end

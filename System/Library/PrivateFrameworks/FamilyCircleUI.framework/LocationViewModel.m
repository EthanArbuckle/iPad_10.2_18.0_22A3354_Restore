@implementation LocationViewModel

+ (_TtC14FamilyCircleUI17LocationViewModel)shared
{
  swift_beginAccess();
  return (_TtC14FamilyCircleUI17LocationViewModel *)(id)qword_2549FD890;
}

+ (void)setShared:(id)a3
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = (void *)qword_2549FD890;
  qword_2549FD890 = (uint64_t)a3;
  v5 = a3;

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _TtC14FamilyCircleUI17LocationViewModel *v8;
  objc_class *v9;
  objc_super v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_20DE89F80((uint64_t)v5, (uint64_t)&unk_2549FDA40, (uint64_t)v7);
  swift_release();
  v9 = (objc_class *)type metadata accessor for LocationViewModel();
  v10.receiver = v8;
  v10.super_class = v9;
  -[LocationViewModel dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__familyMembersSharingLocationWithMe;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FD8A0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__parentCanToggleChildsLocation;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FB190);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__disableLocationToggles, v7);
  v9 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__sharingLocationWithFamilyMembers;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FD8B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v5((char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__childCanModifyLocationStatus, v4);
  v11 = (char *)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel__membersAutomaticallySharing;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549FDA48);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel_servicesStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI17LocationViewModel_circleStore);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

+ (id)createModel
{
  return _s14FamilyCircleUI17LocationViewModelC06createF0ACyFZ_0();
}

- (_TtC14FamilyCircleUI17LocationViewModel)init
{
  _TtC14FamilyCircleUI17LocationViewModel *result;

  result = (_TtC14FamilyCircleUI17LocationViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

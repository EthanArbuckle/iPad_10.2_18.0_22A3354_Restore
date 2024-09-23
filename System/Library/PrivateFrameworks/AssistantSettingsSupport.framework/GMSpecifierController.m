@implementation GMSpecifierController

- (_TtP24AssistantSettingsSupport29GMSpecifierControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  return (_TtP24AssistantSettingsSupport29GMSpecifierControllerDelegate_ *)(id)MEMORY[0x2199E1834](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (GMSpecifierController)init
{
  return (GMSpecifierController *)GMSpecifierController.init()();
}

- (BOOL)gmFFEnabled
{
  return sub_215429FF0() & 1;
}

- (void)enrollWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  GMSpecifierController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21542A320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254DC3320;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254DC3328;
  v12[5] = v11;
  v13 = self;
  sub_215425254((uint64_t)v7, (uint64_t)&unk_254DC3330, (uint64_t)v12);
  swift_release();
}

- (void)fetchStatusWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  GMSpecifierController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21542A320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254DC3300;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254DC3308;
  v12[5] = v11;
  v13 = self;
  sub_215425254((uint64_t)v7, (uint64_t)&unk_254DC3310, (uint64_t)v12);
  swift_release();
}

- (BOOL)featureOptInStatus
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  GMSpecifierController *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = (uint64_t)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  sub_2154248FC(v3, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v3 & 1;
}

- (void)setFeatureOptInStatusWithEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  GMSpecifierController *v9;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 16);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (void)clearCFUWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  GMSpecifierController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21542A320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254DC32C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254DC32D0;
  v12[5] = v11;
  v13 = self;
  sub_215425254((uint64_t)v7, (uint64_t)&unk_254DC32E0, (uint64_t)v12);
  swift_release();
}

- (BOOL)hasEngagedCFU
{
  sub_21542A0B0();
  return sub_21542A0A4() & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___GMSpecifierController_availabilityProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___GMSpecifierController_optInStatusProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  sub_215425D2C((uint64_t)self + OBJC_IVAR___GMSpecifierController_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR___GMSpecifierController_availability;
  v4 = sub_215429F9C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

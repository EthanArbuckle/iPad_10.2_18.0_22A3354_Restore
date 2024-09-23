@implementation CHSControlService

+ (CHSControlService)sharedInstance
{
  if (qword_1EE189370 != -1)
    swift_once();
  return (CHSControlService *)(id)qword_1EE189440;
}

- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  CHSControlService *v15;

  v7 = sub_18FBCD0DC();
  v9 = v8;
  if (a4)
  {
    v10 = sub_18FBCD0DC();
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = sub_18FBCD0DC();
  v14 = v13;
  v15 = self;
  _sSo17CHSControlServiceC14ChronoServicesE14reloadControls12forExtension4kind6reasonySS_SSSgSStF_0(v7, v9, v10, (unint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (CHSControlService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSControlService;
  return -[CHSControlService init](&v3, sel_init);
}

- (void)allControlConfigurationsByHostWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  CHSControlService *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE18BC08);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_18FBCD304();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_18FBBA5C4;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_18FBB9620((uint64_t)v7, (uint64_t)&unk_1EE18BC30, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  CHSControlService *v16;

  v6 = a4;
  v8 = _Block_copy(a6);
  v9 = sub_18FBCD0DC();
  v11 = v10;
  v12 = sub_18FBCD0DC();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v8;
  v16 = self;
  CHSControlService.fetchControlDescriptors(forExtensionBundleIdentifier:userInitiated:reason:completion:)(v9, v11, v6, v12, v14, (uint64_t)sub_18FBBA5BC, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end

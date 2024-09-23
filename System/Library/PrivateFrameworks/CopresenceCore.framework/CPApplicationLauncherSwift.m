@implementation CPApplicationLauncherSwift

- (NSString)placementSceneIdentifier
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___CPApplicationLauncherSwift_placementSceneIdentifier);
  swift_beginAccess();
  v3 = v2[1];
  if (!v3)
    return (NSString *)0;
  v4 = *v2;
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x1AF4480F4](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setPlacementSceneIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CPApplicationLauncherSwift *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  ApplicationLauncher.placementSceneIdentifier.setter(v4, v6);

}

- (CPApplicationLauncherSwift)init
{
  return (CPApplicationLauncherSwift *)ApplicationLauncher.init()();
}

- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  CPApplicationLauncherSwift *v16;
  uint64_t v17;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> ()partial apply;
  }
  else
  {
    v13 = 0;
  }
  v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = v12;
  v15[8] = v13;
  swift_unknownObjectRetain_n();
  v16 = self;
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed NWConnection.State) -> ())?((uint64_t)v12);
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&closure #1 in ApplicationLauncher.launchApplication(for:options:completion:)partial apply, (uint64_t)v15);
  swift_release();
  _sxRi_zRi0_zlyytIseghHr_SgWOe((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)revokeBackgroundAuthorizationForBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  CPApplicationLauncherSwift *v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  v12 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in ApplicationLauncher.revokeBackgroundAuthorization(for:)partial apply, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)revokeBackgroundAuthorizationForSession:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CPApplicationLauncherSwift *v10;

  swift_unknownObjectRetain();
  v10 = self;
  v5 = objc_msgSend(a3, sel_activity);
  v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v10->super.isa) + 0xC0))(v7, v9);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();

  }
}

- (void)authorizePiPForActivitySession:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  CPApplicationLauncherSwift *v15;
  uint64_t v16;
  CPApplicationLauncherSwift *v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CPApplicationLauncherSwift_pegasusLaunchBehavior);
  if (v12)
  {
    v13 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v12;
    v14[5] = a3;
    v14[6] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> ();
    v14[7] = v11;
    swift_unknownObjectRetain_n();
    v15 = self;
    _Block_copy(v10);
    swift_retain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ApplicationLauncher.authorizePiP(for:completion:)partial apply, (uint64_t)v14);
    swift_release();
    swift_release();
    _Block_release(v10);
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRetain();
    v17 = self;
    _Block_copy(v10);
    (*((void (**)(void *, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    swift_release();
    _Block_release(v10);
    swift_unknownObjectRelease();

  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPApplicationLauncherSwift_placementSceneIdentifierContinuation, &demangling cache variable for type metadata for AsyncStream<String>.Continuation?);
}

@end

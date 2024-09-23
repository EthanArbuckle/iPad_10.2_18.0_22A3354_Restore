@implementation TSAppDelegate

- (id)createBridgedAppResolver
{
  TSAppDelegate *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  sub_1D5F4098C((uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1D6E19F1C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4;
  id v7;
  TSAppDelegate *v8;
  char v9;

  v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1D5E6D4DC((unint64_t *)&unk_1EFFEB6A0, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1D6E32908);
    v4 = sub_1D6E267D4();
  }
  v7 = a3;
  v8 = self;
  v9 = sub_1D5EC527C(v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  TSAppDelegate *v7;
  char v8;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1D5E6D4DC((unint64_t *)&unk_1EFFEB6A0, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1D6E32908);
    sub_1D6E267D4();
  }
  v6 = a3;
  v7 = self;
  v8 = _s7NewsUI211AppDelegateC11application_30willFinishLaunchingWithOptionsSbSo13UIApplicationC_SDySo0k6LaunchJ3KeyaypGSgtF_0();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)createSceneContainer
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  TSAppDelegate *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1D6E1CF70();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1D5E8B2F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DB73E0], v3);
  v8 = (void *)sub_1D6E1D5DC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (void)bootstrapWithApplication:(id)a3
{
  id v5;
  TSAppDelegate *v6;
  uint64_t v7;

  sub_1D6E167CC();
  v5 = a3;
  v6 = self;
  sub_1D6E163E8();
  type metadata accessor for AppDelegate();
  sub_1D5E6D4DC(&qword_1ED5E3058, v7, (uint64_t (*)(uint64_t))type metadata accessor for AppDelegate, (uint64_t)&protocol conformance descriptor for AppDelegate);
  sub_1D6E16544();
  swift_release();
  sub_1D6E167C0();

}

- (TSAppDelegate)init
{
  return (TSAppDelegate *)AppDelegate.init()();
}

- (void)didCommitFirstFrame
{
  TSAppDelegate *v2;

  v2 = self;
  AppDelegate.didCommitFirstFrame()();

}

- (UIWindow)window
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___TSAppDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___TSAppDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1D5E82928((uint64_t)self + OBJC_IVAR___TSAppDelegate____lazy_storage___resolver, &qword_1ED5E0920, (unint64_t *)&unk_1ED5E0910, MEMORY[0x1E0DB35B0]);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (id)createCarPlaySceneContainer
{
  TSAppDelegate *v2;
  void *v3;

  v2 = self;
  sub_1D5E8B2F4();
  v3 = (void *)sub_1D6E1D5C4();

  swift_release();
  return v3;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  id v15;
  TSAppDelegate *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BYTE v24[16];

  sub_1D5E847C4(0, &qword_1ED5DCFE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB7AB8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = &v24[-v8];
  v10 = sub_1D6E15BE4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D6E15B78();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_1D5E6D4DC((unint64_t *)&unk_1ED5DFAC0, 255, (uint64_t (*)(uint64_t))type metadata accessor for OpenURLOptionsKey, (uint64_t)&unk_1D6E32AF8);
  sub_1D6E267D4();
  v14 = (void *)objc_opt_self();
  v15 = a3;
  v16 = self;
  v17 = objc_msgSend(v14, sel_sharedApplication);
  v18 = objc_msgSend(v17, sel_connectedScenes);

  sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5DFAE0);
  sub_1D64BF110();
  v19 = sub_1D6E27038();

  sub_1D65F8280(v19);
  v21 = v20;
  swift_bridgeObjectRelease();
  sub_1D65F904C(v21);
  v22 = sub_1D6E1D45C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  LOBYTE(v19) = sub_1D6E1A510();
  swift_release();

  sub_1D5F377D4((uint64_t)v9, (uint64_t)&qword_1ED5DCFE8, (uint64_t)MEMORY[0x1E0DB7AB8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D5E847C4);
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v19 & 1;
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  TSAppDelegate *v11;

  v7 = _Block_copy(a5);
  v8 = sub_1D6E267D4();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a3;
  v11 = self;
  sub_1D65FA2E8(v8, (uint64_t)sub_1D65FAAC8, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  TSAppDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1D65FA4C4(v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  TSAppDelegate *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D65FA6A8((uint64_t)sub_1D602F30C, v7);

  swift_release();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  TSAppDelegate *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12[3];
  uint64_t v13;

  v4 = self;
  AppDelegate.forwardingTarget(for:)((uint64_t)a3, v12);

  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1D6E282B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

- (void)buildMenuWithBuilder:(id)a3
{
  TSAppDelegate *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (id)sub_1D65F87D4();
  objc_msgSend(v6, sel_buildMenuWithBuilder_, a3);
  swift_unknownObjectRelease();

}

- (void)validateCommand:(id)a3
{
  id v4;
  TSAppDelegate *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1D65F87D4();
  swift_getObjectType();
  sub_1D65F88B0();
  v7 = sub_1D65F8984();
  v8[3] = sub_1D6E16CD0();
  v8[4] = sub_1D5E6D4DC((unint64_t *)&qword_1ED5E0510, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CF8638], MEMORY[0x1E0D59B68]);
  v8[0] = v7;
  sub_1D6E1D2F4();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  TSAppDelegate *v6;
  TSAppDelegate *v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1D6E27D04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = AppDelegate.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1D5F377D4((uint64_t)v10, (uint64_t)&qword_1ED5F4F00, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D5E76DF0);
  return v8 & 1;
}

@end

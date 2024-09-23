@implementation BuddyChildSetupFlow

- (_TtC5Setup19BuddyChildSetupFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v9 = _Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject(&unk_1002805C8, 24, 7);
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1000308B8;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  swift_unknownObjectRetain(a4, v12);
  v13 = a5;
  return (_TtC5Setup19BuddyChildSetupFlow *)sub_10002BA08(a3, (uint64_t)a4, a5, (uint64_t)v9, v10);
}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration];
  *(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration] = a3;
  v3 = a3;

}

- (BuddyFeatureFlags)featureFlags
{
  return (BuddyFeatureFlags *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_featureFlags], a2);
}

- (void)setFeatureFlags:(id)a3
{
  sub_10002BCD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_featureFlags);
}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_10002BCD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_runState);
}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  return (BuddyChildSetupPresenter *)*(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter];
}

- (void)setChildSetupPresenter:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter];
  *(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter] = a3;
  v3 = a3;

}

+ (id)allowedFlowItems
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  v2 = sub_10000A9E4(&qword_1002EA6B0);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10024C800;
  *(_QWORD *)(v3 + 32) = sub_10002FBBC(0, &qword_1002EB0D0, off_10027D2D8);
  *(_QWORD *)(v3 + 40) = sub_10002FBBC(0, &qword_1002EB0E0, off_10027D458);
  sub_10000A9E4((uint64_t *)&unk_1002EB170);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupAppleID);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerNeedsToRun
{
  void *v2;

  v2 = *(void **)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_runState];
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "hasCompletedInitialRun") ^ 1;
  return (char)v2;
}

- (void)startFlowAnimated:(BOOL)a3
{
  _TtC5Setup19BuddyChildSetupFlow *v3;

  v3 = self;
  sub_10002FD0C();

}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  uint64_t v7;
  _TtC5Setup19BuddyChildSetupFlow *v8;

  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  sub_10002BE98((uint64_t)a3, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a3);
}

- (void)setupPasscodeWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BuddyAISFlowTaskInfo *v15;
  _TtC5Setup19BuddyChildSetupFlow *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100280550, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100280578, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002EB150;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1002805A0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002EB158;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10002F124((uint64_t)v9, (uint64_t)&unk_1002EB160, (uint64_t)v14);
  swift_release(v17);
}

- (void)setupLocationServicesWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BuddyAISFlowTaskInfo *v15;
  _TtC5Setup19BuddyChildSetupFlow *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1002804D8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100280500, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002EB130;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100280528, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002EB138;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10002F124((uint64_t)v9, (uint64_t)&unk_1002EB140, (uint64_t)v14);
  swift_release(v17);
}

- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSDictionary *v15;
  _TtC5Setup19BuddyChildSetupFlow *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100280438, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100280460, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002EB0F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100280488, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002EB100;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10002F124((uint64_t)v9, (uint64_t)&unk_1002EA860, (uint64_t)v14);
  swift_release(v17);
}

- (void)didSucceedWithChildSetupPresenter:(id)a3
{
  id v4;
  _TtC5Setup19BuddyChildSetupFlow *v5;

  v4 = a3;
  v5 = self;
  sub_10002FED0();

}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  id v6;
  _TtC5Setup19BuddyChildSetupFlow *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100030018((uint64_t)v8);

}

- (void).cxx_destruct
{
  sub_100030794((uint64_t)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_passcodeFlowContinuation], &qword_1002EB0D8);
  sub_100030794((uint64_t)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_locationServicesFlowContinuation], &qword_1002EB0D8);

  swift_unknownObjectRelease(*(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_featureFlags]);
  swift_unknownObjectRelease(*(_QWORD *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_runState]);

}

@end

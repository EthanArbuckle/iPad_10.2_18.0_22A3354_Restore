@implementation IntelligenceManager

- (BOOL)didShowIntelligencePaneThisBuddyRun
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun);
}

- (void)setDidShowIntelligencePaneThisBuddyRun:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = a3;
}

- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3 availabilityProvider:(id)a4 stateProvider:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_featureFlags) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_availabilityProvider) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_stateProvider) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for IntelligenceManager();
  swift_unknownObjectRetain(a3, v8);
  swift_unknownObjectRetain(a4, v9);
  swift_unknownObjectRetain(a5, v10);
  return -[IntelligenceManager init](&v12, "init");
}

- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC5Setup19IntelligenceManager *v9;

  v5 = objc_allocWithZone((Class)type metadata accessor for IntelligenceAvailabilityProvider());
  swift_unknownObjectRetain(a3, v6);
  v7 = objc_msgSend(v5, "init");
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IntelligenceStateProvider()), "init");
  v9 = -[IntelligenceManager initWithFeatureFlags:availabilityProvider:stateProvider:](self, "initWithFeatureFlags:availabilityProvider:stateProvider:", a3, v7, v8);

  swift_unknownObjectRelease(a3);
  return v9;
}

- (void)shouldShowIntelligenceWithServerCheck:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC5Setup19IntelligenceManager *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_10027F7A0, 40, 7);
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10027F7C8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002EA870;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10027F7F0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002EA878;
  v14[5] = v13;
  v15 = self;
  v16 = sub_10002F124((uint64_t)v9, (uint64_t)&unk_1002EA880, (uint64_t)v14);
  swift_release(v16);
}

- (void)setDidShowIntelligencePaneInCurrentSession
{
  _TtC5Setup19IntelligenceManager *v2;

  v2 = self;
  sub_100015C08();

}

- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup19IntelligenceManager *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10027F728, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10027F750, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EA850;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10027F778, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EB100;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EA860, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC5Setup19IntelligenceManager)init
{
  _TtC5Setup19IntelligenceManager *result;

  result = (_TtC5Setup19IntelligenceManager *)_swift_stdlib_reportUnimplementedInitializer("Setup.IntelligenceManager", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup19IntelligenceManager_featureFlags));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup19IntelligenceManager_availabilityProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup19IntelligenceManager_stateProvider));
}

@end

@implementation IntelligenceAvailabilityProvider

- (_TtC5Setup32IntelligenceAvailabilityProvider)init
{
  id v3;
  id v4;
  id v5;
  _BYTE *v6;
  _TtC5Setup32IntelligenceAvailabilityProvider *v7;
  uint64_t ObjectType;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BuddyGMAvailabilityProvider()), "init");
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IntelligenceServerControlProvider()), "init");
  v5 = objc_msgSend((id)objc_opt_self(BYPreferencesController), "buddyPreferencesExcludedFromBackup");
  v6 = objc_allocWithZone((Class)type metadata accessor for IntelligenceAvailabilityProvider());
  v7 = (_TtC5Setup32IntelligenceAvailabilityProvider *)sub_10001A464(v3, v4, v5, v6);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 40, 7);
  return v7;
}

- (void)isDeviceEligibleForIntelligenceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup32IntelligenceAvailabilityProvider *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10027F9E8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10027FA10, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EA9E8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10027FA38, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EA9F0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EA9F8, (uint64_t)v12);
  swift_release(v14);
}

- (void)fetchLatestAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup32IntelligenceAvailabilityProvider *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10027F970, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10027F998, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EA9D8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10027F9C0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EB100;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EA860, (uint64_t)v12);
  swift_release(v14);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup32IntelligenceAvailabilityProvider_serverControlProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Setup32IntelligenceAvailabilityProvider_generativeModelsAvailabilityProvider));

}

@end

@implementation IMDMessagesSyncCoordinatorInternal

+ (BOOL)isSyncing
{
  swift_getObjCClassMetadata();
  return static SyncCoordinator.isSyncing()() & 1;
}

+ (void)clearSyncStoreWhenSafeWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = sub_21776B790((uint64_t *)&unk_253F24E80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_2178481B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254F02DD0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254F02DD8;
  v12[5] = v11;
  sub_21783C7F8((uint64_t)v7, (uint64_t)&unk_254F02DE0, (uint64_t)v12);
  swift_release();
}

+ (void)clearLocalCountsWhenSafe
{
  swift_getObjCClassMetadata();
  static SyncCoordinator.clearLocalCountsWhenSafe()();
}

+ (BOOL)configureWith:(id)a3 error:(id *)a4
{
  return sub_2177F6F0C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_2177F8F78);
}

+ (void)registerWithStore:(id)a3 asType:(int64_t)a4
{
  uint64_t v6;

  v6 = qword_253F25CC0;
  swift_unknownObjectRetain();
  if (v6 != -1)
    swift_once();
  objc_msgSend((id)qword_253F28EC8, sel_registerRecordStoreWithType_store_, a4, a3);
  swift_unknownObjectRelease();
}

+ (void)registerWithErrorAnalyzer:(id)a3
{
  sub_2177F585C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_253F28EC0);
}

+ (void)registerWithSyncTokenStore:(id)a3
{
  sub_2177F585C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_253F28ED0);
}

+ (void)registerWithSyncStateManager:(id)a3
{
  sub_2177F585C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_253F28EE8);
}

+ (void)registerWithBackupController:(id)a3
{
  sub_2177F585C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_253F28EE0);
}

+ (void)registerWithPreReqsVerifier:(id)a3
{
  sub_2177F585C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_253F28ED8);
}

+ (void)registerWithNotifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = qword_253F25B28;
  swift_unknownObjectRetain();
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v4 = swift_unknownObjectRetain();
  MEMORY[0x219A12230](v4);
  if (*(_QWORD *)((qword_253F28E38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((qword_253F28E38 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_21784810C();
  sub_21784813C();
  sub_2178480F4();
  swift_endAccess();
  swift_unknownObjectRelease();
}

+ (BOOL)startInitialSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.startInitialSync(delegate:));
}

+ (BOOL)scheduleBackfillSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleBackfillSync(delegate:));
}

+ (BOOL)schedulePeriodicSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.schedulePeriodicSync(delegate:));
}

+ (BOOL)scheduleBackupSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleBackupSync(delegate:));
}

+ (BOOL)scheduleAttachmentAssetDownloadSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.scheduleAttachmentAssetDownloadSync(delegate:));
}

+ (BOOL)scheduleTelemetrySyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F6F0C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_2177FBD24);
}

+ (BOOL)startUserInitiatedSyncWithDelegate:(id)a3 error:(id *)a4
{
  return sub_2177F719C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))static SyncCoordinator.startUserInitiatedSync(delegate:));
}

+ (id)initiateSyncFor:(id)a3 delegate:(id)a4 forceRunNow:(BOOL)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = sub_217847F98();
  v9 = v8;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  static SyncCoordinator.initiateSync(for:delegate:forceRunNow:)(v7, v9, a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)readServerCountsFromDefaults
{
  id v2;
  void *v3;

  if (qword_253F25DC0 != -1)
    swift_once();
  v2 = (id)qword_253F28F00;
  sub_2177F8ED8(MEMORY[0x24BEE4B00], (uint64_t)&unk_24D806728);

  sub_21776B790(&qword_254F02DC0);
  v3 = (void *)sub_217847F20();
  swift_bridgeObjectRelease();
  return v3;
}

+ (void)fetchSyncStoreCountsWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static SyncCoordinator.fetchSyncStoreCounts(_:)((uint64_t)sub_2177FC160, v4);
  swift_release();
}

+ (int64_t)currentTelemetrySyncVersion
{
  return 1;
}

- (IMDMessagesSyncCoordinatorInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncCoordinator();
  return -[IMDMessagesSyncCoordinatorInternal init](&v3, sel_init);
}

@end

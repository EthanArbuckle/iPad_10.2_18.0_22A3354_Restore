@implementation IMDSyncedSettingsServiceManager_Impl

- (IMDSyncedSettingsServiceManager_Impl)init
{
  return (IMDSyncedSettingsServiceManager_Impl *)SyncedSettingsServiceManager.init()();
}

- (IMDSyncedSettingsServiceManager_Impl)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = sub_1D166DACC();
  v10 = v9;
  v11 = sub_1D166DACC();
  v13 = v12;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (IMDSyncedSettingsServiceManager_Impl *)SyncedSettingsServiceManager.init(localDomain:remoteDomain:localStorageDelegate:remoteStorageDelegate:)(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
}

- (void)cloudkitStateEnabledReturnedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  IMDSyncedSettingsServiceManager_Impl *v8;
  uint64_t v9;

  v4 = sub_1D166D460();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D43C();
  v8 = self;
  sub_1D1625F90();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dealloc
{
  IMDSyncedSettingsServiceManager_Impl *v2;

  v2 = self;
  SyncedSettingsServiceManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)settingValueForKey:(int64_t)a3
{
  IMDSyncedSettingsServiceManager_Impl *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  v4 = self;
  sub_1D1626EAC(a3, (uint64_t)v12);

  v5 = v13;
  if (!v13)
    return 0;
  v6 = sub_1D141AC34(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1D166E1D4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_1D141AC98((uint64_t)v12);
  return v10;
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  IMDSyncedSettingsServiceManager_Impl *v6;
  _QWORD v7[4];

  swift_unknownObjectRetain();
  v6 = self;
  sub_1D166DF70();
  swift_unknownObjectRelease();
  sub_1D1627384(v7, a4);

  sub_1D141AC98((uint64_t)v7);
}

- (void)handleDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  IMDSyncedSettingsServiceManager_Impl *v8;
  uint64_t v9;

  v4 = sub_1D166D460();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D43C();
  v8 = self;
  sub_1D16287E0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end

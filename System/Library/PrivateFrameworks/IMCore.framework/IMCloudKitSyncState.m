@implementation IMCloudKitSyncState

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (IMCloudKitSyncState)initWithAccountEnabled:(BOOL)a3 stateDictionary:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;

  v4 = a3;
  if (a4)
    v5 = sub_1A219974C();
  else
    v5 = 0;
  return (IMCloudKitSyncState *)sub_1A1FFBFB0(v4, v5);
}

- (unint64_t)syncControllerSyncState
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerSyncState);
}

- (int64_t)syncControllerSyncType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerSyncType);
}

- (int64_t)syncControllerRecordType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncControllerRecordType);
}

- (BOOL)hasExited
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_hasExited);
}

- (int64_t)changingEnabledState
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_changingEnabledState);
}

- (BOOL)isDisablingDevices
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_isDisablingDevices);
}

- (BOOL)hasAvailableRecordsToDownload
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_hasAvailableRecordsToDownload);
}

- (NSArray)errors
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_errors))
  {
    swift_bridgeObjectRetain();
    sub_1A1FFD920((uint64_t *)&unk_1EE65C0D8);
    v2 = (void *)sub_1A21997C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (int64_t)accountStatus
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_accountStatus);
}

- (unint64_t)syncType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncType);
}

- (unint64_t)syncStatus
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncStatus);
}

- (unint64_t)syncJobState
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_syncJobState);
}

- (IMCloudKitSyncStatistics)statistics
{
  return (IMCloudKitSyncStatistics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___IMCloudKitSyncState_statistics));
}

- (double)lastDownloadProgress
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState_lastDownloadProgress);
}

- (NSDate)exitDate
{
  return (NSDate *)sub_1A2177A48(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__exitDate);
}

- (NSDate)lastFullSyncDate
{
  return (NSDate *)sub_1A2177A48(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastFullSyncDate);
}

- (NSDate)lastFullPartialSyncDate
{
  return (NSDate *)sub_1A2177A48(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastFullPartialSyncDate);
}

- (NSDate)lastSyncDate
{
  return (NSDate *)sub_1A2177A48(self, (uint64_t)a2, &OBJC_IVAR___IMCloudKitSyncState__lastSyncDate);
}

- (BOOL)isSyncing
{
  IMCloudKitSyncState *v2;
  char v3;

  v2 = self;
  v3 = sub_1A2177C9C();

  return v3 & 1;
}

- (BOOL)isSyncingPaused
{
  IMCloudKitSyncState *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1A2177E5C();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isSyncingEnabled
{
  IMCloudKitSyncState *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1A2177F68();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isSyncingAvailable
{
  IMCloudKitSyncState *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1A21781E8();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)syncingFailed
{
  IMCloudKitSyncState *v2;
  NSArray *v3;

  v2 = self;
  v3 = -[IMCloudKitSyncState errors](v2, sel_errors);

  if (v3)
  return v3 != 0;
}

- (BOOL)canEnableSyncing
{
  IMCloudKitSyncState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A2178564();

  return v3 & 1;
}

- (BOOL)canStartSyncing
{
  IMCloudKitSyncState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A2178608();

  return v3 & 1;
}

- (BOOL)canChangeEnabledSetting
{
  IMCloudKitSyncState *v2;
  id v4;

  v2 = self;
  if (-[IMCloudKitSyncState isSyncingAvailable](v2, sel_isSyncingAvailable)
    && (id)-[IMCloudKitSyncState changingEnabledState](v2, sel_changingEnabledState) != (id)1)
  {
    v4 = -[IMCloudKitSyncState changingEnabledState](v2, sel_changingEnabledState);

    return v4 != (id)2;
  }
  else
  {

    return 0;
  }
}

- (BOOL)isSyncEnabledForDisplayOnly
{
  IMCloudKitSyncState *v2;
  char v3;

  v2 = self;
  v3 = sub_1A2178730();

  return v3 & 1;
}

- (NSString)syncStatusText
{
  IMCloudKitSyncState *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A2178B44();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isBetweenInitialAndFullSync
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncState__isBetweenInitialAndFullSync);
}

- (BOOL)accountNeedsRepair
{
  IMCloudKitSyncState *v3;
  void *v4;
  id v5;

  sub_1A2199764();
  v3 = self;
  v4 = (void *)sub_1A2199758();
  v5 = -[IMCloudKitSyncState syncErrorWithDomain:code:](v3, sel_syncErrorWithDomain_code_, v4, 3);

  swift_bridgeObjectRelease();
  if (v5)

  return v5 != 0;
}

- (id)syncErrorWithDomain:(id)a3 code:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  IMCloudKitSyncState *v9;
  id v10;
  void *v11;

  v6 = sub_1A2199764();
  v8 = v7;
  v9 = self;
  v10 = sub_1A2179034(v6, v8, (id)a4);

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1A2199560();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)description
{
  IMCloudKitSyncState *v2;
  void *v3;

  v2 = self;
  IMCloudKitSyncState.description.getter();

  v3 = (void *)sub_1A2199758();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (IMCloudKitSyncState)init
{
  IMCloudKitSyncState *result;

  result = (IMCloudKitSyncState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)shouldSendSyncProgress
{
  IMCloudKitSyncState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A2181D38();

  return v3 & 1;
}

- (BOOL)shouldFetchSyncStatistics
{
  IMCloudKitSyncState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A2181E34();

  return v3 & 1;
}

- (BOOL)hasNotSyncedInLastSevenDays
{
  IMCloudKitSyncState *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1A2181EFC();

  return v3;
}

- (id)createSyncProgressWithSyncStatistics:(id)a3
{
  IMCloudKitSyncState *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;

  v4 = self;
  v5 = a3;
  v6 = sub_1A2179CBC(v4);
  sub_1A2179EEC(v6);
  v8 = v7;

  return v8;
}

@end

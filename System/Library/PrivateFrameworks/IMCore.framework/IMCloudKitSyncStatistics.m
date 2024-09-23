@implementation IMCloudKitSyncStatistics

- (int64_t)syncedChatCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 32];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)totalChatCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 40];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)unresolvedChatCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 56];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverChatTotalCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 96];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverChatLiveCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 104];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWritableChatCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 72];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWrittenChatCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 80];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncedMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 128];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)totalMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 136];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)unresolvedMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 152];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverMessageTotalCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 192];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverMessageLiveCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 200];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWritableMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 168];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWrittenMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 176];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncedAttachmentCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 224];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)totalAttachmentCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 232];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)unresolvedAttachmentCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 248];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverAttachmentTotalCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 288];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverAttachmentLiveCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 296];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWritableAttachmentCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 264];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWrittenAttachmentCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 272];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverMessageUpdateTotalCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 384];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverMessageUpdateLiveCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 392];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWritableMessageUpdateCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 360];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWrittenMessageUpdateCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 368];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverRecoverableMessageTotalCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 480];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)serverRecoverableMessageLiveCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 488];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWritableRecoverableMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 456];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncStoreWrittenRecoverableMessageCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 464];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)syncedRecordCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)totalRecordCount
{
  int64_t result;

  result = *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMCloudKitSyncStatistics_statistics);
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)unresolvedRecordCount
{
  int64_t result;

  result = *(_QWORD *)&self->statistics[OBJC_IVAR___IMCloudKitSyncStatistics_statistics + 8];
  if (result < 0)
    __break(1u);
  return result;
}

- (double)percentSynced
{
  IMCloudKitSyncStatistics *v2;
  double v3;
  int64_t v4;

  v2 = self;
  v3 = (double)-[IMCloudKitSyncStatistics syncedRecordCount](v2, sel_syncedRecordCount);
  v4 = -[IMCloudKitSyncStatistics totalRecordCount](v2, sel_totalRecordCount);

  return v3 / (double)v4;
}

- (int64_t)remainingMessagesCount
{
  IMCloudKitSyncStatistics *v2;
  char *v3;
  int64_t result;
  char *v5;
  int64_t v6;

  v2 = self;
  v3 = -[IMCloudKitSyncStatistics totalMessageCount](v2, sel_totalMessageCount);
  result = -[IMCloudKitSyncStatistics syncedMessageCount](v2, sel_syncedMessageCount);
  v5 = &v3[-result];
  if (__OFSUB__(v3, result))
  {
    __break(1u);
  }
  else
  {
    v6 = -[IMCloudKitSyncStatistics unresolvedMessageCount](v2, sel_unresolvedMessageCount);

    if (!__OFSUB__(v5, v6))
      return (unint64_t)&v5[-v6] & ~((uint64_t)&v5[-v6] >> 63);
  }
  __break(1u);
  return result;
}

+ (double)calculatePercentageOfTotal:(double)a3 count:(double)a4
{
  double v4;
  BOOL v5;
  double result;

  v4 = a4 / a3;
  v5 = a3 == 0.0;
  result = 1.0;
  if (!v5)
    return v4;
  return result;
}

+ (id)percentStringFromDouble:(double)a3
{
  uint64_t v4;
  void *v5;

  sub_1A200E71C(0, (unint64_t *)&qword_1EE65E760);
  MEMORY[0x1A8581B4C](a3);
  if (v4)
  {
    v5 = (void *)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)percentStringFromTotal:(double)a3 count:(double)a4
{
  id v5;

  objc_msgSend(a1, sel_calculatePercentageOfTotal_count_, a3, a4);
  v5 = objc_msgSend(a1, sel_percentStringFromDouble_);
  if (v5)
  {
    sub_1A2199764();

    v5 = (id)sub_1A2199758();
    swift_bridgeObjectRelease();
  }
  return v5;
}

- (NSString)description
{
  IMCloudKitSyncStatistics *v2;
  void *v3;

  v2 = self;
  IMCloudKitSyncStatistics.description.getter();

  v3 = (void *)sub_1A2199758();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (IMCloudKitSyncStatistics)init
{
  IMCloudKitSyncStatistics *result;

  result = (IMCloudKitSyncStatistics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (IMCloudKitSyncStatistics)initWithStatisticsDictionary:(id)a3
{
  id v3;
  IMCloudKitSyncStatistics *v4;

  sub_1A219974C();
  v3 = objc_allocWithZone((Class)IMCloudKitSyncStatistics);
  v4 = (IMCloudKitSyncStatistics *)sub_1A21845FC();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

+ (id)_createSyncStatisticsDictionary:(int64_t)a3 messageSyncCount:(int64_t)a4 messageUnresolvedCount:(int64_t)a5 chatCount:(int64_t)a6 chatSyncCount:(int64_t)a7 chatUnresolvedCount:(int64_t)a8 attachmentCount:(int64_t)a9 attachmentSyncCount:(int64_t)a10 attachmentUnresolvedCount:(int64_t)a11 serverRecordCounts:(id)a12 syncStoreCounts:(id)a13
{
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v18 = sub_1A219974C();
  sub_1A200E71C(0, &qword_1EE65EA38);
  v19 = sub_1A219974C();
  v20 = (void *)sub_1A219567C(a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

+ (id)_createSyncStatisticsDictionaryForSyncControllerSyncState:(unint64_t)a3 syncType:(int64_t)a4 count:(double)a5 max:(double)a6 unresolved:(double)a7
{
  swift_getObjCClassMetadata();
  return (id)sub_1A2195960(a4, a5, a6, a7);
}

- (id)_syncStatisticsDictionary
{
  IMCloudKitSyncStatistics *v2;
  id v3;

  v2 = self;
  v3 = sub_1A2195474();

  return v3;
}

@end

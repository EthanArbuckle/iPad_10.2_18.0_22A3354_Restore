@implementation IMDScheduledMessageStore

- (CKRecordZoneID)recordZoneID
{
  void *v3;
  IMDScheduledMessageStore *v4;
  CKRecordZoneID *result;
  CKRecordZoneID *v6;
  id v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  result = (CKRecordZoneID *)objc_msgSend(v3, sel_sharedInstance);
  if (result)
  {
    v6 = result;
    v7 = -[CKRecordZoneID scheduledMessageRecordZoneID](result, sel_scheduledMessageRecordZoneID);

    return (CKRecordZoneID *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)messageRecordsToUploadToCloudKitWithLimit:(int64_t)a3
{
  IMDScheduledMessageStore *v4;
  void *v5;

  v4 = self;
  ScheduledMessageStore.messageRecordsToUploadToCloudKit(withLimit:)(a3);

  v5 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3
{
  void *v3;

  _s12IMDaemonCore21ScheduledMessageStoreC25recordIDsAndGUIDsToDelete9withLimitSaySDys11AnyHashableVypGGs5Int64V_tF_0(a3);
  sub_1D141AC58(&qword_1ED935B90);
  v3 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  unint64_t v4;
  IMDScheduledMessageStore *v5;

  sub_1D15FD3C0(0, (unint64_t *)&qword_1ED935BB0);
  v4 = sub_1D166DBEC();
  v5 = self;
  _s12IMDaemonCore21ScheduledMessageStoreC15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0(v4);

  swift_bridgeObjectRelease();
}

- (IMDScheduledMessageStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[IMDMessageStore init](&v3, sel_init);
}

@end

@implementation IMDRecoverableMessageStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  IMDRecoverableMessageStore *v6;
  void *v7;

  v6 = self;
  sub_1D1646414(a4);

  sub_1D15FD3C0(0, (unint64_t *)&unk_1ED935890);
  v7 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4;
  IMDRecoverableMessageStore *v5;

  v4 = a3;
  v5 = self;
  RecoverableMessageStore.recordUpdateSucceeded(forRecord:)((CKRecord)v4);

}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v7;
  IMDRecoverableMessageStore *v8;
  id v9;

  v7 = a3;
  v9 = a5;
  v8 = self;
  sub_1D1646B2C(v7, v9);

}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  IMDRecoverableMessageStore *v5;
  void *v6;

  v5 = self;
  RecoverableMessageStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D15FD3C0(0, (unint64_t *)&qword_1ED935BB0);
  sub_1D1610804();
  v6 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  IMDRecoverableMessageStore *v4;

  sub_1D15FD3C0(0, (unint64_t *)&qword_1ED935BB0);
  sub_1D166DBEC();
  v4 = self;
  _s12IMDaemonCore23RecoverableMessageStoreC15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

- (IMDRecoverableMessageStore)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDRecoverableMessageStore_metadataByRecordNameMap) = (Class)MEMORY[0x1E0DEE9E0];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[IMDRecoverableMessageStore init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

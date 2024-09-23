@implementation BRCDownload

- (int)kind
{
  return -1;
}

- (NSString)etagIfLoser
{
  return 0;
}

- (NSNumber)transferID
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_throttleID);
}

- (CKRecordID)secondaryRecordID
{
  return 0;
}

- (CKRecord)secondaryRecord
{
  return 0;
}

- (BRCDownload)initWithDocument:(id)a3 stageID:(id)a4
{
  id v6;
  id v7;
  BRCDownload *v8;
  uint64_t v9;
  BRCItemID *itemID;
  uint64_t v11;
  CKRecordID *recordID;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *etag;
  uint64_t v17;
  BRCClientZone *clientZone;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRCDownload;
  v8 = -[BRCDownload init](&v20, sel_init);
  if (v8)
  {
    v8->_throttleID = objc_msgSend(v6, "dbRowID");
    objc_msgSend(v6, "itemID");
    v9 = objc_claimAutoreleasedReturnValue();
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    objc_msgSend(v6, "documentRecordID");
    v11 = objc_claimAutoreleasedReturnValue();
    recordID = v8->_recordID;
    v8->_recordID = (CKRecordID *)v11;

    objc_storeStrong((id *)&v8->_stageID, a4);
    objc_msgSend(v6, "desiredVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "etag");
    v15 = objc_claimAutoreleasedReturnValue();
    etag = v8->_etag;
    v8->_etag = (NSString *)v15;

    objc_msgSend(v6, "clientZone");
    v17 = objc_claimAutoreleasedReturnValue();
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v17;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (-[BRCDownload progressPublished](self, "progressPublished"))
    -[BRCProgress brc_unpublish](self->_progress, "brc_unpublish");
  v3.receiver = self;
  v3.super_class = (Class)BRCDownload;
  -[BRCDownload dealloc](&v3, sel_dealloc);
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (BOOL)progressPublished
{
  return self->_progressPublished;
}

- (void)setProgressPublished:(BOOL)a3
{
  self->_progressPublished = a3;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSString)stageID
{
  return self->_stageID;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end

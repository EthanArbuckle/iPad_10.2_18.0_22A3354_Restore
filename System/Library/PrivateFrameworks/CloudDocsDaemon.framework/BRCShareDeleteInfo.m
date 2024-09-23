@implementation BRCShareDeleteInfo

- (BRCShareDeleteInfo)initWithShareID:(id)a3 emptyRecord:(id)a4
{
  id v7;
  id v8;
  BRCShareDeleteInfo *v9;
  BRCShareDeleteInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCShareDeleteInfo;
  v9 = -[BRCShareDeleteInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shareID, a3);
    objc_storeStrong((id *)&v10->_emptyRecord, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  return -[CKRecordID hash](self->_shareID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CKRecordID *shareID;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    shareID = self->_shareID;
    objc_msgSend(v4, "shareID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKRecordID isEqual:](shareID, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (CKRecord)emptyRecord
{
  return self->_emptyRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyRecord, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

@end

@implementation HMBLocalSQLContextRowItem

- (HMBLocalSQLContextRowItem)initWithItemRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelEncoding:(unint64_t)a6 modelData:(id)a7
{
  id v13;
  id v14;
  id v15;
  HMBLocalSQLContextRowItem *v16;
  HMBLocalSQLContextRowItem *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMBLocalSQLContextRowItem;
  v16 = -[HMBLocalSQLContextRowItem init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_itemRow = a3;
    objc_storeStrong((id *)&v16->_modelData, a7);
    v17->_modelEncoding = a6;
    objc_storeStrong((id *)&v17->_externalID, a4);
    objc_storeStrong((id *)&v17->_externalData, a5);
  }

  return v17;
}

- (HMBLocalSQLContextRowItem)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4
{
  char v4;
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  sqlite3_int64 v10;
  void *v11;
  HMBLocalSQLContextRowItem *v12;

  v4 = a4;
  v7 = sqlite3_column_int64(a3, 0);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    v11 = 0;
    goto LABEL_6;
  }
  v8 = 0;
  v9 = 0;
  if ((v4 & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v10 = sqlite3_column_int64(a3, 3);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](self, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", v7, v9, v8, v10, v11);

  return v12;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMBLocalSQLContextRowItem itemRow](self, "itemRow");
  -[HMBLocalSQLContextRowItem externalID](self, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmbDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalSQLContextRowItem externalData](self, "externalData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmbDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMBLocalSQLContextRowItem modelEncoding](self, "modelEncoding");
  -[HMBLocalSQLContextRowItem modelData](self, "modelData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<RowItem: %lu  eid: %@  ed: %@  encoding: %lu data: %@>"), v4, v6, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)itemRow
{
  return self->_itemRow;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (unint64_t)modelEncoding
{
  return self->_modelEncoding;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (NSData)externalData
{
  return self->_externalData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
}

@end

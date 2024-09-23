@implementation RecordSet

- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4
{
  id v6;
  id v7;
  RecordSet *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__RecordSet_initWithNativeRecords_nativeRecordInfo___block_invoke;
  v10[3] = &unk_2510B5FC0;
  v11 = v6;
  v7 = v6;
  v8 = -[RecordSet initWithNativeRecords:nativeRecordInfo:dataFetcher:](self, "initWithNativeRecords:nativeRecordInfo:dataFetcher:", v7, a4, v10);

  return v8;
}

id __52__RecordSet_initWithNativeRecords_nativeRecordInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  FindRecordTypeForRecordUUID(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  RecordDataForUUID(v6, v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (RecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 dataFetcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  RecordSet *v11;
  uint64_t v12;
  NSDictionary *nativeRecords;
  uint64_t v14;
  NSDictionary *nativeRecordInfo;
  uint64_t v16;
  id dataFetcher;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RecordSet;
  v11 = -[RecordSet init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    nativeRecords = v11->_nativeRecords;
    v11->_nativeRecords = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    nativeRecordInfo = v11->_nativeRecordInfo;
    v11->_nativeRecordInfo = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    dataFetcher = v11->_dataFetcher;
    v11->_dataFetcher = (id)v16;

  }
  return v11;
}

- (id)nativeRecordInfoForRecordUUID:(id)a3
{
  return -[NSDictionary objectForKey:](self->_nativeRecordInfo, "objectForKey:", a3);
}

- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4
{
  return (id)(*((uint64_t (**)(void))self->_dataFetcher + 2))();
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_nativeRecordInfo, "count");
}

- (id)_anyNativeRecordUUID
{
  NSDictionary *v2;
  id v3;
  _OWORD v5[4];
  _BYTE v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(v5, 0, sizeof(v5));
  v2 = self->_nativeRecordInfo;
  if (-[NSDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", v5, v6, 16))
  {
    v3 = **((id **)&v5[0] + 1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSDictionary)nativeRecords
{
  return self->_nativeRecords;
}

- (NSDictionary)nativeRecordInfo
{
  return self->_nativeRecordInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativeRecordInfo, 0);
  objc_storeStrong((id *)&self->_nativeRecords, 0);
  objc_storeStrong(&self->_dataFetcher, 0);
}

@end

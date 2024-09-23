@implementation DESRecordSet

+ (id)recordSetWithRecipeType:(id)a3 nativeRecords:(id)a4 coreDuetEventsUUIDs:(id)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);
  return 0;
}

- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5
{
  id v8;
  id v9;
  DESRecordSet *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__DESRecordSet_initWithNativeRecords_nativeRecordInfo_coreDuetEvents___block_invoke;
  v12[3] = &unk_1E706E988;
  v13 = v8;
  v9 = v8;
  v10 = -[DESRecordSet initWithNativeRecords:nativeRecordInfo:coreDuetEvents:predicate:dataFetcher:](self, "initWithNativeRecords:nativeRecordInfo:coreDuetEvents:predicate:dataFetcher:", v9, a4, a5, 0, v12);

  return v10;
}

id __70__DESRecordSet_initWithNativeRecords_nativeRecordInfo_coreDuetEvents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (DESRecordSet)initWithNativeRecords:(id)a3 nativeRecordInfo:(id)a4 coreDuetEvents:(id)a5 predicate:(id)a6 dataFetcher:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  DESRecordSet *v17;
  uint64_t v18;
  NSDictionary *predicate;
  uint64_t v20;
  NSDictionary *nativeRecords;
  uint64_t v22;
  NSDictionary *nativeRecordInfo;
  uint64_t v24;
  NSArray *coreDuetEvents;
  uint64_t v26;
  id dataFetcher;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)DESRecordSet;
  v17 = -[DESRecordSet init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    predicate = v17->_predicate;
    v17->_predicate = (NSDictionary *)v18;

    v20 = objc_msgSend(v12, "copy");
    nativeRecords = v17->_nativeRecords;
    v17->_nativeRecords = (NSDictionary *)v20;

    v22 = objc_msgSend(v13, "copy");
    nativeRecordInfo = v17->_nativeRecordInfo;
    v17->_nativeRecordInfo = (NSDictionary *)v22;

    v24 = objc_msgSend(v14, "copy");
    coreDuetEvents = v17->_coreDuetEvents;
    v17->_coreDuetEvents = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    dataFetcher = v17->_dataFetcher;
    v17->_dataFetcher = (id)v26;

  }
  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(NumOfDESRecord=%lu, NumOfCoreDuetEvent=%ld)"), v5, -[NSDictionary count](self->_nativeRecordInfo, "count"), -[NSArray count](self->_coreDuetEvents, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nativeRecordInfoForRecordUUID:(id)a3
{
  return -[NSDictionary objectForKey:](self->_nativeRecordInfo, "objectForKey:", a3);
}

- (id)nativeRecordDataForRecordUUID:(id)a3 error:(id *)a4
{
  DESLogAndSetSunsetError(a4);
  return 0;
}

- (unint64_t)count
{
  NSUInteger v3;

  v3 = -[NSDictionary count](self->_nativeRecordInfo, "count");
  return -[NSArray count](self->_coreDuetEvents, "count") + v3;
}

- (id)_anyNativeRecordUUID
{
  NSDictionary *v2;
  id v3;
  _OWORD v5[4];
  _BYTE v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
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

- (id)filteredRecordSetWithJSONPredicate:(id)a3
{
  id v3;
  DESRecordSet *v4;

  v3 = DESLogAndReturnSunsetError();
  v4 = [DESRecordSet alloc];
  return -[DESRecordSet initWithNativeRecords:nativeRecordInfo:coreDuetEvents:](v4, "initWithNativeRecords:nativeRecordInfo:coreDuetEvents:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *coreDuetEvents;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_nativeRecords, CFSTR("nativeRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nativeRecordInfo, CFSTR("nativeRecordInfo"));
  coreDuetEvents = self->_coreDuetEvents;
  if (coreDuetEvents)
    objc_msgSend(v5, "encodeObject:forKey:", coreDuetEvents, CFSTR("coreDuetEvents"));

}

- (DESRecordSet)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  DESRecordSet *v23;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("nativeRecords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("nativeRecordInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("coreDuetEvents")))
  {
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v21, CFSTR("coreDuetEvents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA60];
  }
  v23 = -[DESRecordSet initWithNativeRecords:nativeRecordInfo:coreDuetEvents:](self, "initWithNativeRecords:nativeRecordInfo:coreDuetEvents:", v9, v17, v22);

  return v23;
}

- (NSDictionary)nativeRecords
{
  return self->_nativeRecords;
}

- (NSDictionary)nativeRecordInfo
{
  return self->_nativeRecordInfo;
}

- (NSArray)coreDuetEvents
{
  return self->_coreDuetEvents;
}

- (NSDictionary)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_coreDuetEvents, 0);
  objc_storeStrong((id *)&self->_nativeRecordInfo, 0);
  objc_storeStrong((id *)&self->_nativeRecords, 0);
  objc_storeStrong(&self->_dataFetcher, 0);
}

@end

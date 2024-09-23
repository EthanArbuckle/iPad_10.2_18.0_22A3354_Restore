@implementation HMDRecordsSavedLogEvent

- (HMDRecordsSavedLogEvent)initWithSavedRecords:(id)a3 isLegacy:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  HMDRecordsSavedLogEvent *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "size");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)HMDRecordsSavedLogEvent;
  v12 = -[HMDRecordOperationLogEvent initWithSize:isLegacy:](&v14, sel_initWithSize_isLegacy_, v9, v4);

  return v12;
}

+ (id)recordsSaved:(id)a3
{
  id v3;
  HMDRecordsSavedLogEvent *v4;

  v3 = a3;
  v4 = -[HMDRecordsSavedLogEvent initWithSavedRecords:isLegacy:]([HMDRecordsSavedLogEvent alloc], "initWithSavedRecords:isLegacy:", v3, 0);

  return v4;
}

+ (id)legacyRecordsSaved:(id)a3
{
  id v3;
  HMDRecordsSavedLogEvent *v4;

  v3 = a3;
  v4 = -[HMDRecordsSavedLogEvent initWithSavedRecords:isLegacy:]([HMDRecordsSavedLogEvent alloc], "initWithSavedRecords:isLegacy:", v3, 1);

  return v4;
}

@end

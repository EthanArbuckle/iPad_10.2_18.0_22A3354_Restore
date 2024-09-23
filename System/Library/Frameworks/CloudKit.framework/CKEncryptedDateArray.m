@implementation CKEncryptedDateArray

- (CKEncryptedDateArray)initWithDateArray:(id)a3
{
  id v4;
  CKDPRecordFieldValueEncryptedValue *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CKDPDate *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CKEncryptedDateArray *v27;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v13 = objc_alloc_init(CKDPDate);
        objc_msgSend_timeIntervalSinceReferenceDate(v12, v14, v15, v16);
        objc_msgSend_setTime_(v13, v17, v18, v19);
        objc_msgSend_addDateListValue_(v5, v20, (uint64_t)v13, v21);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v22, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v9);
  }

  objc_msgSend_data(v5, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)CKEncryptedDateArray;
  v27 = -[CKEncryptedData initWithData:](&v29, sel_initWithData_, v26);

  return v27;
}

- (NSArray)dateArray
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CKDPRecordFieldValueEncryptedValue *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_dateListValues(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1E1F58898, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return (NSArray *)v15;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedDateArray *, char *))MEMORY[0x1E0DE7D20])(self, sel_dateArray);
}

@end

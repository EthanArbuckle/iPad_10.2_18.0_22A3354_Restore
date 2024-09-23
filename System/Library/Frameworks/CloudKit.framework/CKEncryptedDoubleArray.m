@implementation CKEncryptedDoubleArray

- (CKEncryptedDoubleArray)initWithDoubleArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CKEncryptedDoubleArray *v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend_doubleValue(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v14), v9, v10, v11);
        objc_msgSend_addDoubleListValue_(v5, v15, v16, v17);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v12);
  }

  objc_msgSend_data(v5, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CKEncryptedDoubleArray;
  v22 = -[CKEncryptedData initWithData:](&v24, sel_initWithData_, v21);

  return v22;
}

- (NSArray)doubleArray
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  CKDPRecordFieldValueEncryptedValue *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = [CKDPRecordFieldValueEncryptedValue alloc];
    v9 = (void *)objc_msgSend_initWithData_(v6, v7, (uint64_t)v4, v8);
    if (objc_msgSend_doubleListValuesCount(v9, v10, v11, v12))
    {
      v16 = 0;
      do
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = objc_msgSend_doubleListValues(v9, v13, v14, v15);
        objc_msgSend_numberWithDouble_(v17, v19, v20, v21, *(double *)(v18 + 8 * v16));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v23, (uint64_t)v22, v24);

        ++v16;
      }
      while (v16 < objc_msgSend_doubleListValuesCount(v9, v25, v26, v27));
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedDoubleArray *, char *))MEMORY[0x1E0DE7D20])(self, sel_doubleArray);
}

@end

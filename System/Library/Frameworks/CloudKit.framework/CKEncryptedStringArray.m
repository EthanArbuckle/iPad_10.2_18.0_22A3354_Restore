@implementation CKEncryptedStringArray

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedStringArray *, char *))MEMORY[0x1E0DE7D20])(self, sel_stringArray);
}

- (NSArray)stringArray
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

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_stringListValues(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return (NSArray *)v12;
}

- (CKEncryptedStringArray)initWithStringArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CKEncryptedStringArray *v25;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend_setStringListValues_(v5, v7, (uint64_t)v6, v8);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v9);
        v18 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addStringListValue_(v5, v19, (uint64_t)v18, v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v15);
  }

  objc_msgSend_data(v5, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)CKEncryptedStringArray;
  v25 = -[CKEncryptedData initWithData:](&v27, sel_initWithData_, v24);

  return v25;
}

@end

@implementation CKEncryptedLocationArray

- (CKEncryptedLocationArray)initWithLocationArray:(id)a3
{
  id v4;
  CKDPRecordFieldValueEncryptedValue *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CKEncryptedLocationArray *v24;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v6 = (void *)objc_opt_new();
  objc_msgSend_setLocationListValues_(v5, v7, (uint64_t)v6, v8);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v9);
        objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E0C9E3B8], v12, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16), v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addLocationListValue_(v5, v18, (uint64_t)v17, v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  objc_msgSend_data(v5, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)CKEncryptedLocationArray;
  v24 = -[CKEncryptedData initWithData:](&v26, sel_initWithData_, v23);

  return v24;
}

- (NSArray)locationArray
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
    objc_msgSend_locationListValues(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1E1F58D18, v14);
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
  return (id)((uint64_t (*)(CKEncryptedLocationArray *, char *))MEMORY[0x1E0DE7D20])(self, sel_locationArray);
}

@end

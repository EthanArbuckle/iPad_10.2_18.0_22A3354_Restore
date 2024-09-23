@implementation FlexLocalDBSongData

- (id)initForRecordCreationWithUID:(id)a3 songData:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithUID_songData_shouldValidate_, a3, a4, 1);
}

- (id)initForRecordUpdateWithUID:(id)a3 songData:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_initWithUID_songData_shouldValidate_, a3, a4, 0);
}

- (FlexLocalDBSongData)initWithUID:(id)a3 songData:(id)a4 shouldValidate:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  FlexLocalDBSongData *v11;
  FlexLocalDBSongData *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *songData;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FlexLocalDBSongData;
  v11 = -[FlexLocalDBSongData init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uid, a3);
    v13 = objc_alloc(MEMORY[0x24BDD1880]);
    v17 = (void *)objc_msgSend_initWithUUIDString_(v13, v14, (uint64_t)v9, v15, v16);
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v18, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    songData = v12->_songData;
    v12->_songData = (NSMutableDictionary *)v22;

    objc_msgSend_addEntriesFromDictionary_(v12->_songData, v24, (uint64_t)v10, v25, v26);
    if (v5 && !objc_msgSend__validateSongData(v12, v27, v28, v29, v30) || !v17)
    {

      v12 = 0;
    }

  }
  return v12;
}

- (BOOL)_validateSongData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__allRequiredKeys(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_songData;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v12);
        objc_msgSend_removeObject_(v11, v15, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v16, v17, (_QWORD)v27);
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v18);
  }

  v25 = objc_msgSend_count(v11, v21, v22, v23, v24) == 0;
  return v25;
}

- (id)_allRequiredKeys
{
  if (qword_2549A1980 != -1)
    dispatch_once(&qword_2549A1980, &unk_24C5EFB88);
  return (id)qword_2549A1988;
}

- (NSDictionary)songData
{
  return &self->_songData->super;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songData, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end

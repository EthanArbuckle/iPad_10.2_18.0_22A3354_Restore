@implementation CKDAssetVolumeTable

+ (id)dbProperties
{
  return &unk_1E78AFB18;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDAssetVolumeTable)initWithLogicalTableName:(id)a3
{
  CKDAssetVolumeTable *v3;
  uint64_t v4;
  NSMutableDictionary *volumeIndexByVolumeUUID;
  uint64_t v6;
  NSMutableDictionary *volumeUUIDByVolumeIndex;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDAssetVolumeTable;
  v3 = -[CKSQLiteTable initWithLogicalTableName:](&v9, sel_initWithLogicalTableName_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    volumeIndexByVolumeUUID = v3->_volumeIndexByVolumeUUID;
    v3->_volumeIndexByVolumeUUID = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    volumeUUIDByVolumeIndex = v3->_volumeUUIDByVolumeIndex;
    v3->_volumeUUIDByVolumeIndex = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (id)wakeFromDatabase
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BEB6F3D0;
  v3[3] = &unk_1E78351A8;
  v3[4] = self;
  objc_msgSend_enumerateEntriesWithBlock_(self, a2, (uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_lockedSetVolumeIndex:(id)a3 forVolumeUUID:(id)a4
{
  NSMutableDictionary *volumeIndexByVolumeUUID;
  id v7;
  const char *v8;
  const char *v9;
  id v10;

  volumeIndexByVolumeUUID = self->_volumeIndexByVolumeUUID;
  v7 = a4;
  v10 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(volumeIndexByVolumeUUID, v8, (uint64_t)v10, v7);
  objc_msgSend_setObject_forKeyedSubscript_(self->_volumeUUIDByVolumeIndex, v9, (uint64_t)v7, v10);

}

- (id)volumeIndexForVolumeUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD *v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend_objectForKeyedSubscript_(self->_volumeIndexByVolumeUUID, v6, (uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend_setVolumeUUID_(v8, v9, (uint64_t)v4);
      objc_msgSend_insertObject_(self, v10, (uint64_t)v8);
      v11 = objc_claimAutoreleasedReturnValue();
      v14 = (_QWORD *)MEMORY[0x1E0C95300];
      v15 = (os_log_t *)MEMORY[0x1E0C952A8];
      if (v11)
      {
        v16 = (void *)v11;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v17 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
        {
          v24 = 138412290;
          v25 = v16;
          _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "volumeIndexForVolumeUUID failed: %@", (uint8_t *)&v24, 0xCu);
        }

        goto LABEL_9;
      }
      objc_msgSend_volumeIndex(v8, v12, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_volumeIndex(v8, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__lockedSetVolumeIndex_forVolumeUUID_(self, v22, (uint64_t)v21, v4);

      if (!v7)
      {
LABEL_9:
        if (*v14 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v18 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
        {
          v24 = 138543362;
          v25 = v4;
          _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "volumeIndexForVolumeUUID is returning nil for volumeUUID=%{public}@", (uint8_t *)&v24, 0xCu);
        }
        v7 = 0;
      }
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_17;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (id)volumeUUIDWithVolumeIndex:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_volumeUUIDByVolumeIndex, v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952A8], OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_INFO, "volumeUUIDWithVolumeIndex is returning nil for volumeIndex=%{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)unmountedAssetVolumes
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CKDAssetVolumeTable *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEB6F90C;
  v9[3] = &unk_1E78351D0;
  v4 = v3;
  v10 = v4;
  v11 = self;
  v6 = (id)objc_msgSend_enumerateEntriesWithBlock_(self, v5, (uint64_t)v9);
  v7 = v4;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeIndexByVolumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUIDByVolumeIndex, 0);
}

@end

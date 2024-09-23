@implementation CKDProgressTracker

+ (unint64_t)_sizeForItem:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend_isConstructedAsset(v4, v5, v6))
      v9 = objc_msgSend_constructedAssetEstimatedSize(v4, v7, v8);
    else
      v9 = objc_msgSend_size(v4, v7, v8);
    v13 = v9;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend_size(v3, v10, v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        goto LABEL_12;
      }
      v12 = objc_msgSend_fileSize(v3, v14, v15);
    }
    v13 = v12;
  }
LABEL_12:

  return v13;
}

- (CKDProgressTracker)init
{
  const char *v2;
  uint64_t v3;
  CKDProgressTracker *v4;
  uint64_t v5;
  NSMapTable *completedBytesByItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDProgressTracker;
  v4 = -[CKDProgressTracker init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    completedBytesByItems = v4->_completedBytesByItems;
    v4->_completedBytesByItems = (NSMapTable *)v5;

  }
  return v4;
}

- (CKDProgressTracker)initWithTrackingID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKDProgressTracker *v9;

  v5 = a3;
  v8 = objc_msgSend_init(self, v6, v7);
  v9 = (CKDProgressTracker *)v8;
  if (v8)
    objc_storeStrong((id *)(v8 + 48), a3);

  return v9;
}

- (void)startTrackingItems:(id)a3
{
  id v4;
  CKDProgressTracker *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend_setObject_forKey_(v5->_completedBytesByItems, v8, (uint64_t)&unk_1E78B09E8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v17, v25, 16);
    }
    while (v9);
  }

  *(_WORD *)&v5->_hasCachedTotalBytes = 0;
  objc_sync_exit(v5);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v13 = v12;
    objc_msgSend_trackingID(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 2112;
    v24 = v6;
    _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "%@ started tracking items: %@", buf, 0x16u);

  }
}

- (void)stopTrackingItems:(id)a3
{
  id v4;
  CKDProgressTracker *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend_removeObjectForKey_(v5->_completedBytesByItems, v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v17, v25, 16);
    }
    while (v9);
  }

  *(_WORD *)&v5->_hasCachedTotalBytes = 0;
  objc_sync_exit(v5);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v13 = v12;
    objc_msgSend_trackingID(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 2112;
    v24 = v6;
    _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "%@ stopped tracking items: %@", buf, 0x16u);

  }
}

- (unint64_t)_updateTotalBytes
{
  uint64_t v2;
  unint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  if (self->_hasCachedTotalBytes)
    return self->_cachedTotalBytes;
  objc_msgSend_keyEnumerator(self->_completedBytesByItems, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextObject(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = (void *)v8;
    v4 = 0;
    do
    {
      v4 += objc_msgSend__sizeForItem_(CKDProgressTracker, v9, (uint64_t)v10);
      objc_msgSend_nextObject(v5, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    v4 = 0;
  }
  self->_cachedTotalBytes = v4;
  self->_hasCachedTotalBytes = 1;

  return v4;
}

- (unint64_t)_updateTotalCompletedBytes
{
  uint64_t v2;
  unint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_hasCachedCompletedBytes)
    return self->_cachedCompletedBytes;
  objc_msgSend_objectEnumerator(self->_completedBytesByItems, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextObject(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = (void *)v8;
    v4 = 0;
    do
    {
      v4 += objc_msgSend_unsignedLongLongValue(v11, v9, v10);
      objc_msgSend_nextObject(v5, v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    while (v14);
  }
  else
  {
    v4 = 0;
  }
  self->_cachedCompletedBytes = v4;
  self->_hasCachedCompletedBytes = 1;

  return v4;
}

- (double)updateProgressWithItem:(id)a3 progress:(double)a4
{
  id v6;
  CKDProgressTracker *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  unint64_t updated;
  double v13;
  const char *v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  unint64_t v27;
  NSMapTable *completedBytesByItems;
  void *v29;
  const char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  updated = objc_msgSend__updateTotalBytes(v7, v8, v9);
  v13 = 0.0;
  if (updated)
  {
    v15 = objc_msgSend__updateTotalCompletedBytes(v7, v10, v11);
    if (v6)
    {
      objc_msgSend_objectForKey_(v7->_completedBytesByItems, v14, (uint64_t)v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_msgSend__sizeForItem_(CKDProgressTracker, v16, (uint64_t)v6);
        v21 = (double)v18 * a4;
        v22 = v18 >= (unint64_t)v21 ? (unint64_t)v21 : v18;
        if (v22 != objc_msgSend_unsignedLongLongValue(v17, v19, v20))
        {
          v25 = objc_msgSend_unsignedLongLongValue(v17, v23, v24);
          if (v15 >= v25)
            v27 = v15 - v25;
          else
            v27 = 0;
          completedBytesByItems = v7->_completedBytesByItems;
          objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v26, v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(completedBytesByItems, v30, (uint64_t)v29, v6);
          v15 = v27 + v22;

        }
      }

    }
    if (v15 >= updated)
      v31 = updated;
    else
      v31 = v15;
    v7->_cachedCompletedBytes = v31;
    v7->_hasCachedCompletedBytes = 1;
    v32 = (unint64_t)(v7->_lastItemPercentage * (double)updated);
    if (updated < v32)
      v32 = updated;
    v33 = v32 + updated;
    if (v33)
      v13 = (double)v31 / (double)v33;
  }
  objc_sync_exit(v7);

  return v13;
}

- (double)lastItemPercentage
{
  return self->_lastItemPercentage;
}

- (void)setLastItemPercentage:(double)a3
{
  self->_lastItemPercentage = a3;
}

- (BOOL)hasCachedTotalBytes
{
  return self->_hasCachedTotalBytes;
}

- (void)setHasCachedTotalBytes:(BOOL)a3
{
  self->_hasCachedTotalBytes = a3;
}

- (BOOL)hasCachedCompletedBytes
{
  return self->_hasCachedCompletedBytes;
}

- (void)setHasCachedCompletedBytes:(BOOL)a3
{
  self->_hasCachedCompletedBytes = a3;
}

- (unint64_t)cachedTotalBytes
{
  return self->_cachedTotalBytes;
}

- (void)setCachedTotalBytes:(unint64_t)a3
{
  self->_cachedTotalBytes = a3;
}

- (unint64_t)cachedCompletedBytes
{
  return self->_cachedCompletedBytes;
}

- (void)setCachedCompletedBytes:(unint64_t)a3
{
  self->_cachedCompletedBytes = a3;
}

- (NSMapTable)completedBytesByItems
{
  return self->_completedBytesByItems;
}

- (void)setCompletedBytesByItems:(id)a3
{
  objc_storeStrong((id *)&self->_completedBytesByItems, a3);
}

- (NSString)trackingID
{
  return self->_trackingID;
}

- (void)setTrackingID:(id)a3
{
  objc_storeStrong((id *)&self->_trackingID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_completedBytesByItems, 0);
}

@end

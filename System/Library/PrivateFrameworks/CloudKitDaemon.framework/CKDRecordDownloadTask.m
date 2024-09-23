@implementation CKDRecordDownloadTask

- (CKDRecordDownloadTask)initWithRecord:(id)a3 trackProgress:(BOOL)a4 assetsToDownload:(id)a5 assetsToDownloadInMemory:(id)a6 assetURLInfosToFillOut:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKDRecordDownloadTask *v17;
  CKDRecordDownloadTask *v18;
  dispatch_group_t v19;
  OS_dispatch_group *group;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  CKDProgressTracker *v30;
  const char *v31;
  uint64_t v32;
  CKDProgressTracker *progressTracker;
  void **p_progressTracker;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v68.receiver = self;
  v68.super_class = (Class)CKDRecordDownloadTask;
  v17 = -[CKDRecordDownloadTask init](&v68, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_record, a3);
    objc_storeStrong((id *)&v18->_assetsToDownload, a5);
    objc_storeStrong((id *)&v18->_assetsToDownloadInMemory, a6);
    objc_storeStrong((id *)&v18->_assetURLInfosToFillOut, a7);
    v19 = dispatch_group_create();
    group = v18->_group;
    v18->_group = (OS_dispatch_group *)v19;

    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_recordID(v13, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend_initWithFormat_(v21, v28, (uint64_t)CFSTR("down|%@"), v27);

    if (a4)
    {
      v30 = [CKDProgressTracker alloc];
      v32 = objc_msgSend_initWithTrackingID_(v30, v31, (uint64_t)v29);
      p_progressTracker = (void **)&v18->_progressTracker;
      progressTracker = v18->_progressTracker;
      v18->_progressTracker = (CKDProgressTracker *)v32;
    }
    else
    {
      p_progressTracker = (void **)&v18->_progressTracker;
      progressTracker = v18->_progressTracker;
      v18->_progressTracker = 0;
    }

    objc_msgSend_setLastItemPercentage_(*p_progressTracker, v35, v36, 0.01);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v37 = v14;
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v64, v71, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v65;
      while (1)
      {
        if (*(_QWORD *)v65 != v41)
          objc_enumerationMutation(v37);
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v40)
        {
          v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v42, (uint64_t)&v64, v71, 16);
          if (!v40)
            break;
        }
      }
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v43 = v15;
    v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v60, v70, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v61;
      while (1)
      {
        if (*(_QWORD *)v61 != v47)
          objc_enumerationMutation(v43);
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v46)
        {
          v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v48, (uint64_t)&v60, v70, 16);
          if (!v46)
            break;
        }
      }
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v49 = v16;
    v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v56, v69, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v57;
      while (1)
      {
        if (*(_QWORD *)v57 != v53)
          objc_enumerationMutation(v49);
        dispatch_group_enter((dispatch_group_t)v18->_group);
        if (!--v52)
        {
          v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v54, (uint64_t)&v56, v69, 16);
          if (!v52)
            break;
        }
      }
    }

  }
  return v18;
}

- (void)didDownloadAsset:(id)a3 error:(id)a4
{
  id v6;
  CKDRecordDownloadTask *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_assetsToDownload(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v30);

  if (v12)
  {
    objc_msgSend_group(v7, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v15);

    objc_msgSend_assetsToDownload(v7, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v18, v19, (uint64_t)v30);

  }
  objc_msgSend_assetsToDownloadInMemory(v7, v13, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_containsObject_(v20, v21, (uint64_t)v30);

  if (v22)
  {
    objc_msgSend_group(v7, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v25);

    objc_msgSend_assetsToDownloadInMemory(v7, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v28, v29, (uint64_t)v30);

  }
  objc_sync_exit(v7);

}

- (void)didFillOutURLInfo:(id)a3 error:(id)a4
{
  id v6;
  CKDRecordDownloadTask *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_assetURLInfosToFillOut(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v20);

  if (v12)
  {
    objc_msgSend_group(v7, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v15);

    objc_msgSend_assetURLInfosToFillOut(v7, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v18, v19, (uint64_t)v20);

  }
  objc_sync_exit(v7);

}

- (void)didCompleteTaskWithError:(id)a3
{
  id v4;
  const char *v5;
  CKDRecordDownloadTask *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_setError_(self, v5, (uint64_t)v4);
  v6 = self;
  objc_sync_enter(v6);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend_assetsToDownload(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v58, v64, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v59;
    while (1)
    {
      if (*(_QWORD *)v59 != v14)
        objc_enumerationMutation(v9);
      objc_msgSend_group(v6, v11, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v15);

      if (!--v13)
      {
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v58, v64, 16);
        if (!v13)
          break;
      }
    }
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend_assetsToDownloadInMemory(v6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v54, v63, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v55;
    while (1)
    {
      if (*(_QWORD *)v55 != v23)
        objc_enumerationMutation(v18);
      objc_msgSend_group(v6, v20, v21);
      v24 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v24);

      if (!--v22)
      {
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v54, v63, 16);
        if (!v22)
          break;
      }
    }
  }

  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  objc_msgSend_assetURLInfosToFillOut(v6, v25, v26, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v50, v62, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v51;
    while (1)
    {
      if (*(_QWORD *)v51 != v32)
        objc_enumerationMutation(v27);
      objc_msgSend_group(v6, v29, v30);
      v33 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v33);

      if (!--v31)
      {
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v50, v62, 16);
        if (!v31)
          break;
      }
    }
  }

  objc_msgSend_assetsToDownload(v6, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v36, v37, v38);

  objc_msgSend_assetsToDownloadInMemory(v6, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v41, v42, v43);

  objc_msgSend_assetURLInfosToFillOut(v6, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v46, v47, v48);

  objc_msgSend_setProgressTracker_(v6, v49, 0);
  objc_sync_exit(v6);

}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownload, a3);
}

- (NSMutableArray)assetsToDownloadInMemory
{
  return self->_assetsToDownloadInMemory;
}

- (void)setAssetsToDownloadInMemory:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, a3);
}

- (NSMutableArray)assetURLInfosToFillOut
{
  return self->_assetURLInfosToFillOut;
}

- (void)setAssetURLInfosToFillOut:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressTracker, a3);
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_assetURLInfosToFillOut, 0);
  objc_storeStrong((id *)&self->_assetsToDownloadInMemory, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end

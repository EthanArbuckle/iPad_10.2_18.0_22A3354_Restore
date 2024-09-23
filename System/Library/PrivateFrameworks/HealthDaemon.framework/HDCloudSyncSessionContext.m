@implementation HDCloudSyncSessionContext

- (HDCloudSyncSessionContext)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncSessionContext)initWithChangedSyncEntityCount:(unint64_t)a3 profile:(id)a4
{
  id v6;
  HDCloudSyncSessionContext *v7;
  HDCloudSyncSessionContext *v8;
  HDSyncAnchorRangeMap *v9;
  HDSyncAnchorRangeMap *pendingAnchorRangeMap;
  uint64_t v11;
  NSProgress *progress;
  NSMutableSet *v13;
  NSMutableSet *syncEntityClassesWithProcessedChanges;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncSessionContext;
  v7 = -[HDCloudSyncSessionContext init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v9 = objc_alloc_init(HDSyncAnchorRangeMap);
    pendingAnchorRangeMap = v8->_pendingAnchorRangeMap;
    v8->_pendingAnchorRangeMap = v9;

    v8->_changesetCount = 0;
    v8->_archiveCount = 0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    syncEntityClassesWithProcessedChanges = v8->_syncEntityClassesWithProcessedChanges;
    v8->_syncEntityClassesWithProcessedChanges = v13;

  }
  return v8;
}

- (unint64_t)archiveSize
{
  void *v2;
  unint64_t v3;

  -[_HKArchiveCreator fileHandle](self->_archiveCreator, "fileHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "seekToEndOfFile");

  return v3;
}

- (BOOL)resetInvalidArchiveCreatorWithSessionUUID:(id)a3 error:(id *)a4
{
  id v6;
  _HKArchiveCreator *archiveCreator;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _HKArchiveCreator *v17;
  _HKArchiveCreator *v18;
  unint64_t v19;

  v6 = a3;
  archiveCreator = self->_archiveCreator;
  if (archiveCreator && (-[_HKArchiveCreator archiveIsValid](archiveCreator, "archiveIsValid") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("syncarchive-%@-%llu"), v11, self->_archiveCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "temporaryDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("zip"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    HDAssetFileHandleForFileURL(v15, v9, (uint64_t)a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16 != 0;
    if (v16)
    {
      v17 = (_HKArchiveCreator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F08]), "initWithFileHandle:archiveType:", v16, 0);
      v18 = self->_archiveCreator;
      self->_archiveCreator = v17;

      objc_storeStrong((id *)&self->_archiveURL, v15);
      -[HDSyncAnchorRangeMap reset](self->_pendingAnchorRangeMap, "reset");
      v19 = self->_archiveCount + 1;
      self->_changesetCount = 0;
      self->_archiveCount = v19;
    }

  }
  return v8;
}

- (BOOL)addChangeData:(id)a3 changes:(id)a4 sessionIdentifier:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableSet *syncEntityClassesWithProcessedChanges;
  id WeakRetained;
  NSMutableSet *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  HDSyncAnchorRangeMap *v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  HDSyncAnchorRangeMap *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  _HKArchiveCreator *archiveCreator;
  void *v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  id *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (-[HDCloudSyncSessionContext resetInvalidArchiveCreatorWithSessionUUID:error:](self, "resetInvalidArchiveCreatorWithSessionUUID:error:", a5, a6))
  {
    v63 = a6;
    v64 = v11;
    v65 = v10;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v13)
    {
      v14 = v13;
      v66 = v12;
      v67 = *(_QWORD *)v69;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v67)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v15);
        syncEntityClassesWithProcessedChanges = self->_syncEntityClassesWithProcessedChanges;
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        LOBYTE(syncEntityClassesWithProcessedChanges) = -[NSMutableSet containsObject:](syncEntityClassesWithProcessedChanges, "containsObject:", objc_msgSend(v16, "syncEntityClassForProfile:", WeakRetained));

        if ((syncEntityClassesWithProcessedChanges & 1) == 0)
        {
          v19 = self->_syncEntityClassesWithProcessedChanges;
          v20 = objc_loadWeakRetained((id *)&self->_profile);
          -[NSMutableSet addObject:](v19, "addObject:", objc_msgSend(v16, "syncEntityClassForProfile:", v20));

          v21 = -[NSMutableSet count](self->_syncEntityClassesWithProcessedChanges, "count");
          v22 = -[NSProgress totalUnitCount](self->_progress, "totalUnitCount");
          if (v21 >= v22)
            v23 = v22;
          else
            v23 = v21;
          -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v23);
        }
        v24 = self->_pendingAnchorRangeMap;
        v25 = v16;
        objc_opt_self();
        v72 = 0;
        v73 = 0;
        objc_msgSend(v25, "syncEntityIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HDSyncAnchorRangeMap getAnchorRange:forSyncEntityIdentifier:](v24, "getAnchorRange:forSyncEntityIdentifier:", &v72, v26);

        if (v27)
        {
          objc_msgSend(v25, "sequenceNumber");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "integerValue"))
          {

          }
          else
          {
            v36 = objc_msgSend(v25, "syncAnchorRange");
            v37 = v73;

            v38 = v36 == v37;
            v12 = v66;
            if (!v38)
            {
              v55 = (void *)MEMORY[0x1E0CB35C8];
              v56 = objc_opt_class();
              v57 = objc_msgSend(v25, "syncAnchorRange");
              v58 = v73;
              objc_msgSend(v25, "sequenceNumber");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v56, sel__updateAnchorRangeMap_withChange_outError_, CFSTR("startAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"), v57, v58, v59);
LABEL_30:
              v60 = (id)objc_claimAutoreleasedReturnValue();
              v61 = v60;
              if (v60)
              {
                v11 = v64;
                v10 = v65;
                if (v63)
                {
                  v61 = objc_retainAutorelease(v60);
                  *v63 = v61;
                }
                else
                {
                  _HKLogDroppedError();
                }
              }
              else
              {
                v11 = v64;
                v10 = v65;
              }

              v49 = 0;
              v46 = v66;
              goto LABEL_36;
            }
          }
          objc_msgSend(v25, "sequenceNumber");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "integerValue") < 1)
          {

          }
          else
          {
            objc_msgSend(v25, "syncAnchorRange");
            v41 = v40;
            v42 = v73;

            v38 = v41 == v42;
            v12 = v66;
            if (!v38)
            {
              v50 = (void *)MEMORY[0x1E0CB35C8];
              v51 = objc_opt_class();
              objc_msgSend(v25, "syncAnchorRange");
              v53 = v52;
              v54 = v73;
              objc_msgSend(v25, "sequenceNumber");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v51, sel__updateAnchorRangeMap_withChange_outError_, CFSTR("endAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"), v53, v54, v59);
              goto LABEL_30;
            }
          }
          objc_msgSend(v25, "syncAnchorRange");
          v73 = v43;
          objc_msgSend(v25, "syncEntityIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v72;
          v35 = v73;
          v33 = v24;
        }
        else
        {
          v29 = objc_msgSend(v25, "syncAnchorRange");
          v31 = v30;
          objc_msgSend(v25, "syncEntityIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v24;
          v34 = v29;
          v35 = v31;
        }
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v33, "setAnchorRange:forSyncEntityIdentifier:", v34, v35, v32);

        objc_msgSend(v25, "sequenceNumber");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
          v45 = objc_msgSend(v25, "done") ^ 1;
        else
          v45 = 0;
        self->_hasOpenSequence = v45;

        if (v14 == ++v15)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
          if (v14)
            goto LABEL_4;
          break;
        }
      }
    }

    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/changeset-%04llu"), self->_changesetCount);
    archiveCreator = self->_archiveCreator;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v46, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v65;
    -[_HKArchiveCreator addDataToArchive:pathInArchive:](archiveCreator, "addDataToArchive:pathInArchive:", v65, v48);

    ++self->_changesetCount;
    v49 = 1;
    v11 = v64;
LABEL_36:

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (void)finishProgress
{
  NSProgress *progress;

  progress = self->_progress;
  self->_progress = 0;

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (_HKArchiveCreator)archiveCreator
{
  return self->_archiveCreator;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (HDSyncAnchorRangeMap)pendingAnchorRangeMap
{
  return self->_pendingAnchorRangeMap;
}

- (unint64_t)changesetCount
{
  return self->_changesetCount;
}

- (void)setChangesetCount:(unint64_t)a3
{
  self->_changesetCount = a3;
}

- (unint64_t)archiveCount
{
  return self->_archiveCount;
}

- (void)setArchiveCount:(unint64_t)a3
{
  self->_archiveCount = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)hasOpenSequence
{
  return self->_hasOpenSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_pendingAnchorRangeMap, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_archiveCreator, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_syncEntityClassesWithProcessedChanges, 0);
}

@end

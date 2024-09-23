@implementation CKDOperationMetrics

- (CKDOperationMetrics)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  CKDOperationMetrics *started;

  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  started = (CKDOperationMetrics *)objc_msgSend__initWithStartDate_(self, v5, (uint64_t)v4);

  return started;
}

- (id)_initWithStartDate:(id)a3
{
  id v5;
  CKDOperationMetrics *v6;
  CKDOperationMetrics *v7;
  uint64_t v8;
  NSMutableDictionary *totalBytesByChunkProfile;
  uint64_t v10;
  NSMutableDictionary *chunkCountByChunkProfile;
  uint64_t v12;
  NSMutableDictionary *fileCountByChunkProfile;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDOperationMetrics;
  v6 = -[CKDOperationMetrics init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    v8 = objc_opt_new();
    totalBytesByChunkProfile = v7->_totalBytesByChunkProfile;
    v7->_totalBytesByChunkProfile = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    chunkCountByChunkProfile = v7->_chunkCountByChunkProfile;
    v7->_chunkCountByChunkProfile = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    fileCountByChunkProfile = v7->_fileCountByChunkProfile;
    v7->_fileCountByChunkProfile = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (void)addRequestOperationCountsByOperationType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_requestOperationCountsByType(self, v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend_allKeys(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v37, v41, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v38;
    v36 = v9;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v36);
        v16 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v15);
        objc_msgSend_requestOperationCountsByType(self, v11, v12, obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v17, v18, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CB37E8];
        v23 = objc_msgSend_integerValue(v19, v21, v22);
        objc_msgSend_objectForKeyedSubscript_(v4, v24, v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_integerValue(v25, v26, v27);
        objc_msgSend_numberWithInteger_(v20, v29, v28 + v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestOperationCountsByType(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v30, v16);

        ++v15;
      }
      while (v13 != v15);
      v9 = v36;
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v11, (uint64_t)&v37, v41, 16);
    }
    while (v13);
  }

  objc_sync_exit(obj);
}

- (NSMutableDictionary)requestOperationCountsByType
{
  CKDOperationMetrics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *requestOperationCountsByType;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_requestOperationCountsByType)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestOperationCountsByType = v2->_requestOperationCountsByType;
    v2->_requestOperationCountsByType = v3;

  }
  objc_sync_exit(v2);

  return v2->_requestOperationCountsByType;
}

- (void)addCKSpecificMetricsFromMetrics:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;

  v4 = a3;
  v7 = objc_msgSend_recordsUploaded(v4, v5, v6);
  v10 = objc_msgSend_recordsUploaded(self, v8, v9);
  objc_msgSend_setRecordsUploaded_(self, v11, v10 + v7);
  v14 = objc_msgSend_recordsDownloaded(v4, v12, v13);
  v17 = objc_msgSend_recordsDownloaded(self, v15, v16);
  objc_msgSend_setRecordsDownloaded_(self, v18, v17 + v14);
  v21 = objc_msgSend_recordsDeleted(v4, v19, v20);
  v24 = objc_msgSend_recordsDeleted(self, v22, v23);
  objc_msgSend_setRecordsDeleted_(self, v25, v24 + v21);
  v28 = objc_msgSend_assetsUploaded(v4, v26, v27);
  v31 = objc_msgSend_assetsUploaded(self, v29, v30);
  objc_msgSend_setAssetsUploaded_(self, v32, v31 + v28);
  v35 = objc_msgSend_assetsUploadedFileSize(v4, v33, v34);
  v38 = objc_msgSend_assetsUploadedFileSize(self, v36, v37);
  objc_msgSend_setAssetsUploadedFileSize_(self, v39, v38 + v35);
  v42 = objc_msgSend_assetsDownloaded(v4, v40, v41);
  v45 = objc_msgSend_assetsDownloaded(self, v43, v44);
  objc_msgSend_setAssetsDownloaded_(self, v46, v45 + v42);
  v49 = objc_msgSend_assetsDownloadedFileSize(v4, v47, v48);
  v52 = objc_msgSend_assetsDownloadedFileSize(self, v50, v51);
  objc_msgSend_setAssetsDownloadedFileSize_(self, v53, v52 + v49);
  v56 = objc_msgSend_retries(v4, v54, v55);
  v59 = objc_msgSend_retries(self, v57, v58);
  objc_msgSend_setRetries_(self, v60, v59 + v56);
  v63 = objc_msgSend_requestCount(v4, v61, v62);
  v66 = objc_msgSend_requestCount(self, v64, v65);
  objc_msgSend_setRequestCount_(self, v67, v66 + v63);
  objc_msgSend_requestUUIDs(v4, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_count(v70, v71, v72);
  v76 = objc_msgSend_requestCount(self, v74, v75);
  objc_msgSend_setRequestCount_(self, v77, v76 + v73);

  objc_msgSend_requestOperationCountsByType(v4, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRequestOperationCountsByOperationType_(self, v81, (uint64_t)v80);

  v84 = objc_msgSend_zoneishKeysRolled(v4, v82, v83);
  v87 = objc_msgSend_zoneishKeysRolled(self, v85, v86);
  objc_msgSend_setZoneishKeysRolled_(self, v88, v87 + v84);
  v91 = objc_msgSend_perRecordKeysRolled(v4, v89, v90);
  v94 = objc_msgSend_perRecordKeysRolled(self, v92, v93);
  objc_msgSend_setPerRecordKeysRolled_(self, v95, v94 + v91);
  v98 = objc_msgSend_zoneKeysRolled(v4, v96, v97);
  v101 = objc_msgSend_zoneKeysRolled(self, v99, v100);
  objc_msgSend_setZoneKeysRolled_(self, v102, v101 + v98);
  v105 = objc_msgSend_shareKeysRolled(v4, v103, v104);
  v108 = objc_msgSend_shareKeysRolled(self, v106, v107);
  objc_msgSend_setShareKeysRolled_(self, v109, v108 + v105);
  v112 = objc_msgSend_keyRollsSkippedBySizeCheck(v4, v110, v111);
  v115 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v113, v114);
  objc_msgSend_setKeyRollsSkippedBySizeCheck_(self, v116, v115 + v112);
  v119 = objc_msgSend_zoneKeysRemoved(v4, v117, v118);
  v122 = objc_msgSend_zoneKeysRemoved(self, v120, v121);
  objc_msgSend_setZoneKeysRemoved_(self, v123, v122 + v119);
  v126 = objc_msgSend_zoneishKeysRemoved(v4, v124, v125);
  v129 = objc_msgSend_zoneishKeysRemoved(self, v127, v128);
  objc_msgSend_setZoneishKeysRemoved_(self, v130, v129 + v126);
  v133 = objc_msgSend_recordKeysRemoved(v4, v131, v132);
  v136 = objc_msgSend_recordKeysRemoved(self, v134, v135);
  objc_msgSend_setRecordKeysRemoved_(self, v137, v136 + v133);
  v140 = objc_msgSend_keysNotRemoved(v4, v138, v139);

  v143 = objc_msgSend_keysNotRemoved(self, v141, v142) + v140;
  objc_msgSend_setKeysNotRemoved_(self, v144, v143);
}

- (unint64_t)zoneishKeysRolled
{
  return self->_zoneishKeysRolled;
}

- (unint64_t)zoneKeysRolled
{
  return self->_zoneKeysRolled;
}

- (NSMutableDictionary)totalBytesByChunkProfile
{
  return self->_totalBytesByChunkProfile;
}

- (unint64_t)shareKeysRolled
{
  return self->_shareKeysRolled;
}

- (unint64_t)perRecordKeysRolled
{
  return self->_perRecordKeysRolled;
}

- (NSMutableDictionary)fileCountByChunkProfile
{
  return self->_fileCountByChunkProfile;
}

- (unint64_t)connections
{
  return self->_connections;
}

- (unint64_t)connectionsCreated
{
  return self->_connectionsCreated;
}

- (NSMutableDictionary)chunkCountByChunkProfile
{
  return self->_chunkCountByChunkProfile;
}

- (unint64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (unint64_t)bytesResumed
{
  return self->_bytesResumed;
}

- (unint64_t)bytesFulfilledLocally
{
  return self->_bytesFulfilledLocally;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (BOOL)walrusEnabled
{
  return self->_walrusEnabled;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (unint64_t)recordsUploaded
{
  return self->_recordsUploaded;
}

- (unint64_t)recordsDownloaded
{
  return self->_recordsDownloaded;
}

- (unint64_t)recordsDeleted
{
  return self->_recordsDeleted;
}

- (double)queueing
{
  return self->_queueing;
}

- (double)executing
{
  return self->_executing;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)bytesFulfilledByPeers
{
  return self->_bytesFulfilledByPeers;
}

- (unint64_t)assetsUploaded
{
  return self->_assetsUploaded;
}

- (unint64_t)assetsUploadedFileSize
{
  return self->_assetsUploadedFileSize;
}

- (unint64_t)assetsDownloaded
{
  return self->_assetsDownloaded;
}

- (unint64_t)assetsDownloadedFileSize
{
  return self->_assetsDownloadedFileSize;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (id)newRangeWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v7;
  CKOperationStateTimeRange *v8;
  const char *v9;
  void *started;

  v7 = a4;
  v8 = [CKOperationStateTimeRange alloc];
  started = (void *)objc_msgSend_initWithOperationState_startDate_duration_(v8, v9, a3, v7, a5);

  return started;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)addRange:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_ranges(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_ranges(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v10, v11, (uint64_t)v4);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_ranges(self, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, v36, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v33;
    v20 = 0.0;
    v21 = 0.0;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v14);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!objc_msgSend_operationState(v23, v16, v17))
        {
          objc_msgSend_duration(v23, v24, v25);
          v20 = v20 + v26;
        }
        if (objc_msgSend_operationState(v23, v24, v25) == 1)
        {
          objc_msgSend_duration(v23, v16, v17);
          v21 = v21 + v27;
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v32, v36, 16);
    }
    while (v18);
  }
  else
  {
    v20 = 0.0;
    v21 = 0.0;
  }

  objc_msgSend_setQueueing_(self, v28, v29, v20);
  objc_msgSend_setExecuting_(self, v30, v31, v21);
  objc_sync_exit(v7);

}

- (NSMutableArray)ranges
{
  CKDOperationMetrics *v2;
  uint64_t v3;
  NSMutableArray *ranges;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_ranges)
  {
    v3 = objc_opt_new();
    ranges = v2->_ranges;
    v2->_ranges = (NSMutableArray *)v3;

  }
  objc_sync_exit(v2);

  return v2->_ranges;
}

- (void)setQueueing:(double)a3
{
  self->_queueing = a3;
}

- (void)setExecuting:(double)a3
{
  self->_executing = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDOperationMetrics *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t started;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;

  v4 = [CKDOperationMetrics alloc];
  objc_msgSend_startDate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  started = objc_msgSend__initWithStartDate_(v4, v8, (uint64_t)v7);

  objc_msgSend_ranges(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_mutableCopy(v12, v13, v14);
  v16 = *(void **)(started + 296);
  *(_QWORD *)(started + 296) = v15;

  objc_msgSend_duration(self, v17, v18);
  *(_QWORD *)(started + 24) = v19;
  objc_msgSend_queueing(self, v20, v21);
  *(_QWORD *)(started + 32) = v22;
  objc_msgSend_executing(self, v23, v24);
  *(_QWORD *)(started + 40) = v25;
  *(_QWORD *)(started + 48) = objc_msgSend_bytesUploaded(self, v26, v27);
  *(_QWORD *)(started + 56) = objc_msgSend_bytesDownloaded(self, v28, v29);
  *(_QWORD *)(started + 64) = objc_msgSend_connections(self, v30, v31);
  *(_QWORD *)(started + 72) = objc_msgSend_connectionsCreated(self, v32, v33);
  *(_QWORD *)(started + 88) = objc_msgSend_bytesFulfilledLocally(self, v34, v35);
  *(_QWORD *)(started + 96) = objc_msgSend_bytesResumed(self, v36, v37);
  *(_QWORD *)(started + 104) = objc_msgSend_recordsUploaded(self, v38, v39);
  *(_QWORD *)(started + 112) = objc_msgSend_recordsDownloaded(self, v40, v41);
  *(_QWORD *)(started + 128) = objc_msgSend_assetsUploaded(self, v42, v43);
  *(_QWORD *)(started + 136) = objc_msgSend_assetsUploadedFileSize(self, v44, v45);
  *(_QWORD *)(started + 144) = objc_msgSend_assetsDownloaded(self, v46, v47);
  *(_QWORD *)(started + 152) = objc_msgSend_assetsDownloadedFileSize(self, v48, v49);
  *(_QWORD *)(started + 120) = objc_msgSend_recordsDeleted(self, v50, v51);
  *(_QWORD *)(started + 168) = objc_msgSend_retries(self, v52, v53);
  *(_QWORD *)(started + 160) = objc_msgSend_requestCount(self, v54, v55);
  objc_msgSend_requestOperationCountsByType(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_mutableCopy(v58, v59, v60);
  v62 = *(void **)(started + 264);
  *(_QWORD *)(started + 264) = v61;

  objc_msgSend_totalBytesByChunkProfile(self, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_mutableCopy(v65, v66, v67);
  v69 = *(void **)(started + 272);
  *(_QWORD *)(started + 272) = v68;

  objc_msgSend_chunkCountByChunkProfile(self, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_mutableCopy(v72, v73, v74);
  v76 = *(void **)(started + 280);
  *(_QWORD *)(started + 280) = v75;

  objc_msgSend_fileCountByChunkProfile(self, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend_mutableCopy(v79, v80, v81);
  v83 = *(void **)(started + 288);
  *(_QWORD *)(started + 288) = v82;

  *(_QWORD *)(started + 184) = objc_msgSend_zoneishKeysRolled(self, v84, v85);
  *(_QWORD *)(started + 192) = objc_msgSend_perRecordKeysRolled(self, v86, v87);
  *(_QWORD *)(started + 200) = objc_msgSend_zoneKeysRolled(self, v88, v89);
  *(_QWORD *)(started + 208) = objc_msgSend_shareKeysRolled(self, v90, v91);
  *(_QWORD *)(started + 216) = objc_msgSend_keyRollsSkippedBySizeCheck(self, v92, v93);
  *(_BYTE *)(started + 8) = objc_msgSend_walrusEnabled(self, v94, v95);
  *(_QWORD *)(started + 224) = objc_msgSend_zoneKeysRemoved(self, v96, v97);
  *(_QWORD *)(started + 232) = objc_msgSend_zoneishKeysRemoved(self, v98, v99);
  *(_QWORD *)(started + 240) = objc_msgSend_recordKeysRemoved(self, v100, v101);
  *(_QWORD *)(started + 248) = objc_msgSend_keysNotRemoved(self, v102, v103);
  objc_msgSend_zoneIDs(self, v104, v105);
  v106 = objc_claimAutoreleasedReturnValue();
  v107 = *(void **)(started + 256);
  *(_QWORD *)(started + 256) = v106;

  return (id)started;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, 0);
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, 0);
  objc_storeStrong((id *)&self->_requestOperationCountsByType, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSMutableSet)requestUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 176, 1);
}

- (NSSet)zoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setZoneishKeysRolled:(unint64_t)a3
{
  self->_zoneishKeysRolled = a3;
}

- (void)setZoneKeysRolled:(unint64_t)a3
{
  self->_zoneKeysRolled = a3;
}

- (void)setZoneIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void)setWalrusEnabled:(BOOL)a3
{
  self->_walrusEnabled = a3;
}

- (void)setShareKeysRolled:(unint64_t)a3
{
  self->_shareKeysRolled = a3;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
}

- (void)setRecordsUploaded:(unint64_t)a3
{
  self->_recordsUploaded = a3;
}

- (void)setRecordsDownloaded:(unint64_t)a3
{
  self->_recordsDownloaded = a3;
}

- (void)setRecordsDeleted:(unint64_t)a3
{
  self->_recordsDeleted = a3;
}

- (void)setPerRecordKeysRolled:(unint64_t)a3
{
  self->_perRecordKeysRolled = a3;
}

- (void)setConnectionsCreated:(unint64_t)a3
{
  self->_connectionsCreated = a3;
}

- (void)setConnections:(unint64_t)a3
{
  self->_connections = a3;
}

- (void)setBytesUploaded:(unint64_t)a3
{
  self->_bytesUploaded = a3;
}

- (void)setBytesResumed:(unint64_t)a3
{
  self->_bytesResumed = a3;
}

- (void)setBytesFulfilledLocally:(unint64_t)a3
{
  self->_bytesFulfilledLocally = a3;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (void)setAssetsUploadedFileSize:(unint64_t)a3
{
  self->_assetsUploadedFileSize = a3;
}

- (void)setAssetsUploaded:(unint64_t)a3
{
  self->_assetsUploaded = a3;
}

- (void)setAssetsDownloadedFileSize:(unint64_t)a3
{
  self->_assetsDownloadedFileSize = a3;
}

- (void)setAssetsDownloaded:(unint64_t)a3
{
  self->_assetsDownloaded = a3;
}

- (NSArray)rangesCopy
{
  uint64_t v2;

  return (NSArray *)(id)objc_msgSend_copy(self->_ranges, a2, v2);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_startDate(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v6, v7);
  v9 = v8;
  objc_msgSend_queueing(self, v10, v11);
  v13 = v12;
  objc_msgSend_executing(self, v14, v15);
  v17 = v16;
  v20 = objc_msgSend_bytesUploaded(self, v18, v19);
  v23 = objc_msgSend_bytesDownloaded(self, v21, v22);
  v26 = objc_msgSend_requestCount(self, v24, v25);
  v29 = objc_msgSend_connections(self, v27, v28);
  v32 = objc_msgSend_connectionsCreated(self, v30, v31);
  objc_msgSend_stringWithFormat_(v4, v33, (uint64_t)CFSTR("startDate=%@, duration=%0.3f, queueing=%0.3f, executing=%0.3f, bytesUploaded=%lu, bytesDownloaded=%lu, requests=%lu, connections=%lu, connectionsCreated=%lu"), v5, v9, v13, v17, v20, v23, v26, v29, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDOperationMetrics *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  id v142;

  v142 = a3;
  v4 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_startDate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v8, (uint64_t)v7, CFSTR("startDate"));

  objc_msgSend_duration(self, v9, v10);
  objc_msgSend_encodeDouble_forKey_(v142, v11, (uint64_t)CFSTR("duration"));
  objc_msgSend_queueing(self, v12, v13);
  objc_msgSend_encodeDouble_forKey_(v142, v14, (uint64_t)CFSTR("queueing"));
  objc_msgSend_executing(self, v15, v16);
  objc_msgSend_encodeDouble_forKey_(v142, v17, (uint64_t)CFSTR("executing"));
  v20 = objc_msgSend_bytesUploaded(self, v18, v19);
  objc_msgSend_encodeInt64_forKey_(v142, v21, v20, CFSTR("bytesUploaded"));
  v24 = objc_msgSend_bytesDownloaded(self, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v142, v25, v24, CFSTR("bytesDownloaded"));
  v28 = objc_msgSend_connections(self, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v142, v29, v28, CFSTR("connections"));
  v32 = objc_msgSend_connectionsCreated(self, v30, v31);
  objc_msgSend_encodeInt64_forKey_(v142, v33, v32, CFSTR("connectionsCreated"));
  v36 = objc_msgSend_bytesFulfilledByPeers(self, v34, v35);
  objc_msgSend_encodeInt64_forKey_(v142, v37, v36, CFSTR("bytesFulfilledByPeers"));
  v40 = objc_msgSend_bytesFulfilledLocally(self, v38, v39);
  objc_msgSend_encodeInt64_forKey_(v142, v41, v40, CFSTR("bytesFulfilledLocally"));
  v44 = objc_msgSend_bytesResumed(self, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v142, v45, v44, CFSTR("bytesResumed"));
  v48 = objc_msgSend_recordsUploaded(self, v46, v47);
  objc_msgSend_encodeInt64_forKey_(v142, v49, v48, CFSTR("recordsUploaded"));
  v52 = objc_msgSend_recordsDownloaded(self, v50, v51);
  objc_msgSend_encodeInt64_forKey_(v142, v53, v52, CFSTR("recordsDownloaded"));
  v56 = objc_msgSend_recordsDeleted(self, v54, v55);
  objc_msgSend_encodeInt64_forKey_(v142, v57, v56, CFSTR("recordsDeleted"));
  v60 = objc_msgSend_assetsUploaded(self, v58, v59);
  objc_msgSend_encodeInt64_forKey_(v142, v61, v60, CFSTR("assetsUploaded"));
  v64 = objc_msgSend_assetsUploadedFileSize(self, v62, v63);
  objc_msgSend_encodeInt64_forKey_(v142, v65, v64, CFSTR("assetsUploadedFileSize"));
  v68 = objc_msgSend_assetsDownloaded(self, v66, v67);
  objc_msgSend_encodeInt64_forKey_(v142, v69, v68, CFSTR("assetsDownloaded"));
  v72 = objc_msgSend_assetsDownloadedFileSize(self, v70, v71);
  objc_msgSend_encodeInt64_forKey_(v142, v73, v72, CFSTR("assetsDownloadedFileSize"));
  v76 = objc_msgSend_retries(self, v74, v75);
  objc_msgSend_encodeInt64_forKey_(v142, v77, v76, CFSTR("retries"));
  v80 = objc_msgSend_requestCount(self, v78, v79);
  objc_msgSend_encodeInt64_forKey_(v142, v81, v80, CFSTR("requestCount"));
  objc_msgSend_requestOperationCountsByType(self, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v85, (uint64_t)v84, CFSTR("requestOperationCountsByType"));

  objc_msgSend_totalBytesByChunkProfile(self, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v89, (uint64_t)v88, CFSTR("totalBytesByChunkProfile"));

  objc_msgSend_chunkCountByChunkProfile(self, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v93, (uint64_t)v92, CFSTR("chunkCountByChunkProfile"));

  objc_msgSend_fileCountByChunkProfile(self, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v97, (uint64_t)v96, CFSTR("fileCountByChunkProfile"));

  v100 = objc_msgSend_zoneishKeysRolled(self, v98, v99);
  objc_msgSend_encodeInt64_forKey_(v142, v101, v100, CFSTR("zoneishKeysRolled"));
  v104 = objc_msgSend_perRecordKeysRolled(self, v102, v103);
  objc_msgSend_encodeInt64_forKey_(v142, v105, v104, CFSTR("perRecordKeysRolled"));
  v108 = objc_msgSend_zoneKeysRolled(self, v106, v107);
  objc_msgSend_encodeInt64_forKey_(v142, v109, v108, CFSTR("zoneKeysRolled"));
  v112 = objc_msgSend_shareKeysRolled(self, v110, v111);
  objc_msgSend_encodeInt64_forKey_(v142, v113, v112, CFSTR("shareKeysRolled"));
  v116 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v114, v115);
  objc_msgSend_encodeInt64_forKey_(v142, v117, v116, CFSTR("keyRollsSkippedBySizeCheck"));
  v120 = objc_msgSend_zoneKeysRemoved(self, v118, v119);
  objc_msgSend_encodeInt64_forKey_(v142, v121, v120, CFSTR("zoneKeysRemoved"));
  v124 = objc_msgSend_zoneishKeysRemoved(self, v122, v123);
  objc_msgSend_encodeInt64_forKey_(v142, v125, v124, CFSTR("zoneishKeysRemoved"));
  v128 = objc_msgSend_recordKeysRemoved(self, v126, v127);
  objc_msgSend_encodeInt64_forKey_(v142, v129, v128, CFSTR("recordKeysRemoved"));
  v132 = objc_msgSend_keysNotRemoved(self, v130, v131);
  objc_msgSend_encodeInt64_forKey_(v142, v133, v132, CFSTR("keysNotRemoved"));
  v136 = objc_msgSend_walrusEnabled(self, v134, v135);
  objc_msgSend_encodeBool_forKey_(v142, v137, v136, CFSTR("walrusEnabled"));
  objc_msgSend_zoneIDs(self, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v142, v141, (uint64_t)v140, CFSTR("zoneNames"));

  objc_autoreleasePoolPop(v4);
}

- (CKDOperationMetrics)initWithCoder:(id)a3
{
  id v4;
  CKDOperationMetrics *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSDate *startDate;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableDictionary *requestOperationCountsByType;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableDictionary *totalBytesByChunkProfile;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableDictionary *chunkCountByChunkProfile;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSMutableDictionary *fileCountByChunkProfile;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSSet *zoneIDs;
  objc_super v101;

  v4 = a3;
  v101.receiver = self;
  v101.super_class = (Class)CKDOperationMetrics;
  v5 = -[CKDOperationMetrics init](&v101, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("startDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v9;

    objc_msgSend_decodeDoubleForKey_(v4, v11, (uint64_t)CFSTR("duration"));
    v5->_duration = v12;
    objc_msgSend_decodeDoubleForKey_(v4, v13, (uint64_t)CFSTR("queueing"));
    v5->_queueing = v14;
    objc_msgSend_decodeDoubleForKey_(v4, v15, (uint64_t)CFSTR("executing"));
    v5->_executing = v16;
    v5->_bytesUploaded = objc_msgSend_decodeInt64ForKey_(v4, v17, (uint64_t)CFSTR("bytesUploaded"));
    v5->_bytesDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v18, (uint64_t)CFSTR("bytesDownloaded"));
    v5->_connections = objc_msgSend_decodeInt64ForKey_(v4, v19, (uint64_t)CFSTR("connections"));
    v5->_connectionsCreated = objc_msgSend_decodeInt64ForKey_(v4, v20, (uint64_t)CFSTR("connectionsCreated"));
    v5->_bytesFulfilledByPeers = objc_msgSend_decodeInt64ForKey_(v4, v21, (uint64_t)CFSTR("bytesFulfilledByPeers"));
    v5->_bytesFulfilledLocally = objc_msgSend_decodeInt64ForKey_(v4, v22, (uint64_t)CFSTR("bytesFulfilledLocally"));
    v5->_bytesResumed = objc_msgSend_decodeInt64ForKey_(v4, v23, (uint64_t)CFSTR("bytesResumed"));
    v5->_recordsUploaded = objc_msgSend_decodeInt64ForKey_(v4, v24, (uint64_t)CFSTR("recordsUploaded"));
    v5->_recordsDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v25, (uint64_t)CFSTR("recordsDownloaded"));
    v5->_recordsDeleted = objc_msgSend_decodeInt64ForKey_(v4, v26, (uint64_t)CFSTR("recordsDeleted"));
    v5->_assetsUploaded = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("assetsUploaded"));
    v5->_assetsUploadedFileSize = objc_msgSend_decodeInt64ForKey_(v4, v28, (uint64_t)CFSTR("assetsUploadedFileSize"));
    v5->_assetsDownloaded = objc_msgSend_decodeInt64ForKey_(v4, v29, (uint64_t)CFSTR("assetsDownloaded"));
    v5->_assetsDownloadedFileSize = objc_msgSend_decodeInt64ForKey_(v4, v30, (uint64_t)CFSTR("assetsDownloadedFileSize"));
    v5->_retries = objc_msgSend_decodeInt64ForKey_(v4, v31, (uint64_t)CFSTR("retries"));
    v5->_requestCount = objc_msgSend_decodeInt64ForKey_(v4, v32, (uint64_t)CFSTR("requestCount"));
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v37, CFSTR("requestOperationCountsByType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_mutableCopy(v39, v40, v41);
    requestOperationCountsByType = v5->_requestOperationCountsByType;
    v5->_requestOperationCountsByType = (NSMutableDictionary *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend_setWithObjects_(v44, v48, v45, v46, v47, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v49, CFSTR("totalBytesByChunkProfile"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_mutableCopy(v51, v52, v53);
    totalBytesByChunkProfile = v5->_totalBytesByChunkProfile;
    v5->_totalBytesByChunkProfile = (NSMutableDictionary *)v54;

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    objc_msgSend_setWithObjects_(v56, v60, v57, v58, v59, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v62, (uint64_t)v61, CFSTR("chunkCountByChunkProfile"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_mutableCopy(v63, v64, v65);
    chunkCountByChunkProfile = v5->_chunkCountByChunkProfile;
    v5->_chunkCountByChunkProfile = (NSMutableDictionary *)v66;

    v68 = (void *)MEMORY[0x1E0C99E60];
    v69 = objc_opt_class();
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    objc_msgSend_setWithObjects_(v68, v72, v69, v70, v71, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v74, (uint64_t)v73, CFSTR("fileCountByChunkProfile"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_mutableCopy(v75, v76, v77);
    fileCountByChunkProfile = v5->_fileCountByChunkProfile;
    v5->_fileCountByChunkProfile = (NSMutableDictionary *)v78;

    v5->_zoneishKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v80, (uint64_t)CFSTR("zoneishKeysRolled"));
    v5->_perRecordKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v81, (uint64_t)CFSTR("perRecordKeysRolled"));
    v5->_zoneKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v82, (uint64_t)CFSTR("zoneKeysRolled"));
    v5->_shareKeysRolled = objc_msgSend_decodeInt64ForKey_(v4, v83, (uint64_t)CFSTR("shareKeysRolled"));
    v5->_keyRollsSkippedBySizeCheck = objc_msgSend_decodeInt64ForKey_(v4, v84, (uint64_t)CFSTR("keyRollsSkippedBySizeCheck"));
    v5->_zoneKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v85, (uint64_t)CFSTR("zoneKeysRemoved"));
    v5->_zoneishKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v86, (uint64_t)CFSTR("zoneishKeysRemoved"));
    v5->_recordKeysRemoved = objc_msgSend_decodeInt64ForKey_(v4, v87, (uint64_t)CFSTR("recordKeysRemoved"));
    v5->_keysNotRemoved = objc_msgSend_decodeInt64ForKey_(v4, v88, (uint64_t)CFSTR("keysNotRemoved"));
    v5->_walrusEnabled = objc_msgSend_decodeBoolForKey_(v4, v89, (uint64_t)CFSTR("walrusEnabled"));
    v90 = (void *)MEMORY[0x1E0C99E60];
    v91 = objc_opt_class();
    objc_msgSend_setWithObjects_(v90, v92, v91, 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v94, (uint64_t)v93, CFSTR("zoneNames"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_mutableCopy(v95, v96, v97);
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSSet *)v98;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CKDOperationMetrics *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isEqualToDate;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  int isEqual;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  int v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  int v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  int v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  char v199;

  v4 = (CKDOperationMetrics *)a3;
  if (self == v4)
  {
    v199 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_38;
    objc_msgSend_startDate(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startDate(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToDate = objc_msgSend_isEqualToDate_(v7, v11, (uint64_t)v10);

    if (!isEqualToDate)
      goto LABEL_38;
    objc_msgSend_duration(self, v13, v14);
    v16 = v15;
    objc_msgSend_duration(v4, v17, v18);
    if (v16 != v21)
      goto LABEL_38;
    objc_msgSend_queueing(self, v19, v20);
    v23 = v22;
    objc_msgSend_queueing(v4, v24, v25);
    if (v23 != v28)
      goto LABEL_38;
    objc_msgSend_executing(self, v26, v27);
    v30 = v29;
    objc_msgSend_executing(v4, v31, v32);
    if (v30 != v35)
      goto LABEL_38;
    v36 = objc_msgSend_bytesUploaded(self, v33, v34);
    if (v36 != objc_msgSend_bytesUploaded(v4, v37, v38))
      goto LABEL_38;
    v41 = objc_msgSend_bytesDownloaded(self, v39, v40);
    if (v41 != objc_msgSend_bytesDownloaded(v4, v42, v43))
      goto LABEL_38;
    v46 = objc_msgSend_connections(self, v44, v45);
    if (v46 != objc_msgSend_connections(v4, v47, v48))
      goto LABEL_38;
    v51 = objc_msgSend_connectionsCreated(self, v49, v50);
    if (v51 != objc_msgSend_connectionsCreated(v4, v52, v53))
      goto LABEL_38;
    v56 = objc_msgSend_bytesFulfilledByPeers(self, v54, v55);
    if (v56 != objc_msgSend_bytesFulfilledByPeers(v4, v57, v58))
      goto LABEL_38;
    v61 = objc_msgSend_bytesFulfilledLocally(self, v59, v60);
    if (v61 != objc_msgSend_bytesFulfilledLocally(v4, v62, v63))
      goto LABEL_38;
    v66 = objc_msgSend_bytesResumed(self, v64, v65);
    if (v66 != objc_msgSend_bytesResumed(v4, v67, v68))
      goto LABEL_38;
    v71 = objc_msgSend_recordsUploaded(self, v69, v70);
    if (v71 != objc_msgSend_recordsUploaded(v4, v72, v73))
      goto LABEL_38;
    v76 = objc_msgSend_recordsDownloaded(self, v74, v75);
    if (v76 != objc_msgSend_recordsDownloaded(v4, v77, v78))
      goto LABEL_38;
    v81 = objc_msgSend_recordsDeleted(self, v79, v80);
    if (v81 != objc_msgSend_recordsDeleted(v4, v82, v83))
      goto LABEL_38;
    v86 = objc_msgSend_assetsUploaded(self, v84, v85);
    if (v86 != objc_msgSend_assetsUploaded(v4, v87, v88))
      goto LABEL_38;
    v91 = objc_msgSend_assetsUploadedFileSize(self, v89, v90);
    if (v91 != objc_msgSend_assetsUploadedFileSize(v4, v92, v93))
      goto LABEL_38;
    v96 = objc_msgSend_assetsDownloaded(self, v94, v95);
    if (v96 != objc_msgSend_assetsDownloaded(v4, v97, v98))
      goto LABEL_38;
    v101 = objc_msgSend_assetsDownloadedFileSize(self, v99, v100);
    if (v101 != objc_msgSend_assetsDownloadedFileSize(v4, v102, v103))
      goto LABEL_38;
    v106 = objc_msgSend_retries(self, v104, v105);
    if (v106 != objc_msgSend_retries(v4, v107, v108))
      goto LABEL_38;
    v111 = objc_msgSend_requestCount(self, v109, v110);
    if (v111 != objc_msgSend_requestCount(v4, v112, v113))
      goto LABEL_38;
    objc_msgSend_requestOperationCountsByType(self, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestOperationCountsByType(v4, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v116, v120, (uint64_t)v119);

    if (!isEqual)
      goto LABEL_38;
    objc_msgSend_totalBytesByChunkProfile(self, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_totalBytesByChunkProfile(v4, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = CKObjectsAreBothNilOrEqual();

    if (!v128)
      goto LABEL_38;
    objc_msgSend_chunkCountByChunkProfile(self, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chunkCountByChunkProfile(v4, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = CKObjectsAreBothNilOrEqual();

    if (!v135)
      goto LABEL_38;
    objc_msgSend_fileCountByChunkProfile(self, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileCountByChunkProfile(v4, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = CKObjectsAreBothNilOrEqual();

    if (!v142)
      goto LABEL_38;
    v145 = objc_msgSend_zoneishKeysRolled(self, v143, v144);
    if (v145 != objc_msgSend_zoneishKeysRolled(v4, v146, v147))
      goto LABEL_38;
    v150 = objc_msgSend_perRecordKeysRolled(self, v148, v149);
    if (v150 != objc_msgSend_perRecordKeysRolled(v4, v151, v152))
      goto LABEL_38;
    v155 = objc_msgSend_zoneKeysRolled(self, v153, v154);
    if (v155 != objc_msgSend_zoneKeysRolled(v4, v156, v157))
      goto LABEL_38;
    v160 = objc_msgSend_shareKeysRolled(self, v158, v159);
    if (v160 == objc_msgSend_shareKeysRolled(v4, v161, v162)
      && (v165 = objc_msgSend_keyRollsSkippedBySizeCheck(self, v163, v164),
          v165 == objc_msgSend_keyRollsSkippedBySizeCheck(v4, v166, v167))
      && (v170 = objc_msgSend_walrusEnabled(self, v168, v169),
          v170 == objc_msgSend_walrusEnabled(v4, v171, v172))
      && (v175 = objc_msgSend_zoneKeysRemoved(self, v173, v174), v175 == objc_msgSend_zoneKeysRemoved(v4, v176, v177))
      && (v180 = objc_msgSend_zoneishKeysRemoved(self, v178, v179),
          v180 == objc_msgSend_zoneishKeysRemoved(v4, v181, v182))
      && (v185 = objc_msgSend_recordKeysRemoved(self, v183, v184), v185 == objc_msgSend_recordKeysRemoved(v4, v186, v187))&& (v190 = objc_msgSend_keysNotRemoved(self, v188, v189), v190 == objc_msgSend_keysNotRemoved(v4, v191, v192)))
    {
      objc_msgSend_zoneIDs(self, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneIDs(v4, v196, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = CKObjectsAreBothNilOrEqual();

    }
    else
    {
LABEL_38:
      v199 = 0;
    }
  }

  return v199;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setBytesFulfilledByPeers:(unint64_t)a3
{
  self->_bytesFulfilledByPeers = a3;
}

- (void)setRequestUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unint64_t)keyRollsSkippedBySizeCheck
{
  return self->_keyRollsSkippedBySizeCheck;
}

- (void)setKeyRollsSkippedBySizeCheck:(unint64_t)a3
{
  self->_keyRollsSkippedBySizeCheck = a3;
}

- (unint64_t)zoneKeysRemoved
{
  return self->_zoneKeysRemoved;
}

- (void)setZoneKeysRemoved:(unint64_t)a3
{
  self->_zoneKeysRemoved = a3;
}

- (unint64_t)zoneishKeysRemoved
{
  return self->_zoneishKeysRemoved;
}

- (void)setZoneishKeysRemoved:(unint64_t)a3
{
  self->_zoneishKeysRemoved = a3;
}

- (unint64_t)recordKeysRemoved
{
  return self->_recordKeysRemoved;
}

- (void)setRecordKeysRemoved:(unint64_t)a3
{
  self->_recordKeysRemoved = a3;
}

- (unint64_t)keysNotRemoved
{
  return self->_keysNotRemoved;
}

- (void)setKeysNotRemoved:(unint64_t)a3
{
  self->_keysNotRemoved = a3;
}

- (void)setRequestOperationCountsByType:(id)a3
{
  objc_storeStrong((id *)&self->_requestOperationCountsByType, a3);
}

- (void)setTotalBytesByChunkProfile:(id)a3
{
  objc_storeStrong((id *)&self->_totalBytesByChunkProfile, a3);
}

- (void)setChunkCountByChunkProfile:(id)a3
{
  objc_storeStrong((id *)&self->_chunkCountByChunkProfile, a3);
}

- (void)setFileCountByChunkProfile:(id)a3
{
  objc_storeStrong((id *)&self->_fileCountByChunkProfile, a3);
}

- (void)setRanges:(id)a3
{
  objc_storeStrong((id *)&self->_ranges, a3);
}

@end

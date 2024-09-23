@implementation CKDUploadMergeableDeltasOperation

- (CKDUploadMergeableDeltasOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDUploadMergeableDeltasOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v23, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_deltas(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v9 + 59);
    *((_QWORD *)v9 + 59) = v10;

    objc_msgSend_replacementRequests(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v9 + 60);
    *((_QWORD *)v9 + 60) = v14;

    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v16, *((_QWORD *)v9 + 59));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v9 + 62);
    *((_QWORD *)v9 + 62) = v17;

    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v19, *((_QWORD *)v9 + 60));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v9 + 61);
    *((_QWORD *)v9 + 61) = v20;

  }
  return (CKDUploadMergeableDeltasOperation *)v9;
}

- (int)operationType
{
  return 311;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/upload-mergeable-deltas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__uploadAndReplaceDeltas(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__encryptMergeableDeltas(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
    return CFSTR("Encrypt Deltas");
  if (a3 == 3)
  {
    v5 = CFSTR("Upload Deltas");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDUploadMergeableDeltasOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;

  objc_msgSend_deltas(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend_replacementRequests(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_count(v10, v11, v12) == 0;

  }
  objc_msgSend_makeStateTransition_(self, v13, v9);
}

- (void)_encryptMergeableDeltas
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_pendingDeltaUploads(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_replacementRequests(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_replacementDeltas(v17, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_count(v18, v19, v20) == 0;

        if (!v21)
        {
          objc_msgSend_replacementDeltas(v17, v12, v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v7, v23, (uint64_t)v22);

        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v31, v35, 16);
    }
    while (v14);
  }

  objc_initWeak(&location, self);
  objc_msgSend_stateTransitionGroup(self, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v26);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BEA8CFD4;
  v28[3] = &unk_1E78309E8;
  objc_copyWeak(&v29, &location);
  objc_msgSend__encryptMergeableDeltas_completionHandler_(self, v27, (uint64_t)v7, v28);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_uploadAndReplaceDeltas
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEA8D100;
  v6[3] = &unk_1E782EF38;
  objc_copyWeak(&v7, &location);
  objc_msgSend__uploadAndReplaceDeltas_(self, v5, (uint64_t)v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_uploadAndReplaceDeltas:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  const char *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  _BOOL4 v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  int v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  void *v84;
  const char *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  objc_class *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  CKDUploadMergeableDeltasURLRequest *v96;
  const char *v97;
  void *v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  __int128 v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id obj;
  void (**v113)(_QWORD);
  void *v114;
  CKDUploadMergeableDeltasOperation *val;
  unint64_t v116;
  _QWORD v117[4];
  void (**v118)(_QWORD);
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  id location;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE buf[12];
  __int16 v140;
  unint64_t v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  CKDUploadMergeableDeltasOperation *v145;
  __int16 v146;
  void *v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v113 = (void (**)(_QWORD))a3;
  val = self;
  objc_msgSend_error(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_3:
    v9 = v113;
    v113[2](v113);
    goto LABEL_57;
  }
  objc_msgSend_pendingDeltaUploads(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v10, v11, v12))
  {

  }
  else
  {
    objc_msgSend_pendingReplacementRequests(val, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_count(v17, v18, v19);

    if (!v20)
      goto LABEL_3;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend_maximumMergeableDeltaRequestSize(v21, v22, v23);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  objc_msgSend_pendingDeltaUploads(val, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v135, v150, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v136;
    v35 = *MEMORY[0x1E0C948D0];
    while (2)
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v136 != v34)
          objc_enumerationMutation(v29);
        v37 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v36);
        v133 = 0;
        location = 0;
        v38 = objc_msgSend_protobufSize_error_(v37, v32, (uint64_t)&location, &v133);
        v41 = v133;
        if ((v38 & 1) == 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v42 = *MEMORY[0x1E0C952C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v41;
            _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Failed to get protobuf size for delta, but moving on: %@", buf, 0xCu);
          }
        }
        if (((unint64_t)location + v31 > v116 || objc_msgSend_count(v26, v39, v40) >= v35)
          && objc_msgSend_count(v26, v39, v40))
        {

          goto LABEL_24;
        }
        objc_msgSend_addObject_(v26, v39, (uint64_t)v37);
        v43 = location;

        v31 += (unint64_t)v43;
        ++v36;
      }
      while (v33 != v36);
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v135, v150, 16);
      if (v33)
        continue;
      break;
    }
  }
LABEL_24:

  objc_msgSend_pendingDeltaUploads(val, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsInArray_(v46, v47, (uint64_t)v26);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pendingReplacementRequests(val, v50, v51);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(obj, v52, v53) || v31 >= v116)
    goto LABEL_51;
  objc_msgSend_pendingDeltaUploads(val, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_count(v56, v57, v58) == 0;

  if (v59)
  {
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    objc_msgSend_pendingReplacementRequests(val, v60, v61);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v129, v149, 16);
    if (v111)
    {
      v110 = *(_QWORD *)v130;
      v109 = *MEMORY[0x1E0C948D0];
      *(_QWORD *)&v65 = 138412290;
      v108 = v65;
LABEL_29:
      v66 = 0;
      while (1)
      {
        if (*(_QWORD *)v130 != v110)
          objc_enumerationMutation(obj);
        v67 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v66);
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend_replacementDeltas(v67, v63, v64, v108);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v125, v148, 16);
        if (v72)
        {
          v73 = *(_QWORD *)v126;
          do
          {
            for (i = 0; i != v72; ++i)
            {
              if (*(_QWORD *)v126 != v73)
                objc_enumerationMutation(v68);
              v75 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
              *(_QWORD *)buf = 0;
              v76 = objc_msgSend_protobufSize_error_(v75, v71, (uint64_t)buf, 0);
              v77 = *(_QWORD *)buf;
              if (!v76)
                v77 = 0;
              v70 += v77;
            }
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v125, v148, 16);
          }
          while (v72);
        }

        if ((v70 + v31 > v116 || objc_msgSend_count(v26, v78, v79) >= v109)
          && (objc_msgSend_count(v26, v78, v79) || objc_msgSend_count(v114, v80, v81)))
        {
          break;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v82 = *MEMORY[0x1E0C952C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v108;
          *(_QWORD *)&buf[4] = v67;
          _os_log_debug_impl(&dword_1BE990000, v82, OS_LOG_TYPE_DEBUG, "Will add replacement request %@", buf, 0xCu);
        }
        objc_msgSend_addObject_(v114, v83, (uint64_t)v67);
        if (++v66 == v111)
        {
          v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v129, v149, 16);
          if (v111)
            goto LABEL_29;
          break;
        }
      }
    }
LABEL_51:

  }
  objc_msgSend_pendingReplacementRequests(val, v60, v61);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsInArray_(v84, v85, (uint64_t)v114);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v86 = (void *)*MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
  {
    v87 = v86;
    v90 = objc_msgSend_count(v26, v88, v89);
    v91 = (objc_class *)objc_opt_class();
    NSStringFromClass(v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(val, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v90;
    v140 = 2048;
    v141 = v31;
    v142 = 2114;
    v143 = v92;
    v144 = 2048;
    v145 = val;
    v146 = 2114;
    v147 = v95;
    _os_log_impl(&dword_1BE990000, v87, OS_LOG_TYPE_INFO, "Starting delta upload request with %tu deltas (%tu bytes) for operation <%{public}@: %p; %{public}@>",
      buf,
      0x34u);

  }
  v96 = [CKDUploadMergeableDeltasURLRequest alloc];
  v98 = (void *)objc_msgSend_initWithOperation_deltas_replacementRequests_(v96, v97, (uint64_t)val, v26, v114);
  objc_initWeak((id *)buf, val);
  v99 = MEMORY[0x1E0C809B0];
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = sub_1BEA8DA14;
  v123[3] = &unk_1E7831FD0;
  objc_copyWeak(&v124, (id *)buf);
  objc_msgSend_setPerDeltaCompletionBlock_(v98, v100, (uint64_t)v123);
  v121[0] = v99;
  v121[1] = 3221225472;
  v121[2] = sub_1BEA8DA78;
  v121[3] = &unk_1E7831FF8;
  objc_copyWeak(&v122, (id *)buf);
  objc_msgSend_setPerReplaceDeltasRequestCompletionBlock_(v98, v101, (uint64_t)v121);
  objc_initWeak(&location, v98);
  v117[0] = v99;
  v117[1] = 3221225472;
  v117[2] = sub_1BEA8DADC;
  v117[3] = &unk_1E7832020;
  objc_copyWeak(&v119, (id *)buf);
  objc_copyWeak(&v120, &location);
  v118 = v113;
  objc_msgSend_setCompletionBlock_(v98, v102, (uint64_t)v117);
  objc_msgSend_setRequest_(val, v103, (uint64_t)v98);
  objc_msgSend_container(val, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v106, v107, (uint64_t)v98);

  objc_destroyWeak(&v120);
  objc_destroyWeak(&v119);
  objc_destroyWeak(&location);
  objc_destroyWeak(&v122);
  objc_destroyWeak(&v124);
  objc_destroyWeak((id *)buf);

  v9 = v113;
LABEL_57:

}

- (void)handleDeltaUploaded:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = (void *)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v30 = v10;
      objc_msgSend_metadata(v6, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v36;
      _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "Successfully uploaded delta: %@", buf, 0xCu);

    }
    v13 = 0;
  }
  else
  {
    v14 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C94FF8];
    v20 = *MEMORY[0x1E0C94B20];
    objc_msgSend_error(v7, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v19, v27, v20, v14, v18, CFSTR("Error uploading mergeable delta, %@, from server: %@"), v6, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = (void *)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      v37 = v28;
      objc_msgSend_metadata(v6, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v43;
      v46 = 2112;
      v47 = v13;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Failed to upload delta, %@, with error: %@", buf, 0x16u);

    }
  }
  objc_msgSend_uploadDeltaCompletionBlock(self, v11, v12);
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))v29)[2](v29, v6, v13);

}

- (void)handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Successfully replaced deltas for request: %@", buf, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    v14 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C94FF8];
    v20 = *MEMORY[0x1E0C94B20];
    objc_msgSend_error(v7, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v19, v27, v20, v14, v18, CFSTR("Error replacing mergeable deltas %@: %@"), v6, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_error_impl(&dword_1BE990000, v28, OS_LOG_TYPE_ERROR, "Failed to replace deltas with error: %@", buf, 0xCu);
    }

  }
  objc_msgSend_replaceDeltasRequestCompletionBlock(self, v11, v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_replaceDeltasRequestCompletionBlock(self, v30, v31);
    v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v32)[2](v32, v6, v13);

  }
}

- (id)uploadDeltaCompletionBlock
{
  return self->_uploadDeltaCompletionBlock;
}

- (void)setUploadDeltaCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (id)replaceDeltasRequestCompletionBlock
{
  return self->_replaceDeltasRequestCompletionBlock;
}

- (void)setReplaceDeltasRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSArray)replacementRequests
{
  return self->_replacementRequests;
}

- (void)setReplacementRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSMutableArray)pendingReplacementRequests
{
  return self->_pendingReplacementRequests;
}

- (void)setPendingReplacementRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReplacementRequests, a3);
}

- (NSMutableArray)pendingDeltaUploads
{
  return self->_pendingDeltaUploads;
}

- (void)setPendingDeltaUploads:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDeltaUploads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeltaUploads, 0);
  objc_storeStrong((id *)&self->_pendingReplacementRequests, 0);
  objc_storeStrong((id *)&self->_replacementRequests, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong(&self->_replaceDeltasRequestCompletionBlock, 0);
  objc_storeStrong(&self->_uploadDeltaCompletionBlock, 0);
}

@end

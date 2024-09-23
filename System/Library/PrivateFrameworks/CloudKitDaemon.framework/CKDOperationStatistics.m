@implementation CKDOperationStatistics

- (CKDOperationStatistics)initWithOperationClassName:(id)a3
{
  id v5;
  CKDOperationStatistics *v6;
  CKDOperationStatistics *v7;
  uint64_t v8;
  NSMutableDictionary *recentErrorsByDate;
  uint64_t v10;
  CKDOperationMetrics *aggregateCKMetrics;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDOperationStatistics;
  v6 = -[CKDOperationStatistics init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationClassName, a3);
    v8 = objc_opt_new();
    recentErrorsByDate = v7->_recentErrorsByDate;
    v7->_recentErrorsByDate = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    aggregateCKMetrics = v7->_aggregateCKMetrics;
    v7->_aggregateCKMetrics = (CKDOperationMetrics *)v10;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDOperationStatistics *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v4 = [CKDOperationStatistics alloc];
  objc_msgSend_operationClassName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend_initWithOperationClassName_(v4, v8, (uint64_t)v7);

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700E28);
  objc_msgSend_recentErrorsByDate(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_copy(v12, v13, v14);
  v16 = (void *)v9[2];
  v9[2] = v15;

  v9[3] = objc_msgSend_operationCount(self, v17, v18);
  objc_msgSend_aggregateCKMetrics(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v21, v22, v23);
  v25 = (void *)v9[4];
  v9[4] = v24;

  objc_msgSend_aggregateMMCSMetrics(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v9[5];
  v9[5] = v31;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700E28);
  return v9;
}

- (void)_addMetrics:(id)a3 toAggregate:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
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
  id v68;

  v68 = a4;
  v5 = a3;
  objc_msgSend_duration(v5, v6, v7);
  v9 = v8;
  objc_msgSend_duration(v68, v10, v11);
  objc_msgSend_setDuration_(v68, v13, v14, v9 + v12);
  objc_msgSend_queueing(v5, v15, v16);
  v18 = v17;
  objc_msgSend_queueing(v68, v19, v20);
  objc_msgSend_setQueueing_(v68, v22, v23, v18 + v21);
  objc_msgSend_executing(v5, v24, v25);
  v27 = v26;
  objc_msgSend_executing(v68, v28, v29);
  objc_msgSend_setExecuting_(v68, v31, v32, v27 + v30);
  v35 = objc_msgSend_bytesUploaded(v5, v33, v34);
  v38 = objc_msgSend_bytesUploaded(v68, v36, v37);
  objc_msgSend_setBytesUploaded_(v68, v39, v38 + v35);
  v42 = objc_msgSend_bytesDownloaded(v5, v40, v41);
  v45 = objc_msgSend_bytesDownloaded(v68, v43, v44);
  objc_msgSend_setBytesDownloaded_(v68, v46, v45 + v42);
  v49 = objc_msgSend_connections(v5, v47, v48);
  v52 = objc_msgSend_connections(v68, v50, v51);
  objc_msgSend_setConnections_(v68, v53, v52 + v49);
  v56 = objc_msgSend_connectionsCreated(v5, v54, v55);
  v59 = objc_msgSend_connectionsCreated(v68, v57, v58);
  objc_msgSend_setConnectionsCreated_(v68, v60, v59 + v56);
  v63 = objc_msgSend_requestCount(v5, v61, v62);

  v66 = objc_msgSend_requestCount(v68, v64, v65);
  objc_msgSend_setRequestCount_(v68, v67, v66 + v63);

}

- (id)_trimmedError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  objc_class *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_domain(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v7, v8, *MEMORY[0x1E0C947D8]))
  {
    v11 = objc_msgSend_code(v4, v9, v10);

    if (v11 == 22)
    {
      v14 = 0;
      v15 = v4;
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend_userInfo(v4, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v4;
  if (v16)
  {
    objc_msgSend_userInfo(v4, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_mutableCopy(v20, v21, v22);

    v24 = *MEMORY[0x1E0CB3388];
    objc_msgSend_objectForKeyedSubscript_(v23, v25, *MEMORY[0x1E0CB3388]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend_objectForKeyedSubscript_(v23, v27, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__trimmedError_(self, v29, (uint64_t)v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v31, (uint64_t)v30, v24);

    }
    v32 = *MEMORY[0x1E0C94940];
    objc_msgSend_objectForKeyedSubscript_(v23, v27, *MEMORY[0x1E0C94940]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v69 = v4;
      v35 = (void *)objc_opt_new();
      v67 = v32;
      v68 = v23;
      objc_msgSend_objectForKeyedSubscript_(v23, v36, v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend_allKeys(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v70, v74, 16);
      if (v42)
      {
        v44 = v42;
        v45 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v71 != v45)
              objc_enumerationMutation(v40);
            v47 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v37, v43, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__trimmedError_(self, v49, (uint64_t)v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v35, v51, (uint64_t)v50, v47);

          }
          v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v70, v74, 16);
        }
        while (v44);
      }

      v23 = v68;
      objc_msgSend_setObject_forKeyedSubscript_(v68, v52, (uint64_t)v35, v67);

      v4 = v69;
    }
    objc_msgSend_setObject_forKeyedSubscript_(v23, v34, 0, *MEMORY[0x1E0C94B30]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v53, 0, *MEMORY[0x1E0C949A8]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v54, 0, *MEMORY[0x1E0C949B8]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v55, 0, *MEMORY[0x1E0C949B0]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v56, 0, *MEMORY[0x1E0C949E8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = (objc_class *)MEMORY[0x1E0C94FF8];
    else
      v57 = (objc_class *)MEMORY[0x1E0CB35C8];
    v58 = [v57 alloc];
    objc_msgSend_domain(v4, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_code(v4, v62, v63);
    v19 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v58, v65, (uint64_t)v61, v64, v23);

  }
  v15 = v19;
  v14 = v15;
LABEL_22:

  return v14;
}

- (void)addOperation:(id)a3 cloudKitMetrics:(id)a4 MMCSMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  CKDOperationMetrics *v20;
  CKDOperationMetrics *aggregateMMCSMetrics;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700E28);
  ++self->_operationCount;
  objc_msgSend_aggregateCKMetrics(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addMetrics_toAggregate_(self, v14, (uint64_t)v9, v13);

  if (v10)
  {
    objc_msgSend_aggregateMMCSMetrics(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v20 = (CKDOperationMetrics *)objc_opt_new();
      aggregateMMCSMetrics = self->_aggregateMMCSMetrics;
      self->_aggregateMMCSMetrics = v20;

    }
    objc_msgSend_aggregateMMCSMetrics(self, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__addMetrics_toAggregate_(self, v23, (uint64_t)v10, v22);

  }
  objc_msgSend_error(v8, v15, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_error(v8, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__trimmedError_(self, v28, (uint64_t)v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_recentErrorsByDate(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_count(v32, v33, v34);
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_savedErrorCount(v38, v39, v40);

      if (v35 > v41)
      {
        v71 = v29;
        objc_msgSend_distantFuture(MEMORY[0x1E0C99D68], v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend_recentErrorsByDate(self, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v72, v76, 16);
        if (v52)
        {
          v54 = v52;
          v55 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v73 != v55)
                objc_enumerationMutation(v50);
              v57 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              if (objc_msgSend_compare_(v57, v53, (uint64_t)v44) == -1)
              {
                v58 = v57;

                v44 = v58;
              }
            }
            v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v72, v76, 16);
          }
          while (v54);
        }

        objc_msgSend_recentErrorsByDate(self, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v62, 0, v44);

        v29 = v71;
      }
      objc_msgSend_error(v8, v42, v43);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recentErrorsByDate(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v66, v70, (uint64_t)v63, v69);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700E28);

}

+ (id)CKStatusReportForStatistics:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t j;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  const char *v116;
  void *v118;
  id obj;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700E28);
  v118 = v3;
  objc_msgSend_sortedArrayUsingComparator_(v3, v5, (uint64_t)&unk_1E7832650);
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v135, v140, 16);
  if (v121)
  {
    v120 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v121; ++i)
      {
        if (*(_QWORD *)v136 != v120)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        v127 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_operationClassName(v10, v7, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend_operationCount(v10, v12, v13);
        objc_msgSend_aggregateCKMetrics(v10, v14, v15);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_requestCount(v130, v16, v17);
        objc_msgSend_aggregateCKMetrics(v10, v18, v19);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_duration(v128, v20, v21);
        v23 = v22;
        objc_msgSend_aggregateCKMetrics(v10, v24, v25);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queueing(v126, v26, v27);
        v29 = v28;
        objc_msgSend_aggregateCKMetrics(v10, v30, v31);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_executing(v124, v32, v33);
        v35 = v34;
        objc_msgSend_aggregateCKMetrics(v10, v36, v37);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_bytesUploaded(v122, v38, v39);
        objc_msgSend_aggregateCKMetrics(v10, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend_bytesDownloaded(v43, v44, v45);
        objc_msgSend_aggregateCKMetrics(v10, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_connections(v49, v50, v51);
        objc_msgSend_aggregateCKMetrics(v10, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_connectionsCreated(v55, v56, v57);
        objc_msgSend_stringWithFormat_(v127, v59, (uint64_t)CFSTR("[%@] (%lu operations, %lu requests, %0.2f total duration (%0.2fq/%0.2fe), data u/d: %lu/%lu, %lu connections (%lu created))"), v11, v125, v123, v23, v29, v35, v40, v46, v52, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v61, (uint64_t)v60);

        objc_msgSend_aggregateMMCSMetrics(v10, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v64;
        if (v64)
        {
          v68 = (void *)MEMORY[0x1E0CB3940];
          v69 = objc_msgSend_requestCount(v64, v65, v66);
          objc_msgSend_duration(v67, v70, v71);
          v73 = v72;
          objc_msgSend_queueing(v67, v74, v75);
          v77 = v76;
          objc_msgSend_executing(v67, v78, v79);
          v81 = v80;
          v84 = objc_msgSend_bytesUploaded(v67, v82, v83);
          v87 = objc_msgSend_bytesDownloaded(v67, v85, v86);
          v90 = objc_msgSend_connections(v67, v88, v89);
          v93 = objc_msgSend_connectionsCreated(v67, v91, v92);
          objc_msgSend_stringWithFormat_(v68, v94, (uint64_t)CFSTR("\t MMCS metrics: %lu requests, (%0.2f total duration (%0.2fq/%0.2fe), data u/d: %lu/%lu, %lu connections (%lu created))"), v69, v73, v77, v81, v84, v87, v90, v93);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v4, v96, (uint64_t)v95);

        }
        objc_msgSend_recentErrorsByDate(v10, v65, v66);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v97, v98, v99))
        {
          v129 = v67;
          objc_msgSend_addObject_(v4, v100, (uint64_t)CFSTR("Recent errors: {"));
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          objc_msgSend_allKeys(v97, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v131, v139, 16);
          if (v105)
          {
            v107 = v105;
            v108 = *(_QWORD *)v132;
            do
            {
              for (j = 0; j != v107; ++j)
              {
                if (*(_QWORD *)v132 != v108)
                  objc_enumerationMutation(v103);
                v110 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j);
                v111 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_objectForKeyedSubscript_(v97, v106, v110);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v111, v113, (uint64_t)CFSTR("\t%@ - %@"), v110, v112);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v4, v115, (uint64_t)v114);

              }
              v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v106, (uint64_t)&v131, v139, 16);
            }
            while (v107);
          }

          objc_msgSend_addObject_(v4, v116, (uint64_t)CFSTR("}"));
          v67 = v129;
        }

      }
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v135, v140, 16);
    }
    while (v121);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700E28);

  return v4;
}

- (NSString)operationClassName
{
  return self->_operationClassName;
}

- (NSMutableDictionary)recentErrorsByDate
{
  return self->_recentErrorsByDate;
}

- (unint64_t)operationCount
{
  return self->_operationCount;
}

- (CKDOperationMetrics)aggregateCKMetrics
{
  return self->_aggregateCKMetrics;
}

- (CKDOperationMetrics)aggregateMMCSMetrics
{
  return self->_aggregateMMCSMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateMMCSMetrics, 0);
  objc_storeStrong((id *)&self->_aggregateCKMetrics, 0);
  objc_storeStrong((id *)&self->_recentErrorsByDate, 0);
  objc_storeStrong((id *)&self->_operationClassName, 0);
}

@end

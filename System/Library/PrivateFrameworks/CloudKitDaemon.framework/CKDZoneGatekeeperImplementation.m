@implementation CKDZoneGatekeeperImplementation

- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  CKDZoneGatekeeperImplementation *v10;
  id *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  CKWaiterWrapper *v41;
  os_activity_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  id v51;
  _QWORD block[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  id v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v51 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (id *)MEMORY[0x1E0C952B0];
  v12 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v9;
    v65 = 2112;
    v66 = (uint64_t)v8;
    _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Registering zone gate locks for IDs %@ waiter %@", buf, 0x16u);
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v13 = v9;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v58, v69, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v59 != v18)
          objc_enumerationMutation(v13);
        v20 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend_zoneIDsToGateHolders(v10, v15, v16, v51);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v21, v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v38 = *v11;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_zoneIDsToGateHolders(v10, v39, v40);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v48, v49, v20);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v64 = v8;
            v65 = 2112;
            v66 = v20;
            v67 = 2112;
            v68 = v50;
            _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Can't immediately grant gate to %@ because zone %@ held by %@", buf, 0x20u);

          }
          v41 = [CKWaiterWrapper alloc];
          v42 = _os_activity_create(&dword_1BE990000, "CKDZoneGatekeeper", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
          v37 = (void *)objc_msgSend_initWithWaiter_zoneIDs_waitCompletedHandler_activity_(v41, v43, (uint64_t)v8, v13, v51, v42);

          objc_msgSend_waiterWrappers(v10, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v46, v47, (uint64_t)v37);

          goto LABEL_26;
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v58, v69, 16);
      if (v17)
        continue;
      break;
    }
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v24 = v13;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v54, v62, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v55 != v29)
          objc_enumerationMutation(v24);
        v31 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend_zoneIDsToGateHolders(v10, v26, v27, v51);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v8, v31);

      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v54, v62, 16);
    }
    while (v28);
  }

  objc_msgSend_qualityOfService(v8, v34, v35);
  CKGetGlobalQueue();
  v36 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C1928;
  block[3] = &unk_1E782EFD8;
  v53 = v51;
  dispatch_async(v36, block);

  v37 = v53;
LABEL_26:

  objc_sync_exit(v10);
}

- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4
{
  _BOOL4 v4;
  CKDZoneGatekeeperImplementation *v6;
  _QWORD *v7;
  CKDDeferredRelinquishPlaceholder *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  int isEqual;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  dispatch_time_t v111;
  NSObject *v112;
  id v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t m;
  id v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t n;
  void *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  NSObject *v130;
  void *v131;
  __int128 v132;
  void *v133;
  void *v134;
  id obj;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  _BOOL4 v139;
  id v140;
  _QWORD v141[5];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD block[5];
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  os_activity_scope_state_s state;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  uint8_t v171[128];
  uint8_t buf[4];
  id v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  void *v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v4 = a4;
  v181 = *MEMORY[0x1E0C80C00];
  v140 = a3;
  v133 = (void *)objc_opt_new();
  v134 = (void *)objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  v139 = v4;
  if (v4)
  {
    v8 = [CKDDeferredRelinquishPlaceholder alloc];
    v136 = (void *)objc_msgSend_initWithExistingWaiter_(v8, v9, (uint64_t)v140);
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v173 = v140;
      _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Deferring relinquish of zone gate locks for waiter %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_ckShortDescription(v140, v14, v15);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v173 = v131;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Relinquishing zone gate locks for waiter %@", buf, 0xCu);

    }
    v136 = 0;
  }
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  objc_msgSend_zoneIDsToGateHolders(v6, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_copy(v19, v20, v21);

  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v165, v180, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v166 != v27)
          objc_enumerationMutation(v22);
        v29 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * i);
        objc_msgSend_zoneIDsToGateHolders(v6, v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v30, v31, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_isEqual_(v32, v33, (uint64_t)v140))
        {
          objc_msgSend_zoneIDsToGateHolders(v6, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v139)
            objc_msgSend_setObject_forKeyedSubscript_(v37, v36, (uint64_t)v136, v29);
          else
            objc_msgSend_removeObjectForKey_(v37, v36, v29);

        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v165, v180, 16);
    }
    while (v26);
  }

  objc_msgSend_waiterWrappers(v6, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend_copy(v40, v41, v42);

  v48 = objc_msgSend_count(v43, v44, v45);
  if (v48 - 1 >= 0)
  {
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v43, v46, --v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_waiter(v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v52, v53, (uint64_t)v140);

      if (isEqual)
      {
        objc_msgSend_addObject_(v133, v55, (uint64_t)v49);
        objc_msgSend_waiterWrappers(v6, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectAtIndex_(v58, v59, v48);

      }
    }
    while (v48 > 0);
  }
  objc_msgSend_waiterWrappers(v6, v46, v47);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend_copy(v60, v61, v62);

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  obj = v63;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v161, v179, 16);
  if (v65)
  {
    v137 = *(_QWORD *)v162;
    *(_QWORD *)&v68 = 138412290;
    v132 = v68;
    do
    {
      v69 = 0;
      v138 = v65;
      do
      {
        if (*(_QWORD *)v162 != v137)
          objc_enumerationMutation(obj);
        v70 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v69);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend_activity(v70, v66, v67, v132);
        v71 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v71, &state);

        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        objc_msgSend_zoneIDs(v70, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v156, v178, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v157;
          while (2)
          {
            for (j = 0; j != v78; ++j)
            {
              if (*(_QWORD *)v157 != v79)
                objc_enumerationMutation(v74);
              v81 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j);
              objc_msgSend_zoneIDsToGateHolders(v6, v76, v77);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v82, v83, v81);
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if (v84)
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v105 = (id)*MEMORY[0x1E0C952B0];
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend_zoneIDsToGateHolders(v6, v106, v107);
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v108, v109, v81);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v173 = v70;
                  v174 = 2112;
                  v175 = v81;
                  v176 = 2112;
                  v177 = v110;
                  _os_log_debug_impl(&dword_1BE990000, v105, OS_LOG_TYPE_DEBUG, "Can't grant gate to waiter %@ because zone %@ held by %@", buf, 0x20u);

                }
                goto LABEL_57;
              }
            }
            v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v76, (uint64_t)&v156, v178, 16);
            if (v78)
              continue;
            break;
          }
        }

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v85 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v132;
          v173 = v70;
          _os_log_debug_impl(&dword_1BE990000, v85, OS_LOG_TYPE_DEBUG, "Granting gate to waiter %@", buf, 0xCu);
        }
        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        objc_msgSend_zoneIDs(v70, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v152, v171, 16);
        if (v92)
        {
          v93 = *(_QWORD *)v153;
          do
          {
            for (k = 0; k != v92; ++k)
            {
              if (*(_QWORD *)v153 != v93)
                objc_enumerationMutation(v88);
              v95 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * k);
              objc_msgSend_waiter(v70, v90, v91);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_zoneIDsToGateHolders(v6, v97, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v99, v100, (uint64_t)v96, v95);

            }
            v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v152, v171, 16);
          }
          while (v92);
        }

        objc_msgSend_addObject_(v134, v101, (uint64_t)v70);
        objc_msgSend_waiterWrappers(v6, v102, v103);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v74, v104, (uint64_t)v70);
LABEL_57:

        os_activity_scope_leave(&state);
        ++v69;
      }
      while (v69 != v138);
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v161, v179, 16);
    }
    while (v65);
  }

  if (v139)
  {
    v111 = dispatch_time(0, 2000000000);
    dispatch_get_global_queue(0, 0);
    v112 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA43B84;
    block[3] = &unk_1E782EE20;
    block[4] = v6;
    v151 = v136;
    dispatch_after(v111, v112, block);

  }
  objc_sync_exit(v6);

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v113 = v133;
  v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v114, (uint64_t)&v146, v170, 16);
  if (v116)
  {
    v117 = *(_QWORD *)v147;
    do
    {
      for (m = 0; m != v116; ++m)
      {
        if (*(_QWORD *)v147 != v117)
          objc_enumerationMutation(v113);
        objc_msgSend_invokeWaitCompletedHandler_(*(void **)(*((_QWORD *)&v146 + 1) + 8 * m), v115, 0);
      }
      v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v115, (uint64_t)&v146, v170, 16);
    }
    while (v116);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v119 = v134;
  v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v142, v169, 16);
  if (v123)
  {
    v124 = *(_QWORD *)v143;
    do
    {
      for (n = 0; n != v123; ++n)
      {
        if (*(_QWORD *)v143 != v124)
          objc_enumerationMutation(v119);
        v126 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * n);
        objc_msgSend_waiter(v126, v121, v122);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_qualityOfService(v127, v128, v129);
        CKGetGlobalQueue();
        v130 = objc_claimAutoreleasedReturnValue();
        v141[0] = MEMORY[0x1E0C809B0];
        v141[1] = 3221225472;
        v141[2] = sub_1BEA43B94;
        v141[3] = &unk_1E782EA40;
        v141[4] = v126;
        dispatch_async(v130, v141);

      }
      v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v121, (uint64_t)&v142, v169, 16);
    }
    while (v123);
  }

}

- (NSMutableDictionary)zoneIDsToGateHolders
{
  return self->_zoneIDsToGateHolders;
}

- (NSMutableArray)waiterWrappers
{
  return self->_waiterWrappers;
}

- (CKDZoneGatekeeperImplementation)init
{
  CKDZoneGatekeeperImplementation *v2;
  uint64_t v3;
  NSMutableDictionary *zoneIDsToGateHolders;
  uint64_t v5;
  NSMutableArray *waiterWrappers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDZoneGatekeeperImplementation;
  v2 = -[CKDZoneGatekeeperImplementation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    zoneIDsToGateHolders = v2->_zoneIDsToGateHolders;
    v2->_zoneIDsToGateHolders = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    waiterWrappers = v2->_waiterWrappers;
    v2->_waiterWrappers = (NSMutableArray *)v5;

  }
  return v2;
}

- (BOOL)hasStatusToReport
{
  CKDZoneGatekeeperImplementation *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_zoneIDsToGateHolders(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v6, v7))
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend_waiterWrappers(v2, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_count(v11, v12, v13) != 0;

  }
  objc_sync_exit(v2);

  return v10;
}

- (id)CKStatusReportArray
{
  void *v3;
  CKDZoneGatekeeperImplementation *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  id obj;
  uint64_t v81;
  uint64_t v82;
  CKDZoneGatekeeperImplementation *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v83 = v4;
  objc_msgSend_zoneIDsToGateHolders(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    objc_msgSend_addObject_(v3, v11, (uint64_t)CFSTR("\tHeld Gates {"));
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend_zoneIDsToGateHolders(v4, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v92, v98, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v93 != v22)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          objc_msgSend_zoneIDsToGateHolders(v83, v19, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_ckShortDescription(v24, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(v27, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v28, v35, (uint64_t)CFSTR("\t\t%@ -> %@"), v31, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v92, v98, 16);
      }
      while (v21);
    }

    objc_msgSend_addObject_(v3, v38, (uint64_t)CFSTR("\t}"));
  }
  else
  {
    objc_msgSend_addObject_(v3, v11, (uint64_t)CFSTR("\tNo gates held"));
  }
  objc_msgSend_waiterWrappers(v83, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_count(v41, v42, v43);

  if (v44)
  {
    objc_msgSend_addObject_(v3, v45, (uint64_t)CFSTR("\tWaiters {"));
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend_waiterWrappers(v83, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v88, v97, 16);
    if (v50)
    {
      obj = v48;
      v81 = *(_QWORD *)v89;
      do
      {
        v82 = v50;
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v89 != v81)
            objc_enumerationMutation(obj);
          v54 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          v55 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_waiter(v54, v51, v52);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ckShortDescription(v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v55, v60, (uint64_t)CFSTR("\t\t%@ wants zone IDs {"), v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v62, (uint64_t)v61);

          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend_zoneIDs(v54, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v84, v96, 16);
          if (v69)
          {
            v70 = *(_QWORD *)v85;
            do
            {
              for (k = 0; k != v69; ++k)
              {
                if (*(_QWORD *)v85 != v70)
                  objc_enumerationMutation(v65);
                v72 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend_ckShortDescription(*(void **)(*((_QWORD *)&v84 + 1) + 8 * k), v67, v68);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v72, v74, (uint64_t)CFSTR("\t\t\t%@,"), v73);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v3, v76, (uint64_t)v75);

              }
              v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v67, (uint64_t)&v84, v96, 16);
            }
            while (v69);
          }

          objc_msgSend_addObject_(v3, v77, (uint64_t)CFSTR("\t\t}"));
        }
        v48 = obj;
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v88, v97, 16);
      }
      while (v50);
    }

    objc_msgSend_addObject_(v3, v78, (uint64_t)CFSTR("\t}"));
  }
  objc_sync_exit(v83);

  return v3;
}

- (void)setZoneIDsToGateHolders:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsToGateHolders, a3);
}

- (void)setWaiterWrappers:(id)a3
{
  objc_storeStrong((id *)&self->_waiterWrappers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waiterWrappers, 0);
  objc_storeStrong((id *)&self->_zoneIDsToGateHolders, 0);
}

@end

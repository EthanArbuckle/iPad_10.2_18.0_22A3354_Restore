@implementation CWFAutoJoinManager

- (void)setMaxCompatibilityEnabled:(BOOL)a3
{
  CWFAutoJoinManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_maxCompatibilityEnabled = a3;
  objc_sync_exit(obj);

}

- (void)setSupportedChannels:(id)a3
{
  id v4;
  CWFAutoJoinManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t supportedChannels;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isSubsetOfSet;
  uint64_t v18;
  NSSet *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 *v24;
  int v25;
  __int16 v26;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  supportedChannels = (uint64_t)v5->_supportedChannels;
  if ((id)supportedChannels != v4
    && (!v4 || !supportedChannels || (objc_msgSend_isEqual_(v4, v6, supportedChannels, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 0;
      v25 = 2;
      v24 = &v26;
      _os_log_send_and_compose_impl();
    }

    v16 = (uint64_t)v5->_supportedChannels;
    if (v16)
      isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v4, v13, v16, v14, v15);
    else
      isSubsetOfSet = 0;
    v18 = objc_msgSend_copy(v4, v13, v16, v14, v15, v24, v25);
    v19 = v5->_supportedChannels;
    v5->_supportedChannels = (NSSet *)v18;

    if ((isSubsetOfSet & 1) == 0)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v20, v21, v22, v23);
    }
  }
  objc_sync_exit(v5);

}

- (void)__updateNextRequestTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_source *v6;
  OS_dispatch_source *nextRequestTimer;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t RequestInterval;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  const __CFString *v19;
  OS_dispatch_source *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  _QWORD handler[5];
  int v25;
  const __CFString *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_nextRequestTimer)
  {
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
    nextRequestTimer = self->_nextRequestTimer;
    self->_nextRequestTimer = v6;

    v8 = self->_nextRequestTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1B0699560;
    handler[3] = &unk_1E6133138;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_nextRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_nextRequestTimer);
  }
  if ((unint64_t)objc_msgSend___nextRequestInterval(self, a2, v2, v3, v4) > 0x7FFFFFFFFFFFFFFELL)
  {
    RequestInterval = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  RequestInterval = objc_msgSend___nextRequestInterval(self, v9, v10, v11, v12);
  if (RequestInterval >= 1)
  {
LABEL_9:
    CWFGetOSLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (self->_isNextRequestScheduled)
        v19 = CFSTR("Re-scheduling");
      else
        v19 = CFSTR("Scheduling");
      v25 = 138543618;
      v26 = v19;
      v27 = 2048;
      v28 = RequestInterval / 0xF4240uLL;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 1;
    v20 = self->_nextRequestTimer;
    v21 = dispatch_walltime(0, RequestInterval);
    v22 = v20;
    goto LABEL_18;
  }
  if (!self->_isNextRequestScheduled)
    return;
  CWFGetOSLog();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    CWFGetOSLog();
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_send_and_compose_impl();
  }

  self->_isNextRequestScheduled = 0;
  v22 = self->_nextRequestTimer;
  v21 = -1;
LABEL_18:
  dispatch_source_set_timer(v22, v21, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)setLocation:(id)a3
{
  id v4;
  CWFAutoJoinManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t location;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CLLocation *v17;
  double v18;
  uint64_t v19;
  CLLocation *v20;
  __int16 *v21;
  int v22;
  __int16 v23;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  location = (uint64_t)v5->_location;
  if ((id)location != v4 && (!v4 || !location || (objc_msgSend_isEqual_(v4, v6, location, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v23 = 0;
      v22 = 2;
      v21 = &v23;
      _os_log_send_and_compose_impl();
    }

    if (!v4
      || (v17 = v5->_location) == 0
      || (objc_msgSend_distanceFromLocation_(v17, v13, (uint64_t)v4, v15, v16), v18 > 20.0))
    {
      v5->_resetCachedKnownNetworksContext = 1;
    }
    v19 = objc_msgSend_copy(v4, v13, v14, v15, v16, v21, v22);
    v20 = v5->_location;
    v5->_location = (CLLocation *)v19;

  }
  objc_sync_exit(v5);

}

- (id)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  CWFAutoJoinRequest *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CWFAutoJoinManager *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  NSObject *targetQueue;
  qos_class_t v53;
  dispatch_block_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD block[4];
  id v62;
  int v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CWFAutoJoinRequest);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUUID_(v8, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setParameters_(v8, v17, (uint64_t)v6, v18, v19);
  objc_msgSend_setReply_(v8, v20, (uint64_t)v7, v21, v22);
  v23 = self;
  objc_sync_enter(v23);
  if (v23->_invalidated)
  {
    CWFGetOSLog();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_UUID(v8, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v39, v40, 5, v41, v42);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v8, v44, v45, v46, v47);
      v63 = 138543618;
      v64 = (unint64_t)v43;
      v65 = 2114;
      v66 = objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    v48 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = MEMORY[0x1E0C81028];
      v51 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      v63 = 134219010;
      v64 = v48 / 0x3B9ACA00;
      v65 = 2048;
      v66 = v48 % 0x3B9ACA00 / 0x3E8;
      v67 = 2082;
      v68 = "-[CWFAutoJoinManager performAutoJoinWithParameters:reply:]";
      v69 = 2082;
      v70 = "CWFAutoJoinManager.m";
      v71 = 1024;
      v72 = 747;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v23->_targetQueue;
    v53 = qos_class_self();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B067FA84;
    block[3] = &unk_1E61336E8;
    v62 = v7;
    v54 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v53, 0, block);
    dispatch_async(targetQueue, v54);

  }
  else
  {
    objc_msgSend___addRequest_(v23, v24, (uint64_t)v8, v25, v26);
  }
  objc_sync_exit(v23);

  objc_msgSend_UUID(v8, v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (void)setRetrySchedule:(int64_t)a3
{
  CWFAutoJoinManager *v4;
  void *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  int v27;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_retrySchedule != a3)
  {
    CWFGetOSLog();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      CWFGetOSLog();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B0642860(v4->_retrySchedule, v8, v9, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      sub_1B0642860(a3, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v12;
      v30 = 2114;
      v31 = v17;
      v27 = 22;
      v26 = &v28;
      _os_log_send_and_compose_impl();

    }
    v4->_retrySchedule = a3;
    objc_msgSend___setupThrottleIntervals(v4, v18, v19, v20, v21);
    if (!v4->_invalidated
      && (v4->_isRetryScheduled || objc_msgSend___shouldAlwaysUpdateRetrySchedule_(v4, v22, a3, v24, v25)))
    {
      objc_msgSend___updateRetrySchedule(v4, v22, v23, v24, v25, v26, v27);
    }
  }
  objc_sync_exit(v4);

}

- (void)setAssociatedNetwork:(id)a3
{
  id v5;
  CWFAutoJoinManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t associatedNetwork;
  void **p_associatedNetwork;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CWFScanResult *steerToNetwork;
  CWFScanResult *steerFromNetwork;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  NSMutableSet *disallowedKnownNetworks;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  NSMutableSet *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  NSMutableSet *failedToJoinKnownNetworkIDs;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSMutableSet *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  int *v132;
  uint64_t v133;
  int v134;
  id v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  p_associatedNetwork = (void **)&v6->_associatedNetwork;
  associatedNetwork = (uint64_t)v6->_associatedNetwork;
  if ((id)associatedNetwork != v5
    && (!v5 || !associatedNetwork || !objc_msgSend_isEqual_(v5, v7, associatedNetwork, v8, v9)))
  {
    goto LABEL_13;
  }
  objc_msgSend_matchingKnownNetworkProfile(v5, v7, associatedNetwork, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v13, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v21)
  {

    goto LABEL_35;
  }
  objc_msgSend_matchingKnownNetworkProfile(v5, v17, v18, v19, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_12;
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v22, v23, v24, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend_matchingKnownNetworkProfile(v5, v27, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v133) = objc_msgSend_isEqual_(v32, v38, (uint64_t)v37, v39, v40);

  if ((v133 & 0x100000000) != 0)
    goto LABEL_35;
LABEL_13:
  CWFGetOSLog();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    CWFGetOSLog();
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = MEMORY[0x1E0C81028];
    v43 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v134 = 138543362;
    v135 = v5;
    LODWORD(v133) = 12;
    v132 = &v134;
    _os_log_send_and_compose_impl();
  }

  if ((v5 != 0) == (*p_associatedNetwork == 0))
    v6->_linkChangeTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  objc_storeStrong((id *)&v6->_associatedNetwork, a3);
  objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v48, v49, v50, v51, v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57)
    goto LABEL_25;
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v53, v54, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v58, v59, v60, v61, v62);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67)
  {

LABEL_25:
    goto LABEL_26;
  }
  objc_msgSend_matchingKnownNetworkProfile(v6->_steerToNetwork, v63, v64, v65, v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v68, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(*p_associatedNetwork, v74, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v78, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v133) = objc_msgSend_isEqual_(v73, v84, (uint64_t)v83, v85, v86);

  if ((v133 & 0x100000000) == 0)
  {
LABEL_26:
    steerToNetwork = v6->_steerToNetwork;
    v6->_steerToNetwork = 0;

    steerFromNetwork = v6->_steerFromNetwork;
    v6->_steerFromNetwork = 0;

  }
  if (v5)
  {
    objc_msgSend_networkProfile(v5, v87, v88, v89, v90);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v93, v94, v95, v96, v97);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      disallowedKnownNetworks = v6->_disallowedKnownNetworks;
      objc_msgSend_identifier(v93, v98, v99, v100, v101);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(disallowedKnownNetworks) = objc_msgSend_containsObject_(disallowedKnownNetworks, v105, (uint64_t)v104, v106, v107);

      if ((_DWORD)disallowedKnownNetworks)
      {
        v108 = v6->_disallowedKnownNetworks;
        objc_msgSend_identifier(v93, v98, v99, v100, v101);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v108, v110, (uint64_t)v109, v111, v112);

      }
    }
    objc_msgSend_identifier(v93, v98, v99, v100, v101, v132, v133);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (v117)
    {
      failedToJoinKnownNetworkIDs = v6->_failedToJoinKnownNetworkIDs;
      objc_msgSend_identifier(v93, v113, v114, v115, v116);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_(failedToJoinKnownNetworkIDs, v120, (uint64_t)v119, v121, v122);

      if ((_DWORD)failedToJoinKnownNetworkIDs)
      {
        v127 = v6->_failedToJoinKnownNetworkIDs;
        objc_msgSend_identifier(v93, v123, v124, v125, v126);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v127, v129, (uint64_t)v128, v130, v131);

      }
    }

  }
LABEL_35:
  objc_sync_exit(v6);

}

- (unint64_t)__nextRequestInterval
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableDictionary *throttleIntervalMap;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  BOOL v92;
  unint64_t v93;
  unint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  unint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  NSMutableArray *obj;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  __uint64_t v178;
  void *v179;
  CWFAutoJoinManager *v180;
  uint64_t v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v178 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  obj = self->_pendingRequests;
  v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v199, (uint64_t)v207, 16);
  v8 = 0;
  if (v166)
  {
    v165 = *(_QWORD *)v200;
    v180 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v200 != v165)
          objc_enumerationMutation(obj);
        v167 = v9;
        throttleIntervalMap = self->_throttleIntervalMap;
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_parameters(*(void **)(*((_QWORD *)&v199 + 1) + 8 * v9), v4, v5, v6, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);
        objc_msgSend_numberWithInteger_(v11, v18, v17, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v22, (uint64_t)v21, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend_objectForKeyedSubscript_(v180->_throttleIntervalMap, v26, (uint64_t)&unk_1E615E8C8, v28, v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        objc_msgSend_intervals(v25, v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v30, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v168 = v35;
        v179 = v25;
        v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v195, (uint64_t)v206, 16);
        if (v172)
        {
          v170 = *(_QWORD *)v196;
          self = v180;
          do
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v196 != v170)
                objc_enumerationMutation(v168);
              v174 = v41;
              v42 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * v41);
              v191 = 0u;
              v192 = 0u;
              v193 = 0u;
              v194 = 0u;
              objc_msgSend_allKeys(self->_throttleTimestampMap, v37, v38, v39, v40);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v191, (uint64_t)v205, 16);
              if (v45)
              {
                v50 = v45;
                v51 = *(_QWORD *)v192;
                do
                {
                  v52 = 0;
                  v181 = v50;
                  do
                  {
                    if (*(_QWORD *)v192 != v51)
                      objc_enumerationMutation(v43);
                    v53 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v52);
                    v54 = objc_msgSend_integerValue(v42, v46, v47, v48, v49);
                    if (v54 == objc_msgSend_integerValue(v53, v55, v56, v57, v58))
                    {
                      objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v46, (uint64_t)v53, v48, v49);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_intervals(v25, v60, v61, v62, v63);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v42, v66, v67);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v68 && v59)
                      {
                        v176 = objc_msgSend_unsignedLongValue(v59, v69, v70, v71, v72);
                        v77 = v42;
                        v78 = v51;
                        v79 = v43;
                        v80 = objc_msgSend_unsignedLongValue(v68, v73, v74, v75, v76);
                        v85 = 1000000000 * objc_msgSend_unsignedLongValue(v68, v81, v82, v83, v84);
                        v90 = objc_msgSend_unsignedLongValue(v68, v86, v87, v88, v89);
                        v91 = 1000000000 * v90;
                        v92 = v80 > v85;
                        v43 = v79;
                        v51 = v78;
                        v42 = v77;
                        v25 = v179;
                        self = v180;
                        if (v92)
                          v91 = v90;
                        v93 = v91 - (v178 - v176);
                        if (v8 >= v93)
                          v94 = v91 - (v178 - v176);
                        else
                          v94 = v8;
                        if (v8)
                          v93 = v94;
                        if (v91 > v178 - v176)
                          v8 = v93;
                      }
                      v50 = v181;

                    }
                    ++v52;
                  }
                  while (v50 != v52);
                  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v191, (uint64_t)v205, 16);
                }
                while (v50);
              }

              v41 = v174 + 1;
            }
            while (v174 + 1 != v172);
            v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v37, (uint64_t)&v195, (uint64_t)v206, 16);
          }
          while (v172);
        }
        else
        {
          self = v180;
        }

        v189 = 0u;
        v190 = 0u;
        v187 = 0u;
        v188 = 0u;
        objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v95, v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v99, v100, v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        v169 = v104;
        v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v187, (uint64_t)v204, 16);
        if (v173)
        {
          v171 = *(_QWORD *)v188;
          do
          {
            v110 = 0;
            do
            {
              if (*(_QWORD *)v188 != v171)
                objc_enumerationMutation(v169);
              v175 = v110;
              v111 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * v110);
              v183 = 0u;
              v184 = 0u;
              v185 = 0u;
              v186 = 0u;
              objc_msgSend_allKeys(self->_triggerTimestampMap, v106, v107, v108, v109);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v183, (uint64_t)v203, 16);
              if (v114)
              {
                v119 = v114;
                v120 = *(_QWORD *)v184;
                do
                {
                  v121 = 0;
                  v182 = v119;
                  do
                  {
                    if (*(_QWORD *)v184 != v120)
                      objc_enumerationMutation(v112);
                    v122 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v121);
                    v123 = objc_msgSend_integerValue(v111, v115, v116, v117, v118);
                    if (v123 == objc_msgSend_integerValue(v122, v124, v125, v126, v127))
                    {
                      objc_msgSend_objectForKeyedSubscript_(self->_triggerTimestampMap, v115, (uint64_t)v122, v117, v118);
                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_intervalsBasedOnTriggerTimestamp(v25, v129, v130, v131, v132);
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v133, v134, (uint64_t)v111, v135, v136);
                      v137 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v137 && v128)
                      {
                        v177 = objc_msgSend_unsignedLongValue(v128, v138, v139, v140, v141);
                        v146 = v111;
                        v147 = v120;
                        v148 = v112;
                        v149 = objc_msgSend_unsignedLongValue(v137, v142, v143, v144, v145);
                        v154 = 1000000000 * objc_msgSend_unsignedLongValue(v137, v150, v151, v152, v153);
                        v159 = objc_msgSend_unsignedLongValue(v137, v155, v156, v157, v158);
                        v160 = 1000000000 * v159;
                        v92 = v149 > v154;
                        v112 = v148;
                        v120 = v147;
                        v111 = v146;
                        v25 = v179;
                        self = v180;
                        if (v92)
                          v160 = v159;
                        v161 = v160 - (v178 - v177);
                        if (v8 >= v161)
                          v162 = v160 - (v178 - v177);
                        else
                          v162 = v8;
                        if (v8)
                          v161 = v162;
                        if (v160 > v178 - v177)
                          v8 = v161;
                      }

                      v119 = v182;
                    }
                    ++v121;
                  }
                  while (v119 != v121);
                  v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v115, (uint64_t)&v183, (uint64_t)v203, 16);
                }
                while (v119);
              }

              v110 = v175 + 1;
            }
            while (v175 + 1 != v173);
            v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v106, (uint64_t)&v187, (uint64_t)v204, 16);
          }
          while (v173);
        }

        v9 = v167 + 1;
      }
      while (v167 + 1 != v166);
      v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v199, (uint64_t)v207, 16);
    }
    while (v166);
  }

  return v8;
}

- (BOOL)__shouldThrottleAutoJoinTrigger:(int64_t)a3
{
  NSMutableDictionary *throttleIntervalMap;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  BOOL v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  BOOL v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  BOOL v143;
  void *v144;
  NSObject *v145;
  void *v146;
  id v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  id v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  __uint64_t v168;
  CWFAutoJoinManager *v169;
  void *v170;
  id obj;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  int v190;
  void *v191;
  __int16 v192;
  void *v193;
  _BYTE v194[128];
  _BYTE v195[128];
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  v168 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  throttleIntervalMap = self->_throttleIntervalMap;
  v161 = a3;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(throttleIntervalMap, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_throttleIntervalMap, v14, (uint64_t)&unk_1E615E8C8, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  objc_msgSend_intervals(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = self;
  v170 = v13;
  v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v184, (uint64_t)v195, 16);
  if (v162)
  {
    v29 = *(_QWORD *)v185;
    v166 = v23;
    v159 = *(_QWORD *)v185;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v185 != v29)
          objc_enumerationMutation(v23);
        v164 = v30;
        v31 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v30);
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v183 = 0u;
        objc_msgSend_allKeys(self->_throttleTimestampMap, v25, v26, v27, v28);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v180, (uint64_t)v194, 16);
        if (v33)
        {
          v38 = v33;
          v39 = *(_QWORD *)v181;
          while (2)
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v181 != v39)
                objc_enumerationMutation(obj);
              v41 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
              v42 = objc_msgSend_integerValue(v31, v34, v35, v36, v37);
              if (v42 == objc_msgSend_integerValue(v41, v43, v44, v45, v46))
              {
                objc_msgSend_objectForKeyedSubscript_(self->_throttleTimestampMap, v34, (uint64_t)v41, v36, v37);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_intervals(v13, v48, v49, v50, v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)v31, v54, v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47)
                  v61 = v56 == 0;
                else
                  v61 = 1;
                if (!v61)
                {
                  v62 = objc_msgSend_unsignedLongLongValue(v47, v57, v58, v59, v60);
                  v67 = objc_msgSend_unsignedLongValue(v56, v63, v64, v65, v66);
                  v72 = 1000000000 * objc_msgSend_unsignedLongValue(v56, v68, v69, v70, v71);
                  v77 = objc_msgSend_unsignedLongValue(v56, v73, v74, v75, v76);
                  v78 = 1000000000 * v77;
                  v79 = v67 > v72;
                  self = v169;
                  v13 = v170;
                  if (v79)
                    v78 = v77;
                  if (v168 - v62 < v78)
                  {
                    CWFGetOSLog();
                    v144 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v144)
                    {
                      CWFGetOSLog();
                      v145 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v145 = MEMORY[0x1E0C81028];
                      v147 = MEMORY[0x1E0C81028];
                    }
                    v89 = v166;

                    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                    {
                      sub_1B063D5D0(v161, v148, v149, v150, v151);
                      v152 = (void *)objc_claimAutoreleasedReturnValue();
                      v190 = 138543618;
                      v191 = v170;
                      v192 = 2114;
                      v193 = v152;
LABEL_60:
                      _os_log_send_and_compose_impl();

                    }
LABEL_61:

                    v143 = 1;
                    goto LABEL_62;
                  }
                }

              }
            }
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v180, (uint64_t)v194, 16);
            if (v38)
              continue;
            break;
          }
        }

        v30 = v164 + 1;
        v23 = v166;
        v29 = v159;
      }
      while (v164 + 1 != v162);
      v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v166, v25, (uint64_t)&v184, (uint64_t)v195, 16);
    }
    while (v162);
  }

  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  objc_msgSend_intervalsBasedOnTriggerTimestamp(v13, v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v84, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v176, (uint64_t)v189, 16);
  if (v163)
  {
    v95 = *(_QWORD *)v177;
    v167 = v89;
    v160 = *(_QWORD *)v177;
    do
    {
      v96 = 0;
      do
      {
        if (*(_QWORD *)v177 != v95)
          objc_enumerationMutation(v89);
        v165 = v96;
        v97 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v96);
        v172 = 0u;
        v173 = 0u;
        v174 = 0u;
        v175 = 0u;
        objc_msgSend_allKeys(self->_triggerTimestampMap, v91, v92, v93, v94);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v172, (uint64_t)v188, 16);
        if (v99)
        {
          v104 = v99;
          v105 = *(_QWORD *)v173;
LABEL_33:
          v106 = 0;
          while (1)
          {
            if (*(_QWORD *)v173 != v105)
              objc_enumerationMutation(obj);
            v107 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v106);
            v108 = objc_msgSend_integerValue(v97, v100, v101, v102, v103);
            if (v108 == objc_msgSend_integerValue(v107, v109, v110, v111, v112))
            {
              objc_msgSend_objectForKeyedSubscript_(self->_triggerTimestampMap, v100, (uint64_t)v107, v102, v103);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_intervalsBasedOnTriggerTimestamp(v13, v113, v114, v115, v116);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v117, v118, (uint64_t)v97, v119, v120);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
                v125 = v56 == 0;
              else
                v125 = 1;
              if (!v125)
              {
                v126 = objc_msgSend_unsignedLongLongValue(v47, v121, v122, v123, v124);
                v131 = objc_msgSend_unsignedLongValue(v56, v127, v128, v129, v130);
                v136 = 1000000000 * objc_msgSend_unsignedLongValue(v56, v132, v133, v134, v135);
                v141 = objc_msgSend_unsignedLongValue(v56, v137, v138, v139, v140);
                v142 = 1000000000 * v141;
                v79 = v131 > v136;
                self = v169;
                v13 = v170;
                if (v79)
                  v142 = v141;
                if (v168 - v126 < v142)
                {
                  CWFGetOSLog();
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v146)
                  {
                    CWFGetOSLog();
                    v145 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v145 = MEMORY[0x1E0C81028];
                    v153 = MEMORY[0x1E0C81028];
                  }
                  v89 = v167;

                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
                  {
                    sub_1B063D5D0(v161, v154, v155, v156, v157);
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    v190 = 138543618;
                    v191 = v170;
                    v192 = 2114;
                    v193 = v152;
                    goto LABEL_60;
                  }
                  goto LABEL_61;
                }
              }

            }
            if (v104 == ++v106)
            {
              v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v172, (uint64_t)v188, 16);
              if (v104)
                goto LABEL_33;
              break;
            }
          }
        }

        v96 = v165 + 1;
        v89 = v167;
        v95 = v160;
      }
      while (v165 + 1 != v163);
      v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v167, v91, (uint64_t)&v176, (uint64_t)v189, 16);
    }
    while (v163);
  }
  v143 = 0;
LABEL_62:

  return v143;
}

- (void)__addRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  __uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *triggerTimestampMap;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t shouldAllowAutoHotspotForTrigger;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CWFAutoJoinRequest *activeRequest;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  CWFAutoJoinManager *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSMutableArray *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  char v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  char v285;
  void *v286;
  CWFAutoJoinManager *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  NSObject *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  __uint64_t v303;
  void *v304;
  NSObject *v305;
  void *v306;
  NSObject *v307;
  id v308;
  NSObject *targetQueue;
  qos_class_t v310;
  dispatch_block_t v311;
  void *v312;
  id v313;
  __uint64_t v314;
  void *v315;
  NSObject *v316;
  id v317;
  NSObject *v318;
  qos_class_t v319;
  dispatch_block_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  id v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  void *v342;
  NSObject *v343;
  id v344;
  NSMutableArray *pendingRequests;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  dispatch_qos_class_t v359;
  dispatch_qos_class_t v360;
  void *v361;
  NSObject *v362;
  id v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  unsigned int highestPendingQoS;
  void *v369;
  NSObject *internalQueue;
  dispatch_block_t v371;
  int *v372;
  int *v373;
  int v374;
  uint64_t v375;
  int v376;
  CWFAutoJoinManager *v377;
  unint64_t v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  uint64_t v389;
  void *v390;
  NSMutableArray *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  uint64_t v404;
  _QWORD v405[5];
  dispatch_qos_class_t v406;
  _QWORD v407[4];
  id v408;
  _QWORD block[4];
  id v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  int v415;
  _BYTE v416[10];
  _BYTE v417[10];
  const char *v418;
  __int16 v419;
  const char *v420;
  __int16 v421;
  int v422;
  _BYTE v423[128];
  uint64_t v424;

  v424 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CWFGetOSLog();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CWFGetOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v415 = 138543362;
    *(_QWORD *)v416 = v4;
    v374 = 12;
    v372 = &v415;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_parameters(v4, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_trigger(v12, v13, v14, v15, v16);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  objc_msgSend_numberWithUnsignedLongLong_(v18, v20, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  triggerTimestampMap = self->_triggerTimestampMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v25, v17, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(triggerTimestampMap, v29, (uint64_t)v23, (uint64_t)v28, v30);

  v31 = v17;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1 << v17) & 0xC000000000000010) == 0))
    self->_previousNonRetryTrigger = v17;
  if (objc_msgSend___shouldResetRetryIntervalIndexForTrigger_(self, v32, v17, v33, v34, v372, v374))
    objc_msgSend___resetRetryIntervalIndex(self, v35, v36, v37, v38);
  v39 = v4;
  if (v17 - 44 >= 8 && (v17 > 0x3F || ((1 << v17) & 0xC000000000000010) == 0))
  {
    shouldAllowAutoHotspotForTrigger = objc_msgSend___shouldAllowAutoHotspotForTrigger_(self, v35, v17, v37, v38);
    objc_msgSend_setAllowAutoHotspotFallback_(v4, v41, shouldAllowAutoHotspotForTrigger, v42, v43);
  }
  objc_msgSend___invalidateAllowedKnownNetworksCacheForTrigger_(self, v35, v17, v37, v38);
  activeRequest = self->_activeRequest;
  v377 = self;
  v378 = v17;
  v396 = v4;
  if (!activeRequest || self->_cancelled)
  {
    v376 = 0;
    goto LABEL_39;
  }
  objc_msgSend_parameters(activeRequest, v44, v45, v46, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v49, v50, v51, v52, v53) == v17)
  {
    objc_msgSend_parameters(self->_activeRequest, v54, v55, v56, v57);
    v58 = v4;
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_mode(v59, v60, v61, v62, v63);
    objc_msgSend_parameters(v4, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64 != objc_msgSend_mode(v69, v70, v71, v72, v73))
    {
      v376 = 0;
LABEL_37:

      v31 = v378;
      v39 = v4;
      goto LABEL_38;
    }
    objc_msgSend_parameters(self->_activeRequest, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v78, v79, v80, v81, v82);
    v83 = self;
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v84, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v58, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v94, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v99, v100, v101, v102, v103);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89 != v108)
    {
      objc_msgSend_parameters(v83->_activeRequest, v104, v105, v106, v107);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v109, v110, v111, v112, v113);
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v403, v114, v115, v116, v117);
      v118 = objc_claimAutoreleasedReturnValue();
      if (!v118)
      {
        v376 = 0;
LABEL_35:

LABEL_36:
        self = v377;
        v4 = v396;
        goto LABEL_37;
      }
      v399 = (void *)v118;
      v401 = v109;
      objc_msgSend_parameters(v396, v119, v120, v121, v122);
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v397, v123, v124, v125, v126);
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v395, v127, v128, v129, v130);
      v131 = objc_claimAutoreleasedReturnValue();
      if (!v131)
      {
        v376 = 0;
LABEL_34:

        v109 = v401;
        goto LABEL_35;
      }
      v394 = (void *)v131;
      objc_msgSend_parameters(v377->_activeRequest, v132, v133, v134, v135);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v392, v136, v137, v138, v139);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v390, v140, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v396, v145, v146, v147, v148);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v388, v149, v150, v151, v152);
      v387 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v387, v153, v154, v155, v156);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v144, v157, (uint64_t)v386, v158, v159))
      {
        v376 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v385 = v144;
    }
    v160 = objc_msgSend_allowAutoHotspotFallback(v377->_activeRequest, v104, v105, v106, v107);
    v376 = v160 ^ objc_msgSend_allowAutoHotspotFallback(v396, v161, v162, v163, v164) ^ 1;
    v144 = v385;
    if (v89 == v108)
      goto LABEL_36;
    goto LABEL_33;
  }
  v376 = 0;
LABEL_38:

LABEL_39:
  v413 = 0u;
  v414 = 0u;
  v411 = 0u;
  v412 = 0u;
  v165 = self->_pendingRequests;
  v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v166, (uint64_t)&v411, (uint64_t)v423, 16);
  if (v167)
  {
    v172 = v167;
    v173 = *(_QWORD *)v412;
    v389 = *(_QWORD *)v412;
    v391 = v165;
LABEL_41:
    v174 = 0;
    v404 = v172;
    while (1)
    {
      if (*(_QWORD *)v412 != v173)
        objc_enumerationMutation(v165);
      v175 = *(void **)(*((_QWORD *)&v411 + 1) + 8 * v174);
      objc_msgSend_parameters(v175, v168, v169, v170, v171);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v176, v177, v178, v179, v180) != v31)
        goto LABEL_52;
      objc_msgSend_parameters(v175, v181, v182, v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = objc_msgSend_mode(v185, v186, v187, v188, v189);
      objc_msgSend_parameters(v39, v191, v192, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      if (v190 != objc_msgSend_mode(v195, v196, v197, v198, v199))
      {

        v172 = v404;
LABEL_52:

        goto LABEL_63;
      }
      objc_msgSend_parameters(v175, v200, v201, v202, v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v204, v205, v206, v207, v208);
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v402, v209, v210, v211, v212);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v39, v214, v215, v216, v217);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v400, v218, v219, v220, v221);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v398, v222, v223, v224, v225);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      if (v213 == v230)
      {
        v231 = v392;
      }
      else
      {
        objc_msgSend_parameters(v175, v226, v227, v228, v229);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v231, v232, v233, v234, v235);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v395, v236, v237, v238, v239);
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v394)
        {
          v285 = 0;
          v394 = 0;
          goto LABEL_61;
        }
        objc_msgSend_parameters(v396, v240, v241, v242, v243);
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v387, v244, v245, v246, v247);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v386, v248, v249, v250, v251);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v385)
        {
          v385 = 0;
          v285 = 0;
          v31 = v378;
          goto LABEL_60;
        }
        v393 = v204;
        objc_msgSend_parameters(v175, v252, v253, v254, v255);
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v384, v256, v257, v258, v259);
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v383, v260, v261, v262, v263);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parameters(v396, v265, v266, v267, v268);
        v381 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v381, v269, v270, v271, v272);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v380, v273, v274, v275, v276);
        v382 = v264;
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v264, v277, (uint64_t)v379, v278, v279))
        {
          v285 = 0;
          v31 = v378;
          v204 = v393;
LABEL_59:

LABEL_60:
LABEL_61:

          goto LABEL_62;
        }
        v31 = v378;
        v204 = v393;
      }
      v280 = objc_msgSend_allowAutoHotspotFallback(v175, v226, v227, v228, v229);
      v285 = v280 ^ objc_msgSend_allowAutoHotspotFallback(v396, v281, v282, v283, v284) ^ 1;
      if (v213 != v230)
        goto LABEL_59;
LABEL_62:
      v392 = v231;

      v39 = v396;
      v173 = v389;
      v165 = v391;
      v172 = v404;
      if ((v285 & 1) != 0)
      {
        v286 = v396;

        v287 = v377;
        if (!objc_msgSend___shouldIgnoreRequestWithTrigger_(v377, v300, v31, v301, v302))
          goto LABEL_74;
LABEL_72:
        v303 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        if (v304)
        {
          CWFGetOSLog();
          v305 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v305 = MEMORY[0x1E0C81028];
          v308 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v305, OS_LOG_TYPE_DEBUG))
        {
          v415 = 134219010;
          *(_QWORD *)v416 = v303 / 0x3B9ACA00;
          *(_WORD *)&v416[8] = 2048;
          *(_QWORD *)v417 = v303 % 0x3B9ACA00 / 0x3E8;
          *(_WORD *)&v417[8] = 2082;
          v418 = "-[CWFAutoJoinManager __addRequest:]";
          v419 = 2082;
          v420 = "CWFAutoJoinManager.m";
          v421 = 1024;
          v422 = 1330;
          LODWORD(v375) = 48;
          v373 = &v415;
          _os_log_send_and_compose_impl();
        }

        targetQueue = v287->_targetQueue;
        v310 = qos_class_self();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1B0682E90;
        block[3] = &unk_1E6133138;
        v410 = v286;
        v311 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v310, 0, block);
        dispatch_async(targetQueue, v311);

        v312 = v410;
LABEL_89:

        goto LABEL_90;
      }
LABEL_63:
      if (v172 == ++v174)
      {
        v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v165, v168, (uint64_t)&v411, (uint64_t)v423, 16);
        if (v172)
          goto LABEL_41;
        break;
      }
    }
  }
  v286 = v39;

  v287 = v377;
  if ((objc_msgSend___shouldIgnoreRequestWithTrigger_(v377, v288, v31, v289, v290) & 1) != 0)
    goto LABEL_72;
  if (v376 && !v377->_didConfigurationChangeSincePreviousAttempt)
  {
LABEL_74:
    CWFGetOSLog();
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (v306)
    {
      CWFGetOSLog();
      v307 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v307 = MEMORY[0x1E0C81028];
      v313 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v307, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v415) = 0;
      LODWORD(v375) = 2;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    v314 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    if (v315)
    {
      CWFGetOSLog();
      v316 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v316 = MEMORY[0x1E0C81028];
      v317 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v316, OS_LOG_TYPE_DEBUG))
    {
      v415 = 134219010;
      *(_QWORD *)v416 = v314 / 0x3B9ACA00;
      *(_WORD *)&v416[8] = 2048;
      *(_QWORD *)v417 = v314 % 0x3B9ACA00 / 0x3E8;
      *(_WORD *)&v417[8] = 2082;
      v418 = "-[CWFAutoJoinManager __addRequest:]";
      v419 = 2082;
      v420 = "CWFAutoJoinManager.m";
      v421 = 1024;
      v422 = 1340;
      LODWORD(v375) = 48;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    v318 = v287->_targetQueue;
    v319 = qos_class_self();
    v407[0] = MEMORY[0x1E0C809B0];
    v407[1] = 3221225472;
    v407[2] = sub_1B068307C;
    v407[3] = &unk_1E6133138;
    v408 = v286;
    v320 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v319, 0, v407);
    dispatch_async(v318, v320);

    v312 = v408;
    goto LABEL_89;
  }
  if (objc_msgSend___shouldInvokeImmediatelyForTrigger_(v377, v291, v31, v292, v293))
  {
    CWFGetOSLog();
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    if (v298)
    {
      CWFGetOSLog();
      v299 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v299 = MEMORY[0x1E0C81028];
      v336 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v415) = 0;
      LODWORD(v375) = 2;
      v373 = &v415;
      _os_log_send_and_compose_impl();
    }

    v341 = v286;
    if (v377->_activeRequest && !v377->_requeued)
    {
      CWFGetOSLog();
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      if (v342)
      {
        CWFGetOSLog();
        v343 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v343 = MEMORY[0x1E0C81028];
        v344 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v415) = 0;
        LODWORD(v375) = 2;
        v373 = &v415;
        _os_log_send_and_compose_impl();
      }

      pendingRequests = v377->_pendingRequests;
      v350 = (void *)objc_msgSend_copy(v377->_activeRequest, v346, v347, v348, v349);
      objc_msgSend_insertObject_atIndex_(pendingRequests, v351, (uint64_t)v350, 0, v352);

      v377->_requeued = 1;
      v341 = v286;
    }
    objc_msgSend_date(MEMORY[0x1E0C99D68], v337, v338, v339, v340, v373, v375);
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAddedAt_(v341, v354, (uint64_t)v353, v355, v356);

    objc_msgSend_insertObject_atIndex_(v377->_pendingRequests, v357, (uint64_t)v341, 0, v358);
  }
  else
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v294, v295, v296, v297);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAddedAt_(v39, v330, (uint64_t)v329, v331, v332);

    objc_msgSend_addObject_(v377->_pendingRequests, v333, (uint64_t)v39, v334, v335);
  }
  if (v377->_activeRequest)
  {
    v359 = objc_msgSend___qosForAutoJoinTrigger_(v377, v321, v31, v323, v324);
    if (v359 > v377->_highestPendingQoS)
    {
      v360 = v359;
      CWFGetOSLog();
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      if (v361)
      {
        CWFGetOSLog();
        v362 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v362 = MEMORY[0x1E0C81028];
        v363 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v362, OS_LOG_TYPE_DEBUG))
      {
        highestPendingQoS = v377->_highestPendingQoS;
        sub_1B063D5D0(v378, v364, v365, v366, v367);
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        v415 = 67109634;
        *(_DWORD *)v416 = v360;
        *(_WORD *)&v416[4] = 1024;
        *(_DWORD *)&v416[6] = highestPendingQoS;
        *(_WORD *)v417 = 2114;
        *(_QWORD *)&v417[2] = v369;
        LODWORD(v375) = 24;
        v373 = &v415;
        _os_log_send_and_compose_impl();

      }
      v377->_highestPendingQoS = v360;
      internalQueue = v377->_internalQueue;
      v405[0] = MEMORY[0x1E0C809B0];
      v405[1] = 3221225472;
      v405[2] = sub_1B0683268;
      v405[3] = &unk_1E61334C8;
      v405[4] = v377;
      v406 = v360;
      v371 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v360, 0, v405);
      dispatch_async(internalQueue, v371);

    }
  }
LABEL_90:
  if ((objc_msgSend___nextRequest(v287, v321, v322, v323, v324, v373, v375) & 1) == 0 && !v287->_isRetryScheduled)
    objc_msgSend___updateRetrySchedule(v287, v325, v326, v327, v328);

}

- (BOOL)__nextRequest
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;
  id v8;
  CWFAutoJoinRequest **p_activeRequest;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  unint64_t retryScheduleIndex;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  dispatch_qos_class_t v82;
  void *v83;
  NSObject *v84;
  id v85;
  CWFAutoJoinRequest *v86;
  NSObject *internalQueue;
  dispatch_block_t v88;
  int *v90;
  int *v91;
  int v92;
  uint64_t v93;
  _QWORD block[5];
  int v95;
  _BYTE v96[18];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (self->_isNextRequestScheduled)
  {
    CWFGetOSLog();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      CWFGetOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v95) = 0;
      v92 = 2;
      v90 = &v95;
      _os_log_send_and_compose_impl();
    }

    self->_isNextRequestScheduled = 0;
    dispatch_source_set_timer((dispatch_source_t)self->_nextRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  p_activeRequest = &self->_activeRequest;
  if (self->_activeRequest)
    goto LABEL_9;
  v10 = objc_msgSend_count(self->_pendingRequests, a2, v2, v3, v4);
  if (!v10)
    return v10;
  v19 = 0;
  if (objc_msgSend_count(self->_pendingRequests, v11, v12, v13, v14))
  {
    v20 = 0;
    v21 = MEMORY[0x1E0C81028];
    do
    {
      if (*p_activeRequest)
        goto LABEL_28;
      objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v15, v20, v17, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_trigger(v27, v28, v29, v30, v31);
      if ((objc_msgSend___shouldThrottleAutoJoinTrigger_(self, v33, v32, v34, v35) & 1) != 0)
      {
        objc_msgSend_parameters(v22, v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetNetworkProfile(v40, v41, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          if ((objc_msgSend_throttled(v22, v46, v47, v48, v49) & 1) == 0)
          {
            CWFGetOSLog();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              CWFGetOSLog();
              v51 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v56 = v21;
              v51 = v21;
            }

            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v95 = 138543362;
              *(_QWORD *)v96 = v22;
              v92 = 12;
              v90 = &v95;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_setThrottled_(v22, v57, 1, v58, v59);
          }
          goto LABEL_21;
        }
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_activeRequest, v22);
      v19 = v20;
LABEL_21:

      ++v20;
    }
    while (v20 < objc_msgSend_count(self->_pendingRequests, v52, v53, v54, v55));
  }
  if (!*p_activeRequest)
  {
    objc_msgSend___updateNextRequestTimer(self, v15, v16, v17, v18);
LABEL_9:
    LOBYTE(v10) = 0;
    return v10;
  }
LABEL_28:
  objc_msgSend_removeObjectAtIndex_(self->_pendingRequests, v15, v19, v17, v18, v90, v92);
  if (self->_isRetryScheduled)
  {
    CWFGetOSLog();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      CWFGetOSLog();
      v65 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B0642860(self->_retrySchedule, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      retryScheduleIndex = self->_retryScheduleIndex;
      v95 = 138543618;
      *(_QWORD *)v96 = v71;
      *(_WORD *)&v96[8] = 2048;
      *(_QWORD *)&v96[10] = retryScheduleIndex;
      LODWORD(v93) = 22;
      v91 = &v95;
      _os_log_send_and_compose_impl();

    }
    self->_isRetryScheduled = 0;
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_msgSend_parameters(self->_activeRequest, v60, v61, v62, v63, v91, v93);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_trigger(v73, v74, v75, v76, v77);
  v82 = objc_msgSend___qosForAutoJoinTrigger_(self, v79, v78, v80, v81);

  CWFGetOSLog();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    CWFGetOSLog();
    v84 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = MEMORY[0x1E0C81028];
    v85 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    v86 = *p_activeRequest;
    v95 = 67109378;
    *(_DWORD *)v96 = v82;
    *(_WORD *)&v96[4] = 2114;
    *(_QWORD *)&v96[6] = v86;
    _os_log_send_and_compose_impl();
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06832CC;
  block[3] = &unk_1E6133138;
  block[4] = self;
  v88 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v82, 0, block);
  dispatch_async(internalQueue, v88);

  LOBYTE(v10) = 1;
  return v10;
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 544, 1);
}

- (BOOL)__shouldResetRetryIntervalIndexForTrigger:(int64_t)a3
{
  return ((unint64_t)a3 < 0x3C) & (0x90000032010018CuLL >> a3);
}

- (BOOL)__shouldIgnoreRequestWithTrigger:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *v8;
  NSObject *v9;
  CWFAutoJoinRequest *activeRequest;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (a3 != 32)
  {
    if (a3 == 58 || a3 == 34)
    {
      objc_msgSend_associatedNetwork(self, a2, a3, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        CWFGetOSLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          CWFGetOSLog();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = MEMORY[0x1E0C81028];
          v11 = MEMORY[0x1E0C81028];
        }

        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        sub_1B063D5D0(a3, v12, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        _os_log_send_and_compose_impl();

LABEL_14:
        LOBYTE(activeRequest) = 1;
        return (char)activeRequest;
      }
    }
    goto LABEL_9;
  }
  activeRequest = self->_activeRequest;
  if (!activeRequest)
    return (char)activeRequest;
  if (!self->_cancelled)
  {
    objc_msgSend_parameters(activeRequest, a2, 32, v3, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 32)
    {

    }
    else
    {
      objc_msgSend_parameters(self->_activeRequest, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_trigger(v26, v27, v28, v29, v30);

      if (v31 != 47)
        goto LABEL_9;
    }
    CWFGetOSLog();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      CWFGetOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    sub_1B063D5D0(0x20uLL, v34, v35, v36, v37);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_9:
  LOBYTE(activeRequest) = 0;
  return (char)activeRequest;
}

- (BOOL)__shouldAllowAutoHotspotForTrigger:(int64_t)a3
{
  return a3 == 61;
}

- (CWFAutoJoinManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  CWFAutoJoinStatistics *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  dispatch_source_t v41;
  void *v42;
  NSObject *v43;
  CWFAutoJoinManager *v44;
  NSObject *v45;
  dispatch_time_t v46;
  NSMutableSet *v47;
  NSMutableSet *hiddenNetworkChannels;
  NSMutableDictionary *v49;
  NSMutableDictionary *cachedKnownNetworksContexts;
  NSMutableDictionary *v51;
  NSMutableDictionary *knownNetworkSSIDMap;
  NSMutableDictionary *v53;
  NSMutableDictionary *knownNetworkPasspointDomainMap;
  NSMutableOrderedSet *v55;
  NSMutableOrderedSet *deferredKnownNetworks;
  NSMutableDictionary *v57;
  NSMutableDictionary *knownNetworkAllowCache;
  NSMutableDictionary *v59;
  NSMutableDictionary *knownNetworkAllowErrorCache;
  NSMutableDictionary *v61;
  NSMutableDictionary *knownNetworkDeferCache;
  NSMutableSet *v63;
  NSMutableSet *updatedAllowCacheKnownNetworks;
  NSMutableSet *v65;
  NSMutableSet *disallowedKnownNetworks;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD handler[4];
  CWFAutoJoinManager *v77;
  objc_super v78;

  v78.receiver = self;
  v78.super_class = (Class)CWFAutoJoinManager;
  v2 = -[CWFAutoJoinManager init](&v78, sel_init);
  if (!v2)
    goto LABEL_29;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.corewifi.auto-join", v3);
  v5 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v4;

  if (!*((_QWORD *)v2 + 1))
    goto LABEL_29;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.corewifi.auto-join.target", v6);
  v8 = (void *)*((_QWORD *)v2 + 68);
  *((_QWORD *)v2 + 68) = v7;

  if (!*((_QWORD *)v2 + 68))
    goto LABEL_29;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (void *)*((_QWORD *)v2 + 12);
  *((_QWORD *)v2 + 12) = v9;

  if (!*((_QWORD *)v2 + 12))
    goto LABEL_29;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = (void *)*((_QWORD *)v2 + 20);
  *((_QWORD *)v2 + 20) = v11;

  if (!*((_QWORD *)v2 + 20))
    goto LABEL_29;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = (void *)*((_QWORD *)v2 + 27);
  *((_QWORD *)v2 + 27) = v13;

  if (!*((_QWORD *)v2 + 27))
    goto LABEL_29;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = (void *)*((_QWORD *)v2 + 28);
  *((_QWORD *)v2 + 28) = v15;

  if (!*((_QWORD *)v2 + 28))
    goto LABEL_29;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = (void *)*((_QWORD *)v2 + 29);
  *((_QWORD *)v2 + 29) = v17;

  if (!*((_QWORD *)v2 + 29))
    goto LABEL_29;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = v19;

  if (!*((_QWORD *)v2 + 11))
    goto LABEL_29;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = (void *)*((_QWORD *)v2 + 21);
  *((_QWORD *)v2 + 21) = v21;

  if (!*((_QWORD *)v2 + 21))
    goto LABEL_29;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = (void *)*((_QWORD *)v2 + 22);
  *((_QWORD *)v2 + 22) = v23;

  if (!*((_QWORD *)v2 + 22))
    goto LABEL_29;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = (void *)*((_QWORD *)v2 + 23);
  *((_QWORD *)v2 + 23) = v25;

  if (!*((_QWORD *)v2 + 23))
    goto LABEL_29;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = (void *)*((_QWORD *)v2 + 24);
  *((_QWORD *)v2 + 24) = v27;

  if (!*((_QWORD *)v2 + 24))
    goto LABEL_29;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = (void *)*((_QWORD *)v2 + 33);
  *((_QWORD *)v2 + 33) = v29;

  if (!*((_QWORD *)v2 + 33))
    goto LABEL_29;
  v31 = objc_alloc_init(CWFAutoJoinStatistics);
  v32 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v31;

  if (!*((_QWORD *)v2 + 15))
    goto LABEL_29;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(*((void **)v2 + 15), v38, (uint64_t)v37, v39, v40);

  v41 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 1));
  v42 = (void *)*((_QWORD *)v2 + 16);
  *((_QWORD *)v2 + 16) = v41;

  v43 = *((_QWORD *)v2 + 16);
  if (!v43)
    goto LABEL_29;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1B067EA34;
  handler[3] = &unk_1E6133138;
  v44 = (CWFAutoJoinManager *)v2;
  v77 = v44;
  dispatch_source_set_event_handler(v43, handler);

  v45 = *((_QWORD *)v2 + 16);
  v46 = dispatch_walltime(0, 86400000000000);
  dispatch_source_set_timer(v45, v46, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v2 + 16));
  v47 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  hiddenNetworkChannels = v44->_hiddenNetworkChannels;
  v44->_hiddenNetworkChannels = v47;

  if (!v44->_hiddenNetworkChannels)
    goto LABEL_29;
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  cachedKnownNetworksContexts = v44->_cachedKnownNetworksContexts;
  v44->_cachedKnownNetworksContexts = v49;

  if (!v44->_cachedKnownNetworksContexts)
    goto LABEL_29;
  v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownNetworkSSIDMap = v44->_knownNetworkSSIDMap;
  v44->_knownNetworkSSIDMap = v51;

  if (!v44->_knownNetworkSSIDMap)
    goto LABEL_29;
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownNetworkPasspointDomainMap = v44->_knownNetworkPasspointDomainMap;
  v44->_knownNetworkPasspointDomainMap = v53;

  if (!v44->_knownNetworkPasspointDomainMap)
    goto LABEL_29;
  v55 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  deferredKnownNetworks = v44->_deferredKnownNetworks;
  v44->_deferredKnownNetworks = v55;

  if (!v44->_deferredKnownNetworks)
    goto LABEL_29;
  v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownNetworkAllowCache = v44->_knownNetworkAllowCache;
  v44->_knownNetworkAllowCache = v57;

  if (!v44->_knownNetworkAllowCache)
    goto LABEL_29;
  v59 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownNetworkAllowErrorCache = v44->_knownNetworkAllowErrorCache;
  v44->_knownNetworkAllowErrorCache = v59;

  if (!v44->_knownNetworkAllowErrorCache)
    goto LABEL_29;
  v61 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownNetworkDeferCache = v44->_knownNetworkDeferCache;
  v44->_knownNetworkDeferCache = v61;

  if (!v44->_knownNetworkDeferCache)
    goto LABEL_29;
  v63 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  updatedAllowCacheKnownNetworks = v44->_updatedAllowCacheKnownNetworks;
  v44->_updatedAllowCacheKnownNetworks = v63;

  if (!v44->_updatedAllowCacheKnownNetworks)
    goto LABEL_29;
  v65 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  disallowedKnownNetworks = v44->_disallowedKnownNetworks;
  v44->_disallowedKnownNetworks = v65;

  if (v44->_disallowedKnownNetworks)
  {
    objc_msgSend___setupRetryIntervals(v44, v67, v68, v69, v70);
    objc_msgSend___setupThrottleIntervals(v44, v71, v72, v73, v74);
  }
  else
  {
LABEL_29:

    return 0;
  }
  return v44;
}

- (void)invalidate
{
  CWFAutoJoinManager *v2;
  NSError *underlyingCancelError;
  NSObject *internalQueue;
  qos_class_t v5;
  dispatch_block_t v6;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    *(_WORD *)&v2->_invalidated = 257;
    underlyingCancelError = v2->_underlyingCancelError;
    v2->_underlyingCancelError = 0;

    internalQueue = v2->_internalQueue;
    v5 = qos_class_self();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B067EDF0;
    block[3] = &unk_1E6133138;
    block[4] = v2;
    v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5, 0, block);
    dispatch_async(internalQueue, v6);

  }
  objc_sync_exit(v2);

}

- (NSSet)knownNetworks
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v7 = (void *)objc_msgSend_copy(v2->_knownNetworks, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (CWFScanResult)associatedNetwork
{
  CWFAutoJoinManager *v2;
  CWFScanResult *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_associatedNetwork;
  objc_sync_exit(v2);

  return v3;
}

- (void)__resetRetryIntervalIndex
{
  void *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_1B0642860(self->_retrySchedule, v6, v7, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  self->_retryScheduleIndex = 0;
  if (self->_isRetryScheduled)
    objc_msgSend___updateRetrySchedule(self, v10, v11, v12, v13);
}

- (void)setKnownNetworks:(id)a3
{
  id v4;
  CWFAutoJoinManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t knownNetworks;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  char v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *knownNetworkAllowCache;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSMutableDictionary *knownNetworkAllowErrorCache;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSMutableDictionary *knownNetworkDeferCache;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSMutableDictionary *knownNetworkSSIDMap;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSMutableDictionary *knownNetworkPasspointDomainMap;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSSet *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __int16 *v115;
  uint64_t v116;
  void *context;
  void *v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int16 v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1B5E0A33C]();
  v5 = self;
  objc_sync_enter(v5);
  knownNetworks = (uint64_t)v5->_knownNetworks;
  v118 = v4;
  if ((id)knownNetworks != v4
    && (!v4 || !knownNetworks || (objc_msgSend_isEqual_(v4, v6, knownNetworks, v7, v8) & 1) == 0))
  {
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v124 = 0;
      LODWORD(v116) = 2;
      v115 = &v124;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v18, v19, v20, v21);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v22 = v4;
    v24 = 0;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v120, (uint64_t)v125, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v121;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v121 != v29)
            objc_enumerationMutation(v22);
          v31 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v5->_knownNetworks, v25, (uint64_t)v31, v26, v27, v115, v116) & 1) == 0)
          {
            knownNetworkAllowCache = v5->_knownNetworkAllowCache;
            objc_msgSend_identifier(v31, v32, v33, v34, v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowCache, v38, 0, (uint64_t)v37, v39);

            knownNetworkAllowErrorCache = v5->_knownNetworkAllowErrorCache;
            objc_msgSend_identifier(v31, v41, v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v46, 0, (uint64_t)v45, v47);

            knownNetworkDeferCache = v5->_knownNetworkDeferCache;
            objc_msgSend_identifier(v31, v49, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v54, 0, (uint64_t)v53, v55);

          }
          if ((objc_msgSend_isAutoJoinDisabled(v31, v32, v33, v34, v35) & 1) == 0)
          {
            objc_msgSend_SSID(v31, v25, v56, v26, v27);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              knownNetworkSSIDMap = v5->_knownNetworkSSIDMap;
              objc_msgSend_SSID(v31, v58, v59, v60, v61);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v64, (uint64_t)v63, v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v67
                || (v72 = objc_msgSend_effectiveSupportedSecurityTypes(v67, v68, v69, v70, v71),
                    v72 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v73, v74, v75, v76)))
              {
                v24 = 1;
              }
              objc_msgSend_SSID(v31, v68, v69, v70, v71);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v17, v78, (uint64_t)v31, (uint64_t)v77, v79);

            }
            if (objc_msgSend_isPasspoint(v31, v58, v59, v60, v61))
            {
              knownNetworkPasspointDomainMap = v5->_knownNetworkPasspointDomainMap;
              objc_msgSend_domainName(v31, v25, v80, v26, v27);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkPasspointDomainMap, v83, (uint64_t)v82, v84, v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v86
                || (v91 = objc_msgSend_effectiveSupportedSecurityTypes(v86, v87, v88, v89, v90),
                    v91 != objc_msgSend_effectiveSupportedSecurityTypes(v31, v92, v93, v94, v95)))
              {
                v24 = 1;
              }
              objc_msgSend_domainName(v31, v87, v88, v89, v90);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v119, v97, (uint64_t)v31, (uint64_t)v96, v98);

            }
          }
        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v120, (uint64_t)v125, 16);
      }
      while (v28);
    }

    v103 = objc_msgSend_copy(v22, v99, v100, v101, v102);
    v104 = v5->_knownNetworks;
    v5->_knownNetworks = (NSSet *)v103;

    objc_msgSend_setDictionary_(v5->_knownNetworkSSIDMap, v105, (uint64_t)v17, v106, v107);
    objc_msgSend_setDictionary_(v5->_knownNetworkPasspointDomainMap, v108, (uint64_t)v119, v109, v110);
    if ((v24 & 1) != 0)
    {
      v5->_didConfigurationChangeSincePreviousAttempt = 1;
      v5->_resetCachedKnownNetworksContext = 1;
      objc_msgSend___resetRetryIntervalIndex(v5, v111, v112, v113, v114);
    }

  }
  objc_sync_exit(v5);

  objc_autoreleasePoolPop(context);
}

- (NSSet)supportedChannels
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v7 = (void *)objc_msgSend_copy(v2->_supportedChannels, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (NSSet *)v7;
}

- (CLLocation)location
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v7 = (void *)objc_msgSend_copy(v2->_location, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CLLocation *)v7;
}

- (int64_t)retrySchedule
{
  CWFAutoJoinManager *v2;
  int64_t retrySchedule;

  v2 = self;
  objc_sync_enter(v2);
  retrySchedule = v2->_retrySchedule;
  objc_sync_exit(v2);

  return retrySchedule;
}

- (BOOL)__shouldAlwaysUpdateRetrySchedule:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (BOOL)maxCompatibilityEnabled
{
  CWFAutoJoinManager *v2;
  BOOL maxCompatibilityEnabled;

  v2 = self;
  objc_sync_enter(v2);
  maxCompatibilityEnabled = v2->_maxCompatibilityEnabled;
  objc_sync_exit(v2);

  return maxCompatibilityEnabled;
}

- (void)cancelAutoJoinWithUUID:(id)a3 error:(id)a4 reply:(id)a5
{
  id v8;
  CWFAutoJoinManager *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqual;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  __uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  NSObject *targetQueue;
  qos_class_t v41;
  dispatch_block_t v42;
  void *v43;
  NSObject *v44;
  unint64_t i;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  void *v59;
  NSObject *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t j;
  unint64_t v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  __uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  qos_class_t v76;
  dispatch_block_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  id v85;
  CWFAutoJoinRequest *activeRequest;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSError *underlyingCancelError;
  NSObject *internalQueue;
  qos_class_t v94;
  dispatch_block_t v95;
  id v96;
  __uint64_t v97;
  void *v98;
  NSObject *v99;
  id v100;
  NSObject *v101;
  qos_class_t v102;
  id v103;
  dispatch_block_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  unint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSError *v115;
  NSObject *v116;
  qos_class_t v117;
  dispatch_block_t v118;
  void *v119;
  NSObject *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  __uint64_t v130;
  void *v131;
  NSObject *v132;
  id v133;
  NSObject *v134;
  qos_class_t v135;
  dispatch_block_t v136;
  id v137;
  NSMutableArray *v138;
  id v139;
  CWFAutoJoinManager *obj;
  _QWORD v141[5];
  id v142;
  _QWORD v143[5];
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[4];
  id v152;
  id v153;
  id v154;
  _QWORD v155[5];
  id v156;
  _QWORD block[4];
  id v158;
  _BYTE v159[128];
  int v160;
  unint64_t v161;
  __int16 v162;
  unint64_t v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  const char *v167;
  __int16 v168;
  int v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v139 = a4;
  v137 = a5;
  v9 = self;
  objc_sync_enter(v9);
  obj = v9;
  if (v9->_invalidated)
  {
    CWFGetOSLog();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_UUIDString(v8, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v32, v33, 5, v34, v35);
      v160 = 138543362;
      v161 = objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    v36 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      CWFGetOSLog();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = MEMORY[0x1E0C81028];
      v39 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v160 = 134219010;
      v161 = v36 / 0x3B9ACA00;
      v162 = 2048;
      v163 = v36 % 0x3B9ACA00 / 0x3E8;
      v164 = 2082;
      v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
      v166 = 2082;
      v167 = "CWFAutoJoinManager.m";
      v168 = 1024;
      v169 = 771;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v9->_targetQueue;
    v41 = qos_class_self();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0680B1C;
    block[3] = &unk_1E61336E8;
    v158 = v137;
    v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v41, 0, block);
    dispatch_async(targetQueue, v42);

  }
  else if (v8)
  {
    objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v8, v17, (uint64_t)v16, v18, v19);

    if ((isEqual & 1) != 0)
    {
      CWFGetOSLog();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        CWFGetOSLog();
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = MEMORY[0x1E0C81028];
        v85 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        activeRequest = v9->_activeRequest;
        v160 = 138543362;
        v161 = (unint64_t)activeRequest;
        _os_log_send_and_compose_impl();
      }

      v9->_cancelled = 1;
      v91 = objc_msgSend_copy(v139, v87, v88, v89, v90);
      underlyingCancelError = v9->_underlyingCancelError;
      v9->_underlyingCancelError = (NSError *)v91;

      internalQueue = v9->_internalQueue;
      v94 = qos_class_self();
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = sub_1B0680CE4;
      v155[3] = &unk_1E61338F0;
      v155[4] = v9;
      v156 = v137;
      v95 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v94, 0, v155);
      dispatch_async(internalQueue, v95);

    }
    else
    {
      for (i = 0; i < objc_msgSend_count(v9->_pendingRequests, v21, v22, v23, v24); ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v9->_pendingRequests, v46, i, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v49, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_isEqual_(v8, v55, (uint64_t)v54, v56, v57);

        if ((v58 & 1) != 0)
        {
          CWFGetOSLog();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            CWFGetOSLog();
            v60 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v60 = MEMORY[0x1E0C81028];
            v96 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v160 = 138543362;
            v161 = (unint64_t)v49;
            _os_log_send_and_compose_impl();
          }

          v97 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            CWFGetOSLog();
            v99 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v99 = MEMORY[0x1E0C81028];
            v100 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v160 = 134219010;
            v161 = v97 / 0x3B9ACA00;
            v162 = 2048;
            v163 = v97 % 0x3B9ACA00 / 0x3E8;
            v164 = 2082;
            v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            v166 = 2082;
            v167 = "CWFAutoJoinManager.m";
            v168 = 1024;
            v169 = 807;
            _os_log_send_and_compose_impl();
          }

          v101 = v9->_targetQueue;
          v102 = qos_class_self();
          v151[0] = MEMORY[0x1E0C809B0];
          v151[1] = 3221225472;
          v151[2] = sub_1B0681078;
          v151[3] = &unk_1E6133710;
          v103 = v49;
          v152 = v103;
          v153 = v139;
          v154 = v137;
          v104 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v102, 0, v151);
          dispatch_async(v101, v104);

          objc_msgSend_removeObjectAtIndex_(v9->_pendingRequests, v105, i, v106, v107);
          goto LABEL_17;
        }

      }
      CWFGetOSLog();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (v119)
      {
        CWFGetOSLog();
        v120 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v120 = MEMORY[0x1E0C81028];
        v121 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_UUIDString(v8, v122, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v126, v127, 5, v128, v129);
        v160 = 138543362;
        v161 = objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      v130 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v131)
      {
        CWFGetOSLog();
        v132 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v132 = MEMORY[0x1E0C81028];
        v133 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
      {
        v160 = 134219010;
        v161 = v130 / 0x3B9ACA00;
        v162 = 2048;
        v163 = v130 % 0x3B9ACA00 / 0x3E8;
        v164 = 2082;
        v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
        v166 = 2082;
        v167 = "CWFAutoJoinManager.m";
        v168 = 1024;
        v169 = 823;
        _os_log_send_and_compose_impl();
      }

      v134 = v9->_targetQueue;
      v135 = qos_class_self();
      v149[0] = MEMORY[0x1E0C809B0];
      v149[1] = 3221225472;
      v149[2] = sub_1B06812D0;
      v149[3] = &unk_1E61336E8;
      v150 = v137;
      v136 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v135, 0, v149);
      dispatch_async(v134, v136);

    }
  }
  else
  {
    CWFGetOSLog();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      CWFGetOSLog();
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = MEMORY[0x1E0C81028];
      v61 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v160) = 0;
      _os_log_send_and_compose_impl();
    }

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v138 = v9->_pendingRequests;
    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v62, (uint64_t)&v145, (uint64_t)v159, 16);
    if (v63)
    {
      v64 = MEMORY[0x1E0C81028];
      v65 = *(_QWORD *)v146;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v146 != v65)
            objc_enumerationMutation(v138);
          v67 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j);
          CWFGetOSLog();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            CWFGetOSLog();
            v69 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v70 = v64;
            v69 = v64;
          }

          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v160 = 138543362;
            v161 = v67;
            _os_log_send_and_compose_impl();
          }

          v71 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            CWFGetOSLog();
            v73 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v74 = v64;
            v73 = v64;
          }

          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            v160 = 134219010;
            v161 = v71 / 0x3B9ACA00;
            v162 = 2048;
            v163 = v71 % 0x3B9ACA00 / 0x3E8;
            v164 = 2082;
            v165 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]";
            v166 = 2082;
            v167 = "CWFAutoJoinManager.m";
            v168 = 1024;
            v169 = 838;
            _os_log_send_and_compose_impl();
          }

          v75 = obj->_targetQueue;
          v76 = qos_class_self();
          v143[0] = MEMORY[0x1E0C809B0];
          v143[1] = 3221225472;
          v143[2] = sub_1B0681498;
          v143[3] = &unk_1E61333E0;
          v143[4] = v67;
          v144 = v139;
          v77 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v76, 0, v143);
          dispatch_async(v75, v77);

        }
        v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v78, (uint64_t)&v145, (uint64_t)v159, 16);
      }
      while (v63);
    }

    objc_msgSend_removeAllObjects(obj->_pendingRequests, v79, v80, v81, v82);
    if (obj->_activeRequest)
    {
      CWFGetOSLog();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        CWFGetOSLog();
        v84 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v84 = MEMORY[0x1E0C81028];
        v108 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v109 = (unint64_t)obj->_activeRequest;
        v160 = 138543362;
        v161 = v109;
        _os_log_send_and_compose_impl();
      }

      obj->_cancelled = 1;
      v114 = objc_msgSend_copy(v139, v110, v111, v112, v113);
      v115 = obj->_underlyingCancelError;
      obj->_underlyingCancelError = (NSError *)v114;

    }
    v116 = obj->_internalQueue;
    v117 = qos_class_self();
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = sub_1B06816D4;
    v141[3] = &unk_1E61338F0;
    v141[4] = obj;
    v142 = v137;
    v118 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v117, 0, v141);
    dispatch_async(v116, v118);

  }
LABEL_17:
  objc_sync_exit(obj);

}

- (CWFAutoJoinMetric)metric
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v7 = (void *)objc_msgSend_copy(v2->_cachedMetric, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinMetric *)v7;
}

- (CWFAutoJoinStatistics)statistics
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v7 = (void *)objc_msgSend_copy(v2->_statistics, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return (CWFAutoJoinStatistics *)v7;
}

- (void)resetStatistics
{
  CWFAutoJoinManager *v2;
  void *v3;
  NSObject *v4;
  id v5;
  CWFAutoJoinStatistics *v6;
  CWFAutoJoinStatistics *statistics;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *statisticsSubmissionTimer;
  dispatch_time_t v17;

  v2 = self;
  objc_sync_enter(v2);
  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  v6 = objc_alloc_init(CWFAutoJoinStatistics);
  statistics = v2->_statistics;
  v2->_statistics = v6;

  objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v2->_statistics, v13, (uint64_t)v12, v14, v15);

  statisticsSubmissionTimer = v2->_statisticsSubmissionTimer;
  if (statisticsSubmissionTimer)
  {
    v17 = dispatch_walltime(0, 86400000000000);
    dispatch_source_set_timer(statisticsSubmissionTimer, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_sync_exit(v2);

}

- (void)__updateStatisticsWithScanChannels:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CWFAutoJoinStatistics *statistics;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CWFAutoJoinStatistics *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  CWFAutoJoinStatistics *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  CWFAutoJoinStatistics *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          v20 = objc_msgSend_scanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }
        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          v32 = self->_statistics;
          v33 = objc_msgSend_scanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }
        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          v37 = self->_statistics;
          v38 = objc_msgSend_scanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }
        v42 = self->_statistics;
        v43 = objc_msgSend_scanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v11);
  }

}

- (void)__updateStatisticsWithPreAssocScanChannels:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CWFAutoJoinStatistics *statistics;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CWFAutoJoinStatistics *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  CWFAutoJoinStatistics *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  CWFAutoJoinStatistics *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v6)
  {
    v11 = v6;
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v14, v7, v8, v9, v10))
        {
          statistics = self->_statistics;
          v20 = objc_msgSend_preAssocScanChannelCount2GHz(statistics, v15, v16, v17, v18);
          objc_msgSend_setPreAssocScanChannelCount2GHz_(statistics, v21, v20 + 1, v22, v23);
        }
        else if (objc_msgSend_is5GHz(v14, v15, v16, v17, v18))
        {
          v32 = self->_statistics;
          v33 = objc_msgSend_preAssocScanChannelCount5GHz(v32, v28, v29, v30, v31);
          objc_msgSend_setPreAssocScanChannelCount5GHz_(v32, v34, v33 + 1, v35, v36);
        }
        else if (objc_msgSend_is6GHz(v14, v28, v29, v30, v31))
        {
          v37 = self->_statistics;
          v38 = objc_msgSend_preAssocScanChannelCount6GHz(v37, v24, v25, v26, v27);
          objc_msgSend_setPreAssocScanChannelCount6GHz_(v37, v39, v38 + 1, v40, v41);
        }
        v42 = self->_statistics;
        v43 = objc_msgSend_preAssocScanChannelCount(v42, v24, v25, v26, v27);
        objc_msgSend_setPreAssocScanChannelCount_(v42, v44, v43 + 1, v45, v46);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v11);
  }

}

- (void)__updateCachedMetricAndStatistics:(id)a3
{
  CWFAutoJoinManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CWFAutoJoinMetric *cachedMetric;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CWFAutoJoinStatistics *statistics;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CWFAutoJoinStatistics *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  CWFAutoJoinStatistics *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  CWFAutoJoinStatistics *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  CWFAutoJoinStatistics *v148;
  uint64_t CandidateCount;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  CWFAutoJoinStatistics *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  CWFAutoJoinStatistics *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  CWFAutoJoinStatistics *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  CWFAutoJoinStatistics *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  CWFAutoJoinStatistics *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  id v204;

  v204 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v9 = objc_msgSend_copy(v204, v5, v6, v7, v8);
  cachedMetric = v4->_cachedMetric;
  v4->_cachedMetric = (CWFAutoJoinMetric *)v9;

  if (objc_msgSend_wasAlreadyAssociated(v204, v11, v12, v13, v14))
  {
    statistics = v4->_statistics;
    v20 = objc_msgSend_autoJoinAlreadyAssociatedCount(statistics, v15, v16, v17, v18);
    objc_msgSend_setAutoJoinAlreadyAssociatedCount_(statistics, v21, v20 + 1, v22, v23);
  }
  objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v15, v16, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_autoJoinParameters(v204, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  objc_msgSend_numberWithInteger_(v25, v36, v35, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v40, (uint64_t)v39, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_unsignedIntegerValue(v43, v44, v45, v46, v47);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v49, v48 + 1, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(v4->_statistics, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_autoJoinParameters(v204, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_trigger(v63, v64, v65, v66, v67);
  objc_msgSend_numberWithInteger_(v58, v69, v68, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v57, v73, (uint64_t)v52, (uint64_t)v72, v74);

  objc_msgSend_error(v204, v75, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v84 = v4->_statistics;
    v85 = objc_msgSend_autoJoinAbortedCount(v84, v80, v81, v82, v83);
    objc_msgSend_setAutoJoinAbortedCount_(v84, v86, v85 + 1, v87, v88);
  }
  objc_msgSend_scanChannels(v204, v80, v81, v82, v83);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___updateStatisticsWithScanChannels_(v4, v90, (uint64_t)v89, v91, v92);

  objc_msgSend_preAssociationScanChannels(v204, v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___updateStatisticsWithPreAssocScanChannels_(v4, v98, (uint64_t)v97, v99, v100);

  v101 = v4->_statistics;
  objc_msgSend_followup6GHzScanChannels(v204, v102, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend_count(v106, v107, v108, v109, v110);
  v116 = objc_msgSend_followup6GHzScanChannelCount(v101, v112, v113, v114, v115);
  objc_msgSend_setFollowup6GHzScanChannelCount_(v101, v117, v116 + v111, v118, v119);

  v120 = v4->_statistics;
  objc_msgSend_GASQueryNetworks(v204, v121, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend_count(v125, v126, v127, v128, v129);
  v135 = objc_msgSend_GASQueryCount(v120, v131, v132, v133, v134);
  objc_msgSend_setGASQueryCount_(v120, v136, v135 + v130, v137, v138);

  objc_msgSend_network(v204, v139, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  if (v143)
  {
    v148 = v4->_statistics;
    CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(v148, v144, v145, v146, v147);
    objc_msgSend_setAutoJoinDidFindCandidateCount_(v148, v150, CandidateCount + 1, v151, v152);
    if (objc_msgSend_result(v204, v153, v154, v155, v156))
    {
      v157 = v4->_statistics;
      v158 = objc_msgSend_autoJoinDidJoinCount(v157, v144, v145, v146, v147);
      objc_msgSend_setAutoJoinDidJoinCount_(v157, v159, v158 + 1, v160, v161);
    }
  }
  if (objc_msgSend_autoHotspotWasAttempted(v204, v144, v145, v146, v147))
  {
    v166 = v4->_statistics;
    v167 = objc_msgSend_autoHotspotCount(v166, v162, v163, v164, v165);
    objc_msgSend_setAutoHotspotCount_(v166, v168, v167 + 1, v169, v170);
    objc_msgSend_hotspot(v204, v171, v172, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    if (v175)
    {
      v180 = v4->_statistics;
      v181 = objc_msgSend_autoHotspotDidFindCandidateCount(v180, v176, v177, v178, v179);
      objc_msgSend_setAutoHotspotDidFindCandidateCount_(v180, v182, v181 + 1, v183, v184);
      if (objc_msgSend_autoHotspotResult(v204, v185, v186, v187, v188))
      {
        v189 = v4->_statistics;
        v190 = objc_msgSend_autoHotspotDidJoinCount(v189, v176, v177, v178, v179);
        objc_msgSend_setAutoHotspotDidJoinCount_(v189, v191, v190 + 1, v192, v193);
      }
    }
    objc_msgSend_autoHotspotError(v204, v176, v177, v178, v179);
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v194)
    {
      v199 = v4->_statistics;
      v200 = objc_msgSend_autoHotspotAbortedCount(v199, v195, v196, v197, v198);
      objc_msgSend_setAutoHotspotAbortedCount_(v199, v201, v200 + 1, v202, v203);
    }
  }
  objc_sync_exit(v4);

}

- (BOOL)__shouldInvokeImmediatelyForTrigger:(int64_t)a3
{
  BOOL result;
  CWFAutoJoinManager *v5;
  unint64_t retryScheduleIndex;

  result = 0;
  if ((unint64_t)a3 <= 0x3D)
  {
    if (((1 << a3) & 0x1000800300100000) != 0)
    {
      return 1;
    }
    else if (a3 == 61)
    {
      v5 = self;
      objc_sync_enter(v5);
      retryScheduleIndex = v5->_retryScheduleIndex;
      objc_sync_exit(v5);

      return retryScheduleIndex != 0;
    }
  }
  return result;
}

- (BOOL)__shouldPrioritizeRetryOverNewRequest:(int64_t)a3
{
  return a3 == 32 || a3 == 47;
}

- (void)__removeRedundantRequests:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t i;
  uint64_t v141;
  void *v142;
  NSObject *v143;
  NSObject *v144;
  __uint64_t v145;
  void *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *targetQueue;
  qos_class_t v150;
  dispatch_block_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id obj;
  id obja;
  _QWORD block[5];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  int v183;
  unint64_t v184;
  __int16 v185;
  unint64_t v186;
  __int16 v187;
  const char *v188;
  __int16 v189;
  const char *v190;
  __int16 v191;
  int v192;
  _BYTE v193[128];
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v4;
  if (objc_msgSend_count(self->_pendingRequests, v9, v10, v11, v12))
  {
    v16 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_pendingRequests, v13, v16, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_mode(v22, v23, v24, v25, v26);
      objc_msgSend_parameters(v4, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 == objc_msgSend_mode(v32, v33, v34, v35, v36))
        break;

LABEL_24:
      if (++v16 >= (unint64_t)objc_msgSend_count(self->_pendingRequests, v131, v132, v133, v134))
        goto LABEL_27;
    }
    objc_msgSend_parameters(v17, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v41, v42, v43, v44, v45);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(obj, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v4, v51, v52, v53, v54);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetNetworkProfile(v175, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v59, v60, v61, v62, v63);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v68)
    {
      v174 = v41;
    }
    else
    {
      objc_msgSend_parameters(v17, v64, v65, v66, v67);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v172, v69, v70, v71, v72);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v171, v73, v74, v75, v76);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v170)
      {
        v170 = 0;
        v117 = 0;
LABEL_20:

LABEL_21:
        if (v117)
          objc_msgSend_addObject_(v166, v128, (uint64_t)v17, v129, v130);
        v4 = v173;
        goto LABEL_24;
      }
      v174 = v41;
      objc_msgSend_parameters(v173, v77, v78, v79, v80);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v169, v81, v82, v83, v84);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v168, v85, v86, v87, v88);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v167)
      {
        v167 = 0;
        v117 = 0;
        goto LABEL_19;
      }
      objc_msgSend_parameters(v17, v89, v90, v91, v92);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v165, v93, v94, v95, v96);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v164, v97, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v173, v102, v103, v104, v105);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v162, v106, v107, v108, v109);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v161, v110, v111, v112, v113);
      v163 = v101;
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v101, v114, (uint64_t)v160, v115, v116))
      {
        v117 = 0;
LABEL_16:

LABEL_19:
        goto LABEL_20;
      }
    }
    objc_msgSend_parameters(v17, v64, v65, v66, v67);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_trigger(v118, v119, v120, v121, v122);
    if (v123 - 44 < 8 || v123 <= 0x3F && ((1 << v123) & 0xC000000000000010) != 0)
    {

      v117 = 0;
    }
    else
    {
      v117 = objc_msgSend_allowAutoHotspotFallback(v17, v124, v125, v126, v127) ^ 1;

    }
    v41 = v174;
    if (v50 == v68)
      goto LABEL_21;
    goto LABEL_16;
  }
LABEL_27:
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  obja = v166;
  v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v135, (uint64_t)&v179, (uint64_t)v193, 16);
  if (v136)
  {
    v137 = v136;
    v138 = MEMORY[0x1E0C81028];
    v139 = *(_QWORD *)v180;
    do
    {
      for (i = 0; i != v137; ++i)
      {
        if (*(_QWORD *)v180 != v139)
          objc_enumerationMutation(obja);
        v141 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * i);
        CWFGetOSLog();
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        if (v142)
        {
          CWFGetOSLog();
          v143 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v144 = v138;
          v143 = v138;
        }

        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          v183 = 138543362;
          v184 = v141;
          _os_log_send_and_compose_impl();
        }

        v145 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (v146)
        {
          CWFGetOSLog();
          v147 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v148 = v138;
          v147 = v138;
        }

        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
        {
          v183 = 134219010;
          v184 = v145 / 0x3B9ACA00;
          v185 = 2048;
          v186 = v145 % 0x3B9ACA00 / 0x3E8;
          v187 = 2082;
          v188 = "-[CWFAutoJoinManager __removeRedundantRequests:]";
          v189 = 2082;
          v190 = "CWFAutoJoinManager.m";
          v191 = 1024;
          v192 = 1187;
          _os_log_send_and_compose_impl();
        }

        targetQueue = self->_targetQueue;
        v150 = qos_class_self();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1B068298C;
        block[3] = &unk_1E6133138;
        block[4] = v141;
        v151 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v150, 0, block);
        dispatch_async(targetQueue, v151);

        objc_msgSend_removeObject_(self->_pendingRequests, v152, v141, v153, v154);
      }
      v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v155, (uint64_t)&v179, (uint64_t)v193, 16);
    }
    while (v137);
  }

  objc_msgSend_removeAllObjects(obja, v156, v157, v158, v159);
}

- (void)__invalidateAllowedKnownNetworksCacheForTrigger:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSMutableDictionary *knownNetworkAllowCache;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableDictionary *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSMutableDictionary *knownNetworkAllowErrorCache;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  NSMutableDictionary *knownNetworkDeferCache;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 <= 0x28 && ((1 << a3) & 0x101A03A0100) != 0)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend_allObjects(self->_knownNetworks, a2, a3, v3, v4);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v56 != v53)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend_identifier(v15, v10, v11, v12, v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14
              && objc_msgSend_isEAP(v15, v10, v11, v12, v13)
              && (objc_msgSend_isSystemMode(v15, v10, v11, v12, v13) & 1) == 0)
            {
              goto LABEL_19;
            }
            v17 = 0;
            if (((1 << a3) & 0x101A00A0100) != 0)
            {
              knownNetworkAllowCache = self->_knownNetworkAllowCache;
              objc_msgSend_identifier(v15, v10, v11, v12, v13);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v19, (uint64_t)v5, v20, v21);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              if (v6)
              {
                v22 = self->_knownNetworkAllowCache;
                objc_msgSend_identifier(v15, v10, v11, v12, v13);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)v23, v25, v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31) ^ 1;

              }
              else
              {
                v17 = 0;
              }
            }
            if (((1 << a3) & 0x101A00A0100) != 0)
            {

            }
            if (v17)
            {
LABEL_19:
              v32 = self->_knownNetworkAllowCache;
              objc_msgSend_identifier(v15, v10, v11, v12, v13);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v32, v34, 0, (uint64_t)v33, v35);

              knownNetworkAllowErrorCache = self->_knownNetworkAllowErrorCache;
              objc_msgSend_identifier(v15, v37, v38, v39, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v42, 0, (uint64_t)v41, v43);

              knownNetworkDeferCache = self->_knownNetworkDeferCache;
              objc_msgSend_identifier(v15, v45, v46, v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v50, 0, (uint64_t)v49, v51);

            }
          }
        }
        v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
      }
      while (v54);
    }

  }
}

- (unsigned)__qosForAutoJoinTrigger:(int64_t)a3
{
  if ((unint64_t)a3 > 0x3F)
    return 25;
  if (((1 << a3) & 0xC00FF00000000010) != 0)
    return 21;
  if (((1 << a3) & 0xC0010020010104) != 0)
    return 33;
  else
    return 25;
}

- (void)__updateAutoJoinState:(int64_t)a3
{
  CWFAutoJoinManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *targetQueue;
  qos_class_t v20;
  id v21;
  id v22;
  dispatch_block_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  int64_t v27;
  int v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    v4 = self;
    objc_sync_enter(v4);
    objc_msgSend_UUID(v4->_activeRequest, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v4->_activeRequest, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v28 = 134219010;
      v29 = v15 / 0x3B9ACA00;
      v30 = 2048;
      v31 = v15 % 0x3B9ACA00 / 0x3E8;
      v32 = 2082;
      v33 = "-[CWFAutoJoinManager __updateAutoJoinState:]";
      v34 = 2082;
      v35 = "CWFAutoJoinManager.m";
      v36 = 1024;
      v37 = 1485;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v4->_targetQueue;
    v20 = qos_class_self();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0683578;
    block[3] = &unk_1E6133D40;
    block[4] = v4;
    v25 = v9;
    v26 = v14;
    v27 = a3;
    v21 = v9;
    v22 = v14;
    v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
    dispatch_async(targetQueue, v23);

  }
}

- (BOOL)__isAnyKnownNetworkNearby
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = self->_cumulativeScanResults;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v26, (uint64_t)v30, 16);
  v10 = v5 != 0;
  if (!v5)
  {
LABEL_15:

    return v10;
  }
  v11 = v5;
  v12 = 0;
  v13 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v3);
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend_knownNetworks(self, v6, v7, v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v16, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B06420C0(v15, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 |= v22 != 0;

    }
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v26, (uint64_t)v30, 16);
  }
  while (v11);

  if ((v12 & 1) != 0)
  {
    CWFGetOSLog();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      CWFGetOSLog();
      v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = (NSMutableArray *)MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();
    goto LABEL_15;
  }
  return 0;
}

- (id)__descriptionForError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v3 = a3;
  objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x1E0CB2D50], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v3, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, *MEMORY[0x1E0CB3388], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, v9, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v22;
  v37 = v31;
  if (v22 || (v36 = v3, v37 = v13, v3))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = objc_msgSend_code(v36, v32, v33, v34, v35);
    objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)CFSTR("%ld '%@'"), v41, v42, v39, v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void)__performAutoJoin
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t beginTimestamp;
  CWFAutoJoinManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t retrySchedule;
  unint64_t retryScheduleIndex;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *triggerTimestampMap;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableDictionary *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 didConfigurationChangeSincePreviousAttempt;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  char v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CWFAutoJoinMetric *v88;
  CWFAutoJoinMetric *metric;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  NSObject *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  NSObject *v130;
  id v131;
  unint64_t activeRequest;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  _BOOL8 v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  BOOL v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  BOOL v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _BOOL8 v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  _BOOL4 v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  NSArray *cachedCarPlayPreferredChannels;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  NSObject *v413;
  id v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  int v419;
  const char *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  void *v429;
  NSObject *v430;
  void *v431;
  NSObject *v432;
  id v433;
  OS_dispatch_queue *v434;
  const char *v435;
  int v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  id v460;
  const char *v461;
  uint64_t v462;
  id v463;
  void *v464;
  NSObject *v465;
  id v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  id v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  NSObject *v476;
  uint64_t i;
  unint64_t v478;
  void *v479;
  NSObject *v480;
  NSObject *v481;
  const char *v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  void *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  __uint64_t v494;
  void *v495;
  NSObject *v496;
  id v497;
  NSObject *targetQueue;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  int isCarPlay;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  void *v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  int v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  const char *v556;
  uint64_t v557;
  const char *v558;
  void *v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  void *v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  void *v572;
  NSObject *v573;
  const char *v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  void *v582;
  const char *v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  void *v587;
  const char *v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  void *v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  int v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  void *v606;
  const char *v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  void *v611;
  const char *v612;
  uint64_t v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  const char *v617;
  uint64_t v618;
  const char *v619;
  void *v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  void *v629;
  const char *v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  void *v634;
  const char *v635;
  void *v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  void *v641;
  const char *v642;
  uint64_t v643;
  uint64_t v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  const char *v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  void *v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  char v657;
  uint64_t v658;
  void *v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  const char *v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  void *v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  void *v682;
  const char *v683;
  void *v684;
  const char *v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t v688;
  _BOOL4 v689;
  void *v690;
  const char *v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  void *v695;
  const char *v696;
  void *v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  _BOOL4 v702;
  const char *v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  void *v711;
  const char *v712;
  void *v713;
  const char *v714;
  uint64_t v715;
  uint64_t v716;
  uint64_t v717;
  void *v718;
  const char *v719;
  uint64_t v720;
  uint64_t v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  void *v726;
  const char *v727;
  uint64_t v728;
  uint64_t v729;
  NSMutableOrderedSet *deferredKnownNetworks;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  void *v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  const char *v739;
  uint64_t v740;
  uint64_t v741;
  uint64_t v742;
  void *v743;
  const char *v744;
  uint64_t v745;
  uint64_t v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  void *v751;
  NSObject *v752;
  const char *v753;
  uint64_t v754;
  uint64_t v755;
  void *v756;
  NSObject *v757;
  id v758;
  const char *v759;
  uint64_t v760;
  uint64_t v761;
  const char *v762;
  uint64_t v763;
  int v764;
  id v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  const char *v771;
  uint64_t v772;
  int v773;
  id v774;
  const char *v775;
  uint64_t v776;
  uint64_t v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  void *v782;
  NSObject *v783;
  id v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  const char *v797;
  uint64_t v798;
  uint64_t v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  id v804;
  const char *v805;
  uint64_t v806;
  uint64_t v807;
  const char *v808;
  uint64_t v809;
  uint64_t v810;
  const char *v811;
  uint64_t v812;
  char v813;
  id v814;
  uint64_t v815;
  const char *v816;
  uint64_t v817;
  int v818;
  void *v819;
  NSObject *v820;
  id v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  uint64_t v826;
  const char *v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  const char *v831;
  uint64_t v832;
  uint64_t v833;
  const char *v834;
  uint64_t v835;
  uint64_t v836;
  const char *v837;
  uint64_t v838;
  uint64_t v839;
  const char *v840;
  uint64_t v841;
  uint64_t v842;
  const char *v843;
  uint64_t v844;
  uint64_t v845;
  uint64_t v846;
  id v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  const char *v851;
  uint64_t v852;
  uint64_t v853;
  const char *v854;
  uint64_t v855;
  char v856;
  uint64_t v857;
  const char *v858;
  uint64_t v859;
  int v860;
  void *v861;
  NSObject *v862;
  id v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  const char *v869;
  uint64_t v870;
  uint64_t v871;
  uint64_t v872;
  const char *v873;
  uint64_t v874;
  uint64_t v875;
  const char *v876;
  uint64_t v877;
  uint64_t v878;
  const char *v879;
  uint64_t v880;
  uint64_t v881;
  const char *v882;
  uint64_t v883;
  uint64_t v884;
  const char *v885;
  uint64_t v886;
  uint64_t v887;
  const char *v888;
  uint64_t v889;
  uint64_t v890;
  void *v891;
  const char *v892;
  uint64_t v893;
  uint64_t v894;
  uint64_t v895;
  id v896;
  const char *v897;
  uint64_t v898;
  uint64_t v899;
  uint64_t v900;
  uint64_t v901;
  const char *v902;
  uint64_t v903;
  uint64_t v904;
  const char *v905;
  uint64_t v906;
  const char *v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  void *v911;
  const char *v912;
  uint64_t v913;
  uint64_t v914;
  uint64_t v915;
  void *v916;
  const char *v917;
  uint64_t v918;
  uint64_t v919;
  void *v920;
  const char *v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  void *v925;
  const char *v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  const char *v930;
  uint64_t v931;
  uint64_t v932;
  uint64_t v933;
  void *v934;
  const char *v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  uint64_t v939;
  const char *v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t j;
  NSMutableSet *hiddenNetworkChannels;
  void *v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  void *v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  id v954;
  const char *v955;
  const char *v956;
  uint64_t v957;
  uint64_t v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t k;
  uint64_t v962;
  const char *v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  void *v967;
  const char *v968;
  uint64_t v969;
  uint64_t v970;
  const char *v971;
  uint64_t v972;
  uint64_t v973;
  void *v974;
  NSObject *v975;
  id v976;
  const char *v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  uint64_t v981;
  const char *v982;
  uint64_t v983;
  uint64_t v984;
  id v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  const char *v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  char v994;
  uint64_t v995;
  const char *v996;
  uint64_t v997;
  char v998;
  CWFAutoJoinManager *v999;
  void *v1000;
  NSObject *v1001;
  id v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  uint64_t v1006;
  const char *v1007;
  uint64_t v1008;
  uint64_t v1009;
  const char *v1010;
  uint64_t v1011;
  uint64_t v1012;
  const char *v1013;
  uint64_t v1014;
  uint64_t v1015;
  const char *v1016;
  uint64_t v1017;
  uint64_t v1018;
  const char *v1019;
  uint64_t v1020;
  uint64_t v1021;
  const char *v1022;
  uint64_t v1023;
  uint64_t v1024;
  uint64_t v1025;
  id v1026;
  const char *v1027;
  uint64_t v1028;
  uint64_t v1029;
  const char *v1030;
  uint64_t v1031;
  uint64_t v1032;
  const char *v1033;
  uint64_t v1034;
  char v1035;
  void *v1036;
  NSObject *v1037;
  id v1038;
  const char *v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  const char *v1043;
  uint64_t v1044;
  uint64_t v1045;
  const char *v1046;
  uint64_t v1047;
  uint64_t v1048;
  const char *v1049;
  uint64_t v1050;
  uint64_t v1051;
  const char *v1052;
  uint64_t v1053;
  uint64_t v1054;
  const char *v1055;
  uint64_t v1056;
  uint64_t v1057;
  const char *v1058;
  uint64_t v1059;
  uint64_t v1060;
  const char *v1061;
  uint64_t v1062;
  uint64_t v1063;
  uint64_t v1064;
  id v1065;
  const char *v1066;
  uint64_t v1067;
  uint64_t v1068;
  const char *v1069;
  uint64_t v1070;
  uint64_t v1071;
  const char *v1072;
  uint64_t v1073;
  char v1074;
  _BOOL8 v1075;
  const char *v1076;
  const char *v1077;
  uint64_t v1078;
  uint64_t v1079;
  uint64_t v1080;
  _BOOL4 v1081;
  void **v1082;
  int v1083;
  const char *v1084;
  uint64_t v1085;
  uint64_t v1086;
  uint64_t v1087;
  void *v1088;
  const char *v1089;
  uint64_t v1090;
  uint64_t v1091;
  uint64_t v1092;
  const char *v1093;
  uint64_t v1094;
  uint64_t v1095;
  CWFAutoJoinRequest *v1096;
  void *v1097;
  const char *v1098;
  uint64_t v1099;
  uint64_t v1100;
  uint64_t v1101;
  unint64_t v1102;
  const char *v1103;
  uint64_t v1104;
  uint64_t v1105;
  uint64_t v1106;
  CWFAutoJoinManager *v1107;
  CWFAutoJoinRequest *v1108;
  void *v1109;
  void *v1110;
  const char *v1111;
  uint64_t v1112;
  uint64_t v1113;
  uint64_t v1114;
  unint64_t v1115;
  const char *v1116;
  uint64_t v1117;
  uint64_t v1118;
  void *v1119;
  const char *v1120;
  uint64_t v1121;
  uint64_t v1122;
  uint64_t v1123;
  unint64_t v1124;
  const char *v1125;
  uint64_t v1126;
  uint64_t v1127;
  void *v1128;
  const char *v1129;
  uint64_t v1130;
  uint64_t v1131;
  uint64_t v1132;
  unint64_t v1133;
  const char *v1134;
  uint64_t v1135;
  uint64_t v1136;
  uint64_t v1137;
  uint64_t v1138;
  uint64_t v1139;
  void *v1140;
  void *v1141;
  void *v1142;
  const char *v1143;
  uint64_t v1144;
  uint64_t v1145;
  uint64_t v1146;
  uint64_t v1147;
  const char *v1148;
  uint64_t v1149;
  uint64_t v1150;
  void *v1151;
  const char *v1152;
  uint64_t v1153;
  const char *v1154;
  uint64_t v1155;
  uint64_t v1156;
  void *v1157;
  const char *v1158;
  uint64_t v1159;
  __uint64_t v1160;
  __uint64_t v1161;
  unint64_t v1162;
  const char *v1163;
  uint64_t v1164;
  uint64_t v1165;
  uint64_t v1166;
  uint64_t v1167;
  const char *v1168;
  uint64_t v1169;
  uint64_t v1170;
  const char *v1171;
  uint64_t v1172;
  uint64_t v1173;
  const char *v1174;
  uint64_t v1175;
  uint64_t v1176;
  const char *v1177;
  uint64_t v1178;
  uint64_t v1179;
  const char *v1180;
  uint64_t v1181;
  uint64_t v1182;
  void *v1183;
  NSObject *v1184;
  uint64_t v1185;
  const char *v1186;
  uint64_t v1187;
  uint64_t v1188;
  uint64_t v1189;
  unint64_t v1190;
  id v1191;
  const char *v1192;
  uint64_t v1193;
  uint64_t v1194;
  uint64_t v1195;
  void *v1196;
  const char *v1197;
  uint64_t v1198;
  uint64_t v1199;
  const char *v1200;
  uint64_t v1201;
  uint64_t v1202;
  uint64_t v1203;
  const char *v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  const char *v1208;
  uint64_t v1209;
  uint64_t v1210;
  uint64_t v1211;
  void *v1212;
  const char *v1213;
  uint64_t v1214;
  uint64_t v1215;
  const char *v1216;
  uint64_t v1217;
  uint64_t v1218;
  uint64_t v1219;
  void *v1220;
  const char *v1221;
  uint64_t v1222;
  uint64_t v1223;
  uint64_t v1224;
  uint64_t v1225;
  const char *v1226;
  uint64_t v1227;
  uint64_t v1228;
  uint64_t v1229;
  uint64_t v1230;
  const char *v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  int v1235;
  const char *v1236;
  uint64_t v1237;
  uint64_t v1238;
  uint64_t v1239;
  void *v1240;
  const char *v1241;
  uint64_t v1242;
  uint64_t v1243;
  id v1244;
  void *v1245;
  NSObject *v1246;
  id v1247;
  unint64_t v1248;
  const char *v1249;
  uint64_t v1250;
  uint64_t v1251;
  uint64_t v1252;
  const char *v1253;
  uint64_t v1254;
  uint64_t v1255;
  uint64_t v1256;
  void *v1257;
  const char *v1258;
  uint64_t v1259;
  uint64_t v1260;
  uint64_t v1261;
  void *v1262;
  void *v1263;
  NSObject *v1264;
  id v1265;
  char v1266;
  const char *v1267;
  uint64_t v1268;
  uint64_t v1269;
  uint64_t v1270;
  void *v1271;
  void *v1272;
  const char *v1273;
  __uint64_t v1274;
  void *v1275;
  NSObject *v1276;
  id v1277;
  const char *v1278;
  uint64_t v1279;
  uint64_t v1280;
  uint64_t v1281;
  NSObject *v1282;
  const char *v1283;
  uint64_t v1284;
  uint64_t v1285;
  const char *v1286;
  uint64_t v1287;
  uint64_t v1288;
  uint64_t v1289;
  unint64_t v1290;
  unsigned int v1291;
  BOOL v1292;
  const char *v1293;
  uint64_t v1294;
  uint64_t v1295;
  uint64_t v1296;
  void *v1297;
  const char *v1298;
  uint64_t v1299;
  uint64_t v1300;
  uint64_t v1301;
  int v1302;
  uint64_t v1303;
  const char *v1304;
  uint64_t v1305;
  uint64_t v1306;
  void *v1307;
  void *v1308;
  const char *v1309;
  void *v1310;
  NSObject *v1311;
  void *v1312;
  void *v1313;
  id v1314;
  void *v1315;
  id v1316;
  id v1317;
  id v1318;
  void *v1319;
  const char *v1320;
  id v1321;
  id v1322;
  id v1323;
  void *v1324;
  id v1325;
  int *v1326;
  int *v1327;
  int *v1328;
  uint64_t v1329;
  uint64_t v1330;
  uint64_t v1331;
  uint64_t previousNonRetryTrigger;
  int v1333;
  __uint64_t v1334;
  void *v1335;
  void *v1336;
  unint64_t v1337;
  int v1338;
  unint64_t v1339;
  uint64_t v1340;
  id v1341;
  void *v1342;
  uint64_t v1343;
  int v1344;
  void *v1345;
  void *v1346;
  unint64_t linkChangeTimestamp;
  id v1348;
  id v1349;
  id v1350;
  void *v1351;
  id v1353;
  void *v1354;
  void *v1355;
  void *v1356;
  CWFAutoJoinContext *v1357;
  void *v1358;
  int v1359;
  void *v1360;
  void *v1361;
  void *v1362;
  void *v1363;
  id v1364;
  void *v1365;
  id v1366;
  CWFAutoJoinManager *v1367;
  unsigned int v1368;
  void *v1369;
  CWFAutoJoinContext *v1370;
  int v1371;
  CWFAutoJoinManager *obj;
  void *v1373;
  _QWORD v1374[4];
  id v1375;
  id v1376;
  uint64_t v1377;
  uint64_t v1378;
  id (*v1379)(uint64_t);
  void *v1380;
  id v1381;
  id v1382;
  id v1383;
  id v1384;
  id v1385;
  id v1386;
  __int128 v1387;
  __int128 v1388;
  __int128 v1389;
  __int128 v1390;
  id v1391;
  id v1392;
  id v1393;
  id v1394;
  _QWORD block[4];
  id v1396;
  CWFAutoJoinManager *v1397;
  CWFAutoJoinContext *v1398;
  id v1399;
  id v1400;
  id v1401;
  uint64_t *v1402;
  __int128 v1403;
  __int128 v1404;
  __int128 v1405;
  __int128 v1406;
  id v1407;
  id v1408;
  id v1409;
  id v1410;
  uint64_t v1411;
  uint64_t *v1412;
  uint64_t v1413;
  char v1414;
  uint64_t v1415;
  const __CFString *v1416;
  int v1417;
  unint64_t v1418;
  __int16 v1419;
  unint64_t v1420;
  __int16 v1421;
  _BYTE v1422[20];
  _BYTE v1423[6];
  __int16 v1424;
  uint64_t v1425;
  __int16 v1426;
  uint64_t v1427;
  __int16 v1428;
  int v1429;
  __int16 v1430;
  id v1431;
  _BYTE v1432[128];
  uint64_t v1433;
  const __CFString *v1434;
  void *v1435;
  void *v1436;
  _BYTE v1437[128];
  uint64_t v1438;
  _QWORD v1439[4];

  v1439[1] = *MEMORY[0x1E0C80C00];
  v1411 = 0;
  v1412 = &v1411;
  v1413 = 0x2020000000;
  v1414 = 1;
  beginTimestamp = self->_beginTimestamp;
  self->_beginTimestamp = 0;
  objc_msgSend_associatedNetwork(self, a2, v2, v3, v4);
  v1365 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  obj = v6;
  objc_msgSend_parameters(v6->_activeRequest, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v1369 = (void *)objc_msgSend_copy(v11, v12, v13, v14, v15);

  objc_msgSend_UUID(obj->_activeRequest, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v1336 = (void *)objc_msgSend_copy(v20, v21, v22, v23, v24);

  retrySchedule = obj->_retrySchedule;
  retryScheduleIndex = obj->_retryScheduleIndex;
  v1333 = objc_msgSend_allowAutoHotspotFallback(obj->_activeRequest, v27, v28, v29, v30);
  objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v31, (uint64_t)&unk_1E615E850, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v1339 = objc_msgSend_unsignedLongValue(v34, v35, v36, v37, v38);

  triggerTimestampMap = obj->_triggerTimestampMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v40, obj->_previousNonRetryTrigger, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(triggerTimestampMap, v44, (uint64_t)v43, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v1337 = objc_msgSend_unsignedLongValue(v47, v48, v49, v50, v51);

  previousNonRetryTrigger = obj->_previousNonRetryTrigger;
  v52 = obj->_triggerTimestampMap;
  v53 = (void *)MEMORY[0x1E0CB37E8];
  v58 = objc_msgSend_trigger(v1369, v54, v55, v56, v57);
  objc_msgSend_numberWithInteger_(v53, v59, v58, v60, v61);
  v62 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v52, v63, v62, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v1343 = objc_msgSend_unsignedLongValue(v66, v67, v68, v69, v70);

  linkChangeTimestamp = obj->_linkChangeTimestamp;
  v1335 = (void *)objc_msgSend_copy(obj->_steerFromNetwork, v71, v72, v73, v74);
  didConfigurationChangeSincePreviousAttempt = obj->_didConfigurationChangeSincePreviousAttempt;
  obj->_didConfigurationChangeSincePreviousAttempt = 0;
  LOBYTE(v62) = !obj->_resetCachedKnownNetworksContext;
  obj->_resetCachedKnownNetworksContext = 0;
  objc_sync_exit(obj);

  if ((v62 & 1) == 0)
    objc_msgSend_removeAllObjects(obj->_cachedKnownNetworksContexts, v76, v77, v78, v79);
  v80 = objc_msgSend_trigger(v1369, v76, v77, v78, v79);
  v1410 = 0;
  v83 = objc_msgSend___allowAutoJoinWithTrigger_error_(obj, v81, v80, (uint64_t)&v1410, v82);
  v1366 = v1410;
  if ((v83 & 1) == 0)
  {
    v1334 = 0;
    v1360 = 0;
    v1361 = 0;
    v1345 = 0;
    v1346 = 0;
    v1355 = 0;
    v1356 = 0;
    v1350 = 0;
    v1351 = 0;
    v1373 = 0;
    v1354 = 0;
    v1357 = 0;
    v1349 = 0;
    v1364 = 0;
    v1341 = 0;
    v1342 = 0;
LABEL_363:
    v1368 = 0;
    goto LABEL_255;
  }
  v88 = objc_alloc_init(CWFAutoJoinMetric);
  metric = obj->_metric;
  obj->_metric = v88;

  obj->_state = 0;
  if (!v1365 && objc_msgSend_count(obj->_failedToJoinKnownNetworkIDs, v90, v91, v92, v93))
  {
    CWFGetOSLog();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      CWFGetOSLog();
      v95 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v95 = MEMORY[0x1E0C81028];
      v96 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v1417) = 0;
      LODWORD(v1329) = 2;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_removeAllObjects(obj->_failedToJoinKnownNetworkIDs, v97, v98, v99, v100);
  }
  objc_msgSend_removeAllObjects(obj->_deferredColocatedJoinCandidateMap, v90, v91, v92, v93, v1326, v1329);
  objc_msgSend_removeAllObjects(obj->_hiddenNetworkChannels, v101, v102, v103, v104);
  objc_msgSend_removeAllObjects(obj->_deferredKnownNetworks, v105, v106, v107, v108);
  obj->_didDiscoverBSS = 0;
  objc_msgSend_removeAllObjects(obj->_followup6GHzRNRMap, v109, v110, v111, v112);
  objc_msgSend_removeAllObjects(obj->_followup6GHzFILSDMap, v113, v114, v115, v116);
  objc_msgSend_removeAllObjects(obj->_followup6GHzScanResultsMap, v117, v118, v119, v120);
  objc_msgSend_removeAllObjects(obj->_cumulativeScanResults, v121, v122, v123, v124);
  objc_msgSend_removeAllObjects(obj->_updatedAllowCacheKnownNetworks, v125, v126, v127, v128);
  v1367 = obj;
  objc_sync_enter(v1367);
  CWFGetOSLog();
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129)
  {
    CWFGetOSLog();
    v130 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v130 = MEMORY[0x1E0C81028];
    v131 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    activeRequest = (unint64_t)obj->_activeRequest;
    v1417 = 138543362;
    v1418 = activeRequest;
    LODWORD(v1330) = 12;
    v1327 = &v1417;
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(v1367);
  objc_msgSend_setAutoJoinParameters_(obj->_metric, v133, (uint64_t)v1369, v134, v135);
  objc_msgSend_setRetrySchedule_(obj->_metric, v136, retrySchedule, v137, v138);
  objc_msgSend_setRetryScheduleIndex_(obj->_metric, v139, retryScheduleIndex, v140, v141);
  objc_msgSend_setWasAlreadyAssociated_(obj->_metric, v142, v1365 != 0, v143, v144, v1327, v1330);
  objc_msgSend_setAssociatedNetwork_(obj->_metric, v145, (uint64_t)v1365, v146, v147);
  self->_beginTimestamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v1334 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v1370 = objc_alloc_init(CWFAutoJoinContext);
  objc_msgSend_setAutoJoinParameters_(v1370, v148, (uint64_t)v1369, v149, v150);
  v155 = objc_msgSend_mode(v1369, v151, v152, v153, v154) == 3;
  objc_msgSend_setCacheOnly_(v1370, v156, v155, v157, v158);
  if (objc_msgSend_mode(v1369, v159, v160, v161, v162) == 3)
    objc_msgSend_setMaxScanSSIDCount_(v1370, v163, -1, v164, v165);
  else
    objc_msgSend_setMaxScanSSIDCount_(v1370, v163, 9, v164, v165);
  if (v1365)
    objc_msgSend_setMinRSSI_(v1370, v166, -70, v167, v168);
  else
    objc_msgSend_setMinRSSI_(v1370, v166, -80, v167, v168);
  objc_msgSend_setMaxBSSChannelAge_(v1370, v169, 2592000, v170, v171);
  objc_msgSend_setMinBSSLocationAccuracy_(v1370, v172, v173, v174, v175, 100.0);
  objc_msgSend_setMaxBSSLocationDistance_(v1370, v176, v177, v178, v179, 300.0);
  objc_msgSend_setMaxBSSChannelCount_(v1370, v180, 3, v181, v182);
  objc_msgSend_autoJoinParameters(v1370, v183, v184, v185, v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v187, v188, v189, v190, v191) == 54)
  {

LABEL_27:
    objc_msgSend_setMaxScanChannelCount_(v1370, v196, 1, v197, v198);
LABEL_28:
    objc_msgSend_setMaxScanCacheAge_(v1370, v213, 0, v214, v215);
    goto LABEL_29;
  }
  objc_msgSend_autoJoinParameters(v1370, v192, v193, v194, v195);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend_trigger(v199, v200, v201, v202, v203) == 55;

  if (v204)
    goto LABEL_27;
  objc_msgSend_autoJoinParameters(v1370, v196, v205, v197, v198);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = objc_msgSend_trigger(v206, v207, v208, v209, v210) == 45;

  if (v211)
    goto LABEL_27;
  objc_msgSend_autoJoinParameters(v1370, v196, v212, v197, v198);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v319 = objc_msgSend_trigger(v314, v315, v316, v317, v318) == 58;

  if (v319)
  {
    objc_msgSend_setMaxScanChannelCount_(v1370, v320, 3, v322, v323);
    goto LABEL_28;
  }
  if (objc_msgSend_mode(v1369, v320, v321, v322, v323) == 1)
    objc_msgSend_setMaxScanChannelCount_(v1370, v1283, 3, v1284, v1285);
  else
    objc_msgSend_setMaxScanChannelCount_(v1370, v1283, -1, v1284, v1285);
  v1290 = objc_msgSend_trigger(v1369, v1286, v1287, v1288, v1289);
  v1291 = (v1290 < 0x40) & (0xC00FF00000000010 >> v1290);
  if (v1365)
    v1292 = 0;
  else
    v1292 = !didConfigurationChangeSincePreviousAttempt;
  if (!v1292)
    v1291 = 1;
  if (v1291)
    goto LABEL_28;
  objc_msgSend_setMaxScanCacheAge_(v1370, v213, 20000, v214, v215);
LABEL_29:
  objc_msgSend_setMaxANQPCacheAge_(v1370, v216, 3600000, v217, v218);
  objc_msgSend_setMaxScanCycles_(v1370, v219, 1, v220, v221);
  objc_msgSend_setDwellTime_(v1370, v222, 0, v223, v224);
  if (didConfigurationChangeSincePreviousAttempt)
  {
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v225, 1, v227, v228);
  }
  else
  {
    v233 = objc_msgSend_mode(v1369, v225, v226, v227, v228) == 1;
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v234, v233, v235, v236);
  }
  if (objc_msgSend_trigger(v1369, v229, v230, v231, v232) == 2
    || objc_msgSend_trigger(v1369, v237, v238, v239, v240) == 7
    || objc_msgSend_trigger(v1369, v237, v241, v239, v240) == 59
    || objc_msgSend_trigger(v1369, v237, v242, v239, v240) == 60)
  {
    objc_msgSend_setMaxScanChannelCount_(v1370, v237, 2, v239, v240);
  }
  v244 = objc_msgSend_trigger(v1369, v237, v243, v239, v240);
  if (v244 - 44 < 8 || v244 <= 0x3F && ((1 << v244) & 0xC000000000000010) != 0)
  {
    objc_msgSend___retryInterval(v1367, v245, v246, v247, v248);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v1360 = v249;
    if (v249)
    {
      v254 = objc_msgSend_BSSChannelsOnly(v249, v250, v251, v252, v253);
      objc_msgSend_setBSSChannelsOnly_(v1370, v255, v254, v256, v257);
      v262 = objc_msgSend_maxBSSChannelCount(v1360, v258, v259, v260, v261);
      objc_msgSend_setMaxBSSChannelCount_(v1370, v263, v262, v264, v265);
      v270 = objc_msgSend_maxBSSChannelAge(v1360, v266, v267, v268, v269);
      objc_msgSend_setMaxBSSChannelAge_(v1370, v271, v270, v272, v273);
      v278 = objc_msgSend_passiveScan(v1360, v274, v275, v276, v277);
      objc_msgSend_setPassiveScan_(v1370, v279, v278, v280, v281);
      v286 = objc_msgSend_dwellTime(v1360, v282, v283, v284, v285);
      objc_msgSend_setDwellTime_(v1370, v287, v286, v288, v289);
      v294 = objc_msgSend_includeAdjacent5GHzChannel(v1360, v290, v291, v292, v293);
      objc_msgSend_setIncludeAdjacent5GHzChannel_(v1370, v295, v294, v296, v297);
      v302 = objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v1360, v298, v299, v300, v301);
      objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v303, v302, v304, v305);
      v310 = objc_msgSend_alwaysInclude6GHzPSCChannels(v1360, v306, v307, v308, v309);
      objc_msgSend_setInclude6GHzChannels_(v1370, v311, v310, v312, v313);
      goto LABEL_47;
    }
  }
  else if (objc_msgSend_trigger(v1369, v245, v246, v247, v248) == 32)
  {
    objc_msgSend_setBSSChannelsOnly_(v1370, v250, 1, v252, v253);
    objc_msgSend_setMaxScanCacheAge_(v1370, v324, 0, v325, v326);
    objc_msgSend_setDwellTime_(v1370, v327, 40, v328, v329);
    objc_msgSend_setMaxBSSChannelAge_(v1370, v330, 0, v331, v332);
    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v333, 1, v334, v335);
    objc_msgSend_preferredChannels(v1369, v336, v337, v338, v339);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = objc_msgSend_copy(v340, v341, v342, v343, v344);
    cachedCarPlayPreferredChannels = v1367->_cachedCarPlayPreferredChannels;
    v1367->_cachedCarPlayPreferredChannels = (NSArray *)v345;

  }
  v1360 = 0;
LABEL_47:
  if (objc_msgSend_trigger(v1369, v250, v251, v252, v253) == 47)
  {
    v351 = (uint64_t)v1367->_cachedCarPlayPreferredChannels;
    objc_msgSend_autoJoinParameters(v1370, v347, v348, v349, v350);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreferredChannels_(v352, v353, v351, v354, v355);

    objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v1370, v356, 1, v357, v358);
  }
  if (objc_msgSend_mode(v1369, v347, v348, v349, v350) == 4
    && objc_msgSend_trigger(v1369, v359, v360, v361, v362) != 54
    && objc_msgSend_trigger(v1369, v359, v360, v361, v362) != 55)
  {
    objc_msgSend_setBSSChannelsOnly_(v1370, v359, 1, v361, v362);
    objc_msgSend_setMaxBSSChannelCount_(v1370, v363, 2, v364, v365);
    objc_msgSend_setMaxBSSChannelAge_(v1370, v366, 86400, v367, v368);
  }
  objc_msgSend_supportedChannels(v1367, v359, v360, v361, v362);
  v1342 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v1342, v369, v370, v371, v372))
  {
    v1308 = (void *)MEMORY[0x1E0CB35C8];
    v1438 = *MEMORY[0x1E0CB2D50];
    v1439[0] = CFSTR("No configured channels");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v373, (uint64_t)v1439, (uint64_t)&v1438, 1);
    v432 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v1308, v1309, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v432);
    v765 = (id)objc_claimAutoreleasedReturnValue();

    v1362 = 0;
    v1364 = 0;
    v1345 = 0;
    v1346 = 0;
    v1355 = 0;
    v1356 = 0;
    v1350 = 0;
    v1351 = 0;
    v1373 = 0;
    v1354 = 0;
    v1349 = 0;
    v1358 = 0;
    v1368 = 0;
    goto LABEL_254;
  }
  objc_msgSend___updateAutoJoinState_(v1367, v373, 1, v374, v375);
  objc_msgSend_knownNetworks(v1367, v376, v377, v378, v379);
  v1358 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v1358, v380, v381, v382, v383))
  {
    CWFGetOSLog();
    v1310 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1310)
    {
      CWFGetOSLog();
      v1311 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1311 = MEMORY[0x1E0C81028];
      v1314 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v1311, OS_LOG_TYPE_DEFAULT))
      goto LABEL_385;
    LOWORD(v1417) = 0;
    LODWORD(v1329) = 2;
    v1326 = &v1417;
    goto LABEL_384;
  }
  if (objc_msgSend_trigger(v1369, v384, v385, v386, v387) == 61 && retryScheduleIndex)
  {
    CWFGetOSLog();
    v1313 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1313)
    {
      CWFGetOSLog();
      v1311 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1311 = MEMORY[0x1E0C81028];
      v1317 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v1311, OS_LOG_TYPE_DEFAULT))
      goto LABEL_385;
    LOWORD(v1417) = 0;
    LODWORD(v1329) = 2;
    v1326 = &v1417;
LABEL_384:
    _os_log_send_and_compose_impl();
LABEL_385:
    v1362 = 0;
    v1364 = 0;
    v1345 = 0;
    v1346 = 0;
    v1349 = 0;
    v1350 = 0;
    goto LABEL_386;
  }
  objc_msgSend_allObjects(v1358, v388, v389, v390, v391);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKnownNetworks_(obj->_metric, v393, (uint64_t)v392, v394, v395);

  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend_include6GHzChannels(v1370, v396, v397, v398, v399) & 1) == 0)
    {
      objc_msgSend_allObjects(v1358, v400, v401, v402, v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v408 = objc_msgSend___didRecentlyJoinAny6GHzOnlyNetworks_(v1367, v405, (uint64_t)v404, v406, v407);
      objc_msgSend_setInclude6GHzChannels_(v1370, v409, v408, v410, v411);

    }
    CWFGetOSLog();
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    if (v412)
    {
      CWFGetOSLog();
      v413 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v413 = MEMORY[0x1E0C81028];
      v414 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v413, OS_LOG_TYPE_DEBUG))
    {
      v419 = objc_msgSend_include6GHzChannels(v1370, v415, v416, v417, v418);
      v420 = "NOT ";
      if (v419)
        v420 = "";
      v1417 = 136446210;
      v1418 = (unint64_t)v420;
      LODWORD(v1329) = 12;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }

  }
  objc_msgSend_targetNetworkProfile(v1369, v396, v397, v398, v399, v1326, v1329);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v425)
  {
    v1345 = 0;
    v1346 = 0;
LABEL_86:
    v1362 = v425;
    if (didConfigurationChangeSincePreviousAttempt || self->_beginTimestamp - beginTimestamp >= 0x8BEE643A00)
    {
      CWFGetOSLog();
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      if (v464)
      {
        CWFGetOSLog();
        v465 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v465 = MEMORY[0x1E0C81028];
        v466 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v465, OS_LOG_TYPE_DEFAULT))
      {
        v471 = objc_msgSend_count(v1358, v467, v468, v469, v470);
        v1417 = 134217984;
        v1418 = v471;
        LODWORD(v1329) = 12;
        v1326 = &v1417;
        _os_log_send_and_compose_impl();
      }

      v1405 = 0u;
      v1406 = 0u;
      v1403 = 0u;
      v1404 = 0u;
      v472 = v1358;
      v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v472, v473, (uint64_t)&v1403, (uint64_t)v1437, 16);
      if (v474)
      {
        v475 = *(_QWORD *)v1404;
        v476 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v474; ++i)
          {
            if (*(_QWORD *)v1404 != v475)
              objc_enumerationMutation(v472);
            v478 = *(_QWORD *)(*((_QWORD *)&v1403 + 1) + 8 * i);
            CWFGetOSLog();
            v479 = (void *)objc_claimAutoreleasedReturnValue();
            if (v479)
            {
              CWFGetOSLog();
              v480 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v481 = v476;
              v480 = v476;
            }

            if (os_log_type_enabled(v480, OS_LOG_TYPE_DEFAULT))
            {
              v1417 = 138543362;
              v1418 = v478;
              LODWORD(v1329) = 12;
              v1326 = &v1417;
              _os_log_send_and_compose_impl();
            }

          }
          v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v472, v482, (uint64_t)&v1403, (uint64_t)v1437, 16);
        }
        while (v474);
      }

    }
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v421, v422, v423, v424, v1326, v1329);
    v483 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v484, v485, v486, v487);
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v489, v490, v491, v492);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    v494 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    if (v495)
    {
      CWFGetOSLog();
      v496 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v496 = MEMORY[0x1E0C81028];
      v497 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v496, OS_LOG_TYPE_DEBUG))
    {
      v1417 = 134219010;
      v1418 = v494 / 0x3B9ACA00;
      v1419 = 2048;
      v1420 = v494 % 0x3B9ACA00 / 0x3E8;
      v1421 = 2082;
      *(_QWORD *)v1422 = "-[CWFAutoJoinManager __performAutoJoin]";
      *(_WORD *)&v1422[8] = 2082;
      *(_QWORD *)&v1422[10] = "CWFAutoJoinManager.m";
      *(_WORD *)&v1422[18] = 1024;
      *(_DWORD *)v1423 = 1847;
      LODWORD(v1329) = 48;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }

    targetQueue = v1367->_targetQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B068723C;
    block[3] = &unk_1E6133D68;
    v1341 = v1358;
    v1396 = v1341;
    v1397 = v1367;
    v1357 = v1370;
    v1398 = v1357;
    v1364 = v483;
    v1399 = v1364;
    v1350 = v488;
    v1400 = v1350;
    v1349 = v493;
    v1401 = v1349;
    v1402 = &v1411;
    dispatch_sync(targetQueue, block);

    if (!v1365 || !objc_msgSend_count(v1364, v499, v500, v501, v502))
      goto LABEL_146;
    objc_msgSend_matchingKnownNetworkProfile(v1365, v499, v500, v501, v502);
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    isCarPlay = objc_msgSend_isCarPlay(v503, v504, v505, v506, v507);

    if (isCarPlay)
    {
      CWFGetOSLog();
      v1315 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1315)
      {
        CWFGetOSLog();
        v432 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v432 = MEMORY[0x1E0C81028];
        v1318 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
        goto LABEL_400;
      v1417 = 138543362;
      v1418 = (unint64_t)v1365;
      LODWORD(v1329) = 12;
      v1326 = &v1417;
    }
    else
    {
      if (objc_msgSend_trigger(v1369, v509, v510, v511, v512) == 45)
      {
        objc_msgSend_set(MEMORY[0x1E0C99E20], v513, v514, v515, v516);
        v432 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedNetwork(v1367, v517, v518, v519, v520);
        v521 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_channel(v521, v522, v523, v524, v525);
        v526 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_is6GHz(v526, v527, v528, v529, v530) & 1) == 0)
        {
          objc_msgSend_channel(v1335, v531, v532, v533, v534);
          v535 = (void *)objc_claimAutoreleasedReturnValue();
          v540 = objc_msgSend_is6GHz(v535, v536, v537, v538, v539);

          if (!v540)
            goto LABEL_121;
          objc_msgSend_array(v1364, v541, v542, v543, v544);
          v545 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matchingKnownNetworkProfile(v1335, v546, v547, v548, v549);
          v550 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1367, v551, (uint64_t)v545, (uint64_t)v550, v552);
          v521 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v521)
          {
LABEL_120:

LABEL_121:
            objc_msgSend_intersectSet_(v1364, v541, (uint64_t)v432, v543, v544, v1326, v1329);
            if (!objc_msgSend_count(v1364, v568, v569, v570, v571))
            {
              CWFGetOSLog();
              v572 = (void *)objc_claimAutoreleasedReturnValue();
              if (v572)
              {
                CWFGetOSLog();
                v573 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v573 = MEMORY[0x1E0C81028];
                v1321 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v573, OS_LOG_TYPE_DEFAULT))
              {
                v1417 = 138543362;
                v1418 = (unint64_t)v1365;
                LODWORD(v1329) = 12;
                v1326 = &v1417;
                _os_log_send_and_compose_impl();
              }
LABEL_399:

LABEL_400:
              v1355 = 0;
              v1356 = 0;
              v1351 = 0;
              v1373 = 0;
              v1354 = 0;
              v1368 = 1;
              goto LABEL_401;
            }
LABEL_145:

LABEL_146:
            if (objc_msgSend_count(v1364, v499, v500, v501, v502, v1326, v1329))
            {
              objc_msgSend_set(v1364, v722, v723, v724, v725);
              v726 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_intersectSet_(v1350, v727, (uint64_t)v726, v728, v729);

              deferredKnownNetworks = obj->_deferredKnownNetworks;
              objc_msgSend_set(v1364, v731, v732, v733, v734);
              v735 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_intersectSet_(deferredKnownNetworks, v736, (uint64_t)v735, v737, v738);

              objc_msgSend_set(v1364, v739, v740, v741, v742);
              v743 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_intersectSet_(v1349, v744, (uint64_t)v743, v745, v746);

              if (*((_BYTE *)v1412 + 24))
              {
                CWFGetOSLog();
                v751 = (void *)objc_claimAutoreleasedReturnValue();
                if (v751)
                {
                  CWFGetOSLog();
                  v752 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v752 = MEMORY[0x1E0C81028];
                  v758 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v752, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v1417) = 0;
                  LODWORD(v1329) = 2;
                  v1326 = &v1417;
                  _os_log_send_and_compose_impl();
                }

              }
              else if (objc_msgSend_count(v1364, v747, v748, v749, v750) == 1)
              {
                CWFGetOSLog();
                v756 = (void *)objc_claimAutoreleasedReturnValue();
                if (v756)
                {
                  CWFGetOSLog();
                  v757 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v757 = MEMORY[0x1E0C81028];
                  v774 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v757, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v1417) = 0;
                  LODWORD(v1329) = 2;
                  v1326 = &v1417;
                  _os_log_send_and_compose_impl();
                }

                *((_BYTE *)v1412 + 24) = 1;
              }
              objc_msgSend_setAllowStandalone6GHz_(v1357, v753, *((unsigned __int8 *)v1412 + 24), v754, v755, v1326, v1329);
              objc_msgSend_setWas6GHzDeprioritized_(obj->_metric, v775, *((_BYTE *)v1412 + 24) == 0, v776, v777);
              if (objc_msgSend_count(v1350, v778, v779, v780, v781))
              {
                CWFGetOSLog();
                v782 = (void *)objc_claimAutoreleasedReturnValue();
                if (v782)
                {
                  CWFGetOSLog();
                  v783 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v783 = MEMORY[0x1E0C81028];
                  v784 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v783, OS_LOG_TYPE_DEFAULT))
                {
                  v789 = objc_msgSend_count(v1350, v785, v786, v787, v788);
                  v1417 = 134217984;
                  v1418 = v789;
                  LODWORD(v1329) = 12;
                  v1326 = &v1417;
                  _os_log_send_and_compose_impl();
                }

                v1354 = (void *)objc_msgSend_copy(v1357, v790, v791, v792, v793);
                objc_msgSend_setKnownNetworks_(v1354, v794, (uint64_t)v1350, v795, v796);
                objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v797, (uint64_t)v1354, v798, v799);
                v1361 = (void *)objc_claimAutoreleasedReturnValue();

                if (v1361)
                {
                  v804 = v1361;

                  v1354 = v804;
                }
                else
                {
                  v807 = objc_msgSend_copy(v1354, v800, v801, v802, v803);

                  objc_msgSend___prepareKnownNetworksContext_(v1367, v808, (uint64_t)v1354, v809, v810);
                  objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v811, (uint64_t)v1354, v807, v812);
                  v1346 = (void *)v807;
                }
                v1394 = v1366;
                v813 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v805, (uint64_t)v1354, (uint64_t)&v1394, v806, v1326, v1329);
                v814 = v1394;

                if ((v813 & 1) != 0)
                {
                  v1355 = 0;
                  v1356 = 0;
                  goto LABEL_360;
                }
                v815 = objc_msgSend_trigger(v1369, v84, v85, v86, v87);
                v1393 = v814;
                v818 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1367, v816, v815, (uint64_t)&v1393, v817);
                v1366 = v1393;

                if (!v818)
                {
                  v1355 = 0;
                  v1356 = 0;
LABEL_362:
                  v1351 = 0;
                  v1373 = 0;
                  goto LABEL_363;
                }
                v1362 = v1361;
              }
              else
              {
                v1354 = 0;
              }
              if (!objc_msgSend_count(obj->_deferredKnownNetworks, v84, v85, v86, v87))
              {
                v1356 = 0;
                goto LABEL_191;
              }
              CWFGetOSLog();
              v819 = (void *)objc_claimAutoreleasedReturnValue();
              if (v819)
              {
                CWFGetOSLog();
                v820 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v820 = MEMORY[0x1E0C81028];
                v821 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v820, OS_LOG_TYPE_DEFAULT))
              {
                v826 = objc_msgSend_count(obj->_deferredKnownNetworks, v822, v823, v824, v825);
                v1417 = 134217984;
                v1418 = v826;
                LODWORD(v1329) = 12;
                v1326 = &v1417;
                _os_log_send_and_compose_impl();
              }

              v1356 = (void *)objc_msgSend_copy(v1357, v827, v828, v829, v830);
              objc_msgSend_setKnownNetworks_(v1356, v831, (uint64_t)obj->_deferredKnownNetworks, v832, v833);
              objc_msgSend_setAllowDeferredCandidates_(v1356, v834, 1, v835, v836);
              objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1356, v837, 1, v838, v839);
              objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v840, (uint64_t)v1356, v841, v842);
              v1361 = (void *)objc_claimAutoreleasedReturnValue();

              if (v1361)
              {
                v847 = v1361;

                v1356 = v847;
              }
              else
              {
                v850 = objc_msgSend_copy(v1356, v843, v844, v845, v846);

                objc_msgSend___prepareKnownNetworksContext_(v1367, v851, (uint64_t)v1356, v852, v853);
                objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v854, (uint64_t)v1356, v850, v855);
                v1346 = (void *)v850;
              }
              v1392 = v1366;
              v856 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v848, (uint64_t)v1356, (uint64_t)&v1392, v849, v1326, v1329);
              v814 = v1392;

              if ((v856 & 1) == 0)
              {
                v857 = objc_msgSend_trigger(v1369, v84, v85, v86, v87);
                v1391 = v814;
                v860 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1367, v858, v857, (uint64_t)&v1391, v859);
                v1366 = v1391;

                if (v860)
                {
                  v1362 = v1361;
LABEL_191:
                  if (!objc_msgSend_count(v1349, v84, v85, v86, v87))
                  {
                    v1373 = 0;
LABEL_226:
                    v999 = obj;
                    if (*((_BYTE *)v1412 + 24))
                    {
                      v1351 = 0;
                    }
                    else
                    {
                      CWFGetOSLog();
                      v1000 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v1000)
                      {
                        CWFGetOSLog();
                        v1001 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v1001 = MEMORY[0x1E0C81028];
                        v1002 = MEMORY[0x1E0C81028];
                      }

                      if (os_log_type_enabled(v1001, OS_LOG_TYPE_DEFAULT))
                      {
                        LOWORD(v1417) = 0;
                        LODWORD(v1329) = 2;
                        v1326 = &v1417;
                        _os_log_send_and_compose_impl();
                      }

                      v1351 = (void *)objc_msgSend_copy(v1357, v1003, v1004, v1005, v1006);
                      objc_msgSend_setKnownNetworks_(v1351, v1007, (uint64_t)v1364, v1008, v1009);
                      objc_msgSend_setAllowStandalone6GHz_(v1351, v1010, 1, v1011, v1012);
                      objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1351, v1013, 1, v1014, v1015);
                      objc_msgSend_setAllowDeferredCandidates_(v1351, v1016, 1, v1017, v1018);
                      objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v1019, (uint64_t)v1351, v1020, v1021);
                      v1361 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v1361)
                      {
                        v1026 = v1361;

                        v1351 = v1026;
                      }
                      else
                      {
                        v1029 = objc_msgSend_copy(v1351, v1022, v1023, v1024, v1025);

                        objc_msgSend___prepareKnownNetworksContext_(v1367, v1030, (uint64_t)v1351, v1031, v1032);
                        objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v1033, (uint64_t)v1351, v1029, v1034);
                        v1346 = (void *)v1029;
                      }
                      v1384 = v1366;
                      v1035 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v1027, (uint64_t)v1351, (uint64_t)&v1384, v1028, v1326, v1329);
                      v814 = v1384;

                      if ((v1035 & 1) != 0)
                      {
                        v1355 = 0;
                        goto LABEL_379;
                      }
                      v1362 = v1361;
                      v1366 = v814;
                      v999 = obj;
                    }
                    if (v1365)
                    {
                      v1355 = 0;
LABEL_251:
                      if (!v1333)
                      {
                        v1368 = 0;
                        v1361 = v1362;
                        v1357 = v1370;
                        v1341 = v1358;
                        goto LABEL_257;
                      }
                      v1075 = objc_msgSend_mode(v1369, v84, v85, v86, v87) == 3;
                      v1382 = 0;
                      v1368 = objc_msgSend___performAutoHotspotWithBrowseTimeout_maxCacheAge_cacheOnly_error_(v1367, v1076, 10, 10, v1075, &v1382, v1326, v1329);
                      v432 = v1382;
                      goto LABEL_253;
                    }
                    CWFGetOSLog();
                    v1036 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v1036)
                    {
                      CWFGetOSLog();
                      v1037 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v1037 = MEMORY[0x1E0C81028];
                      v1038 = MEMORY[0x1E0C81028];
                    }

                    if (os_log_type_enabled(v1037, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(v1417) = 0;
                      LODWORD(v1329) = 2;
                      v1326 = &v1417;
                      _os_log_send_and_compose_impl();
                    }

                    v1355 = (void *)objc_msgSend_copy(v1357, v1039, v1040, v1041, v1042);
                    objc_msgSend_setKnownNetworks_(v1355, v1043, (uint64_t)v1364, v1044, v1045);
                    objc_msgSend_setMinRSSI_(v1355, v1046, -90, v1047, v1048);
                    objc_msgSend_setAllowStandalone6GHz_(v1355, v1049, 1, v1050, v1051);
                    objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v1355, v1052, 1, v1053, v1054);
                    objc_msgSend_setAllowDeferredCandidates_(v1355, v1055, 1, v1056, v1057);
                    objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v1058, (uint64_t)v1355, v1059, v1060);
                    v1361 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v1361)
                    {
                      v1065 = v1361;

                      v1355 = v1065;
                    }
                    else
                    {
                      v1068 = objc_msgSend_copy(v1355, v1061, v1062, v1063, v1064);

                      objc_msgSend___prepareKnownNetworksContext_(v1367, v1069, (uint64_t)v1355, v1070, v1071);
                      objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v1072, (uint64_t)v1355, v1068, v1073);
                      v1346 = (void *)v1068;
                    }
                    v1383 = v1366;
                    v1074 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v1066, (uint64_t)v1355, (uint64_t)&v1383, v1067, v1326, v1329);
                    v814 = v1383;

                    if ((v1074 & 1) == 0)
                    {
                      v1362 = v1361;
                      v1366 = v814;
LABEL_250:
                      v999 = obj;
                      goto LABEL_251;
                    }
LABEL_379:
                    v1368 = 1;
                    v1366 = v814;
                    goto LABEL_255;
                  }
                  CWFGetOSLog();
                  v861 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v861)
                  {
                    CWFGetOSLog();
                    v862 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v862 = MEMORY[0x1E0C81028];
                    v863 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v862, OS_LOG_TYPE_DEFAULT))
                  {
                    v868 = objc_msgSend_count(v1349, v864, v865, v866, v867);
                    v1417 = 134217984;
                    v1418 = v868;
                    LODWORD(v1329) = 12;
                    v1326 = &v1417;
                    _os_log_send_and_compose_impl();
                  }

                  v1373 = (void *)objc_msgSend_copy(v1357, v869, v870, v871, v872);
                  objc_msgSend_setKnownNetworks_(v1373, v873, (uint64_t)v1349, v874, v875);
                  objc_msgSend_setMaxScanCycles_(v1373, v876, -1, v877, v878);
                  objc_msgSend_setPassiveScan_(v1373, v879, 0, v880, v881);
                  objc_msgSend_setDwellTime_(v1373, v882, 0, v883, v884);
                  objc_msgSend_setAllowDeferredCandidates_(v1373, v885, 1, v886, v887);
                  objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v888, (uint64_t)v1373, v889, v890);
                  v891 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v891)
                  {
                    v896 = v891;

                    v1373 = v896;
                  }
                  else
                  {
                    v901 = objc_msgSend_copy(v1373, v892, v893, v894, v895);

                    objc_msgSend___prepareKnownNetworksContext_(v1367, v902, (uint64_t)v1373, v903, v904);
                    objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v905, (uint64_t)v1373, v901, v906);
                    v1346 = (void *)v901;
                  }
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v897, v898, v899, v900, v1326, v1329);
                  v432 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend_recentChannelList(v1373, v907, v908, v909, v910);
                  v911 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_remainingChannelList(v1373, v912, v913, v914, v915);
                  v916 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_arrayByAddingObjectsFromArray_(v911, v917, (uint64_t)v916, v918, v919);
                  v920 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_recentChannelList(v1373, v921, v922, v923, v924);
                  v925 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend_count(v925, v926, v927, v928, v929) >= 2)
                  {

                    v939 = 2;
                  }
                  else
                  {
                    objc_msgSend_recentChannelList(v1373, v930, v931, v932, v933);
                    v934 = (void *)objc_claimAutoreleasedReturnValue();
                    v939 = objc_msgSend_count(v934, v935, v936, v937, v938);

                    if (!v939)
                      goto LABEL_207;
                  }
                  for (j = 0; j != v939; ++j)
                  {
                    hiddenNetworkChannels = obj->_hiddenNetworkChannels;
                    objc_msgSend_recentChannelList(v1373, v940, v941, v942, v943);
                    v946 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectAtIndexedSubscript_(v946, v947, j, v948, v949);
                    v950 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(hiddenNetworkChannels, v951, (uint64_t)v950, v952, v953);

                  }
LABEL_207:
                  v1389 = 0u;
                  v1390 = 0u;
                  v1387 = 0u;
                  v1388 = 0u;
                  v954 = v920;
                  v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(v954, v955, (uint64_t)&v1387, (uint64_t)v1432, 16);
                  if (v959)
                  {
                    v960 = *(_QWORD *)v1388;
                    do
                    {
                      for (k = 0; k != v959; ++k)
                      {
                        if (*(_QWORD *)v1388 != v960)
                          objc_enumerationMutation(v954);
                        v962 = *(_QWORD *)(*((_QWORD *)&v1387 + 1) + 8 * k);
                        if (objc_msgSend_containsObject_(obj->_hiddenNetworkChannels, v956, v962, v957, v958))objc_msgSend_addObject_(v432, v956, v962, v957, v958);
                      }
                      v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(v954, v956, (uint64_t)&v1387, (uint64_t)v1432, 16);
                    }
                    while (v959);
                  }

                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v963, v964, v965, v966);
                  v967 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setRecentChannelList_(v1373, v968, (uint64_t)v967, v969, v970);

                  objc_msgSend_setRemainingChannelList_(v1373, v971, (uint64_t)v432, v972, v973);
                  CWFGetOSLog();
                  v974 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v974)
                  {
                    CWFGetOSLog();
                    v975 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v975 = MEMORY[0x1E0C81028];
                    v976 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v975, OS_LOG_TYPE_DEFAULT))
                  {
                    v981 = objc_msgSend_count(v432, v977, v978, v979, v980);
                    objc_msgSend_componentsJoinedByString_(v432, v982, (uint64_t)CFSTR(", "), v983, v984);
                    v985 = (id)objc_claimAutoreleasedReturnValue();
                    v1417 = 134218242;
                    v1418 = v981;
                    v1419 = 2114;
                    v1420 = (unint64_t)v985;
                    LODWORD(v1329) = 22;
                    v1326 = &v1417;
                    _os_log_send_and_compose_impl();

                  }
                  if (objc_msgSend_count(v432, v986, v987, v988, v989))
                  {
                    v1386 = v1366;
                    v994 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v990, (uint64_t)v1373, (uint64_t)&v1386, v993);
                    v765 = v1386;

                    if ((v994 & 1) != 0)
                    {
                      v1368 = 1;
LABEL_373:

                      v1355 = 0;
                      v1351 = 0;
                      v1362 = v891;
LABEL_374:
                      v1358 = v1341;
                      goto LABEL_254;
                    }
                    v1366 = v765;
                  }
                  v995 = objc_msgSend_trigger(v1369, v990, v991, v992, v993, v1326, v1329);
                  v1385 = v1366;
                  v998 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1367, v996, v995, (uint64_t)&v1385, v997);
                  v765 = v1385;

                  if ((v998 & 1) != 0)
                  {

                    v1362 = v891;
                    v1366 = v765;
                    goto LABEL_226;
                  }
                  v1368 = 0;
                  goto LABEL_373;
                }
                v1355 = 0;
                goto LABEL_362;
              }
              v1355 = 0;
LABEL_360:
              v1351 = 0;
              v1373 = 0;
              goto LABEL_379;
            }
            CWFGetOSLog();
            v1312 = (void *)objc_claimAutoreleasedReturnValue();
            if (v1312)
            {
              CWFGetOSLog();
              v1311 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v1311 = MEMORY[0x1E0C81028];
              v1316 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v1311, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v1417) = 0;
              LODWORD(v1329) = 2;
              v1326 = &v1417;
              _os_log_send_and_compose_impl();
            }
LABEL_386:

            v1355 = 0;
            v1356 = 0;
            v1351 = 0;
            v1373 = 0;
            v1354 = 0;
            goto LABEL_250;
          }
          objc_msgSend_setInclude6GHzChannels_(v1357, v553, 1, v554, v555);
          v1436 = v521;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v556, (uint64_t)&v1436, 1, v557);
          v526 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1367, v558, (uint64_t)v526, (uint64_t)v1365, 1, v1357);
          v559 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_set(v559, v560, v561, v562, v563);
          v564 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v432, v565, (uint64_t)v564, v566, v567);

        }
        goto LABEL_120;
      }
      if (objc_msgSend_trigger(v1369, v513, v514, v515, v516) == 58)
      {
        objc_msgSend_set(MEMORY[0x1E0C99E20], v574, v575, v576, v577);
        v432 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedNetwork(v1367, v578, v579, v580, v581);
        v582 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_channel(v582, v583, v584, v585, v586);
        v587 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_is6GHz(v587, v588, v589, v590, v591) & 1) == 0)
        {
          objc_msgSend_channel(v1335, v592, v593, v594, v595);
          v596 = (void *)objc_claimAutoreleasedReturnValue();
          v601 = objc_msgSend_is6GHz(v596, v597, v598, v599, v600);

          if (!v601)
          {
LABEL_131:
            objc_msgSend_matchingKnownNetworkProfile(v1365, v602, v603, v604, v605, v1326, v1329);
            v629 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_array(v1364, v630, v631, v632, v633);
            v634 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(v1367, v635, (uint64_t)v629, (uint64_t)v634, (uint64_t)v1357);
            v636 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_set(v636, v637, v638, v639, v640);
            v641 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unionSet_(v432, v642, (uint64_t)v641, v643, v644);

            if (objc_msgSend___isDeferrableJoinCandidate_(v1367, v645, (uint64_t)v1365, v646, v647))
            {
              objc_msgSend_matchingKnownNetworkProfile(v1365, v648, v649, v650, v651);
              v652 = (void *)objc_claimAutoreleasedReturnValue();
              v657 = objc_msgSend_wasMoreRecentlyJoinedByUser(v652, v653, v654, v655, v656);

              if ((v657 & 1) == 0)
              {
                objc_msgSend_set(v1350, v648, v658, v650, v651);
                v659 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_unionSet_(v432, v660, (uint64_t)v659, v661, v662);

              }
            }
            objc_msgSend_intersectSet_(v1364, v648, (uint64_t)v432, v650, v651);
            if (!objc_msgSend_count(v1364, v663, v664, v665, v666))
            {
              CWFGetOSLog();
              v667 = (void *)objc_claimAutoreleasedReturnValue();
              if (v667)
              {
                CWFGetOSLog();
                v573 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v573 = MEMORY[0x1E0C81028];
                v1322 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v573, OS_LOG_TYPE_DEFAULT))
              {
                v1417 = 138543362;
                v1418 = (unint64_t)v1365;
                LODWORD(v1329) = 12;
                v1326 = &v1417;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_399;
            }
            goto LABEL_145;
          }
          objc_msgSend_array(v1364, v602, v603, v604, v605);
          v606 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matchingKnownNetworkProfile(v1335, v607, v608, v609, v610);
          v611 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1367, v612, (uint64_t)v606, (uint64_t)v611, v613);
          v582 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v582)
          {
LABEL_130:

            goto LABEL_131;
          }
          objc_msgSend_setInclude6GHzChannels_(v1357, v614, 1, v615, v616);
          v1435 = v582;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v617, (uint64_t)&v1435, 1, v618);
          v587 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1367, v619, (uint64_t)v587, (uint64_t)v1365, 1, v1357);
          v620 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_set(v620, v621, v622, v623, v624);
          v625 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v432, v626, (uint64_t)v625, v627, v628);

        }
        goto LABEL_130;
      }
      if (objc_msgSend_trigger(v1369, v574, v575, v576, v577) == 54
        || objc_msgSend_trigger(v1369, v668, v669, v670, v671) == 55)
      {
        v676 = objc_msgSend_trigger(v1369, v668, v669, v670, v671, v1326, v1329);
        if (v676 != 54 && objc_msgSend_trigger(v1369, v672, v673, v674, v675) == 55)
        {
          objc_msgSend_array(v1364, v672, v673, v674, v675);
          v677 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_associatedNetwork(v1367, v678, v679, v680, v681);
          v682 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1367, v683, (uint64_t)v677, (uint64_t)v682, 0, v1357);
          v684 = (void *)objc_claimAutoreleasedReturnValue();
          v689 = objc_msgSend_count(v684, v685, v686, v687, v688) == 0;

          if (v689)
            objc_msgSend_setBSSChannelsOnly_(v1357, v672, 1, v674, v675);
        }
        objc_msgSend_array(v1364, v672, v673, v674, v675);
        v690 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedNetwork(v1367, v691, v692, v693, v694);
        v695 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1367, v696, (uint64_t)v690, (uint64_t)v695, v676 != 54, v1357);
        v697 = (void *)objc_claimAutoreleasedReturnValue();
        v702 = objc_msgSend_count(v697, v698, v699, v700, v701) == 0;

        if (v702)
        {
          v1319 = (void *)MEMORY[0x1E0CB35C8];
          v1433 = *MEMORY[0x1E0CB2D50];
          v1434 = CFSTR("Already associated and no seamless SSID transition candidates configured");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v703, (uint64_t)&v1434, (uint64_t)&v1433, 1);
          v432 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v1319, v1320, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v432);
          v765 = (id)objc_claimAutoreleasedReturnValue();

          v1355 = 0;
          v1356 = 0;
          v1351 = 0;
          v1373 = 0;
          v1354 = 0;
          v1368 = 0;
          goto LABEL_374;
        }
        objc_msgSend_array(v1364, v703, v704, v705, v706);
        v432 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_associatedNetwork(v1367, v707, v708, v709, v710);
        v711 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(v1367, v712, (uint64_t)v432, (uint64_t)v711, 1, v1357);
        v713 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set(v713, v714, v715, v716, v717);
        v718 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_intersectSet_(v1364, v719, (uint64_t)v718, v720, v721);

        goto LABEL_145;
      }
      if (objc_msgSend_trigger(v1369, v668, v669, v670, v671) == 32
        || objc_msgSend_trigger(v1369, v1293, v1294, v1295, v1296) == 47
        || (objc_msgSend_matchingKnownNetworkProfile(v1365, v1293, v1294, v1295, v1296),
            v1297 = (void *)objc_claimAutoreleasedReturnValue(),
            v1302 = objc_msgSend_wasMoreRecentlyJoinedByUser(v1297, v1298, v1299, v1300, v1301),
            v1297,
            !v1302))
      {
        v1303 = objc_msgSend_trigger(v1369, v1293, v1294, v1295, v1296, v1326, v1329);
        if ((objc_msgSend___allowOpportunisticNetworkTransitionWithTrigger_(v1367, v1304, v1303, v1305, v1306) & 1) != 0)
          goto LABEL_146;
        CWFGetOSLog();
        v1307 = (void *)objc_claimAutoreleasedReturnValue();
        if (v1307)
        {
          CWFGetOSLog();
          v432 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v432 = MEMORY[0x1E0C81028];
          v1323 = MEMORY[0x1E0C81028];
        }

        if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
          goto LABEL_400;
        v1417 = 138543362;
        v1418 = (unint64_t)v1365;
        LODWORD(v1329) = 12;
        v1326 = &v1417;
      }
      else
      {
        CWFGetOSLog();
        v1324 = (void *)objc_claimAutoreleasedReturnValue();
        if (v1324)
        {
          CWFGetOSLog();
          v432 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v432 = MEMORY[0x1E0C81028];
          v1325 = MEMORY[0x1E0C81028];
        }

        if (!os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
          goto LABEL_400;
        v1417 = 138543362;
        v1418 = (unint64_t)v1365;
        LODWORD(v1329) = 12;
        v1326 = &v1417;
      }
    }
    v1368 = 1;
    _os_log_send_and_compose_impl();
    v1355 = 0;
    v1356 = 0;
    v1351 = 0;
    v1373 = 0;
    v1354 = 0;
LABEL_401:
    v1358 = v1341;
    goto LABEL_253;
  }
  objc_msgSend_allObjects(v1358, v421, v422, v423, v424);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___knownNetworksList_containsMatchingKnownNetwork_(v1367, v427, (uint64_t)v426, (uint64_t)v425, v428);
  v1345 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1345)
  {
    CWFGetOSLog();
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    if (v431)
    {
      CWFGetOSLog();
      v432 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v432 = MEMORY[0x1E0C81028];
      v463 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
    {
      v1417 = 138543362;
      v1418 = 0;
      LODWORD(v1329) = 12;
      v1326 = &v1417;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_84;
  }
  CWFGetOSLog();
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  if (v429)
  {
    CWFGetOSLog();
    v430 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v430 = MEMORY[0x1E0C81028];
    v433 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v430, OS_LOG_TYPE_DEFAULT))
  {
    v1417 = 138543362;
    v1418 = (unint64_t)v1345;
    LODWORD(v1329) = 12;
    v1326 = &v1417;
    _os_log_send_and_compose_impl();
  }

  v434 = v1367->_targetQueue;
  v1409 = 0;
  v436 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(v1367, v435, (uint64_t)v1345, (uint64_t)v1370, 0, 0, v434, &v1409);
  v432 = v1409;
  if (!v436)
  {
LABEL_84:
    v1362 = 0;
    v1346 = 0;
LABEL_85:

    v425 = v1362;
    goto LABEL_86;
  }
  v441 = (void *)objc_msgSend_copy(v1370, v437, v438, v439, v440);
  objc_msgSend_orderedSetWithObject_(MEMORY[0x1E0C99E40], v442, (uint64_t)v1345, v443, v444);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKnownNetworks_(v441, v446, (uint64_t)v445, v447, v448);

  objc_msgSend_setAllowDeferredCandidates_(v441, v449, 1, v450, v451);
  objc_msgSend_objectForKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v452, (uint64_t)v441, v453, v454);
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v1362 = v455;
  if (v455)
  {
    v460 = v455;

    v1346 = 0;
    v441 = v460;
  }
  else
  {
    v1346 = (void *)objc_msgSend_copy(v441, v456, v457, v458, v459);
    objc_msgSend___prepareKnownNetworksContext_(v1367, v759, (uint64_t)v441, v760, v761);
    objc_msgSend_setObject_forKeyedSubscript_(v1367->_cachedKnownNetworksContexts, v762, (uint64_t)v441, (uint64_t)v1346, v763);
  }
  v1408 = v1366;
  v764 = objc_msgSend___discoverKnownNetworksWithContext_error_(v1367, v461, (uint64_t)v441, (uint64_t)&v1408, v462, v1326, v1329);
  v765 = v1408;

  if (v764)
  {

    v1355 = 0;
    v1356 = 0;
    v1350 = 0;
    v1351 = 0;
    v1373 = 0;
    v1354 = 0;
    v1349 = 0;
    v1364 = 0;
    v1368 = 1;
    goto LABEL_254;
  }
  v770 = objc_msgSend_trigger(v1369, v766, v767, v768, v769);
  v1407 = v765;
  v773 = objc_msgSend___allowAutoJoinWithTrigger_error_(v1367, v771, v770, (uint64_t)&v1407, v772);
  v1366 = v1407;

  if ((v773 & 1) != 0)
    goto LABEL_85;
  v1355 = 0;
  v1356 = 0;
  v1350 = 0;
  v1351 = 0;
  v1373 = 0;
  v1354 = 0;
  v1349 = 0;
  v1364 = 0;
  v1368 = 0;
LABEL_253:
  v765 = v1366;
LABEL_254:

  v1361 = v1362;
  v1357 = v1370;
  v1341 = v1358;
  v1366 = v765;
LABEL_255:
  v999 = obj;
LABEL_257:
  v1081 = objc_msgSend_scanDuration(v999->_metric, v84, v85, v86, v87, v1326, v1329)
       || objc_msgSend_autoHotspotBrowseDuration(obj->_metric, v1077, v1078, v1079, v1080);
  v1082 = obj;
  objc_sync_enter(v1082);
  v1083 = *((unsigned __int8 *)v1082 + 201);
  v1371 = *((unsigned __int8 *)v1082 + 202);
  objc_msgSend_reply(obj->_activeRequest, v1084, v1085, v1086, v1087);
  v1088 = (void *)objc_claimAutoreleasedReturnValue();
  v1363 = (void *)objc_msgSend_copy(v1088, v1089, v1090, v1091, v1092);

  if (v1366 || v1371 | v1083)
  {
    v1108 = obj->_activeRequest;
    obj->_activeRequest = 0;

    *((_BYTE *)v1082 + 201) = 0;
    v1109 = v1082[26];
    v1082[26] = 0;

    *((_BYTE *)v1082 + 202) = 0;
    v1107 = obj;
  }
  else
  {
    if (!obj->_didConfigurationChangeSincePreviousAttempt)
      objc_msgSend___removeRedundantRequests_(v1082, v1093, (uint64_t)obj->_activeRequest, v1094, v1095);
    v1096 = obj->_activeRequest;
    obj->_activeRequest = 0;

    *((_BYTE *)v1082 + 201) = 0;
    v1097 = v1082[26];
    v1082[26] = 0;

    *((_BYTE *)v1082 + 202) = 0;
    v1102 = objc_msgSend_trigger(v1369, v1098, v1099, v1100, v1101);
    v1107 = obj;
    if (v1102 - 44 < 8 || v1102 <= 0x3F && ((1 << v1102) & 0xC000000000000010) != 0)
      ++obj->_retryScheduleIndex;
  }
  if (!*((_BYTE *)v1082 + 200))
  {
    v1185 = objc_msgSend_trigger(v1369, v1103, v1104, v1105, v1106);
    if ((objc_msgSend___shouldPrioritizeRetryOverNewRequest_(v1082, v1186, v1185, v1187, v1188) & 1) != 0
      || (objc_msgSend___nextRequest(v1082, v1103, v1189, v1105, v1106) & 1) == 0)
    {
      if (!v1366
        || v1083
        || (v1190 = objc_msgSend_trigger(v1369, v1103, v1189, v1105, v1106), v1190 - 44 >= 8)
        && (v1190 > 0x3F || ((1 << v1190) & 0xC000000000000010) == 0))
      {
        objc_msgSend___updateRetrySchedule(v1082, v1103, v1189, v1105, v1106);
      }
    }
  }
  objc_msgSend_objectForKeyedSubscript_(v1107->_triggerTimestampMap, v1103, (uint64_t)&unk_1E615E868, v1105, v1106);
  v1110 = (void *)objc_claimAutoreleasedReturnValue();
  v1115 = objc_msgSend_unsignedLongValue(v1110, v1111, v1112, v1113, v1114);

  objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v1116, (uint64_t)&unk_1E615E880, v1117, v1118);
  v1119 = (void *)objc_claimAutoreleasedReturnValue();
  v1124 = objc_msgSend_unsignedLongValue(v1119, v1120, v1121, v1122, v1123);

  objc_msgSend_objectForKeyedSubscript_(obj->_triggerTimestampMap, v1125, (uint64_t)&unk_1E615E898, v1126, v1127);
  v1128 = (void *)objc_claimAutoreleasedReturnValue();
  v1133 = objc_msgSend_unsignedLongValue(v1128, v1129, v1130, v1131, v1132);

  if (v1368
    && (objc_msgSend_trigger(v1369, v1134, v1135, v1136, v1137) == 54
     || objc_msgSend_trigger(v1369, v1134, v1138, v1139, v1137) == 55))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v1082[29], v1134, 0, (uint64_t)&unk_1E615E8B0, v1137);
  }
  if (v1081)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v1134, v1334, v1136, v1137);
    v1140 = (void *)objc_claimAutoreleasedReturnValue();
    v1141 = v1082[29];
    v1142 = (void *)MEMORY[0x1E0CB37E8];
    v1147 = objc_msgSend_trigger(v1369, v1143, v1144, v1145, v1146);
    objc_msgSend_numberWithInteger_(v1142, v1148, v1147, v1149, v1150);
    v1151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1141, v1152, (uint64_t)v1140, (uint64_t)v1151, v1153);

    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v1154, v1334, v1155, v1156);
    v1157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v1082[29], v1158, (uint64_t)v1157, (uint64_t)&unk_1E615E8C8, v1159);

  }
  objc_sync_exit(v1082);

  if (self->_beginTimestamp)
  {
    v1359 = v1371 | v1083;
    v1160 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v1161 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v1162 = self->_beginTimestamp;
    v1167 = objc_msgSend_autoHotspotDuration(obj->_metric, v1163, v1164, v1165, v1166);
    objc_msgSend_setDuration_(obj->_metric, v1168, (v1161 - v1162) / 0xF4240 - v1167, v1169, v1170);
    objc_msgSend_setResult_(obj->_metric, v1171, v1368, v1172, v1173);
    objc_msgSend_setError_(obj->_metric, v1174, (uint64_t)v1366, v1175, v1176);
    if (linkChangeTimestamp < v1339 || v1343 == v1339)
      objc_msgSend_setDurationFromLinkDownTrigger_(obj->_metric, v1177, (v1160 - v1339) / 0xF4240, v1178, v1179);
    if (linkChangeTimestamp < v1115 || v1343 == v1115)
      objc_msgSend_setDurationFromDeviceUnlockTrigger_(obj->_metric, v1177, (v1160 - v1115) / 0xF4240, v1178, v1179);
    if (linkChangeTimestamp < v1124 || v1343 == v1124)
      objc_msgSend_setDurationFromDisplayOnTrigger_(obj->_metric, v1177, (v1160 - v1124) / 0xF4240, v1178, v1179);
    if (linkChangeTimestamp < v1133 || v1343 == v1133)
      objc_msgSend_setDurationFromWiFiPowerOnTrigger_(obj->_metric, v1177, (v1160 - v1133) / 0xF4240, v1178, v1179);
    if (linkChangeTimestamp < v1337 || v1343 == v1337)
    {
      objc_msgSend_setDurationFromNonRetryAutoJoinTrigger_(obj->_metric, v1177, (v1160 - v1337) / 0xF4240, v1178, v1179);
      objc_msgSend_setPreviousNonRetryAutoJoinTrigger_(obj->_metric, v1180, previousNonRetryTrigger, v1181, v1182);
    }
    objc_msgSend___updateCachedMetricAndStatistics_(v1082, v1177, (uint64_t)obj->_metric, v1178, v1179);
    CWFGetOSLog();
    v1183 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1183)
    {
      CWFGetOSLog();
      v1184 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1184 = MEMORY[0x1E0C81028];
      v1191 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v1184, OS_LOG_TYPE_DEFAULT))
    {
      v1344 = v1083;
      objc_msgSend_UUIDString(v1336, v1192, v1193, v1194, v1195);
      v1196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v1196, v1197, 5, v1198, v1199);
      v1353 = (id)objc_claimAutoreleasedReturnValue();
      v1340 = objc_msgSend_duration(obj->_metric, v1200, v1201, v1202, v1203);
      v1338 = objc_msgSend_result(obj->_metric, v1204, v1205, v1206, v1207);
      objc_msgSend_error(obj->_metric, v1208, v1209, v1210, v1211);
      v1212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v1082, v1213, (uint64_t)v1212, v1214, v1215);
      v1348 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scanChannels(obj->_metric, v1216, v1217, v1218, v1219);
      v1220 = (void *)objc_claimAutoreleasedReturnValue();
      v1225 = objc_msgSend_count(v1220, v1221, v1222, v1223, v1224);
      v1230 = objc_msgSend_autoHotspotDuration(obj->_metric, v1226, v1227, v1228, v1229);
      v1235 = objc_msgSend_autoHotspotResult(obj->_metric, v1231, v1232, v1233, v1234);
      objc_msgSend_autoHotspotError(obj->_metric, v1236, v1237, v1238, v1239);
      v1240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v1082, v1241, (uint64_t)v1240, v1242, v1243);
      v1244 = (id)objc_claimAutoreleasedReturnValue();
      v1417 = 138545666;
      v1418 = (unint64_t)v1353;
      v1419 = 2048;
      v1420 = v1340;
      v1421 = 1024;
      *(_DWORD *)v1422 = v1338;
      *(_WORD *)&v1422[4] = 2114;
      *(_QWORD *)&v1422[6] = v1348;
      *(_WORD *)&v1422[14] = 1024;
      *(_DWORD *)&v1422[16] = v1344;
      *(_WORD *)v1423 = 1024;
      *(_DWORD *)&v1423[2] = v1371;
      v1424 = 2048;
      v1425 = v1225;
      v1426 = 2048;
      v1427 = v1230;
      v1428 = 1024;
      v1429 = v1235;
      v1430 = 2114;
      v1431 = v1244;
      LODWORD(v1331) = 86;
      v1328 = &v1417;
      _os_log_send_and_compose_impl();

    }
    CWFGetOSLog();
    v1245 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1245)
    {
      CWFGetOSLog();
      v1246 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1246 = MEMORY[0x1E0C81028];
      v1247 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v1246, OS_LOG_TYPE_DEBUG))
    {
      v1248 = (unint64_t)obj->_metric;
      v1417 = 138543362;
      v1418 = v1248;
      LODWORD(v1331) = 12;
      v1328 = &v1417;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend___updateAutoJoinState_(v1082, v1249, 0, v1250, v1251);
    v1252 = objc_opt_class();
    if (!v1359 && v1252)
    {
      objc_msgSend_coreAnalyticsEventName(obj->_metric, v1253, v1254, v1255, v1256);
      v1257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_coreAnalyticsEventPayload(obj->_metric, v1258, v1259, v1260, v1261);
      v1262 = (void *)objc_claimAutoreleasedReturnValue();
      CWFGetOSLog();
      v1263 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1263)
      {
        CWFGetOSLog();
        v1264 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v1264 = MEMORY[0x1E0C81028];
        v1265 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v1264, OS_LOG_TYPE_DEBUG))
      {
        v1417 = 138543362;
        v1418 = (unint64_t)v1257;
        LODWORD(v1331) = 12;
        v1328 = &v1417;
        _os_log_send_and_compose_impl();
      }

      v1377 = MEMORY[0x1E0C809B0];
      v1378 = 3221225472;
      v1379 = sub_1B0687550;
      v1380 = &unk_1E6133390;
      v1381 = v1262;
      AnalyticsSendEventLazy();

    }
    if (v1366)
      v1266 = 1;
    else
      v1266 = v1368;
    if ((v1266 & 1) == 0)
    {
      if (objc_msgSend_trigger(v1369, v1253, v1254, v1255, v1256) == 54
        || objc_msgSend_trigger(v1369, v1267, v1268, v1269, v1270) == 55)
      {
        v1271 = (void *)MEMORY[0x1E0CB35C8];
        v1415 = *MEMORY[0x1E0CB2D50];
        v1416 = CFSTR("No candidate found");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v1267, (uint64_t)&v1416, (uint64_t)&v1415, 1, v1328, v1331);
        v1272 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v1271, v1273, *MEMORY[0x1E0CB2FE0], 2, (uint64_t)v1272);
        v1366 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v1366 = 0;
      }
    }
  }
  if (!v1371)
  {
    v1274 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v1275 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1275)
    {
      CWFGetOSLog();
      v1276 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1276 = MEMORY[0x1E0C81028];
      v1277 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v1276, OS_LOG_TYPE_DEBUG))
    {
      v1417 = 134219010;
      v1418 = v1274 / 0x3B9ACA00;
      v1419 = 2048;
      v1420 = v1274 % 0x3B9ACA00 / 0x3E8;
      v1421 = 2082;
      *(_QWORD *)v1422 = "-[CWFAutoJoinManager __performAutoJoin]";
      *(_WORD *)&v1422[8] = 2082;
      *(_QWORD *)&v1422[10] = "CWFAutoJoinManager.m";
      *(_WORD *)&v1422[18] = 1024;
      *(_DWORD *)v1423 = 2327;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(v1082, v1278, v1279, v1280, v1281);
    v1282 = objc_claimAutoreleasedReturnValue();
    v1374[0] = MEMORY[0x1E0C809B0];
    v1374[1] = 3221225472;
    v1374[2] = sub_1B0687558;
    v1374[3] = &unk_1E6133850;
    v1376 = v1363;
    v1375 = v1366;
    dispatch_sync(v1282, v1374);

  }
  _Block_object_dispose(&v1411, 8);

}

- (void)__sortKnownNetworks:(id)a3
{
  void *v4;
  id v5;
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
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend_array(v4, v6, v7, v8, v9);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_knownNetworkComparator(self, v10, v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v14, 0, 0, (uint64_t)v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v34, v18, (uint64_t)v17, v19, v20);

  }
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v14, (uint64_t)CFSTR("lastJoinedAt"), 0, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v34, v22, (uint64_t)v21, v23, v24);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v25, (uint64_t)CFSTR("addedAt"), 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v34, v28, (uint64_t)v27, v29, v30);
  objc_msgSend_sortUsingDescriptors_(v5, v31, (uint64_t)v34, v32, v33);

}

- (void)__sortKnownNetworksByJoinTimestamp:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend_array(v3, v5, v6, v7, v8);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v9, (uint64_t)CFSTR("lastJoinedByUserAt"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v24, v12, (uint64_t)v11, v13, v14);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v15, (uint64_t)CFSTR("lastJoinedBySystemAt"), 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v24, v18, (uint64_t)v17, v19, v20);
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v24, v22, v23);

}

- (id)__basicChannelRepresentation:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  if (!a3)
    return 0;
  v3 = a3;
  v8 = objc_msgSend_channel(v3, v4, v5, v6, v7);
  v13 = objc_msgSend_band(v3, v9, v10, v11, v12);

  objc_msgSend_channelWithNumber_band_width_(CWFChannel, v14, v8, v13, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__knownNetworksList:(id)a3 containsMatchingKnownNetwork:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v53;
  id obj;
  int isEqual;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v57;
LABEL_3:
    v15 = 0;
    v53 = v13;
    while (1)
    {
      if (*(_QWORD *)v57 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
      objc_msgSend_identifier(v6, v9, v10, v11, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v16, v18, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v22)
      {

LABEL_17:
        v51 = v16;
        goto LABEL_18;
      }
      v27 = (void *)v22;
      objc_msgSend_identifier(v6, v23, v24, v25, v26);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v33 = (void *)v28;
        objc_msgSend_identifier(v16, v29, v30, v31, v32);
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v39 = (void *)v34;
          objc_msgSend_identifier(v6, v35, v36, v37, v38);
          v40 = v6;
          v41 = v14;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v16, v43, v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50);

          v14 = v41;
          v6 = v40;
          v13 = v53;

          if (isEqual)
            goto LABEL_17;
          goto LABEL_13;
        }

      }
LABEL_13:
      if (v13 == ++v15)
      {
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v56, (uint64_t)v60, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }
  v51 = 0;
LABEL_18:

  return v51;
}

- (BOOL)__didRecentlyJoinAny6GHzOnlyNetworks:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  void *v72;
  NSObject *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  BOOL v86;
  void *v87;
  NSObject *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  int v114;
  void *v115;
  __int16 v116;
  int v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_location(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v10, v11, v12, v13);
  v15 = v14;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v16 = v4;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v110, (uint64_t)v119, 16);
  if (v18)
  {
    v23 = v18;
    v24 = *(_QWORD *)v111;
    while (2)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v111 != v24)
          objc_enumerationMutation(v16);
        v26 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v25);
        if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v26, v19, v20, v21, v22, v101, v102))
        {
          objc_msgSend_lastJoinedOnAnyDeviceAt(v26, v19, v20, v21, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v27, v28, v29, v30, v31);
          v33 = v15 - v32;

          if (v33 <= 2592000.0)
          {
            if (!v9)
              goto LABEL_33;
            v103 = v23;
            v104 = v24;
            v105 = v16;
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            objc_msgSend_BSSList(v26, v19, v20, v21, v22);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v106, (uint64_t)v118, 16);
            if (!v36)
            {
LABEL_32:

              v16 = v105;
LABEL_33:
              CWFGetOSLog();
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                CWFGetOSLog();
                v88 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v88 = MEMORY[0x1E0C81028];
                v89 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend_identifier(v26, v90, v91, v92, v93);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_redactedForWiFi(v94, v95, v96, v97, v98);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v114 = 138543362;
                v115 = v99;
                _os_log_send_and_compose_impl();

              }
              v86 = 1;
              goto LABEL_40;
            }
            v41 = v36;
            v42 = 0;
            v43 = *(_QWORD *)v107;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v107 != v43)
                  objc_enumerationMutation(v34);
                v45 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
                objc_msgSend_lastAssociatedAt(v45, v37, v38, v39, v40);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSinceReferenceDate(v46, v47, v48, v49, v50);
                v52 = v15 - v51;

                if (v52 <= 2592000.0)
                {
                  objc_msgSend_location(v45, v37, v38, v39, v40);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v53)
                    goto LABEL_32;
                  v57 = v53;
                  objc_msgSend_distanceFromLocation_(v53, v54, (uint64_t)v9, v55, v56);
                  v59 = v58;
                  objc_msgSend_horizontalAccuracy(v57, v60, v61, v62, v63);
                  v65 = v59 - v64;
                  objc_msgSend_horizontalAccuracy(v9, v66, v67, v68, v69);
                  v71 = v65 - v70;

                  if (v71 <= 3000.0)
                    goto LABEL_32;
                  v42 = 1;
                }
              }
              v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v106, (uint64_t)v118, 16);
            }
            while (v41);

            v16 = v105;
            v23 = v103;
            v24 = v104;
            if ((v42 & 1) == 0 || !_os_feature_enabled_impl())
              goto LABEL_33;
            CWFGetOSLog();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (v72)
            {
              CWFGetOSLog();
              v73 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v73 = MEMORY[0x1E0C81028];
              v74 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_identifier(v26, v75, v76, v77, v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v79, v80, v81, v82, v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = 138543618;
              v115 = v84;
              v116 = 1024;
              v117 = 3000;
              LODWORD(v102) = 18;
              v101 = &v114;
              _os_log_send_and_compose_impl();

            }
          }
        }
        ++v25;
      }
      while (v25 != v23);
      v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v110, (uint64_t)v119, 16);
      v23 = v85;
      v86 = 0;
      if (v85)
        continue;
      break;
    }
  }
  else
  {
    v86 = 0;
  }
LABEL_40:

  return v86;
}

- (void)__prepareKnownNetworksContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
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
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
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
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BOOL4 v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  NSObject *v184;
  id v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  const char *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  const char *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  double v237;
  double v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  NSObject *v255;
  uint64_t j;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  NSObject *v265;
  NSObject *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  _BOOL4 v330;
  double v331;
  double v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  double v338;
  double v339;
  double v340;
  double v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  double v346;
  double v347;
  double v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  double v353;
  int v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  void *v381;
  void *v382;
  NSObject *v383;
  id v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  char *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  void *v402;
  void *v403;
  NSObject *v404;
  id v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  char *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  NSObject *v449;
  id v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  char *v460;
  id v461;
  const char *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  void *v469;
  uint64_t v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  void *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  double v497;
  BOOL v498;
  void *v499;
  NSObject *v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  void *v504;
  id v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  id v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  id v524;
  id v525;
  void *v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  char *v531;
  uint64_t v532;
  id v533;
  const char *v534;
  uint64_t v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t n;
  uint64_t v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  id v547;
  const char *v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t ii;
  uint64_t v556;
  const char *v557;
  uint64_t v558;
  uint64_t v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  void *v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  void *v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  const char *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  void *v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  void *v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  const char *v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  void *v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  void *v616;
  const char *v617;
  void *v618;
  void *v619;
  const char *v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  double v624;
  _BOOL4 v625;
  uint64_t v626;
  void *v627;
  const char *v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  double v632;
  double v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  void *v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  double v651;
  BOOL v652;
  void *v653;
  const char *v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  const char *v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  void *v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  void *v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  void *v687;
  const char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  const char *v693;
  uint64_t v694;
  uint64_t v695;
  uint64_t v696;
  void *v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  void *v701;
  NSObject *v702;
  id v703;
  const char *v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  void *v708;
  const char *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  void *v714;
  const char *v715;
  const char *v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  const char *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  void **v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  void *v730;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  const char *v740;
  uint64_t v741;
  uint64_t v742;
  uint64_t v743;
  void *v744;
  const char *v745;
  uint64_t v746;
  uint64_t v747;
  const char *v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  void *v752;
  const char *v753;
  uint64_t v754;
  uint64_t v755;
  const char *v756;
  uint64_t v757;
  uint64_t v758;
  uint64_t v759;
  const char *v760;
  uint64_t v761;
  uint64_t v762;
  uint64_t v763;
  void *v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  void *v769;
  const char *v770;
  uint64_t v771;
  uint64_t v772;
  const char *v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  void *v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  const char *v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;
  void *v785;
  const char *v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  unint64_t v790;
  const char *v791;
  uint64_t v792;
  uint64_t v793;
  uint64_t v794;
  const char *v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  const char *v800;
  uint64_t v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  void *v810;
  const char *v811;
  uint64_t v812;
  uint64_t v813;
  const char *v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  void *v818;
  const char *v819;
  uint64_t v820;
  uint64_t v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  void *v826;
  const char *v827;
  uint64_t v828;
  uint64_t v829;
  const char *v830;
  uint64_t v831;
  uint64_t v832;
  uint64_t v833;
  const char *v834;
  uint64_t v835;
  uint64_t v836;
  void *v837;
  const char *v838;
  uint64_t v839;
  uint64_t v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  void *v845;
  const char *v846;
  uint64_t v847;
  uint64_t v848;
  const char *v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  void *v853;
  const char *v854;
  uint64_t v855;
  uint64_t v856;
  const char *v857;
  uint64_t v858;
  uint64_t v859;
  uint64_t v860;
  void *v861;
  const char *v862;
  uint64_t v863;
  uint64_t v864;
  const char *v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  void *v869;
  const char *v870;
  uint64_t v871;
  uint64_t v872;
  const char *v873;
  uint64_t v874;
  uint64_t v875;
  uint64_t v876;
  const char *v877;
  uint64_t v878;
  uint64_t v879;
  uint64_t v880;
  void *v881;
  const char *v882;
  uint64_t v883;
  uint64_t v884;
  void *v885;
  const char *v886;
  uint64_t v887;
  uint64_t v888;
  void *v889;
  const char *v890;
  uint64_t v891;
  uint64_t v892;
  const char *v893;
  uint64_t v894;
  uint64_t v895;
  void *v896;
  const char *v897;
  uint64_t v898;
  uint64_t v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  void *v904;
  const char *v905;
  uint64_t v906;
  uint64_t v907;
  const char *v908;
  uint64_t v909;
  uint64_t v910;
  uint64_t v911;
  void *v912;
  NSObject *v913;
  id v914;
  const char *v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  uint64_t v920;
  void *v921;
  const char *v922;
  uint64_t v923;
  uint64_t v924;
  uint64_t v925;
  void *v926;
  const char *v927;
  uint64_t v928;
  uint64_t v929;
  const char *v930;
  uint64_t v931;
  uint64_t v932;
  uint64_t v933;
  void *v934;
  const char *v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  void *v939;
  const char *v940;
  uint64_t v941;
  uint64_t v942;
  const char *v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  uint64_t v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  void *v955;
  const char *v956;
  uint64_t v957;
  uint64_t v958;
  const char *v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  void *v963;
  const char *v964;
  uint64_t v965;
  uint64_t v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  void *v971;
  _BOOL4 v972;
  const char *v973;
  uint64_t v974;
  uint64_t v975;
  uint64_t v976;
  void *v977;
  void **v978;
  void *v979;
  const char *v980;
  uint64_t v981;
  uint64_t v982;
  const char *v983;
  uint64_t v984;
  uint64_t v985;
  uint64_t v986;
  void *v987;
  const char *v988;
  uint64_t v989;
  uint64_t v990;
  const char *v991;
  uint64_t v992;
  uint64_t v993;
  uint64_t v994;
  void *v995;
  const char *v996;
  uint64_t v997;
  uint64_t v998;
  const char *v999;
  uint64_t v1000;
  uint64_t v1001;
  uint64_t v1002;
  void *v1003;
  const char *v1004;
  uint64_t v1005;
  uint64_t v1006;
  uint64_t v1007;
  void *v1008;
  const char *v1009;
  uint64_t v1010;
  uint64_t v1011;
  void *v1012;
  const char *v1013;
  uint64_t v1014;
  uint64_t v1015;
  void *v1016;
  NSObject *v1017;
  id v1018;
  const char *v1019;
  uint64_t v1020;
  uint64_t v1021;
  uint64_t v1022;
  void *v1023;
  const char *v1024;
  uint64_t v1025;
  uint64_t v1026;
  uint64_t v1027;
  uint64_t v1028;
  const char *v1029;
  uint64_t v1030;
  uint64_t v1031;
  uint64_t v1032;
  void *v1033;
  const char *v1034;
  uint64_t v1035;
  uint64_t v1036;
  char *v1037;
  void *v1038;
  NSObject *v1039;
  id v1040;
  const char *v1041;
  uint64_t v1042;
  uint64_t v1043;
  uint64_t v1044;
  void *v1045;
  const char *v1046;
  uint64_t v1047;
  uint64_t v1048;
  uint64_t v1049;
  uint64_t v1050;
  const char *v1051;
  uint64_t v1052;
  uint64_t v1053;
  uint64_t v1054;
  void *v1055;
  const char *v1056;
  uint64_t v1057;
  uint64_t v1058;
  char *v1059;
  void *v1060;
  NSObject *v1061;
  id v1062;
  const char *v1063;
  uint64_t v1064;
  uint64_t v1065;
  uint64_t v1066;
  void *v1067;
  const char *v1068;
  uint64_t v1069;
  uint64_t v1070;
  uint64_t v1071;
  uint64_t v1072;
  const char *v1073;
  uint64_t v1074;
  uint64_t v1075;
  uint64_t v1076;
  void *v1077;
  const char *v1078;
  uint64_t v1079;
  uint64_t v1080;
  char *v1081;
  void *v1082;
  NSObject *v1083;
  id v1084;
  const char *v1085;
  uint64_t v1086;
  uint64_t v1087;
  uint64_t v1088;
  void *v1089;
  const char *v1090;
  uint64_t v1091;
  uint64_t v1092;
  uint64_t v1093;
  uint64_t v1094;
  const char *v1095;
  uint64_t v1096;
  uint64_t v1097;
  uint64_t v1098;
  void *v1099;
  const char *v1100;
  uint64_t v1101;
  uint64_t v1102;
  char *v1103;
  int *v1104;
  int *v1105;
  int *v1106;
  uint64_t v1107;
  uint64_t v1108;
  uint64_t v1109;
  void *context;
  void *v1111;
  void *v1112;
  uint64_t v1113;
  void *v1114;
  void *v1115;
  void *v1116;
  void *v1117;
  void *v1118;
  void *v1119;
  id v1120;
  void *v1121;
  void *v1122;
  unint64_t v1123;
  uint64_t v1124;
  void *v1125;
  void *v1126;
  void *v1127;
  void *v1128;
  uint64_t k;
  void *v1130;
  char v1131;
  void *v1132;
  void *v1133;
  void *v1134;
  void *v1135;
  void *v1136;
  void *v1137;
  void *v1138;
  id v1139;
  void *v1140;
  void *v1141;
  void *v1142;
  uint64_t v1143;
  uint64_t v1144;
  void *v1145;
  void *v1146;
  id obj;
  void *v1148;
  void *v1149;
  void *v1150;
  void *v1151;
  void *v1152;
  uint64_t m;
  char *v1154;
  void *v1155;
  void *v1156;
  CWFAutoJoinManager *v1157;
  void *v1158;
  void *v1159;
  void *v1160;
  void *v1161;
  void *v1162;
  __int128 v1163;
  __int128 v1164;
  __int128 v1165;
  __int128 v1166;
  __int128 v1167;
  __int128 v1168;
  __int128 v1169;
  __int128 v1170;
  __int128 v1171;
  __int128 v1172;
  __int128 v1173;
  __int128 v1174;
  __int128 v1175;
  __int128 v1176;
  __int128 v1177;
  __int128 v1178;
  __int128 v1179;
  __int128 v1180;
  __int128 v1181;
  __int128 v1182;
  __int128 v1183;
  __int128 v1184;
  __int128 v1185;
  __int128 v1186;
  __int128 v1187;
  __int128 v1188;
  __int128 v1189;
  __int128 v1190;
  int v1191;
  uint64_t v1192;
  __int16 v1193;
  const char *v1194;
  __int16 v1195;
  const char *v1196;
  __int16 v1197;
  uint64_t v1198;
  __int16 v1199;
  uint64_t v1200;
  __int16 v1201;
  void *v1202;
  __int16 v1203;
  void *v1204;
  __int16 v1205;
  void *v1206;
  __int16 v1207;
  void *v1208;
  __int16 v1209;
  void *v1210;
  _BYTE v1211[128];
  _BYTE v1212[128];
  _BYTE v1213[128];
  _BYTE v1214[128];
  void *v1215;
  _BYTE v1216[128];
  _BYTE v1217[128];
  _BYTE v1218[128];
  _QWORD v1219[4];

  v1219[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1B5E0A33C]();
  v1157 = self;
  objc_msgSend___updateAutoJoinState_(self, v5, 1, v6, v7);
  v1162 = v4;
  objc_msgSend_knownNetworks(v4, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_mutableCopy(v12, v13, v14, v15, v16);

  objc_msgSend___sortKnownNetworks_(v1157, v18, v17, v19, v20);
  v1158 = (void *)v17;
  objc_msgSend_setKnownNetworks_(v1162, v21, v17, v22, v23);
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v24, v25, v26, v27);
  v1152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v28, v29, v30, v31);
  v1138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v32, v33, v34, v35);
  v1141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v36, v37, v38, v39);
  v1140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v40, v41, v42, v43);
  v1137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v44, v45, v46, v47);
  v1136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v48, v49, v50, v51);
  v1142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v52, v53, v54, v55);
  v1161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v56, (uint64_t)CFSTR("channel"), 1, v57);
  v1119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedChannels(v1157, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v1219[0] = v1119;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v63, (uint64_t)v1219, 1, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v62, v66, (uint64_t)v65, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v1189 = 0u;
  v1190 = 0u;
  v1187 = 0u;
  v1188 = 0u;
  obj = v69;
  v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v1187, (uint64_t)v1218, 16);
  if (!v75)
    goto LABEL_28;
  v76 = *(_QWORD *)v1188;
  do
  {
    for (i = 0; i != v75; ++i)
    {
      if (*(_QWORD *)v1188 != v76)
        objc_enumerationMutation(obj);
      v78 = *(void **)(*((_QWORD *)&v1187 + 1) + 8 * i);
      objc_msgSend_autoJoinParameters(v1162, v71, v72, v73, v74);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v79, v80, v81, v82, v83) == 54)
      {

      }
      else
      {
        objc_msgSend_autoJoinParameters(v1162, v84, v85, v86, v87);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend_trigger(v89, v90, v91, v92, v93) == 55;

        if (!v94)
          goto LABEL_10;
      }
      if (!objc_msgSend_is5GHz(v78, v71, v88, v73, v74))
        continue;
LABEL_10:
      objc_msgSend___basicChannelRepresentation_(v1157, v71, (uint64_t)v78, v73, v74);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v1161, v96, (uint64_t)v95, v97, v98);
      if (objc_msgSend_is2GHz(v78, v99, v100, v101, v102))
      {
        v111 = objc_msgSend_channel(v78, v103, v104, v105, v106);
        v112 = v1152;
        if (v111 != 1)
        {
          v114 = objc_msgSend_channel(v78, v107, v108, v109, v110);
          v112 = v1152;
          if (v114 != 6)
          {
            if (objc_msgSend_channel(v78, v107, v113, v109, v110) == 11)
              objc_msgSend_addObject_(v1152, v115, (uint64_t)v95, v116, v117);
            else
              objc_msgSend_addObject_(v1138, v115, (uint64_t)v95, v116, v117);
            goto LABEL_25;
          }
        }
        goto LABEL_24;
      }
      if (objc_msgSend_is5GHz(v78, v103, v104, v105, v106))
      {
        if (objc_msgSend_isDFS(v78, v118, v119, v120, v121))
          objc_msgSend_addObject_(v1140, v122, (uint64_t)v95, v123, v124);
        else
          objc_msgSend_addObject_(v1141, v122, (uint64_t)v95, v123, v124);
        goto LABEL_25;
      }
      v126 = objc_msgSend_is6GHz(v78, v118, v119, v120, v121);
      v112 = v1142;
      if (!v126)
        goto LABEL_24;
      if (!objc_msgSend_is6GHzPSC(v78, v107, v125, v109, v110))
      {
        v112 = v1136;
LABEL_24:
        objc_msgSend_addObject_(v112, v107, (uint64_t)v95, v109, v110);
        goto LABEL_25;
      }
      objc_msgSend_addObject_(v1137, v107, (uint64_t)v95, v109, v110);
LABEL_25:

    }
    v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v1187, (uint64_t)v1218, 16);
  }
  while (v75);
LABEL_28:

  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v127, v128, v129, v130);
  v1145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v131, v132, v133, v134);
  v1130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v135, v136, v137, v138);
  v1126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v139, v140, v141, v142);
  v1121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v143, v144, v145, v146);
  v1114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v147, v148, v149, v150);
  v1115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v151, v152, v153, v154);
  v1125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v155, v156, v157, v158);
  v1118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v159, v160, v161, v162);
  v1117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v163, v164, v165, v166);
  v1122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v167, v168, v169, v170);
  v1111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v171, v172, v173, v174);
  v1112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v175, v176, v177, v178);
  v1116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_location(v1157, v179, v180, v181, v182);
  v1146 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    CWFGetOSLog();
    v184 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v184 = MEMORY[0x1E0C81028];
    v185 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
  {
    v190 = objc_msgSend_maxBSSChannelAge(v1162, v186, v187, v188, v189);
    objc_msgSend_minBSSLocationAccuracy(v1162, v191, v192, v193, v194);
    v196 = v195;
    objc_msgSend_maxBSSLocationDistance(v1162, v197, v198, v199, v200);
    v202 = v201;
    v207 = objc_msgSend_maxBSSChannelCount(v1162, v203, v204, v205, v206);
    v212 = objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v208, v209, v210, v211);
    objc_msgSend_description(v1146, v213, v214, v215, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v217, v218, v219, v220, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_autoJoinParameters(v1162, v223, v224, v225, v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredChannels(v227, v228, v229, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v1191 = 134219522;
    v1192 = v190;
    v1193 = 2048;
    v1194 = v196;
    v1195 = 2048;
    v1196 = v202;
    v1197 = 2048;
    v1198 = v207;
    v1199 = 2048;
    v1200 = v212;
    v1201 = 2114;
    v1202 = v222;
    v1203 = 2114;
    v1204 = v232;
    LODWORD(v1107) = 72;
    v1104 = &v1191;
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v233, v234, v235, v236);
  v238 = v237;
  v1185 = 0u;
  v1186 = 0u;
  v1183 = 0u;
  v1184 = 0u;
  objc_msgSend_autoJoinParameters(v1162, v239, v240, v241, v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredChannels(v243, v244, v245, v246, v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();

  v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v249, (uint64_t)&v1183, (uint64_t)v1217, 16);
  if (v253)
  {
    v254 = *(_QWORD *)v1184;
    v255 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v253; ++j)
      {
        if (*(_QWORD *)v1184 != v254)
          objc_enumerationMutation(v248);
        objc_msgSend___basicChannelRepresentation_(v1157, v250, *(_QWORD *)(*((_QWORD *)&v1183 + 1) + 8 * j), v251, v252, v1104, v1107);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_containsObject_(v1161, v258, (uint64_t)v257, v259, v260))
        {
          objc_msgSend_addObject_(v1145, v261, (uint64_t)v257, v262, v263);
        }
        else
        {
          CWFGetOSLog();
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          if (v264)
          {
            CWFGetOSLog();
            v265 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v266 = v255;
            v265 = v255;
          }

          if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
          {
            v1191 = 138543362;
            v1192 = (uint64_t)v257;
            LODWORD(v1107) = 12;
            v1104 = &v1191;
            _os_log_send_and_compose_impl();
          }

        }
      }
      v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v248, v250, (uint64_t)&v1183, (uint64_t)v1217, 16);
    }
    while (v253);
  }

  objc_msgSend_array(v1145, v267, v268, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v1130, v272, (uint64_t)v271, v273, v274);

  v1181 = 0u;
  v1182 = 0u;
  v1179 = 0u;
  v1180 = 0u;
  v1120 = v1158;
  v1124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1120, v275, (uint64_t)&v1179, (uint64_t)v1216, 16);
  if (v1124)
  {
    v1123 = 0;
    v1113 = *(_QWORD *)v1180;
    while (1)
    {
      for (k = 0; k != v1124; ++k)
      {
        if (*(_QWORD *)v1180 != v1113)
          objc_enumerationMutation(v1120);
        v1159 = *(void **)(*((_QWORD *)&v1179 + 1) + 8 * k);
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v276, v277, v278, v279, v1104, v1107);
        v1133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v280, v281, v282, v283);
        v1151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v284, v285, v286, v287);
        v1150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v288, v289, v290, v291);
        v1135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v292, v293, v294, v295);
        v1132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v296, v297, v298, v299);
        v1149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v300, v301, v302, v303);
        v1148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v304, v305, v306, v307);
        v1134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_BSSList(v1159, v308, v309, v310, v311);
        v1127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v312, (uint64_t)CFSTR("lastAssociatedAt"), 0, v313);
        v1128 = (void *)objc_claimAutoreleasedReturnValue();
        v1215 = v1128;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v314, (uint64_t)&v1215, 1, v315);
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedArrayUsingDescriptors_(v1127, v317, (uint64_t)v316, v318, v319);
        v320 = (void *)objc_claimAutoreleasedReturnValue();

        v1177 = 0u;
        v1178 = 0u;
        v1175 = 0u;
        v1176 = 0u;
        v1139 = v320;
        v1144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1139, v321, (uint64_t)&v1175, (uint64_t)v1214, 16);
        if (!v1144)
        {
          v1131 = 0;
          goto LABEL_162;
        }
        v1131 = 0;
        v1143 = *(_QWORD *)v1176;
        do
        {
          for (m = 0; m != v1144; ++m)
          {
            if (*(_QWORD *)v1176 != v1143)
              objc_enumerationMutation(v1139);
            v1160 = *(void **)(*((_QWORD *)&v1175 + 1) + 8 * m);
            objc_msgSend_location(v1160, v322, v323, v324, v325);
            v1155 = (void *)objc_claimAutoreleasedReturnValue();
            if (v1155)
              v330 = v1146 != 0;
            else
              v330 = 0;
            if (!v330)
              goto LABEL_67;
            objc_msgSend_horizontalAccuracy(v1146, v326, v327, v328, v329);
            if (v331 < 0.0)
              goto LABEL_67;
            objc_msgSend_horizontalAccuracy(v1146, v326, v327, v328, v329);
            v333 = v332;
            objc_msgSend_minBSSLocationAccuracy(v1162, v334, v335, v336, v337);
            if (v333 > v338)
              goto LABEL_67;
            objc_msgSend_horizontalAccuracy(v1155, v326, v327, v328, v329);
            if (v339 >= 0.0
              && (objc_msgSend_horizontalAccuracy(v1155, v326, v327, v328, v329),
                  v341 = v340,
                  objc_msgSend_minBSSLocationAccuracy(v1162, v342, v343, v344, v345),
                  v341 <= v346)
              && (objc_msgSend_distanceFromLocation_(v1155, v326, (uint64_t)v1146, v328, v329),
                  v348 = v347,
                  objc_msgSend_maxBSSLocationDistance(v1162, v349, v350, v351, v352),
                  v348 <= v353))
            {
              v354 = 1;
              v1131 = 1;
            }
            else
            {
LABEL_67:
              v354 = 0;
            }
            objc_msgSend_channel(v1160, v326, v327, v328, v329, v1105, v1108);
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            v1156 = (void *)objc_msgSend_copy(v355, v356, v357, v358, v359);

            if (v1156)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v360, v361, v362, v363);
              v364 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___basicChannelRepresentation_(v1157, v365, (uint64_t)v1156, v366, v367);
              v1154 = (char *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_is6GHz(v1154, v368, v369, v370, v371))
              {
                objc_msgSend_colocated2GHzRNRChannel(v1160, v372, v373, v374, v375);
                v380 = (void *)objc_claimAutoreleasedReturnValue();
                if (v380)
                {
                  objc_msgSend___basicChannelRepresentation_(v1157, v376, (uint64_t)v380, v378, v379);
                  v381 = (void *)objc_claimAutoreleasedReturnValue();
                  CWFGetOSLog();
                  v382 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v382)
                  {
                    CWFGetOSLog();
                    v383 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v383 = MEMORY[0x1E0C81028];
                    v384 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v383, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend_identifier(v1159, v385, v386, v387, v388);
                    v389 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_redactedForWiFi(v389, v390, v391, v392, v393);
                    v394 = (char *)objc_claimAutoreleasedReturnValue();
                    v1191 = 138543874;
                    v1192 = (uint64_t)v381;
                    v1193 = 2114;
                    v1194 = v1154;
                    v1195 = 2114;
                    v1196 = v394;
                    LODWORD(v1108) = 32;
                    v1105 = &v1191;
                    _os_log_send_and_compose_impl();

                  }
                  objc_msgSend_addObject_(v364, v395, (uint64_t)v381, v396, v397);

                }
                objc_msgSend_colocated5GHzRNRChannel(v1160, v376, v377, v378, v379, v1105, v1108);
                v401 = (void *)objc_claimAutoreleasedReturnValue();
                if (v401)
                {
                  objc_msgSend___basicChannelRepresentation_(v1157, v398, (uint64_t)v401, v399, v400);
                  v402 = (void *)objc_claimAutoreleasedReturnValue();
                  CWFGetOSLog();
                  v403 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v403)
                  {
                    CWFGetOSLog();
                    v404 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v404 = MEMORY[0x1E0C81028];
                    v405 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v404, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend_identifier(v1159, v406, v407, v408, v409);
                    v410 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_redactedForWiFi(v410, v411, v412, v413, v414);
                    v415 = (char *)objc_claimAutoreleasedReturnValue();
                    v1191 = 138543874;
                    v1192 = (uint64_t)v402;
                    v1193 = 2114;
                    v1194 = v1154;
                    v1195 = 2114;
                    v1196 = v415;
                    LODWORD(v1108) = 32;
                    v1105 = &v1191;
                    _os_log_send_and_compose_impl();

                  }
                  objc_msgSend_addObject_(v364, v416, (uint64_t)v402, v417, v418);

                }
              }
              objc_msgSend_addObject_(v364, v372, (uint64_t)v1154, v374, v375, v1105, v1108);
              if (!objc_msgSend_isCarPlay(v1159, v419, v420, v421, v422)
                || !objc_msgSend_is5GHz(v1154, v423, v424, v425, v426)
                || !objc_msgSend_includeAdjacent5GHzChannel(v1162, v427, v428, v429, v430))
              {
                goto LABEL_114;
              }
              v435 = objc_msgSend_channel(v1154, v431, v432, v433, v434);
              if (v435 > 148)
              {
                if (v435 > 156)
                {
                  if (v435 == 157)
                  {
                    v440 = 161;
                  }
                  else
                  {
                    if (v435 != 161)
                      goto LABEL_114;
                    v440 = 157;
                  }
                }
                else if (v435 == 149)
                {
                  v440 = 153;
                }
                else
                {
                  if (v435 != 153)
                    goto LABEL_114;
                  v440 = 149;
                }
              }
              else if (v435 > 43)
              {
                if (v435 == 44)
                {
                  v440 = 48;
                }
                else
                {
                  if (v435 != 48)
                    goto LABEL_114;
                  v440 = 44;
                }
              }
              else
              {
                if (v435 != 36)
                {
                  if (v435 == 40)
                  {
                    v440 = 36;
                    goto LABEL_108;
                  }
LABEL_114:
                  v1173 = 0u;
                  v1174 = 0u;
                  v1171 = 0u;
                  v1172 = 0u;
                  v461 = v364;
                  v466 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v462, (uint64_t)&v1171, (uint64_t)v1213, 16);
                  if (!v466)
                    goto LABEL_157;
                  v467 = *(_QWORD *)v1172;
                  if (v354)
                    v468 = v1135;
                  else
                    v468 = v1134;
                  if (v354)
                    v469 = v1133;
                  else
                    v469 = v1132;
                  while (2)
                  {
                    v470 = 0;
LABEL_122:
                    if (*(_QWORD *)v1172 != v467)
                      objc_enumerationMutation(v461);
                    v471 = *(void **)(*((_QWORD *)&v1171 + 1) + 8 * v470);
                    if (objc_msgSend_containsObject_(v1161, v463, (uint64_t)v471, v464, v465, v1105, v1108))
                    {
                      if (objc_msgSend_is6GHz(v471, v472, v473, v474, v475))
                      {
                        if ((_os_feature_enabled_impl() & 1) != 0)
                        {
                          if ((_os_feature_enabled_impl() & 1) != 0
                            || (objc_msgSend_is6GHzPSC(v471, v480, v481, v482, v483) & 1) != 0)
                          {
                            if ((objc_msgSend_include6GHzChannels(v1162, v480, v481, v482, v483) & 1) != 0)
                              goto LABEL_130;
                            CWFGetOSLog();
                            v517 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v517)
                            {
                              CWFGetOSLog();
                              v500 = (id)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v500 = MEMORY[0x1E0C81028];
                              v524 = MEMORY[0x1E0C81028];
                            }

                            if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                            {
LABEL_155:
                              objc_msgSend_identifier(v1159, v520, v521, v522, v523);
                              v526 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_redactedForWiFi(v526, v527, v528, v529, v530);
                              v531 = (char *)objc_claimAutoreleasedReturnValue();
                              v1191 = 138543618;
                              v1192 = (uint64_t)v471;
                              v1193 = 2114;
                              v1194 = v531;
                              LODWORD(v1108) = 22;
                              v1105 = &v1191;
                              _os_log_send_and_compose_impl();

                            }
                          }
                          else
                          {
                            CWFGetOSLog();
                            v518 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v518)
                            {
                              CWFGetOSLog();
                              v500 = (id)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v500 = MEMORY[0x1E0C81028];
                              v525 = MEMORY[0x1E0C81028];
                            }

                            if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                              goto LABEL_155;
                          }
                        }
                        else
                        {
                          CWFGetOSLog();
                          v516 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v516)
                          {
                            CWFGetOSLog();
                            v500 = (id)objc_claimAutoreleasedReturnValue();

                          }
                          else
                          {
                            v500 = MEMORY[0x1E0C81028];
                            v519 = MEMORY[0x1E0C81028];
                          }

                          if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                            goto LABEL_155;
                        }
                      }
                      else
                      {
LABEL_130:
                        if (!objc_msgSend_maxBSSChannelAge(v1162, v476, v477, v478, v479)
                          || (objc_msgSend_lastAssociatedAt(v1160, v484, v485, v486, v487),
                              v488 = (void *)objc_claimAutoreleasedReturnValue(),
                              objc_msgSend_timeIntervalSinceReferenceDate(v488, v489, v490, v491, v492),
                              v498 = v238 - v497 > (double)(unint64_t)objc_msgSend_maxBSSChannelAge(v1162, v493, v494, v495, v496), v488, v499 = v468, !v498))
                        {
                          v499 = v469;
                        }
                        v500 = v499;
                        objc_msgSend_addObject_(v500, v501, (uint64_t)v471, v502, v503);
                      }
                    }
                    else
                    {
                      CWFGetOSLog();
                      v504 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v504)
                      {
                        CWFGetOSLog();
                        v500 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v500 = MEMORY[0x1E0C81028];
                        v505 = MEMORY[0x1E0C81028];
                      }

                      if (os_log_type_enabled(v500, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend_identifier(v1159, v506, v507, v508, v509);
                        v510 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_redactedForWiFi(v510, v511, v512, v513, v514);
                        v515 = (void *)objc_claimAutoreleasedReturnValue();
                        v1191 = 138543618;
                        v1192 = (uint64_t)v515;
                        v1193 = 2114;
                        v1194 = (const char *)v471;
                        LODWORD(v1108) = 22;
                        v1105 = &v1191;
                        _os_log_send_and_compose_impl();

                      }
                    }

                    if (v466 == ++v470)
                    {
                      v532 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v463, (uint64_t)&v1171, (uint64_t)v1213, 16);
                      v466 = v532;
                      if (!v532)
                      {
LABEL_157:

                        goto LABEL_158;
                      }
                      continue;
                    }
                    goto LABEL_122;
                  }
                }
                v440 = 40;
              }
LABEL_108:
              v441 = (void *)objc_msgSend_copy(v1154, v436, v437, v438, v439);
              objc_msgSend_setChannel_(v441, v442, v440, v443, v444);
              objc_msgSend_addObject_(v364, v445, (uint64_t)v441, v446, v447);
              CWFGetOSLog();
              v448 = (void *)objc_claimAutoreleasedReturnValue();
              if (v448)
              {
                CWFGetOSLog();
                v449 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v449 = MEMORY[0x1E0C81028];
                v450 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v449, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend_identifier(v1159, v451, v452, v453, v454);
                v455 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_redactedForWiFi(v455, v456, v457, v458, v459);
                v460 = (char *)objc_claimAutoreleasedReturnValue();
                v1191 = 138543618;
                v1192 = (uint64_t)v441;
                v1193 = 2114;
                v1194 = v460;
                LODWORD(v1108) = 22;
                v1105 = &v1191;
                _os_log_send_and_compose_impl();

              }
              goto LABEL_114;
            }
LABEL_158:

          }
          v1144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1139, v322, (uint64_t)&v1175, (uint64_t)v1214, 16);
        }
        while (v1144);
LABEL_162:

        v1169 = 0u;
        v1170 = 0u;
        v1167 = 0u;
        v1168 = 0u;
        v533 = v1133;
        v535 = 0;
        v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v534, (uint64_t)&v1167, (uint64_t)v1212, 16);
        if (v540)
        {
          v541 = *(_QWORD *)v1168;
          do
          {
            for (n = 0; n != v540; ++n)
            {
              if (*(_QWORD *)v1168 != v541)
                objc_enumerationMutation(v533);
              v543 = *(_QWORD *)(*((_QWORD *)&v1167 + 1) + 8 * n);
              if (v535 + n >= (unint64_t)objc_msgSend_maxBSSChannelCount(v1162, v536, v537, v538, v539, v1105, v1108))objc_msgSend_addObject_(v1150, v544, v543, v545, v546);
              else
                objc_msgSend_addObject_(v1151, v544, v543, v545, v546);
            }
            v535 += v540;
            v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v533, v536, (uint64_t)&v1167, (uint64_t)v1212, 16);
          }
          while (v540);
        }

        v1165 = 0u;
        v1166 = 0u;
        v1163 = 0u;
        v1164 = 0u;
        v547 = v1132;
        v553 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v548, (uint64_t)&v1163, (uint64_t)v1211, 16);
        if (v553)
        {
          v554 = *(_QWORD *)v1164;
          do
          {
            for (ii = 0; ii != v553; ++ii)
            {
              if (*(_QWORD *)v1164 != v554)
                objc_enumerationMutation(v547);
              v556 = *(_QWORD *)(*((_QWORD *)&v1163 + 1) + 8 * ii);
              if (v535 + ii >= (unint64_t)objc_msgSend_maxBSSChannelCount(v1162, v549, v550, v551, v552, v1105, v1108))objc_msgSend_addObject_(v1148, v557, v556, v558, v559);
              else
                objc_msgSend_addObject_(v1149, v557, v556, v558, v559);
            }
            v535 += v553;
            v553 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v549, (uint64_t)&v1163, (uint64_t)v1211, 16);
          }
          while (v553);
        }

        objc_msgSend_array(v1151, v560, v561, v562, v563);
        v564 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1125, v565, (uint64_t)v564, v566, v567);

        objc_msgSend_array(v1150, v568, v569, v570, v571);
        v572 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1118, v573, (uint64_t)v572, v574, v575);

        objc_msgSend_array(v1135, v576, v577, v578, v579);
        v580 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1117, v581, (uint64_t)v580, v582, v583);

        objc_msgSend_array(v1149, v584, v585, v586, v587);
        v588 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1121, v589, (uint64_t)v588, v590, v591);

        objc_msgSend_array(v1148, v592, v593, v594, v595);
        v596 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1114, v597, (uint64_t)v596, v598, v599);

        objc_msgSend_array(v1134, v600, v601, v602, v603);
        v604 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1115, v605, (uint64_t)v604, v606, v607);

        objc_msgSend_networkName(v1159, v608, v609, v610, v611);
        v616 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v616)
        {
          v617 = "no";
          goto LABEL_197;
        }
        v617 = "no";
        if ((objc_msgSend_isPasspoint(v1159, v612, v613, v614, v615) & 1) == 0)
        {
          if (objc_msgSend_hiddenState(v1159, v612, v613, v614, v615) != 2)
            goto LABEL_276;
          objc_msgSend_wasHiddenBefore(v1159, v612, v613, v614, v615);
          v618 = (void *)objc_claimAutoreleasedReturnValue();
          if (v618)
          {
            objc_msgSend_wasHiddenBefore(v1159, v612, v613, v614, v615);
            v619 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceReferenceDate(v619, v620, v621, v622, v623);
            v625 = v624 < 604800.0;

            if (v625)
            {
LABEL_276:
              if (objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v612, v613, v614, v615, v1105, v1108))
              {
                objc_msgSend_lastJoinedAt(v1159, v612, v626, v614, v615);
                v627 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSinceReferenceDate(v627, v628, v629, v630, v631);
                v633 = v632;
                if (v238 - v632 <= (double)(unint64_t)objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v634, v635, v636, v637))
                {

                }
                else
                {
                  objc_msgSend_lastDiscoveredAt(v1159, v638, v639, v640, v641, v238 - v633);
                  v642 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_timeIntervalSinceReferenceDate(v642, v643, v644, v645, v646);
                  v652 = v238 - v651 > (double)(unint64_t)objc_msgSend_maxHiddenKnownNetworkSSIDAge(v1162, v647, v648, v649, v650);

                  if (v652)
                    goto LABEL_197;
                }
              }
              if ((v1131 & 1) != 0)
                objc_msgSend_addObject_(v1112, v612, (uint64_t)v616, v614, v615);
              else
                objc_msgSend_addObject_(v1111, v612, (uint64_t)v616, v614, v615);
              v617 = "yes";
            }
          }
        }
LABEL_197:
        objc_msgSend_set(MEMORY[0x1E0C99E20], v612, v613, v614, v615, v1105, v1108);
        v653 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isPasspoint(v1159, v654, v655, v656, v657))
        {
          objc_msgSend_domainName(v1159, v658, v659, v660, v661);
          v662 = (void *)objc_claimAutoreleasedReturnValue();

          if (v662)
            objc_msgSend_addObject_(v653, v663, (uint64_t)&unk_1E615E8E0, v665, v666);
          objc_msgSend_NAIRealmNameList(v1159, v663, v664, v665, v666);
          v667 = (void *)objc_claimAutoreleasedReturnValue();
          v672 = objc_msgSend_count(v667, v668, v669, v670, v671);

          if (v672)
            objc_msgSend_addObject_(v653, v673, (uint64_t)&unk_1E615E8F8, v675, v676);
          objc_msgSend_roamingConsortiumList(v1159, v673, v674, v675, v676);
          v677 = (void *)objc_claimAutoreleasedReturnValue();
          v682 = objc_msgSend_count(v677, v678, v679, v680, v681);

          if (v682)
            objc_msgSend_addObject_(v653, v683, (uint64_t)&unk_1E615E910, v685, v686);
          objc_msgSend_cellularNetworkInfo(v1159, v683, v684, v685, v686);
          v687 = (void *)objc_claimAutoreleasedReturnValue();
          v692 = objc_msgSend_count(v687, v688, v689, v690, v691);

          if (v692)
            objc_msgSend_addObject_(v653, v693, (uint64_t)&unk_1E615E928, v695, v696);
          objc_msgSend_allObjects(v653, v693, v694, v695, v696);
          v697 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v1116, v698, (uint64_t)v697, v699, v700);

        }
        CWFGetOSLog();
        v701 = (void *)objc_claimAutoreleasedReturnValue();
        if (v701)
        {
          CWFGetOSLog();
          v702 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v702 = MEMORY[0x1E0C81028];
          v703 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v702, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_identifier(v1159, v704, v705, v706, v707);
          v708 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_redactedForWiFi(v708, v709, v710, v711, v712);
          v713 = objc_claimAutoreleasedReturnValue();
          v714 = (void *)v713;
          v1191 = 138545666;
          v715 = "no";
          if ((v1131 & 1) != 0)
            v715 = "yes";
          v1192 = v713;
          v1193 = 2082;
          v1194 = v715;
          v1195 = 2082;
          v1196 = v617;
          v1197 = 2114;
          v1198 = (uint64_t)v1151;
          v1199 = 2114;
          v1200 = (uint64_t)v1150;
          v1201 = 2114;
          v1202 = v1135;
          v1203 = 2114;
          v1204 = v1149;
          v1205 = 2114;
          v1206 = v1148;
          v1207 = 2114;
          v1208 = v1134;
          v1209 = 2114;
          v1210 = v653;
          LODWORD(v1107) = 102;
          v1104 = &v1191;
          _os_log_send_and_compose_impl();

        }
        v1123 += v1131 & 1;
      }
      v1124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1120, v276, (uint64_t)&v1179, (uint64_t)v1216, 16);
      if (!v1124)
        goto LABEL_218;
    }
  }
  v1123 = 0;
LABEL_218:

  if (objc_msgSend_count(v1125, v716, v717, v718, v719)
    || objc_msgSend_count(v1118, v720, v721, v722, v723)
    || objc_msgSend_count(v1117, v720, v724, v722, v723))
  {
    objc_msgSend_setDidUseLocationOptimizedChannelList_(v1157->_metric, v720, 1, v722, v723, v1104, v1107);
  }
  v725 = v1157;
  objc_sync_enter(v725);
  objc_msgSend_parameters(v725[14], v726, v727, v728, v729);
  v730 = (void *)objc_claimAutoreleasedReturnValue();
  v735 = objc_msgSend_mode(v730, v731, v732, v733, v734);

  objc_sync_exit(v725);
  LODWORD(v730) = objc_msgSend_BSSChannelsOnly(v1162, v736, v737, v738, v739);
  objc_msgSend_array(v1125, v740, v741, v742, v743);
  v744 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v1130, v745, (uint64_t)v744, v746, v747);

  if (!(_DWORD)v730)
  {
    objc_msgSend_array(v1118, v748, v749, v750, v751);
    v802 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v803, (uint64_t)v802, v804, v805);

    objc_msgSend_array(v1117, v806, v807, v808, v809);
    v810 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v811, (uint64_t)v810, v812, v813);

    objc_msgSend_array(v1121, v814, v815, v816, v817);
    v818 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v819, (uint64_t)v818, v820, v821);

    objc_msgSend_array(v1114, v822, v823, v824, v825);
    v826 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v827, (uint64_t)v826, v828, v829);

    objc_msgSend_array(v1115, v830, v831, v832, v833);
    v764 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v834, (uint64_t)v764, v835, v836);
    goto LABEL_229;
  }
  objc_msgSend_array(v1121, v748, v749, v750, v751);
  v752 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v1130, v753, (uint64_t)v752, v754, v755);

  if (!objc_msgSend_count(v1130, v756, v757, v758, v759))
  {
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v760, v761, v762, v763);
    v764 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(v1117, v765, v766, v767, v768);
    v769 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v764, v770, (uint64_t)v769, v771, v772);

    objc_msgSend_array(v1115, v773, v774, v775, v776);
    v777 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v764, v778, (uint64_t)v777, v779, v780);

    objc_msgSend_array(v764, v781, v782, v783, v784);
    v785 = (void *)objc_claimAutoreleasedReturnValue();
    v790 = objc_msgSend_count(v764, v786, v787, v788, v789);
    if (v790 >= objc_msgSend_maxBSSChannelCount(v1162, v791, v792, v793, v794))
      v799 = objc_msgSend_maxBSSChannelCount(v1162, v795, v796, v797, v798);
    else
      v799 = objc_msgSend_count(v764, v795, v796, v797, v798);
    objc_msgSend_subarrayWithRange_(v785, v800, 0, v799, v801, v1104, v1107);
    v837 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1130, v838, (uint64_t)v837, v839, v840);

LABEL_229:
  }
  if ((objc_msgSend_BSSChannelsOnly(v1162, v760, v761, v762, v763, v1104, v1107) & 1) == 0)
  {
    objc_msgSend_array(v1152, v841, v842, v843, v844);
    v845 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1126, v846, (uint64_t)v845, v847, v848);

    objc_msgSend_array(v1138, v849, v850, v851, v852);
    v853 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1126, v854, (uint64_t)v853, v855, v856);

    objc_msgSend_array(v1141, v857, v858, v859, v860);
    v861 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1126, v862, (uint64_t)v861, v863, v864);

    objc_msgSend_array(v1140, v865, v866, v867, v868);
    v869 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1126, v870, (uint64_t)v869, v871, v872);

    if (objc_msgSend_include6GHzChannels(v1162, v873, v874, v875, v876))
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend_array(v1137, v877, v878, v879, v880);
        v881 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v1126, v882, (uint64_t)v881, v883, v884);

        if (_os_feature_enabled_impl())
        {
          objc_msgSend_array(v1136, v877, v878, v879, v880);
          v885 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v1126, v886, (uint64_t)v885, v887, v888);

        }
      }
    }
    objc_msgSend_array(v1142, v877, v878, v879, v880);
    v889 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v1126, v890, (uint64_t)v889, v891, v892);

    objc_msgSend_minusOrderedSet_(v1126, v893, (uint64_t)v1130, v894, v895);
  }
  objc_msgSend_array(v1112, v841, v842, v843, v844);
  v896 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v1122, v897, (uint64_t)v896, v898, v899);

  objc_msgSend_array(v1111, v900, v901, v902, v903);
  v904 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v1122, v905, (uint64_t)v904, v906, v907);

  if (v735 == 1 && v1123 >= 2)
  {
    CWFGetOSLog();
    v912 = (void *)objc_claimAutoreleasedReturnValue();
    if (v912)
    {
      CWFGetOSLog();
      v913 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v913 = MEMORY[0x1E0C81028];
      v914 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v913, OS_LOG_TYPE_DEFAULT))
    {
      v1191 = 67109120;
      LODWORD(v1192) = 4;
      LODWORD(v1109) = 8;
      v1106 = &v1191;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_setMaxScanChannelCount_(v1162, v915, 4, v916, v917);
    objc_msgSend_setDidDetectColocatedNetworkEnvironment_(v725[18], v918, 1, v919, v920);
  }
  objc_msgSend_array(v1130, v908, v909, v910, v911, v1106, v1109);
  v921 = (void *)objc_claimAutoreleasedReturnValue();
  v926 = (void *)objc_msgSend_copy(v921, v922, v923, v924, v925);
  objc_msgSend_setRecentChannelList_(v1162, v927, (uint64_t)v926, v928, v929);

  objc_msgSend_array(v1126, v930, v931, v932, v933);
  v934 = (void *)objc_claimAutoreleasedReturnValue();
  v939 = (void *)objc_msgSend_copy(v934, v935, v936, v937, v938);
  objc_msgSend_setRemainingChannelList_(v1162, v940, (uint64_t)v939, v941, v942);

  if ((objc_msgSend_passiveScan(v1162, v943, v944, v945, v946) & 1) == 0)
  {
    if (objc_msgSend_count(v1122, v947, v948, v949, v950))
    {
      objc_msgSend_array(v1122, v951, v952, v953, v954);
      v955 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSSIDList_(v1162, v956, (uint64_t)v955, v957, v958);

    }
    else
    {
      objc_msgSend_setSSIDList_(v1162, v951, 0, v953, v954);
    }
  }
  if (objc_msgSend_count(v1116, v947, v948, v949, v950))
  {
    objc_msgSend_allObjects(v1116, v959, v960, v961, v962);
    v963 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setANQPElementIDList_(v1162, v964, (uint64_t)v963, v965, v966);

  }
  else
  {
    objc_msgSend_setANQPElementIDList_(v1162, v959, 0, v961, v962);
  }
  objc_msgSend_optimizedChannelList(v725[18], v967, v968, v969, v970);
  v971 = (void *)objc_claimAutoreleasedReturnValue();
  v972 = v971 == 0;

  if (v972)
  {
    objc_msgSend_array(v1145, v973, v974, v975, v976);
    v977 = (void *)objc_claimAutoreleasedReturnValue();
    v979 = v725[18];
    v978 = v725 + 18;
    objc_msgSend_setPreferredChannelList_(v979, v980, (uint64_t)v977, v981, v982);

    objc_msgSend_recentChannelList(v1162, v983, v984, v985, v986);
    v987 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecentChannelList_(*v978, v988, (uint64_t)v987, v989, v990);

    objc_msgSend_remainingChannelList(v1162, v991, v992, v993, v994);
    v995 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemainingChannelList_(*v978, v996, (uint64_t)v995, v997, v998);

    objc_msgSend_recentChannelList(v1162, v999, v1000, v1001, v1002);
    v1003 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remainingChannelList(v1162, v1004, v1005, v1006, v1007);
    v1008 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v1003, v1009, (uint64_t)v1008, v1010, v1011);
    v1012 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOptimizedChannelList_(*v978, v1013, (uint64_t)v1012, v1014, v1015);

  }
  CWFGetOSLog();
  v1016 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1016)
  {
    CWFGetOSLog();
    v1017 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1017 = MEMORY[0x1E0C81028];
    v1018 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v1017, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_SSIDList(v1162, v1019, v1020, v1021, v1022);
    v1023 = (void *)objc_claimAutoreleasedReturnValue();
    v1028 = objc_msgSend_count(v1023, v1024, v1025, v1026, v1027);
    objc_msgSend_SSIDList(v1162, v1029, v1030, v1031, v1032);
    v1033 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v1033, v1034, (uint64_t)CFSTR(", "), v1035, v1036);
    v1037 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v1191 = 134218242;
    v1192 = v1028;
    v1193 = 2114;
    v1194 = v1037;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v1038 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1038)
  {
    CWFGetOSLog();
    v1039 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1039 = MEMORY[0x1E0C81028];
    v1040 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v1039, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ANQPElementIDList(v1162, v1041, v1042, v1043, v1044);
    v1045 = (void *)objc_claimAutoreleasedReturnValue();
    v1050 = objc_msgSend_count(v1045, v1046, v1047, v1048, v1049);
    objc_msgSend_ANQPElementIDList(v1162, v1051, v1052, v1053, v1054);
    v1055 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v1055, v1056, (uint64_t)CFSTR(", "), v1057, v1058);
    v1059 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v1191 = 134218242;
    v1192 = v1050;
    v1193 = 2114;
    v1194 = v1059;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v1060 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1060)
  {
    CWFGetOSLog();
    v1061 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1061 = MEMORY[0x1E0C81028];
    v1062 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v1061, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_recentChannelList(v1162, v1063, v1064, v1065, v1066);
    v1067 = (void *)objc_claimAutoreleasedReturnValue();
    v1072 = objc_msgSend_count(v1067, v1068, v1069, v1070, v1071);
    objc_msgSend_recentChannelList(v1162, v1073, v1074, v1075, v1076);
    v1077 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v1077, v1078, (uint64_t)CFSTR(", "), v1079, v1080);
    v1081 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v1191 = 134218242;
    v1192 = v1072;
    v1193 = 2114;
    v1194 = v1081;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v1082 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1082)
  {
    CWFGetOSLog();
    v1083 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1083 = MEMORY[0x1E0C81028];
    v1084 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v1083, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_remainingChannelList(v1162, v1085, v1086, v1087, v1088);
    v1089 = (void *)objc_claimAutoreleasedReturnValue();
    v1094 = objc_msgSend_count(v1089, v1090, v1091, v1092, v1093);
    objc_msgSend_remainingChannelList(v1162, v1095, v1096, v1097, v1098);
    v1099 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v1099, v1100, (uint64_t)CFSTR(", "), v1101, v1102);
    v1103 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v1191 = 134218242;
    v1192 = v1094;
    v1193 = 2114;
    v1194 = v1103;
    _os_log_send_and_compose_impl();

  }
  objc_autoreleasePoolPop(context);

}

- (id)__cachedScanResultsWithChannelList:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;

  v6 = a4;
  v7 = a3;
  v12 = objc_msgSend_maxScanCacheAge(v6, v8, v9, v10, v11);
  objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(self, v13, (uint64_t)v7, 0, 0, 0, v12, 1, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v14, v15, v16, v17, v18))
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ANQPElementIDList(v6, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_count(v28, v29, v30, v31, v32);

    if (v33)
    {
      objc_msgSend___passpointScanResults_(self, v34, (uint64_t)v14, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v37, v38, v39, v40, v41))
      {
        objc_msgSend_ANQPElementIDList(v6, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_maxANQPCacheAge(v6, v47, v48, v49, v50);
        objc_msgSend_autoJoinParameters(v6, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend_mode(v56, v57, v58, v59, v60) == 3;
        objc_msgSend___performGASQueryWithScanResults_ANQPElementIDList_maxCacheAge_cacheOnly_error_(self, v62, (uint64_t)v37, (uint64_t)v46, v51, v61, 0);
        v63 = objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend_addObjectsFromArray_(v23, v64, v63, v65, v66);
          v37 = (void *)v63;
        }
        else
        {
          v37 = 0;
        }
      }

    }
    objc_msgSend_addObjectsFromArray_(v23, v34, (uint64_t)v14, v35, v36);
    objc_msgSend_allObjects(v23, v67, v68, v69, v70);
  }
  else
  {
    v23 = 0;
    objc_msgSend_allObjects(0, v19, v20, v21, v22);
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (BOOL)__hasJoinedAnyKnownNetworkSinceBoot
{
  CWFAutoJoinManager *v2;
  BOOL hasJoinedAnyKnownNetworkSinceBoot;
  void *v4;
  NSSet *knownNetworks;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  CWFAutoJoinManager *v13;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasJoinedAnyKnownNetworkSinceBoot)
  {
    hasJoinedAnyKnownNetworkSinceBoot = 1;
  }
  else
  {
    CWFGetBootTime();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    knownNetworks = v2->_knownNetworks;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B068A66C;
    v11[3] = &unk_1E6133D90;
    v6 = v4;
    v12 = v6;
    v13 = v2;
    objc_msgSend_enumerateObjectsUsingBlock_(knownNetworks, v7, (uint64_t)v11, v8, v9);

    hasJoinedAnyKnownNetworkSinceBoot = v2->_hasJoinedAnyKnownNetworkSinceBoot;
  }
  objc_sync_exit(v2);

  return hasJoinedAnyKnownNetworkSinceBoot;
}

- (id)__performPreAssociationScanWithContext:(id)a3 network:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSObject *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  double v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  int v196;
  double v197;
  double v198;
  double v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  double v204;
  double v205;
  double v206;
  double v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  double v212;
  double v213;
  double v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  double v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  void *v248;
  NSObject *v249;
  id v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  void *v269;
  NSObject *v270;
  id v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  id v286;
  const char *v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  uint64_t v295;
  char *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  char v309;
  NSObject *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  id v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  id v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  id v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  double v387;
  double v388;
  void *v389;
  NSObject *v390;
  id v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  const char *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  void *v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  NSObject *v456;
  id v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  NSObject *v488;
  id v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  void *v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  void *v516;
  NSObject *v517;
  id v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  void *v539;
  const char *v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  void *v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  void *v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  void *v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  void *v561;
  const char *v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  void *v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  void *v582;
  void *v583;
  void *v584;
  NSObject *v585;
  uint64_t v586;
  void *v587;
  NSObject *v588;
  id v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v594;
  const char *v595;
  const char *v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  const char *v600;
  uint64_t v601;
  uint64_t v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  void *v616;
  void *v617;
  const char *v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  const char *v623;
  void *v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  const char *v628;
  uint64_t v629;
  uint64_t v630;
  id v631;
  id v632;
  const char *v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  void *v637;
  int *v639;
  int *v640;
  int *v641;
  int *v642;
  int *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  __uint64_t v648;
  void *v649;
  void *v650;
  uint64_t v651;
  void *v652;
  void *v653;
  id v654;
  void *v655;
  char v656;
  int v657;
  int v658;
  void *v659;
  void *v660;
  void *v661;
  id v662;
  void *v663;
  void *v664;
  id obj;
  id v666;
  void *v667;
  uint64_t v668;
  uint64_t v669;
  void *v670;
  void *v671;
  char *v672;
  void *v673;
  uint64_t v674;
  void *v675;
  void *v676;
  void *v677;
  unint64_t v678;
  uint64_t v679;
  CWFAutoJoinManager *v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  int v693;
  void *v694;
  __int16 v695;
  const char *v696;
  __int16 v697;
  uint64_t v698;
  __int16 v699;
  __uint64_t v700;
  __int16 v701;
  void *v702;
  __int16 v703;
  uint64_t v704;
  __int16 v705;
  uint64_t v706;
  __int16 v707;
  uint64_t v708;
  __int16 v709;
  uint64_t v710;
  __int16 v711;
  void *v712;
  _BYTE v713[128];
  _BYTE v714[128];
  void *v715;
  _BYTE v716[128];
  _QWORD v717[4];

  v717[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v654 = a4;
  objc_msgSend_matchingKnownNetworkProfile(v654, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v12, v13, v14, v15);
  v677 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v16, v17, v18, v19);
  v663 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v20, (uint64_t)CFSTR("channel"), 1, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v680 = self;
  objc_msgSend_supportedChannels(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v652 = (void *)v22;
  v717[0] = v22;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v717, 1, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v27, v31, (uint64_t)v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v35, v36, v37, v38);
  v664 = (void *)objc_claimAutoreleasedReturnValue();
  v689 = 0u;
  v690 = 0u;
  v691 = 0u;
  v692 = 0u;
  obj = v34;
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v689, (uint64_t)v716, 16);
  if (v40)
  {
    v44 = v40;
    v45 = *(_QWORD *)v690;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v690 != v45)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v689 + 1) + 8 * i);
        objc_msgSend___basicChannelRepresentation_(v680, v41, (uint64_t)v47, v42, v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v677, v49, (uint64_t)v48, v50, v51);
        if (objc_msgSend_is6GHzPSC(v47, v52, v53, v54, v55))
          objc_msgSend_addObject_(v664, v56, (uint64_t)v48, v58, v59);
        if ((objc_msgSend_is6GHz(v47, v56, v57, v58, v59) & 1) == 0)
          objc_msgSend_addObject_(v663, v60, (uint64_t)v48, v61, v62);

      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v689, (uint64_t)v716, 16);
    }
    while (v44);
  }

  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v63, v64, v65, v66);
  v655 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v67, v68, v69, v70);
  v661 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v71, v72, v73, v74);
  v660 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_location(v680, v75, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v80, v81, v82, v83);
  v85 = v84;
  objc_msgSend_channel(v654, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___basicChannelRepresentation_(v680, v91, (uint64_t)v90, v92, v93);
  v94 = objc_claimAutoreleasedReturnValue();

  v99 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v680->_beginTimestamp) / 0xF4240;
  v666 = v6;
  v653 = (void *)v94;
  v648 = v99;
  if (v94 && objc_msgSend_age(v654, v95, v96, v97, v98) > v99)
  {
    v101 = v11;
    v102 = (void *)MEMORY[0x1E0CB3940];
    v103 = objc_msgSend_shortSSID(v654, v95, v100, v97, v98);
    objc_msgSend_BSSID(v654, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channel(v654, v109, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend_channel(v113, v114, v115, v116, v117);
    objc_msgSend_stringWithFormat_(v102, v119, (uint64_t)CFSTR("%lu/%@/%lu"), v120, v121, v103, v108, v118);
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v680->_followup6GHzRNRMap, v123, (uint64_t)v122, v124, v125);
    v126 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v680->_followup6GHzFILSDMap, v127, (uint64_t)v122, v128, v129);
    v130 = objc_claimAutoreleasedReturnValue();
    if (!(v126 | v130))
    {
      CWFGetOSLog();
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v131)
      {
        CWFGetOSLog();
        v132 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v132 = MEMORY[0x1E0C81028];
        v137 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_identifier(v101, v138, v139, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_redactedForWiFi(v142, v143, v144, v145, v146);
        v147 = (char *)objc_claimAutoreleasedReturnValue();
        v152 = objc_msgSend_age(v654, v148, v149, v150, v151);
        v693 = 138544130;
        v694 = v653;
        v695 = 2114;
        v696 = v147;
        v697 = 2048;
        v698 = v152;
        v699 = 2048;
        v700 = v648;
        LODWORD(v644) = 42;
        v639 = &v693;
        _os_log_send_and_compose_impl();

        v6 = v666;
      }

      objc_msgSend_addObject_(v655, v153, (uint64_t)v653, v154, v155);
    }

    v651 = 0;
    v11 = v101;
  }
  else
  {
    objc_msgSend_orderedSetWithObject_(MEMORY[0x1E0C99E10], v95, (uint64_t)v654, v97, v98);
    v651 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_BSSList(v11, v133, v134, v135, v136, v639, v644);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v157, (uint64_t)CFSTR("lastAssociatedAt"), 0, v158);
  v649 = (void *)objc_claimAutoreleasedReturnValue();
  v715 = v649;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v159, (uint64_t)&v715, 1, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v650 = v156;
  objc_msgSend_sortedArrayUsingDescriptors_(v156, v162, (uint64_t)v161, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v687 = 0u;
  v688 = 0u;
  v685 = 0u;
  v686 = 0u;
  v662 = v165;
  v167 = v677;
  v667 = v79;
  v669 = objc_msgSend_countByEnumeratingWithState_objects_count_(v662, v166, (uint64_t)&v685, (uint64_t)v714, 16);
  if (v669)
  {
    v678 = 0;
    v656 = 0;
    v668 = *(_QWORD *)v686;
    while (1)
    {
      v172 = 0;
      do
      {
        if (*(_QWORD *)v686 != v668)
          objc_enumerationMutation(v662);
        v173 = *(void **)(*((_QWORD *)&v685 + 1) + 8 * v172);
        if (!objc_msgSend_maxBSSChannelAge(v6, v168, v169, v170, v171, v640)
          || (objc_msgSend_lastAssociatedAt(v173, v168, v169, v170, v171),
              v174 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_timeIntervalSinceReferenceDate(v174, v175, v176, v177, v178),
              v180 = v85 - v179,
              v185 = (double)(unint64_t)objc_msgSend_maxBSSChannelAge(v6, v181, v182, v183, v184),
              v174,
              v180 <= v185))
        {
          if (objc_msgSend_maxBSSChannelCount(v6, v168, v169, v170, v171)
            && v678 >= objc_msgSend_maxBSSChannelCount(v6, v186, v187, v188, v189))
          {
            goto LABEL_99;
          }
          objc_msgSend_location(v173, v186, v187, v188, v189);
          v190 = objc_claimAutoreleasedReturnValue();
          v195 = (void *)v190;
          v196 = 0;
          if (v79 && v190)
          {
            objc_msgSend_horizontalAccuracy(v79, v191, v192, v193, v194);
            if (v197 < 0.0)
              goto LABEL_39;
            objc_msgSend_horizontalAccuracy(v79, v191, v192, v193, v194);
            v199 = v198;
            objc_msgSend_minBSSLocationAccuracy(v6, v200, v201, v202, v203);
            if (v199 > v204)
              goto LABEL_39;
            objc_msgSend_horizontalAccuracy(v195, v191, v192, v193, v194);
            if (v205 >= 0.0
              && (objc_msgSend_horizontalAccuracy(v195, v191, v192, v193, v194),
                  v207 = v206,
                  objc_msgSend_minBSSLocationAccuracy(v6, v208, v209, v210, v211),
                  v207 <= v212)
              && (objc_msgSend_distanceFromLocation_(v195, v191, (uint64_t)v79, v193, v194),
                  v214 = v213,
                  objc_msgSend_maxBSSLocationDistance(v6, v215, v216, v217, v218),
                  v214 <= v219))
            {
              v196 = 1;
              v656 = 1;
            }
            else
            {
LABEL_39:
              v196 = 0;
            }
          }
          objc_msgSend_channel(v173, v191, v192, v193, v194);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          v225 = objc_msgSend_copy(v220, v221, v222, v223, v224);

          v675 = (void *)v225;
          if (v225)
          {
            v673 = v195;
            v674 = v172;
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v226, v227, v228, v229);
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___basicChannelRepresentation_(v680, v231, v225, v232, v233);
            v234 = (char *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_is6GHz(v234, v235, v236, v237, v238))
            {
              objc_msgSend_colocated2GHzRNRChannel(v173, v239, v240, v241, v242);
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              if (v247)
              {
                objc_msgSend___basicChannelRepresentation_(v680, v243, (uint64_t)v247, v245, v246);
                v670 = (void *)objc_claimAutoreleasedReturnValue();
                CWFGetOSLog();
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                if (v248)
                {
                  CWFGetOSLog();
                  v249 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v249 = MEMORY[0x1E0C81028];
                  v250 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_identifier(v11, v251, v252, v253, v254);
                  v255 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_redactedForWiFi(v255, v256, v257, v258, v259);
                  v657 = v196;
                  v260 = v247;
                  v261 = (void *)objc_claimAutoreleasedReturnValue();
                  v693 = 138543874;
                  v694 = v670;
                  v695 = 2114;
                  v696 = v234;
                  v697 = 2114;
                  v698 = (uint64_t)v261;
                  LODWORD(v645) = 32;
                  v640 = &v693;
                  _os_log_send_and_compose_impl();

                  v247 = v260;
                  v196 = v657;

                }
                objc_msgSend_addObject_(v230, v262, (uint64_t)v670, v263, v264);

              }
              objc_msgSend_colocated5GHzRNRChannel(v173, v243, v244, v245, v246, v640, v645);
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              if (v268)
              {
                objc_msgSend___basicChannelRepresentation_(v680, v265, (uint64_t)v268, v266, v267);
                v671 = (void *)objc_claimAutoreleasedReturnValue();
                CWFGetOSLog();
                v269 = (void *)objc_claimAutoreleasedReturnValue();
                if (v269)
                {
                  CWFGetOSLog();
                  v270 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v270 = MEMORY[0x1E0C81028];
                  v271 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v270, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_identifier(v11, v272, v273, v274, v275);
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_redactedForWiFi(v276, v277, v278, v279, v280);
                  v658 = v196;
                  v281 = v247;
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  v693 = 138543874;
                  v694 = v671;
                  v695 = 2114;
                  v696 = v234;
                  v697 = 2114;
                  v698 = (uint64_t)v282;
                  LODWORD(v645) = 32;
                  v640 = &v693;
                  _os_log_send_and_compose_impl();

                  v247 = v281;
                  v196 = v658;

                }
                objc_msgSend_addObject_(v230, v283, (uint64_t)v671, v284, v285);

              }
            }
            else
            {
              objc_msgSend_addObject_(v230, v239, (uint64_t)v234, v241, v242);
            }
            v672 = v234;
            v683 = 0u;
            v684 = 0u;
            v681 = 0u;
            v682 = 0u;
            v286 = v230;
            v288 = objc_msgSend_countByEnumeratingWithState_objects_count_(v286, v287, (uint64_t)&v681, (uint64_t)v713, 16);
            if (v288)
            {
              v292 = v288;
              v293 = *(_QWORD *)v682;
              if (v196)
                v294 = v660;
              else
                v294 = v661;
              do
              {
                v295 = 0;
                do
                {
                  if (*(_QWORD *)v682 != v293)
                    objc_enumerationMutation(v286);
                  v296 = *(char **)(*((_QWORD *)&v681 + 1) + 8 * v295);
                  if (!objc_msgSend_containsObject_(v167, v289, (uint64_t)v296, v290, v291, v640))
                  {
                    CWFGetOSLog();
                    v314 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v314)
                    {
                      CWFGetOSLog();
                      v310 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v310 = MEMORY[0x1E0C81028];
                      v315 = MEMORY[0x1E0C81028];
                    }

                    if (os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_identifier(v11, v316, v317, v318, v319);
                      v320 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_redactedForWiFi(v320, v321, v322, v323, v324);
                      v325 = v11;
                      v326 = (void *)objc_claimAutoreleasedReturnValue();
                      v693 = 138543618;
                      v694 = v326;
                      v695 = 2114;
                      v696 = v296;
                      LODWORD(v645) = 22;
                      v640 = &v693;
                      _os_log_send_and_compose_impl();

                      v11 = v325;
                      v167 = v677;

                    }
                    goto LABEL_77;
                  }
                  if (objc_msgSend_is6GHz(v296, v297, v298, v299, v300))
                  {
                    if ((_os_feature_enabled_impl() & 1) == 0)
                    {
                      CWFGetOSLog();
                      v327 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v327)
                      {
                        CWFGetOSLog();
                        v310 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v310 = MEMORY[0x1E0C81028];
                        v329 = MEMORY[0x1E0C81028];
                      }

                      if (!os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
                        goto LABEL_77;
LABEL_89:
                      objc_msgSend_identifier(v11, v330, v331, v332, v333);
                      v659 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_redactedForWiFi(v659, v335, v336, v337, v338);
                      v339 = (void *)objc_claimAutoreleasedReturnValue();
                      v693 = 138543618;
                      v694 = v339;
                      v695 = 2114;
                      v696 = v296;
                      LODWORD(v645) = 22;
                      v640 = &v693;
                      _os_log_send_and_compose_impl();

                      goto LABEL_77;
                    }
                    if ((_os_feature_enabled_impl() & 1) == 0
                      && (objc_msgSend_is6GHzPSC(v296, v301, v302, v303, v304) & 1) == 0)
                    {
                      CWFGetOSLog();
                      v328 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v328)
                      {
                        CWFGetOSLog();
                        v310 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v310 = MEMORY[0x1E0C81028];
                        v334 = MEMORY[0x1E0C81028];
                      }

                      if (!os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
                        goto LABEL_77;
                      goto LABEL_89;
                    }
                  }
                  objc_msgSend_scanChannels(v680->_metric, v301, v302, v303, v304);
                  v305 = (void *)objc_claimAutoreleasedReturnValue();
                  v309 = objc_msgSend_containsObject_(v305, v306, (uint64_t)v296, v307, v308);

                  if ((v309 & 1) != 0)
                    goto LABEL_78;
                  v310 = v294;
                  objc_msgSend_addObject_(v310, v311, (uint64_t)v296, v312, v313);
                  ++v678;
LABEL_77:

LABEL_78:
                  ++v295;
                }
                while (v292 != v295);
                v340 = objc_msgSend_countByEnumeratingWithState_objects_count_(v286, v289, (uint64_t)&v681, (uint64_t)v713, 16);
                v292 = v340;
              }
              while (v340);
            }

            v6 = v666;
            v79 = v667;
            v195 = v673;
            v172 = v674;
          }

        }
        ++v172;
      }
      while (v172 != v669);
      v341 = objc_msgSend_countByEnumeratingWithState_objects_count_(v662, v168, (uint64_t)&v685, (uint64_t)v714, 16);
      v669 = v341;
      if (!v341)
        goto LABEL_99;
    }
  }
  v656 = 0;
LABEL_99:

  objc_msgSend_array(v660, v342, v343, v344, v345);
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v655, v347, (uint64_t)v346, v348, v349);

  objc_msgSend_array(v661, v350, v351, v352, v353);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v655, v355, (uint64_t)v354, v356, v357);

  objc_msgSend_networkName(v11, v358, v359, v360, v361);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v366)
    goto LABEL_101;
  if ((objc_msgSend_isPasspoint(v11, v362, v363, v364, v365) & 1) != 0)
    goto LABEL_101;
  if (objc_msgSend_hiddenState(v11, v367, v368, v369, v370) != 2)
    goto LABEL_105;
  objc_msgSend_wasHiddenBefore(v11, v372, v373, v374, v375);
  v376 = objc_claimAutoreleasedReturnValue();
  if (!v376
    || (v381 = (void *)v376,
        objc_msgSend_wasHiddenBefore(v11, v377, v378, v379, v380),
        v382 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_timeIntervalSinceReferenceDate(v382, v383, v384, v385, v386),
        v388 = v387,
        v382,
        v381,
        v388 >= 604800.0))
  {
LABEL_101:
    v371 = 0;
  }
  else
  {
LABEL_105:
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v372, (uint64_t)v366, v374, v375, v640);
    v371 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CWFGetOSLog();
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  if (v389)
  {
    CWFGetOSLog();
    v390 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v390 = MEMORY[0x1E0C81028];
    v391 = MEMORY[0x1E0C81028];
  }

  v679 = (uint64_t)v371;
  if (os_log_type_enabled(v390, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_identifier(v11, v392, v393, v394, v395);
    v676 = v366;
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v396, v397, v398, v399, v400);
    v405 = (void *)objc_claimAutoreleasedReturnValue();
    v406 = "no";
    if ((v656 & 1) != 0)
      v407 = "yes";
    else
      v407 = "no";
    if (objc_msgSend_count(v371, v401, v402, v403, v404, v640))
      v406 = "yes";
    v412 = objc_msgSend_maxBSSChannelAge(v6, v408, v409, v410, v411);
    objc_msgSend_minBSSLocationAccuracy(v6, v413, v414, v415, v416);
    v418 = v417;
    objc_msgSend_maxBSSLocationDistance(v6, v419, v420, v421, v422);
    v424 = v423;
    v429 = objc_msgSend_maxBSSChannelCount(v6, v425, v426, v427, v428);
    objc_msgSend_description(v667, v430, v431, v432, v433);
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v434, v435, v436, v437, v438);
    v439 = v11;
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    v693 = 138545666;
    v694 = v405;
    v695 = 2082;
    v696 = v407;
    v697 = 2082;
    v698 = (uint64_t)v406;
    v699 = 2114;
    v700 = (__uint64_t)v660;
    v701 = 2114;
    v702 = v661;
    v703 = 2048;
    v704 = v412;
    v705 = 2048;
    v706 = v418;
    v707 = 2048;
    v708 = v424;
    v709 = 2048;
    v710 = v429;
    v6 = v666;
    v79 = v667;
    v711 = 2114;
    v712 = v440;
    LODWORD(v645) = 102;
    v640 = &v693;
    _os_log_send_and_compose_impl();

    v11 = v439;
    v366 = v676;
  }

  objc_msgSend_autoJoinParameters(v6, v441, v442, v443, v444);
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v450 = objc_msgSend_mode(v445, v446, v447, v448, v449);

  if (v450 == 2)
  {
    CWFGetOSLog();
    v455 = (void *)objc_claimAutoreleasedReturnValue();
    if (v455)
    {
      CWFGetOSLog();
      v456 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v456 = MEMORY[0x1E0C81028];
      v457 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v456, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v693) = 0;
      LODWORD(v645) = 2;
      v640 = &v693;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_array(v664, v458, v459, v460, v461);
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v655, v463, (uint64_t)v462, v464, v465);

  }
  v466 = v654;
  objc_msgSend_matchingKnownNetworkProfile(v654, v451, v452, v453, v454, v640, v645);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastJoinedBySystemAt(v467, v468, v469, v470, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  if (v472)
  {

  }
  else
  {
    objc_msgSend_matchingKnownNetworkProfile(v654, v473, v474, v475, v476);
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    v482 = objc_msgSend_addReason(v477, v478, v479, v480, v481);

    v466 = v654;
    if (v482 != 8)
      goto LABEL_133;
    CWFGetOSLog();
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    if (v487)
    {
      CWFGetOSLog();
      v488 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v488 = MEMORY[0x1E0C81028];
      v489 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v488, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v693) = 0;
      LODWORD(v646) = 2;
      v641 = &v693;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_array(v663, v490, v491, v492, v493);
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v655, v494, (uint64_t)v467, v495, v496);
    v466 = v654;
  }

LABEL_133:
  objc_msgSend_channel(v466, v483, v484, v485, v486, v641, v646);
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_is6GHz(v497, v498, v499, v500, v501) & 1) != 0)
  {
    objc_msgSend_matchingKnownNetworkProfile(v466, v502, v503, v504, v505);
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastJoinedAt(v506, v507, v508, v509, v510);
    v511 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v511)
    {
      CWFGetOSLog();
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      if (v516)
      {
        CWFGetOSLog();
        v517 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v517 = MEMORY[0x1E0C81028];
        v518 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v517, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v693) = 0;
        LODWORD(v647) = 2;
        v642 = &v693;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_array(v663, v519, v520, v521, v522);
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v655, v524, (uint64_t)v523, v525, v526);

      objc_msgSend_array(v664, v527, v528, v529, v530);
      v531 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v655, v532, (uint64_t)v531, v533, v534);

      objc_msgSend_setDidForceAllRemainingChannels_(v6, v535, 1, v536, v537);
    }
  }
  else
  {

  }
  v538 = objc_msgSend_count(v655, v512, v513, v514, v515, v642, v647);
  v539 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_scanChannels(v680->_metric, v540, v541, v542, v543);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v539, v545, (uint64_t)v544, v546, v547);
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v655, v549, (uint64_t)v548, v550, v551);

  v552 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_preAssociationScanChannels(v680->_metric, v553, v554, v555, v556);
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v552, v558, (uint64_t)v557, v559, v560);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v655, v562, (uint64_t)v561, v563, v564);

  v565 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_followup6GHzScanChannels(v680->_metric, v566, v567, v568, v569);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v565, v571, (uint64_t)v570, v572, v573);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v655, v575, (uint64_t)v574, v576, v577);

  if (!objc_msgSend_count(v655, v578, v579, v580, v581))
  {
    CWFGetOSLog();
    v586 = objc_claimAutoreleasedReturnValue();
    v587 = (void *)v586;
    v583 = (void *)v651;
    v584 = (void *)v679;
    if (v538)
    {
      if (v586)
      {
        CWFGetOSLog();
        v588 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v588 = MEMORY[0x1E0C81028];
        v631 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v588, OS_LOG_TYPE_DEFAULT))
        goto LABEL_169;
      LOWORD(v693) = 0;
    }
    else
    {
      if (v586)
      {
        CWFGetOSLog();
        v588 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v588 = MEMORY[0x1E0C81028];
        v632 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v588, OS_LOG_TYPE_DEFAULT))
        goto LABEL_169;
      LOWORD(v693) = 0;
    }
    _os_log_send_and_compose_impl();
LABEL_169:
    v624 = v654;
    goto LABEL_170;
  }
  CWFGetOSLog();
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  v583 = (void *)v651;
  v584 = (void *)v679;
  if (v582)
  {
    CWFGetOSLog();
    v585 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v585 = MEMORY[0x1E0C81028];
    v589 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v585, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v693) = 0;
    v643 = &v693;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_array(v655, v590, v591, v592, v593);
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v643) = 1;
  objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v680, v595, (uint64_t)v594, v679, 0, 0, v648, 0, v643, 0);
  v588 = objc_claimAutoreleasedReturnValue();

  if (!v588)
    goto LABEL_169;
  if (!v651)
  {
    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v596, v597, v598, v599);
    v583 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_removeObjectsInArray_(v583, v596, (uint64_t)v588, v598, v599);
  objc_msgSend_addObjectsFromArray_(v583, v600, (uint64_t)v588, v601, v602);
  objc_msgSend_autoJoinParameters(v6, v603, v604, v605, v606);
  v607 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v607, v608, v609, v610, v611) == 54)
  {
LABEL_161:

    goto LABEL_169;
  }
  v616 = v583;
  objc_msgSend_autoJoinParameters(v6, v612, v613, v614, v615);
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  v622 = objc_msgSend_trigger(v617, v618, v619, v620, v621);

  if (v622 != 55)
  {
    objc_msgSend___perform6GHzFollowupDiscoveryWithScanResults_SSIDList_dwellTime_context_error_(v680, v623, (uint64_t)v588, v679, 0, v6, 0);
    v607 = (void *)objc_claimAutoreleasedReturnValue();
    v583 = v616;
    if (v607)
    {
      objc_msgSend_removeObjectsInArray_(v616, v625, (uint64_t)v607, v626, v627);
      objc_msgSend_addObjectsFromArray_(v616, v628, (uint64_t)v607, v629, v630);
    }
    goto LABEL_161;
  }
  v624 = v654;
  v583 = v616;
LABEL_170:

  objc_msgSend_array(v583, v633, v634, v635, v636);
  v637 = (void *)objc_claimAutoreleasedReturnValue();

  return v637;
}

- (BOOL)__discoverKnownNetworksWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t shouldAllowPreAssocScan;
  void *v74;
  const char *v75;
  char v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  BOOL v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  int v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  int v222;
  void *v223;
  NSObject *v224;
  id v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  unint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  _BOOL4 didDiscoverBSS;
  uint64_t v283;
  void *v284;
  NSObject *v285;
  void *v286;
  NSObject *v287;
  void *v288;
  NSObject *v289;
  id v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  id v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  id v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  char v352;
  id v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  int v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  void *v404;
  id v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  char v416;
  id v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  int v421;
  char v422;
  id v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  unint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  int *v458;
  int *v459;
  int *v460;
  int v461;
  id *v462;
  void *v463;
  id *v464;
  void *context;
  void *v466;
  void *v467;
  void *v468;
  unint64_t v469;
  void *v470;
  void *v471;
  unint64_t v472;
  void *v473;
  CWFAutoJoinManager *v474;
  id v475;
  void *v476;
  void *v477;
  id v478;
  id v479;
  id v480;
  id v481;
  uint64_t v482;
  id v483;
  id v484;
  id v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  id v490;
  id v491;
  _BYTE v492[128];
  uint64_t v493;
  int v494;
  uint64_t v495;
  __int16 v496;
  uint64_t v497;
  __int16 v498;
  uint64_t v499;
  __int16 v500;
  uint64_t v501;
  uint64_t v502;

  v502 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CWFGetOSLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v494 = 134218752;
    v495 = objc_msgSend_maxScanCycles(v6, v10, v11, v12, v13);
    v496 = 2048;
    v497 = objc_msgSend_maxScanChannelCount(v6, v14, v15, v16, v17);
    v498 = 2048;
    v499 = objc_msgSend_maxScanSSIDCount(v6, v18, v19, v20, v21);
    v500 = 2048;
    v501 = objc_msgSend_minRSSI(v6, v22, v23, v24, v25);
    v461 = 42;
    v458 = &v494;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_autoJoinParameters(v6, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);
  v491 = 0;
  v38 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v36, v35, (uint64_t)&v491, v37);
  v39 = v491;

  if (!v38)
  {
    v476 = 0;
    v477 = 0;
    v91 = 0;
    v467 = 0;
    v456 = 0;
    v67 = 0;
    v160 = 0;
    if (a4)
      goto LABEL_113;
    goto LABEL_115;
  }
  context = (void *)MEMORY[0x1B5E0A33C](v40, v41);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v42, (uint64_t)CFSTR("channel"), 1, v43);
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedChannels(self, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v466 = (void *)v44;
  v493 = v44;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v50, (uint64_t)&v493, 1, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v49, v53, (uint64_t)v52, v54, v55);
  v56 = objc_claimAutoreleasedReturnValue();

  objc_msgSend___updateAutoJoinState_(self, v57, 2, v58, v59);
  v467 = (void *)v56;
  if (objc_msgSend_cacheOnly(v6, v60, v61, v62, v63))
  {
    objc_msgSend___cachedScanResultsWithChannelList_context_(self, v64, v56, (uint64_t)v6, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v67, v68, v69, v70, v71))
    {
      shouldAllowPreAssocScan = objc_msgSend___shouldAllowPreAssocScan(self, v64, v72, v65, v66);
      v490 = v39;
      v74 = v67;
      v76 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v75, (uint64_t)v67, shouldAllowPreAssocScan, (uint64_t)v6, &v490);
      v77 = v490;

      if ((v76 & 1) != 0)
      {
        v476 = 0;
        v477 = 0;
        v91 = 0;
        v160 = 1;
        v67 = v74;
        goto LABEL_112;
      }
      v39 = v77;
      v67 = v74;
    }
  }
  else
  {
    v67 = 0;
  }
  objc_msgSend___updateAutoJoinState_(self, v64, 2, v65, v66, v458, v461);
  if ((objc_msgSend_cacheOnly(v6, v78, v79, v80, v81) & 1) != 0)
  {
    v476 = 0;
    v477 = 0;
    v91 = 0;
    v160 = 0;
    v77 = v39;
    goto LABEL_112;
  }
  v463 = v67;
  v464 = a4;
  v86 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_recentChannelList(v6, v82, v83, v84, v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v86, v88, (uint64_t)v87, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95);
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v96, v97, v98, v99);
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v486 = 0u;
  v487 = 0u;
  v488 = 0u;
  v489 = 0u;
  objc_msgSend_remainingChannelList(v6, v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v486, (uint64_t)v492, 16);
  if (v106)
  {
    v111 = v106;
    v112 = *(_QWORD *)v487;
    do
    {
      for (i = 0; i != v111; ++i)
      {
        if (*(_QWORD *)v487 != v112)
          objc_enumerationMutation(v104);
        v114 = *(void **)(*((_QWORD *)&v486 + 1) + 8 * i);
        if (objc_msgSend_is2GHz(v114, v107, v108, v109, v110))
          objc_msgSend_addObject_(v477, v115, (uint64_t)v114, v116, v117);
        else
          objc_msgSend_addObject_(v476, v115, (uint64_t)v114, v116, v117);
      }
      v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v486, (uint64_t)v492, 16);
    }
    while (v111);
  }

  objc_msgSend_addObjectsFromArray_(v91, v118, (uint64_t)v477, v119, v120);
  objc_msgSend_addObjectsFromArray_(v91, v121, (uint64_t)v476, v122, v123);
  v469 = 0;
  v470 = v91;
  v474 = self;
  while (2)
  {
    objc_msgSend_SSIDList(v6, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSIDList(v6, v129, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend_count(v133, v134, v135, v136, v137) - v469;
    v147 = objc_msgSend_maxScanSSIDCount(v6, v139, v140, v141, v142);
    if (v138 >= v147)
    {
      v153 = objc_msgSend_maxScanSSIDCount(v6, v143, v144, v145, v146);
    }
    else
    {
      objc_msgSend_SSIDList(v6, v143, v144, v145, v146);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend_count(v468, v148, v149, v150, v151) - v469;
    }
    objc_msgSend_subarrayWithRange_(v128, v152, v469, v153, v154);
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    if (v138 < v147)

    v159 = 0;
    v160 = 0;
    v469 += objc_msgSend_count(v471, v155, v156, v157, v158);
    v165 = 1;
    while (1)
    {
      v170 = v160 | (v159 >= objc_msgSend_count(v91, v161, v162, v163, v164));
      if ((v170 & 1) != 0 || (v165 & 1) == 0)
      {
        v165 &= v170;
        v77 = v39;
        goto LABEL_105;
      }
      objc_msgSend_autoJoinParameters(v6, v166, v167, v168, v169);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = objc_msgSend_trigger(v171, v172, v173, v174, v175);
      v485 = v39;
      v179 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v177, v176, (uint64_t)&v485, v178);
      v77 = v485;

      if (!v179)
        break;
      v184 = objc_msgSend_count(v91, v180, v181, v182, v183);
      objc_msgSend_recentChannelList(v6, v185, v186, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      if (v159 >= objc_msgSend_count(v189, v190, v191, v192, v193))
      {

      }
      else
      {
        objc_msgSend_autoJoinParameters(v6, v194, v195, v196, v197);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        v203 = objc_msgSend_mode(v198, v199, v200, v201, v202);

        if (v203 != 2)
        {
          v208 = objc_msgSend_maxScanChannelCount(v6, v204, v205, v206, v207);
          objc_msgSend_recentChannelList(v6, v209, v210, v211, v212);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend_count(v213, v214, v215, v216, v217);

          v222 = 0;
          goto LABEL_46;
        }
      }
      if ((objc_msgSend_alwaysIncludeRemainingNon2GHzChannels(v6, v204, v205, v206, v207) & 1) != 0
        || self->_didDiscoverBSS)
      {
        CWFGetOSLog();
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        if (v223)
        {
          CWFGetOSLog();
          v224 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v224 = MEMORY[0x1E0C81028];
          v225 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(self->_metric, v226, 1, v227, v228);
        v222 = 0;
      }
      else
      {
        CWFGetOSLog();
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        if (v288)
        {
          CWFGetOSLog();
          v289 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v289 = MEMORY[0x1E0C81028];
          v423 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v494) = 0;
          LODWORD(v462) = 2;
          v459 = &v494;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_recentChannelList(v6, v424, v425, v426, v427);
        v428 = (void *)objc_claimAutoreleasedReturnValue();
        v433 = objc_msgSend_count(v428, v429, v430, v431, v432);
        v184 = objc_msgSend_count(v477, v434, v435, v436, v437) + v433;

        v222 = 1;
      }
      v208 = -1;
LABEL_46:
      objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v218, v219, v220, v221, v459, v462);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      if (v184 - v159 >= v208)
        v232 = v208;
      else
        v232 = v184 - v159;
      v233 = v159;
      objc_msgSend_subarrayWithRange_(v91, v229, v159, v232, v230);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = objc_msgSend_count(v234, v235, v236, v237, v238);
      v244 = objc_msgSend_maxScanCacheAge(v6, v240, v241, v242, v243);
      if (objc_msgSend_useCacheForPreviouslyScannedChannels(v6, v245, v246, v247, v248))
        v244 += (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v474->_beginTimestamp) / 0xF4240;
      v253 = objc_msgSend_passiveScan(v6, v249, v250, v251, v252);
      v258 = objc_msgSend_dwellTime(v6, v254, v255, v256, v257);
      v484 = 0;
      v462 = &v484;
      LOBYTE(v460) = 0;
      objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v474, v259, (uint64_t)v234, (uint64_t)v471, v253, v258, v244, 0);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      v475 = v484;
      if (objc_msgSend_count(v260, v261, v262, v263, v264))
      {
        objc_msgSend_removeObjectsInArray_(v231, v265, (uint64_t)v260, v267, v268);
        objc_msgSend_addObjectsFromArray_(v231, v269, (uint64_t)v260, v270, v271);
      }
      v272 = v239 + v233;
      if (v222)
      {
        v273 = objc_msgSend_count(v470, v265, v266, v267, v268);
        objc_msgSend_subarrayWithRange_(v470, v274, v239 + v233, v273 - v272, v275);
        v276 = (void *)objc_claimAutoreleasedReturnValue();

        v473 = v276;
        v281 = objc_msgSend_count(v276, v277, v278, v279, v280) + v272;
        self = v474;
        didDiscoverBSS = v474->_didDiscoverBSS;
        CWFGetOSLog();
        v283 = objc_claimAutoreleasedReturnValue();
        v284 = (void *)v283;
        if (didDiscoverBSS)
        {
          if (v283)
          {
            CWFGetOSLog();
            v285 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v285 = MEMORY[0x1E0C81028];
            v290 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v285, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v494) = 0;
            v460 = &v494;
            _os_log_send_and_compose_impl();
          }

          v295 = objc_msgSend_passiveScan(v6, v291, v292, v293, v294);
          v300 = objc_msgSend_dwellTime(v6, v296, v297, v298, v299);
          v483 = v475;
          v462 = &v483;
          LOBYTE(v460) = 0;
          objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(v474, v301, (uint64_t)v473, (uint64_t)v471, v295, v300, v244, 0);
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          v302 = v483;

          if (objc_msgSend_count(v286, v303, v304, v305, v306))
          {
            objc_msgSend_removeObjectsInArray_(v231, v307, (uint64_t)v286, v308, v309);
            objc_msgSend_addObjectsFromArray_(v231, v310, (uint64_t)v286, v311, v312);
          }
          objc_msgSend_setDidIncludeRemainingNon2GHzChannels_(v474->_metric, v307, 1, v308, v309);
          v475 = v302;
        }
        else
        {
          if (v283)
          {
            CWFGetOSLog();
            v287 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v287 = MEMORY[0x1E0C81028];
            v313 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v494) = 0;
            LODWORD(v462) = 2;
            v460 = &v494;
            _os_log_send_and_compose_impl();
          }

          v286 = v260;
        }
        v159 = v281;
      }
      else
      {
        v473 = v234;
        v286 = v260;
        v159 = v239 + v233;
        self = v474;
      }
      if (!objc_msgSend_count(v231, v265, v266, v267, v268, v460))
      {
        v160 = 0;
        v422 = 0;
        goto LABEL_89;
      }
      v472 = v159;
      objc_msgSend_autoJoinParameters(v6, v314, v315, v316, v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v318, v319, v320, v321, v322) == 54)
        goto LABEL_78;
      objc_msgSend_autoJoinParameters(v6, v323, v324, v325, v326);
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = objc_msgSend_trigger(v327, v328, v329, v330, v331);

      if (v332 != 55)
      {
        objc_msgSend_array(v231, v333, v334, v335, v336);
        v337 = (void *)objc_claimAutoreleasedReturnValue();
        v482 = 0;
        objc_msgSend___perform6GHzFollowupDiscoveryWithScanResults_SSIDList_dwellTime_context_error_(self, v338, (uint64_t)v337, (uint64_t)v471, 0, v6, &v482);
        v318 = (void *)objc_claimAutoreleasedReturnValue();

        if (v318)
        {
          objc_msgSend_removeObjectsInArray_(v231, v339, (uint64_t)v318, v340, v341);
          objc_msgSend_addObjectsFromArray_(v231, v342, (uint64_t)v318, v343, v344);
        }
LABEL_78:

      }
      objc_msgSend_array(v231, v333, v334, v335, v336);
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      v350 = objc_msgSend___shouldAllowPreAssocScan(self, v346, v347, v348, v349);
      v481 = v77;
      v352 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v351, (uint64_t)v345, v350, (uint64_t)v6, &v481);
      v353 = v481;

      if ((v352 & 1) != 0)
      {
        v422 = 0;
        v165 = 1;
        v77 = v353;
        v160 = 1;
LABEL_100:
        v159 = v472;
        goto LABEL_90;
      }
      objc_msgSend___updateAutoJoinState_(self, v354, 2, v355, v356);
      objc_msgSend_autoJoinParameters(v6, v357, v358, v359, v360);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      v366 = objc_msgSend_trigger(v361, v362, v363, v364, v365);
      v480 = v353;
      v369 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v367, v366, (uint64_t)&v480, v368);
      v77 = v480;

      if (!v369)
      {
        v165 = 0;
        v160 = 0;
        v422 = 1;
        goto LABEL_100;
      }
      objc_msgSend_ANQPElementIDList(v6, v370, v371, v372, v373);
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      v379 = objc_msgSend_count(v374, v375, v376, v377, v378);

      if (!v379)
      {
        v160 = 0;
        v422 = 0;
        v165 = 1;
        goto LABEL_100;
      }
      objc_msgSend_array(v231, v380, v381, v382, v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___passpointScanResults_(self, v385, (uint64_t)v384, v386, v387);
      v388 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v388, v389, v390, v391, v392))
      {
        objc_msgSend_ANQPElementIDList(v6, v393, v394, v395, v396);
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        v402 = objc_msgSend_maxANQPCacheAge(v6, v398, v399, v400, v401);
        v479 = 0;
        objc_msgSend___performGASQueryWithScanResults_ANQPElementIDList_maxCacheAge_cacheOnly_error_(self, v403, (uint64_t)v388, (uint64_t)v397, v402, 0, &v479);
        v404 = (void *)objc_claimAutoreleasedReturnValue();
        v405 = v479;

        if (objc_msgSend_count(v404, v406, v407, v408, v409))
        {
          v414 = objc_msgSend___shouldAllowPreAssocScan(self, v410, v411, v412, v413);
          v478 = v77;
          v416 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v415, (uint64_t)v404, v414, (uint64_t)v6, &v478);
          v417 = v478;

          if ((v416 & 1) != 0)
          {
            v421 = 1;
          }
          else
          {
            objc_msgSend___updateAutoJoinState_(self, v418, 2, v419, v420);
            v421 = 0;
          }
          v77 = v417;
        }
        else
        {
          v421 = 0;
        }

      }
      else
      {
        v421 = 0;
        v404 = v388;
      }
      v159 = v472;

      v422 = 0;
      v160 = v421 != 0;
LABEL_89:
      v165 = 1;
LABEL_90:

      v39 = v77;
      v91 = v470;
      if ((v422 & 1) != 0)
        goto LABEL_105;
    }
    v165 = 0;
    v160 = 0;
LABEL_105:

    objc_msgSend_SSIDList(v6, v438, v439, v440, v441);
    v442 = (void *)objc_claimAutoreleasedReturnValue();
    if (v469 < objc_msgSend_count(v442, v443, v444, v445, v446))
    {
      v451 = v469 / objc_msgSend_maxScanSSIDCount(v6, v447, v448, v449, v450);
      if (!(v160 | (v451 >= objc_msgSend_maxScanCycles(v6, v452, v453, v454, v455))))
      {

        v39 = v77;
        if ((v165 & 1) == 0)
        {
          v160 = 0;
          goto LABEL_111;
        }
        continue;
      }
    }
    break;
  }

LABEL_111:
  v67 = v463;
  a4 = v464;
LABEL_112:
  objc_autoreleasePoolPop(context);
  v39 = v77;
  v456 = v466;
  if (a4)
  {
LABEL_113:
    if (v39)
      *a4 = objc_retainAutorelease(v39);
  }
LABEL_115:

  return v160;
}

- (void)__updateDiscoverTimestampForJoinCandidates:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *targetQueue;
  qos_class_t v21;
  dispatch_block_t v22;
  const char *v23;
  id obj;
  _QWORD block[6];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v27, (uint64_t)v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          CWFGetOSLog();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = MEMORY[0x1E0C81028];
          v19 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v31 = 134219010;
          v32 = v16 / 0x3B9ACA00;
          v33 = 2048;
          v34 = v16 % 0x3B9ACA00 / 0x3E8;
          v35 = 2082;
          v36 = "-[CWFAutoJoinManager __updateDiscoverTimestampForJoinCandidates:]";
          v37 = 2082;
          v38 = "CWFAutoJoinManager.m";
          v39 = 1024;
          v40 = 3436;
          _os_log_send_and_compose_impl();
        }

        targetQueue = self->_targetQueue;
        v21 = qos_class_self();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1B068CE5C;
        block[3] = &unk_1E6133340;
        block[4] = self;
        block[5] = v15;
        v26 = v9;
        v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
        dispatch_async(targetQueue, v22);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v27, (uint64_t)v41, 16);
    }
    while (v12);
  }

}

- (void)__updateRNRChannel:(id)a3 has6GHzOnlyBSS:(BOOL)a4 joinCandidate:(id)a5
{
  id v8;
  id v9;
  __uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *targetQueue;
  qos_class_t v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  BOOL v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134219010;
    v24 = v10 / 0x3B9ACA00;
    v25 = 2048;
    v26 = v10 % 0x3B9ACA00 / 0x3E8;
    v27 = 2082;
    v28 = "-[CWFAutoJoinManager __updateRNRChannel:has6GHzOnlyBSS:joinCandidate:]";
    v29 = 2082;
    v30 = "CWFAutoJoinManager.m";
    v31 = 1024;
    v32 = 3460;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v15 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B068D318;
  block[3] = &unk_1E61337D8;
  block[4] = self;
  v20 = v9;
  v22 = a4;
  v21 = v8;
  v16 = v9;
  v17 = v8;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

}

- (BOOL)__shouldAllowPreAssocScan
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_autoJoinParameters(self->_metric, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_trigger(v5, v6, v7, v8, v9);

  return v10 != 32 && v10 != 47;
}

- (BOOL)__preflightMatchKnownNetworksForScanResult:(id)a3
{
  id v4;
  CWFAutoJoinManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *knownNetworkSSIDMap;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_SSID(v4, v6, v7, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (knownNetworkSSIDMap = v5->_knownNetworkSSIDMap,
        objc_msgSend_SSID(v4, v10, v11, v12, v13),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(knownNetworkSSIDMap, v17, (uint64_t)v16, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v14,
        v20))
  {
    v21 = 1;
  }
  else
  {
    v20 = 0;
    if (objc_msgSend_isPasspoint(v4, v10, v11, v12, v13))
      v21 = objc_msgSend_count(v5->_knownNetworkPasspointDomainMap, v22, v23, v24, v25) != 0;
    else
      v21 = 0;
  }

  objc_sync_exit(v5);
  return v21;
}

- (BOOL)__matchAndJoinScanResults:(id)a3 allowPreAssociationScan:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  char isAllowedInLockdownMode;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  NSObject *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSMutableSet *updatedAllowCacheKnownNetworks;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSMutableDictionary *knownNetworkAllowCache;
  void *v171;
  const char *v172;
  uint64_t v173;
  NSMutableDictionary *knownNetworkDeferCache;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  NSMutableDictionary *knownNetworkAllowErrorCache;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  CWFAutoJoinManager *v198;
  unint64_t lowRSSICandidateFoundTimestamp;
  __uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  void *v206;
  void *v207;
  id v208;
  __uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  _BOOL4 v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  char v264;
  void *v265;
  const char *v266;
  int v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  void *v282;
  _BOOL4 v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int v293;
  void *v294;
  NSObject *v295;
  int v296;
  id v297;
  void *v298;
  const char *v299;
  void *v300;
  NSObject *v301;
  id v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  char v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  int isStandalone6G;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  void *v338;
  const char *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  double v376;
  double v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  double v382;
  _BOOL4 v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  double v388;
  double v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  double v394;
  double v395;
  double v396;
  double v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  double v402;
  _BOOL4 v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  double v408;
  double v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  double v414;
  double v415;
  int v416;
  void *v417;
  NSObject *v418;
  void *v419;
  id v420;
  id v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  id v430;
  void *v431;
  id v432;
  void *v433;
  id v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  const char *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  void *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  void *v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  const char *v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t j;
  void *v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  void *v542;
  const char *v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  void *v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  void *v563;
  const char *v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  void *v568;
  const char *v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  void *v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  void *v586;
  const char *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  const char *v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  void *v603;
  const char *v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  void *v608;
  const char *v609;
  uint64_t v610;
  uint64_t v611;
  void *v612;
  NSObject *v613;
  id v614;
  const char *v615;
  uint64_t v616;
  uint64_t v617;
  id v618;
  const char *v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  void *v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  void *v628;
  const char *v629;
  uint64_t v630;
  uint64_t v631;
  const char *v632;
  uint64_t v633;
  uint64_t v634;
  const char *v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  void *v639;
  const char *v640;
  uint64_t v641;
  uint64_t v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  const char *v650;
  uint64_t v651;
  const char *v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  void *v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  const char *v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  void *v665;
  NSObject *v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  _BOOL4 v672;
  const char *v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  void *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  void *v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  const char *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  void *v691;
  const char *v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  void *v696;
  const char *v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  void *v701;
  void *v702;
  const char *v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  void *v707;
  const char *v708;
  uint64_t v709;
  uint64_t v710;
  char v711;
  id v712;
  BOOL v713;
  const char *v714;
  const char *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  NSObject *v719;
  uint64_t v720;
  uint64_t v721;
  void *v722;
  const char *v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  uint64_t v727;
  const char *v728;
  uint64_t v729;
  char v730;
  const char *v731;
  int v732;
  id v733;
  const char *v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  char v738;
  const char *v739;
  uint64_t v740;
  uint64_t v741;
  uint64_t v742;
  char v743;
  id v744;
  const char *v745;
  uint64_t v746;
  uint64_t v747;
  uint64_t v748;
  const char *v749;
  uint64_t v750;
  uint64_t v751;
  uint64_t v752;
  id v753;
  const char *v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  void *v758;
  const char *v759;
  uint64_t v760;
  uint64_t v761;
  uint64_t v762;
  void *v763;
  void *v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  void *v769;
  const char *v770;
  uint64_t v771;
  uint64_t v772;
  int v773;
  void *v774;
  const char *v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  void *v779;
  const char *v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  void *v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  char v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  uint64_t v792;
  void *v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  const char *v798;
  uint64_t v799;
  uint64_t v800;
  const char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  void *v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  void *v810;
  const char *v811;
  uint64_t v812;
  uint64_t v813;
  uint64_t v814;
  void *v815;
  const char *v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  const char *v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  void *v824;
  const char *v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  const char *v829;
  uint64_t v830;
  uint64_t v831;
  uint64_t v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  const char *v837;
  uint64_t v838;
  uint64_t v839;
  uint64_t v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  const char *v845;
  uint64_t v846;
  uint64_t v847;
  uint64_t v848;
  void *v849;
  const char *v850;
  uint64_t v851;
  uint64_t v852;
  uint64_t v853;
  void *v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  void *v858;
  const char *v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  void *v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  uint64_t v867;
  void *v868;
  const char *v869;
  const char *v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  void *v874;
  NSObject *v875;
  NSObject *v876;
  void *v877;
  NSObject *v878;
  NSObject *v879;
  const char *v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  uint64_t v884;
  const char *v885;
  uint64_t v886;
  uint64_t v887;
  uint64_t k;
  uint64_t v889;
  void *v890;
  NSObject *v891;
  NSObject *v892;
  const char *v893;
  const char *v894;
  uint64_t v895;
  uint64_t v896;
  uint64_t v897;
  void *v898;
  NSMutableDictionary *v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  void *v904;
  const char *v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  void *v909;
  const char *v910;
  uint64_t v911;
  const char *v912;
  uint64_t v913;
  uint64_t v914;
  const char *v915;
  uint64_t v916;
  uint64_t v917;
  uint64_t v918;
  NSObject *v919;
  const char *v920;
  uint64_t v921;
  uint64_t v922;
  const char *v923;
  uint64_t v924;
  uint64_t v925;
  const char *v926;
  uint64_t v927;
  uint64_t v928;
  const char *v929;
  uint64_t v930;
  uint64_t v931;
  const char *v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t v936;
  const char *v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  const char *v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  void *v950;
  NSObject *v951;
  uint64_t v952;
  void *v953;
  NSObject *v954;
  NSObject *v955;
  NSObject *v956;
  NSObject *v957;
  const char *v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  const char *v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  uint64_t v967;
  void *v968;
  const char *v969;
  uint64_t v970;
  uint64_t v971;
  uint64_t v972;
  void *v973;
  void *v974;
  const char *v975;
  uint64_t v976;
  uint64_t v977;
  const char *v978;
  uint64_t v979;
  const char *v980;
  uint64_t v981;
  char v982;
  id v983;
  const char *v984;
  uint64_t v985;
  uint64_t v986;
  uint64_t v987;
  void *v988;
  const char *v989;
  uint64_t v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  const char *v994;
  uint64_t v995;
  int v996;
  void *v997;
  NSObject *v998;
  NSObject *v999;
  const char *v1000;
  uint64_t v1001;
  uint64_t v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  const char *v1006;
  uint64_t v1007;
  uint64_t v1008;
  uint64_t v1009;
  void *v1010;
  const char *v1011;
  uint64_t v1012;
  uint64_t v1013;
  uint64_t v1014;
  void *v1015;
  const char *v1016;
  uint64_t v1017;
  uint64_t v1018;
  uint64_t v1019;
  void *v1020;
  const char *v1021;
  uint64_t v1022;
  uint64_t v1023;
  uint64_t v1024;
  void *v1025;
  const char *v1026;
  uint64_t v1027;
  uint64_t v1028;
  int v1029;
  void *v1030;
  const char *v1031;
  uint64_t v1032;
  uint64_t v1033;
  uint64_t v1034;
  const char *v1035;
  uint64_t v1036;
  uint64_t v1037;
  uint64_t v1038;
  const char *v1039;
  uint64_t v1040;
  void *v1041;
  const char *v1042;
  uint64_t v1043;
  uint64_t v1044;
  uint64_t v1045;
  BOOL v1046;
  uint64_t v1047;
  uint64_t v1048;
  void *v1049;
  const char *v1050;
  uint64_t v1051;
  uint64_t v1052;
  uint64_t v1053;
  void *v1054;
  const char *v1055;
  uint64_t v1056;
  uint64_t v1057;
  uint64_t v1058;
  void *v1059;
  const char *v1060;
  uint64_t v1061;
  uint64_t v1062;
  _BOOL4 v1063;
  const char *v1064;
  uint64_t v1065;
  uint64_t v1066;
  uint64_t v1067;
  const char *v1068;
  int v1069;
  id v1070;
  char v1071;
  id v1072;
  const char *v1073;
  uint64_t v1074;
  uint64_t v1075;
  uint64_t v1076;
  const char *v1077;
  uint64_t v1078;
  uint64_t v1079;
  uint64_t v1080;
  const char *v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  void *v1085;
  NSObject *v1086;
  NSObject *v1087;
  const char *v1088;
  uint64_t v1089;
  uint64_t v1090;
  uint64_t v1091;
  uint64_t v1092;
  const char *v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t v1096;
  uint64_t v1097;
  const char *v1098;
  uint64_t v1099;
  void *v1100;
  const char *v1101;
  uint64_t v1102;
  uint64_t v1103;
  uint64_t v1104;
  void *v1105;
  const char *v1106;
  uint64_t v1107;
  uint64_t v1108;
  uint64_t v1109;
  uint64_t v1110;
  const char *v1111;
  id v1112;
  const char *v1113;
  id v1114;
  const char *v1115;
  uint64_t v1116;
  uint64_t v1117;
  uint64_t v1118;
  void *v1119;
  NSObject *v1120;
  NSObject *v1121;
  NSMutableSet *failedToJoinKnownNetworkIDs;
  const char *v1123;
  uint64_t v1124;
  uint64_t v1125;
  uint64_t v1126;
  void *v1127;
  const char *v1128;
  uint64_t v1129;
  uint64_t v1130;
  uint64_t v1131;
  void *v1132;
  const char *v1133;
  uint64_t v1134;
  uint64_t v1135;
  NSMutableDictionary *deferredColocatedJoinCandidateMap;
  const char *v1137;
  uint64_t v1138;
  uint64_t v1139;
  uint64_t v1140;
  void *v1141;
  const char *v1142;
  uint64_t v1143;
  uint64_t v1144;
  uint64_t v1145;
  void *v1146;
  const char *v1147;
  uint64_t v1148;
  id v1149;
  NSMutableOrderedSet *deferredKnownNetworks;
  const char *v1151;
  uint64_t v1152;
  uint64_t v1153;
  uint64_t v1154;
  int v1155;
  void *v1156;
  NSObject *v1157;
  void *v1158;
  id v1159;
  id v1160;
  const char *v1161;
  uint64_t v1162;
  uint64_t v1163;
  const char *v1164;
  uint64_t v1165;
  uint64_t v1166;
  int *v1168;
  int *v1169;
  void *v1170;
  void *context;
  id v1173;
  _BOOL4 v1174;
  void *v1175;
  id v1176;
  id v1177;
  void *v1178;
  void *v1179;
  void *v1180;
  uint64_t v1181;
  uint64_t v1182;
  void *v1183;
  id obj;
  uint64_t i;
  void *v1186;
  void *v1187;
  void *v1188;
  void *v1189;
  void *v1190;
  id v1191;
  id v1193;
  id v1194;
  id v1195;
  void *v1196;
  char isEqual;
  void *v1198;
  void *v1199;
  char v1200;
  id v1201;
  id v1202;
  void *v1203;
  int v1204;
  uint64_t v1205;
  uint64_t v1206;
  id v1207;
  id v1208;
  id v1209;
  id v1210;
  uint64_t v1211;
  void *v1212;
  char v1213;
  int v1214;
  uint64_t v1215;
  void *v1216;
  uint64_t v1217;
  uint64_t v1218;
  uint64_t v1219;
  void *v1220;
  uint64_t v1221;
  void *v1222;
  void *v1223;
  id v1224;
  void *v1225;
  void *v1226;
  void *v1227;
  void *v1228;
  id v1229;
  id v1230;
  id v1231;
  id v1232;
  id v1233;
  id v1234;
  __int128 v1235;
  __int128 v1236;
  __int128 v1237;
  __int128 v1238;
  id v1239;
  char v1240;
  id v1241;
  __int128 v1242;
  __int128 v1243;
  __int128 v1244;
  __int128 v1245;
  __int128 v1246;
  __int128 v1247;
  __int128 v1248;
  __int128 v1249;
  __int128 v1250;
  __int128 v1251;
  __int128 v1252;
  __int128 v1253;
  __int128 v1254;
  __int128 v1255;
  __int128 v1256;
  __int128 v1257;
  __int128 v1258;
  __int128 v1259;
  __int128 v1260;
  __int128 v1261;
  __int128 v1262;
  __int128 v1263;
  __int128 v1264;
  __int128 v1265;
  id v1266;
  uint64_t v1267;
  int v1268;
  _BYTE v1269[24];
  _BYTE v1270[128];
  _BYTE v1271[128];
  _BYTE v1272[128];
  _BYTE v1273[128];
  _BYTE v1274[128];
  _BYTE v1275[128];
  void *v1276;
  _BYTE v1277[128];
  uint64_t v1278;

  v1174 = a4;
  v1278 = *MEMORY[0x1E0C80C00];
  v1173 = a3;
  v1191 = a5;
  objc_msgSend_autoJoinParameters(v1191, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_trigger(v11, v12, v13, v14, v15);
  v1266 = 0;
  v19 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v17, v16, (uint64_t)&v1266, v18);
  v1176 = v1266;

  if (!v19)
  {
    v1178 = 0;
    v1179 = 0;
    v1175 = 0;
    obj = 0;
    v713 = 0;
    goto LABEL_359;
  }
  context = (void *)MEMORY[0x1B5E0A33C]();
  v24 = (void *)objc_msgSend_mutableCopy(v1173, v20, v21, v22, v23);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28);
  v1179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31, v32);
  v1175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_associatedNetwork(self, v33, v34, v35, v36);
  v1178 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1178 && (objc_msgSend_containsObject_(v24, v37, (uint64_t)v1178, v38, v39) & 1) == 0)
    objc_msgSend_addObject_(v24, v40, (uint64_t)v1178, v41, v42);
  v1264 = 0u;
  v1265 = 0u;
  v1262 = 0u;
  v1263 = 0u;
  obj = v24;
  v1223 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v1262, (uint64_t)v1277, 16);
  if (v1223)
  {
    v1219 = *(_QWORD *)v1263;
    v1205 = 138543362;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v1263 != v1219)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*((_QWORD *)&v1262 + 1) + 8 * (_QWORD)v48);
        if ((objc_msgSend_isIBSS(v49, v44, v45, v46, v47, v1168, v1170) & 1) == 0)
        {
          objc_msgSend_scanRecord(v49, v44, v45, v46, v47);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)CFSTR("APPLE_P2P_IE"), v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54 == 0;

          if (v55 && (objc_msgSend_isFILSDiscoveryFrame(v49, v44, v45, v46, v47) & 1) == 0)
          {
            if (objc_msgSend_isAssociationDisallowed(v49, v44, v45, v46, v47))
            {
              CWFGetOSLog();
              v431 = (void *)objc_claimAutoreleasedReturnValue();
              if (v431)
              {
                CWFGetOSLog();
                v79 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v79 = MEMORY[0x1E0C81028];
                v432 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                v1268 = 138543362;
                *(_QWORD *)v1269 = v49;
                LODWORD(v1170) = 12;
                v1168 = &v1268;
                _os_log_send_and_compose_impl();
              }
              goto LABEL_114;
            }
            v60 = (void *)MEMORY[0x1E0CB3940];
            v61 = objc_msgSend_shortSSID(v49, v56, v57, v58, v59);
            objc_msgSend_BSSID(v49, v62, v63, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v49, v67, v68, v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v1170 = v66;
            objc_msgSend_channel(v71, v72, v73, v74, v75);
            v1168 = (int *)v61;
            objc_msgSend_stringWithFormat_(v60, v76, (uint64_t)CFSTR("%lu/%@/%lu"), v77, v78);
            v79 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectForKeyedSubscript_(self->_followup6GHzRNRMap, v80, (uint64_t)v79, v81, v82);
            v1225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v49, v83, v84, v85, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_is6GHz(v87, v88, v89, v90, v91)
              || (objc_msgSend_include6GHzChannels(v1191, v92, v93, v94, v95) & 1) != 0)
            {

              goto LABEL_17;
            }
            if (!v1225)
            {

              goto LABEL_34;
            }
            objc_msgSend_channel(v1225, v96, v97, v98, v99);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = objc_msgSend_is6GHz(v139, v140, v141, v142, v143);

            if (v144)
            {
LABEL_34:
              CWFGetOSLog();
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              if (v207)
              {
                CWFGetOSLog();
                v156 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v156 = MEMORY[0x1E0C81028];
                v208 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
              {
                v1268 = 138543362;
                *(_QWORD *)v1269 = v49;
                LODWORD(v1170) = 12;
                v1168 = &v1268;
                goto LABEL_60;
              }
              goto LABEL_112;
            }
LABEL_17:
            if (objc_msgSend_lockdownModeEnabled(self, v100, v101, v102, v103))
            {
              objc_msgSend_autoJoinParameters(v1191, v104, v105, v106, v107);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = objc_msgSend_trigger(v108, v109, v110, v111, v112);
              objc_msgSend_autoJoinParameters(v1191, v114, v115, v116, v117);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_targetNetworkProfile(v118, v119, v120, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_SSID(v123, v124, v125, v126, v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_SSID(v49, v129, v130, v131, v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend___shouldBypassLockdownModeCheckForTrigger_targetNetworkSSID_networkSSID_(self, v134, v113, (uint64_t)v128, (uint64_t)v133) & 1) != 0)
              {

                goto LABEL_24;
              }
              isAllowedInLockdownMode = objc_msgSend_isAllowedInLockdownMode(v49, v135, v136, v137, v138);

              if ((isAllowedInLockdownMode & 1) != 0)
                goto LABEL_24;
              CWFGetOSLog();
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              if (v206)
              {
                CWFGetOSLog();
                v156 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v156 = MEMORY[0x1E0C81028];
                v297 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
              {
                v1268 = 138543362;
                *(_QWORD *)v1269 = v49;
                LODWORD(v1170) = 12;
                v1168 = &v1268;
LABEL_60:
                _os_log_send_and_compose_impl();
              }
LABEL_112:

LABEL_113:
LABEL_114:

              goto LABEL_115;
            }
LABEL_24:
            if (!objc_msgSend___preflightMatchKnownNetworksForScanResult_(self, v104, (uint64_t)v49, v106, v107))goto LABEL_113;
            objc_msgSend_knownNetworks(v1191, v146, v147, v148, v149);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_array(v150, v151, v152, v153, v154);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B06420C0(v49, v155);
            v156 = (id)objc_claimAutoreleasedReturnValue();

            if (!v156)
              goto LABEL_113;
            updatedAllowCacheKnownNetworks = self->_updatedAllowCacheKnownNetworks;
            objc_msgSend_identifier(v156, v157, v158, v159, v160);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(updatedAllowCacheKnownNetworks) = objc_msgSend_containsObject_(updatedAllowCacheKnownNetworks, v163, (uint64_t)v162, v164, v165);

            if ((updatedAllowCacheKnownNetworks & 1) == 0)
            {
              knownNetworkAllowCache = self->_knownNetworkAllowCache;
              objc_msgSend_identifier(v156, v166, v167, v168, v169);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowCache, v172, 0, (uint64_t)v171, v173);

              knownNetworkDeferCache = self->_knownNetworkDeferCache;
              objc_msgSend_identifier(v156, v175, v176, v177, v178);
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkDeferCache, v180, 0, (uint64_t)v179, v181);

              knownNetworkAllowErrorCache = self->_knownNetworkAllowErrorCache;
              objc_msgSend_identifier(v156, v183, v184, v185, v186);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(knownNetworkAllowErrorCache, v188, 0, (uint64_t)v187, v189);

            }
            objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v49, v166, (uint64_t)v156, v168, v169);
            v1227 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_RSSI(v1227, v190, v191, v192, v193) <= -91)
            {
              v198 = self;
              objc_sync_enter(v198);
              lowRSSICandidateFoundTimestamp = self->_lowRSSICandidateFoundTimestamp;
              v200 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
              if (lowRSSICandidateFoundTimestamp <= v200 - 1000000 * objc_msgSend_age(v1227, v201, v202, v203, v204))
              {
                v209 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
                v205 = v209 - 1000000 * objc_msgSend_age(v1227, v210, v211, v212, v213);
              }
              else
              {
                v205 = self->_lowRSSICandidateFoundTimestamp;
              }
              self->_lowRSSICandidateFoundTimestamp = v205;
              objc_sync_exit(v198);

            }
            v214 = objc_msgSend_RSSI(v49, v194, v195, v196, v197);
            if (v214 < objc_msgSend_minRSSI(v1191, v215, v216, v217, v218))
            {
              CWFGetOSLog();
              v433 = (void *)objc_claimAutoreleasedReturnValue();
              if (v433)
              {
                CWFGetOSLog();
                v295 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v295 = MEMORY[0x1E0C81028];
                v434 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
              {
                v439 = objc_msgSend_minRSSI(v1191, v435, v436, v437, v438);
                v1268 = 134218242;
                *(_QWORD *)v1269 = v439;
                *(_WORD *)&v1269[8] = 2114;
                *(_QWORD *)&v1269[10] = v49;
                LODWORD(v1170) = 22;
                v1168 = &v1268;
                _os_log_send_and_compose_impl();
              }
            }
            else
            {
              objc_msgSend_autoJoinParameters(v1191, v219, v220, v221, v222);
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_trigger(v223, v224, v225, v226, v227) == 54)
              {

                goto LABEL_45;
              }
              objc_msgSend_autoJoinParameters(v1191, v228, v229, v230, v231);
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              v241 = objc_msgSend_trigger(v236, v237, v238, v239, v240) == 55;

              if (v241)
              {
LABEL_45:
                objc_msgSend_SSID(v1227, v232, v233, v234, v235);
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_SSID(v1178, v243, v244, v245, v246);
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                if (v242 == v251)
                {

                  goto LABEL_69;
                }
                objc_msgSend_SSID(v1227, v247, v248, v249, v250);
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                if (v256)
                {
                  objc_msgSend_SSID(v1178, v252, v253, v254, v255);
                  v1203 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v1203)
                  {
                    objc_msgSend_SSID(v1227, v252, v253, v254, v255);
                    v1193 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_SSID(v1178, v257, v258, v259, v260);
                    v1196 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_isEqual_(v1193, v261, (uint64_t)v1196, v262, v263))
                    {

                      v264 = 1;
                      goto LABEL_67;
                    }
                    v296 = 1;
                  }
                  else
                  {
                    v296 = 0;
                    v1203 = 0;
                  }
                }
                else
                {
                  v296 = 0;
                }
                objc_msgSend_associatedNetwork(self, v252, v253, v254, v255);
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                v264 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(self, v299, (uint64_t)v1227, (uint64_t)v298, (uint64_t)v1191);

                if (v296)
                {

                  if (!v256)
                    goto LABEL_65;
LABEL_67:

                }
                else
                {
                  if (v256)
                    goto LABEL_67;
LABEL_65:

                }
                if ((v264 & 1) != 0)
                {
LABEL_69:
                  CWFGetOSLog();
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v300)
                  {
                    CWFGetOSLog();
                    v301 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v301 = MEMORY[0x1E0C81028];
                    v302 = MEMORY[0x1E0C81028];
                  }

                  if (os_log_type_enabled(v301, OS_LOG_TYPE_DEFAULT))
                  {
                    v1268 = 138543362;
                    *(_QWORD *)v1269 = v1227;
                    LODWORD(v1170) = 12;
                    v1168 = &v1268;
                    _os_log_send_and_compose_impl();
                  }

                  objc_msgSend_channel(v49, v303, v304, v305, v306);
                  v307 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_is6GHz(v307, v308, v309, v310, v311))
                  {
                    v316 = objc_msgSend_allowStandalone6GHz(v1191, v312, v313, v314, v315);

                    if ((v316 & 1) == 0)
                    {
                      objc_msgSend_matchingKnownNetworkProfile(v1227, v317, v318, v319, v320);
                      v321 = (void *)objc_claimAutoreleasedReturnValue();
                      isStandalone6G = objc_msgSend_isStandalone6G(v321, v322, v323, v324, v325);

                      if (isStandalone6G)
                      {
                        objc_msgSend_knownNetworks(self, v327, v328, v329, v330);
                        v331 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_allObjects(v331, v332, v333, v334, v335);
                        v336 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend___knownNetworksSupportingSeamlessSSIDTransition_fromNetwork_allowSameSSID_context_(self, v337, (uint64_t)v336, (uint64_t)v1227, 0, v1191);
                        v338 = (void *)objc_claimAutoreleasedReturnValue();

                        v1260 = 0u;
                        v1261 = 0u;
                        v1258 = 0u;
                        v1259 = 0u;
                        v1207 = v338;
                        v1215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1207, v339, (uint64_t)&v1258, (uint64_t)v1275, 16);
                        if (v1215)
                        {
                          v1200 = 0;
                          v1211 = *(_QWORD *)v1259;
LABEL_79:
                          v344 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v1259 != v1211)
                              objc_enumerationMutation(v1207);
                            v345 = *(void **)(*((_QWORD *)&v1258 + 1) + 8 * v344);
                            if ((objc_msgSend_isStandalone6G(v345, v340, v341, v342, v343, v1168) & 1) == 0)
                            {
                              objc_msgSend_matchingKnownNetworkProfile(v1227, v340, v341, v342, v343);
                              v346 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_lastDiscoveredAt(v346, v347, v348, v349, v350);
                              v351 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend_matchingKnownNetworkProfile(v1227, v352, v353, v354, v355);
                              v356 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_lastJoinedAt(v356, v357, v358, v359, v360);
                              v361 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend_lastDiscoveredAt(v345, v362, v363, v364, v365);
                              v366 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_lastJoinedAt(v345, v367, v368, v369, v370);
                              v375 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v351)
                              {
                                if (v366)
                                {
                                  objc_msgSend_timeIntervalSinceReferenceDate(v351, v371, v372, v373, v374);
                                  v377 = v376;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v366, v378, v379, v380, v381);
                                  v383 = floor(v377) - floor(v382) < 0.0;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v351, v384, v385, v386, v387);
                                  v389 = v388;
                                  objc_msgSend_timeIntervalSinceReferenceDate(v366, v390, v391, v392, v393);
                                  v395 = floor(v389) - floor(v394);
                                  if (v383)
                                    v395 = -v395;
                                  if (v395 < 86400.0)
                                    goto LABEL_93;
                                }
                              }
                              if (!v361 || !v375)
                                goto LABEL_94;
                              objc_msgSend_timeIntervalSinceReferenceDate(v361, v371, v372, v373, v374);
                              v397 = v396;
                              objc_msgSend_timeIntervalSinceReferenceDate(v375, v398, v399, v400, v401);
                              v403 = floor(v397) - floor(v402) < 0.0;
                              objc_msgSend_timeIntervalSinceReferenceDate(v361, v404, v405, v406, v407);
                              v409 = v408;
                              objc_msgSend_timeIntervalSinceReferenceDate(v375, v410, v411, v412, v413);
                              v415 = floor(v409) - floor(v414);
                              if (v403)
                                v415 = -v415;
                              if (v415 < 86400.0)
                              {
LABEL_93:
                                v416 = 0;
                                v1200 = 1;
                              }
                              else
                              {
LABEL_94:
                                v416 = 1;
                              }

                              if (!v416)
                                break;
                            }
                            if (v1215 == ++v344)
                            {
                              v1215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1207, v340, (uint64_t)&v1258, (uint64_t)v1275, 16);
                              if (v1215)
                                goto LABEL_79;
                              break;
                            }
                          }

                          if ((v1200 & 1) != 0)
                          {
                            CWFGetOSLog();
                            v417 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v417)
                            {
                              CWFGetOSLog();
                              v418 = (id)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v418 = MEMORY[0x1E0C81028];
                              v421 = MEMORY[0x1E0C81028];
                            }

                            if (os_log_type_enabled(v418, OS_LOG_TYPE_DEBUG))
                            {
                              objc_msgSend_networkName(v1227, v422, v423, v424, v425);
                              v426 = (void *)objc_claimAutoreleasedReturnValue();
                              v1268 = 138543362;
                              *(_QWORD *)v1269 = v426;
                              LODWORD(v1170) = 12;
                              v1168 = &v1268;
                              _os_log_send_and_compose_impl();

                            }
                            objc_msgSend_addObject_(v1179, v427, (uint64_t)v1227, v428, v429);
                            goto LABEL_111;
                          }
                        }
                        else
                        {

                        }
                      }
                      objc_msgSend_addObject_(v1175, v327, (uint64_t)v1227, v329, v330, v1168);
LABEL_111:

                      goto LABEL_112;
                    }
                  }
                  else
                  {

                  }
                  objc_msgSend_addObject_(v1179, v317, (uint64_t)v1227, v319, v320, v1168);
                  goto LABEL_111;
                }
                CWFGetOSLog();
                v419 = (void *)objc_claimAutoreleasedReturnValue();
                if (v419)
                {
                  CWFGetOSLog();
                  v295 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v295 = MEMORY[0x1E0C81028];
                  v420 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
                {
                  v1268 = 138543362;
                  *(_QWORD *)v1269 = v1227;
                  LODWORD(v1170) = 12;
                  v1168 = &v1268;
                  _os_log_send_and_compose_impl();
                }
              }
              else
              {
                objc_msgSend_associatedNetwork(self, v232, v233, v234, v235);
                v265 = (void *)objc_claimAutoreleasedReturnValue();
                v267 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(self, v266, (uint64_t)v1227, (uint64_t)v265, (uint64_t)v1191);

                if (!v267)
                  goto LABEL_69;
                objc_msgSend_matchingKnownNetworkProfile(v1178, v268, v269, v270, v271);
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_matchingKnownNetworkProfile(v1227, v273, v274, v275, v276);
                v277 = (void *)objc_claimAutoreleasedReturnValue();
                v1276 = v277;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v278, (uint64_t)&v1276, 1, v279);
                v280 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(self, v281, (uint64_t)v272, (uint64_t)v280, (uint64_t)v1191);
                v282 = (void *)objc_claimAutoreleasedReturnValue();
                v283 = v282 == 0;

                if (!v283)
                  goto LABEL_69;
                objc_msgSend_channel(v1227, v284, v285, v286, v287);
                v288 = (void *)objc_claimAutoreleasedReturnValue();
                v293 = objc_msgSend_is2GHz(v288, v289, v290, v291, v292);

                if (!v293)
                  goto LABEL_69;
                CWFGetOSLog();
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                if (v294)
                {
                  CWFGetOSLog();
                  v295 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v295 = MEMORY[0x1E0C81028];
                  v430 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
                {
                  v1268 = 138543362;
                  *(_QWORD *)v1269 = v1227;
                  LODWORD(v1170) = 12;
                  v1168 = &v1268;
                  _os_log_send_and_compose_impl();
                }
              }
            }

            goto LABEL_111;
          }
        }
LABEL_115:
        v48 = (char *)v48 + 1;
      }
      while (v48 != v1223);
      v440 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v1262, (uint64_t)v1277, 16);
      v1223 = (void *)v440;
    }
    while (v440);
  }

  if (!objc_msgSend_count(v1175, v441, v442, v443, v444))
    goto LABEL_189;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v445, v446, v447, v448);
  v1180 = (void *)objc_claimAutoreleasedReturnValue();
  v1256 = 0u;
  v1257 = 0u;
  v1254 = 0u;
  v1255 = 0u;
  v1177 = v1175;
  v1182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1177, v449, (uint64_t)&v1254, (uint64_t)v1274, 16);
  if (!v1182)
    goto LABEL_188;
  v1181 = *(_QWORD *)v1255;
  do
  {
    for (i = 0; i != v1182; ++i)
    {
      if (*(_QWORD *)v1255 != v1181)
        objc_enumerationMutation(v1177);
      v1228 = *(void **)(*((_QWORD *)&v1254 + 1) + 8 * i);
      objc_msgSend_autoJoinParameters(v1191, v450, v451, v452, v453, v1168, v1170);
      v1201 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v1201, v454, v455, v456, v457);
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v458, v459, v460, v461, v462);
      v463 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_matchingKnownNetworkProfile(v1228, v464, v465, v466, v467);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v468, v469, v470, v471, v472);
      v477 = (void *)objc_claimAutoreleasedReturnValue();
      if (v463 == v477)
      {

LABEL_149:
LABEL_150:
        objc_msgSend_addObject_(v1180, v523, (uint64_t)v1228, v524, v525);
        continue;
      }
      objc_msgSend_autoJoinParameters(v1191, v473, v474, v475, v476);
      v1220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetNetworkProfile(v1220, v478, v479, v480, v481);
      v482 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v482, v483, v484, v485, v486);
      v491 = (void *)objc_claimAutoreleasedReturnValue();
      if (v491)
      {
        objc_msgSend_matchingKnownNetworkProfile(v1228, v487, v488, v489, v490);
        v1216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v1216, v492, v493, v494, v495);
        v500 = (void *)objc_claimAutoreleasedReturnValue();
        if (v500)
        {
          objc_msgSend_autoJoinParameters(v1191, v496, v497, v498, v499);
          v1212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_targetNetworkProfile(v1212, v501, v502, v503, v504);
          v1208 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v1208, v505, v506, v507, v508);
          v509 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matchingKnownNetworkProfile(v1228, v510, v511, v512, v513);
          v514 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v514, v515, v516, v517, v518);
          v519 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v509, v520, (uint64_t)v519, v521, v522);

          if ((isEqual & 1) != 0)
            goto LABEL_150;
          goto LABEL_153;
        }

      }
LABEL_153:
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1201 = v1179;
      v1221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1201, v526, (uint64_t)&v1250, (uint64_t)v1273, 16);
      if (!v1221)
        goto LABEL_180;
      v1217 = *(_QWORD *)v1251;
      do
      {
        for (j = 0; j != v1221; ++j)
        {
          if (*(_QWORD *)v1251 != v1217)
            objc_enumerationMutation(v1201);
          v532 = *(void **)(*((_QWORD *)&v1250 + 1) + 8 * j);
          objc_msgSend_SSID(v1228, v527, v528, v529, v530);
          v533 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v532, v534, v535, v536, v537);
          v542 = (void *)objc_claimAutoreleasedReturnValue();
          if (v533 != v542)
          {
            objc_msgSend_SSID(v1228, v538, v539, v540, v541);
            v1225 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v1225)
              goto LABEL_169;
            objc_msgSend_SSID(v532, v543, v544, v545, v546);
            v1223 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v1223)
              goto LABEL_168;
            objc_msgSend_SSID(v1228, v547, v548, v549, v550);
            v1203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_SSID(v532, v551, v552, v553, v554);
            v1205 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqual_(v1203, v555, v1205, v556, v557) & 1) == 0)
            {

LABEL_168:
LABEL_169:

              continue;
            }
          }
          objc_msgSend_matchingKnownNetworkProfile(v1228, v538, v539, v540, v541);
          v558 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v558, v559, v560, v561, v562);
          v563 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_matchingKnownNetworkProfile(v532, v564, v565, v566, v567);
          v568 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v568, v569, v570, v571, v572);
          v577 = (void *)objc_claimAutoreleasedReturnValue();
          if (v563 == v577)
          {
            v1213 = 1;
          }
          else
          {
            objc_msgSend_matchingKnownNetworkProfile(v1228, v573, v574, v575, v576);
            v1209 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_identifier(v1209, v578, v579, v580, v581);
            v586 = (void *)objc_claimAutoreleasedReturnValue();
            if (v586)
            {
              objc_msgSend_matchingKnownNetworkProfile(v532, v582, v583, v584, v585);
              v1198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_identifier(v1198, v587, v588, v589, v590);
              v1194 = (id)objc_claimAutoreleasedReturnValue();
              if (v1194)
              {
                objc_msgSend_matchingKnownNetworkProfile(v1228, v591, v592, v593, v594);
                v1189 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_identifier(v1189, v595, v596, v597, v598);
                v1187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_matchingKnownNetworkProfile(v532, v599, v600, v601, v602);
                v603 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_identifier(v603, v604, v605, v606, v607);
                v608 = (void *)objc_claimAutoreleasedReturnValue();
                v1213 = objc_msgSend_isEqual_(v1187, v609, (uint64_t)v608, v610, v611);

              }
              else
              {
                v1213 = 0;
              }

            }
            else
            {
              v1213 = 0;
            }

          }
          if (v533 == v542)
          {

          }
          else
          {

          }
          if ((v1213 & 1) != 0)
            goto LABEL_149;
        }
        v1221 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1201, v527, (uint64_t)&v1250, (uint64_t)v1273, 16);
      }
      while (v1221);
LABEL_180:

      CWFGetOSLog();
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      if (v612)
      {
        CWFGetOSLog();
        v613 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v613 = MEMORY[0x1E0C81028];
        v614 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v613, OS_LOG_TYPE_DEBUG))
      {
        v1268 = 138543362;
        *(_QWORD *)v1269 = v1228;
        LODWORD(v1170) = 12;
        v1168 = &v1268;
        _os_log_send_and_compose_impl();
      }

    }
    v1182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1177, v450, (uint64_t)&v1254, (uint64_t)v1274, 16);
  }
  while (v1182);
LABEL_188:

  objc_msgSend_addObjectsFromArray_(v1179, v615, (uint64_t)v1180, v616, v617);
LABEL_189:
  v618 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend_candidates(self->_metric, v619, v620, v621, v622);
  v623 = (void *)objc_claimAutoreleasedReturnValue();

  if (v623)
  {
    objc_msgSend_candidates(self->_metric, v624, v625, v626, v627);
    v628 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v618, v629, (uint64_t)v628, v630, v631);

  }
  objc_msgSend_addObjectsFromArray_(v618, v624, (uint64_t)v1179, v626, v627, v1168);
  objc_msgSend_addObjectsFromArray_(v618, v632, (uint64_t)v1175, v633, v634);
  objc_msgSend_allObjects(v618, v635, v636, v637, v638);
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCandidates_(self->_metric, v640, (uint64_t)v639, v641, v642);

  if (!objc_msgSend_count(v1179, v643, v644, v645, v646))
  {
    CWFGetOSLog();
    v665 = (void *)objc_claimAutoreleasedReturnValue();
    if (v665)
    {
      CWFGetOSLog();
      v666 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v666 = MEMORY[0x1E0C81028];
      v712 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v666, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v1268) = 0;
      _os_log_send_and_compose_impl();
    }

    v713 = 0;
    goto LABEL_358;
  }
  objc_msgSend___updateAutoJoinState_(self, v647, 3, v648, v649);
  objc_msgSend___sortJoinCandidates_context_(self, v650, (uint64_t)v1179, (uint64_t)v1191, v651);
  if (!v1178)
    goto LABEL_214;
  objc_msgSend_autoJoinParameters(v1191, v652, v653, v654, v655);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v656, v657, v658, v659, v660) == 54)
  {

    goto LABEL_198;
  }
  objc_msgSend_autoJoinParameters(v1191, v661, v662, v663, v664);
  v667 = (void *)objc_claimAutoreleasedReturnValue();
  v672 = objc_msgSend_trigger(v667, v668, v669, v670, v671) == 55;

  if (v672)
  {
LABEL_198:
    v1248 = 0u;
    v1249 = 0u;
    v1246 = 0u;
    v1247 = 0u;
    v1229 = v1179;
    v675 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1229, v673, (uint64_t)&v1246, (uint64_t)v1272, 16);
    if (v675)
    {
      v676 = *(_QWORD *)v1247;
LABEL_200:
      v677 = 0;
      while (1)
      {
        if (*(_QWORD *)v1247 != v676)
          objc_enumerationMutation(v1229);
        v678 = *(void **)(*((_QWORD *)&v1246 + 1) + 8 * v677);
        if (objc_msgSend___allowJoinCandidate_context_defer_error_(self, v674, (uint64_t)v678, (uint64_t)v1191, 0, 0))
        {
          objc_msgSend_SSID(v678, v674, v679, v680, v681);
          v682 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v1178, v683, v684, v685, v686);
          v691 = (void *)objc_claimAutoreleasedReturnValue();
          if (v682 == v691)
          {

LABEL_220:
            v1214 = 1;
            goto LABEL_221;
          }
          objc_msgSend_SSID(v678, v687, v688, v689, v690);
          v696 = (void *)objc_claimAutoreleasedReturnValue();
          if (v696)
          {
            objc_msgSend_SSID(v1178, v692, v693, v694, v695);
            v701 = (void *)objc_claimAutoreleasedReturnValue();
            if (v701)
            {
              objc_msgSend_SSID(v678, v697, v698, v699, v700);
              v702 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_SSID(v1178, v703, v704, v705, v706);
              v707 = (void *)objc_claimAutoreleasedReturnValue();
              v711 = objc_msgSend_isEqual_(v702, v708, (uint64_t)v707, v709, v710);

              if ((v711 & 1) != 0)
                goto LABEL_220;
              goto LABEL_211;
            }

          }
        }
LABEL_211:
        if (v675 == ++v677)
        {
          v675 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1229, v674, (uint64_t)&v1246, (uint64_t)v1272, 16);
          if (v675)
            goto LABEL_200;
          break;
        }
      }
    }
    v1214 = 0;
LABEL_221:

  }
  else
  {
LABEL_214:
    v1214 = 0;
  }
  v1244 = 0u;
  v1245 = 0u;
  v1242 = 0u;
  v1243 = 0u;
  v1195 = v1179;
  v1210 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v1195, v714, (uint64_t)&v1242, (uint64_t)v1271, 16);
  if (!v1210)
  {
LABEL_341:
    v1155 = 0;
LABEL_355:

    v1224 = v1176;
LABEL_356:
    objc_msgSend___updateDiscoverTimestampForJoinCandidates_(self, v1161, (uint64_t)v1195, v1162, v1163, v1169, v1170);
    objc_msgSend___updateDiscoverTimestampForJoinCandidates_(self, v1164, (uint64_t)v1175, v1165, v1166);
    goto LABEL_357;
  }
  v719 = MEMORY[0x1E0C81028];
  v1206 = *(_QWORD *)v1243;
  while (2)
  {
    v720 = 0;
LABEL_225:
    if (*(_QWORD *)v1243 != v1206)
    {
      v721 = v720;
      objc_enumerationMutation(v1195);
      v720 = v721;
    }
    v1218 = v720;
    v1226 = *(void **)(*((_QWORD *)&v1242 + 1) + 8 * v720);
    objc_msgSend_autoJoinParameters(v1191, v715, v716, v717, v718, v1169, v1170);
    v722 = (void *)objc_claimAutoreleasedReturnValue();
    v727 = objc_msgSend_trigger(v722, v723, v724, v725, v726);
    v1241 = v1176;
    v730 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v728, v727, (uint64_t)&v1241, v729);
    v1224 = v1241;

    if ((v730 & 1) == 0)
    {

      goto LABEL_364;
    }
    v1240 = 0;
    v1239 = 0;
    v732 = objc_msgSend___allowJoinCandidate_context_defer_error_(self, v731, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1240, &v1239);
    v733 = v1239;
    if (!v732)
    {
      v1149 = v1224;
LABEL_336:
      v1176 = v1149;

      v720 = v1218 + 1;
      if ((id)(v1218 + 1) == v1210)
      {
        v1154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1195, v715, (uint64_t)&v1242, (uint64_t)v1271, 16);
        v1210 = (id)v1154;
        if (!v1154)
          goto LABEL_341;
        continue;
      }
      goto LABEL_225;
    }
    break;
  }
  v1222 = v733;
  v738 = objc_msgSend_allowDeferredCandidates(v1191, v734, v735, v736, v737);
  if (v1240)
    v743 = v738;
  else
    v743 = 1;
  if ((v743 & 1) == 0)
  {
    deferredKnownNetworks = self->_deferredKnownNetworks;
    objc_msgSend_matchingKnownNetworkProfile(v1226, v739, v740, v741, v742);
    v744 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(deferredKnownNetworks, v1151, (uint64_t)v744, v1152, v1153);
    goto LABEL_334;
  }
  if (!v1214)
    goto LABEL_240;
  objc_msgSend_SSID(v1226, v739, v740, v741, v742);
  v744 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v1178, v745, v746, v747, v748);
  v753 = (id)objc_claimAutoreleasedReturnValue();
  if (v744 == v753)
  {

    goto LABEL_240;
  }
  objc_msgSend_SSID(v1226, v749, v750, v751, v752);
  v758 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v758)
  {

    goto LABEL_334;
  }
  objc_msgSend_SSID(v1178, v754, v755, v756, v757);
  v763 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v763)
  {

    goto LABEL_334;
  }
  objc_msgSend_SSID(v1226, v759, v760, v761, v762);
  v764 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v1178, v765, v766, v767, v768);
  v769 = (void *)objc_claimAutoreleasedReturnValue();
  v773 = objc_msgSend_isEqual_(v764, v770, (uint64_t)v769, v771, v772);

  if (!v773)
  {
LABEL_335:
    v733 = v1222;
    v1149 = v1224;
    goto LABEL_336;
  }
LABEL_240:
  objc_msgSend_allKeys(self->_deferredColocatedJoinCandidateMap, v739, v740, v741, v742);
  v774 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(v1226, v775, v776, v777, v778);
  v779 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v779, v780, v781, v782, v783);
  v784 = (void *)objc_claimAutoreleasedReturnValue();
  v788 = objc_msgSend_containsObject_(v774, v785, (uint64_t)v784, v786, v787);

  if ((v788 & 1) != 0)
  {
    objc_msgSend_allValues(self->_deferredColocatedJoinCandidateMap, v789, v790, v791, v792);
    v793 = (void *)objc_claimAutoreleasedReturnValue();
    v744 = (id)objc_msgSend_mutableCopy(v793, v794, v795, v796, v797);

    objc_msgSend___sortKnownNetworksByJoinTimestamp_(self, v798, (uint64_t)v744, v799, v800);
    objc_msgSend_matchingKnownNetworkProfile(v1226, v801, v802, v803, v804);
    v805 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v805, v806, v807, v808, v809);
    v810 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v744, v811, v812, v813, v814);
    v815 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v815, v816, v817, v818, v819);
    v824 = (void *)objc_claimAutoreleasedReturnValue();
    if (v810 == v824)
    {
      v1204 = 1;
    }
    else
    {
      objc_msgSend_matchingKnownNetworkProfile(v1226, v820, v821, v822, v823);
      v1202 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v1202, v825, v826, v827, v828);
      v1199 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1199)
      {
        objc_msgSend_firstObject(v744, v829, v830, v831, v832);
        v1190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v1190, v833, v834, v835, v836);
        v1188 = (void *)objc_claimAutoreleasedReturnValue();
        if (v1188)
        {
          objc_msgSend_matchingKnownNetworkProfile(v1226, v837, v838, v839, v840);
          v1186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v1186, v841, v842, v843, v844);
          v1183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v744, v845, v846, v847, v848);
          v849 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v849, v850, v851, v852, v853);
          v854 = (void *)objc_claimAutoreleasedReturnValue();
          v1204 = objc_msgSend_isEqual_(v1183, v855, (uint64_t)v854, v856, v857);

        }
        else
        {
          v1204 = 0;
        }

      }
      else
      {
        v1204 = 0;
      }

    }
    CWFGetOSLog();
    v952 = objc_claimAutoreleasedReturnValue();
    v953 = (void *)v952;
    if (v1204)
    {
      if (v952)
      {
        CWFGetOSLog();
        v919 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v955 = v719;
        v919 = v719;
      }

      if (os_log_type_enabled(v919, OS_LOG_TYPE_DEFAULT))
      {
        v1268 = 138543362;
        *(_QWORD *)v1269 = v1226;
        LODWORD(v1170) = 12;
        v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
      goto LABEL_306;
    }
    if (v952)
    {
      CWFGetOSLog();
      v954 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v956 = v719;
      v954 = v719;
    }

    if (os_log_type_enabled(v954, OS_LOG_TYPE_DEFAULT))
    {
      v1268 = 138543362;
      *(_QWORD *)v1269 = v1226;
      LODWORD(v1170) = 12;
      v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }

LABEL_334:
    goto LABEL_335;
  }
  objc_msgSend_matchingKnownNetworkProfile(v1226, v789, v790, v791, v792);
  v858 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_knownNetworks(self, v859, v860, v861, v862);
  v863 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v863, v864, v865, v866, v867);
  v868 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___morePreferredKnownNetworksWithCandidate_knownNetworks_context_(self, v869, (uint64_t)v858, (uint64_t)v868, (uint64_t)v1191);
  v744 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v744, v870, v871, v872, v873))
  {
LABEL_307:

    if ((v1214 & 1) != 0)
      goto LABEL_309;
    objc_msgSend_matchingKnownNetworkProfile(v1178, v1006, v1007, v1008, v1009);
    v1010 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v1010, v1011, v1012, v1013, v1014);
    v1015 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_matchingKnownNetworkProfile(v1226, v1016, v1017, v1018, v1019);
    v1020 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v1020, v1021, v1022, v1023, v1024);
    v1025 = (void *)objc_claimAutoreleasedReturnValue();
    v1029 = objc_msgSend_isEqual_(v1015, v1026, (uint64_t)v1025, v1027, v1028);

    if (v1029)
    {
      CWFGetOSLog();
      v1156 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1156)
      {
        CWFGetOSLog();
        v1157 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v1157 = MEMORY[0x1E0C81028];
        v1159 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v1157, OS_LOG_TYPE_DEFAULT))
      {
        v1268 = 138543362;
        *(_QWORD *)v1269 = v1178;
        LODWORD(v1170) = 12;
        v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
LABEL_309:
      objc_msgSend_autoJoinParameters(v1191, v1006, v1007, v1008, v1009, v1169);
      v1030 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_trigger(v1030, v1031, v1032, v1033, v1034) == 54)
      {

        goto LABEL_313;
      }
      objc_msgSend_autoJoinParameters(v1191, v1035, v1036, v1037, v1038);
      v1041 = (void *)objc_claimAutoreleasedReturnValue();
      v1046 = objc_msgSend_trigger(v1041, v1042, v1043, v1044, v1045) == 55;

      if (v1046)
        goto LABEL_313;
      objc_msgSend_associatedNetwork(self, v1039, v1047, v1048, v1040);
      v1049 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_matchingKnownNetworkProfile(v1049, v1050, v1051, v1052, v1053);
      v1054 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_matchingKnownNetworkProfile(v1226, v1055, v1056, v1057, v1058);
      v1059 = (void *)objc_claimAutoreleasedReturnValue();
      v1063 = objc_msgSend_compareUserPriority_(v1054, v1060, (uint64_t)v1059, v1061, v1062) == 1;

      if (!v1063)
      {
LABEL_313:
        if (v1174)
        {
          objc_msgSend___performPreAssociationScanWithContext_network_(self, v1039, (uint64_t)v1191, (uint64_t)v1226, v1040);
          v744 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend_count(v744, v1064, v1065, v1066, v1067))
            goto LABEL_334;
          v1232 = v1224;
          v1069 = objc_msgSend___matchAndJoinScanResults_allowPreAssociationScan_context_error_(self, v1068, (uint64_t)v744, 0, (uint64_t)v1191, &v1232);
          v1070 = v1232;

          if (!v1069)
          {
            v1224 = v1070;
            goto LABEL_334;
          }

          v1224 = v1070;
        }
        else
        {
          v1231 = 0;
          v1071 = objc_msgSend___performJoinWithNetwork_context_error_(self, v1039, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1231);
          v1072 = v1231;
          v744 = v1072;
          if ((v1071 & 1) == 0)
          {
            if (objc_msgSend_code(v1072, v1073, v1074, v1075, v1076) == -3936
              || objc_msgSend_code(v744, v1077, v1078, v1079, v1080) == -3947)
            {
              CWFGetOSLog();
              v1085 = (void *)objc_claimAutoreleasedReturnValue();
              if (v1085)
              {
                CWFGetOSLog();
                v1086 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v1087 = v719;
                v1086 = v719;
              }

              if (os_log_type_enabled(v1086, OS_LOG_TYPE_DEFAULT))
              {
                v1092 = objc_msgSend_code(v744, v1088, v1089, v1090, v1091);
                v1268 = 134217984;
                *(_QWORD *)v1269 = v1092;
                v1169 = &v1268;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_channel(v1226, v1093, v1094, v1095, v1096);
              v1097 = objc_claimAutoreleasedReturnValue();
              v1267 = v1097;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1098, (uint64_t)&v1267, 1, v1099);
              v1100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_SSIDList(v1191, v1101, v1102, v1103, v1104);
              v1105 = (void *)objc_claimAutoreleasedReturnValue();
              v1110 = objc_msgSend_dwellTime(v1191, v1106, v1107, v1108, v1109);
              LOBYTE(v1169) = 0;
              v1112 = (id)objc_msgSend___performScanWithChannelList_SSIDList_passive_dwellTime_maxCacheAge_cacheOnly_isPreAssociationScan_error_(self, v1111, (uint64_t)v1100, (uint64_t)v1105, 0, v1110, 0, 0, v1169, 0);

              v1230 = v744;
              LOBYTE(v1097) = objc_msgSend___performJoinWithNetwork_context_error_(self, v1113, (uint64_t)v1226, (uint64_t)v1191, (uint64_t)&v1230);
              v1114 = v1230;

              v744 = v1114;
              if ((v1097 & 1) != 0)
                goto LABEL_366;
            }
            if (objc_msgSend_code(v744, v1081, v1082, v1083, v1084) != -3936
              && objc_msgSend_code(v744, v1115, v1116, v1117, v1118) != -3947)
            {
              CWFGetOSLog();
              v1119 = (void *)objc_claimAutoreleasedReturnValue();
              if (v1119)
              {
                CWFGetOSLog();
                v1120 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v1121 = v719;
                v1120 = v719;
              }

              if (os_log_type_enabled(v1120, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v1268) = 0;
                LODWORD(v1170) = 2;
                v1169 = &v1268;
                _os_log_send_and_compose_impl();
              }

              failedToJoinKnownNetworkIDs = self->_failedToJoinKnownNetworkIDs;
              objc_msgSend_matchingKnownNetworkProfile(v1226, v1123, v1124, v1125, v1126);
              v1127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_identifier(v1127, v1128, v1129, v1130, v1131);
              v1132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(failedToJoinKnownNetworkIDs, v1133, (uint64_t)v1132, v1134, v1135);

              deferredColocatedJoinCandidateMap = self->_deferredColocatedJoinCandidateMap;
              objc_msgSend_matchingKnownNetworkProfile(v1226, v1137, v1138, v1139, v1140);
              v1141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_identifier(v1141, v1142, v1143, v1144, v1145);
              v1146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(deferredColocatedJoinCandidateMap, v1147, 0, (uint64_t)v1146, v1148);

            }
            goto LABEL_334;
          }
          v1114 = v1072;
LABEL_366:

        }
LABEL_354:

        v1155 = 1;
        v1176 = v1224;
        goto LABEL_355;
      }
      CWFGetOSLog();
      v1158 = (void *)objc_claimAutoreleasedReturnValue();
      if (v1158)
      {
        CWFGetOSLog();
        v1157 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v1157 = MEMORY[0x1E0C81028];
        v1160 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v1157, OS_LOG_TYPE_DEFAULT))
      {
        v1268 = 138543362;
        *(_QWORD *)v1269 = v1178;
        LODWORD(v1170) = 12;
        v1169 = &v1268;
        _os_log_send_and_compose_impl();
      }
    }

    goto LABEL_354;
  }
  CWFGetOSLog();
  v874 = (void *)objc_claimAutoreleasedReturnValue();
  if (v874)
  {
    CWFGetOSLog();
    v875 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v876 = v719;
    v875 = v719;
  }

  if (os_log_type_enabled(v875, OS_LOG_TYPE_DEFAULT))
  {
    v1268 = 138543362;
    *(_QWORD *)v1269 = v1226;
    LODWORD(v1170) = 12;
    v1169 = &v1268;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  v877 = (void *)objc_claimAutoreleasedReturnValue();
  if (v877)
  {
    CWFGetOSLog();
    v878 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v879 = v719;
    v878 = v719;
  }

  if (os_log_type_enabled(v878, OS_LOG_TYPE_DEFAULT))
  {
    v884 = objc_msgSend_count(v744, v880, v881, v882, v883);
    v1268 = 134217984;
    *(_QWORD *)v1269 = v884;
    LODWORD(v1170) = 12;
    v1169 = &v1268;
    _os_log_send_and_compose_impl();
  }

  v1237 = 0u;
  v1238 = 0u;
  v1235 = 0u;
  v1236 = 0u;
  v744 = v744;
  v886 = objc_msgSend_countByEnumeratingWithState_objects_count_(v744, v885, (uint64_t)&v1235, (uint64_t)v1270, 16);
  if (v886)
  {
    v887 = *(_QWORD *)v1236;
    do
    {
      for (k = 0; k != v886; ++k)
      {
        if (*(_QWORD *)v1236 != v887)
          objc_enumerationMutation(v744);
        v889 = *(_QWORD *)(*((_QWORD *)&v1235 + 1) + 8 * k);
        CWFGetOSLog();
        v890 = (void *)objc_claimAutoreleasedReturnValue();
        if (v890)
        {
          CWFGetOSLog();
          v891 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v892 = v719;
          v891 = v719;
        }

        if (os_log_type_enabled(v891, OS_LOG_TYPE_DEFAULT))
        {
          v1268 = 138543362;
          *(_QWORD *)v1269 = v889;
          LODWORD(v1170) = 12;
          v1169 = &v1268;
          _os_log_send_and_compose_impl();
        }

      }
      v886 = objc_msgSend_countByEnumeratingWithState_objects_count_(v744, v893, (uint64_t)&v1235, (uint64_t)v1270, 16);
    }
    while (v886);
  }

  objc_msgSend_matchingKnownNetworkProfile(v1226, v894, v895, v896, v897);
  v898 = (void *)objc_claimAutoreleasedReturnValue();
  v899 = self->_deferredColocatedJoinCandidateMap;
  objc_msgSend_matchingKnownNetworkProfile(v1226, v900, v901, v902, v903);
  v904 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v904, v905, v906, v907, v908);
  v909 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v899, v910, (uint64_t)v898, (uint64_t)v909, v911);

  objc_msgSend_setDidDeferJoinToDiscoverMorePreferredNetwork_(self->_metric, v912, 1, v913, v914);
  v919 = objc_msgSend_copy(v1191, v915, v916, v917, v918);
  objc_msgSend_setKnownNetworks_(v919, v920, (uint64_t)v744, v921, v922);
  objc_msgSend_setPassiveScan_(v919, v923, 0, v924, v925);
  objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v919, v926, 1, v927, v928);
  objc_msgSend_setAllowDeferredCandidates_(v919, v929, 1, v930, v931);
  v936 = objc_msgSend_RSSI(v1226, v932, v933, v934, v935);
  if (v936 - 3 < objc_msgSend_minRSSI(v1191, v937, v938, v939, v940)
    && objc_msgSend_RSSI(v1226, v941, v942, v943, v944) >= -87)
  {
    v946 = objc_msgSend_RSSI(v1226, v941, v945, v943, v944);
    objc_msgSend_setMinRSSI_(v919, v947, v946 - 3, v948, v949);
    CWFGetOSLog();
    v950 = (void *)objc_claimAutoreleasedReturnValue();
    if (v950)
    {
      CWFGetOSLog();
      v951 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v957 = v719;
      v951 = v719;
    }

    if (os_log_type_enabled(v951, OS_LOG_TYPE_DEFAULT))
    {
      v962 = objc_msgSend_minRSSI(v1191, v958, v959, v960, v961);
      v967 = objc_msgSend_minRSSI(v919, v963, v964, v965, v966);
      v1268 = 67109632;
      *(_DWORD *)v1269 = 3;
      *(_WORD *)&v1269[4] = 2048;
      *(_QWORD *)&v1269[6] = v962;
      *(_WORD *)&v1269[14] = 2048;
      *(_QWORD *)&v1269[16] = v967;
      LODWORD(v1170) = 28;
      v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }

  }
  objc_msgSend_objectForKeyedSubscript_(self->_cachedKnownNetworksContexts, v941, (uint64_t)v919, v943, v944, v1169);
  v968 = (void *)objc_claimAutoreleasedReturnValue();
  v973 = v968;
  if (v968)
  {
    v974 = v919;
    v919 = v968;
  }
  else
  {
    v974 = (void *)objc_msgSend_copy(v919, v969, v970, v971, v972);
    objc_msgSend___prepareKnownNetworksContext_(self, v975, (uint64_t)v919, v976, v977);
    objc_msgSend_setObject_forKeyedSubscript_(self->_cachedKnownNetworksContexts, v978, (uint64_t)v919, (uint64_t)v974, v979);
  }

  v1234 = v1224;
  v982 = objc_msgSend___discoverKnownNetworksWithContext_error_(self, v980, (uint64_t)v919, (uint64_t)&v1234, v981);
  v983 = v1234;

  if ((v982 & 1) == 0)
  {
    objc_msgSend_autoJoinParameters(v1191, v984, v985, v986, v987);
    v988 = (void *)objc_claimAutoreleasedReturnValue();
    v993 = objc_msgSend_trigger(v988, v989, v990, v991, v992);
    v1233 = v983;
    v996 = objc_msgSend___allowAutoJoinWithTrigger_error_(self, v994, v993, (uint64_t)&v1233, v995);
    v1224 = v1233;

    if (!v996)
      goto LABEL_368;
    CWFGetOSLog();
    v997 = (void *)objc_claimAutoreleasedReturnValue();
    if (v997)
    {
      CWFGetOSLog();
      v998 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v999 = v719;
      v998 = v719;
    }

    if (os_log_type_enabled(v998, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1268) = 0;
      LODWORD(v1170) = 2;
      v1169 = &v1268;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_setDidFallbackToJoinLessPreferredNetwork_(self->_metric, v1000, 1, v1001, v1002);
    objc_msgSend___updateAutoJoinState_(self, v1003, 3, v1004, v1005);

LABEL_306:
    goto LABEL_307;
  }
  v1224 = v983;
LABEL_368:

  if ((v982 & 1) != 0)
  {
    v1155 = 1;
    goto LABEL_356;
  }
LABEL_364:
  v1155 = 0;
LABEL_357:
  v713 = v1155 != 0;
  v1176 = v1224;
LABEL_358:
  objc_autoreleasePoolPop(context);
LABEL_359:
  if (a6 && v1176)
    *a6 = objc_retainAutorelease(v1176);

  return v713;
}

- (BOOL)__isAutoJoinCancelled:(id *)a3
{
  CWFAutoJoinManager *v4;
  _BOOL4 cancelled;
  NSError *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = self;
  objc_sync_enter(v4);
  cancelled = v4->_cancelled;
  v6 = v4->_underlyingCancelError;
  objc_sync_exit(v4);

  if (cancelled)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)CFSTR("Auto-join has been cancelled"), *MEMORY[0x1E0CB2D50], v13);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v14, (uint64_t)v6, *MEMORY[0x1E0CB3388], v15);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v22 = (void *)objc_msgSend_copy(v11, v18, v19, v20, v21);
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v23, v17, 89, (uint64_t)v22);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWasCancelled_(v4->_metric, v25, 1, v26, v27);
    if (a3 && v24)
    {
      v24 = objc_retainAutorelease(v24);
      *a3 = v24;
    }
  }
  else
  {
    v24 = 0;
  }

  return cancelled;
}

- (BOOL)__isAutoJoinRequeued
{
  CWFAutoJoinManager *v2;
  BOOL requeued;

  v2 = self;
  objc_sync_enter(v2);
  requeued = v2->_requeued;
  objc_sync_exit(v2);

  return requeued;
}

- (BOOL)__allowOpportunisticNetworkTransitionWithTrigger:(int64_t)a3
{
  char v4;
  unint64_t v5;

  v4 = _os_feature_enabled_impl();
  v5 = (0x30C00110100000uLL >> a3) & 1;
  if ((unint64_t)a3 > 0x35)
    LOBYTE(v5) = 0;
  if ((v4 & 1) != 0)
    return 1;
  else
    return v5;
}

- (BOOL)__allowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int isAutoJoinRequeued;
  char isAutoJoinCancelled;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  NSObject *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  id v48;
  int v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  isAutoJoinRequeued = objc_msgSend___isAutoJoinRequeued(self, a2, a3, (uint64_t)a4, v4);
  if ((isAutoJoinRequeued & 1) != 0)
  {
    v17 = 0;
    v35 = 0;
  }
  else
  {
    v48 = 0;
    isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, v8, (uint64_t)&v48, v9, v10);
    v17 = v48;
    if ((isAutoJoinCancelled & 1) != 0)
    {
      v35 = 1;
    }
    else
    {
      objc_msgSend_allowAutoJoinHandler(self, v13, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_6;
      v47 = 0;
      v21 = objc_msgSend___calloutToAllowAutoJoinWithTrigger_error_(self, v19, a3, (uint64_t)&v47, v20);
      v22 = v47;
      v27 = v22;
      if ((v21 & 1) != 0)
      {

LABEL_6:
        v28 = 1;
        if (!a4)
          goto LABEL_19;
        goto LABEL_17;
      }
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v23, v24, v25, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)CFSTR("Auto-join is not allowed"), *MEMORY[0x1E0CB2D50], v31);
      if (v27)
        objc_msgSend_setObject_forKeyedSubscript_(v29, v32, (uint64_t)v27, *MEMORY[0x1E0CB3388], v33);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v32, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v29);
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v17 = (id)v34;
    }
  }
  CWFGetOSLog();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    CWFGetOSLog();
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = MEMORY[0x1E0C81028];
    v38 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v39, (uint64_t)v17, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 67109634;
    v50 = isAutoJoinRequeued;
    v51 = 1024;
    v52 = v35;
    v53 = 2114;
    v54 = v42;
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_setWasAborted_(self->_metric, v43, 1, v44, v45);
  v28 = 0;
  if (a4)
  {
LABEL_17:
    if (v17)
      *a4 = objc_retainAutorelease(v17);
  }
LABEL_19:

  return v28;
}

- (BOOL)__shouldBypassUnusedNetworkPeriodCheckForTrigger:(int64_t)a3 knownNetwork:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v5 = a4;
  v10 = v5;
  v11 = a3 == 47 || a3 == 32;
  if (a3 != 32 && a3 != 47)
  {
    if (objc_msgSend_addReason(v5, v6, v7, v8, v9) == 7 || objc_msgSend_addReason(v10, v12, v13, v14, v15) == 12)
    {
      objc_msgSend_lastJoinedBySystemAt(v10, v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

    }
    else
    {
      v17 = 0;
    }
    v11 |= v17;
  }

  return v11;
}

- (BOOL)__shouldBypassLockdownModeCheckForTrigger:(int64_t)a3 targetNetworkSSID:(id)a4 networkSSID:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isEqual;

  v7 = a4;
  v8 = a5;
  v12 = v8;
  if (a3 == 7)
  {
    if (v7 == v8)
    {
      isEqual = 1;
    }
    else
    {
      isEqual = 0;
      if (v7 && v8)
        isEqual = objc_msgSend_isEqual_(v7, v9, (uint64_t)v8, v10, v11);
    }
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (BOOL)__isDeferrableKnownNetwork:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a3;
  v12 = (objc_msgSend_isCarPlay(v3, v4, v5, v6, v7) & 1) == 0
     && ((objc_msgSend_isHotspot(v3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v3, v13, v14, v15, v16) & 1) != 0
      || objc_msgSend_addReason(v3, v17, v18, v19, v20) == 10
      || (objc_msgSend_isOpen(v3, v21, v22, v23, v24) & 1) != 0
      || (objc_msgSend_isOWE(v3, v25, v26, v27, v28) & 1) != 0
      || (objc_msgSend_isWAPI(v3, v29, v30, v31, v32) & 1) != 0
      || objc_msgSend_isPSK(v3, v33, v34, v35, v36)
      && ((objc_msgSend_isWEP(v3, v37, v38, v39, v40) & 1) != 0
       || objc_msgSend_isWPA(v3, v41, v42, v43, v44)));

  return v12;
}

- (BOOL)__does6GHzChannelOverlapWithUWB:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3;
  if (objc_msgSend_is6GHz(v3, v4, v5, v6, v7))
    v16 = (unint64_t)objc_msgSend_channel(v3, v8, v9, v10, v11) > 0x5E
       || (unint64_t)objc_msgSend_channel(v3, v12, v13, v14, v15) < 0xEA;
  else
    v16 = 0;

  return v16;
}

- (BOOL)__isDeferrableJoinCandidate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char hasWEP40Cipher;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = a3;
  objc_msgSend_matchingKnownNetworkProfile(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isCarPlay(v9, v10, v11, v12, v13) & 1) != 0)
  {
    hasWEP40Cipher = 0;
  }
  else
  {
    objc_msgSend_matchingKnownNetworkProfile(v4, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend___isDeferrableKnownNetwork_(self, v20, (uint64_t)v19, v21, v22) & 1) != 0
      || (objc_msgSend_isHotspot(v4, v23, v24, v25, v26) & 1) != 0
      || (objc_msgSend_isPersonalHotspot(v4, v27, v28, v29, v30) & 1) != 0
      || (objc_msgSend_isOpen(v4, v31, v32, v33, v34) & 1) != 0
      || (objc_msgSend_isOWE(v4, v35, v36, v37, v38) & 1) != 0
      || objc_msgSend_isPSK(v4, v39, v40, v41, v42)
      && ((objc_msgSend_isWEP(v4, v43, v44, v45, v46) & 1) != 0 || (objc_msgSend_isWPA(v4, v47, v48, v49, v50) & 1) != 0)
      || (objc_msgSend_hasTKIPCipher(v4, v43, v44, v45, v46) & 1) != 0
      || (objc_msgSend_hasWEP104Cipher(v4, v51, v52, v53, v54) & 1) != 0)
    {
      hasWEP40Cipher = 1;
    }
    else
    {
      hasWEP40Cipher = objc_msgSend_hasWEP40Cipher(v4, v55, v56, v57, v58);
    }

  }
  return hasWEP40Cipher;
}

- (BOOL)__allowKnownNetwork:(id)a3 context:(id)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 targetQueue:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CWFAutoJoinManager *v25;
  NSMutableDictionary *knownNetworkAllowCache;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *knownNetworkDeferCache;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableDictionary *knownNetworkAllowErrorCache;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const char *v71;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  NSObject *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  double v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  char v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  double v168;
  double v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  double v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  id v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  NSObject *v209;
  id v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  CWFAutoJoinManager *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  NSMutableDictionary *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  NSMutableDictionary *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  NSMutableDictionary *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  NSMutableSet *updatedAllowCacheKnownNetworks;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  id v274;
  void *v275;
  id v276;
  void *v277;
  void *v278;
  void *v279;
  id v282;
  unsigned __int8 v283;
  int v284;
  void *v285;
  __int16 v286;
  id v287;
  __int16 v288;
  id v289;
  uint64_t v290;

  v290 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v275 = v13;
  v276 = a7;
  v283 = 0;
  objc_msgSend_autoJoinParameters(v13, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  v25 = self;
  objc_sync_enter(v25);
  knownNetworkAllowCache = v25->_knownNetworkAllowCache;
  objc_msgSend_identifier(v12, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowCache, v32, (uint64_t)v31, v33, v34);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  knownNetworkDeferCache = v25->_knownNetworkDeferCache;
  objc_msgSend_identifier(v12, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkDeferCache, v41, (uint64_t)v40, v42, v43);
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  knownNetworkAllowErrorCache = v25->_knownNetworkAllowErrorCache;
  objc_msgSend_identifier(v12, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(knownNetworkAllowErrorCache, v50, (uint64_t)v49, v51, v52);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v25);
  if (objc_msgSend_isAutoJoinDisabled(v12, v53, v54, v55, v56))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v61, v62, (uint64_t)CFSTR("Known network profile is disabled"), *MEMORY[0x1E0CB2D50], v63);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v64, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v61);
    v65 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v69 = (void *)v65;
LABEL_4:
    LOBYTE(v70) = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v57, v24, (uint64_t)v12, v60) & 1) == 0
    && ((objc_msgSend_isCaptive(v12, v74, v75, v76, v77) & 1) != 0
     || objc_msgSend_wasCaptive(v12, v74, v161, v162, v77))
    && ((objc_msgSend_isOpen(v12, v74, v161, v162, v77) & 1) != 0
     || objc_msgSend_isOWE(v12, v74, v163, v164, v77)))
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v74, v163, v164, v77);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v74, v165, v166, v77);
      v169 = v168;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v170, v171, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v174, v175, v176, v177, v178);
      v180 = v169 - v179;

      if (v180 > 1209600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v74, v181, v182, v77);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v183, (uint64_t)CFSTR("Captive known network profile unused for %d weeks"), v184, v185, 2);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v187, (uint64_t)v186, *MEMORY[0x1E0CB2D50], v188);

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v189, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v61);
        v65 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v74, v24, (uint64_t)v12, v77) & 1) == 0
    && ((objc_msgSend_isOpen(v12, v78, v79, v80, v81) & 1) != 0
     || objc_msgSend_isOWE(v12, v78, v82, v83, v81)))
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v78, v82, v83, v81);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v78, v84, v85, v81);
      v88 = v87;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v89, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v93, v94, v95, v96, v97);
      v99 = v88 - v98;

      if (v99 > 1209600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v78, v100, v101, v81);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v102, (uint64_t)CFSTR("Open known network profile unused for %d weeks"), v103, v104, 2);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v106, (uint64_t)v105, *MEMORY[0x1E0CB2D50], v107);

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v108, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v61);
        v65 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
  }
  if ((objc_msgSend___shouldBypassUnusedNetworkPeriodCheckForTrigger_knownNetwork_(v25, v78, v24, (uint64_t)v12, v81) & 1) == 0)
  {
    objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v115)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v111, v112, v113, v114);
      v117 = v116;
      objc_msgSend_lastJoinedOnAnyDeviceAt(v12, v118, v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v122, v123, v124, v125, v126);
      v128 = v117 - v127;

      if (v128 > 43545600.0)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v111, v112, v113, v114);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v129, (uint64_t)CFSTR("Known network profile unused for %d weeks"), v130, v131, 72);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v61, v133, (uint64_t)v132, *MEMORY[0x1E0CB2D50], v134);

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v135, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v61);
        v65 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
  }
  if (!v14 && v279)
  {
    v136 = objc_msgSend_BOOLValue(v279, v111, v112, v113, v114);
    v283 = objc_msgSend_BOOLValue(v277, v137, v138, v139, v140);
    if ((v136 & 1) == 0)
    {
      objc_msgSend_userInfo(v278, v66, v141, v67, v68);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend_mutableCopy(v142, v143, v144, v145, v146);

      objc_msgSend_setObject_forKeyedSubscript_(v61, v147, (uint64_t)CFSTR("Known network profile is not allowed by daemon (cached)"), *MEMORY[0x1E0CB2D50], v148);
      v149 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend_domain(v278, v150, v151, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = objc_msgSend_code(v278, v155, v156, v157, v158);
      objc_msgSend_errorWithDomain_code_userInfo_(v149, v160, (uint64_t)v154, v159, (uint64_t)v61);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    goto LABEL_54;
  }
  objc_msgSend_allowKnownNetworkHandler(v25, v111, v112, v113, v114);
  v222 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v222)
  {
LABEL_54:
    v61 = 0;
    v69 = 0;
    LOBYTE(v70) = 1;
    goto LABEL_5;
  }
  v282 = 0;
  v70 = objc_msgSend___calloutToAllowKnownNetwork_trigger_allowForSeamlessSSIDTransition_defer_queue_error_(v25, v66, (uint64_t)v12, v24, (uint64_t)v14, &v283, v276, &v282);
  v274 = v282;
  if ((v70 & 1) != 0)
  {
    v61 = 0;
    v69 = 0;
    if (!v14)
      goto LABEL_56;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v223, v224, v225, v226);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v61, v227, (uint64_t)CFSTR("Known network profile is not allowed by daemon"), *MEMORY[0x1E0CB2D50], v228);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v229, (uint64_t)v274, *MEMORY[0x1E0CB3388], v230);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v231, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v61);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_56:
      v232 = v25;
      objc_sync_enter(v232);
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v233, v70, v234, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = v25->_knownNetworkAllowCache;
      objc_msgSend_identifier(v12, v238, v239, v240, v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v237, v243, (uint64_t)v236, (uint64_t)v242, v244);

      v245 = v25->_knownNetworkAllowErrorCache;
      objc_msgSend_identifier(v12, v246, v247, v248, v249);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v245, v251, (uint64_t)v69, (uint64_t)v250, v252);

      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v253, v283, v254, v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = v25->_knownNetworkDeferCache;
      objc_msgSend_identifier(v12, v258, v259, v260, v261);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v257, v263, (uint64_t)v256, (uint64_t)v262, v264);

      updatedAllowCacheKnownNetworks = v232->_updatedAllowCacheKnownNetworks;
      objc_msgSend_identifier(v12, v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(updatedAllowCacheKnownNetworks, v271, (uint64_t)v270, v272, v273);

      objc_sync_exit(v232);
    }
  }

LABEL_5:
  if (objc_msgSend___isDeferrableKnownNetwork_(v25, v66, (uint64_t)v12, v67, v68))
    v283 = 1;
  if ((v70 & 1) != 0)
  {
    objc_msgSend___removeDisallowedKnownNetwork_(v25, v71, (uint64_t)v12, v72, v73);
  }
  else
  {
    CWFGetOSLog();
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109)
    {
      CWFGetOSLog();
      v110 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v110 = MEMORY[0x1E0C81028];
      v190 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_identifier(v12, v191, v192, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v195, v196, v197, v198, v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v25, v201, (uint64_t)v69, v202, v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = 138543874;
      v285 = v200;
      v286 = 2114;
      v287 = v204;
      v288 = 2114;
      v289 = v12;
      _os_log_send_and_compose_impl();

    }
    if (!v14)
      objc_msgSend___addDisallowedKnownNetwork_(v25, v205, (uint64_t)v12, v206, v207);
  }
  if (a6 && v283)
  {
    CWFGetOSLog();
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (v208)
    {
      CWFGetOSLog();
      v209 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v209 = MEMORY[0x1E0C81028];
      v210 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_identifier(v12, v211, v212, v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v215, v216, v217, v218, v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = 138543618;
      v285 = v220;
      v286 = 2114;
      v287 = v12;
      _os_log_send_and_compose_impl();

    }
    *a6 = v283;
  }
  if (a8 && v69)
    *a8 = objc_retainAutorelease(v69);

  return v70;
}

- (BOOL)isKnownNetworkDisallowed:(id)a3
{
  id v4;
  CWFAutoJoinManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableSet *disallowedKnownNetworks;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_identifier(v4, v6, v7, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    disallowedKnownNetworks = v5->_disallowedKnownNetworks;
    objc_msgSend_identifier(v4, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_containsObject_(disallowedKnownNetworks, v17, (uint64_t)v16, v18, v19);

  }
  else
  {
    v20 = 0;
  }

  objc_sync_exit(v5);
  return v20;
}

- (void)__removeDisallowedKnownNetwork:(id)a3
{
  CWFAutoJoinManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *disallowedKnownNetworks;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_identifier(v19, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    objc_msgSend_identifier(v19, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);

  }
  objc_sync_exit(v4);

}

- (void)__addDisallowedKnownNetwork:(id)a3
{
  CWFAutoJoinManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *disallowedKnownNetworks;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_identifier(v19, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    disallowedKnownNetworks = v4->_disallowedKnownNetworks;
    objc_msgSend_identifier(v19, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(disallowedKnownNetworks, v16, (uint64_t)v15, v17, v18);

  }
  objc_sync_exit(v4);

}

- (id)__knownNetworksSupportingSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 allowSameSSID:(BOOL)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult(v11, v10, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v20)
  {
    v25 = v20;
    v26 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v18);
        v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v21, v28, (uint64_t)v12, (uint64_t)v11, 0, self->_targetQueue, 0))objc_msgSend_addObject_(v17, v21, v28, v29, v30);
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v25);
  }
  v31 = (void *)objc_msgSend_copy(v17, v21, v22, v23, v24);

  return v31;
}

- (BOOL)__candidateSupportsSeamlessSSIDTransition:(id)a3 fromNetwork:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (CWFScanResultSupportsSeamlessSSIDTransition(v9, v8))
  {
    objc_msgSend_matchingKnownNetworkProfile(v8, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v16, (uint64_t)v15, (uint64_t)v10, (uint64_t)v9, 0, self->_targetQueue, 0);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)__performGASQueryWithScanResults:(id)a3 ANQPElementIDList:(id)a4 maxCacheAge:(unint64_t)a5 cacheOnly:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  __uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  CWFANQPParameters *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  CWFAutoJoinMetric *metric;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  id v125;
  __uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  NSObject *v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  id v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSObject *v181;
  uint64_t j;
  uint64_t v183;
  void *v184;
  NSObject *v185;
  NSObject *v186;
  const char *v187;
  id v188;
  int *v190;
  void *v191;
  void *v192;
  _BOOL4 v193;
  void *v194;
  void *v196;
  id v197;
  unint64_t v198;
  id obj;
  void *v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  id v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  int v212;
  _BYTE v213[18];
  __int16 v214;
  void *v215;
  __int16 v216;
  uint64_t v217;
  __int16 v218;
  _BOOL4 v219;
  __int16 v220;
  unint64_t v221;
  _BYTE v222[128];
  uint64_t v223;

  v7 = a6;
  v223 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  CWFGetOSLog();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v212 = 67109376;
    *(_DWORD *)v213 = v7;
    *(_WORD *)&v213[4] = 2048;
    *(_QWORD *)&v213[6] = a5;
    LODWORD(v191) = 18;
    v190 = &v212;
    _os_log_send_and_compose_impl();
  }
  v193 = v7;
  v198 = a5;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  obj = v11;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v207, (uint64_t)v222, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v208;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v208 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * i);
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_networkName(v29, v22, v23, v24, v25, v190, v191);
        v31 = (int *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_BSSID(v29, v32, v33, v34, v35);
        v190 = v31;
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v30, v36, (uint64_t)CFSTR("'%@'/%@"), v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v200, v40, (uint64_t)v39, v41, v42);

      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v207, (uint64_t)v222, 16);
    }
    while (v26);
  }

  CWFGetOSLog();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    CWFGetOSLog();
    v44 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = MEMORY[0x1E0C81028];
    v45 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v50 = objc_msgSend_count(obj, v46, v47, v48, v49);
    objc_msgSend_componentsJoinedByString_(v200, v51, (uint64_t)CFSTR(", "), v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = 134218242;
    *(_QWORD *)v213 = v50;
    *(_WORD *)&v213[8] = 2114;
    *(_QWORD *)&v213[10] = v54;
    LODWORD(v191) = 22;
    v190 = &v212;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    CWFGetOSLog();
    v56 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = MEMORY[0x1E0C81028];
    v57 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend_count(v12, v58, v59, v60, v61);
    objc_msgSend_componentsJoinedByString_(v12, v63, (uint64_t)CFSTR(", "), v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = 134218242;
    *(_QWORD *)v213 = v62;
    *(_WORD *)&v213[8] = 2114;
    *(_QWORD *)&v213[10] = v66;
    LODWORD(v191) = 22;
    v190 = &v212;
    _os_log_send_and_compose_impl();

  }
  v67 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_performGASQueryHandler(self, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v196 = v12;
  if (v72)
  {
    v77 = objc_alloc_init(CWFANQPParameters);
    objc_msgSend_setScanResults_(v77, v78, (uint64_t)obj, v79, v80);
    objc_msgSend_setANQPElementIDList_(v77, v81, (uint64_t)v12, v82, v83);
    objc_msgSend_setAcceptableCacheAge_(v77, v84, v198, v85, v86);
    v205 = 0;
    v206 = 0;
    objc_msgSend___calloutToPerformGASQueryWithParameters_GASQueryNetworks_error_(self, v87, (uint64_t)v77, (uint64_t)&v206, (uint64_t)&v205);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v206;
    v94 = v205;
    if (v88)
    {
      if (objc_msgSend_count(v89, v90, v91, v92, v93))
      {
        objc_msgSend_GASQueryNetworks(self->_metric, v95, v96, v97, v98);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        metric = self->_metric;
        if (v103)
        {
          objc_msgSend_GASQueryNetworks(metric, v99, v100, v101, v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayByAddingObjectsFromArray_(v105, v106, (uint64_t)v89, v107, v108);
          v109 = v89;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setGASQueryNetworks_(self->_metric, v111, (uint64_t)v110, v112, v113);

          v89 = v109;
        }
        else
        {
          objc_msgSend_setGASQueryNetworks_(metric, v99, (uint64_t)v89, v101, v102);
        }

      }
      v125 = v88;
      v192 = 0;
      v118 = 0;
    }
    else
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v90, v91, v92, v93);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v119, v120, (uint64_t)CFSTR("Failed to perform GAS/ANQP"), *MEMORY[0x1E0CB2D50], v121);
      objc_msgSend_setObject_forKeyedSubscript_(v119, v122, (uint64_t)v94, *MEMORY[0x1E0CB3388], v123);
      v192 = v119;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v124, *MEMORY[0x1E0CB2FE0], 2, (uint64_t)v119);
      v118 = objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v73, v74, v75, v76);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v114, v115, (uint64_t)CFSTR("CWFAutoJoinManager.performGASQueryHandler() not configured"), *MEMORY[0x1E0CB2D50], v116);
    v192 = v114;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v117, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v114);
    v118 = objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v88 = 0;
  }
  v126 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v67;
  v131 = objc_msgSend_GASQueryDuration(self->_metric, v127, v128, v129, v130);
  objc_msgSend_setGASQueryDuration_(self->_metric, v132, v131 + v126 / 0xF4240, v133, v134);
  if (v118)
  {
    objc_msgSend_GASQueryErrors(self->_metric, v135, v136, v137, v138);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      objc_msgSend_GASQueryErrors(self->_metric, v139, v140, v141, v142);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v144, v145, v118, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGASQueryErrors_(self->_metric, v149, (uint64_t)v148, v150, v151);

    }
    else
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v139, v118, v141, v142);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGASQueryErrors_(self->_metric, v152, (uint64_t)v144, v153, v154);
    }

  }
  CWFGetOSLog();
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    CWFGetOSLog();
    v156 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v156 = MEMORY[0x1E0C81028];
    v157 = MEMORY[0x1E0C81028];
  }
  v197 = (id)v118;

  if (os_log_type_enabled(v156, (os_log_type_t)(16 * (v88 == 0))))
  {
    if (v88)
      v161 = "SUCCEEDED";
    else
      v161 = "FAILED";
    objc_msgSend___descriptionForError_(self, v158, v118, v159, v160, v190, v191);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend_count(v89, v163, v164, v165, v166);
    v212 = 136447490;
    *(_QWORD *)v213 = v161;
    *(_WORD *)&v213[8] = 2048;
    *(_QWORD *)&v213[10] = v126 / 0xF4240;
    v214 = 2114;
    v215 = v162;
    v216 = 2048;
    v217 = v167;
    v218 = 1024;
    v219 = v193;
    v220 = 2048;
    v221 = v198;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    CWFGetOSLog();
    v169 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v169 = MEMORY[0x1E0C81028];
    v170 = MEMORY[0x1E0C81028];
  }
  v194 = v89;

  if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
  {
    v175 = objc_msgSend_count(v88, v171, v172, v173, v174);
    v212 = 134217984;
    *(_QWORD *)v213 = v175;
    _os_log_send_and_compose_impl();
  }

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v176 = v88;
  v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v201, (uint64_t)v211, 16);
  if (v178)
  {
    v179 = v178;
    v180 = *(_QWORD *)v202;
    v181 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v179; ++j)
      {
        if (*(_QWORD *)v202 != v180)
          objc_enumerationMutation(v176);
        v183 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * j);
        CWFGetOSLog();
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        if (v184)
        {
          CWFGetOSLog();
          v185 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v186 = v181;
          v185 = v181;
        }

        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          v212 = 138543362;
          *(_QWORD *)v213 = v183;
          _os_log_send_and_compose_impl();
        }

      }
      v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v187, (uint64_t)&v201, (uint64_t)v211, 16);
    }
    while (v179);
  }

  if (a7 && v197)
    *a7 = objc_retainAutorelease(v197);
  v188 = v176;

  return v188;
}

- (id)__performScanWithChannelList:(id)a3 SSIDList:(id)a4 passive:(BOOL)a5 dwellTime:(unint64_t)a6 maxCacheAge:(unint64_t)a7 cacheOnly:(BOOL)a8 isPreAssociationScan:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v10;
  _BOOL4 v12;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CWFScanParameters *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  id v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CWFAutoJoinMetric *metric;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  id v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t i;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  CWFAutoJoinMetric *v136;
  id v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __uint64_t v142;
  CWFAutoJoinMetric *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  NSObject *v173;
  id v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  NSObject *v191;
  id v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  id v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  uint64_t j;
  void *v206;
  void *v207;
  NSObject *v208;
  NSObject *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  int v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  int *v243;
  uint64_t v244;
  __uint64_t v245;
  _BOOL4 v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  id v251;
  void *v252;
  void *v253;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  id v263;
  id v264;
  _BYTE v265[128];
  int v266;
  unint64_t v267;
  __int16 v268;
  _BYTE v269[18];
  __int16 v270;
  void *v271;
  __int16 v272;
  uint64_t v273;
  __int16 v274;
  _BOOL4 v275;
  __int16 v276;
  unint64_t v277;
  _BYTE v278[128];
  uint64_t v279;

  v10 = a8;
  v12 = a5;
  v279 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  CWFGetOSLog();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CWFGetOSLog();
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v266 = 134218496;
    v267 = a6;
    v268 = 1024;
    *(_DWORD *)v269 = v10;
    *(_WORD *)&v269[4] = 2048;
    *(_QWORD *)&v269[6] = a7;
    LODWORD(v244) = 28;
    v243 = &v266;
    _os_log_send_and_compose_impl();
  }

  CWFGetOSLog();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    CWFGetOSLog();
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend_count(v15, v23, v24, v25, v26);
    objc_msgSend_componentsJoinedByString_(v15, v28, (uint64_t)CFSTR(", "), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = 134218242;
    v267 = v27;
    v268 = 2114;
    *(_QWORD *)v269 = v31;
    LODWORD(v244) = 22;
    v243 = &v266;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    CWFGetOSLog();
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = MEMORY[0x1E0C81028];
    v34 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v39 = objc_msgSend_count(v16, v35, v36, v37, v38);
    objc_msgSend_componentsJoinedByString_(v16, v40, (uint64_t)CFSTR(", "), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = 134218242;
    v267 = v39;
    v268 = 2114;
    *(_QWORD *)v269 = v43;
    LODWORD(v244) = 22;
    v243 = &v266;
    _os_log_send_and_compose_impl();

  }
  v44 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_scanForNetworksHandler(self, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v249 = v16;
  v250 = v15;
  if (v49)
  {
    v54 = objc_alloc_init(CWFScanParameters);
    objc_msgSend_setBSSType_(v54, v55, 3, v56, v57);
    objc_msgSend_setPHYMode_(v54, v58, 1, v59, v60);
    objc_msgSend_setNumberOfScans_(v54, v61, 1, v62, v63);
    objc_msgSend_setIncludeHiddenNetworks_(v54, v64, 1, v65, v66);
    objc_msgSend_setChannels_(v54, v67, (uint64_t)v15, v68, v69);
    objc_msgSend_setSSIDList_(v54, v70, (uint64_t)v16, v71, v72);
    objc_msgSend_setDwellTime_(v54, v73, a6, v74, v75);
    objc_msgSend_setScanFlags_(v54, v76, 2592, v77, v78);
    if (v10)
    {
      objc_msgSend_setScanType_(v54, v79, 3, v80, v81);
      objc_msgSend_setMaximumAge_(v54, v82, a7, v83, v84);
    }
    else
    {
      if (v12)
        objc_msgSend_setScanType_(v54, v79, 2, v80, v81, v243, v244);
      else
        objc_msgSend_setScanType_(v54, v79, 1, v80, v81, v243, v244);
      objc_msgSend_setAcceptableCacheAge_(v54, v93, a7, v94, v95);
    }
    v263 = 0;
    v264 = 0;
    objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_(self, v85, (uint64_t)v54, (uint64_t)&v264, (uint64_t)&v263, v243, v244);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v264;
    v100 = v263;
    if (v92)
    {
      if (objc_msgSend_count(v91, v96, v97, v98, v99))
      {
        metric = self->_metric;
        if (a9)
          objc_msgSend_preAssociationScanChannels(metric, v101, v102, v103, v104);
        else
          objc_msgSend_scanChannels(metric, v101, v102, v103, v104);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = v91;
        v246 = v10;
        v245 = v44;
        v248 = v106;
        if (v106)
        {
          v118 = objc_msgSend_mutableCopy(v106, v107, v108, v109, v110);
        }
        else
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v107, v108, v109, v110);
          v118 = objc_claimAutoreleasedReturnValue();
        }
        v119 = (void *)v118;
        v261 = 0u;
        v262 = 0u;
        v259 = 0u;
        v260 = 0u;
        v120 = v252;
        v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v121, (uint64_t)&v259, (uint64_t)v278, 16);
        if (v122)
        {
          v126 = v122;
          v127 = *(_QWORD *)v260;
          do
          {
            for (i = 0; i != v126; ++i)
            {
              if (*(_QWORD *)v260 != v127)
                objc_enumerationMutation(v120);
              objc_msgSend___basicChannelRepresentation_(self, v123, *(_QWORD *)(*((_QWORD *)&v259 + 1) + 8 * i), v124, v125);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v119, v130, (uint64_t)v129, v131, v132);

            }
            v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v123, (uint64_t)&v259, (uint64_t)v278, 16);
          }
          while (v126);
        }

        v136 = self->_metric;
        if (a9)
          objc_msgSend_setPreAssociationScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        else
          objc_msgSend_setScanChannels_(v136, v133, (uint64_t)v119, v134, v135);
        v10 = v246;
        v44 = v245;

        v91 = v252;
      }
      v137 = v92;
      v247 = 0;
      v117 = 0;
    }
    else
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v96, v97, v98, v99);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v111, v112, (uint64_t)CFSTR("Failed to perform scan"), *MEMORY[0x1E0CB2D50], v113);
      objc_msgSend_setObject_forKeyedSubscript_(v111, v114, (uint64_t)v100, *MEMORY[0x1E0CB3388], v115);
      v247 = v111;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v116, *MEMORY[0x1E0CB2FE0], 2, (uint64_t)v111);
      v117 = objc_claimAutoreleasedReturnValue();
    }

    v90 = v117;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v50, v51, v52, v53);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v86, v87, (uint64_t)CFSTR("CWFAutoJoinManager.scanForNetworksHandler() not configured"), *MEMORY[0x1E0CB2D50], v88);
    v247 = v86;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v89, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v86);
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = 0;
    v92 = 0;
  }
  v142 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v44) / 0xF4240;
  v143 = self->_metric;
  if (a9)
  {
    v144 = objc_msgSend_preAssociationScanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setPreAssociationScanDuration_(self->_metric, v145, v144 + v142, v146, v147);
    if (!v90)
      goto LABEL_54;
  }
  else
  {
    v152 = objc_msgSend_scanDuration(v143, v138, v139, v140, v141);
    objc_msgSend_setScanDuration_(self->_metric, v153, v152 + v142, v154, v155);
    if (!v90)
      goto LABEL_54;
  }
  objc_msgSend_scanErrors(self->_metric, v148, v149, v150, v151, v243, v244);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  if (v160)
  {
    objc_msgSend_scanErrors(self->_metric, v156, v157, v158, v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v161, v162, v90, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScanErrors_(self->_metric, v166, (uint64_t)v165, v167, v168);

  }
  else
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v156, v90, v158, v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScanErrors_(self->_metric, v169, (uint64_t)v161, v170, v171);
  }

LABEL_54:
  CWFGetOSLog();
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    CWFGetOSLog();
    v173 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v173 = MEMORY[0x1E0C81028];
    v174 = MEMORY[0x1E0C81028];
  }

  v251 = (id)v90;
  if (os_log_type_enabled(v173, (os_log_type_t)(16 * (v92 == 0))))
  {
    if (v92)
      v179 = "SUCCEEDED";
    else
      v179 = "FAILED";
    v180 = objc_msgSend_count(v92, v175, v176, v177, v178, v243, v244);
    objc_msgSend___descriptionForError_(self, v181, v90, v182, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend_count(v91, v185, v186, v187, v188);
    v266 = 136447746;
    v267 = (unint64_t)v179;
    v268 = 2048;
    *(_QWORD *)v269 = v142;
    *(_WORD *)&v269[8] = 2048;
    *(_QWORD *)&v269[10] = v180;
    v270 = 2114;
    v271 = v184;
    v272 = 2048;
    v273 = v189;
    v274 = 1024;
    v275 = v10;
    v276 = 2048;
    v277 = a7;
    LODWORD(v244) = 68;
    v243 = &v266;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    CWFGetOSLog();
    v191 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v191 = MEMORY[0x1E0C81028];
    v192 = MEMORY[0x1E0C81028];
  }
  v253 = v91;

  if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      v197 = " Cache";
    else
      v197 = "";
    v198 = objc_msgSend_count(v92, v193, v194, v195, v196, v243, v244);
    v266 = 136446466;
    v267 = (unint64_t)v197;
    v268 = 2048;
    *(_QWORD *)v269 = v198;
    _os_log_send_and_compose_impl();
  }

  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  v199 = v92;
  v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v255, (uint64_t)v265, 16);
  if (v201)
  {
    v202 = v201;
    v203 = *(_QWORD *)v256;
    v204 = MEMORY[0x1E0C81028];
    do
    {
      for (j = 0; j != v202; ++j)
      {
        if (*(_QWORD *)v256 != v203)
          objc_enumerationMutation(v199);
        v206 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * j);
        CWFGetOSLog();
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        if (v207)
        {
          CWFGetOSLog();
          v208 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v209 = v204;
          v208 = v204;
        }

        if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
        {
          v266 = 138543362;
          v267 = (unint64_t)v206;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_channel(v206, v210, v211, v212, v213);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___basicChannelRepresentation_(self, v215, (uint64_t)v214, v216, v217);
        v218 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_scanChannels(self->_metric, v219, v220, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = objc_msgSend_containsObject_(v223, v224, (uint64_t)v218, v225, v226);

        if (v227)
        {
          self->_didDiscoverBSS = 1;
          objc_msgSend_SSID(v206, v228, v229, v230, v231);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v237 = objc_msgSend_length(v232, v233, v234, v235, v236);

          if (!v237)
            objc_msgSend_addObject_(self->_hiddenNetworkChannels, v238, (uint64_t)v218, v239, v240);
        }

      }
      v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v241, (uint64_t)&v255, (uint64_t)v265, 16);
    }
    while (v202);
  }

  if (a10 && v251)
    *a10 = objc_retainAutorelease(v251);

  return v199;
}

- (id)__alreadyFoundFollowup6GHzBSSWithSignature:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  id v48;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend_allValues(self->_followup6GHzScanResultsMap, v5, v6, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v58, (uint64_t)v63, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v59 != v51)
          objc_enumerationMutation(obj);
        v53 = v10;
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v10);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v12 = v11;
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v54, (uint64_t)v62, 16);
        if (v14)
        {
          v19 = v14;
          v20 = *(_QWORD *)v55;
LABEL_8:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v55 != v20)
              objc_enumerationMutation(v12);
            v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v21);
            v23 = (void *)MEMORY[0x1E0CB3940];
            v24 = objc_msgSend_shortSSID(v22, v15, v16, v17, v18);
            objc_msgSend_BSSID(v22, v25, v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_channel(v22, v30, v31, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend_channel(v34, v35, v36, v37, v38);
            objc_msgSend_stringWithFormat_(v23, v40, (uint64_t)CFSTR("%lu/%@/%lu"), v41, v42, v24, v29, v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4)
            {
              if (v43 && (objc_msgSend_isEqual_(v43, v44, (uint64_t)v4, v45, v46) & 1) != 0)
                break;
            }

            if (v19 == ++v21)
            {
              v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v54, (uint64_t)v62, 16);
              if (v19)
                goto LABEL_8;
              goto LABEL_16;
            }
          }
          v48 = v22;

          if (v48)
            goto LABEL_21;
        }
        else
        {
LABEL_16:

        }
        v10 = v53 + 1;
      }
      while (v53 + 1 != v52);
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v58, (uint64_t)v63, 16);
    }
    while (v52);
  }
  v48 = 0;
LABEL_21:

  return v48;
}

- (id)__perform6GHzFollowupDiscoveryWithScanResults:(id)a3 SSIDList:(id)a4 dwellTime:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  char isEqual;
  BOOL v99;
  char v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  NSObject *v118;
  id v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  CWFScanParameters *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  NSObject *v187;
  const char *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *k;
  void *v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  void *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  void *v233;
  NSObject *v234;
  id v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  NSObject *v251;
  void *v252;
  NSObject *v253;
  CWFScanParameters *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  id v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  void *v309;
  id v310;
  uint64_t v311;
  void *v312;
  NSObject *v313;
  id v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  NSObject *v337;
  id v338;
  void *v339;
  id v340;
  uint64_t v341;
  void *v342;
  NSObject *v343;
  NSObject *v344;
  NSObject *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  id v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  void *v379;
  NSObject *v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  id v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  void *v409;
  __uint64_t v410;
  CWFAutoJoinManager *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  void *v421;
  id v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  const char *v441;
  uint64_t v442;
  void *v443;
  const char *v444;
  uint64_t v445;
  const char *v446;
  uint64_t v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  const char *v453;
  __uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  void *v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  void *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  void *v483;
  NSObject *v484;
  NSObject *v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  const char *v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  id v495;
  void *v496;
  NSObject *v497;
  NSObject *v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t m;
  uint64_t v509;
  void *v510;
  NSObject *v511;
  NSObject *v512;
  const char *v513;
  const char *v514;
  uint64_t v515;
  uint64_t v516;
  id v517;
  int *v519;
  int *v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  id v525;
  id v526;
  uint64_t v527;
  id v528;
  id obj;
  uint64_t v530;
  id v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  NSObject *v536;
  id v537;
  id v538;
  uint64_t v539;
  id v540;
  id v541;
  void *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  id v551;
  id v552;
  id v553;
  CWFAutoJoinManager *v554;
  id v555;
  id v556;
  id v557;
  id v558;
  id v559;
  void *v560;
  uint64_t v561;
  uint64_t v562;
  id v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  id v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  _BYTE v593[128];
  int v594;
  uint64_t v595;
  __int16 v596;
  unint64_t v597;
  __int16 v598;
  uint64_t v599;
  __int16 v600;
  id v601;
  _BYTE v602[128];
  void *v603;
  _BYTE v604[128];
  _BYTE v605[128];
  id v606;
  _BYTE v607[128];
  _BYTE v608[128];
  _BYTE v609[128];
  uint64_t v610;

  v610 = *MEMORY[0x1E0C80C00];
  v526 = a3;
  v525 = a4;
  v538 = a6;
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v10, v11, v12, v13);
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v14, v15, v16, v17);
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_supportedChannels(self, v18, v19, v20, v21);
  v589 = 0u;
  v590 = 0u;
  v591 = 0u;
  v592 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v589, (uint64_t)v609, 16);
  if (v23)
  {
    v27 = v23;
    v28 = *(_QWORD *)v590;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v590 != v28)
          objc_enumerationMutation(obj);
        objc_msgSend___basicChannelRepresentation_(self, v24, *(_QWORD *)(*((_QWORD *)&v589 + 1) + 8 * i), v25, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v560, v31, (uint64_t)v30, v32, v33);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v589, (uint64_t)v609, 16);
    }
    while (v27);
  }

  objc_msgSend_sortedArrayUsingComparator_(v526, v34, (uint64_t)&unk_1E6132780, v35, v36);
  v585 = 0u;
  v586 = 0u;
  v587 = 0u;
  v588 = 0u;
  v528 = (id)objc_claimAutoreleasedReturnValue();
  v554 = self;
  v532 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v37, (uint64_t)&v585, (uint64_t)v608, 16);
  if (!v532)
  {
    v563 = 0;
    goto LABEL_121;
  }
  v563 = 0;
  v530 = *(_QWORD *)v586;
  do
  {
    v42 = 0;
    do
    {
      if (*(_QWORD *)v586 != v530)
      {
        v43 = v42;
        objc_enumerationMutation(v528);
        v42 = v43;
      }
      v533 = v42;
      v44 = *(void **)(*((_QWORD *)&v585 + 1) + 8 * v42);
      v558 = v44;
      if (objc_msgSend_isFILSDiscoveryFrame(v44, v38, v39, v40, v41, v519, v521)
        && (objc_msgSend_channel(v44, v45, v46, v47, v48),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            v54 = objc_msgSend_is6GHz(v49, v50, v51, v52, v53),
            v49,
            v54))
      {
        objc_msgSend_channel(v44, v45, v46, v47, v48);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___basicChannelRepresentation_(self, v56, (uint64_t)v55, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend_containsObject_(v560, v60, (uint64_t)v59, v61, v62) & 1) != 0)
        {
          v551 = v59;
          objc_msgSend_SSID(v44, v63, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend_shortSSID(v44, v68, v69, v70, v71);
          v581 = 0u;
          v582 = 0u;
          v583 = 0u;
          v584 = 0u;
          objc_msgSend_knownNetworks(v538, v73, v74, v75, v76);
          v555 = (id)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v555, v77, (uint64_t)&v581, (uint64_t)v607, 16);
          if (!v78)
            goto LABEL_57;
          v83 = v78;
          v561 = *(_QWORD *)v582;
          while (1)
          {
            for (j = 0; j != v83; ++j)
            {
              if (*(_QWORD *)v582 != v561)
                objc_enumerationMutation(v555);
              v85 = *(void **)(*((_QWORD *)&v581 + 1) + 8 * j);
              objc_msgSend_SSID(v85, v79, v80, v81, v82);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend_shortSSID(v85, v87, v88, v89, v90);
              v96 = v91;
              if (v86)
                v97 = v67 == 0;
              else
                v97 = 1;
              if (v97)
              {
                if (!v72 || v72 != v91)
                  goto LABEL_55;
              }
              else
              {
                isEqual = objc_msgSend_isEqual_(v86, v92, (uint64_t)v67, v94, v95);
                if (v72)
                  v99 = v72 == v96;
                else
                  v99 = 0;
                v100 = v99;
                if ((isEqual & 1) == 0 && (v100 & 1) == 0)
                  goto LABEL_55;
              }
              v101 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend_BSSID(v44, v92, v93, v94, v95);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channel(v44, v103, v104, v105, v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend_channel(v107, v108, v109, v110, v111);
              objc_msgSend_stringWithFormat_(v101, v113, (uint64_t)CFSTR("%lu/%@/%lu"), v114, v115, v72, v102, v112);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              CWFGetOSLog();
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              if (v117)
              {
                CWFGetOSLog();
                v118 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v118 = MEMORY[0x1E0C81028];
                v119 = MEMORY[0x1E0C81028];
              }
              self = v554;

              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                v594 = 138543618;
                v595 = (uint64_t)v558;
                v596 = 2114;
                v597 = (unint64_t)v85;
                LODWORD(v522) = 22;
                v520 = &v594;
                _os_log_send_and_compose_impl();
              }

              objc_msgSend_objectForKeyedSubscript_(v554->_followup6GHzFILSDMap, v120, (uint64_t)v116, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v123)
                objc_msgSend_setObject_forKeyedSubscript_(v554->_followup6GHzFILSDMap, v124, (uint64_t)v558, (uint64_t)v116, v126);
              objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_(v554, v124, (uint64_t)v116, v125, v126, v520, v522);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              if (v127)
              {
                CWFGetOSLog();
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                if (v128)
                {
                  CWFGetOSLog();
                  v129 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v129 = MEMORY[0x1E0C81028];
                  v180 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v594) = 0;
                  LODWORD(v521) = 2;
                  v519 = &v594;
                  _os_log_send_and_compose_impl();
                }

                v185 = v563;
                if (!v563)
                {
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v181, v182, v183, v184);
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v563 = v185;
                objc_msgSend_addObject_(v185, v181, (uint64_t)v127, v183, v184, v519, v521);
              }
              else
              {
                v130 = objc_alloc_init(CWFScanParameters);
                objc_msgSend_networkName(v85, v131, v132, v133, v134);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setSSID_(v130, v136, (uint64_t)v135, v137, v138);

                objc_msgSend_BSSID(v558, v139, v140, v141, v142);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setBSSID_(v130, v144, (uint64_t)v143, v145, v146);

                v606 = v551;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v147, (uint64_t)&v606, 1, v148);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setChannels_(v130, v150, (uint64_t)v149, v151, v152);

                self = v554;
                objc_msgSend_setBSSType_(v130, v153, 3, v154, v155);
                objc_msgSend_setPHYMode_(v130, v156, 1, v157, v158);
                objc_msgSend_setNumberOfScans_(v130, v159, 1, v160, v161);
                objc_msgSend_setIncludeHiddenNetworks_(v130, v162, 1, v163, v164);
                objc_msgSend_setAcceptableCacheAge_(v130, v165, 0, v166, v167);
                objc_msgSend_setDwellTime_(v130, v168, a5, v169, v170);
                objc_msgSend_setScanFlags_(v130, v171, 1056, v172, v173);
                objc_msgSend_setScanType_(v130, v174, 1, v175, v176);
                objc_msgSend_addObject_(v547, v177, (uint64_t)v130, v178, v179);

              }
              v44 = v558;
LABEL_55:

            }
            v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v555, v79, (uint64_t)&v581, (uint64_t)v607, 16);
            if (!v83)
            {
LABEL_57:

              goto LABEL_58;
            }
          }
        }
        CWFGetOSLog();
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        if (v312)
        {
          CWFGetOSLog();
          v313 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v313 = MEMORY[0x1E0C81028];
          v314 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
        {
          v594 = 138543362;
          v595 = (uint64_t)v59;
          LODWORD(v521) = 12;
          v519 = &v594;
          _os_log_send_and_compose_impl();
        }
        v187 = v313;
      }
      else
      {
LABEL_58:
        objc_msgSend_RNRBSSList(v44, v45, v46, v47, v48);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v577 = 0u;
        v578 = 0u;
        v579 = 0u;
        v580 = 0u;
        v187 = v186;
        v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v577, (uint64_t)v605, 16);
        if (v540)
        {
          v536 = v187;
          v539 = *(_QWORD *)v578;
          do
          {
            for (k = 0; k != v540; k = (char *)k + 1)
            {
              if (*(_QWORD *)v578 != v539)
                objc_enumerationMutation(v536);
              v194 = *(void **)(*((_QWORD *)&v577 + 1) + 8 * (_QWORD)k);
              objc_msgSend_channel(v194, v189, v190, v191, v192, v519, v521);
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_is6GHz(v195, v196, v197, v198, v199))
              {
                v208 = objc_msgSend_shortSSID(v194, v200, v201, v202, v203);
                if (v208
                  || objc_msgSend_isSameSSID(v194, v204, v205, v206, v207)
                  && (v208 = objc_msgSend_shortSSID(v558, v209, v210, v211, v212)) != 0)
                {
                  objc_msgSend_BSSID(v194, v204, v205, v206, v207);
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v217)
                  {
                    v542 = k;
                    v575 = 0u;
                    v576 = 0u;
                    v573 = 0u;
                    v574 = 0u;
                    objc_msgSend_knownNetworks(v538, v213, v214, v215, v216);
                    v552 = (id)objc_claimAutoreleasedReturnValue();
                    v219 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v218, (uint64_t)&v573, (uint64_t)v604, 16);
                    if (v219)
                    {
                      v224 = v219;
                      v556 = v194;
                      v562 = *(_QWORD *)v574;
                      do
                      {
                        v225 = 0;
                        do
                        {
                          if (*(_QWORD *)v574 != v562)
                            objc_enumerationMutation(v552);
                          v226 = *(void **)(*((_QWORD *)&v573 + 1) + 8 * v225);
                          if (v208 == objc_msgSend_shortSSID(v226, v220, v221, v222, v223, v519, v521))
                          {
                            v227 = (void *)MEMORY[0x1E0CB3940];
                            v228 = objc_msgSend_channel(v195, v220, v221, v222, v223);
                            objc_msgSend_stringWithFormat_(v227, v229, (uint64_t)CFSTR("%lu/%@/%lu"), v230, v231, v208, v217, v228);
                            v232 = (void *)objc_claimAutoreleasedReturnValue();
                            CWFGetOSLog();
                            v233 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v233)
                            {
                              CWFGetOSLog();
                              v234 = (id)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v234 = MEMORY[0x1E0C81028];
                              v235 = MEMORY[0x1E0C81028];
                            }

                            if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
                            {
                              v594 = 138543874;
                              v595 = (uint64_t)v558;
                              v596 = 2114;
                              v597 = (unint64_t)v556;
                              v598 = 2114;
                              v599 = (uint64_t)v226;
                              LODWORD(v521) = 32;
                              v519 = &v594;
                              _os_log_send_and_compose_impl();
                            }

                            objc_msgSend___basicChannelRepresentation_(self, v236, (uint64_t)v195, v237, v238);
                            v239 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((objc_msgSend_containsObject_(v560, v240, (uint64_t)v239, v241, v242) & 1) != 0)
                            {
                              objc_msgSend_objectForKeyedSubscript_(self->_followup6GHzRNRMap, v243, (uint64_t)v232, v244, v245);
                              v246 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v246)
                                objc_msgSend_setObject_forKeyedSubscript_(self->_followup6GHzRNRMap, v247, (uint64_t)v558, (uint64_t)v232, v249);
                              objc_msgSend___alreadyFoundFollowup6GHzBSSWithSignature_(self, v247, (uint64_t)v232, v248, v249, v519, v521);
                              v250 = objc_claimAutoreleasedReturnValue();
                              if (v250)
                              {
                                v251 = v250;
                                CWFGetOSLog();
                                v252 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v252)
                                {
                                  CWFGetOSLog();
                                  v253 = (id)objc_claimAutoreleasedReturnValue();

                                }
                                else
                                {
                                  v253 = MEMORY[0x1E0C81028];
                                  v303 = MEMORY[0x1E0C81028];
                                }

                                if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(v594) = 0;
                                  LODWORD(v521) = 2;
                                  v519 = &v594;
                                  _os_log_send_and_compose_impl();
                                }

                                self = v554;
                                v308 = v563;
                                if (!v563)
                                {
                                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v304, v305, v306, v307);
                                  v308 = (void *)objc_claimAutoreleasedReturnValue();
                                }
                                v563 = v308;
                                objc_msgSend_addObject_(v308, v304, (uint64_t)v251, v306, v307, v519, v521);
                              }
                              else
                              {
                                v254 = objc_alloc_init(CWFScanParameters);
                                objc_msgSend_networkName(v226, v255, v256, v257, v258);
                                v259 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_setSSID_(v254, v260, (uint64_t)v259, v261, v262);

                                objc_msgSend_setBSSID_(v254, v263, (uint64_t)v217, v264, v265);
                                v603 = v239;
                                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v266, (uint64_t)&v603, 1, v267);
                                v268 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_setChannels_(v254, v269, (uint64_t)v268, v270, v271);

                                objc_msgSend_setBSSType_(v254, v272, 3, v273, v274);
                                objc_msgSend_setPHYMode_(v254, v275, 1, v276, v277);
                                objc_msgSend_setNumberOfScans_(v254, v278, 1, v279, v280);
                                objc_msgSend_setIncludeHiddenNetworks_(v254, v281, 1, v282, v283);
                                objc_msgSend_setAcceptableCacheAge_(v254, v284, 0, v285, v286);
                                objc_msgSend_setDwellTime_(v254, v287, a5, v288, v289);
                                if (objc_msgSend_isUPRActive(v556, v290, v291, v292, v293))
                                  objc_msgSend_setScanFlags_(v254, v294, 32, v295, v296);
                                else
                                  objc_msgSend_setScanFlags_(v254, v294, 1056, v295, v296);
                                objc_msgSend_setScanType_(v254, v297, 1, v298, v299);
                                objc_msgSend_addObject_(v547, v300, (uint64_t)v254, v301, v302);

                                v251 = 0;
                              }
                            }
                            else
                            {
                              CWFGetOSLog();
                              v309 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v309)
                              {
                                CWFGetOSLog();
                                v251 = (id)objc_claimAutoreleasedReturnValue();

                              }
                              else
                              {
                                v251 = MEMORY[0x1E0C81028];
                                v310 = MEMORY[0x1E0C81028];
                              }

                              if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                              {
                                v594 = 138543362;
                                v595 = (uint64_t)v239;
                                LODWORD(v521) = 12;
                                v519 = &v594;
                                _os_log_send_and_compose_impl();
                              }
                            }

                          }
                          ++v225;
                        }
                        while (v224 != v225);
                        v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v220, (uint64_t)&v573, (uint64_t)v604, 16);
                        v224 = v311;
                      }
                      while (v311);
                    }

                    k = v542;
                  }

                }
              }

            }
            v540 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v536, v189, (uint64_t)&v577, (uint64_t)v605, 16);
          }
          while (v540);
          v187 = v536;
        }
        v59 = v187;
      }

      v42 = v533 + 1;
    }
    while (v533 + 1 != v532);
    v315 = objc_msgSend_countByEnumeratingWithState_objects_count_(v528, v38, (uint64_t)&v585, (uint64_t)v608, 16);
    v532 = v315;
  }
  while (v315);
LABEL_121:

  if (objc_msgSend_count(v547, v316, v317, v318, v319))
  {
    objc_msgSend_followup6GHzScanChannels(self->_metric, v320, v321, v322, v323);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    v523 = v324;
    if (v324)
    {
      v329 = (void *)objc_msgSend_mutableCopy(v324, v325, v326, v327, v328);
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v325, v326, v327, v328);
      v329 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v531 = v329;

    v571 = 0u;
    v572 = 0u;
    v569 = 0u;
    v570 = 0u;
    v541 = v547;
    v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v331, (uint64_t)&v569, (uint64_t)v602, 16);
    if (v332)
    {
      v336 = v332;
      v537 = 0;
      v559 = 0;
      v337 = MEMORY[0x1E0C81028];
      v557 = *(id *)v570;
      v535 = *MEMORY[0x1E0CB2D50];
      v527 = *MEMORY[0x1E0CB3388];
      v534 = *MEMORY[0x1E0CB2FE0];
      do
      {
        v338 = 0;
        v546 = v336;
        do
        {
          if (*(id *)v570 != v557)
            objc_enumerationMutation(v541);
          v339 = *(void **)(*((_QWORD *)&v569 + 1) + 8 * (_QWORD)v338);
          objc_msgSend_objectForKeyedSubscript_(v554->_followup6GHzScanResultsMap, v333, (uint64_t)v339, v334, v335, v519, v521);
          v340 = (id)objc_claimAutoreleasedReturnValue();
          CWFGetOSLog();
          v341 = objc_claimAutoreleasedReturnValue();
          v342 = (void *)v341;
          if (v340)
          {
            if (v341)
            {
              CWFGetOSLog();
              v343 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v345 = v337;
              v343 = v337;
            }

            if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_SSID(v339, v346, v347, v348, v349);
              v350 = (void *)objc_claimAutoreleasedReturnValue();
              v543 = objc_msgSend_shortSSID(v339, v351, v352, v353, v354);
              objc_msgSend_BSSID(v339, v355, v356, v357, v358);
              v548 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v548, v359, v360, v361, v362);
              v363 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channels(v339, v364, v365, v366, v367);
              v368 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v368, v369, v370, v371, v372);
              v373 = v338;
              v374 = (void *)objc_claimAutoreleasedReturnValue();
              v594 = 138544130;
              v595 = (uint64_t)v350;
              v596 = 2048;
              v597 = v543;
              v598 = 2114;
              v599 = (uint64_t)v363;
              v600 = 2114;
              v601 = v374;
              LODWORD(v521) = 42;
              v519 = &v594;
              _os_log_send_and_compose_impl();

              v338 = v373;
              v336 = v546;

            }
            v379 = v563;
            if (!v563)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v375, v376, v377, v378);
              v379 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v563 = v379;
            objc_msgSend_addObjectsFromArray_(v379, v375, (uint64_t)v340, v377, v378, v519, v521);
            self = v554;
          }
          else
          {
            if (v341)
            {
              CWFGetOSLog();
              v344 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v380 = v337;
              v344 = v337;
            }

            if (os_log_type_enabled(v344, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_SSID(v339, v381, v382, v383, v384);
              v385 = (void *)objc_claimAutoreleasedReturnValue();
              v544 = objc_msgSend_shortSSID(v339, v386, v387, v388, v389);
              objc_msgSend_BSSID(v339, v390, v391, v392, v393);
              v549 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_redactedForWiFi(v549, v394, v395, v396, v397);
              v398 = v338;
              v399 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_channels(v339, v400, v401, v402, v403);
              v404 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v404, v405, v406, v407, v408);
              v409 = (void *)objc_claimAutoreleasedReturnValue();
              v594 = 138544130;
              v595 = (uint64_t)v385;
              v596 = 2048;
              v597 = v544;
              v598 = 2114;
              v599 = (uint64_t)v399;
              v600 = 2114;
              v601 = v409;
              LODWORD(v521) = 42;
              v519 = &v594;
              _os_log_send_and_compose_impl();

              v338 = v398;
            }

            v410 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
            v411 = v554;
            objc_msgSend_scanForNetworksHandler(v554, v412, v413, v414, v415);
            v416 = (void *)objc_claimAutoreleasedReturnValue();

            v553 = v338;
            if (v416)
            {
              v568 = 0;
              objc_msgSend___calloutToScanForNetworksWithParameters_scanChannels_error_(v554, v417, (uint64_t)v339, 0, (uint64_t)&v568);
              v421 = (void *)objc_claimAutoreleasedReturnValue();
              v422 = v568;
              v550 = v422;
              if (v421)
              {
                objc_msgSend_channels(v339, v423, v424, v425, v426);
                v427 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstObject(v427, v428, v429, v430, v431);
                v432 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_addObject_(v531, v433, (uint64_t)v432, v434, v435);
                v440 = v563;
                if (!v563)
                {
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v436, v437, v438, v439);
                  v440 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v563 = v440;
                objc_msgSend_addObjectsFromArray_(v440, v436, (uint64_t)v421, v438, v439, v519, v521);
                v411 = v554;
                objc_msgSend_setObject_forKeyedSubscript_(v554->_followup6GHzScanResultsMap, v441, (uint64_t)v421, (uint64_t)v339, v442);
              }
              else
              {
                v447 = (uint64_t)v422;
                objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v423, v424, v425, v426);
                v448 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKeyedSubscript_(v448, v449, (uint64_t)CFSTR("Failed to perform 6GHz followup scan"), v535, v450);
                objc_msgSend_setObject_forKeyedSubscript_(v448, v451, v447, v527, v452);
                objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v453, v534, 2, (uint64_t)v448);
                v432 = v559;
                v537 = v448;
                v559 = (id)objc_claimAutoreleasedReturnValue();
                v411 = v554;
              }
            }
            else
            {
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v417, v418, v419, v420);
              v443 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_setObject_forKeyedSubscript_(v443, v444, (uint64_t)CFSTR("CWFAutoJoinManager.scanForNetworksHandler() not configured"), v535, v445);
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v446, v534, 6, (uint64_t)v443);
              v421 = 0;
              v550 = 0;
              v432 = v559;
              v537 = v443;
              v559 = (id)objc_claimAutoreleasedReturnValue();
            }

            v454 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v410;
            v459 = objc_msgSend_followup6GHzScanDuration(v411->_metric, v455, v456, v457, v458);
            objc_msgSend_setFollowup6GHzScanDuration_(v411->_metric, v460, v459 + v454 / 0xF4240, v461, v462);
            if (v559)
            {
              objc_msgSend_scanErrors(v554->_metric, v463, v464, v465, v466);
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              if (v471)
              {
                objc_msgSend_scanErrors(v554->_metric, v467, v468, v469, v470);
                v472 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_arrayByAddingObject_(v472, v473, (uint64_t)v559, v474, v475);
                v476 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setScanErrors_(v554->_metric, v477, (uint64_t)v476, v478, v479);

              }
              else
              {
                objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v467, (uint64_t)v559, v469, v470);
                v472 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setScanErrors_(v554->_metric, v480, (uint64_t)v472, v481, v482);
              }

            }
            CWFGetOSLog();
            v483 = (void *)objc_claimAutoreleasedReturnValue();
            if (v483)
            {
              CWFGetOSLog();
              v484 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v485 = v337;
              v484 = v337;
            }

            if (os_log_type_enabled(v484, (os_log_type_t)(16 * (v421 == 0))))
            {
              if (v563)
                v490 = "SUCCEEDED";
              else
                v490 = "FAILED";
              v491 = objc_msgSend_count(v421, v486, v487, v488, v489, v519, v521);
              objc_msgSend___descriptionForError_(v554, v492, (uint64_t)v559, v493, v494);
              v495 = (id)objc_claimAutoreleasedReturnValue();
              v594 = 136446978;
              v595 = (uint64_t)v490;
              v596 = 2048;
              v597 = v454 / 0xF4240;
              v598 = 2048;
              v599 = v491;
              v600 = 2114;
              v601 = v495;
              LODWORD(v521) = 42;
              v519 = &v594;
              _os_log_send_and_compose_impl();

            }
            CWFGetOSLog();
            v496 = (void *)objc_claimAutoreleasedReturnValue();
            if (v496)
            {
              CWFGetOSLog();
              v497 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v498 = v337;
              v497 = v337;
            }
            self = v554;

            if (os_log_type_enabled(v497, OS_LOG_TYPE_DEFAULT))
            {
              v503 = objc_msgSend_count(v421, v499, v500, v501, v502);
              v594 = 134217984;
              v595 = v503;
              LODWORD(v521) = 12;
              v519 = &v594;
              _os_log_send_and_compose_impl();
            }

            v566 = 0u;
            v567 = 0u;
            v564 = 0u;
            v565 = 0u;
            v340 = v421;
            v505 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v504, (uint64_t)&v564, (uint64_t)v593, 16);
            if (v505)
            {
              v506 = v505;
              v507 = *(_QWORD *)v565;
              do
              {
                for (m = 0; m != v506; ++m)
                {
                  if (*(_QWORD *)v565 != v507)
                    objc_enumerationMutation(v340);
                  v509 = *(_QWORD *)(*((_QWORD *)&v564 + 1) + 8 * m);
                  CWFGetOSLog();
                  v510 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v510)
                  {
                    CWFGetOSLog();
                    v511 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v512 = v337;
                    v511 = v337;
                  }

                  if (os_log_type_enabled(v511, OS_LOG_TYPE_DEFAULT))
                  {
                    v594 = 138543362;
                    v595 = v509;
                    LODWORD(v521) = 12;
                    v519 = &v594;
                    _os_log_send_and_compose_impl();
                  }

                  self = v554;
                }
                v506 = objc_msgSend_countByEnumeratingWithState_objects_count_(v340, v513, (uint64_t)&v564, (uint64_t)v593, 16);
              }
              while (v506);
            }

            v336 = v546;
            v338 = v553;
          }

          v338 = (char *)v338 + 1;
        }
        while (v338 != (id)v336);
        v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(v541, v333, (uint64_t)&v569, (uint64_t)v602, 16);
      }
      while (v336);
    }
    else
    {
      v537 = 0;
      v559 = 0;
    }

    objc_msgSend_setFollowup6GHzScanChannels_(self->_metric, v514, (uint64_t)v531, v515, v516);
    if (a7)
    {
      v330 = v537;
      if (v559)
      {
        v559 = objc_retainAutorelease(v559);
        *a7 = v559;
      }
    }
    else
    {
      v330 = v537;
    }
  }
  else
  {
    v559 = 0;
    v330 = 0;
  }
  v517 = v563;

  return v517;
}

- (id)__passpointScanResults:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    v10 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v3);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v15 = (void *)objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (BOOL)__isNonPinnedEAPTLSCandidate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;

  objc_msgSend_matchingKnownNetworkProfile(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEAP(v5, v6, v7, v8, v9))
    goto LABEL_9;
  objc_msgSend_acceptedEAPTypes(v5, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_1E615E940, v16, v17);

  objc_msgSend_acceptedEAPTypes(v5, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_1E615E958, v25, v26);

  if (v18 && v27)
  {
    objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_count(v32, v33, v34, v35, v36);

    if (v37 != 2)
    {
LABEL_9:
      v53 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if ((v18 | v27) != 1)
      goto LABEL_9;
    objc_msgSend_acceptedEAPTypes(v5, v28, v29, v30, v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_count(v42, v43, v44, v45, v46);

    if (v47 != 1)
      goto LABEL_9;
  }
  objc_msgSend_TLSTrustedServerNames(v5, v38, v39, v40, v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_count(v48, v49, v50, v51, v52) == 0;

LABEL_10:
  return v53;
}

- (BOOL)__allowJoinCandidate:(id)a3 context:(id)a4 defer:(BOOL *)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableSet *failedToJoinKnownNetworkIDs;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int isStandalone6G;
  const char *v105;
  uint64_t v106;
  id v107;
  BOOL v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  id v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  BOOL *v124;
  id *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  NSObject *v137;
  id v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v155;
  OS_dispatch_queue *targetQueue;
  const char *v157;
  int v158;
  uint64_t v159;
  id *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  char v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  id v201;
  id v202;
  id v203;
  BOOL v204;
  int v205;
  void *v206;
  __int16 v207;
  id v208;
  __int16 v209;
  id v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v204 = 0;
  objc_msgSend_autoJoinParameters(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_trigger(v16, v17, v18, v19, v20);

  failedToJoinKnownNetworkIDs = self->_failedToJoinKnownNetworkIDs;
  objc_msgSend_matchingKnownNetworkProfile(v10, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(failedToJoinKnownNetworkIDs) = objc_msgSend_containsObject_(failedToJoinKnownNetworkIDs, v33, (uint64_t)v32, v34, v35);

  if ((_DWORD)failedToJoinKnownNetworkIDs)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v36, v37, v38, v39);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)CFSTR("Already failed to auto-join known network profile"), *MEMORY[0x1E0CB2D50], v42);
LABEL_18:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v43, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v40);
    v107 = (id)objc_claimAutoreleasedReturnValue();
    v108 = 0;
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend_channel(v10, v36, v37, v38, v39);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_is6GHz(v44, v45, v46, v47, v48)
    && !objc_msgSend_maxCompatibilityEnabled(self, v49, v50, v51, v52))
  {
    objc_msgSend_matchingKnownNetworkProfile(v10, v53, v54, v55, v56);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    isStandalone6G = objc_msgSend_isStandalone6G(v99, v100, v101, v102, v103);

    if (isStandalone6G)
      goto LABEL_17;
  }
  else
  {

  }
  objc_msgSend_channel(v10, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_is6GHz(v61, v62, v63, v64, v65))
  {

    if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0x36)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v66, v67, v68, v69);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v40, v70, (uint64_t)CFSTR("6G is not allowed with current trigger"), *MEMORY[0x1E0CB2D50], v71);
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend_channel(v10, v66, v67, v68, v69);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend_is6GHz(v72, v73, v74, v75, v76);

  if ((v77 & 1) == 0 && v21 == 45)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v78, v79, v80, v81);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v82, (uint64_t)CFSTR("non-6G is not allowed with current trigger"), *MEMORY[0x1E0CB2D50], v83);
    goto LABEL_18;
  }
  objc_msgSend_channel(v10, v78, v79, v80, v81);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_is6GHz(v84, v85, v86, v87, v88) & 1) == 0)
  {

    goto LABEL_43;
  }
  objc_msgSend_matchingKnownNetworkProfile(v10, v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend_disable6EMode(v93, v94, v95, v96, v97);

  if (v98 == 2)
  {
LABEL_17:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v57, v58, v59, v60);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v40, v105, (uint64_t)CFSTR("6G is not allowed with this network"), *MEMORY[0x1E0CB2D50], v106);
    goto LABEL_18;
  }
LABEL_43:
  objc_msgSend_matchingKnownNetworkProfile(v10, v57, v58, v59, v60);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  targetQueue = self->_targetQueue;
  v203 = 0;
  v158 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v157, (uint64_t)v155, (uint64_t)v11, 0, &v204, targetQueue, &v203);
  v107 = v203;

  if (v158)
  {
    v160 = a6;
    objc_msgSend_matchingKnownNetworkProfile(v10, v109, v159, v110, v111);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_addReason(v161, v162, v163, v164, v165) == 10
      && ((objc_msgSend_isOpen(v10, v166, v167, v168, v169) & 1) != 0
       || (objc_msgSend_isOWE(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_isWAPI(v10, v170, v171, v172, v173) & 1) != 0
       || objc_msgSend_isPSK(v10, v170, v171, v172, v173)
       && ((objc_msgSend_isWEP(v10, v170, v171, v172, v173) & 1) != 0
        || (objc_msgSend_isWPA(v10, v170, v171, v172, v173) & 1) != 0)
       || (objc_msgSend_hasWEP104Cipher(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_hasWEP40Cipher(v10, v170, v171, v172, v173) & 1) != 0
       || (objc_msgSend_hasTKIPCipher(v10, v170, v171, v172, v173) & 1) != 0))
    {
      objc_msgSend_matchingKnownNetworkProfile(v10, v170, v171, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastJoinedByUserAt(v174, v175, v176, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v179)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v180, v181, v182, v183);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v40, v184, (uint64_t)CFSTR("Carrier-based known network profile with weak security never joined by user"), *MEMORY[0x1E0CB2D50], v185);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v186, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v40);
        v187 = objc_claimAutoreleasedReturnValue();

        v108 = 0;
        v107 = (id)v187;
        a6 = v160;
        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend_allowJoinCandidateHandler(self, v180, v181, v182, v183);
    v188 = (void *)objc_claimAutoreleasedReturnValue();

    if (v188)
    {
      v202 = 0;
      v189 = objc_msgSend___calloutToAllowJoinCandidate_trigger_defer_error_(self, v109, (uint64_t)v10, v21, (uint64_t)&v204, &v202);
      v40 = v202;
      a6 = v160;
      if ((v189 & 1) != 0)
      {
        v108 = 1;
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v190, v191, v192, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v194, v195, (uint64_t)CFSTR("Join candidate is not allowed by daemon"), *MEMORY[0x1E0CB2D50], v196);
        objc_msgSend_setObject_forKeyedSubscript_(v194, v197, (uint64_t)v40, *MEMORY[0x1E0CB3388], v198);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v199, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v194);
        v200 = objc_claimAutoreleasedReturnValue();

        v108 = 0;
        v107 = (id)v200;
      }
      goto LABEL_19;
    }
    v108 = 1;
    a6 = v160;
  }
  else
  {
    v108 = 0;
  }
LABEL_20:
  if (objc_msgSend___isDeferrableJoinCandidate_(self, v109, (uint64_t)v10, v110, v111))
  {
    v204 = 1;
    if (v108)
    {
LABEL_22:
      if (!a5)
        goto LABEL_38;
      goto LABEL_31;
    }
  }
  else if (v108)
  {
    goto LABEL_22;
  }
  CWFGetOSLog();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    CWFGetOSLog();
    v113 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v113 = MEMORY[0x1E0C81028];
    v114 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_matchingKnownNetworkProfile(v10, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v119, v120, v121, v122, v123);
    v201 = v11;
    v124 = a5;
    v125 = a6;
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v126, v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___descriptionForError_(self, v132, (uint64_t)v107, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = 138543874;
    v206 = v131;
    v207 = 2114;
    v208 = v135;
    v209 = 2114;
    v210 = v10;
    _os_log_send_and_compose_impl();

    a6 = v125;
    a5 = v124;
    v11 = v201;

  }
  if (a5)
  {
LABEL_31:
    if (v204)
    {
      CWFGetOSLog();
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      if (v136)
      {
        CWFGetOSLog();
        v137 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v137 = MEMORY[0x1E0C81028];
        v138 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_matchingKnownNetworkProfile(v10, v139, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v143, v144, v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_redactedForWiFi(v148, v149, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v205 = 138543618;
        v206 = v153;
        v207 = 2114;
        v208 = v10;
        _os_log_send_and_compose_impl();

      }
      *a5 = v204;
    }
  }
LABEL_38:
  if (a6 && v107)
    *a6 = objc_retainAutorelease(v107);

  return v108;
}

- (BOOL)__performJoinWithNetwork:(id)a3 context:(id)a4 error:(id *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  int v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  _BOOL4 v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  char isEqual;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  CWFAutoJoinManager *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  CWFScanResult *steerFromNetwork;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  CWFScanResult *steerToNetwork;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  __uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  _BOOL8 v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  char v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  void *v439;
  NSObject *v440;
  id v441;
  os_log_type_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  const char *v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  void *v452;
  BOOL v453;
  int *v455;
  uint64_t v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  int v464;
  int v465;
  void *v466;
  unint64_t v467;
  void *v468;
  void *v469;
  __uint64_t v471;
  void *v472;
  void *v473;
  void *v474;
  id obj;
  id obja;
  CWFAssocParameters *v477;
  uint64_t v478;
  void *v479;
  id v480;
  int v481;
  uint64_t v482;
  id v483;
  id v484;
  char *v485;
  CWFAutoJoinManager *v486;
  id v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  int v492;
  const char *v493;
  __int16 v494;
  unint64_t v495;
  __int16 v496;
  void *v497;
  __int16 v498;
  void *v499;
  _BYTE v500[128];
  uint64_t v501;

  v501 = *MEMORY[0x1E0C80C00];
  v485 = (char *)a3;
  v480 = a4;
  v486 = self;
  objc_msgSend_associatedNetwork(self, v7, v8, v9, v10);
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v492 = 138543362;
    v493 = v485;
    LODWORD(v456) = 12;
    v455 = &v492;
    _os_log_send_and_compose_impl();
  }

  v471 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_associateToNetworkHandler(v486, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21, v22);
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v473, v61, (uint64_t)CFSTR("CWFAutoJoinManager.associateToNetworkHandler() not configured"), *MEMORY[0x1E0CB2D50], v62);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v63, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v473);
    v483 = (id)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v477 = 0;
    v481 = 0;
    goto LABEL_56;
  }
  v477 = objc_alloc_init(CWFAssocParameters);
  objc_msgSend_setScanResult_(v477, v23, (uint64_t)v485, v24, v25);
  objc_msgSend_SSID(v485, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v474, v31, v32, v33, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 == v39)
  {

  }
  else
  {
    objc_msgSend_SSID(v485, v35, v36, v37, v38);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend_SSID(v474, v40, v41, v42, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_msgSend_SSID(v485, v45, v46, v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_SSID(v474, v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v50, v56, (uint64_t)v55, v57, v58) & 1) != 0)
          v60 = 1;
        else
          v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v486, v59, (uint64_t)v485, (uint64_t)v474, (uint64_t)v480);

      }
      else
      {
        v60 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v486, v45, (uint64_t)v485, (uint64_t)v474, (uint64_t)v480);
      }

      if (v60)
        goto LABEL_20;
LABEL_15:
      v70 = 0;
      goto LABEL_41;
    }
    v69 = objc_msgSend___candidateSupportsSeamlessSSIDTransition_fromNetwork_context_(v486, v40, (uint64_t)v485, (uint64_t)v474, (uint64_t)v480);

    if ((v69 & 1) == 0)
      goto LABEL_15;
  }
LABEL_20:
  objc_msgSend_colocatedScopeID(v486, v65, v66, v67, v68, v455, v456);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColocatedScopeID_(v477, v72, (uint64_t)v71, v73, v74);

  objc_msgSend_autoJoinParameters(v480, v75, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_trigger(v79, v80, v81, v82, v83) == 54)
  {

  }
  else
  {
    objc_msgSend_autoJoinParameters(v480, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_trigger(v88, v89, v90, v91, v92) == 55;

    if (!v70)
      goto LABEL_41;
  }
  v490 = 0u;
  v491 = 0u;
  v488 = 0u;
  v489 = 0u;
  objc_msgSend_autoJoinParameters(v480, v65, v66, v67, v68);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredChannels(v93, v94, v95, v96, v97);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v488, (uint64_t)v500, 16);
  if (v482)
  {
    v478 = *(_QWORD *)v489;
LABEL_25:
    v102 = 0;
    while (1)
    {
      if (*(_QWORD *)v489 != v478)
        objc_enumerationMutation(obj);
      v103 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * v102);
      objc_msgSend___basicChannelRepresentation_(v486, v99, v103, v100, v101);
      v484 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_channel(v485, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___basicChannelRepresentation_(v486, v109, (uint64_t)v108, v110, v111);
      v115 = (id)objc_claimAutoreleasedReturnValue();
      if (v484 == v115)
      {

LABEL_39:
        objc_msgSend_setForceBSSID_(v477, v146, 1, v147, v148);
        goto LABEL_40;
      }
      objc_msgSend___basicChannelRepresentation_(v486, v112, v103, v113, v114);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      if (v120)
      {
        objc_msgSend_channel(v485, v116, v117, v118, v119);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___basicChannelRepresentation_(v486, v122, (uint64_t)v121, v123, v124);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        if (v128)
        {
          objc_msgSend___basicChannelRepresentation_(v486, v125, v103, v126, v127);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_channel(v485, v130, v131, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___basicChannelRepresentation_(v486, v135, (uint64_t)v134, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v129, v139, (uint64_t)v138, v140, v141);

          if ((isEqual & 1) != 0)
            goto LABEL_39;
          goto LABEL_35;
        }

      }
LABEL_35:
      if (v482 == ++v102)
      {
        v482 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v99, (uint64_t)&v488, (uint64_t)v500, 16);
        if (v482)
          goto LABEL_25;
        break;
      }
    }
  }

  objc_msgSend_setBandPreference_(v477, v143, 4, v144, v145);
LABEL_40:
  v70 = 1;
LABEL_41:
  objc_msgSend_autoJoinParameters(v480, v65, v66, v67, v68, v455, v456);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_mode(v149, v150, v151, v152, v153) == 2
    && !objc_msgSend_BSSChannelsOnly(v480, v154, v155, v156, v157))
  {

  }
  else
  {
    v158 = objc_msgSend_didForceAllRemainingChannels(v480, v154, v155, v156, v157);

    if ((v158 & 1) == 0)
      goto LABEL_48;
  }
  if ((CWFScanResultHas6GHzOnlyBSS(v485, v486->_cumulativeScanResults, &unk_1E6133E20) & 1) != 0)
  {
    v64 = 1;
LABEL_49:
    objc_msgSend_setHas6GHzOnlyBSS_(v477, v159, 1, v161, v162);
    goto LABEL_50;
  }
LABEL_48:
  objc_msgSend_matchingKnownNetworkProfile(v485, v159, v160, v161, v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(v163, v164, v165, v166, v167);

  v64 = 0;
  if (v168)
    goto LABEL_49;
LABEL_50:
  v487 = 0;
  v481 = objc_msgSend___calloutToAssociateWithParameters_error_(v486, v159, (uint64_t)v477, (uint64_t)&v487, v162);
  v173 = v487;
  if ((v481 & 1) != 0)
  {
    if (v70)
    {
      v174 = v486;
      objc_sync_enter(v174);
      v179 = objc_msgSend_copy(v474, v175, v176, v177, v178);
      steerFromNetwork = v174->_steerFromNetwork;
      v174->_steerFromNetwork = (CWFScanResult *)v179;

      v185 = objc_msgSend_copy(v485, v181, v182, v183, v184);
      steerToNetwork = v174->_steerToNetwork;
      v174->_steerToNetwork = (CWFScanResult *)v185;

      objc_sync_exit(v174);
    }
    v473 = 0;
    v483 = 0;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v169, v170, v171, v172);
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v473, v187, (uint64_t)CFSTR("Failed to join to network"), *MEMORY[0x1E0CB2D50], v188);
    v189 = (void *)MEMORY[0x1E0CB35C8];
    v194 = objc_msgSend_code(v173, v190, v191, v192, v193);
    objc_msgSend_errorWithDomain_code_userInfo_(v189, v195, *MEMORY[0x1E0CB2FE0], v194, (uint64_t)v473);
    v483 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_56:
  v196 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v201 = objc_msgSend_joinDuration(v486->_metric, v197, v198, v199, v200);
  v467 = (v196 - v471) / 0xF4240;
  objc_msgSend_setJoinDuration_(v486->_metric, v202, v201 + v467, v203, v204);
  if (v483)
  {
    objc_msgSend_joinErrors(v486->_metric, v205, v206, v207, v208);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    if (v213)
    {
      objc_msgSend_joinErrors(v486->_metric, v209, v210, v211, v212);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v214, v215, (uint64_t)v483, v216, v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setJoinErrors_(v486->_metric, v219, (uint64_t)v218, v220, v221);

    }
    else
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v209, (uint64_t)v483, v211, v212);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setJoinErrors_(v486->_metric, v222, (uint64_t)v214, v223, v224);
    }

  }
  v225 = (void *)MEMORY[0x1E0CB3940];
  v226 = objc_msgSend_shortSSID(v485, v205, v206, v207, v208, v455, v456);
  objc_msgSend_BSSID(v485, v227, v228, v229, v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_channel(v485, v232, v233, v234, v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = objc_msgSend_channel(v236, v237, v238, v239, v240);
  objc_msgSend_stringWithFormat_(v225, v242, (uint64_t)CFSTR("%lu/%@/%lu"), v243, v244, v226, v231, v241);
  v479 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v486->_followup6GHzRNRMap, v245, (uint64_t)v479, v246, v247);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v486->_followup6GHzFILSDMap, v248, (uint64_t)v479, v249, v250);
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = objc_msgSend_maxCompatibilityEnabled(v486, v251, v252, v253, v254);
  objc_msgSend_setWas6EPreferOn_(v486->_metric, v256, v255, v257, v258);
  objc_msgSend_matchingKnownNetworkProfile(v485, v259, v260, v261, v262);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = objc_msgSend_disable6EMode(v472, v263, v264, v265, v266) == 2;
  objc_msgSend_setWas6EDisabled_(v486->_metric, v268, v267, v269, v270);
  if (v481)
  {
    objc_msgSend_channel(obja, v271, v272, v273, v274);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___updateRNRChannel_has6GHzOnlyBSS_joinCandidate_(v486, v276, (uint64_t)v275, v64, (uint64_t)v485);

    objc_msgSend_channel(v485, v277, v278, v279, v280);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_is6GHz(v281, v282, v283, v284, v285))
    {
      v290 = objc_msgSend_allowStandalone6GHz(v480, v286, v287, v288, v289);

      if ((v290 & 1) == 0)
        objc_msgSend_setWas6GHzDeprioritized_(v486->_metric, v291, 0, v293, v294);
    }
    else
    {

    }
    objc_msgSend_associatedNetwork(v486, v291, v292, v293, v294);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v295, v296, v297, v298, v299);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v485, v301, v302, v303, v304);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (v300 == v309)
    {
      objc_msgSend_setDidTriggerReassoc_(v486->_metric, v305, 1, v307, v308);
    }
    else
    {
      objc_msgSend_associatedNetwork(v486, v305, v306, v307, v308);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v310, v311, v312, v313, v314);
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      if (v319)
      {
        objc_msgSend_SSID(v485, v315, v316, v317, v318);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        if (v324)
        {
          objc_msgSend_associatedNetwork(v486, v320, v321, v322, v323);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v325, v326, v327, v328, v329);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v485, v331, v332, v333, v334);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          v339 = objc_msgSend_isEqual_(v330, v336, (uint64_t)v335, v337, v338);
          objc_msgSend_setDidTriggerReassoc_(v486->_metric, v340, v339, v341, v342);

        }
        else
        {
          objc_msgSend_setDidTriggerReassoc_(v486->_metric, v320, 0, v322, v323);
        }

      }
      else
      {
        objc_msgSend_setDidTriggerReassoc_(v486->_metric, v315, 0, v317, v318);
      }

    }
    if ((objc_msgSend_didTriggerReassoc(v486->_metric, v343, v344, v345, v346) & 1) == 0)
    {
      objc_msgSend_colocatedScopeID(v477, v271, v347, v273, v274);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDidPerformSeamlessSSIDTransition_(v486->_metric, v349, v348 != 0, v350, v351);

    }
  }
  if (obja)
  {
    objc_msgSend_setWasDiscoveredViaRNR_(v486->_metric, v271, 1, v273, v274);
  }
  else if (v468)
  {
    objc_msgSend_setWasDiscoveredViaFILSD_(v486->_metric, v271, 1, v273, v274);
  }
  objc_msgSend_setNetwork_(v486->_metric, v271, (uint64_t)v485, v273, v274);
  objc_msgSend_associatedNetwork(v486, v352, v353, v354, v355);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v356, v357, v358, v359, v360);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v485, v362, v363, v364, v365);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  if (v361 == v370)
  {

    goto LABEL_106;
  }
  objc_msgSend_BSSID(v356, v366, v367, v368, v369);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  if (v469)
  {
    objc_msgSend_BSSID(v485, v371, v372, v373, v374);
    v466 = (void *)objc_claimAutoreleasedReturnValue();
    if (v466)
    {
      objc_msgSend_BSSID(v356, v371, v372, v373, v374);
      v461 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(v485, v375, v376, v377, v378);
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v461, v379, (uint64_t)v462, v380, v381))
      {

        goto LABEL_106;
      }
      v465 = 1;
    }
    else
    {
      v466 = 0;
      v465 = 0;
    }
  }
  else
  {
    v465 = 0;
  }
  objc_msgSend_matchingKnownNetworkProfile(v356, v371, v372, v373, v374);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v382, v383, v384, v385, v386);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchingKnownNetworkProfile(v485, v388, v389, v390, v391);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v392, v393, v394, v395, v396);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  if (v387 == v401)
  {
    v464 = 1;
  }
  else
  {
    objc_msgSend_matchingKnownNetworkProfile(v356, v397, v398, v399, v400);
    v463 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v463, v402, v403, v404, v405);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    if (v410)
    {
      objc_msgSend_matchingKnownNetworkProfile(v485, v406, v407, v408, v409);
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v460, v411, v412, v413, v414);
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      if (v459)
      {
        objc_msgSend_matchingKnownNetworkProfile(v356, v415, v416, v417, v418);
        v458 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v458, v419, v420, v421, v422);
        v457 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_matchingKnownNetworkProfile(v485, v423, v424, v425, v426);
        v427 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v427, v428, v429, v430, v431);
        v432 = (void *)objc_claimAutoreleasedReturnValue();
        v464 = objc_msgSend_isEqual_(v457, v433, (uint64_t)v432, v434, v435);

      }
      else
      {
        v464 = 0;
      }

    }
    else
    {
      v464 = 0;
    }

  }
  if (v465)
  {

    if (!v469)
      goto LABEL_101;
LABEL_104:

    if ((v464 & 1) == 0)
      goto LABEL_106;
    goto LABEL_105;
  }
  if (v469)
    goto LABEL_104;
LABEL_101:

  if (v464)
LABEL_105:
    objc_msgSend_setNetwork_(v486->_metric, v436, (uint64_t)v356, v437, v438);
LABEL_106:
  CWFGetOSLog();
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  if (v439)
  {
    CWFGetOSLog();
    v440 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v440 = MEMORY[0x1E0C81028];
    v441 = MEMORY[0x1E0C81028];
  }

  if (v481)
    v442 = OS_LOG_TYPE_DEFAULT;
  else
    v442 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v440, v442))
  {
    if (v481)
      v446 = "SUCCEEDED";
    else
      v446 = "FAILED";
    objc_msgSend___descriptionForError_(v486, v443, (uint64_t)v483, v444, v445);
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(v486->_metric, v448, v449, v450, v451);
    v452 = (void *)objc_claimAutoreleasedReturnValue();
    v492 = 136446978;
    v493 = v446;
    v494 = 2048;
    v495 = v467;
    v496 = 2114;
    v497 = v447;
    v498 = 2114;
    v499 = v452;
    _os_log_send_and_compose_impl();

  }
  v453 = v483 == 0;
  if (!a5)
    v453 = 1;
  if (!v453)
    *a5 = objc_retainAutorelease(v483);

  return v481;
}

- (void)__sortJoinCandidates:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  CWFAutoJoinManager *v54;
  void *v55;
  id v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  _QWORD v143[4];
  id v144;
  _QWORD v145[5];
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v141 = a3;
  objc_msgSend_array(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinParameters(v6, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v6;
  if (objc_msgSend_trigger(v17, v18, v19, v20, v21) == 54)
  {

  }
  else
  {
    objc_msgSend_autoJoinParameters(v6, v22, v23, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_trigger(v30, v31, v32, v33, v34);

    if (v35 != 55)
      goto LABEL_5;
  }
  objc_msgSend_associatedNetwork(self, v26, v27, v28, v29);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB3928];
  v43 = MEMORY[0x1E0C809B0];
  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = sub_1B06964F4;
  v148[3] = &unk_1E61331D0;
  v149 = v41;
  v139 = v41;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v42, v44, 0, 0, (uint64_t)v148);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v46, (uint64_t)v45, v47, v48);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v49, (uint64_t)CFSTR("matchingKnownNetworkProfile"), 0, (uint64_t)&unk_1E6131D60);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v51, (uint64_t)v50, v52, v53);
  v54 = self;
  v55 = (void *)MEMORY[0x1E0CB3928];
  v146[0] = v43;
  v146[1] = 3221225472;
  v146[2] = sub_1B06966E0;
  v146[3] = &unk_1E61331D0;
  v147 = v36;
  v56 = v36;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v55, v57, 0, 0, (uint64_t)v146);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v59, (uint64_t)v58, v60, v61);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v62, 0, 0, (uint64_t)&unk_1E6133E40);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v64, (uint64_t)v63, v65, v66);

  self = v54;
LABEL_5:
  objc_msgSend_joinCandidateComparator(self, v26, v27, v28, v29);
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v67, 0, 0, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v12, v70, (uint64_t)v69, v71, v72);

  }
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v67, (uint64_t)CFSTR("matchingKnownNetworkProfile"), 0, (uint64_t)&unk_1E6133E60);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v73, (uint64_t)v140, v74, v75);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E0CB3928], v76, 0, 0, (uint64_t)sel_compareLowDataModes_);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v77, (uint64_t)v138, v78, v79);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v80, 0, 0, (uint64_t)&unk_1E6131960);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v81, (uint64_t)v137, v82, v83);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v84, 0, 0, (uint64_t)&unk_1E6131F40);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v85, (uint64_t)v136, v86, v87);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E0CB3928], v88, 0, 0, (uint64_t)sel_compareSupportedPHYModes_);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v90, (uint64_t)v89, v91, v92);
  v93 = MEMORY[0x1E0C809B0];
  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 3221225472;
  v145[2] = sub_1B0696D84;
  v145[3] = &unk_1E6133E88;
  v145[4] = self;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v94, (uint64_t)CFSTR("channel"), 0, (uint64_t)v145);
  v135 = (void *)v68;
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v96, (uint64_t)v95, v97, v98);
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v99, 0, 0, (uint64_t)&unk_1E6131FA0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v101, (uint64_t)v100, v102, v103);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E0CB3928], v104, (uint64_t)CFSTR("matchingKnownNetworkProfile"), 0, (uint64_t)sel_compareSupportedSecurityTypes_);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v106, (uint64_t)v105, v107, v108);
  objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E0CB3928], v109, 0, 0, (uint64_t)sel_compareSupportedSecurityTypes_);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v111, (uint64_t)v110, v112, v113);
  objc_msgSend_associatedNetwork(self, v114, v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)MEMORY[0x1E0CB3928];
  v143[0] = v93;
  v143[1] = 3221225472;
  v143[2] = sub_1B0697170;
  v143[3] = &unk_1E61331D0;
  v144 = v118;
  v120 = v118;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v119, v121, 0, 0, (uint64_t)v143);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v123, (uint64_t)v122, v124, v125);
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v126, (uint64_t)CFSTR("RSSI"), 0, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v129, (uint64_t)v128, v130, v131);
  objc_msgSend_sortUsingDescriptors_(v141, v132, (uint64_t)v12, v133, v134);

}

- (id)__morePreferredKnownNetworksWithCandidate:(id)a3 knownNetworks:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  char isEqual;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  double v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  double v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  double v151;
  char v152;
  double v153;
  double v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  double v159;
  double v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  double v165;
  double v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  double v171;
  double v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v180;
  void *v181;
  unint64_t v182;
  void *v184;
  unint64_t v185;
  id obj;
  void *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v9;
  objc_msgSend_autoJoinParameters(v9, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_trigger(v19, v20, v21, v22, v23);

  objc_msgSend_lastJoinedAt(v7, v25, v26, v27, v28);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastDiscoveredAt(v7, v29, v30, v31, v32);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkGroupID(v7, v33, v34, v35, v36);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend_networkGroupPriority(v7, v37, v38, v39, v40);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v41, v42, v43, v44);
  v46 = v45;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  obj = v8;
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v188, (uint64_t)v192, 16);
  if (v48)
  {
    v53 = v48;
    v54 = *(_QWORD *)v189;
    v185 = v24 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v189 != v54)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * v55);
        objc_msgSend_identifier(v7, v49, v50, v51, v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v56, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v57, v63, (uint64_t)v62, v64, v65);

        if ((isEqual & 1) == 0 && (objc_msgSend_isPersonalHotspot(v56, v49, v50, v51, v52) & 1) == 0)
        {
          if (objc_msgSend_compareUserPriority_(v7, v49, (uint64_t)v56, v51, v52) == -1)
          {
            objc_msgSend_addedAt(v56, v67, v68, v69, v70);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastJoinedAt(v56, v81, v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastDiscoveredAt(v56, v86, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v91, v92, v93, v94);
            if (v46 - v99 < 1209600.0)
              goto LABEL_27;
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v95, v96, v97, v98);
            if (v46 - v104 < 1209600.0)
              goto LABEL_27;
            objc_msgSend_timeIntervalSinceReferenceDate(v80, v100, v101, v102, v103);
            if (v46 - v109 < 1209600.0)
              goto LABEL_27;
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v105, v106, v107, v108);
            v111 = v110;
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v112, v113, v114, v115);
            if (v111 > v120)
              goto LABEL_27;
            objc_msgSend_timeIntervalSinceReferenceDate(v90, v116, v117, v118, v119);
            v122 = v121;
            objc_msgSend_timeIntervalSinceReferenceDate(v180, v123, v124, v125, v126);
            if (v122 > v131)
              goto LABEL_27;
            if (!v85 || !v181)
              goto LABEL_22;
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v127, v128, v129, v130);
            v133 = floor(v132);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v134, v135, v136, v137);
            v139 = v133 - floor(v138);
            objc_msgSend_timeIntervalSinceReferenceDate(v85, v140, v141, v142, v143);
            v145 = floor(v144);
            objc_msgSend_timeIntervalSinceReferenceDate(v181, v146, v147, v148, v149);
            v151 = v145 - floor(v150);
            if (v139 < 0.0)
              v151 = -v151;
            if (v151 < 1209600.0)
            {
LABEL_27:
              v152 = 0;
            }
            else
            {
LABEL_22:
              v152 = 1;
              if (v90 && v180)
              {
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v127, v128, v129, v130);
                v154 = floor(v153);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v155, v156, v157, v158);
                v160 = v154 - floor(v159);
                objc_msgSend_timeIntervalSinceReferenceDate(v90, v161, v162, v163, v164);
                v166 = floor(v165);
                objc_msgSend_timeIntervalSinceReferenceDate(v180, v167, v168, v169, v170);
                v172 = v166 - floor(v171);
                if (v160 < 0.0)
                  v172 = -v172;
                if (v172 < 1209600.0)
                  goto LABEL_27;
                v152 = 1;
              }
            }

            if (v185 == 52 || (v152 & 1) != 0)
              goto LABEL_35;
LABEL_30:
            if (objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(self, v49, (uint64_t)v56, (uint64_t)v184, 0, 0, self->_targetQueue, 0))
            {
              if (!v14)
              {
                objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v49, v50, v51, v52);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_addObject_(v14, v49, (uint64_t)v56, v51, v52);
            }
            goto LABEL_35;
          }
          objc_msgSend_networkGroupID(v56, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v187, v72, (uint64_t)v71, v73, v74) & 1) == 0)
          {

            goto LABEL_35;
          }
          v79 = objc_msgSend_networkGroupPriority(v56, v75, v76, v77, v78);

          if (v182 < v79)
            goto LABEL_30;
        }
LABEL_35:
        ++v55;
      }
      while (v53 != v55);
      v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v188, (uint64_t)v192, 16);
      v53 = v173;
    }
    while (v173);
  }

  v178 = (void *)objc_msgSend_copy(v14, v174, v175, v176, v177);
  return v178;
}

- (BOOL)__connectToHotspot:(id)a3 error:(id *)a4
{
  char *v6;
  void *v7;
  NSObject *v8;
  id v9;
  __uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  __uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  id v71;
  os_log_type_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  void *v77;
  int *v79;
  int v80;
  id v81;
  int v82;
  const char *v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  CWFGetOSLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v82 = 138543362;
    v83 = v6;
    v80 = 12;
    v79 = &v82;
    _os_log_send_and_compose_impl();
  }

  v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_connectToHotspotHandler(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v81 = 0;
    LODWORD(v15) = objc_msgSend___calloutToConnectToHotspot_error_(self, v16, (uint64_t)v6, (uint64_t)&v81, v19);
    v24 = v81;
    v25 = 0;
    v26 = 0;
    if ((v15 & 1) == 0)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v25, v27, (uint64_t)CFSTR("Failed to connect to hotspot"), *MEMORY[0x1E0CB2D50], v28);
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2FE0];
      v35 = objc_msgSend_code(v24, v31, v32, v33, v34);
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v36, v30, v35, (uint64_t)v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v16, v17, v18, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v25, v37, (uint64_t)CFSTR("CWFAutoJoinManager.connectToHotspotHandler() not configured"), *MEMORY[0x1E0CB2D50], v38);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v39, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v10;
  v45 = objc_msgSend_autoHotspotJoinDuration(self->_metric, v41, v42, v43, v44);
  objc_msgSend_setAutoHotspotJoinDuration_(self->_metric, v46, v45 + v40 / 0xF4240, v47, v48);
  if (v26)
  {
    objc_msgSend_autoHotspotJoinErrors(self->_metric, v49, v50, v51, v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend_autoHotspotJoinErrors(self->_metric, v53, v54, v55, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v58, v59, (uint64_t)v26, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v63, (uint64_t)v62, v64, v65);

    }
    else
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v53, (uint64_t)v26, v55, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAutoHotspotJoinErrors_(self->_metric, v66, (uint64_t)v58, v67, v68);
    }

  }
  objc_msgSend_setHotspot_(self->_metric, v49, (uint64_t)v6, v51, v52, v79, v80);
  CWFGetOSLog();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    CWFGetOSLog();
    v70 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v70 = MEMORY[0x1E0C81028];
    v71 = MEMORY[0x1E0C81028];
  }

  if ((_DWORD)v15)
    v72 = OS_LOG_TYPE_DEFAULT;
  else
    v72 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v70, v72))
  {
    if ((_DWORD)v15)
      v76 = "SUCCEEDED";
    else
      v76 = "FAILED";
    objc_msgSend___descriptionForError_(self, v73, (uint64_t)v26, v74, v75);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 136446978;
    v83 = v76;
    v84 = 2048;
    v85 = v40 / 0xF4240;
    v86 = 2114;
    v87 = v77;
    v88 = 2114;
    v89 = v6;
    _os_log_send_and_compose_impl();

  }
  if (a4 && v26)
    *a4 = objc_retainAutorelease(v26);

  return v15;
}

- (id)__browseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  __uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  __uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t i;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  const char *v82;
  int *v84;
  int v85;
  void *v86;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _BYTE v94[128];
  int v95;
  uint64_t v96;
  __int16 v97;
  unint64_t v98;
  __int16 v99;
  unint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  unint64_t v106;
  __int16 v107;
  unint64_t v108;
  uint64_t v109;

  v6 = a5;
  v109 = *MEMORY[0x1E0C80C00];
  CWFGetOSLog();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CWFGetOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v13 = " [cache-only]";
    else
      v13 = "";
    v95 = 136446722;
    v96 = (uint64_t)v13;
    v97 = 2048;
    v98 = a3;
    v99 = 2048;
    v100 = a4;
    v85 = 32;
    v84 = &v95;
    _os_log_send_and_compose_impl();
  }

  v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend_browseForHotspotsHandler(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v93 = 0;
    objc_msgSend___calloutToBrowseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(self, v20, a3, a4, v6, &v93);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v93;
    if (v24)
    {
      v30 = v24;
      v86 = 0;
      v31 = 0;
    }
    else
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v25, v26, v27, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)CFSTR("Failed to browse for hotspots"), *MEMORY[0x1E0CB2D50], v38);
      objc_msgSend_setObject_forKeyedSubscript_(v36, v39, (uint64_t)v29, *MEMORY[0x1E0CB3388], v40);
      v86 = v36;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v41, *MEMORY[0x1E0CB2FE0], 2, (uint64_t)v36);
      v31 = objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)CFSTR("CWFAutoJoinManager.browseForHotspotsHandler() not configured"), *MEMORY[0x1E0CB2D50], v34);
    v86 = v32;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v35, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v32);
    v31 = objc_claimAutoreleasedReturnValue();
    v24 = 0;
  }
  v42 = (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v14) / 0xF4240;
  objc_msgSend_setAutoHotspotBrowseDuration_(self->_metric, v43, v42, v44, v45);
  objc_msgSend_setAutoHotspotBrowseError_(self->_metric, v46, v31, v47, v48);
  CWFGetOSLog();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    CWFGetOSLog();
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = MEMORY[0x1E0C81028];
    v51 = MEMORY[0x1E0C81028];
  }
  v88 = (void *)v31;

  if (os_log_type_enabled(v50, (os_log_type_t)(16 * (v24 == 0))))
  {
    if (v6)
      v56 = " [cache-only]";
    else
      v56 = "";
    if (v24)
      v57 = "SUCCEEDED";
    else
      v57 = "FAILED";
    v58 = objc_msgSend_count(v24, v52, v53, v54, v55, v84, v85);
    objc_msgSend___descriptionForError_(self, v59, (uint64_t)v88, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 136447746;
    v96 = (uint64_t)v56;
    v97 = 2082;
    v98 = (unint64_t)v57;
    v99 = 2048;
    v100 = v42;
    v101 = 2048;
    v102 = v58;
    v103 = 2114;
    v104 = v62;
    v105 = 2048;
    v106 = a3;
    v107 = 2048;
    v108 = a4;
    _os_log_send_and_compose_impl();

  }
  CWFGetOSLog();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    CWFGetOSLog();
    v64 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = MEMORY[0x1E0C81028];
    v65 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v70 = objc_msgSend_count(v24, v66, v67, v68, v69);
    v95 = 134217984;
    v96 = v70;
    _os_log_send_and_compose_impl();
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v71 = v24;
  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v89, (uint64_t)v94, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v90;
    v76 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v90 != v75)
          objc_enumerationMutation(v71);
        v78 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
        CWFGetOSLog();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          CWFGetOSLog();
          v80 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v81 = v76;
          v80 = v76;
        }

        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v95 = 138543362;
          v96 = v78;
          _os_log_send_and_compose_impl();
        }

      }
      v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v82, (uint64_t)&v89, (uint64_t)v94, 16);
    }
    while (v74);
  }

  if (a6 && v88)
    *a6 = objc_retainAutorelease(v88);

  return v71;
}

- (void)__sortHotspotCandidates:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v3, v5, 0, 1, (uint64_t)&unk_1E6131580);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E0CB3928], v7, 0, 1, (uint64_t)&unk_1E6132300);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v9, (uint64_t)CFSTR("networkType"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v12, (uint64_t)CFSTR("signalStrength"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v15, (uint64_t)CFSTR("batteryLife"), 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v14;
  v24[4] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v24, 5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortUsingDescriptors_(v4, v21, (uint64_t)v20, v22, v23);

}

- (int64_t)__allowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  char isAutoJoinCancelled;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  id v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  isAutoJoinCancelled = objc_msgSend___isAutoJoinCancelled_(self, a2, (uint64_t)&v42, (uint64_t)a4, v4);
  v13 = v42;
  if ((isAutoJoinCancelled & 1) == 0)
  {
    objc_msgSend_allowAutoHotspotHandler(self, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v41 = 0;
      v17 = objc_msgSend___calloutToAllowAutoHotspotWithTrigger_error_(self, v15, a3, (uint64_t)&v41, v16);
      v18 = v41;
      v23 = v18;
      if (v17)
      {

        if (!a4)
          goto LABEL_17;
        goto LABEL_15;
      }
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)CFSTR("Auto-hotspot is not allowed"), *MEMORY[0x1E0CB2D50], v26);
      if (v23)
        objc_msgSend_setObject_forKeyedSubscript_(v24, v27, (uint64_t)v23, *MEMORY[0x1E0CB3388], v28);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v27, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v24);
      v29 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v29;
    }
  }
  CWFGetOSLog();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    CWFGetOSLog();
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = MEMORY[0x1E0C81028];
    v32 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v33, (uint64_t)v13, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543362;
    v44 = v36;
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_setAutoHotspotWasAborted_(self->_metric, v37, 1, v38, v39);
  v17 = 0;
  if (a4)
  {
LABEL_15:
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
LABEL_17:

  return v17;
}

- (BOOL)__allowHotspot:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  int v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  int v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_allowHotspotHandler(self, v7, v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_4;
  v35 = 0;
  v14 = objc_msgSend___calloutToAllowHotspot_error_(self, v12, (uint64_t)v6, (uint64_t)&v35, v13);
  v15 = v35;
  v20 = v15;
  if (v14)
  {

    v11 = 0;
LABEL_4:
    v21 = 1;
    goto LABEL_5;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v16, v17, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)CFSTR("Hotspot is not allowed by daemon"), *MEMORY[0x1E0CB2D50], v25);
  if (v20)
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v20, *MEMORY[0x1E0CB3388], v27);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v26, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v23);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend___descriptionForError_(self, v31, (uint64_t)v11, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543618;
    v37 = v6;
    v38 = 2114;
    v39 = v34;
    _os_log_send_and_compose_impl();

  }
  v21 = 0;
  if (a4 && v11)
  {
    v11 = objc_retainAutorelease(v11);
    v21 = 0;
    *a4 = v11;
  }
LABEL_5:

  return v21;
}

- (BOOL)__performAutoHotspotWithBrowseTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  CWFAutoJoinManager *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  id v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  int v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  __uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  id v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v134;
  void *v135;
  const char *v136;
  int *v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  __uint64_t v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  id v153;
  int v154;
  uint64_t v155;
  __int16 v156;
  void *v157;
  __int16 v158;
  int v159;
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  uint64_t v163;
  _QWORD v164[3];

  v6 = a5;
  v164[1] = *MEMORY[0x1E0C80C00];
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend_UUID(v9->_activeRequest, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend_copy(v14, v15, v16, v17, v18);

  objc_msgSend_parameters(v9->_activeRequest, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_trigger(v23, v24, v25, v26, v27);

  objc_sync_exit(v9);
  if (objc_msgSend___isAnyKnownNetworkNearby(v9, v29, v30, v31, v32))
  {
    v134 = (void *)MEMORY[0x1E0CB35C8];
    v163 = *MEMORY[0x1E0CB2D50];
    v164[0] = CFSTR("Known network is nearby");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v164, (uint64_t)&v163, 1);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v134, v136, *MEMORY[0x1E0CB2FE0], 1, (uint64_t)v135);
    v144 = (id)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    goto LABEL_33;
  }
  v153 = 0;
  v139 = v28;
  v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v33, v28, (uint64_t)&v153, v34);
  v144 = v153;
  if ((v35 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
LABEL_33:
    objc_msgSend_setAutoHotspotMode_(v9->_metric, v36, v35, v37, v38);
    LOBYTE(v97) = 0;
    v98 = 0;
    v140 = 0;
    v63 = 0;
    v66 = 0;
    goto LABEL_28;
  }
  CWFGetOSLog();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    CWFGetOSLog();
    v40 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = MEMORY[0x1E0C81028];
    v41 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    sub_1B06427C0(v35, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v143, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v51, v52, 5, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = 138543618;
    v155 = (uint64_t)v46;
    v156 = 2114;
    v157 = v55;
    LODWORD(v138) = 22;
    v137 = &v154;
    _os_log_send_and_compose_impl();

  }
  v142 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend___updateAutoJoinState_(v9, v56, 2, v57, v58);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = 0;
  objc_msgSend___browseForHotspotsWithTimeout_maxCacheAge_cacheOnly_error_(v9, v64, a3, a4, v6, &v152);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v152;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v66 = v65;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v148, (uint64_t)v162, 16);
  if (v70)
  {
    v71 = *(_QWORD *)v149;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v149 != v71)
          objc_enumerationMutation(v66);
        v73 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * i);
        v147 = 0;
        v74 = objc_msgSend___allowHotspot_error_(v9, v68, v73, (uint64_t)&v147, v69, v137, v138);
        v78 = v147;
        if (v74)
          objc_msgSend_addObject_(v63, v75, v73, v76, v77);

      }
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v68, (uint64_t)&v148, (uint64_t)v162, 16);
    }
    while (v70);
  }

  if (objc_msgSend_count(v63, v79, v80, v81, v82))
  {
    v146 = v144;
    v35 = objc_msgSend___allowAutoHotspotWithTrigger_error_(v9, v83, v139, (uint64_t)&v146, v85);
    v86 = v146;

    if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend___sortHotspotCandidates_(v9, v83, (uint64_t)v63, v84, v85);
      objc_msgSend___updateAutoJoinState_(v9, v87, 3, v88, v89);
      objc_msgSend_firstObject(v63, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = 0;
      v97 = objc_msgSend___connectToHotspot_error_(v9, v95, (uint64_t)v94, (uint64_t)&v145, v96);
      v98 = v145;

    }
    else
    {
      v98 = 0;
      v97 = 0;
    }
    v144 = v86;
  }
  else
  {
    v98 = 0;
    v97 = 0;
  }
  objc_msgSend_setAutoHotspotMode_(v9->_metric, v83, v35, v84, v85, v137, v138);
  if (v142)
  {
    v99 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend_setAutoHotspotWasAttempted_(v9->_metric, v100, 1, v101, v102);
    objc_msgSend_setAutoHotspotDuration_(v9->_metric, v103, (v99 - v142) / 0xF4240, v104, v105);
    objc_msgSend_setAutoHotspotResult_(v9->_metric, v106, v97, v107, v108);
    objc_msgSend_setAutoHotspotError_(v9->_metric, v109, (uint64_t)v144, v110, v111);
    CWFGetOSLog();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      CWFGetOSLog();
      v113 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v113 = MEMORY[0x1E0C81028];
      v114 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      v119 = objc_msgSend_autoHotspotDuration(v9->_metric, v115, v116, v117, v118);
      objc_msgSend_UUIDString(v143, v120, v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v124, v125, 5, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___descriptionForError_(v9, v129, (uint64_t)v144, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = 134218754;
      v155 = v119;
      v156 = 2114;
      v157 = v128;
      v158 = 1024;
      v159 = v97;
      v160 = 2114;
      v161 = v132;
      _os_log_send_and_compose_impl();

    }
  }
LABEL_28:
  if (a6 && v144)
    *a6 = objc_retainAutorelease(v144);

  return v97;
}

- (void)__addDependentThrottleInterval:(unint64_t)a3 trigger:(int64_t)a4 dependentTrigger:(int64_t)a5
{
  CWFAutoJoinThrottle *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableDictionary *throttleIntervalMap;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(CWFAutoJoinThrottle);
  objc_msgSend_setTrigger_(v9, v10, a4, v11, v12);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a5, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v17, a3, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v34, (uint64_t)&v33, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIntervalsBasedOnTriggerTimestamp_(v9, v23, (uint64_t)v22, v24, v25);

  throttleIntervalMap = self->_throttleIntervalMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v27, a4, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(throttleIntervalMap, v31, (uint64_t)v9, (uint64_t)v30, v32);

}

- (void)__addMatchingThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a4;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    v12 = v7;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        v33 = v15;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v17, a3, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v20;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_autoJoinThrottleWithTrigger_intervals_(CWFAutoJoinThrottle, v23, v16, (uint64_t)v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }

}

- (void)__addWilcardThrottleInterval:(unint64_t)a3 triggers:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a4;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v7)
  {
    v12 = v7;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v16 = objc_msgSend_integerValue(v15, v8, v9, v10, v11);
        v33 = &unk_1E615E8C8;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v17, a3, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v20;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v34, (uint64_t)&v33, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_autoJoinThrottleWithTrigger_intervals_(CWFAutoJoinThrottle, v23, v16, (uint64_t)v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_throttleIntervalMap, v26, (uint64_t)v25, (uint64_t)v15, v27);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }

}

- (void)__setupThrottleIntervals
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  CWFAutoJoinManager *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  int *v41;
  int v42;
  int v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(self->_throttleIntervalMap, a2, v2, v3, v4);
  switch(self->_retrySchedule)
  {
    case 3:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1E61609B0, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v8, 0, (uint64_t)&unk_1E61609C8, v9);
      if (os_variant_has_internal_content())
      {
        objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v10, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("assoc_retry_awdl_rt_throttle_interval"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          CWFGetOSLog();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            CWFGetOSLog();
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = MEMORY[0x1E0C81028];
            v31 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v43 = 134218240;
            v44 = 900;
            v45 = 2048;
            v46 = objc_msgSend_unsignedIntegerValue(v18, v32, v33, v34, v35);
            v42 = 22;
            v41 = &v43;
            _os_log_send_and_compose_impl();
          }

          v30 = objc_msgSend_unsignedIntegerValue(v18, v36, v37, v38, v39);
        }
        else
        {
          v30 = 900;
        }

        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v40, v30, 45, 57, v41, v42);
      }
      else
      {
        objc_msgSend___addDependentThrottleInterval_trigger_dependentTrigger_(self, v10, 900, 45, 57);
      }
      break;
    case 5:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1E6160980, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v24, 0, (uint64_t)&unk_1E6160998, v25);
      break;
    case 8:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1E6160950, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v26, 0, (uint64_t)&unk_1E6160968, v27);
      break;
    case 9:
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v6, -1, (uint64_t)&unk_1E6160908, v7);
      objc_msgSend___addWilcardThrottleInterval_triggers_(self, v28, 0, (uint64_t)&unk_1E6160920, v29);
      v21 = &unk_1E6160938;
      v22 = self;
      v23 = 900;
      goto LABEL_11;
    default:
      v21 = &unk_1E61609E0;
      v22 = self;
      v23 = 60;
LABEL_11:
      MEMORY[0x1E0DE7D20](v22, sel___addMatchingThrottleInterval_triggers_, v23, v21, v7);
      break;
  }
}

- (void)__setupRetryIntervals
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  CWFAutoJoinRetryInterval *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CWFAutoJoinRetryInterval *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  void *v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  const char *v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  const char *v441;
  uint64_t v442;
  void *v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  const char *v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  const char *v458;
  uint64_t v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  const char *v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  uint64_t v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  const char *v488;
  uint64_t v489;
  void *v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  void *v498;
  const char *v499;
  uint64_t v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  void *v505;
  NSObject *v506;
  id v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  void *v512;
  CWFAutoJoinRetryInterval *v513;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v7, v8, 0, v9, v10);
  objc_msgSend_setMaxBSSChannelAge_(v7, v11, 2592000, v12, v13);
  objc_msgSend_setMaxBSSChannelCount_(v7, v14, 3, v15, v16);
  objc_msgSend_setPassiveScan_(v7, v17, 1, v18, v19);
  objc_msgSend_setDwellTime_(v7, v20, 110, v21, v22);
  v27 = (void *)objc_msgSend_copy(v7, v23, v24, v25, v26);
  objc_msgSend_setAllowAutoHotspotFallback_(v27, v28, 1, v29, v30);
  v31 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v31, v32, 1, v33, v34);
  objc_msgSend_setMaxBSSChannelAge_(v31, v35, 0, v36, v37);
  objc_msgSend_setMaxBSSChannelCount_(v31, v38, 3, v39, v40);
  objc_msgSend_setDwellTime_(v31, v41, 110, v42, v43);
  v513 = objc_alloc_init(CWFAutoJoinRetryInterval);
  objc_msgSend_setBSSChannelsOnly_(v513, v44, 1, v45, v46);
  objc_msgSend_setMaxBSSChannelAge_(v513, v47, 604800, v48, v49);
  objc_msgSend_setMaxBSSChannelCount_(v513, v50, 3, v51, v52);
  objc_msgSend_setDwellTime_(v513, v53, 110, v54, v55);
  objc_msgSend_setPassiveScan_(v513, v56, 1, v57, v58);
  v63 = (void *)objc_msgSend_copy(v31, v59, v60, v61, v62);
  objc_msgSend_setDwellTime_(v63, v64, 40, v65, v66);
  v71 = (void *)objc_msgSend_copy(v63, v67, v68, v69, v70);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v71, v72, 1, v73, v74);
  v512 = (void *)objc_msgSend_copy(v31, v75, v76, v77, v78);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v512, v79, 1, v80, v81);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v512, v82, 1, v83, v84);
  v89 = (void *)objc_msgSend_copy(v7, v85, v86, v87, v88);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_(v89, v90, 1, v91, v92);
  objc_msgSend_setAlwaysInclude6GHzPSCChannels_(v89, v93, 1, v94, v95);
  v511 = (void *)objc_msgSend_copy(v89, v96, v97, v98, v99);
  objc_msgSend_setAllowAutoHotspotFallback_(v511, v100, 1, v101, v102);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v103, 0, 1, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v106, (uint64_t)v105, v107, v108);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v109, 20, 1, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v112, (uint64_t)v111, v113, v114);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v115, 120, 1, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v118, (uint64_t)v117, v119, v120);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v121, 240, 1, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v124, (uint64_t)v123, v125, v126);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v127, 480, -1, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v130, (uint64_t)v129, v131, v132);

  v137 = (void *)objc_msgSend_copy(v6, v133, v134, v135, v136);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v138, (uint64_t)v137, (uint64_t)&unk_1E615EB80, v139);

  objc_msgSend_removeAllObjects(v6, v140, v141, v142, v143);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v144, 0, 1, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v147, (uint64_t)v146, v148, v149);

  v150 = 5;
  objc_msgSend_autoJoinRetryInterval_count_(v31, v151, 5, 2, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v154, (uint64_t)v153, v155, v156);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v157, 10, 1, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v160, (uint64_t)v159, v161, v162);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v163, 120, 1, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v166, (uint64_t)v165, v167, v168);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v169, 240, 1, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v172, (uint64_t)v171, v173, v174);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v175, 480, -1, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v178, (uint64_t)v177, v179, v180);

  v185 = (void *)objc_msgSend_copy(v6, v181, v182, v183, v184);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v186, (uint64_t)v185, (uint64_t)&unk_1E615EB98, v187);

  objc_msgSend_removeAllObjects(v6, v188, v189, v190, v191);
  objc_msgSend_autoJoinRetryInterval_count_(v512, v192, 0, 1, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v195, (uint64_t)v194, v196, v197);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v198, 5, 2, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v201, (uint64_t)v200, v202, v203);

  objc_msgSend_autoJoinRetryInterval_count_(v511, v204, 10, 12, v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v207, (uint64_t)v206, v208, v209);

  objc_msgSend_autoJoinRetryInterval_count_(v511, v210, 20, -1, v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v213, (uint64_t)v212, v214, v215);

  v220 = (void *)objc_msgSend_copy(v6, v216, v217, v218, v219);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v221, (uint64_t)v220, (uint64_t)&unk_1E615E850, v222);

  objc_msgSend_removeAllObjects(v6, v223, v224, v225, v226);
  objc_msgSend_autoJoinRetryInterval_count_(v513, v227, 120, 1, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v230, (uint64_t)v229, v231, v232);

  objc_msgSend_autoJoinRetryInterval_count_(v513, v233, 240, 1, v234);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v236, (uint64_t)v235, v237, v238);

  objc_msgSend_autoJoinRetryInterval_count_(v513, v239, 480, -1, v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v242, (uint64_t)v241, v243, v244);

  v249 = (void *)objc_msgSend_copy(v6, v245, v246, v247, v248);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v250, (uint64_t)v249, (uint64_t)&unk_1E615E9B8, v251);

  objc_msgSend_removeAllObjects(v6, v252, v253, v254, v255);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v256, 20, 1, v257);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v259, (uint64_t)v258, v260, v261);

  objc_msgSend_autoJoinRetryInterval_count_(v31, v262, 60, 4, v263);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v265, (uint64_t)v264, v266, v267);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v268, 120, 1, v269);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v271, (uint64_t)v270, v272, v273);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v274, 240, 1, v275);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v277, (uint64_t)v276, v278, v279);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v280, 480, -1, v281);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v283, (uint64_t)v282, v284, v285);

  v290 = (void *)objc_msgSend_copy(v6, v286, v287, v288, v289);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v291, (uint64_t)v290, (uint64_t)&unk_1E615EBB0, v292);

  objc_msgSend_removeAllObjects(v6, v293, v294, v295, v296);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v297, 20, 1, v298);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v300, (uint64_t)v299, v301, v302);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v303, 20, 1, v304);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v306, (uint64_t)v305, v307, v308);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v309, 120, 1, v310);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v312, (uint64_t)v311, v313, v314);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v315, 240, 1, v316);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v318, (uint64_t)v317, v319, v320);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v321, 480, -1, v322);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v324, (uint64_t)v323, v325, v326);

  v331 = (void *)objc_msgSend_copy(v6, v327, v328, v329, v330);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v332, (uint64_t)v331, (uint64_t)&unk_1E615EA18, v333);

  objc_msgSend_removeAllObjects(v6, v334, v335, v336, v337);
  do
  {
    objc_msgSend_autoJoinRetryInterval_count_(v63, v338, 0, 2, v339);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v341, (uint64_t)v340, v342, v343);

    objc_msgSend_autoJoinRetryInterval_count_(v71, v344, 0, 2, v345);
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v347, (uint64_t)v346, v348, v349);

    objc_msgSend_autoJoinRetryInterval_count_(v7, v350, 0, 1, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v353, (uint64_t)v352, v354, v355);

    objc_msgSend_autoJoinRetryInterval_count_(v63, v356, 1, 1, v357);
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v359, (uint64_t)v358, v360, v361);

    --v150;
  }
  while (v150);
  v364 = (void *)objc_msgSend_copy(v6, v338, v362, v363, v339);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v365, (uint64_t)v364, (uint64_t)&unk_1E615E9A0, v366);

  objc_msgSend_removeAllObjects(v6, v367, v368, v369, v370);
  objc_msgSend_autoJoinRetryInterval_count_(v7, v371, 360, 1, v372);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v374, (uint64_t)v373, v375, v376);

  objc_msgSend_autoJoinRetryInterval_count_(v7, v377, 900, -1, v378);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v380, (uint64_t)v379, v381, v382);

  v387 = (void *)objc_msgSend_copy(v6, v383, v384, v385, v386);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v388, (uint64_t)v387, (uint64_t)&unk_1E615E898, v389);

  objc_msgSend_removeAllObjects(v6, v390, v391, v392, v393);
  objc_msgSend_autoJoinRetryInterval_count_(v7, v394, 900, -1, v395);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v397, (uint64_t)v396, v398, v399);

  v404 = (void *)objc_msgSend_copy(v6, v400, v401, v402, v403);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v405, (uint64_t)v404, (uint64_t)&unk_1E615EA90, v406);

  objc_msgSend_removeAllObjects(v6, v407, v408, v409, v410);
  objc_msgSend_autoJoinRetryInterval_count_(v89, v411, 0, 1, v412);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v414, (uint64_t)v413, v415, v416);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v417, 5, 2, v418);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v420, (uint64_t)v419, v421, v422);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v423, 10, 2, v424);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v426, (uint64_t)v425, v427, v428);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v429, 20, 16, v430);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v432, (uint64_t)v431, v433, v434);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v435, 120, 1, v436);
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v438, (uint64_t)v437, v439, v440);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v441, 240, 1, v442);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v444, (uint64_t)v443, v445, v446);

  objc_msgSend_autoJoinRetryInterval_count_(v89, v447, 480, -1, v448);
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v450, (uint64_t)v449, v451, v452);

  v457 = (void *)objc_msgSend_copy(v6, v453, v454, v455, v456);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v458, (uint64_t)v457, (uint64_t)&unk_1E615EBC8, v459);

  objc_msgSend_removeAllObjects(v6, v460, v461, v462, v463);
  objc_msgSend_autoJoinRetryInterval_count_(v31, v464, 0, 1, v465);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v467, (uint64_t)v466, v468, v469);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v470, 5, 2, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v473, (uint64_t)v472, v474, v475);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v476, 30, 5, v477);
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v479, (uint64_t)v478, v480, v481);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v482, 60, 5, v483);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v485, (uint64_t)v484, v486, v487);

  objc_msgSend_autoJoinRetryInterval_count_(v27, v488, 480, -1, v489);
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v491, (uint64_t)v490, v492, v493);

  v498 = (void *)objc_msgSend_copy(v6, v494, v495, v496, v497);
  objc_msgSend_setObject_forKeyedSubscript_(self->_retryIntervalMap, v499, (uint64_t)v498, (uint64_t)&unk_1E615EBE0, v500);

  objc_msgSend_removeAllObjects(v6, v501, v502, v503, v504);
  CWFGetOSLog();
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  if (v505)
  {
    CWFGetOSLog();
    v506 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v506 = MEMORY[0x1E0C81028];
    v507 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v506, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_retryIntervalMap, v508, (uint64_t)&unk_1E6131EA0, v509, v510);
}

- (BOOL)__forceNearbyNetworkRetrySchedule
{
  unint64_t v2;

  v2 = self->_retrySchedule - 3;
  return (v2 >= 7 || ((0x67u >> v2) & 1) == 0)
      && self->_lowRSSICandidateFoundTimestamp
      && clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_lowRSSICandidateFoundTimestamp < 0x45D964B800;
}

- (id)__retryIntervalWithScheduleIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t retrySchedule;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSMutableDictionary *retryIntervalMap;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  _DWORD *v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _DWORD v41[2];
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  retrySchedule = self->_retrySchedule;
  if (objc_msgSend___forceNearbyNetworkRetrySchedule(self, a2, a3, v3, v4))
  {
    CWFGetOSLog();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      CWFGetOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v41[0] = 67109376;
      v41[1] = 300;
      v42 = 1024;
      v43 = -90;
      v35 = 14;
      v34 = v41;
      _os_log_send_and_compose_impl();
    }

    retrySchedule = 10;
  }
  retryIntervalMap = self->_retryIntervalMap;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, retrySchedule, v9, v10, v34, v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(retryIntervalMap, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v19;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v22)
  {
    v27 = v22;
    v28 = 0;
    v29 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v20);
        v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (__CFADD__(v28, objc_msgSend_count(v31, v23, v24, v25, v26)))
          v28 = -1;
        else
          v28 += objc_msgSend_count(v31, v23, v24, v25, v26);
        if (v28 > a3)
        {
          v32 = v31;
          goto LABEL_21;
        }
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v36, (uint64_t)v40, 16);
      if (v27)
        continue;
      break;
    }
  }
  v32 = 0;
LABEL_21:

  return v32;
}

- (id)__retryInterval
{
  CWFAutoJoinManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend___retryIntervalWithScheduleIndex_(v2, v3, v2->_retryScheduleIndex, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)__applyRetryIntervalSkew:(unint64_t)a3
{
  double v3;
  unint64_t v4;
  unint64_t v5;
  uint32_t v6;

  v3 = (double)a3 * 0.1;
  v4 = a3 - (unint64_t)v3;
  v5 = (unint64_t)v3 + a3;
  v6 = arc4random();
  return v4
       + (v5 - v4) * (unint64_t)((double)(v6 + ((v6 / 0x7FFFFFFF) | ((v6 / 0x7FFFFFFF) << 31))) / 2147483650.0);
}

- (int64_t)__retryTriggerForRetrySchedule:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9)
    return 4;
  else
    return qword_1B0711808[a3 - 2];
}

- (void)__updateRetrySchedule
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *retryTimer;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _BOOL4 isRetryScheduled;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  void *v62;
  unint64_t retryScheduleIndex;
  OS_dispatch_source *v64;
  dispatch_time_t v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __CFString *v73;
  unint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __CFString *v80;
  unint64_t v81;
  _QWORD handler[5];
  int v83;
  const __CFString *v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  unint64_t v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (!self->_retryTimer)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v6;

    v8 = self->_retryTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1B069AAB8;
    handler[3] = &unk_1E6133138;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
  if (!self->_activeRequest)
  {
    objc_msgSend___retryIntervalWithScheduleIndex_(self, a2, self->_retryScheduleIndex, v2, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    if (v9)
    {
      v15 = objc_msgSend_interval(v9, v10, v11, v12, v13);
      v20 = 1000000000 * objc_msgSend_interval(v14, v16, v17, v18, v19);
      v25 = objc_msgSend_interval(v14, v21, v22, v23, v24);
      if (v15 <= v20)
        v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, 1000000000 * v25, v27, v28);
      else
        v29 = objc_msgSend___applyRetryIntervalSkew_(self, v26, v25, v27, v28);
      if (v29 > 0x7FFFFFFFFFFFFFFELL)
      {
        v49 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v34 = objc_msgSend_interval(v14, v30, v31, v32, v33);
        v39 = 1000000000 * objc_msgSend_interval(v14, v35, v36, v37, v38);
        v44 = objc_msgSend_interval(v14, v40, v41, v42, v43);
        if (v34 <= v39)
          v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, 1000000000 * v44, v46, v47);
        else
          v48 = objc_msgSend___applyRetryIntervalSkew_(self, v45, v44, v46, v47);
        v49 = v48;
      }
      CWFGetOSLog();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        CWFGetOSLog();
        v55 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = MEMORY[0x1E0C81028];
        v56 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isRetryScheduled)
          v61 = CFSTR("Re-scheduling");
        else
          v61 = CFSTR("Scheduling");
        sub_1B0642860(self->_retrySchedule, v57, v58, v59, v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        retryScheduleIndex = self->_retryScheduleIndex;
        v83 = 138544386;
        v84 = v61;
        v85 = 2048;
        v86 = v49 / 0xF4240;
        v87 = 2114;
        v88 = v62;
        v89 = 2048;
        v90 = retryScheduleIndex;
        v91 = 2114;
        v92 = v14;
        _os_log_send_and_compose_impl();

      }
      self->_isRetryScheduled = 1;
      v64 = self->_retryTimer;
      v65 = dispatch_walltime(0, v49);
      v66 = v64;
    }
    else
    {
      isRetryScheduled = self->_isRetryScheduled;
      CWFGetOSLog();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v51;
      if (!isRetryScheduled)
      {
        if (v51)
        {
          CWFGetOSLog();
          v67 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = MEMORY[0x1E0C81028];
          v75 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          sub_1B0642860(self->_retrySchedule, v76, v77, v78, v79);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v81 = self->_retryScheduleIndex;
          v83 = 138543618;
          v84 = v80;
          v85 = 2048;
          v86 = v81;
          _os_log_send_and_compose_impl();

        }
        goto LABEL_33;
      }
      if (v51)
      {
        CWFGetOSLog();
        v53 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = MEMORY[0x1E0C81028];
        v68 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        sub_1B0642860(self->_retrySchedule, v69, v70, v71, v72);
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v74 = self->_retryScheduleIndex;
        v83 = 138543618;
        v84 = v73;
        v85 = 2048;
        v86 = v74;
        _os_log_send_and_compose_impl();

      }
      self->_isRetryScheduled = 0;
      v66 = self->_retryTimer;
      v65 = -1;
    }
    dispatch_source_set_timer(v66, v65, 0xFFFFFFFFFFFFFFFFLL, 0);
LABEL_33:

  }
}

- (BOOL)__calloutToAllowAutoJoinWithTrigger:(int64_t)a3 error:(id *)a4
{
  dispatch_block_t v7;
  __uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *targetQueue;
  qos_class_t v13;
  id v14;
  dispatch_block_t v15;
  void *v16;
  BOOL v17;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  int64_t v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  int v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EA80;
  v31 = sub_1B063EA08;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131DE0);
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v37 = 134219010;
    v38 = v8 / 0x3B9ACA00;
    v39 = 2048;
    v40 = v8 % 0x3B9ACA00 / 0x3E8;
    v41 = 2082;
    v42 = "-[CWFAutoJoinManager __calloutToAllowAutoJoinWithTrigger:error:]";
    v43 = 2082;
    v44 = "CWFAutoJoinManager.m";
    v45 = 1024;
    v46 = 6674;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v13 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069AEFC;
  block[3] = &unk_1E6133F18;
  block[4] = self;
  v21 = &v33;
  v22 = &v27;
  v23 = v25;
  v24 = a3;
  v14 = v7;
  v20 = v14;
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v16 = (void *)v28[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v34 + 24) != 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowKnownNetwork:(id)a3 trigger:(int64_t)a4 allowForSeamlessSSIDTransition:(id)a5 defer:(BOOL *)a6 queue:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_block_t v20;
  __uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v30;
  qos_class_t v31;
  id v32;
  dispatch_block_t v33;
  void *v34;
  BOOL v35;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  _QWORD v43[7];
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  _QWORD *v51;
  int64_t v52;
  _QWORD v53[3];
  int v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  const __CFString *v70;
  int v71;
  unint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v19 = a7;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1B063EA80;
  v59 = sub_1B063EA08;
  v60 = 0;
  if (v19)
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    v20 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131C80);
    v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CWFGetOSLog();
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = MEMORY[0x1E0C81028];
      v30 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v71 = 134219010;
      v72 = v21 / 0x3B9ACA00;
      v73 = 2048;
      v74 = v21 % 0x3B9ACA00 / 0x3E8;
      v75 = 2082;
      v76 = "-[CWFAutoJoinManager __calloutToAllowKnownNetwork:trigger:allowForSeamlessSSIDTransition:defer:queue:error:]";
      v77 = 2082;
      v78 = "CWFAutoJoinManager.m";
      v79 = 1024;
      v80 = 6715;
      _os_log_send_and_compose_impl();
    }

    v31 = qos_class_self();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B069B744;
    block[3] = &unk_1E6133F68;
    block[4] = self;
    v45 = v13;
    v52 = a4;
    v48 = &v65;
    v49 = &v61;
    v50 = &v55;
    v51 = v53;
    v46 = v14;
    v47 = v20;
    v32 = v20;
    v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v31, 0, block);
    dispatch_async(v19, v33);

    dispatch_block_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v53, 8);
  }
  else
  {
    objc_msgSend_allowKnownNetworkHandler(self, v15, v16, v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_allowKnownNetworkHandler(self, v25, v26, v27, v28);
      v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = sub_1B069BAD0;
      v43[3] = &unk_1E6133F90;
      v43[4] = &v65;
      v43[5] = &v61;
      v43[6] = &v55;
      ((void (**)(_QWORD, id, int64_t, id, _QWORD *))v29)[2](v29, v13, a4, v14, v43);

    }
    else
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = CFSTR("CWFAutoJoinManager.allowKnownNetworkHandler() not configured");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v70, (uint64_t)&v69, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, *MEMORY[0x1E0CB2FE0], 6, (uint64_t)v38);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v56[5];
      v56[5] = v40;

    }
  }
  if (a6 && *((_BYTE *)v62 + 24))
    *a6 = 1;
  if (a8)
  {
    v34 = (void *)v56[5];
    if (v34)
      *a8 = objc_retainAutorelease(v34);
  }
  v35 = *((_BYTE *)v66 + 24) != 0;
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v35;
}

- (id)__calloutToScanForNetworksWithParameters:(id)a3 scanChannels:(id *)a4 error:(id *)a5
{
  id v8;
  dispatch_block_t v9;
  __uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *targetQueue;
  qos_class_t v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  int *v30;
  int v31;
  _QWORD block[5];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD *v38;
  _QWORD v39[3];
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  int v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1B063EA80;
  v57 = sub_1B063EA08;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1B063EA80;
  v51 = sub_1B063EA08;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1B063EA80;
  v45 = sub_1B063EA08;
  v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v9 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6132240);
  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v59 = 134219010;
    v60 = v10 / 0x3B9ACA00;
    v61 = 2048;
    v62 = v10 % 0x3B9ACA00 / 0x3E8;
    v63 = 2082;
    v64 = "-[CWFAutoJoinManager __calloutToScanForNetworksWithParameters:scanChannels:error:]";
    v65 = 2082;
    v66 = "CWFAutoJoinManager.m";
    v67 = 1024;
    v68 = 6774;
    v31 = 48;
    v30 = &v59;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v15 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069BECC;
  block[3] = &unk_1E6133FE0;
  block[4] = self;
  v16 = v8;
  v33 = v16;
  v35 = &v53;
  v36 = &v47;
  v37 = &v41;
  v38 = v39;
  v17 = v9;
  v34 = v17;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v23 = (void *)v48[5];
    if (v23)
      *a4 = objc_retainAutorelease(v23);
  }
  if (a5)
  {
    v24 = (void *)v42[5];
    if (v24)
      *a5 = objc_retainAutorelease(v24);
  }
  if (objc_msgSend_count((void *)v54[5], v19, v20, v21, v22, v30, v31))
    objc_msgSend_addObjectsFromArray_(self->_cumulativeScanResults, v25, v54[5], v26, v27);
  v28 = (id)v54[5];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v28;
}

- (id)__calloutToPerformGASQueryWithParameters:(id)a3 GASQueryNetworks:(id *)a4 error:(id *)a5
{
  id v8;
  dispatch_block_t v9;
  __uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *targetQueue;
  qos_class_t v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD v30[3];
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  int v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1B063EA80;
  v48 = sub_1B063EA08;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1B063EA80;
  v42 = sub_1B063EA08;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1B063EA80;
  v36 = sub_1B063EA08;
  v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v9 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6132260);
  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v50 = 134219010;
    v51 = v10 / 0x3B9ACA00;
    v52 = 2048;
    v53 = v10 % 0x3B9ACA00 / 0x3E8;
    v54 = 2082;
    v55 = "-[CWFAutoJoinManager __calloutToPerformGASQueryWithParameters:GASQueryNetworks:error:]";
    v56 = 2082;
    v57 = "CWFAutoJoinManager.m";
    v58 = 1024;
    v59 = 6825;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v15 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069C62C;
  block[3] = &unk_1E6133FE0;
  block[4] = self;
  v16 = v8;
  v24 = v16;
  v26 = &v44;
  v27 = &v38;
  v28 = &v32;
  v29 = v30;
  v17 = v9;
  v25 = v17;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
  dispatch_async(targetQueue, v18);

  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v19 = (void *)v39[5];
    if (v19)
      *a4 = objc_retainAutorelease(v19);
  }
  if (a5)
  {
    v20 = (void *)v33[5];
    if (v20)
      *a5 = objc_retainAutorelease(v20);
  }
  v21 = (id)v45[5];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v21;
}

- (BOOL)__calloutToAllowJoinCandidate:(id)a3 trigger:(int64_t)a4 defer:(BOOL *)a5 error:(id *)a6
{
  id v10;
  dispatch_block_t v11;
  __uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *targetQueue;
  qos_class_t v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  void *v21;
  BOOL v22;
  _QWORD block[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD *v30;
  int64_t v31;
  _QWORD v32[3];
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  int v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B063EA80;
  v38 = sub_1B063EA08;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v11 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131720);
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v48 = 134219010;
    v49 = v12 / 0x3B9ACA00;
    v50 = 2048;
    v51 = v12 % 0x3B9ACA00 / 0x3E8;
    v52 = 2082;
    v53 = "-[CWFAutoJoinManager __calloutToAllowJoinCandidate:trigger:defer:error:]";
    v54 = 2082;
    v55 = "CWFAutoJoinManager.m";
    v56 = 1024;
    v57 = 6872;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v17 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069CD78;
  block[3] = &unk_1E6134008;
  block[4] = self;
  v18 = v10;
  v25 = v18;
  v27 = &v44;
  v28 = &v40;
  v29 = &v34;
  v30 = v32;
  v31 = a4;
  v19 = v11;
  v26 = v19;
  v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v20);

  dispatch_block_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 && *((_BYTE *)v41 + 24))
    *a5 = 1;
  if (a6)
  {
    v21 = (void *)v35[5];
    if (v21)
      *a6 = objc_retainAutorelease(v21);
  }
  v22 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v22;
}

- (BOOL)__calloutToAssociateWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_block_t v7;
  __uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *targetQueue;
  qos_class_t v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  void *v17;
  BOOL v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  int v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EA80;
  v31 = sub_1B063EA08;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6132280);
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v33 = 134219010;
    v34 = v8 / 0x3B9ACA00;
    v35 = 2048;
    v36 = v8 % 0x3B9ACA00 / 0x3E8;
    v37 = 2082;
    v38 = "-[CWFAutoJoinManager __calloutToAssociateWithParameters:error:]";
    v39 = 2082;
    v40 = "CWFAutoJoinManager.m";
    v41 = 1024;
    v42 = 6915;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v13 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069D414;
  block[3] = &unk_1E6134058;
  block[4] = self;
  v14 = v6;
  v21 = v14;
  v23 = &v27;
  v24 = v25;
  v15 = v7;
  v22 = v15;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = objc_retainAutorelease(v17);
    v17 = (void *)v28[5];
  }
  v18 = v17 == 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (int64_t)__calloutToAllowAutoHotspotWithTrigger:(int64_t)a3 error:(id *)a4
{
  dispatch_block_t v7;
  __uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *targetQueue;
  qos_class_t v13;
  id v14;
  dispatch_block_t v15;
  void *v16;
  int64_t v17;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  int64_t v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EA80;
  v31 = sub_1B063EA08;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E61322A0);
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v37 = 134219010;
    v38 = v8 / 0x3B9ACA00;
    v39 = 2048;
    v40 = v8 % 0x3B9ACA00 / 0x3E8;
    v41 = 2082;
    v42 = "-[CWFAutoJoinManager __calloutToAllowAutoHotspotWithTrigger:error:]";
    v43 = 2082;
    v44 = "CWFAutoJoinManager.m";
    v45 = 1024;
    v46 = 6952;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v13 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069DA84;
  block[3] = &unk_1E6133F18;
  block[4] = self;
  v21 = &v33;
  v22 = &v27;
  v23 = v25;
  v24 = a3;
  v14 = v7;
  v20 = v14;
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v15);

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v16 = (void *)v28[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = v34[3];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (BOOL)__calloutToAllowHotspot:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_block_t v7;
  __uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *targetQueue;
  qos_class_t v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  void *v17;
  BOOL v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[3];
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  int v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EA80;
  v32 = sub_1B063EA08;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131680);
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v38 = 134219010;
    v39 = v8 / 0x3B9ACA00;
    v40 = 2048;
    v41 = v8 % 0x3B9ACA00 / 0x3E8;
    v42 = 2082;
    v43 = "-[CWFAutoJoinManager __calloutToAllowHotspot:error:]";
    v44 = 2082;
    v45 = "CWFAutoJoinManager.m";
    v46 = 1024;
    v47 = 6990;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v13 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069E12C;
  block[3] = &unk_1E61340A8;
  block[4] = self;
  v14 = v6;
  v21 = v14;
  v23 = &v34;
  v24 = &v28;
  v25 = v26;
  v15 = v7;
  v22 = v15;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v17 = (void *)v29[5];
    if (v17)
      *a4 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

- (id)__calloutToBrowseForHotspotsWithTimeout:(unint64_t)a3 maxCacheAge:(unint64_t)a4 cacheOnly:(BOOL)a5 error:(id *)a6
{
  dispatch_block_t v11;
  __uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *targetQueue;
  qos_class_t v17;
  id v18;
  dispatch_block_t v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  _QWORD v31[3];
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  int v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1B063EA80;
  v43 = sub_1B063EA08;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1B063EA80;
  v37 = sub_1B063EA08;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v11 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6132560);
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CWFGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v45 = 134219010;
    v46 = v12 / 0x3B9ACA00;
    v47 = 2048;
    v48 = v12 % 0x3B9ACA00 / 0x3E8;
    v49 = 2082;
    v50 = "-[CWFAutoJoinManager __calloutToBrowseForHotspotsWithTimeout:maxCacheAge:cacheOnly:error:]";
    v51 = 2082;
    v52 = "CWFAutoJoinManager.m";
    v53 = 1024;
    v54 = 7028;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v17 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069E7D8;
  block[3] = &unk_1E61340F8;
  v28 = a3;
  v29 = a4;
  v30 = a5;
  block[4] = self;
  v25 = &v39;
  v26 = &v33;
  v27 = v31;
  v18 = v11;
  v24 = v18;
  v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v17, 0, block);
  dispatch_async(targetQueue, v19);

  dispatch_block_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    v20 = (void *)v34[5];
    if (v20)
      *a6 = objc_retainAutorelease(v20);
  }
  v21 = (id)v40[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v21;
}

- (BOOL)__calloutToConnectToHotspot:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_block_t v7;
  __uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *targetQueue;
  qos_class_t v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  void *v17;
  BOOL v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  int v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EA80;
  v31 = sub_1B063EA08;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131740);
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CWFGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v33 = 134219010;
    v34 = v8 / 0x3B9ACA00;
    v35 = 2048;
    v36 = v8 % 0x3B9ACA00 / 0x3E8;
    v37 = 2082;
    v38 = "-[CWFAutoJoinManager __calloutToConnectToHotspot:error:]";
    v39 = 2082;
    v40 = "CWFAutoJoinManager.m";
    v41 = 1024;
    v42 = 7065;
    _os_log_send_and_compose_impl();
  }

  targetQueue = self->_targetQueue;
  v13 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B069EE74;
  block[3] = &unk_1E6134058;
  block[4] = self;
  v14 = v6;
  v21 = v14;
  v23 = &v27;
  v24 = v25;
  v15 = v7;
  v22 = v15;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
  dispatch_async(targetQueue, v16);

  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v17 = (void *)v28[5];
  if (a4 && v17)
  {
    *a4 = objc_retainAutorelease(v17);
    v17 = (void *)v28[5];
  }
  v18 = v17 == 0;

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (id)allowAutoJoinHandler
{
  return objc_getProperty(self, a2, 424, 1);
}

- (void)setAllowAutoJoinHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (id)allowKnownNetworkHandler
{
  return objc_getProperty(self, a2, 432, 1);
}

- (void)setAllowKnownNetworkHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (id)knownNetworkComparator
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setKnownNetworkComparator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (id)scanForNetworksHandler
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setScanForNetworksHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (id)performGASQueryHandler
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setPerformGASQueryHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (id)allowJoinCandidateHandler
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setAllowJoinCandidateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (id)joinCandidateComparator
{
  return objc_getProperty(self, a2, 472, 1);
}

- (void)setJoinCandidateComparator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 472);
}

- (id)associateToNetworkHandler
{
  return objc_getProperty(self, a2, 480, 1);
}

- (void)setAssociateToNetworkHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (id)allowAutoHotspotHandler
{
  return objc_getProperty(self, a2, 488, 1);
}

- (void)setAllowAutoHotspotHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (id)allowHotspotHandler
{
  return objc_getProperty(self, a2, 496, 1);
}

- (void)setAllowHotspotHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (id)browseForHotspotsHandler
{
  return objc_getProperty(self, a2, 504, 1);
}

- (void)setBrowseForHotspotsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 504);
}

- (id)connectToHotspotHandler
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)setConnectToHotspotHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (id)updateKnownNetworkHandler
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setUpdateKnownNetworkHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 528, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 528);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 536, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 536);
}

- (void)setTargetQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSString)colocatedScopeID
{
  return self->_colocatedScopeID;
}

- (void)setColocatedScopeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(BOOL)a3
{
  self->_lockdownModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colocatedScopeID, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_updateKnownNetworkHandler, 0);
  objc_storeStrong(&self->_connectToHotspotHandler, 0);
  objc_storeStrong(&self->_browseForHotspotsHandler, 0);
  objc_storeStrong(&self->_allowHotspotHandler, 0);
  objc_storeStrong(&self->_allowAutoHotspotHandler, 0);
  objc_storeStrong(&self->_associateToNetworkHandler, 0);
  objc_storeStrong(&self->_joinCandidateComparator, 0);
  objc_storeStrong(&self->_allowJoinCandidateHandler, 0);
  objc_storeStrong(&self->_performGASQueryHandler, 0);
  objc_storeStrong(&self->_scanForNetworksHandler, 0);
  objc_storeStrong(&self->_knownNetworkComparator, 0);
  objc_storeStrong(&self->_allowKnownNetworkHandler, 0);
  objc_storeStrong(&self->_allowAutoJoinHandler, 0);
  objc_storeStrong((id *)&self->_cachedCarPlayPreferredChannels, 0);
  objc_storeStrong((id *)&self->_steerToNetwork, 0);
  objc_storeStrong((id *)&self->_steerFromNetwork, 0);
  objc_storeStrong((id *)&self->_deferredKnownNetworks, 0);
  objc_storeStrong((id *)&self->_disallowedKnownNetworks, 0);
  objc_storeStrong((id *)&self->_updatedAllowCacheKnownNetworks, 0);
  objc_storeStrong((id *)&self->_knownNetworkDeferCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkAllowErrorCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkAllowCache, 0);
  objc_storeStrong((id *)&self->_knownNetworkPasspointDomainMap, 0);
  objc_storeStrong((id *)&self->_knownNetworkSSIDMap, 0);
  objc_storeStrong((id *)&self->_cachedKnownNetworksContexts, 0);
  objc_storeStrong((id *)&self->_hiddenNetworkChannels, 0);
  objc_storeStrong((id *)&self->_deferredColocatedJoinCandidateMap, 0);
  objc_storeStrong((id *)&self->_nextRequestTimer, 0);
  objc_storeStrong((id *)&self->_throttleTimestampMap, 0);
  objc_storeStrong((id *)&self->_throttleIntervalMap, 0);
  objc_storeStrong((id *)&self->_triggerTimestampMap, 0);
  objc_storeStrong((id *)&self->_underlyingCancelError, 0);
  objc_storeStrong((id *)&self->_cumulativeScanResults, 0);
  objc_storeStrong((id *)&self->_followup6GHzScanResultsMap, 0);
  objc_storeStrong((id *)&self->_followup6GHzFILSDMap, 0);
  objc_storeStrong((id *)&self->_followup6GHzRNRMap, 0);
  objc_storeStrong((id *)&self->_failedToJoinKnownNetworkIDs, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_cachedMetric, 0);
  objc_storeStrong((id *)&self->_statisticsSubmissionTimer, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_retryIntervalMap, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_associatedNetwork, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_supportedChannels, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end

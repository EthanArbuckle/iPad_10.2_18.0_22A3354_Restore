@implementation CKOperation

- (BOOL)transitionToFinished
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  OS_os_transaction *executingTransaction;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = CKOperationExecutionStateTransitionToFinished(self, &self->_executionState);
  if (v3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v4 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_operationID(self, v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(self, v9, v10, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &stru_1E1F66ED0;
      if (v15)
        v17 = CFSTR(" with error: ");
      else
        v17 = &stru_1E1F66ED0;
      objc_msgSend_error(self, v12, v13, v14);
      v18 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v18;
      if (v18)
        v23 = (const __CFString *)v18;
      else
        v23 = &stru_1E1F66ED0;
      objc_msgSend_error(self, v19, v20, v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend_error(self, v24, v25, v26);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKClientSuitableError(v39, v28, v29, v30);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544130;
      v41 = v8;
      v42 = 2112;
      v43 = v17;
      v44 = 2114;
      v45 = v23;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_INFO, "Operation %{public}@ finished%@%{public}@%@", buf, 0x2Au);
      if (v27)
      {

      }
    }

    sub_18A5FD144(self);
    executingTransaction = self->_executingTransaction;
    self->_executingTransaction = 0;

    objc_msgSend_callbackQueue(self, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v35);

    objc_msgSend_setQueueHasStarted_(self, v36, 1, v37);
  }
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setCanDropItemResultsEarly:(BOOL)a3
{
  self->_canDropItemResultsEarly = a3;
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_operationID(self, a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("operationID=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handleDidStart:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend_callbackQueue(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (self && self->_remoteOperationState <= 1u)
    self->_remoteOperationState = 2;
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (BOOL)usesBackgroundSession
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL result;

  objc_msgSend_configuration(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_automaticallyRetryNetworkFailures(v5, v6, v7, v8);

  objc_msgSend_configuration(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_discretionaryNetworkBehavior(v13, v14, v15, v16);

  if (v17)
    result = 1;
  else
    result = v9;
  self->_usesBackgroundSession = result;
  return result;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int isLongLived;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  char isEqual;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  BOOL result;
  objc_class *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  objc_class *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  const char *v71;

  objc_msgSend_configuration(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (a3)
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ %@ cannot run because it has no CKContainer. Set a container using CKOperationConfiguration."), v44, v48);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  objc_msgSend_configuration(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isLongLived = objc_msgSend_isLongLived(v14, v15, v16, v17);

  if (isLongLived)
  {
    v19 = (void *)MEMORY[0x1E0CB34D0];
    v20 = objc_opt_class();
    objc_msgSend_bundleForClass_(v19, v21, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB34D0];
    v25 = objc_opt_class();
    objc_msgSend_bundleForClass_(v24, v26, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v23, v29, (uint64_t)v28, v30);

    if ((isEqual & 1) == 0)
    {
      if (!a3)
        return 0;
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v52, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Subclasses of CKOperations may not be run as long-lived operations: %@"), v51);
      goto LABEL_11;
    }
    objc_msgSend_resolvedConfiguration(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetDownloadStagingManager(v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v40, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Long-lived operations may not use assetDownloadStagingManager."));
        v41 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a3 = v41;
        return result;
      }
      return 0;
    }
    if (CKCurrentProcessIsDaemon())
    {
      objc_msgSend_configuration(self, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v60, v61, v62, v63);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend_isAppleInternal(v51, v64, v65, v66)
        || (v70 = objc_msgSend_specialContainerType(v51, v67, v68, v69), v70 <= 0x1B) && ((1 << v70) & 0xA201C00) != 0)
      {

        return 1;
      }
      if (!a3)
        goto LABEL_12;
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v71, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("CKOperations from daemons must not be run as long-lived operations (59154510).\nMore information about scheduling in CloudKit can be found internally at https://cloudkit.apple.com/API/CKNative/Guides/Scheduling.html.\nUse xpc_activity_t to schedule your daemon to run at an appropriate time for this CKOperation. Set your xpc_activity_t on -[CKOperationConfiguration xpcActivity]. See the header documentation for CKOperationConfiguration's xpcActivity in CKOperation_Private.h for more details."));
LABEL_11:
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return 0;
    }
  }
  return 1;
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  id v7;

  v3 = a3;
  CKErrorUserInfoClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v5, (uint64_t)v4, (uint64_t)sel_handleOperationDidCompleteWithMetrics_error_, 1, 0);

  CKErrorUserInfoClasses();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v3, v6, (uint64_t)v7, (uint64_t)sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, 2, 0);

}

- (void)main
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char ShouldRun;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int IsDaemon;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  id Property;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  _BOOL4 v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  int isLongLived;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  CKDiscretionaryOptions *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  void *v170;
  CKException *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  id v181;
  _QWORD v182[5];
  uint8_t v183[8];
  id v184;
  _BYTE buf[22];
  __int16 v186;
  void *v187;
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isOutstandingOperation(self, a2, v2, v3)
    && (objc_msgSend_hasCKOperationCallbacksSet(self, v7, v8, v9) & 1) == 0
    && (objc_msgSend_isCancelled(self, v7, v10, v9) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You must set some callbacks on this long-lived operation before running it."));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = [CKException alloc];
    v175 = objc_msgSend_code(v170, v172, v173, v174);
    objc_msgSend_localizedDescription(v170, v176, v177, v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = (id)objc_msgSend_initWithCode_format_(v171, v180, v175, (uint64_t)CFSTR("%@"), v179);

    objc_exception_throw(v181);
  }
  v184 = 0;
  ShouldRun = objc_msgSend_CKOperationShouldRun_(self, v7, (uint64_t)&v184, v9);
  v15 = v184;
  if ((ShouldRun & 1) == 0)
  {
    objc_msgSend_finishWithError_(self, v12, (uint64_t)v15, v14);
    goto LABEL_31;
  }
  objc_msgSend_clientOperationCallbackProxy(self, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activate(v16, v17, v18, v19);

  IsDaemon = CKCurrentProcessIsDaemon();
  if (__sTestOverridesAvailable)
    v24 = IsDaemon;
  else
    v24 = 1;
  if (__sTestOverridesAvailable)
    v25 = 1;
  else
    v25 = IsDaemon;
  if ((v24 & 1) == 0)
    v25 = objc_msgSend_allowCKDiscretionarydUseFromApp(self, v21, v22, v23);
  objc_msgSend_resolvedConfiguration(self, v21, v22, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_discretionarySchedulingForEntireOperation(v26, v27, v28, v29) & v25) != 1
    || self && self->_duetPreClearedMode)
  {

    v36 = objc_msgSend_usesBackgroundSession(self, v33, v34, v35);
LABEL_17:
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v41 = v37;
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      v186 = 2114;
      v187 = v47;
      _os_log_impl(&dword_18A5C5000, v41, OS_LOG_TYPE_INFO, "Operation <%{public}@: %p; %{public}@> enqueuing on container throttle queue",
        buf,
        0x20u);

    }
    objc_msgSend__createPlaceholderOperation(self, v38, v39, v40);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_setProperty_atomic(self, v48, v49, 448);

    objc_msgSend_configuration(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v53, v54, v55, v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      if (self)
      {
        Property = objc_getProperty(self, v57, 448, 1);
        objc_msgSend_addPreparedOperationToBackgroundThrottlingOperationQueue_(v59, v61, (uint64_t)Property, v62);
      }
      else
      {
        objc_msgSend_addPreparedOperationToBackgroundThrottlingOperationQueue_(v59, v57, 0, v58);
      }
    }
    else if (self)
    {
      v63 = objc_getProperty(self, v57, 448, 1);
      objc_msgSend_addPreparedOperationToThrottlingOperationQueue_(v59, v64, (uint64_t)v63, v65);
    }
    else
    {
      objc_msgSend_addPreparedOperationToThrottlingOperationQueue_(v59, v57, 0, v58);
    }

    objc_msgSend_configuration(self, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73 == 0;

    if (v74)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v75, v76, v77);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v169, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 695, CFSTR("No container found to run operation %@"), v168);

    }
    goto LABEL_31;
  }
  objc_msgSend_resolvedConfiguration(self, v30, v31, v32);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend_discretionaryNetworkBehavior(v78, v79, v80, v81);
  if (v85
    || (objc_msgSend_resolvedConfiguration(self, v82, v83, v84),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_automaticallyRetryNetworkFailures(v4, v86, v87, v88)))
  {
    v89 = v85 == 0;
    objc_msgSend_resolvedConfiguration(self, v82, v83, v84);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    isLongLived = objc_msgSend_isLongLived(v90, v91, v92, v93);

    v95 = isLongLived ^ 1;
    if (!v89)
      goto LABEL_38;
  }
  else
  {
    v95 = 0;
  }

LABEL_38:
  v36 = objc_msgSend_usesBackgroundSession(self, v96, v97, v98);
  if (!v95)
    goto LABEL_17;
  if (self)
  {
    self->_scheduledDiscretionaryOperation = 1;
    self->_systemScheduler = 2;
  }
  v99 = _os_activity_create(&dword_18A5C5000, "internal/queue-discretionary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  os_activity_scope_enter(v99, (os_activity_scope_state_t)buf);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v100 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v183 = 0;
    _os_log_debug_impl(&dword_18A5C5000, v100, OS_LOG_TYPE_DEBUG, "Queuing discretionary operation.", v183, 2u);
  }
  v182[0] = MEMORY[0x1E0C809B0];
  v182[1] = 3221225472;
  v182[2] = sub_18A768960;
  v182[3] = &unk_1E1F5F958;
  v182[4] = self;
  sub_18A768A10(self, v182);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v102, v103, v104);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_msgSend_resolvedConfiguration(self, v105, v106, v107);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_alloc_init(CKDiscretionaryOptions);
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v109, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApplicationBundleIdentifierOverride_(v110, v115, (uint64_t)v114, v116);

    objc_msgSend__sourceApplicationSecondaryIdentifier(v109, v117, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSecondarySourceApplicationBundleId_(v110, v121, (uint64_t)v120, v122);

    objc_msgSend_timeoutIntervalForResource(v109, v123, v124, v125);
    if (v129 < 1.0)
      v129 = 604800.0;
    objc_msgSend_setTimeoutIntervalForResource_(v110, v126, v127, v128, v129);
    v133 = objc_msgSend_allowsCellularAccess(v109, v130, v131, v132);
    objc_msgSend_setAllowsCellularAccess_(v110, v134, v133, v135);
    v139 = objc_msgSend_allowsExpensiveNetworkAccess(v109, v136, v137, v138);
    objc_msgSend_setAllowsExpensiveNetworkAccess_(v110, v140, v139, v141);
    v145 = objc_msgSend_discretionaryNetworkBehavior(v109, v142, v143, v144);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v110, v146, v145, v147);
    objc_msgSend_deviceContext(self, v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend_useLiveServer(v151, v152, v153, v154);
    objc_msgSend_setRequiresNetworkAccess_(v110, v156, v155, v157);

  }
  else
  {
    v110 = 0;
  }
  objc_msgSend_clientOperationCallbackProxy(self, v105, v106, v107);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpoint(v158, v159, v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queueOperationID_options_clientOperationCallbackProxyEndpoint_withBlock_(v101, v163, (uint64_t)v108, (uint64_t)v110, v162, &unk_1E1F599D8);

  os_activity_scope_leave((os_activity_scope_state_t)buf);
LABEL_31:

}

- (CKOperationInfo)operationInfo
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;

  v3 = (void *)objc_opt_class();
  v7 = objc_alloc_init((Class)objc_msgSend_operationInfoClass(v3, v4, v5, v6));
  objc_msgSend_fillOutOperationInfo_(self, v8, (uint64_t)v7, v9);
  return (CKOperationInfo *)v7;
}

+ (Class)operationInfoClass
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *Superclass;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  Class v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;

  if ((id)objc_opt_class() == a1)
    goto LABEL_5;
  Superclass = (objc_class *)a1;
  while (1)
  {
    NSStringFromClass(Superclass);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v8, v9, (uint64_t)CFSTR("Info"), v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = NSClassFromString(v11);

    v13 = objc_opt_class();
    if ((objc_msgSend_isSubclassOfClass_(v12, v14, v13, v15) & 1) != 0)
      break;
    Superclass = class_getSuperclass(Superclass);
    if (Superclass == (objc_class *)objc_opt_class())
      goto LABEL_5;
  }
  if (!v12)
  {
LABEL_5:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v19, (uint64_t)a2, (uint64_t)a1, CFSTR("CKOperation.m"), 806, CFSTR("CKOperation subclass lacked an operation info class: %@"), v18);

    v12 = 0;
  }
  return v12;
}

- (int64_t)qualityOfService
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char hasQualityOfService;
  void *v23;
  int v24;
  int64_t v25;
  objc_super v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKOperation;
  v3 = -[CKOperation qualityOfService](&v28, sel_qualityOfService);
  objc_msgSend_configuration(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  hasQualityOfService = objc_msgSend_hasQualityOfService(v7, v16, v17, v18);
  v23 = v7;
  if ((hasQualityOfService & 1) != 0
    || (v24 = objc_msgSend_hasQualityOfService(v15, v19, v20, v21), v23 = v15, v25 = (int64_t)v3, v24))
  {
    v25 = objc_msgSend_qualityOfService(v23, v19, v20, v21);
  }
  if (v25 == -1)
    v25 = objc_msgSend_qualityOfService(v7, v19, v20, v21);
  if ((id)v25 != v3)
  {
    v27.receiver = self;
    v27.super_class = (Class)CKOperation;
    -[CKOperation setQualityOfService:](&v27, sel_setQualityOfService_, v25);
  }

  return v25;
}

- (CKOperationConfiguration)configuration
{
  CKOperation *v2;
  CKOperationConfiguration *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (CKOperationGroup)group
{
  CKOperation *v2;
  CKOperationGroup *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_group;
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  int isLongLived;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t isCancelled;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  const char *v136;
  unint64_t systemScheduler;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  int isEqualToString;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  int v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  const char *v401;
  void *v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  void *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint8_t buf[4];
  void *v422;
  __int16 v423;
  CKOperation *v424;
  __int16 v425;
  void *v426;
  __int16 v427;
  uint64_t v428;
  __int16 v429;
  const __CFString *v430;
  __int16 v431;
  const __CFString *v432;
  uint64_t v433;

  v433 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_callbackQueue(self, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (objc_msgSend_isFinished(self, v10, v11, v12))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v416, v417, v418);
    v419 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v415, v420, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 1635, CFSTR("Operation %@ was already marked as finished"), v419);

  }
  objc_msgSend_setLongLivedOperationWasPersistedBlock_(self, v13, 0, v15);
  objc_msgSend_setRequestCompletedBlock_(self, v16, 0, v17);
  objc_msgSend_error(self, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v24 = (__CFString *)v21;
  if (v5 && !v21)
  {
    objc_msgSend_setError_(self, v22, (uint64_t)v5, v23);
    v24 = (__CFString *)v5;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v25 = (void *)ck_log_facility_op;
  if (os_log_type_enabled((os_log_t)ck_log_facility_op, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v25;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v32, 1, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v38, 0, 1, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v39, v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    *(_DWORD *)buf = 138544642;
    v45 = CFSTR(" with error: ");
    v422 = v31;
    v46 = &stru_1E1F66ED0;
    v423 = 2048;
    if (!v24)
      v45 = &stru_1E1F66ED0;
    v424 = self;
    if (v24)
      v46 = v24;
    v425 = 2114;
    v426 = v37;
    v427 = 2112;
    v428 = v43;
    v429 = 2114;
    v430 = v45;
    v431 = 2114;
    v432 = v46;
    _os_log_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_DEFAULT, "Finished operation <%{public}@: %p; %{public}@, %@> %{public}@%{public}@",
      buf,
      0x3Eu);

  }
  if (self->_xpcActivityEligibilityChangedHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_xpcActivityEligibilityChangedHandler = 0;
  }
  if (v24)
  {
    if (!__sTestOverridesAvailable
      || (objc_msgSend_unitTestOverrides(self, v26, v27, v28),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("doErrorRateMitigationInUnitTests"), v49),
          v50 = (void *)objc_claimAutoreleasedReturnValue(),
          v54 = objc_msgSend_BOOLValue(v50, v51, v52, v53),
          v50,
          v47,
          v54))
    {
      objc_msgSend__performErrorRateMitigation(self, v26, v27, v28);
    }
  }
  objc_msgSend_transitionToFinished(self, v26, v27, v28);
  objc_msgSend_clientOperationCallbackProxy(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v58, v59, v60, v61);

  if ((objc_msgSend_isOutstandingOperation(self, v62, v63, v64) & 1) != 0
    || (objc_msgSend_configuration(self, v65, v66, v67),
        v68 = (void *)objc_claimAutoreleasedReturnValue(),
        isLongLived = objc_msgSend_isLongLived(v68, v69, v70, v71),
        v68,
        isLongLived))
  {
    if (__sTestOverridesAvailable)
      v73 = objc_msgSend_allowResumingCompletedLongLivedOperations(self, v65, v66, v67);
    else
      v73 = 0;
    objc_msgSend_deviceContext(self, v65, v66, v67);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceScopedStateManager(v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registerLongLivedOperationWithIDAsCompleted_allowResumingCompletedLongLivedOperations_(v78, v83, (uint64_t)v82, v73);

  }
  objc_msgSend_operationMetric(self, v65, v66, v67);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metrics(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTime_(v84, v93, (uint64_t)v92, v94);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v95, v24 != 0, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v98, (uint64_t)v97, (uint64_t)CFSTR("finishedWithError"));

  objc_msgSend_CKClientSuitableError(v24, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  CKErrorChainStringFromError(v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v104, (uint64_t)v103, (uint64_t)CFSTR("finishedWithErrorChain"));

  v105 = (void *)MEMORY[0x1E0CB37E8];
  isCancelled = objc_msgSend_isCancelled(self, v106, v107, v108);
  objc_msgSend_numberWithBool_(v105, v110, isCancelled, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v113, (uint64_t)v112, (uint64_t)CFSTR("wasCancelled"));

  v117 = objc_msgSend_qualityOfService(self, v114, v115, v116);
  CKStringForQOS(v117, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v122, (uint64_t)v121, (uint64_t)CFSTR("qualityOfService"));

  v123 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_resolvedConfiguration(self, v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend_isLongLived(v127, v128, v129, v130);
  objc_msgSend_numberWithBool_(v123, v132, v131, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v135, (uint64_t)v134, (uint64_t)CFSTR("isLongLived"));

  systemScheduler = self->_systemScheduler;
  if (systemScheduler > 3)
    objc_msgSend_setObject_forKeyedSubscript_(v84, v136, (uint64_t)CFSTR("xpcActivity"), (uint64_t)CFSTR("systemScheduler"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v84, v136, (uint64_t)off_1E1F64448[systemScheduler], (uint64_t)CFSTR("systemScheduler"));
  v141 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v138, v139, v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend_bytesUploaded(v142, v143, v144, v145);
  objc_msgSend_numberWithUnsignedInteger_(v141, v147, v146, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v150, (uint64_t)v149, (uint64_t)CFSTR("bytesUploaded"));

  v151 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend_bytesDownloaded(v155, v156, v157, v158);
  objc_msgSend_numberWithUnsignedInteger_(v151, v160, v159, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v163, (uint64_t)v162, (uint64_t)CFSTR("bytesDownloaded"));

  v164 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_MMCSMetrics(v88, v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend_bytesUploaded(v168, v169, v170, v171);
  objc_msgSend_numberWithUnsignedInteger_(v164, v173, v172, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v176, (uint64_t)v175, (uint64_t)CFSTR("mmcsBytesUploaded"));

  v177 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_MMCSMetrics(v88, v178, v179, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend_bytesDownloaded(v181, v182, v183, v184);
  objc_msgSend_numberWithUnsignedInteger_(v177, v186, v185, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v189, (uint64_t)v188, (uint64_t)CFSTR("mmcsBytesDownloaded"));

  objc_msgSend_MMCSMetrics(v88, v190, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = objc_msgSend_bytesFulfilledLocally(v193, v194, v195, v196);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v198, v197, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v201, (uint64_t)v200, (uint64_t)CFSTR("bytesFulfilledLocally"));

  v202 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_MMCSMetrics(v88, v203, v204, v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = objc_msgSend_bytesFulfilledByPeers(v206, v207, v208, v209);
  objc_msgSend_numberWithUnsignedLongLong_(v202, v211, v210, v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v214, (uint64_t)v213, (uint64_t)CFSTR("bytesFulfilledByPeers"));

  v215 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_MMCSMetrics(v88, v216, v217, v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend_bytesResumed(v219, v220, v221, v222);
  objc_msgSend_numberWithUnsignedLongLong_(v215, v224, v223 + v197, v225);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v227, (uint64_t)v226, (uint64_t)CFSTR("bytesFulfilled"));

  v228 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v229, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = objc_msgSend_walrusEnabled(v232, v233, v234, v235);
  objc_msgSend_numberWithBool_(v228, v237, v236, v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v240, (uint64_t)v239, (uint64_t)CFSTR("adpEnabled"));

  v241 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v242, v243, v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = objc_msgSend_zoneishKeysRolled(v245, v246, v247, v248);
  objc_msgSend_numberWithUnsignedInteger_(v241, v250, v249, v251);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v253, (uint64_t)v252, (uint64_t)CFSTR("zoneishKeysRolled"));

  v254 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v255, v256, v257);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = objc_msgSend_perRecordKeysRolled(v258, v259, v260, v261);
  objc_msgSend_numberWithUnsignedInteger_(v254, v263, v262, v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v266, (uint64_t)v265, (uint64_t)CFSTR("perRecordKeysRolled"));

  v267 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v268, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = objc_msgSend_zoneKeysRolled(v271, v272, v273, v274);
  objc_msgSend_numberWithUnsignedInteger_(v267, v276, v275, v277);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v279, (uint64_t)v278, (uint64_t)CFSTR("zoneKeysRolled"));

  v280 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v281, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = objc_msgSend_shareKeysRolled(v284, v285, v286, v287);
  objc_msgSend_numberWithUnsignedInteger_(v280, v289, v288, v290);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v292, (uint64_t)v291, (uint64_t)CFSTR("shareKeysRolled"));

  v293 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v294, v295, v296);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v301 = objc_msgSend_keyRollsSkippedBySizeCheck(v297, v298, v299, v300);
  objc_msgSend_numberWithUnsignedInteger_(v293, v302, v301, v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v305, (uint64_t)v304, (uint64_t)CFSTR("keyRollsSkippedBySizeCheck"));

  objc_msgSend_resolvedConfiguration(self, v306, v307, v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v313 = objc_msgSend_requestOriginator(v309, v310, v311, v312);
  objc_msgSend_requestOriginatorStringRepresentation_(CKOperation, v314, v313, v315);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v317, (uint64_t)v316, (uint64_t)CFSTR("requestOriginator"));

  v318 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v319, v320, v321);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v326 = objc_msgSend_zoneKeysRemoved(v322, v323, v324, v325);
  objc_msgSend_numberWithUnsignedInteger_(v318, v327, v326, v328);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v330, (uint64_t)v329, (uint64_t)CFSTR("zoneKeysRemoved"));

  v331 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v332, v333, v334);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = objc_msgSend_zoneishKeysRemoved(v335, v336, v337, v338);
  objc_msgSend_numberWithUnsignedInteger_(v331, v340, v339, v341);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v343, (uint64_t)v342, (uint64_t)CFSTR("zoneishKeysRemoved"));

  v344 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v345, v346, v347);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = objc_msgSend_recordKeysRemoved(v348, v349, v350, v351);
  objc_msgSend_numberWithUnsignedInteger_(v344, v353, v352, v354);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v356, (uint64_t)v355, (uint64_t)CFSTR("recordKeysRemoved"));

  v357 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_cloudKitMetrics(v88, v358, v359, v360);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v365 = objc_msgSend_keysNotRemoved(v361, v362, v363, v364);
  objc_msgSend_numberWithUnsignedInteger_(v357, v366, v365, v367);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v84, v369, (uint64_t)v368, (uint64_t)CFSTR("keysNotRemoved"));

  if (objc_msgSend_code(v24, v370, v371, v372) == 7)
  {
    objc_msgSend_domain(v24, v373, v374, v375);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v376, v377, (uint64_t)CFSTR("CKErrorDomain"), v378);

    if (isEqualToString)
    {
      objc_msgSend_userInfo(v24, v373, v380, v375);
      v381 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v381, v382, *MEMORY[0x1E0CB3388], v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_code(v384, v385, v386, v387) == 2009)
      {
        objc_msgSend_domain(v384, v388, v389, v390);
        v391 = (void *)objc_claimAutoreleasedReturnValue();
        v394 = objc_msgSend_isEqualToString_(v391, v392, (uint64_t)CFSTR("CKInternalErrorDomain"), v393);

        if (v394)
        {
          objc_msgSend_userInfo(v384, v395, v396, v397);
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v398, v399, (uint64_t)CFSTR("ThrottleLabel"), v400);
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          if (v402)
            objc_msgSend_setObject_forKeyedSubscript_(v84, v401, (uint64_t)v402, (uint64_t)CFSTR("throttleLabel"));

        }
      }

    }
  }
  objc_msgSend_associateWithCompletedOperation_(v84, v373, (uint64_t)self, v375);
  objc_msgSend_configuration(self, v403, v404, v405);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v406, v407, v408, v409);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_submitEventMetric_(v410, v411, (uint64_t)v84, v412);

  objc_msgSend_ckSignpostEndWithError_(self, v413, (uint64_t)v24, v414);
}

- (OS_dispatch_queue)callbackQueue
{
  CKOperation *v2;
  const char *v3;
  uint64_t v4;
  OS_dispatch_queue *callbackQueue;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *v16;

  v2 = self;
  objc_sync_enter(v2);
  callbackQueue = v2->_callbackQueue;
  if (!callbackQueue)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("com.apple.cloudkit.operation-%@.callback"), v4, v2->_operationID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v7);
    v8 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UNSPECIFIED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v13 = (const char *)objc_msgSend_UTF8String(v6, v10, v11, v12);
    v14 = dispatch_queue_create(v13, v9);
    v15 = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_callbackQueue, kCKOperationCallbackQueueName, (void *)1, 0);
    callbackQueue = v2->_callbackQueue;
  }
  v16 = callbackQueue;
  objc_sync_exit(v2);

  return v16;
}

- (void)fillOutOperationInfo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
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
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  objc_class *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  char isOutstandingOperation;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
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
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  NSObject *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint8_t buf[4];
  CKOperation *v157;
  __int16 v158;
  void *v159;
  __int16 v160;
  void *v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_resolvedConfiguration(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResolvedConfiguration_(v4, v9, (uint64_t)v8, v10);
  objc_msgSend_group(self, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_setGroup_(v4, v14, (uint64_t)v17, v16);
  }
  else
  {
    objc_msgSend_convenienceOperationGroup(self, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGroup_(v4, v19, (uint64_t)v18, v20);

  }
  objc_msgSend_operationID(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationID_(v4, v25, (uint64_t)v24, v26);

  objc_msgSend_name(self, v27, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v30, v31, 128);

  v35 = objc_msgSend_queuePriority(self, v32, v33, v34);
  objc_msgSend_setClientQueuePriority_(v4, v36, v35, v37);
  if (self)
  {
    objc_msgSend_setDuetPreClearedMode_(v4, v38, self->_duetPreClearedMode, v39);
    objc_msgSend_setDiscretionaryWhenBackgroundedState_(v4, v40, self->_discretionaryWhenBackgroundedState, v41);
    objc_msgSend_setSystemScheduler_(v4, v42, self->_systemScheduler, v43);
    objc_msgSend_setXpcActivityIdentifier_(v4, v44, (uint64_t)self->_xpcActivityIdentifier, v45);
  }
  else
  {
    objc_msgSend_setDuetPreClearedMode_(v4, v38, 0, v39);
    objc_msgSend_setDiscretionaryWhenBackgroundedState_(v4, v144, 0, v145);
    objc_msgSend_setSystemScheduler_(v4, v146, 0, v147);
    objc_msgSend_setXpcActivityIdentifier_(v4, v148, 0, v149);
  }
  v46 = (void *)objc_opt_class();
  v50 = (objc_class *)objc_msgSend_operationClass(v46, v47, v48, v49);
  NSStringFromClass(v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCkOperationClassName_(v4, v52, (uint64_t)v51, v53);

  objc_msgSend_clientOperationCallbackProxy(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpoint(v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCallbackProxyEndpoint_(v4, v62, (uint64_t)v61, v63);

  isOutstandingOperation = objc_msgSend_isOutstandingOperation(self, v64, v65, v66);
  if (v4)
    v4[8] = isOutstandingOperation;
  objc_msgSend_MMCSRequestOptions(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMMCSRequestOptions_(v4, v72, (uint64_t)v71, v73);

  v77 = objc_msgSend_requestOriginator(v8, v74, v75, v76);
  objc_msgSend_setRequestOriginator_(v4, v78, v77, v79);
  objc_msgSend_requestCompletedBlock(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v83)
    v4[11] = 1;
  v151 = v8;
  objc_msgSend_assetDownloadStagingManager(v8, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
    objc_msgSend_setUsesAssetDownloadStagingManager_(v4, v88, 1, v89);
  objc_msgSend_classForObject_(CKObjCClass, v88, (uint64_t)v4, v89);
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v150, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v152, (uint64_t)v162, 16);
  if (v95)
  {
    v99 = v95;
    v100 = *(_QWORD *)v153;
    do
    {
      v101 = 0;
      do
      {
        if (*(_QWORD *)v153 != v100)
          objc_enumerationMutation(v93);
        v102 = *(_QWORD **)(*((_QWORD *)&v152 + 1) + 8 * v101);
        objc_msgSend_type(v102, v96, v97, v98);
        v103 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          v104 = v103[1];

          if (v104 != 15)
            goto LABEL_24;
          sub_18A5DF660(v102, v4);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_configuration(self, v106, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_container(v109, v110, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_containerID(v113, v114, v115, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKAssignToContainerWithID_(v105, v118, (uint64_t)v117, v119);

        }
        else
        {
          v105 = 0;
        }

LABEL_24:
        ++v101;
      }
      while (v99 != v101);
      v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v96, (uint64_t)&v152, (uint64_t)v162, 16);
      v99 = v120;
    }
    while (v120);
  }

  v124 = objc_msgSend_qualityOfService(v4, v121, v122, v123);
  v128 = v151;
  if ((v124 == 33 || v124 == 25) && objc_msgSend_discretionaryNetworkBehavior(v4, v125, v126, v127))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v129 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v130 = v129;
      v134 = objc_msgSend_qualityOfService(v4, v131, v132, v133);
      CKStringForQOS(v134, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend_discretionaryNetworkBehavior(v4, v139, v140, v141);
      CKStringForDiscretionaryNetworkBehavior(v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v157 = self;
      v158 = 2114;
      v159 = v138;
      v160 = 2114;
      v161 = v143;
      _os_log_fault_impl(&dword_18A5C5000, v130, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Operation %@ requesting to use CPU QualityOfService %{public}@ with %{public}@ networking behavior.\n Will override in cloudd with the following behavior:\n   operation.qualityOfService = Utility.\nAll other operation configurations will remain the same.", buf, 0x20u);

      v128 = v151;
    }
  }
  if (__sTestOverridesAvailable)
    objc_msgSend_addTestInfoToOperationInfo_(self, v125, (uint64_t)v4, v127);

}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;

  v5 = a4;
  v6 = a3;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend_initWithCapacity_(v8, v9, 5, v10);
  objc_msgSend_configuration(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_group(self, v16, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_operationID(self, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v24, (uint64_t)CFSTR("operationID"), (uint64_t)v23);

    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v25, 3, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isExecuting(self, v28, v29, v30))
      objc_msgSend_addObject_(v27, v31, (uint64_t)CFSTR("executing"), v33);
    if (objc_msgSend_isFinished(self, v31, v32, v33))
      objc_msgSend_addObject_(v27, v34, (uint64_t)CFSTR("finished"), v36);
    if (objc_msgSend_isCancelled(self, v34, v35, v36))
      objc_msgSend_addObject_(v27, v37, (uint64_t)CFSTR("cancelled"), v39);
    if (objc_msgSend_isLongLived(v15, v37, v38, v39))
      objc_msgSend_addObject_(v27, v40, (uint64_t)CFSTR("long-lived"), v42);
    if (objc_msgSend_isOutstandingOperation(self, v40, v41, v42))
      objc_msgSend_addObject_(v27, v43, (uint64_t)CFSTR("outstanding"), v45);
    if (objc_msgSend_count(v27, v43, v44, v45))
    {
      objc_msgSend_componentsJoinedByString_(v27, v46, (uint64_t)CFSTR("|"), v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v50, (uint64_t)CFSTR("stateFlags"), (uint64_t)v49);

    }
    v51 = objc_msgSend_qualityOfService(self, v46, v47, v48);
    CKStringForQOS(v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v56, (uint64_t)CFSTR("qos"), (uint64_t)v55);

    if (v22)
    {
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v22, v57, 1, v5, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v59, (uint64_t)CFSTR("operationGroup"), (uint64_t)v58);

    }
  }
  if (v5)
  {
    objc_msgSend_metrics(self, v19, v20, v21);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v60, (uint64_t)CFSTR("metrics"), (uint64_t)v63);
    if (__sTestOverridesAvailable)
    {
      objc_msgSend_unitTestOverrides(self, v60, v61, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v64, v65, v66, v67))
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v68, (uint64_t)CFSTR("unitTestOverrides"), (uint64_t)v64);

    }
  }
  objc_msgSend_resolvedConfigurationIfNotNil(self, v19, v20, v21);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v72)
  {
    v73 = v15;
    if (!v15)
      v73 = (void *)objc_opt_new();
    objc_msgSend_defaultConfiguration(v22, v69, v70, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolveAgainstGenericConfiguration_(v73, v75, (uint64_t)v74, v76);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
  }
  objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v72, v69, v6, v5, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v77, v78, v79, v80))
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v81, (uint64_t)CFSTR("resolvedConfig"), (uint64_t)v77);

  return v11;
}

- (BOOL)isExecuting
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD97100);
  LOBYTE(self) = self->_executionState == 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD97100);
  return (char)self;
}

- (CKOperationID)operationID
{
  CKOperation *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_operationID;
  objc_sync_exit(v2);

  return v3;
}

- (id)resolvedConfigurationIfNotNil
{
  CKOperation *v2;
  CKOperationConfiguration *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_resolvedConfiguration;
  objc_sync_exit(v2);

  return v3;
}

+ (Class)operationClass
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = objc_msgSend_superclass(a1, a2, v2, v3);
  if (v5 != objc_opt_class())
  {
    do
    {
      v9 = objc_msgSend_superclass(v4, v6, v7, v8);
      if (v9 == objc_opt_class())
        break;
      v4 = (void *)objc_msgSend_superclass(v4, v10, v11, v12);
      v16 = objc_msgSend_superclass(v4, v13, v14, v15);
    }
    while (v16 != objc_opt_class());
  }
  return (Class)v4;
}

- (BOOL)isOutstandingOperation
{
  return self->_isOutstandingOperation;
}

- (BOOL)isFinished
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD97100);
  LOBYTE(self) = self->_executionState == 2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD97100);
  return (char)self;
}

- (id)requestCompletedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A76786C;
    v16 = sub_18A767894;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A5F304C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_requestCompletedBlock);
  }
  return v8;
}

- (CKOperationMetrics)metrics
{
  return (CKOperationMetrics *)objc_getProperty(self, a2, 360, 1);
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

+ (id)operationDaemonCallbackProtocol
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *Superclass;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  const char *v14;

  if ((id)objc_opt_class() == a1)
  {
LABEL_5:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)a1, CFSTR("CKOperation.m"), 879, CFSTR("Couldn't find Callbacks protocol for class %@"), a1);

    v12 = 0;
  }
  else
  {
    Superclass = (objc_class *)a1;
    while (1)
    {
      NSStringFromClass(Superclass);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v8, v9, (uint64_t)CFSTR("Callbacks"), v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSProtocolFromString(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      Superclass = class_getSuperclass(Superclass);
      if (Superclass == (objc_class *)objc_opt_class())
        goto LABEL_5;
    }
  }
  return v12;
}

- (BOOL)queueHasStarted
{
  return self->_queueHasStarted;
}

- (CKOperationConfiguration)resolvedConfiguration
{
  CKOperation *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKOperationConfiguration *resolvedConfiguration;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  CKOperationConfiguration *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  CKOperationConfiguration *v76;
  CKOperationConfiguration *v77;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  resolvedConfiguration = v2->_resolvedConfiguration;
  if (!resolvedConfiguration)
  {
    objc_msgSend_configuration(v2, v3, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = (void *)objc_opt_new();
    objc_msgSend_group(v2, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolveAgainstGenericConfiguration_(v10, v16, (uint64_t)v15, v17);
    v18 = (CKOperationConfiguration *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_convenienceOperationConfiguration(v2, v19, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend_resolveAgainstGenericConfiguration_(v18, v22, (uint64_t)v25, v24);
      v26 = objc_claimAutoreleasedReturnValue();

      v18 = (CKOperationConfiguration *)v26;
    }
    objc_msgSend_group(v2, v22, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend_convenienceOperationGroup(v2, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGroup_(v2, v32, (uint64_t)v31, v33);
      objc_msgSend_defaultConfiguration(v31, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resolveAgainstGenericConfiguration_(v18, v38, (uint64_t)v37, v39);
      v40 = objc_claimAutoreleasedReturnValue();

      v18 = (CKOperationConfiguration *)v40;
    }
    if (CKMainBundleIsAppleExecutable())
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v41 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_18A5C5000, v41, OS_LOG_TYPE_INFO, "Operation is running within an Apple executable. Setting CKOperationDiscretionaryNetworkBehaviorNonDiscretionary and automaticallyRetryNetworkFailures to false", (uint8_t *)&v83, 2u);
      }
      if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v18, v42, v43, v44) & 1) != 0)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v47 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v51 = objc_msgSend_discretionaryNetworkBehavior(v18, v48, v49, v50);
          v83 = 134217984;
          v84 = v51;
          _os_log_impl(&dword_18A5C5000, v47, OS_LOG_TYPE_INFO, "Operation has existing discretionaryNetworkBehavior value of: %lu", (uint8_t *)&v83, 0xCu);
        }

      }
      else
      {
        objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v45, 0, v46);
      }
      if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v18, v52, v53, v54))
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v68 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v72 = objc_msgSend_automaticallyRetryNetworkFailures(v18, v69, v70, v71);
          v83 = 67109120;
          LODWORD(v84) = v72;
          _os_log_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_INFO, "Operation has existing automaticallyRetryNetworkFailures value of: %d", (uint8_t *)&v83, 8u);
        }

        goto LABEL_41;
      }
      goto LABEL_35;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v55 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      LOWORD(v83) = 0;
      _os_log_impl(&dword_18A5C5000, v55, OS_LOG_TYPE_INFO, "Checking operation QoS for discretionaryNetworkBehavior configuration.", (uint8_t *)&v83, 2u);
    }
    if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v18, v56, v57, v58) & 1) == 0)
    {
      v62 = objc_msgSend_qualityOfService(v18, v59, v60, v61);
      if (v62 > 16)
      {
        v65 = 0;
        if (v62 == 33 || v62 == 25)
          goto LABEL_39;
        goto LABEL_38;
      }
      if (v62 != 9)
      {
LABEL_38:
        v65 = 1;
LABEL_39:
        objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v63, v65, v64);
        goto LABEL_40;
      }
      objc_msgSend_setDiscretionaryNetworkBehavior_(v18, v63, 2, v64);
    }
LABEL_40:
    if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v18, v59, v60, v61) & 1) != 0)
      goto LABEL_41;
    v79 = objc_msgSend_qualityOfService(v18, v73, v74, v75);
    if (v79 != 33 && v79 != 25)
    {
      if (v79 == -1)
      {
        v80 = CKCurrentProcessLinkCheck92e3e8f8ec1a906754afb22d87eb36301b4f6760() ^ 1;
        objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v81, v80, v82);
      }
      else
      {
        objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v66, 1, v67);
      }
      goto LABEL_41;
    }
LABEL_35:
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v18, v66, 0, v67);
LABEL_41:
    v76 = v2->_resolvedConfiguration;
    v2->_resolvedConfiguration = v18;

    resolvedConfiguration = v2->_resolvedConfiguration;
  }
  v77 = resolvedConfiguration;
  objc_sync_exit(v2);

  return v77;
}

- (id)zoneIDsToZoneNamesString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = v3;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, (uint64_t)v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_zoneName(v14, v15, v16, v17, (_QWORD)v39);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend_length(v18, v19, v20, v21);

            if (v22)
            {
              objc_msgSend_zoneName(v14, v15, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v7, v26, (uint64_t)v25, v27);

            }
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v15, (uint64_t)&v39, (uint64_t)v43, 16);
      }
      while (v11);
    }

    objc_msgSend_allObjects(v7, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingSelector_(v31, v32, (uint64_t)sel_localizedCaseInsensitiveCompare_, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_componentsJoinedByString_(v34, v35, (uint64_t)CFSTR(","), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)withContainerScopedDaemon:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_configuration(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A76A184;
  v16[3] = &unk_1E1F643B0;
  v16[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A76A200;
  v14[3] = &unk_1E1F643D8;
  objc_copyWeak(&v15, &location);
  objc_msgSend_getContainerScopedDaemonProxyWithRetryHandler_errorHandler_daemonProxyHandler_(v12, v13, (uint64_t)v16, (uint64_t)v14, v4);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (BOOL)transitionToExecuting
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;
  dispatch_time_t v13;
  CKOperation *v14;
  OS_dispatch_source *timeoutSource;
  NSObject *v16;
  OS_os_transaction *v17;
  OS_os_transaction *executingTransaction;
  _QWORD v20[4];
  id v21[2];
  id location;
  _QWORD handler[4];
  id v24;

  v3 = CKOperationExecutionStateTransitionToExecuting(self, &self->_executionState);
  if (v3)
  {
    if (self)
    {
      CKGetGlobalQueue(17);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);

      objc_initWeak(&location, self);
      objc_msgSend_sharedOptions(CKBehaviorOptions, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = sub_18A60610C((uint64_t)v9);

      v11 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_18A769A98;
      v20[3] = &unk_1E1F64388;
      objc_copyWeak(v21, &location);
      v21[1] = *(id *)&v10;
      v12 = v20;
      handler[0] = v11;
      handler[1] = 3221225472;
      handler[2] = sub_18A76D210;
      handler[3] = &unk_1E1F61CC8;
      v24 = v12;
      dispatch_source_set_event_handler(v5, handler);

      v13 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer(v5, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v14 = self;
      objc_sync_enter(v14);
      timeoutSource = v14->_timeoutSource;
      v14->_timeoutSource = (OS_dispatch_source *)v5;
      v16 = v5;

      objc_sync_exit(v14);
      dispatch_resume(v16);

      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
    v17 = (OS_os_transaction *)os_transaction_create();
    executingTransaction = self->_executingTransaction;
    self->_executingTransaction = v17;

  }
  return v3;
}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  _QWORD aBlock[5];

  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationMetric(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v9, v10, (uint64_t)v5, v11);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A5DA320;
  aBlock[3] = &unk_1E1F5FAA8;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  v16 = v12;
  if (__sTestOverridesAvailable)
  {
    objc_msgSend_invokeOperationWillStartCallback(self, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOperationWillStartCallback_(self, v18, 0, v19);
    objc_msgSend_takeActionOnOperation_proceedBlock_(v17, v20, (uint64_t)self, (uint64_t)v16);

  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

}

- (void)setupBGSystemTaskExpirationHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  void *v52;
  id v53;
  id v54;
  id v55;
  id from;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  CKOperation *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemTask(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_21;
  if (!sub_18A7A2EB4())
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 2021, CFSTR("Trying to set a BGSystemTask on an operation, but BGSystemTaskScheduler doesn't exist"));

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v58 = v17;
    v59 = 2048;
    v60 = self;
    v61 = 2114;
    v62 = v21;
    v63 = 2112;
    v64 = v10;
    _os_log_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_INFO, "Found system task for operation <%{public}@: %p; %{public}@>: %@",
      buf,
      0x2Au);

  }
  if (self)
    self->_systemScheduler = 3;
  v22 = sub_18A7A2EB4();
  objc_msgSend_sharedScheduler(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v10, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_taskRequestForIdentifier_(v26, v31, (uint64_t)v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33
    && ((objc_msgSend_dataBudgeted(v33, v34, v35, v36) & 1) != 0 || objc_msgSend_priority(v33, v34, v35, v36) == 1))
  {
    if (self)
    {
      v37 = 1;
LABEL_17:
      self->_duetPreClearedMode = v37;
    }
  }
  else if (self)
  {
    v37 = 2;
    goto LABEL_17;
  }
  objc_msgSend_expirationHandler(v10, v34, v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  from = 0;
  v49 = MEMORY[0x1E0C809B0];
  v50 = 3221225472;
  v51 = sub_18A76C168;
  v52 = &unk_1E1F64428;
  objc_copyWeak(&v54, (id *)buf);
  objc_copyWeak(&v55, &from);
  v39 = v38;
  v53 = v39;
  objc_msgSend_setExpirationHandler_(v10, v40, (uint64_t)&v49, v41);
  if ((objc_msgSend_eligibleToRun(v10, v42, v43, v44, v49, v50, v51, v52) & 1) == 0)
    objc_msgSend__handleBGSystemTaskExpiration_(self, v45, (uint64_t)v10, v46);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)buf);

LABEL_21:
}

- (void)setRequestCompletedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id requestCompletedBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7678DC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    requestCompletedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_requestCompletedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    requestCompletedBlock = self->_requestCompletedBlock;
    self->_requestCompletedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setQueueHasStarted:(BOOL)a3
{
  self->_queueHasStarted = a3;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (void)setLongLivedOperationWasPersistedBlock:(void *)longLivedOperationWasPersistedBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = longLivedOperationWasPersistedBlock;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7676C8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_longLivedOperationWasPersistedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_longLivedOperationWasPersistedBlock;
    self->_longLivedOperationWasPersistedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)setGroup:(CKOperationGroup *)group
{
  CKOperation *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKOperationGroup *v9;

  v9 = group;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_group, group);
  objc_msgSend_qualityOfService(v5, v6, v7, v8);
  objc_sync_exit(v5);

}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setConvenienceOperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (void)setConvenienceOperationConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (void)setConfiguration:(CKOperationConfiguration *)configuration
{
  CKOperation *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKOperationConfiguration *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKOperationConfiguration *v17;

  v17 = configuration;
  v4 = self;
  objc_sync_enter(v4);
  if (!v17)
    v17 = (CKOperationConfiguration *)objc_opt_new();
  objc_msgSend_unitTestOverrides(v4->_configuration, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v17, v9, v10, v11);
  v13 = v4->_configuration;
  v4->_configuration = (CKOperationConfiguration *)v12;

  if (v8)
    objc_msgSend_addUnitTestOverrides_(v4->_configuration, v14, (uint64_t)v8, v16);
  objc_msgSend_qualityOfService(v4, v14, v15, v16);

  objc_sync_exit(v4);
}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  id *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_18A768E9C;
    v7[3] = &unk_1E1F64340;
    v5 = &v9;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)CKOperation;
    -[CKOperation setCompletionBlock:](&v6, sel_setCompletionBlock_, v7);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A5F308C;
    v11[3] = &unk_1E1F608C8;
    v5 = &v12;
    objc_copyWeak(&v12, &location);
    v10.receiver = self;
    v10.super_class = (Class)CKOperation;
    -[CKOperation setCompletionBlock:](&v10, sel_setCompletionBlock_, v11);
  }
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);

}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v10[5];

  if (__sTestOverridesAvailable)
  {
    objc_msgSend_overlayTestResults(self, a2, v2, v3);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v8, v9, (uint64_t)CFSTR("CKWillPerformOperation"), (uint64_t)self);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A5F30F8;
  v10[3] = &unk_1E1F60BB8;
  v10[4] = self;
  objc_msgSend_withContainerScopedDaemon_(self, a2, (uint64_t)v10, v3);
}

- (CKEventMetric)operationMetric
{
  return self->_operationMetric;
}

- (id)operationGroupName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_group(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKOperation)init
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  CKOperation *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *operationID;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  CKSignpost *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  CKSignpost *signpost;
  CKEventMetric *v40;
  const char *v41;
  uint64_t v42;
  CKEventMetric *v43;
  const char *v44;
  uint64_t v45;
  CKEventMetric *operationMetric;
  CKEventMetric *v47;
  uint64_t v48;
  NSMutableDictionary *lifecycleCallbacks;
  const char *v50;
  uint64_t v51;
  void *v53;
  const char *v54;
  objc_super v55;
  uint8_t buf[16];

  v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v5, v4, v6))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 207, CFSTR("You must use a concrete subclass of CKOperation"));

  }
  v10 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(self, v11, v10, v12))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_FAULT, "You must use a concrete subclass of CKDatabaseOperation. This will be a hard error in the future", buf, 2u);
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)CKOperation;
  v14 = -[CKOperation init](&v55, sel_init);
  if (v14)
  {
    if (__sTestOverridesAvailable
      && (v15 = (void *)objc_opt_class(),
          objc_msgSend_operationIDPrefix(v15, v16, v17, v18),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v19))
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      v21 = (void *)objc_opt_class();
      objc_msgSend_operationIDPrefix(v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CKShortRandomID();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_initWithFormat_(v20, v27, (uint64_t)CFSTR("%@-%@"), v28, v25, v26);
      operationID = v14->_operationID;
      v14->_operationID = (NSString *)v29;

    }
    else
    {
      CKShortRandomID();
      v31 = objc_claimAutoreleasedReturnValue();
      v25 = v14->_operationID;
      v14->_operationID = (NSString *)v31;
    }

    v32 = (void *)objc_opt_new();
    objc_msgSend_setConfiguration_(v14, v33, (uint64_t)v32, v34);

    v35 = [CKSignpost alloc];
    v38 = objc_msgSend_initWithLog_(v35, v36, ck_log_facility_op, v37);
    signpost = v14->_signpost;
    v14->_signpost = (CKSignpost *)v38;

    v40 = [CKEventMetric alloc];
    v43 = (CKEventMetric *)objc_msgSend_initWithEventName_(v40, v41, (uint64_t)CFSTR("CKOperationDuration"), v42);
    objc_msgSend_setIsCKInternalMetric_(v43, v44, 1, v45);
    operationMetric = v14->_operationMetric;
    v14->_operationMetric = v43;
    v47 = v43;

    v14->_duetPreClearedMode = 0;
    v14->_discretionaryWhenBackgroundedState = 0;
    v14->_systemScheduler = 0;
    v48 = objc_opt_new();
    lifecycleCallbacks = v14->_lifecycleCallbacks;
    v14->_lifecycleCallbacks = (NSMutableDictionary *)v48;

    objc_msgSend_setCompletionBlock_(v14, v50, 0, v51);
  }
  return v14;
}

- (void)handleOperationDidCompleteWithMetrics:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_callbackQueue(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v12 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v15 = v12;
    objc_msgSend_operationID(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v19;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_DEBUG, "Received completion callback for operation %{public}@ with metrics %@ error %@", (uint8_t *)&v20, 0x20u);

  }
  objc_msgSend_setMetrics_(self, v13, (uint64_t)v6, v14);
  sub_18A5CA978(self, v7);

}

- (CKLogicalDeviceContext)deviceContext
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKLogicalDeviceContext *)v12;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  NSObject *callbackQueue;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  objc_super v14;

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_activate(callbackQueue);
    objc_msgSend_setQueueHasStarted_(self, v7, 1, v8);
  }
  if (self->_xpcActivityEligibilityChangedHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_xpcActivityEligibilityChangedHandler = 0;
  }
  if (objc_msgSend_isExecuting(self, a2, v2, v3))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 249, CFSTR("Operation was deallocated before it finished"));

  }
  v14.receiver = self;
  v14.super_class = (Class)CKOperation;
  -[CKOperation dealloc](&v14, sel_dealloc);
}

- (CKOperationConfiguration)convenienceOperationConfiguration
{
  return (CKOperationConfiguration *)objc_getProperty(self, a2, 424, 1);
}

- (id)containerID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CKOperationCallbackProxy)clientOperationCallbackProxy
{
  CKOperation *v2;
  CKOperationCallbackProxy *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKOperationCallbackProxy *clientOperationCallbackProxy;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_clientOperationCallbackProxy)
  {
    v3 = [CKOperationCallbackProxy alloc];
    v4 = (void *)objc_opt_class();
    objc_msgSend_operationDaemonCallbackProtocol(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_initWithOperation_callbackProtocol_(v3, v9, (uint64_t)v2, (uint64_t)v8);
    clientOperationCallbackProxy = v2->_clientOperationCallbackProxy;
    v2->_clientOperationCallbackProxy = (CKOperationCallbackProxy *)v10;

  }
  objc_sync_exit(v2);

  return v2->_clientOperationCallbackProxy;
}

- (id)ckShortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (void)applyConvenienceConfiguration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
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
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  id v65;

  v4 = a3;
  objc_msgSend_configuration(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConvenienceOperationConfiguration_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_group(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConvenienceOperationGroup_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_convenienceCallbacks(v4, v17, v18, v19);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_operationWillStartCallback(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend_operationWillStartCallback(v65, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationWillStartCallback_(self, v28, (uint64_t)v27, v29);

    }
    objc_msgSend_operationMeetsDiscretionaryCriteriaCallback(self, v24, v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      objc_msgSend_operationMeetsDiscretionaryCriteriaCallback(v65, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationMeetsDiscretionaryCriteriaCallback_(self, v35, (uint64_t)v34, v36);

    }
    objc_msgSend_daemonOperationWillStartCallback(self, v31, v32, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      objc_msgSend_daemonOperationWillStartCallback(v65, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDaemonOperationWillStartCallback_(self, v42, (uint64_t)v41, v43);

    }
    objc_msgSend_placeholderOperationFinishedCallback(self, v38, v39, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      objc_msgSend_placeholderOperationFinishedCallback(v65, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPlaceholderOperationFinishedCallback_(self, v49, (uint64_t)v48, v50);

    }
    objc_msgSend_daemonChildOperationWillStartCallback(self, v45, v46, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
    {
      objc_msgSend_daemonChildOperationWillStartCallback(v65, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDaemonChildOperationWillStartCallback_(self, v56, (uint64_t)v55, v57);

    }
    objc_msgSend_daemonOperationDidCancelCallback(self, v52, v53, v54);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      objc_msgSend_daemonOperationDidCancelCallback(v65, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDaemonOperationDidCancelCallback_(self, v63, (uint64_t)v62, v64);

    }
  }

}

- (void)_finishDiscretionaryOperation
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self && self->_scheduledDiscretionaryOperation)
  {
    v3 = _os_activity_create(&dword_18A5C5000, "internal/finish-discretionary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v4 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v5, v6, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Finishing discretionary operation %@", buf, 0xCu);

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18A7697EC;
    v21[3] = &unk_1E1F5F958;
    v21[4] = self;
    sub_18A768A10(self, v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishOperationID_(v8, v13, (uint64_t)v12, v14);

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v15 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v16, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_debug_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_DEBUG, "Finished discretionary operation %@", buf, 0xCu);

    }
    os_activity_scope_leave(&state);

  }
}

- (id)_createPlaceholderOperation
{
  CKPlaceholderOperation *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = [CKPlaceholderOperation alloc];
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A5F2E8C;
  v10[3] = &unk_1E1F5FAA8;
  v10[4] = self;
  v5 = sub_18A5FAE88(v3, self, v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = sub_18A76885C;
  v9[3] = &unk_1E1F5FAA8;
  v9[4] = self;
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)v9, v7);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_signpostIntervalState, 0);
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_appliedOverlayProtocol, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_operationMetric, 0);
  objc_storeStrong((id *)&self->_placeholderOperation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_convenienceOperationGroup, 0);
  objc_storeStrong((id *)&self->_convenienceOperationConfiguration, 0);
  objc_storeStrong((id *)&self->_lifecycleCallbacks, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong(&self->_requestCompletedBlock, 0);
  objc_storeStrong(&self->_longLivedOperationWasPersistedBlock, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_resolvedConfiguration, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_clientOperationCallbackProxy, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_executingTransaction, 0);
}

+ (id)requestOriginatorStringRepresentation:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("Unknown");
  else
    return off_1E1F64468[a3 - 1];
}

- (void)setQoSFromSwiftTaskPriority
{
  CKOperation *v2;

  v2 = self;
  sub_18A6AB7D4();

}

- (void)setCallbackQueue:(id)a3
{
  OS_dispatch_queue *v4;
  NSObject *callbackQueue;
  CKOperation *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;
  CKOperation *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  callbackQueue = obj->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_activate(callbackQueue);
    dispatch_queue_set_specific((dispatch_queue_t)obj->_callbackQueue, kCKOperationCallbackQueueName, 0, 0);
    v6 = obj;
    v7 = obj->_callbackQueue;
  }
  else
  {
    v7 = 0;
    v6 = obj;
  }
  v6->_callbackQueue = v4;
  v8 = v4;

  dispatch_queue_set_specific((dispatch_queue_t)obj->_callbackQueue, kCKOperationCallbackQueueName, (void *)1, 0);
  objc_sync_exit(obj);

}

- (void)longLivedOperationWasPersistedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A76786C;
    v16 = sub_18A767894;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A76789C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_longLivedOperationWasPersistedBlock);
  }
  return v8;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "CKOperation/?", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_adoptPersonaIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  void *v17;
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
  void *v29;
  const char *v30;
  uint64_t v31;
  char isEqualToString;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
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
  void *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend_configuration(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_implementation(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaIdentifier(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentPersona(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_userPersonaUniqueString(v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v17, v31);

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentPersona(v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(v40, v41, (uint64_t)v17, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v44 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v45 = v44;
        objc_msgSend_operationID(self, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_configuration(self, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_implementation(v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 138544130;
        v84 = v49;
        v85 = 2112;
        v86 = v17;
        v87 = 2114;
        v88 = v61;
        v89 = 2114;
        v90 = v43;
        _os_log_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_INFO, "Operation %{public}@ adopting persona identifier %@ from the associated container %{public}@. Error: %{public}@", (uint8_t *)&v83, 0x2Au);

      }
      goto LABEL_7;
    }
  }
  else if (objc_msgSend_isDataSeparatedPersona(v25, v26, v27, v28))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v62 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v63 = v62;
      objc_msgSend_configuration(self, v64, v65, v66);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v43, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_implementation(v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(self, v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userPersonaUniqueString(v25, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 138543874;
      v84 = v74;
      v85 = 2114;
      v86 = v78;
      v87 = 2112;
      v88 = v82;
      _os_log_error_impl(&dword_18A5C5000, v63, OS_LOG_TYPE_ERROR, "No effective persona associated with the container %{public}@ for the current operation %{public}@ but adopter is currently on one: %@.", (uint8_t *)&v83, 0x20u);

LABEL_7:
    }
  }

}

- (void)validateXPCActivityCriteria:(id)a3
{
  _BOOL4 v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  objc_class *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  void *v41;
  __int16 v42;
  CKOperation *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = xpc_dictionary_get_BOOL(a3, (const char *)*MEMORY[0x1E0C808C8]);
  objc_msgSend_configuration(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_allowsExpensiveNetworkAccess(v8, v9, v10, v11);

  if (v4)
  {
    if (v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v13 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
      {
        v14 = v13;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v17, 1, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKPropertiesStyleString(v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v23, 0, 1, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKPropertiesStyleString(v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138544130;
        v41 = v16;
        v42 = 2048;
        v43 = self;
        v44 = 2114;
        v45 = v22;
        v46 = 2112;
        v47 = v28;
        v29 = "BUG IN CLIENT OF CLOUDKIT: Operation configuration does not match XPC Activity Criteria. \n"
              " XPC Activity Criteria has disabled allows expensive network access. \n"
              " Operation Criteria has enabled allows expensive network access. \n"
              "<%{public}@: %p; %{public}@, %@>";
LABEL_13:
        _os_log_fault_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v40, 0x2Au);

      }
    }
  }
  else if ((v12 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v30 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v14 = v30;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v32, 1, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKPropertiesStyleString(v18, v33, v34, v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v36, 0, 1, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKPropertiesStyleString(v24, v37, v38, v39);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138544130;
      v41 = v16;
      v42 = 2048;
      v43 = self;
      v44 = 2114;
      v45 = v22;
      v46 = 2112;
      v47 = v28;
      v29 = "BUG IN CLIENT OF CLOUDKIT: Operation configuration does not match XPC Activity Criteria. \n"
            " XPC Activity Criteria has enabled allows expensive network access. \n"
            " Operation Criteria has disabled allows expensive network access. \n"
            "<%{public}@: %p; %{public}@, %@>";
      goto LABEL_13;
    }
  }
}

+ (SEL)daemonInvocationSelector
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  objc_class *v7;
  void *v8;
  const char *v9;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v9, (uint64_t)a2, (uint64_t)a1, CFSTR("CKOperation.m"), 522, CFSTR("daemonInvocationSelector should be overridden by %@"), v8);

  return a2;
}

- (BOOL)hasCKOperationCallbacksSet
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_completionBlock(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)fillFromOperationInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;

  v51 = a3;
  objc_msgSend_resolvedConfiguration(v51, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConfiguration_(self, v8, (uint64_t)v7, v9);

  objc_msgSend_group(v51, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroup_(self, v14, (uint64_t)v13, v15);

  objc_msgSend_operationID(v51, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationID_(self, v20, (uint64_t)v19, v21);

  if (v51)
    v22 = (void *)v51[16];
  else
    v22 = 0;
  v23 = v22;
  objc_msgSend_setName_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_setIsOutstandingOperation_(self, v26, 1, v27);
  v31 = objc_msgSend_clientQueuePriority(v51, v28, v29, v30);
  objc_msgSend_setQueuePriority_(self, v32, v31, v33);
  v37 = objc_msgSend_duetPreClearedMode(v51, v34, v35, v36);
  if (self)
  {
    self->_duetPreClearedMode = v37;
    self->_discretionaryWhenBackgroundedState = objc_msgSend_discretionaryWhenBackgroundedState(v51, v38, v39, v40);
    self->_systemScheduler = objc_msgSend_systemScheduler(v51, v41, v42, v43);
  }
  else
  {
    objc_msgSend_discretionaryWhenBackgroundedState(v51, v38, v39, v40);
    objc_msgSend_systemScheduler(v51, v48, v49, v50);
  }
  objc_msgSend_xpcActivityIdentifier(v51, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A7684AC((uint64_t)self, v47);

}

+ (SEL)daemonCallbackCompletionSelector
{
  return sel_handleOperationDidCompleteWithMetrics_error_;
}

- (void)cancelWithUnderlyingError:(id)a3
{
  objc_msgSend_cancelWithUnderlyingError_message_(self, a2, (uint64_t)a3, 0);
}

- (void)cancelWithUnderlyingError:(id)a3 message:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_operationID(self, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Operation %@ was cancelled with an error"), v13, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(CKPrettyError, v6, (uint64_t)CFSTR("CKErrorDomain"), 20, 0, v17, 0, 0, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelWithError_(self, v15, (uint64_t)v14, v16);

}

- (void)cancelWithError:(id)a3
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  CKOperation *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  _QWORD block[5];
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v11 = v7;
    objc_msgSend_operationID(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_INFO, "Warn: Cancelling operation %{public}@ with error %@", buf, 0x16u);

  }
  if (!v6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 903, CFSTR("Cancel error must not be nil."));

  }
  v16 = v6;
  if (self)
  {
    v17 = self;
    objc_sync_enter(v17);
    objc_storeStrong((id *)&v17->_cancelError, a3);
    objc_sync_exit(v17);

  }
  v25.receiver = self;
  v25.super_class = (Class)CKOperation;
  -[CKOperation cancel](&v25, sel_cancel);
  objc_msgSend_callbackQueue(self, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A769410;
  block[3] = &unk_1E1F5FAA8;
  block[4] = self;
  dispatch_async(v21, block);

}

- (void)_cancelDaemonOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend_configuration(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A769590;
  v11[3] = &unk_1E1F5F958;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A7696DC;
  v10[3] = &unk_1E1F60BB8;
  sub_18A6E03D4(v9, v11, v10);

}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  sub_18A5E3B10(self);
  v3 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v3, &state);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_operationID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_INFO, "Adopter cancelled operation %@", buf, 0xCu);

  }
  objc_msgSend_operationID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v13, (uint64_t)CFSTR("CKErrorDomain"), 20, 0, CFSTR("Operation %@ was cancelled"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelWithError_(self, v15, (uint64_t)v14, v16);

  os_activity_scope_leave(&state);
}

- (void)setIsFinished:(BOOL)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 1026, CFSTR("Operations cannot be set to not finished"));

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v10 = v6;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v11;
    v18 = 2112;
    v19 = v13;
    _os_log_fault_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_FAULT, "Shenanigans! Should not call %@ on %@. Call -transitionToFinished instead.", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend_transitionToFinished(self, v7, v8, v9);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKOperation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)configureConvenience:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int hasQualityOfService;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
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
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
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
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  char hasDiscretionaryNetworkBehavior;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  char hasAutomaticallyRetryNetworkFailures;
  const char *v125;
  uint64_t v126;
  id v127;

  v127 = a3;
  objc_msgSend_setQueuePriority_(self, v4, -4, v5);
  if (!CKCurrentProcessLinkChecke0fc00bd437646efa0e6635c2beaaea9())
  {
    objc_msgSend_setQualityOfService_(self, v6, 17, v8);
    goto LABEL_9;
  }
  objc_msgSend_configuration(v127, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  hasQualityOfService = objc_msgSend_hasQualityOfService(v9, v10, v11, v12);

  if (hasQualityOfService)
  {
    objc_msgSend_configuration(v127, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_qualityOfService(v17, v18, v19, v20);
    objc_msgSend_setQualityOfService_(self, v22, v21, v23);
LABEL_7:

    goto LABEL_9;
  }
  objc_msgSend_group(v127, v14, v15, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_hasQualityOfService(v31, v32, v33, v34);

  if (v35)
  {
    objc_msgSend_group(v127, v36, v37, v38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v17, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_qualityOfService(v42, v43, v44, v45);
    objc_msgSend_setQualityOfService_(self, v47, v46, v48);

    goto LABEL_7;
  }
  objc_msgSend_setQoSFromSwiftTaskPriority(self, v36, v37, v38);
LABEL_9:
  objc_msgSend_configuration(self, v24, v25, v26);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v49, v50, v51, v52) & 1) == 0)
  {
    objc_msgSend_group(self, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v60, v61, v62, v63) & 1) == 0)
    {
      if (v127)
      {
        objc_msgSend_configuration(v127, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v67, v68, v69, v70) & 1) != 0)
        {

          goto LABEL_14;
        }
        objc_msgSend_group(v127, v71, v72, v73);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_defaultConfiguration(v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        hasDiscretionaryNetworkBehavior = objc_msgSend_hasDiscretionaryNetworkBehavior(v81, v82, v83, v84);

        if ((hasDiscretionaryNetworkBehavior & 1) != 0)
          goto LABEL_19;
      }
      else
      {

      }
      objc_msgSend_configuration(self, v74, v75, v76);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDiscretionaryNetworkBehavior_(v49, v86, 0, v87);
      goto LABEL_18;
    }
LABEL_14:

  }
LABEL_18:

LABEL_19:
  objc_msgSend_configuration(self, v74, v75, v76);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v88, v89, v90, v91) & 1) != 0)
  {
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend_group(self, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v99, v100, v101, v102) & 1) != 0)
  {
LABEL_24:

    goto LABEL_28;
  }
  if (!v127)
  {

    goto LABEL_27;
  }
  objc_msgSend_configuration(v127, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v106, v107, v108, v109) & 1) != 0)
  {

    goto LABEL_24;
  }
  objc_msgSend_group(v127, v110, v111, v112);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v116, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  hasAutomaticallyRetryNetworkFailures = objc_msgSend_hasAutomaticallyRetryNetworkFailures(v120, v121, v122, v123);

  if ((hasAutomaticallyRetryNetworkFailures & 1) == 0)
  {
LABEL_27:
    objc_msgSend_configuration(self, v113, v114, v115);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v88, v125, 0, v126);
    goto LABEL_28;
  }
LABEL_29:

}

+ (void)setOperationIDPrefix:(id)a3
{
  id v4;
  void *v5;
  id obj;

  v4 = a3;
  obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)qword_1EDF75378;
  qword_1EDF75378 = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (NSString)operationIDPrefix
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)qword_1EDF75378;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)handleWillStart:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend_callbackQueue(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (self && !self->_remoteOperationState)
    self->_remoteOperationState = 1;
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)handleLongLivedOperationDidPersist
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void);

  objc_msgSend_callbackQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_longLivedOperationWasPersistedBlock(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_longLivedOperationWasPersistedBlock(self, v10, v11, v12);
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();

  }
}

- (void)handleSystemDidImposeInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend_callbackQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_group(self, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSystemImposedInfo_(v14, v12, (uint64_t)v4, v13);

}

- (void)handleRequestDidComplete:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;

  v16 = a3;
  objc_msgSend_callbackQueue(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_requestCompletedBlock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_requestCompletedBlock(self, v12, v13, v14);
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v15)[2](v15, v16);

  }
}

- (void)openFileWithOpenInfo:(id)a3 reply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  objc_msgSend_assetDownloadStagingInfo(v27, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_resolvedConfiguration(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetDownloadStagingManager(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetDownloadStagingManager_(v27, v19, (uint64_t)v18, v20);

  }
  objc_msgSend_deviceContext(self, v11, v12, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedStateManager(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openFileWithOpenInfo_reply_(v25, v26, (uint64_t)v27, (uint64_t)v6);

}

- (void)handleFinishWithAssetDownloadStagingInfo:(id)a3 reply:(id)a4
{
  void (**v6)(id, id, id, id);
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  id v26;
  id v27;
  id v28;

  v6 = (void (**)(id, id, id, id))a4;
  v7 = a3;
  objc_msgSend_callbackQueue(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend_resolvedConfiguration(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetDownloadStagingManager(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0;
  v26 = 0;
  v21 = objc_msgSend_finishWithAssetDownloadStagingInfo_fileURL_fileHandle_error_(v19, v20, (uint64_t)v7, (uint64_t)&v28, &v27, &v26);

  v22 = v28;
  v23 = v27;
  v24 = v26;

  if ((v21 & 1) == 0)
  {

    if (!v24)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v25, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Unknown error invoking finishWithAssetDownloadStagingInfo."));
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
    v23 = 0;
  }
  v6[2](v6, v22, v23, v24);

}

- (void)handleDiscretionaryOperationShouldStart:(BOOL)a3 nonDiscretionary:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  objc_class *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  id Property;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint8_t buf[4];
  id v107;
  __int16 v108;
  CKOperation *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v5 = a4;
  v6 = a3;
  v112 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend_callbackQueue(self, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (self)
  {
    if (self->_startedDiscretionaryOperation)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v9;
        _os_log_debug_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_DEBUG, "Ignoring duplicate call to start with error %@", buf, 0xCu);
      }
      goto LABEL_52;
    }
    self->_startedDiscretionaryOperation = 1;
  }
  if (__sTestOverridesAvailable)
  {
    v18 = (id)objc_msgSend_invokeOperationMeetsDiscretionaryCriteriaCallback(self, v14, v15, v16);
    objc_msgSend_setOperationMeetsDiscretionaryCriteriaCallback_(self, v19, 0, v20);
  }
  v24 = v9;
  if (__sTestOverridesAvailable && objc_msgSend_forceCKDiscretionarydFailure(self, v21, v22, v23))
  {

    v24 = 0;
    objc_msgSend_domain(0, v25, v26, v27);
  }
  else
  {
    if (v6)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v28 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v95 = v28;
        objc_msgSend_operationID(self, v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v107 = v99;
        _os_log_debug_impl(&dword_18A5C5000, v95, OS_LOG_TYPE_DEBUG, "Discretionary operation %@ started", buf, 0xCu);

      }
      objc_msgSend_operationMetric(self, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v33, v5, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v32, v36, (uint64_t)v35, (uint64_t)CFSTR("ckdiscretionaryd_nonDiscretionary"));

      objc_msgSend_date(MEMORY[0x1E0C99D68], v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v32, v41, (uint64_t)v40, (uint64_t)CFSTR("ckdiscretionaryd_startTime"));

      if (self)
      {
        v42 = 2;
        if (v5)
          v42 = 3;
        *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CKOperation__operationID[v42]) = (Class)1;
      }

      goto LABEL_41;
    }
    objc_msgSend_domain(v24, v21, v22, v23);
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v46, v47, *MEMORY[0x1E0CB28A8], v48))
  {
    v52 = objc_msgSend_code(v24, v49, v50, v51);

    if (v52 == 4099)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v56 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v107 = v24;
        _os_log_impl(&dword_18A5C5000, v56, OS_LOG_TYPE_INFO, "ckdiscretionaryd failed to schedule with error %@, falling back to per-task scheduling.", buf, 0xCu);
      }
      if (self)
        self->_systemScheduler = 0;
      goto LABEL_41;
    }
  }
  else
  {

  }
  if (!v24)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v53, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Error scheduling discretionary task."));
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_CKClientSuitableError(v24, v53, v54, v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v58 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v107 = v57;
    _os_log_error_impl(&dword_18A5C5000, v58, OS_LOG_TYPE_ERROR, "ckdiscretionaryd failed to schedule with error %@.", buf, 0xCu);
    if (!self)
      goto LABEL_40;
    goto LABEL_39;
  }
  if (self)
LABEL_39:
    self->_failedToScheduleDiscretionaryOperation = 1;
LABEL_40:
  objc_msgSend_finishWithError_(self, v59, (uint64_t)v57, v60);

LABEL_41:
  objc_msgSend_configuration(self, v43, v44, v45);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v65)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v66, v67, v68);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(self, v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v100, v105, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperation.m"), 1364, CFSTR("No container found to run operation %@"), v104);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v69 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v73 = v69;
    v74 = (objc_class *)objc_opt_class();
    NSStringFromClass(v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v107 = v75;
    v108 = 2048;
    v109 = self;
    v110 = 2114;
    v111 = v79;
    _os_log_impl(&dword_18A5C5000, v73, OS_LOG_TYPE_INFO, "Operation <%{public}@: %p; %{public}@> enqueuing on container throttle queue",
      buf,
      0x20u);

  }
  objc_msgSend__createPlaceholderOperation(self, v70, v71, v72);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_atomic(self, v80, v81, 448);

  objc_msgSend_configuration(self, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v85, v86, v87, v88);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    Property = objc_getProperty(self, v89, 448, 1);
    objc_msgSend_addPreparedOperationToDiscretionaryThrottlingOperationQueue_(v91, v93, (uint64_t)Property, v94);
  }
  else
  {
    objc_msgSend_addPreparedOperationToDiscretionaryThrottlingOperationQueue_(v91, v89, 0, v90);
  }

LABEL_52:
}

- (void)handleDiscretionaryOperationShouldSuspend
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  objc_msgSend_callbackQueue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self)
    self->_isDiscretionarySuspended = 1;
  objc_msgSend__cancelDaemonOperation(self, v6, v7, v8);
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, (uint64_t)CFSTR("CKErrorDomain"), 4, CFSTR("System conditions no longer appropriate."));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_18A5CA978(self, v10);

}

- (void)handleDaemonOperationWillStartWithClassName:(id)a3 isTopLevelDaemonOperation:(BOOL)a4 replyBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  void (**v11)(id, void *, _QWORD);
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  CKOperation *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = (void (**)(id, void *, _QWORD))a5;
  if (__sTestOverridesAvailable)
  {
    if (v6)
      objc_msgSend_invokeDaemonOperationWillStartCallback_(self, v9, (uint64_t)v8, v10);
    else
      objc_msgSend_invokeDaemonChildOperationWillStartCallback_(self, v9, (uint64_t)v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14, 0);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v15 = v12;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v17;
      v24 = 2048;
      v25 = self;
      v26 = 2114;
      v27 = v21;
      v28 = 2112;
      v29 = v8;
      _os_log_error_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon operation while not testing: %@",
        (uint8_t *)&v22,
        0x2Au);

    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v13, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Did not expect to be asked about a daemon operation while not testing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v14);
  }

}

- (void)handleDaemonRequestWillSendWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CKOperation *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (__sTestOverridesAvailable)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18A76B2B4;
    v23[3] = &unk_1E1F64400;
    v24 = v10;
    objc_msgSend_handleURLRequestWillSendCallback_testRequestProperties_proceedBlock_(self, v12, (uint64_t)v8, (uint64_t)v9, v23);
    v13 = v24;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v18;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v22;
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon request while not testing: %@",
        buf,
        0x2Au);

    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Did not expect to be asked about a daemon url request while not testing"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v13);
  }

}

- (void)handleDaemonRequestWillReceiveWithClassName:(id)a3 testRequestProperties:(id)a4 replyBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CKOperation *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (__sTestOverridesAvailable)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18A76B4DC;
    v23[3] = &unk_1E1F64400;
    v24 = v10;
    objc_msgSend_handleURLRequestWillReceiveCallback_testRequestProperties_proceedBlock_(self, v12, (uint64_t)v8, (uint64_t)v9, v23);
    v13 = v24;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v18;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = v22;
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_ERROR, "Operation <%{public}@: %p; %{public}@> unexpectedly asked about a daemon request while not testing: %@",
        buf,
        0x2Au);

    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKInternalErrorDomain"), 1000, CFSTR("Did not expect to be asked about a daemon url request while not testing"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v13);
  }

}

- (void)_handleRemoteProxyFailureWithError:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v11 = v5;
    objc_msgSend_operationID(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v4;
    _os_log_error_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_ERROR, "Got a connection error for operation %{public}@: %@", buf, 0x16u);

  }
  objc_msgSend_callbackQueue(self, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A76B660;
  v16[3] = &unk_1E1F61A48;
  v16[4] = self;
  v17 = v4;
  v10 = v4;
  dispatch_async(v9, v16);

}

- (void)finishWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_callbackQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A76B78C;
  v10[3] = &unk_1E1F61A48;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)_performErrorRateMitigation
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  double v17;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  id v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&stru_1ECD969FC);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v3, v4, v5);
  *(double *)&v7 = v6;
  if ((byte_1ECD969F8 & 1) != 0)
  {
    v8 = v6 - *(double *)&qword_1ECD96A10;
    qword_1ECD96A10 = *(_QWORD *)&v6;
    if (v8 >= 20.0)
    {
      byte_1ECD969F8 = 0;
      *(_OWORD *)&qword_1ECD96A00 = 0u;
      *(_OWORD *)&qword_1ECD96A20 = 0u;
      *(_OWORD *)&qword_1ECD96A10 = 0u;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v20 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_INFO, "Error rate mitigation deactivated. CloudKit will no longer slow failing operations.", buf, 2u);
      }
    }
    else
    {
      v9 = v8 - *(double *)&qword_1ECD96A28;
      v10 = (v8 - *(double *)&qword_1ECD96A28) * 0.1 + *(double *)&qword_1ECD96A20 * 0.9;
      v11 = 10.0 - v10;
      if (10.0 - v10 <= 10.0)
        v12 = 10.0 - v10;
      else
        v12 = 10.0;
      *(double *)&qword_1ECD96A20 = (v8 - *(double *)&qword_1ECD96A28) * 0.1 + *(double *)&qword_1ECD96A20 * 0.9;
      qword_1ECD96A28 = *(_QWORD *)&v12;
      if (*(double *)&v7 - *(double *)&qword_1ECD96A00 < 60.0)
        *(double *)&qword_1ECD96A28 = v12
                                    * ((erf((*(double *)&v7 - *(double *)&qword_1ECD96A00) / 60.0 * 4.0 + -2.0) + 1.0)
                                     * 0.5);
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v13 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        v66 = *(_QWORD *)&v11;
        v67 = 2048;
        v68 = qword_1ECD96A28;
        v69 = 2048;
        v70 = v8;
        v71 = 2048;
        v72 = v9;
        v73 = 2048;
        v74 = qword_1ECD96A20;
        v14 = "mitigation: rawDelay = %f, delay = %f, errorGap = %f, errorTime = %f, errorInterval = %f";
        v15 = v13;
        v16 = 52;
LABEL_32:
        _os_log_debug_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
      }
    }
  }
  else
  {
    v17 = v6 - *(double *)&qword_1ECD96A08;
    if (*(double *)&v7 - *(double *)&qword_1ECD96A08 <= 10.0)
    {
      if ((unint64_t)++qword_1ECD96A18 >= 6)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v21 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v66 = qword_1ECD96A18;
          v67 = 2048;
          v68 = 10;
          v14 = "Approaching error rate limiting trigger: count = %llu, trigger = %llu";
          v15 = v21;
          v16 = 22;
          goto LABEL_32;
        }
      }
    }
    else if (v17 < 20.0 && (unint64_t)qword_1ECD96A18 >= 0xB)
    {
      byte_1ECD969F8 = 1;
      *(double *)&qword_1ECD96A20 = v17 / (double)(unint64_t)qword_1ECD96A18;
      qword_1ECD96A08 = v7;
      qword_1ECD96A10 = v7;
      qword_1ECD96A00 = v7;
      qword_1ECD96A18 = 1;
      qword_1ECD96A28 = 0;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_ERROR, "Error rate mitigation activated due to high rate of failing operations. CloudKit will slow failing operations.", buf, 2u);
      }
    }
    else
    {
      if ((unint64_t)qword_1ECD96A18 >= 6)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v19 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_DEBUG, "Error rate limiting trigger not reached. Resetting error count.", buf, 2u);
        }
      }
      qword_1ECD96A18 = 1;
      qword_1ECD96A08 = v7;
    }
  }
  os_unfair_lock_unlock(&stru_1ECD969FC);
  if (*(double *)&qword_1ECD96A28 > 0.0)
  {
    CKDescriptionForTimeInterval(*(double *)&qword_1ECD96A28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v24 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v66 = (uint64_t)v23;
      v67 = 2114;
      v68 = (uint64_t)self;
      _os_log_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_INFO, "CloudKit is applying an error rate mitigation delay of %{public}@ to operation %{public}@.", buf, 0x16u);
    }
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E0CB3978], v25, v26, v27, *(double *)&qword_1ECD96A28);
    objc_msgSend_error(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_domain(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_code(v31, v36, v37, v38);
    objc_msgSend_userInfo(v31, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend_mutableCopy(v43, v44, v45, v46);

    if (!v47)
    {
      v50 = objc_alloc(MEMORY[0x1E0C99E08]);
      v47 = (void *)objc_msgSend_initWithCapacity_(v50, v51, 1, v52);
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v48, (uint64_t)CFSTR("This operation was delayed by %@ due to high rate of operation errors."), v49, v23);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v47, v54, (uint64_t)v53, (uint64_t)CFSTR("CKErrorMitigationMessageKey"));
    if (byte_1EDF75458)
    {
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v55, v56, v57, *(double *)&qword_1ECD96A28);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v47, v59, (uint64_t)v58, (uint64_t)CFSTR("CKErrorMitigationDelaySeconds"));

    }
    v60 = objc_alloc((Class)objc_opt_class());
    v62 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v60, v61, (uint64_t)v35, v39, v47);
    objc_msgSend_setError_(self, v63, (uint64_t)v62, v64);

  }
}

- (void)setQualityOfService:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_configuration(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQualityOfService_(v6, v7, a3, v8);

  objc_msgSend_qualityOfService(self, v9, v10, v11);
}

- (void)setOperationID:(id)a3
{
  CKOperation *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *operationID;
  NSString *v10;

  v10 = (NSString *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_operationID != v10)
  {
    v8 = objc_msgSend_copy(v10, v5, v6, v7);
    operationID = v4->_operationID;
    v4->_operationID = (NSString *)v8;

  }
  objc_sync_exit(v4);

}

- (id)unitTestOverrides
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;

  objc_msgSend_resolvedConfigurationIfNotNil(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    objc_msgSend_unitTestOverrides(v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_group(self, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unitTestOverrides(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_mutableCopy(v19, v20, v21, v22);
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = (id)objc_opt_new();
    v10 = v25;

    objc_msgSend_configuration(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unitTestOverrides(v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v10, v34, (uint64_t)v33, v35);

  }
  return v10;
}

- (void)addUnitTestOverrides:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_configuration(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addUnitTestOverrides_(v10, v8, (uint64_t)v4, v9);

}

- (BOOL)_BOOLForUnitTestOverride:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  objc_msgSend_unitTestOverrides(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    a4 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  return a4;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_operationInfo(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_configuration(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_primaryIdentifier(v17, v18, v19, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_handleBGSystemTaskExpiration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  sub_18A5E3B10(self);
  v5 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v5, &state);

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_operationID(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v10;
    _os_log_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_INFO, "System task expired for operation %{public}@", buf, 0xCu);

  }
  if ((objc_msgSend_isCancelled(self, v11, v12, v13) & 1) == 0
    && objc_msgSend_isExecuting(self, v14, v15, v16))
  {
    objc_msgSend_operationMetric(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v20, v21, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("systemTask_expired"));

    objc_msgSend_identifier(v4, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKErrorDomain"), 132, CFSTR("System task was deferred (%@)"), v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = (id)ck_log_facility_op;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_operationID(self, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v4, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v32;
      v42 = 2112;
      v43 = v36;
      _os_log_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEFAULT, "Cancelling operation %{public}@ because system task was deferred (%@)", buf, 0x16u);

    }
    objc_msgSend_cancelWithError_(self, v37, (uint64_t)v27, v38);

  }
  os_activity_scope_leave(&state);

}

- (CKContainer)container
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainer *)v8;
}

- (void)setContainer:(CKContainer *)container
{
  CKContainer *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = container;
  objc_msgSend_configuration(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainer_(v10, v8, (uint64_t)v4, v9);

}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_allowsCellularAccess(v4, v5, v6, v7);

  return v8;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = allowsCellularAccess;
  objc_msgSend_configuration(self, a2, allowsCellularAccess, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAllowsCellularAccess_(v7, v5, v4, v6);

}

- (BOOL)isLongLived
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isLongLived;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isLongLived = objc_msgSend_isLongLived(v4, v5, v6, v7);

  return isLongLived;
}

- (void)setLongLived:(BOOL)longLived
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = longLived;
  objc_msgSend_configuration(self, a2, longLived, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLongLived_(v7, v5, v4, v6);

}

- (NSTimeInterval)timeoutIntervalForRequest
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForRequest(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_configuration(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeoutIntervalForRequest_(v9, v6, v7, v8, timeoutIntervalForRequest);

}

- (NSTimeInterval)timeoutIntervalForResource
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForResource(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_configuration(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeoutIntervalForResource_(v9, v6, v7, v8, timeoutIntervalForResource);

}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_preferAnonymousRequests(v4, v5, v6, v7);

  return v8;
}

- (void)setPreferAnonymousRequests:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend_configuration(self, a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferAnonymousRequests_(v7, v5, v4, v6);

}

- (NSDictionary)additionalRequestHTTPHeaders
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_configuration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_additionalRequestHTTPHeaders(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_configuration(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalRequestHTTPHeaders_(v10, v8, (uint64_t)v4, v9);

}

- (void)setUsesBackgroundSession:(BOOL)a3
{
  self->_usesBackgroundSession = a3;
}

- (NSMutableDictionary)lifecycleCallbacks
{
  return self->_lifecycleCallbacks;
}

- (void)setLifecycleCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleCallbacks, a3);
}

- (void)setIsOutstandingOperation:(BOOL)a3
{
  self->_isOutstandingOperation = a3;
}

- (CKOperationGroup)convenienceOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 432, 1);
}

- (BOOL)isFinishingOnCallbackQueue
{
  return self->_isFinishingOnCallbackQueue;
}

- (BOOL)canDropItemResultsEarly
{
  return self->_canDropItemResultsEarly;
}

- (BOOL)_ckRaiseInGeneratedCallbackImplementation
{
  return self->__ckRaiseInGeneratedCallbackImplementation;
}

- (void)set_ckRaiseInGeneratedCallbackImplementation:(BOOL)a3
{
  self->__ckRaiseInGeneratedCallbackImplementation = a3;
}

- (void)setMMCSRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, a3);
}

- (CKTestResultOverlayBox)appliedOverlayProtocol
{
  return self->_appliedOverlayProtocol;
}

- (void)setAppliedOverlayProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_appliedOverlayProtocol, a3);
}

+ (id)assetInfoForOperation:(id)a3 recordID:(id)a4 recordKey:(id)a5 arrayIndex:(int64_t)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;

  v9 = a3;
  v10 = a4;
  v14 = a5;
  if (v10)
  {
    objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)v18, (uint64_t)v10);

    }
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v14, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v28 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v28, (uint64_t)v14);
    }
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v26, a6, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v28, v31, (uint64_t)v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      v33 = (void *)objc_opt_new();
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v34, a6, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v37, (uint64_t)v33, (uint64_t)v36);

    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (BOOL)_wireUpAssetContentForOperation:(id)a3 inRecord:(id)a4 checkSignatures:(BOOL)a5 outError:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v9 = a3;
  v10 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_18A80DF88;
  v38 = sub_18A80DF98;
  v39 = 0;
  objc_msgSend_assetInfoByArrayIndexByRecordKeyByRecordID(v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v19, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_18A80DFA0;
  v29[3] = &unk_1E1F66760;
  v22 = v10;
  v30 = v22;
  v33 = a5;
  v23 = v9;
  v31 = v23;
  v32 = &v34;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v21, v24, (uint64_t)v29, v25);
  v26 = (void *)v35[5];
  if (a6 && v26)
  {
    *a6 = objc_retainAutorelease(v26);
    v26 = (void *)v35[5];
  }
  v27 = v26 == 0;

  _Block_object_dispose(&v34, 8);
  return v27;
}

@end

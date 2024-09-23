@implementation CKScheduler

+ (id)sharedScheduler
{
  if (qword_1ECD96B58 != -1)
    dispatch_once(&qword_1ECD96B58, &unk_1E1F584B8);
  return (id)qword_1ECD96B60;
}

- (id)initInternal
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKScheduler;
  v2 = -[CKScheduler init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cloudkit.scheduler", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.cloudkit.scheduler.callback", v6);
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.cloudkit.scheduler.xpc_activity_register", v9, *((dispatch_queue_t *)v2 + 1));
    v11 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v14;

  }
  return v2;
}

- (void)submitActivity:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_submitActivity_completionHandler_, a3, 0);
}

- (void)submitActivity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *queue;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *xpcActivityRegisterQueue;
  id v23;
  id v24;
  void *v25;
  CKException *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  CKException *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v43;
  _QWORD block[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *(*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  os_activity_scope_state_s state;
  id v54;
  __int128 buf;
  void (*v56)(void **);
  void *v57;
  id v58;
  CKScheduler *v59;
  id v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v54 = 0;
  v8 = _CKCheckArgument((uint64_t)"activity", v6, 0, 0, 0, &v54);
  v9 = v54;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v26 = [CKException alloc];
    v30 = objc_msgSend_code(v10, v27, v28, v29);
    objc_msgSend_localizedDescription(v10, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (id)objc_msgSend_initWithCode_format_(v26, v35, v30, (uint64_t)CFSTR("%@"), v34);

    objc_exception_throw(v36);
  }

  v11 = _os_activity_create(&dword_18A5C5000, "client/scheduler-submit", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v12 = ck_log_facility_scheduler;
  if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_DEBUG, "About to submit activity: %@", (uint8_t *)&buf, 0xCu);
  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_18A707C5C;
  v51 = sub_18A707C84;
  v52 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A707C8C;
  block[3] = &unk_1E1F61B38;
  v46 = &v47;
  block[4] = self;
  v15 = v6;
  v45 = v15;
  dispatch_sync(queue, block);
  if (!v48[5])
  {
    v37 = [CKException alloc];
    objc_msgSend_identifier(v15, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend_initWithName_format_(v37, v42, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Must register a handler for activity identifier \"%@\" before submitting it"), v41);

    objc_exception_throw(v43);
  }
  objc_msgSend_suggestedXPCActivityCriteriaForActivity_(self, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  v20 = v18;
  v21 = v7;
  if (self)
  {
    xpcActivityRegisterQueue = self->_xpcActivityRegisterQueue;
    *(_QWORD *)&buf = v14;
    *((_QWORD *)&buf + 1) = 3221225472;
    v56 = sub_18A707CFC;
    v57 = &unk_1E1F61AE8;
    v23 = v19;
    v58 = v23;
    v59 = self;
    v24 = v20;
    v60 = v24;
    v61 = v21;
    dispatch_async(xpcActivityRegisterQueue, &buf);
    if (sub_18A7084C0((uint64_t)CKScheduler, v23))
    {
      sub_18A70855C((uint64_t)CKScheduler, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
  }

  _Block_object_dispose(&v47, 8);
  os_activity_scope_leave(&state);

}

- (void)setXPCActivity:(id)a3 forActivityIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A708918;
  block[3] = &unk_1E1F60DD8;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_sync(queue, block);

}

- (void)registerActivityIdentifier:(id)a3 handler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_registerActivityIdentifier_replaceExistingHandler_handler_, a3, 0);
}

- (void)registerActivityIdentifier:(id)a3 replaceExistingHandler:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *queue;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *xpcActivityRegisterQueue;
  id v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  CKException *v33;
  const char *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD block[4];
  id v39;
  CKScheduler *v40;
  id v41;
  uint64_t *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  os_activity_scope_state_s state;
  id v49;
  id v50;

  v8 = a3;
  v9 = a5;
  v50 = 0;
  v10 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v8, 0, 0, 0, &v50);
  v11 = v50;
  v12 = v11;
  if ((v10 & 1) == 0
    || (v11,
        v13 = _Block_copy(v9),
        v49 = 0,
        v14 = _CKCheckArgument((uint64_t)"handler", v13, 0, 0, 0, &v49),
        v12 = v49,
        v13,
        (v14 & 1) == 0))
  {
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v12, v23, v24, v25);
    objc_msgSend_localizedDescription(v12, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v15 = _os_activity_create(&dword_18A5C5000, "client/scheduler-register", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A708C3C;
  block[3] = &unk_1E1F62530;
  v18 = v8;
  v43 = a4;
  v39 = v18;
  v40 = self;
  v42 = &v44;
  v19 = v9;
  v41 = v19;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v45 + 24))
  {
    v33 = [CKException alloc];
    v35 = (id)objc_msgSend_initWithName_format_(v33, v34, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Illegal attempt to register a second handler for activity identifier %@"), v18);
    objc_exception_throw(v35);
  }
  if (self)
    xpcActivityRegisterQueue = self->_xpcActivityRegisterQueue;
  else
    xpcActivityRegisterQueue = 0;
  v36[0] = v17;
  v36[1] = 3221225472;
  v36[2] = sub_18A708E24;
  v36[3] = &unk_1E1F61A48;
  v36[4] = self;
  v37 = v18;
  v21 = v18;
  dispatch_async(xpcActivityRegisterQueue, v36);

  _Block_object_dispose(&v44, 8);
  os_activity_scope_leave(&state);

}

- (void)unregisterActivityIdentifier:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKException *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  os_activity_scope_state_s state;
  id v25;

  v4 = a3;
  v25 = 0;
  v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v25);
  v6 = v25;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v13 = [CKException alloc];
    v17 = objc_msgSend_code(v7, v14, v15, v16);
    objc_msgSend_localizedDescription(v7, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend_initWithCode_format_(v13, v22, v17, (uint64_t)CFSTR("%@"), v21);

    objc_exception_throw(v23);
  }

  v8 = _os_activity_create(&dword_18A5C5000, "client/scheduler-unregister", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_unregisterHandlerForActivityIdentifier_(self, v9, (uint64_t)v4, v10);
  objc_msgSend_cancelActivityWithIdentifier_(self, v11, (uint64_t)v4, v12);
  os_activity_scope_leave(&state);

}

- (void)unregisterHandlerForActivityIdentifier:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  CKException *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  _QWORD block[4];
  id v23;
  CKScheduler *v24;
  os_activity_scope_state_s state;
  id v26;

  v4 = a3;
  v26 = 0;
  v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v26);
  v6 = v26;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v11 = [CKException alloc];
    v15 = objc_msgSend_code(v7, v12, v13, v14);
    objc_msgSend_localizedDescription(v7, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend_initWithCode_format_(v11, v20, v15, (uint64_t)CFSTR("%@"), v19);

    objc_exception_throw(v21);
  }

  v8 = _os_activity_create(&dword_18A5C5000, "client/scheduler-unregister-handler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A709194;
  block[3] = &unk_1E1F61A48;
  v23 = v4;
  v24 = self;
  v10 = v4;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  CKException *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  _QWORD block[5];
  id v23;
  os_activity_scope_state_s state;
  id v25;

  v4 = a3;
  v25 = 0;
  v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v25);
  v6 = v25;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v11 = [CKException alloc];
    v15 = objc_msgSend_code(v7, v12, v13, v14);
    objc_msgSend_localizedDescription(v7, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend_initWithCode_format_(v11, v20, v15, (uint64_t)CFSTR("%@"), v19);

    objc_exception_throw(v21);
  }

  v8 = _os_activity_create(&dword_18A5C5000, "client/scheduler-cancel", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A7093E8;
  block[3] = &unk_1E1F61A48;
  block[4] = self;
  v23 = v4;
  v10 = v4;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

- (id)xpcActivityForActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A70ACAC;
  v16 = sub_18A70ACBC;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A70ACC4;
  block[3] = &unk_1E1F61B38;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)suggestedXPCActivityCriteriaForActivity:(id)a3
{
  id v4;
  xpc_object_t v5;
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
  int v21;
  const char *v22;
  nw_parameters_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int hasNetworkSocketDelegateEntitlement;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  char hasAllowAccessDuringBuddyEntitlement;
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
  xpc_object_t empty;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  int64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  int64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  void *v142;
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
  uint64_t KnownDeviceCount;
  void *v154;
  NSObject *v155;
  void *v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  double v168;
  id v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  const char *v174;
  int v175;
  double v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  double v181;
  double v182;
  double v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  xpc_object_t v195;
  id *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  id *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  id *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  void *v215;
  xpc_object_t v216;
  id *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  id v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  NSObject *v227;
  NSObject *v228;
  BOOL v229;
  id v230;
  id v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  xpc_object_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  id v241;
  id v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  NSObject *v246;
  const char *v248;
  uint64_t v249;
  char *v250;
  const char *v251;
  const char *v252;
  uint64_t v253;
  char *v254;
  const char *v255;
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  uint8_t v261[128];
  _BYTE buf[24];
  void *v263;
  id v264;
  id v265;
  id v266;
  uint64_t v267;

  v267 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
  objc_msgSend_container(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_useLiveServer(v17, v18, v19, v20);

  v22 = (const char *)*MEMORY[0x1E0C808D0];
  if (v21)
  {
    xpc_dictionary_set_BOOL(v5, v22, 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808C8], 0);
    v23 = nw_parameters_create();
    objc_msgSend_untrustedEntitlements(v9, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    hasNetworkSocketDelegateEntitlement = objc_msgSend_hasNetworkSocketDelegateEntitlement(v27, v28, v29, v30);

    if (hasNetworkSocketDelegateEntitlement)
    {
      objc_msgSend_relatedApplicationBundleIdentifiers(v4, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39
        || (objc_msgSend_defaultRelatedApplicationBundleIdentifiersForContainer_(CKSchedulerActivity, v40, (uint64_t)v9, v41), v42 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend_firstObject(v42, v43, v44, v45), v39 = (void *)objc_claimAutoreleasedReturnValue(), v42, v39))
      {
        v46 = objc_retainAutorelease(v39);
        objc_msgSend_UTF8String(v46, v47, v48, v49);
        nw_parameters_set_source_application_by_bundle_id();

      }
    }
    v50 = (void *)nw_parameters_copy_dictionary();
    if (v50)
      xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E0C80848], v50);

  }
  else
  {
    xpc_dictionary_set_BOOL(v5, v22, 0);
  }
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v58, v59, v60, v61);

  if ((hasAllowAccessDuringBuddyEntitlement & 1) == 0)
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808A0], 1);
  objc_msgSend_relatedApplicationBundleIdentifiers(v4, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_count(v66, v67, v68, v69);

  if (v70)
  {
    empty = xpc_array_create_empty();
    v257 = 0u;
    v258 = 0u;
    v259 = 0u;
    v260 = 0u;
    objc_msgSend_relatedApplicationBundleIdentifiers(v4, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v257, (uint64_t)v261, 16);
    if (v80)
    {
      v81 = *(_QWORD *)v258;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v258 != v81)
            objc_enumerationMutation(v78);
          v83 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v257 + 1) + 8 * i));
          v87 = (const char *)objc_msgSend_UTF8String(v83, v84, v85, v86);
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v87);
        }
        v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v88, (uint64_t)&v257, (uint64_t)v261, 16);
      }
      while (v80);
    }

    xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E0C80780], empty);
  }
  v89 = objc_msgSend_priority(v4, v71, v72, v73);
  xpc_dictionary_set_int64(v5, "ck_scheduler_priority", v89);
  objc_msgSend_identifier(v4, v90, v91, v92);
  v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v97 = (const char *)objc_msgSend_UTF8String(v93, v94, v95, v96);
  xpc_dictionary_set_string(v5, "ck_scheduler_activity_identifier", v97);

  objc_msgSend_containerID(v4, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v101, v102, v103, v104);
  v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v109 = (const char *)objc_msgSend_UTF8String(v105, v106, v107, v108);
  xpc_dictionary_set_string(v5, "ck_container_identifier", v109);

  objc_msgSend_containerID(v4, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_environment(v113, v114, v115, v116);
  xpc_dictionary_set_int64(v5, "ck_environment", v117);

  objc_msgSend_earliestStartDate(v4, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  if (v121)
  {
    objc_msgSend_earliestStartDate(v4, v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v125, v126, v127, v128);
    xpc_dictionary_set_double(v5, "ck_earliest_start_date", v129);

  }
  if (objc_msgSend_expectedTransferSizeBytes(v4, v122, v123, v124))
  {
    v133 = objc_msgSend_expectedTransferSizeBytes(v4, v130, v131, v132);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80850], v133);
  }
  if (objc_msgSend_userRequestedBackupTask(v4, v130, v131, v132))
  {
    v137 = objc_msgSend_userRequestedBackupTask(v4, v134, v135, v136);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808F8], v137);
  }
  v141 = v4;
  if (self)
  {
    objc_msgSend_fakeDeviceCount(self, v138, v139, v140);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_priority(v141, v143, v144, v145) || v142)
    {
      if (v142)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v157 = ck_log_facility_scheduler;
        if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v142;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v141;
          _os_log_impl(&dword_18A5C5000, v157, OS_LOG_TYPE_INFO, "Using fake device count (%@) for activity %@", buf, 0x16u);
        }
        KnownDeviceCount = objc_msgSend_integerValue(v142, v158, v159, v160);
      }
      else
      {
        KnownDeviceCount = 0;
      }
    }
    else
    {
      objc_msgSend_container(v141, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v149, v150, v151, v152);

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v154 = (void *)ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
      {
        v155 = v154;
        CKStringFromDeviceCount(KnownDeviceCount);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v141;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v156;
        _os_log_debug_impl(&dword_18A5C5000, v155, OS_LOG_TYPE_DEBUG, "Fetched number of active devices for %@: %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    KnownDeviceCount = 0;
  }

  v164 = objc_msgSend_priority(v141, v161, v162, v163);
  v168 = 0.0;
  if (v164 == 2)
  {
    v174 = (const char *)*MEMORY[0x1E0C80888];
    v175 = 1;
    v176 = 60.0;
    goto LABEL_55;
  }
  if (v164 == 1)
  {
    v175 = 0;
    v174 = (const char *)*MEMORY[0x1E0C80880];
    v176 = 86400.0;
    v168 = 3600.0;
    goto LABEL_55;
  }
  if (v164)
  {
    v175 = 0;
    v174 = 0;
    v176 = 0.0;
    goto LABEL_55;
  }
  CKStringFromDeviceCount(KnownDeviceCount);
  v169 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v173 = (const char *)objc_msgSend_UTF8String(v169, v170, v171, v172);
  xpc_dictionary_set_string(v5, "ck_device_count_string", v173);
  if (KnownDeviceCount != 2)
  {
    if (KnownDeviceCount == 1)
    {
      v175 = 0;
      v174 = (const char *)*MEMORY[0x1E0C80880];
      v176 = 86400.0;
      v168 = 14400.0;
      goto LABEL_54;
    }
    if (KnownDeviceCount)
    {
      v175 = 0;
      v174 = 0;
      v176 = 0.0;
      goto LABEL_54;
    }
  }
  v174 = (const char *)*MEMORY[0x1E0C80888];
  v175 = 1;
  v176 = 60.0;
LABEL_54:

LABEL_55:
  objc_msgSend_earliestStartDate(v141, v165, v166, v167);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v177, v178, v179, v180);
  v182 = v181;

  if (v182 >= v168)
    v183 = v182;
  else
    v183 = v168;
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v183);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], (uint64_t)v176);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], v174);
  if ((v175 & (objc_msgSend_userRequestedBackupTask(v141, v184, v185, v186) ^ 1)) == 1)
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808E8], 1);
  v190 = objc_msgSend_overrideRateLimiting(v141, v187, v188, v189);
  if ((_DWORD)v190)
  {
    sub_18A70BA60(v190, v191, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (v194)
    {
      v195 = xpc_dictionary_create(0, 0, 0);
      v196 = objc_retainAutorelease(v194);
      v200 = (const char *)objc_msgSend_UTF8String(v196, v197, v198, v199);
      xpc_dictionary_set_BOOL(v195, v200, 1);
      xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E0C80778], v195);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v228 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A5C5000, v228, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key", buf, 2u);
      }
      v196 = 0;
    }
    goto LABEL_82;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v196 = (id *)qword_1ECD96B88;
  v263 = (void *)qword_1ECD96B88;
  if (!qword_1ECD96B88)
  {
    v201 = sub_18A70CC20(v190, v191, v192, v193);
    v196 = (id *)dlsym(v201, "_DASRateLimitConfigurationKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v196;
    qword_1ECD96B88 = (uint64_t)v196;
  }
  _Block_object_dispose(buf, 8);
  if (!v196)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v202, v203, v204);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v248, (uint64_t)"NSString *get_DASRateLimitConfigurationKey(void)", v249);
    v230 = (id)objc_claimAutoreleasedReturnValue();
    v250 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v251, (uint64_t)v230, (uint64_t)CFSTR("CKScheduler.m"), 28, CFSTR("%s"), v250);

LABEL_93:
    __break(1u);
LABEL_94:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    goto LABEL_88;
  }
  v205 = (id *)*v196;
  v196 = v205;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v209 = (id *)qword_1ECD96B90;
  v263 = (void *)qword_1ECD96B90;
  if (!qword_1ECD96B90)
  {
    v210 = sub_18A70CC20((uint64_t)v205, v206, v207, v208);
    v209 = (id *)dlsym(v210, "_DASCKRateLimitConfigurationName");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v209;
    qword_1ECD96B90 = (uint64_t)v209;
  }
  _Block_object_dispose(buf, 8);
  if (!v209)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v211, v212, v213);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v252, (uint64_t)"NSString *get_DASCKRateLimitConfigurationName(void)", v253);
    v230 = (id)objc_claimAutoreleasedReturnValue();
    v254 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v255, (uint64_t)v230, (uint64_t)CFSTR("CKScheduler.m"), 29, CFSTR("%s"), v254);

    goto LABEL_93;
  }
  v214 = *v209;
  v215 = v214;
  if (v196 && v214)
  {
    v216 = xpc_dictionary_create(0, 0, 0);
    v217 = objc_retainAutorelease(v196);
    v221 = (const char *)objc_msgSend_UTF8String(v217, v218, v219, v220);
    v222 = objc_retainAutorelease(v215);
    v226 = (const char *)objc_msgSend_UTF8String(v222, v223, v224, v225);
    xpc_dictionary_set_string(v216, v221, v226);
    xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E0C80778], v216);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v227 = ck_log_facility_scheduler;
    if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v196;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v215;
      _os_log_fault_impl(&dword_18A5C5000, v227, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key (%@) or name (%@)", buf, 0x16u);
    }
  }

LABEL_82:
  v229 = self == 0;

  v230 = v5;
  v231 = v141;
  v5 = v231;
  if (!v229)
  {
    objc_msgSend_xpcActivityCriteriaOverrides(v231, v232, v233, v234);
    v235 = (void *)objc_claimAutoreleasedReturnValue();

    if (v235)
    {
      v236 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend_xpcActivityCriteriaOverrides(v5, v237, v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_18A70BB58;
      v263 = &unk_1E1F62648;
      v241 = v230;
      v264 = v241;
      v265 = v5;
      v266 = v236;
      v242 = v236;
      xpc_dictionary_apply(v240, buf);

      xpc_dictionary_set_value(v241, "ck_additional_xpc_activity_criteria", v242);
    }
  }

  v256 = 0;
  objc_msgSend_networkTransferEndpointWithError_(v9, v243, (uint64_t)&v256, v244);
  v141 = (id)objc_claimAutoreleasedReturnValue();
  v196 = (id *)v256;
  if (v141)
  {
    v245 = (void *)MEMORY[0x18D76DDC8](v141);
    xpc_dictionary_set_value(v230, (const char *)*MEMORY[0x1E0C80840], v245);

    goto LABEL_90;
  }
  if (ck_log_initialization_predicate != -1)
    goto LABEL_94;
LABEL_88:
  v246 = ck_log_facility_scheduler;
  if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v196;
    _os_log_error_impl(&dword_18A5C5000, v246, OS_LOG_TYPE_ERROR, "Error getting network transfer endpoint: %@", buf, 0xCu);
  }
LABEL_90:

  return v230;
}

+ (id)xpcActivityIdentifierForCKActivityIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int hasPrefix;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@."), v6, CFSTR("com.apple.xpc.activity.test"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v4, v8, (uint64_t)v7, v9);
  if (hasPrefix)
  {
    v14 = objc_msgSend_length(v7, v10, v11, v12);
    objc_msgSend_substringFromIndex_(v4, v15, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("%@.%@"), v19, CFSTR("com.apple.xpc.activity.test"), v17);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v4;
    v17 = v23;
  }
  if ((unint64_t)objc_msgSend_length(v23, v20, v21, v22) >= 0x7E)
  {
    objc_msgSend_CKSafeHashStringForPathComponent(v17, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = ck_log_facility_scheduler;
    if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v38 = v27;
      v39 = 2114;
      v40 = v17;
      _os_log_debug_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEBUG, "Using hash %{public}@ for name %{public}@", buf, 0x16u);
      if (hasPrefix)
        goto LABEL_9;
    }
    else if (hasPrefix)
    {
LABEL_9:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("%@.%@"), v30, CFSTR("com.apple.xpc.activity.test"), v27);
      v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v35 = v31;
      objc_msgSend_xpcActivityIdentifierForCKActivityIdentifier_(a1, v32, (uint64_t)v31, v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    v31 = v27;
    goto LABEL_13;
  }
  v34 = v23;
LABEL_14:

  return v34;
}

+ (id)activityFromXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  xpc_object_t v4;
  void *v5;
  const char *string;
  int64_t int64;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKContainerID *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  CKSchedulerActivity *v24;
  const char *v25;
  CKXPCActivity *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  _BOOL8 v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  size_t count;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  size_t i;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  _BOOL8 v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  void *v78;
  uint8_t buf[4];
  _xpc_activity_s *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_activity_s *)a3;
  v4 = xpc_activity_copy_criteria(v3);
  v5 = v4;
  if (v4)
  {
    string = xpc_dictionary_get_string(v4, "ck_container_identifier");
    int64 = xpc_dictionary_get_int64(v5, "ck_environment");
    if (string && (v8 = int64) != 0)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = (void *)objc_msgSend_initWithUTF8String_(v9, v10, (uint64_t)string, v11);
      v13 = [CKContainerID alloc];
      v15 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v13, v14, (uint64_t)v12, v8);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v18 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v80 = (_xpc_activity_s *)v5;
        _os_log_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_INFO, "Unable to get container identifier and environment from XPC activity criteria: %@", buf, 0xCu);
      }
      v15 = 0;
    }
    v19 = xpc_dictionary_get_int64(v5, "ck_scheduler_priority");
    v20 = xpc_dictionary_get_string(v5, "ck_scheduler_activity_identifier");
    if (v20)
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v21, (uint64_t)v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      if (v23 && v15)
      {
        v24 = [CKSchedulerActivity alloc];
        v17 = (void *)objc_msgSend_initWithIdentifier_containerID_priority_(v24, v25, (uint64_t)v23, (uint64_t)v15, v19);
        v26 = [CKXPCActivity alloc];
        v29 = (void *)objc_msgSend_initWithXPCActivity_(v26, v27, (uint64_t)v3, v28);
        objc_msgSend_setCkXPCActivity_(v17, v30, (uint64_t)v29, v31);

        v32 = xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E0C80850]);
        objc_msgSend_setExpectedTransferSizeBytes_(v17, v33, v32, v34);
        v35 = xpc_dictionary_get_double(v5, "ck_earliest_start_date");
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v36, v37, v38, v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEarliestStartDate_(v17, v40, (uint64_t)v39, v41);

        v42 = xpc_dictionary_get_BOOL(v5, (const char *)*MEMORY[0x1E0C808F8]);
        objc_msgSend_setUserRequestedBackupTask_(v17, v43, v42, v44);
        xpc_dictionary_get_dictionary(v5, "ck_additional_xpc_activity_criteria");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
          objc_msgSend_setXpcActivityCriteriaOverrides_(v17, v45, (uint64_t)v47, v46);
        xpc_dictionary_get_array(v5, (const char *)*MEMORY[0x1E0C80780]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v48;
        if (v48)
        {
          v78 = v47;
          count = xpc_array_get_count(v48);
          v54 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v59 = (void *)objc_msgSend_initWithCapacity_(v54, v55, count, v56);
          if (count)
          {
            for (i = 0; i != count; ++i)
            {
              v61 = xpc_array_get_string(v52, i);
              if (v61)
              {
                objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v57, (uint64_t)v61, v58);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (v64)
                  objc_msgSend_addObject_(v59, v62, (uint64_t)v64, v63);

              }
            }
          }
          objc_msgSend_setRelatedApplicationBundleIdentifiers_(v17, v57, (uint64_t)v59, v58);

          v47 = v78;
        }
        sub_18A70BA60((uint64_t)v48, v49, v50, v51);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          xpc_dictionary_get_dictionary(v5, (const char *)*MEMORY[0x1E0C80778]);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            v67 = objc_retainAutorelease(v65);
            v71 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70);
            v72 = xpc_dictionary_get_BOOL(v66, v71);
            objc_msgSend_setOverrideRateLimiting_(v17, v73, v72, v74);
          }

        }
        else
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v76 = ck_log_facility_scheduler;
          if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_18A5C5000, v76, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key when re-creating activity", buf, 2u);
          }
        }

      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v75 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v80 = (_xpc_activity_s *)v5;
        _os_log_impl(&dword_18A5C5000, v75, OS_LOG_TYPE_INFO, "Unable to get activity identifier from XPC activity criteria: %@", buf, 0xCu);
      }
      v23 = 0;
      v17 = 0;
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = ck_log_facility_scheduler;
    if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v3;
      _os_log_debug_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_DEBUG, "Couldn't get XPC activity criteria for xpc_activity %@", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

+ (id)identifierWithImmediateInvocationForIdentifier:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@.%@"), v3, CFSTR("com.apple.xpc.activity.test"), a3);
}

- (BOOL)hasPendingActivityWithActivityIdentifier:(id)a3
{
  uint64_t v3;
  CKScheduler *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  v4 = self;
  objc_msgSend_xpcActivityForActivityWithIdentifier_(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend_isXPCActivityPending_(v4, v6, (uint64_t)v5, v7);

  return (char)v4;
}

- (BOOL)isXPCActivityPending:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  BOOL v6;
  xpc_object_t v7;

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  state = xpc_activity_get_state(v3);
  if (!state)
  {
    v7 = xpc_activity_copy_criteria(v4);
    v6 = v7 != 0;

    goto LABEL_8;
  }
  if (state == 3 || state == 1)
    v6 = 1;
  else
LABEL_6:
    v6 = 0;
LABEL_8:

  return v6;
}

- (id)activityForActivityIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A70ACAC;
  v16 = sub_18A70ACBC;
  v17 = 0;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A70C708;
  block[3] = &unk_1E1F62670;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)currentPriorityForActivityIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A70C900;
  block[3] = &unk_1E1F62670;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)performAsyncOnQueue:(id)a3
{
  if (self)
    self = (CKScheduler *)self->_queue;
  dispatch_async(&self->super, a3);
}

- (NSMutableDictionary)xpcActivitiesByCKActivityIdentifier
{
  return self->_xpcActivitiesByCKActivityIdentifier;
}

- (NSNumber)fakeDeviceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFakeDeviceCount:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (double)delayAfterXPCActivityRegister
{
  return self->_delayAfterXPCActivityRegister;
}

- (void)setDelayAfterXPCActivityRegister:(double)a3
{
  self->_delayAfterXPCActivityRegister = a3;
}

- (NSMutableDictionary)handlersByCKActivityIdentifier
{
  return self->_handlersByCKActivityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersByCKActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_fakeDeviceCount, 0);
  objc_storeStrong((id *)&self->_xpcActivitiesByCKActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcActivityRegisterQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

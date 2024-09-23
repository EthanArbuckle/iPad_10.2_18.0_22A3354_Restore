@implementation CKUploadRequestManagerStateMachine

- (id)createStateMachine
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  id v26;
  const char *v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  id v71;
  id v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  id v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  id v82;
  id v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  id v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[4];
  id v116;
  _QWORD *v117;
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[3];
  char v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD v131[3];
  char v132;
  _QWORD v133[3];
  char v134;
  _QWORD v135[4];
  id v136;
  id v137;
  _QWORD v138[4];
  id v139;
  id v140;
  id v141;
  _QWORD *v142;
  _QWORD v143[5];
  _QWORD v144[5];
  _QWORD v145[3];
  char v146;
  _QWORD v147[4];
  id v148;
  id v149;
  _QWORD *v150;
  _QWORD *v151;
  _QWORD *v152;
  _QWORD *v153;
  _QWORD *v154;
  _QWORD v155[9];
  _QWORD v156[3];
  char v157;
  _QWORD v158[3];
  char v159;
  _QWORD v160[3];
  char v161;
  _QWORD v162[3];
  char v163;
  _QWORD v164[3];
  char v165;
  _QWORD v166[4];
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  _QWORD v171[4];
  id v172;
  _QWORD v173[14];

  v173[12] = *MEMORY[0x1E0C80C00];
  v111 = objc_alloc_init(MEMORY[0x1E0D1B448]);
  v3 = objc_alloc(MEMORY[0x1E0D1B438]);
  v5 = (void *)objc_msgSend_initWithName_parent_(v3, v4, (uint64_t)CFSTR("Global"), 0);
  v6 = objc_alloc(MEMORY[0x1E0D1B438]);
  v8 = objc_msgSend_initWithName_parent_(v6, v7, (uint64_t)CFSTR("Root Unregistered"), (uint64_t)v5);
  v9 = objc_alloc(MEMORY[0x1E0D1B438]);
  v11 = (void *)objc_msgSend_initWithName_parent_(v9, v10, (uint64_t)CFSTR("Initial"), v8);
  v12 = objc_alloc(MEMORY[0x1E0D1B438]);
  v114 = (void *)v8;
  v14 = (void *)objc_msgSend_initWithName_parent_(v12, v13, (uint64_t)CFSTR("Cleared"), v8);
  v15 = objc_alloc(MEMORY[0x1E0D1B438]);
  v17 = objc_msgSend_initWithName_parent_(v15, v16, (uint64_t)CFSTR("Root Registered"), (uint64_t)v5);
  v18 = objc_alloc(MEMORY[0x1E0D1B438]);
  v20 = (void *)objc_msgSend_initWithName_parent_(v18, v19, (uint64_t)CFSTR("Fetching Initial Data"), v17);
  v21 = objc_alloc(MEMORY[0x1E0D1B438]);
  v113 = (void *)v17;
  v23 = (void *)objc_msgSend_initWithName_parent_(v21, v22, (uint64_t)CFSTR("Root Initialized"), v17);
  v24 = objc_alloc(MEMORY[0x1E0D1B438]);
  v108 = (void *)objc_msgSend_initWithName_parent_(v24, v25, (uint64_t)CFSTR("Fetching Account ID"), (uint64_t)v23);
  v26 = objc_alloc(MEMORY[0x1E0D1B438]);
  v28 = (void *)objc_msgSend_initWithName_parent_(v26, v27, (uint64_t)CFSTR("System Not Ready"), (uint64_t)v23);
  v29 = objc_alloc(MEMORY[0x1E0D1B438]);
  v31 = (void *)objc_msgSend_initWithName_parent_(v29, v30, (uint64_t)CFSTR("Root Ready"), (uint64_t)v23);
  v32 = objc_alloc(MEMORY[0x1E0D1B438]);
  v106 = (void *)objc_msgSend_initWithName_parent_(v32, v33, (uint64_t)CFSTR("Pending Repair"), (uint64_t)v31);
  v34 = objc_alloc(MEMORY[0x1E0D1B438]);
  v105 = (void *)objc_msgSend_initWithName_parent_(v34, v35, (uint64_t)CFSTR("Repairing"), (uint64_t)v31);
  v112 = v5;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v36, (uint64_t)v5, (uint64_t)&unk_1E1F58738, &unk_1E1F59058, &unk_1E1F59138);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v5, v38, (uint64_t)v37, v39);

  v40 = MEMORY[0x1E0C809B0];
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = sub_18A776674;
  v171[3] = &unk_1E1F64688;
  v41 = v20;
  v172 = v41;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v42, (uint64_t)v114, (uint64_t)&unk_1E1F593D8, &unk_1E1F64660, v171);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v114, v44, (uint64_t)v43, v45);

  v169[0] = v40;
  v169[1] = 3221225472;
  v169[2] = sub_18A77676C;
  v169[3] = &unk_1E1F64688;
  v46 = v14;
  v170 = v46;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v47, (uint64_t)v11, (uint64_t)&unk_1E1F594D8, &unk_1E1F59558, v169);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v11, v49, (uint64_t)v48, v50);

  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v51, (uint64_t)v46, (uint64_t)&unk_1E1F595B8, &unk_1E1F59658, &unk_1E1F59698);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v46, v53, (uint64_t)v52, v54);

  v166[0] = v40;
  v166[1] = 3221225472;
  v166[2] = sub_18A7768E4;
  v166[3] = &unk_1E1F646D0;
  v110 = v11;
  v167 = v110;
  v55 = v46;
  v168 = v55;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v56, (uint64_t)v113, (uint64_t)&unk_1E1F596B8, &unk_1E1F646A8, v166);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v113, v58, (uint64_t)v57, v59);

  v164[0] = 0;
  v164[1] = v164;
  v164[2] = 0x2020000000;
  v165 = 0;
  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  v163 = 0;
  v160[0] = 0;
  v160[1] = v160;
  v160[2] = 0x2020000000;
  v161 = 0;
  v158[0] = 0;
  v158[1] = v158;
  v158[2] = 0x2020000000;
  v159 = 0;
  v156[0] = 0;
  v156[1] = v156;
  v156[2] = 0x2020000000;
  v157 = 0;
  v155[0] = v40;
  v155[1] = 3221225472;
  v155[2] = sub_18A776A20;
  v155[3] = &unk_1E1F646F8;
  v155[4] = v164;
  v155[5] = v162;
  v155[6] = v160;
  v155[7] = v158;
  v155[8] = v156;
  v147[0] = v40;
  v147[1] = 3221225472;
  v147[2] = sub_18A776AC8;
  v147[3] = &unk_1E1F64720;
  v150 = v164;
  v151 = v162;
  v152 = v160;
  v153 = v158;
  v154 = v156;
  v60 = v108;
  v148 = v60;
  v61 = v28;
  v149 = v61;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v62, (uint64_t)v41, (uint64_t)v155, &unk_1E1F596F8, v147);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v41, v64, (uint64_t)v63, v65);

  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x2020000000;
  v146 = 0;
  v144[0] = v40;
  v144[1] = 3221225472;
  v144[2] = sub_18A776ECC;
  v144[3] = &unk_1E1F64748;
  v144[4] = v145;
  v143[0] = v40;
  v143[1] = 3221225472;
  v143[2] = sub_18A776F54;
  v143[3] = &unk_1E1F64748;
  v143[4] = v145;
  v138[0] = v40;
  v138[1] = 3221225472;
  v138[2] = sub_18A776FF4;
  v138[3] = &unk_1E1F64770;
  v142 = v145;
  v109 = v41;
  v139 = v109;
  v66 = v61;
  v140 = v66;
  v107 = v55;
  v141 = v107;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v67, (uint64_t)v23, (uint64_t)v144, v143, v138);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v23, v69, (uint64_t)v68, v70);

  v135[0] = v40;
  v135[1] = 3221225472;
  v135[2] = sub_18A777454;
  v135[3] = &unk_1E1F646D0;
  v71 = v66;
  v136 = v71;
  v72 = v106;
  v137 = v72;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v73, (uint64_t)v60, (uint64_t)&unk_1E1F559A0, &unk_1E1F59758, v135);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v60, v75, (uint64_t)v74, v76);

  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  v132 = 0;
  v127[0] = v40;
  v127[1] = 3221225472;
  v127[2] = sub_18A777634;
  v127[3] = &unk_1E1F64798;
  v129 = v131;
  v130 = v133;
  v77 = v60;
  v128 = v77;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v78, (uint64_t)v71, (uint64_t)&unk_1E1F59778, &unk_1E1F597D8, v127);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v71, v80, (uint64_t)v79, v81);

  v124[0] = v40;
  v124[1] = 3221225472;
  v124[2] = sub_18A7778E0;
  v124[3] = &unk_1E1F646D0;
  v82 = v71;
  v125 = v82;
  v83 = v72;
  v126 = v83;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v84, (uint64_t)v31, (uint64_t)&unk_1E1F647B8, &unk_1E1F597F8, v124);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v31, v86, (uint64_t)v85, v87);

  v122[0] = v40;
  v122[1] = 3221225472;
  v122[2] = sub_18A777BD8;
  v122[3] = &unk_1E1F64688;
  v88 = v105;
  v123 = v88;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v89, (uint64_t)v83, (uint64_t)&unk_1E1F647D8, &unk_1E1F59838, v122);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v83, v91, (uint64_t)v90, v92);

  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x2020000000;
  v121 = 0;
  v118[4] = v120;
  v119[0] = v40;
  v119[1] = 3221225472;
  v119[2] = sub_18A777DB0;
  v119[3] = &unk_1E1F64748;
  v119[4] = v120;
  v117 = v120;
  v118[0] = v40;
  v118[1] = 3221225472;
  v118[2] = sub_18A777E10;
  v118[3] = &unk_1E1F64748;
  v115[0] = v40;
  v115[1] = 3221225472;
  v115[2] = sub_18A777EA8;
  v115[3] = &unk_1E1F64800;
  v93 = v83;
  v116 = v93;
  objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v94, (uint64_t)v88, (uint64_t)v119, v118, v115);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_(v88, v96, (uint64_t)v95, v97);

  _Block_object_dispose(v120, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);

  _Block_object_dispose(v145, 8);
  _Block_object_dispose(v156, 8);
  _Block_object_dispose(v158, 8);
  _Block_object_dispose(v160, 8);
  _Block_object_dispose(v162, 8);
  _Block_object_dispose(v164, 8);
  v173[0] = v112;
  v173[1] = v114;
  v173[2] = v110;
  v173[3] = v107;
  v173[4] = v113;
  v173[5] = v109;
  v173[6] = v23;
  v173[7] = v77;
  v173[8] = v82;
  v173[9] = v31;
  v173[10] = v93;
  v173[11] = v88;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v98, (uint64_t)v173, 12);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStates_(v111, v100, (uint64_t)v99, v101);

  objc_msgSend_setInitialState_(v111, v102, (uint64_t)v110, v103);
  return v111;
}

+ (id)nameFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E1F648B0[a3];
}

+ (id)nameFromFunction:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E1F648D0[a3];
}

+ (id)nameFromStateEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12)
    return CFSTR("Unknown");
  else
    return off_1E1F648E8[a3];
}

+ (id)nameFromResponseAction:(int64_t)a3
{
  if ((unint64_t)a3 > 0x1C)
    return CFSTR("Unknown");
  else
    return off_1E1F64980[a3];
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self->_stateMachine, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKUploadRequestManagerStateMachine;
  -[CKUploadRequestManagerStateMachine dealloc](&v5, sel_dealloc);
}

- (CKUploadRequestManagerStateMachine)initWithActionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKUploadRequestManagerStateMachine *v8;
  uint64_t v9;
  id actionHandler;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CUStateMachine *stateMachine;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKUploadRequestManagerStateMachine;
  v8 = -[CKUploadRequestManagerStateMachine init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    actionHandler = v8->_actionHandler;
    v8->_actionHandler = (id)v9;

    objc_msgSend_createStateMachine(v8, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (CUStateMachine *)v14;

  }
  return v8;
}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_stateMachine(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_start(v7, v4, v5, v6);

}

- (void)dispatchEvent:(int64_t)a3
{
  objc_msgSend_dispatchEvent_userInfo_(self, a2, a3, 0);
}

- (void)dispatchEvent:(int64_t)a3 userInfo:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;

  v6 = (void *)objc_msgSend_mutableCopy(a4, a2, a3, (uint64_t)a4);
  v10 = v6;
  if (v6)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v11;

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v33, v20, (uint64_t)v19, (uint64_t)CFSTR("uuid"));

  v21 = objc_alloc(MEMORY[0x1E0D1B440]);
  objc_msgSend_nameFromStateEvent_(CKUploadRequestManagerStateMachine, v22, a3, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithName_userInfo_(v21, v25, (uint64_t)v24, (uint64_t)v33);

  objc_msgSend_stateMachine(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchEvent_(v30, v31, (uint64_t)v26, v32);

}

- (BOOL)canPerformFunction:(int64_t)a3
{
  CKUploadRequestManagerStateMachine *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];
  id v17[2];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id location;
  const __CFString *v23;
  _QWORD v24[2];

  v4 = self;
  v24[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A778554;
  v16[3] = &unk_1E1F64828;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  v16[4] = &v18;
  objc_msgSend_setInternalActionHandler_(v4, v5, (uint64_t)v16, v6);
  v23 = CFSTR("function");
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v24, (uint64_t)&v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchEvent_userInfo_(v4, v12, 18, (uint64_t)v11);

  objc_msgSend_setInternalActionHandler_(v4, v13, 0, v14);
  LOBYTE(v4) = *((_BYTE *)v19 + 24) != 0;
  objc_destroyWeak(v17);
  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);
  return (char)v4;
}

- (id)eventHandlerForState:(id)a3 withEnterBlock:(id)a4 exitBlock:(id)a5 eventBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id from;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v13);

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A7787D4;
  aBlock[3] = &unk_1E1F63098;
  objc_copyWeak(&v31, &location);
  v15 = _Block_copy(aBlock);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = sub_18A7789A0;
  v23[3] = &unk_1E1F64890;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  v24 = v10;
  v25 = v15;
  v26 = v11;
  v27 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v15;
  v19 = v10;
  v20 = _Block_copy(v23);
  v21 = _Block_copy(v20);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v21;
}

- (void)transitionToState:(id)a3 withEvent:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v8 = a3;
  if (a4)
    objc_msgSend_setEventCausingTransition_(self, v6, (uint64_t)a4, v7);
  else
    objc_msgSend_setEventCausingTransition_(self, v6, 0, v7);
  objc_msgSend_stateMachine(self, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionToState_(v14, v12, (uint64_t)v8, v13);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)enterStateHandler
{
  return self->_enterStateHandler;
}

- (void)setEnterStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)exitStateHandler
{
  return self->_exitStateHandler;
}

- (void)setExitStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CUStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (CUStateEvent)eventCausingTransition
{
  return self->_eventCausingTransition;
}

- (void)setEventCausingTransition:(id)a3
{
  objc_storeStrong((id *)&self->_eventCausingTransition, a3);
}

- (id)internalActionHandler
{
  return self->_internalActionHandler;
}

- (void)setInternalActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalActionHandler, 0);
  objc_storeStrong((id *)&self->_eventCausingTransition, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_exitStateHandler, 0);
  objc_storeStrong(&self->_enterStateHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end

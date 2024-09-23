@implementation CHRemoteMathRecognizer

- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  CHRemoteRecognitionMathRequest *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  id v107;
  id v108;
  _QWORD v110[5];
  id v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  _QWORD v119[5];
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!self)
  {

    v71 = 0;
    v108 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  v11 = [CHRemoteRecognitionMathRequest alloc];
  v17 = objc_msgSend_priority(self, v12, v13, v14, v15, v16);
  v20 = (void *)objc_msgSend_initWithDrawing_options_priority_(v11, v18, (uint64_t)v8, (uint64_t)v10, v17, v19);
  objc_msgSend_locales(self, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocales_(v20, v27, (uint64_t)v26, v28, v29, v30);

  v36 = objc_msgSend_maxRecognitionResultCount(self, v31, v32, v33, v34, v35);
  objc_msgSend_setMaxRecognitionResultCount_(v20, v37, v36, v38, v39, v40);
  objc_msgSend_minimumDrawingSize(self, v41, v42, v43, v44, v45);
  objc_msgSend_setMinimumDrawingSize_(v20, v46, v47, v48, v49, v50);
  v56 = objc_msgSend_enableCachingIfAvailable(self, v51, v52, v53, v54, v55);
  objc_msgSend_setEnableCachingIfAvailable_(v20, v57, v56, v58, v59, v60);
  objc_msgSend_declaredVariables(self, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeclaredVariables_(v20, v67, (uint64_t)v66, v68, v69, v70);

  v71 = v20;
  objc_msgSend_setupXPCConnectionIfNeeded(self, v72, v73, v74, v75, v76);
  objc_msgSend_connection(self, v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v82)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v87 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v110[0]) = 0;
      _os_log_impl(&dword_1BE607000, v87, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", (uint8_t *)v110, 2u);
    }

  }
  v132 = 0;
  v133 = &v132;
  v134 = 0x3032000000;
  v135 = sub_1BE7B8F84;
  v136 = sub_1BE7B8F94;
  v137 = 0;
  v126 = 0;
  v127 = &v126;
  v128 = 0x3032000000;
  v129 = sub_1BE7B8F84;
  v130 = sub_1BE7B8F94;
  v131 = 0;
  objc_msgSend_setHasBeenSubmitted_(v71, v83, 1, v84, v85, v86);
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = sub_1BE7B8F84;
  v124 = sub_1BE7B8F94;
  v125 = 0;
  objc_msgSend_connection(self, v88, v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = MEMORY[0x1E0C809B0];
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = sub_1BE7B8F9C;
  v119[3] = &unk_1E77F2310;
  v119[4] = &v120;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v93, v95, (uint64_t)v119, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v110[0] = v94;
  v110[1] = 3221225472;
  v110[2] = sub_1BE7B90B8;
  v110[3] = &unk_1E77F2360;
  v112 = &v132;
  v113 = &v126;
  v110[4] = self;
  v100 = v71;
  v111 = v100;
  v114 = &v115;
  objc_msgSend_handleRecognitionRequest_withReply_(v99, v101, (uint64_t)v100, (uint64_t)v110, v102, v103);
  if (!*((_BYTE *)v116 + 24))
    objc_msgSend_logDrawingsAndResultsForRequest_result_error_(self, v104, (uint64_t)v100, 0, v121[5], v105);
  v106 = (void *)v121[5];
  if (!v106)
    v106 = (void *)v127[5];
  v107 = objc_retainAutorelease(v106);
  self = (CHRemoteMathRecognizer *)(id)v133[5];

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v120, 8);

  _Block_object_dispose(&v126, 8);
  _Block_object_dispose(&v132, 8);

  v108 = v107;
  if (a5)
LABEL_13:
    *a5 = objc_retainAutorelease(v108);
LABEL_14:

  return self;
}

- (BOOL)isEqualToRemoteMathRecognizer:(id)a3
{
  CHRemoteMathRecognizer *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isEqualToSet;
  objc_super v35;

  v4 = (CHRemoteMathRecognizer *)a3;
  if (self == v4)
  {
    isEqualToSet = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CHRemoteMathRecognizer;
    if (-[CHRemoteRecognizer isEqualToRemoteRecognizer:](&v35, sel_isEqualToRemoteRecognizer_, v4))
    {
      objc_msgSend_declaredVariables(self, v5, v6, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_declaredVariables(v4, v11, v12, v13, v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v21)
      {
        isEqualToSet = 1;
      }
      else
      {
        objc_msgSend_declaredVariables(self, v16, v17, v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_declaredVariables(v4, v23, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToSet = objc_msgSend_isEqualToSet_(v22, v29, (uint64_t)v28, v30, v31, v32);

      }
    }
    else
    {
      isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteMathRecognizer;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteMathRecognizer = objc_msgSend_isEqualToRemoteMathRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteMathRecognizer;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_declaredVariables(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16, v9);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v7);
        v10 ^= objc_msgSend_hash(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v18++), v11, v12, v13, v14, v15);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v21, (uint64_t)v25, 16, v15);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)CHRemoteMathRecognizer;
  return -[CHRemoteRecognizer hash](&v20, sel_hash) ^ v10;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (void)setDeclaredVariables:(id)a3
{
  objc_storeStrong((id *)&self->_declaredVariables, a3);
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end

@implementation CKDContainerSpecificInfoURLRequest

- (CKDContainerSpecificInfoURLRequest)initWithOperation:(id)a3 containerIdentifier:(id)a4
{
  id v7;
  CKDContainerSpecificInfoURLRequest *v8;
  CKDContainerSpecificInfoURLRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDContainerSpecificInfoURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v11, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_containerIdentifier, a4);

  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDContainerSpecificInfoURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v9, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_containerIdentifier(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("containerIdentifier"));

}

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_requireUserIDs(self, a2, v2) ^ 1;
}

- (BOOL)allowsAuthedAccount
{
  return 0;
}

- (BOOL)usesCloudKitAuthToken
{
  return 0;
}

- (BOOL)usesiCloudAuthToken
{
  return 1;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)url
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setupBaseURL(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E0CB3998], v8, (uint64_t)v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_path(v9, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16 = (void *)v13;
    objc_msgSend_path(v9, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_length(v17, v18, v19);

    if (v20)
    {
      objc_msgSend_path(v9, v14, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v10, v23, (uint64_t)v22);

    }
  }
  objc_msgSend_appendString_(v10, v14, (uint64_t)CFSTR("/setup/ck/v1/ckAppInit"));
  objc_msgSend_setPath_(v9, v24, (uint64_t)v10);
  v38 = CFSTR("container");
  objc_msgSend_containerIdentifier(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v27;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v39, &v38, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKPercentEscapedQueryString(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPercentEncodedQuery_(v9, v33, (uint64_t)v32);

  objc_msgSend_URL(v9, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (void)requestDidParseJSONObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  int v90;
  dispatch_block_t *v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  os_log_t *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  os_log_t v125;
  const char *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  NSObject *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  NSObject *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  NSObject *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  NSObject *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  uint8_t buf[4];
  void *v174;
  __int16 v175;
  void *v176;
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6))
  {
    v84 = (void *)MEMORY[0x1E0C94FF8];
    v85 = *MEMORY[0x1E0C94B20];
    objc_msgSend_containerIdentifier(self, v7, v8);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v84, v87, v85, 1014, CFSTR("Couldn't get container configuration from the server for container \"%@\"), v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v89, (uint64_t)v88);

    goto LABEL_69;
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend_setContainerServerInfo_(self, v10, (uint64_t)v9);

  objc_msgSend_CKFirstUrlForKeys_(v4, v11, (uint64_t)&unk_1E78AF228);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerServerInfo(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicCloudDBURL_(v15, v16, (uint64_t)v12);

  objc_msgSend_containerServerInfo(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicCloudDBURL(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (_QWORD *)MEMORY[0x1E0C95300];
  if (!v22)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v25 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v143 = v25;
      objc_msgSend_requestUUID(self, v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v174 = v146;
      _os_log_error_impl(&dword_1BE990000, v143, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicCloudDBURL url\", buf, 0xCu);

    }
  }
  objc_msgSend_CKFirstUrlForKeys_(v4, v23, (uint64_t)&unk_1E78AF240);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerServerInfo(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicShareServiceURL_(v29, v30, (uint64_t)v26);

  objc_msgSend_containerServerInfo(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicShareServiceURL(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    if (*v24 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v147 = v38;
      objc_msgSend_requestUUID(self, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v174 = v150;
      _os_log_error_impl(&dword_1BE990000, v147, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicShareServiceURL url\", buf, 0xCu);

    }
  }
  objc_msgSend_CKFirstUrlForKeys_(v4, v37, (uint64_t)&unk_1E78AF258);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerServerInfo(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicDeviceServiceURL_(v42, v43, (uint64_t)v39);

  objc_msgSend_containerServerInfo(self, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicDeviceServiceURL(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    if (*v24 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v151 = v51;
      objc_msgSend_requestUUID(self, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v174 = v154;
      _os_log_error_impl(&dword_1BE990000, v151, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicDeviceServiceURL url\", buf, 0xCu);

    }
  }
  objc_msgSend_CKFirstUrlForKeys_(v4, v50, (uint64_t)&unk_1E78AF270);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerServerInfo(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicCodeServiceURL_(v55, v56, (uint64_t)v52);

  objc_msgSend_containerServerInfo(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicCodeServiceURL(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
  {
    if (*v24 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v64 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v155 = v64;
      objc_msgSend_requestUUID(self, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v174 = v158;
      _os_log_error_impl(&dword_1BE990000, v155, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicCodeServiceURL url\", buf, 0xCu);

    }
  }
  objc_msgSend_CKFirstUrlForKeys_(v4, v63, (uint64_t)&unk_1E78AF288);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerServerInfo(self, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicMetricsServiceURL_(v68, v69, (uint64_t)v65);

  objc_msgSend_containerServerInfo(self, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicMetricsServiceURL(v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v75)
  {
    if (*v24 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v77 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v159 = v77;
      objc_msgSend_requestUUID(self, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v174 = v162;
      _os_log_error_impl(&dword_1BE990000, v159, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't create publicMetricsServiceURL url\", buf, 0xCu);

    }
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v76, (uint64_t)CFSTR("cloudKitUserId"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v90 = objc_msgSend_requireUserIDs(self, v79, v80);
    v91 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    v92 = (void *)*MEMORY[0x1E0C952F8];
    if (v90)
    {
      if (*v24 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v92);
      v93 = (void *)*MEMORY[0x1E0C952E0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      v96 = v93;
      objc_msgSend_requestUUID(self, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v174 = v99;
      v175 = 2114;
      v176 = v78;
      _os_log_error_impl(&dword_1BE990000, v96, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't parse a container scoped user id from %{public}@\", buf, 0x16u);
    }
    else
    {
      if (*v24 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v92);
      v100 = (void *)*MEMORY[0x1E0C952E0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
        goto LABEL_38;
      v96 = v100;
      objc_msgSend_requestUUID(self, v163, v164);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v174 = v99;
      v175 = 2114;
      v176 = v78;
      _os_log_debug_impl(&dword_1BE990000, v96, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Couldn't parse a container scoped user id from %{public}@\", buf, 0x16u);
    }

LABEL_38:
    if (objc_msgSend_requireUserIDs(self, v94, v95))
    {
      objc_msgSend_iCloudAuthToken(self, v83, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend_length(v102, v103, v104);

      if (!v105)
      {
        if (*v24 != -1)
          dispatch_once(MEMORY[0x1E0C95300], *v91);
        v106 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
        {
          v165 = v106;
          objc_msgSend_requestUUID(self, v166, v167);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v174 = v168;
          _os_log_debug_impl(&dword_1BE990000, v165, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Container scoped user ID was needed but not returned because we didn't have an iCloud auth token. Handling this as an auth failure.\", buf, 0xCu);

        }
        objc_msgSend_setNeedsAuthRetry_(self, v107, 1);
      }
    }
    goto LABEL_45;
  }
  objc_msgSend_containerServerInfo(self, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainerScopedUserID_(v81, v82, (uint64_t)v78);

LABEL_45:
  objc_msgSend_objectForKeyedSubscript_(v4, v83, (uint64_t)CFSTR("orgInfo"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v108, v109, (uint64_t)CFSTR("cloudKitOrgUserId"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_containerServerInfo(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOrgAdminUserID_(v113, v114, (uint64_t)v110);

  }
  else
  {
    if (*v24 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v116 = (os_log_t *)MEMORY[0x1E0C952E0];
    v117 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v139 = v117;
      objc_msgSend_requestUUID(self, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v174 = v142;
      v175 = 2114;
      v176 = v110;
      _os_log_debug_impl(&dword_1BE990000, v139, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Couldn't parse an org admin user id from %{public}@\", buf, 0x16u);

    }
    if (objc_msgSend_requireUserIDs(self, v118, v119))
    {
      objc_msgSend_iCloudAuthToken(self, v115, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend_length(v121, v122, v123);

      if (!v124)
      {
        if (*v24 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v125 = *v116;
        if (os_log_type_enabled(*v116, OS_LOG_TYPE_DEBUG))
        {
          v169 = v125;
          objc_msgSend_requestUUID(self, v170, v171);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v174 = v172;
          _os_log_debug_impl(&dword_1BE990000, v169, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Org Admin user ID was needed but not returned because we didn't have an iCloud auth token. Handling this as an auth failure.\", buf, 0xCu);

        }
        objc_msgSend_setNeedsAuthRetry_(self, v126, 1);
      }
    }
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v115, (uint64_t)CFSTR("environment"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_lowercaseString(v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v130, v131, (uint64_t)CFSTR("production")) & 1) != 0
      || !objc_msgSend_hasPrefix_(v130, v128, (uint64_t)CFSTR("icloud")))
    {
      v136 = 0;
    }
    else
    {
      objc_msgSend_substringWithRange_(v130, v128, 6, 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend_integerValue(v132, v133, v134);
      if ((unint64_t)(v135 - 1) >= 3)
        v136 = 0;
      else
        v136 = v135;

    }
    v127 = v130;
  }
  else
  {
    v136 = 0;
  }
  objc_msgSend_containerServerInfo(self, v128, v129);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnvironment_(v137, v138, v136);

LABEL_69:
}

- (BOOL)requireUserIDs
{
  return self->_requireUserIDs;
}

- (void)setRequireUserIDs:(BOOL)a3
{
  self->_requireUserIDs = a3;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (CKDContainerServerInfo)containerServerInfo
{
  return self->_containerServerInfo;
}

- (void)setContainerServerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerServerInfo, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end

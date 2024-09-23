@implementation NEAppSidecarPolicySession

- (NEAppSidecarPolicySession)init
{
  NEAppSidecarPolicySession *v2;
  NEPolicySession *v3;
  NEPolicySession *policySession;
  NEPolicySession *v5;
  NSMutableArray *v6;
  NSMutableArray *policyIDList;
  NEAppSidecarPolicySession *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NEAppSidecarPolicySession;
  v2 = -[NEAppSidecarPolicySession init](&v12, sel_init);
  if (!v2)
    goto LABEL_4;
  v3 = -[NEPolicySession initFromPrivilegedProcess]([NEPolicySession alloc], "initFromPrivilegedProcess");
  policySession = v2->_policySession;
  v2->_policySession = v3;

  v5 = v2->_policySession;
  if (v5)
  {
    -[NEPolicySession lockSessionToCurrentProcess](v5, "lockSessionToCurrentProcess");
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    policyIDList = v2->_policyIDList;
    v2->_policyIDList = v6;

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "failed to create policy session", v11, 2u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)installPolicies
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NEPolicy *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NEPolicy *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  SEL v20;
  uint64_t v21;
  int is_debug_logging_enabled;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  SEL v26;
  id Property;
  void *v28;
  id v29;
  void *v30;
  BOOL v31;
  _BOOL4 v32;
  uint64_t i;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NEPolicy *v40;
  SEL v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  __CFString *v46;
  SEL v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  int v57;
  NEPolicy *v58;
  SEL v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  NSObject *v63;
  __CFString *v64;
  SEL v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  SEL v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  __CFString *v81;
  SEL v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  NEPolicy *v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  SEL v98;
  uint64_t v99;
  int v100;
  NSObject *v101;
  NSObject *v102;
  __CFString *v103;
  SEL v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  SEL v109;
  char v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  _BOOL4 v115;
  _BOOL4 v116;
  _BOOL4 v117;
  void *v118;
  _BOOL4 v119;
  __CFString *v120;
  __CFString *v121;
  __CFString *v122;
  __CFString *v123;
  __CFString *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  int v129;
  uint64_t v130;
  NSObject *obj;
  uint64_t obja;
  id v133;
  id v134;
  NSObject *v135;
  NEAppSidecarPolicySession *selfa;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t buf[4];
  const __CFString *v153;
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 8, 1))
  {
    selfa = self;
    v3 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/libexec/rapportd"));
    if (v3)
    {
      v4 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/libexec/SidecarRelay"));
      if (v4)
      {
        v5 = +[NEProcessInfo copyDNSUUIDs](NEProcessInfo, "copyDNSUUIDs");
        v6 = v5;
        if (v5)
        {
          v128 = v5;
          v125 = v3;
          v126 = v4;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          obj = v3;
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
          if (v7)
          {
            v8 = v7;
            LODWORD(v9) = 0;
            v10 = 0;
            v11 = 0;
            v133 = *(id *)v146;
            while (2)
            {
              v12 = 0;
              v13 = v9;
              do
              {
                v14 = v11;
                v15 = v10;
                if (*(id *)v146 != v133)
                  objc_enumerationMutation(obj);
                v16 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * v12);
                v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addObject:", v18);

                +[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addObject:", v19);

                +[NEPolicyResult passWithFlags:](NEPolicyResult, "passWithFlags:", 2);
                v11 = objc_claimAutoreleasedReturnValue();

                v10 = -[NEPolicy initWithOrder:result:conditions:]([NEPolicy alloc], "initWithOrder:result:conditions:", v13 + v12, v11, v17);
                v21 = objc_msgSend(objc_getProperty(selfa, v20, 8, 1), "addPolicy:", v10);
                is_debug_logging_enabled = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = v23;
                if (!v21)
                {
                  v32 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
                  if (is_debug_logging_enabled)
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                      v120 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v120;
                      _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);

                    }
                  }

                  v113 = obj;
LABEL_80:

                  goto LABEL_81;
                }
                if (is_debug_logging_enabled)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v25;
                  _os_log_impl(&dword_19BD16000, v24, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);

                }
                Property = objc_getProperty(selfa, v26, 16, 1);
                v28 = (void *)MEMORY[0x1E0CB37E8];
                v29 = Property;
                objc_msgSend(v28, "numberWithUnsignedInteger:", v21);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v30);

                ++v12;
              }
              while (v8 != v12);
              v9 = (v13 + v12);
              v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
              if (v8)
                continue;
              break;
            }
          }
          else
          {
            v9 = 0;
            v10 = 0;
            v11 = 0;
          }

          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v127 = v128;
          v130 = -[NSObject countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
          if (v130)
          {
            obja = *(_QWORD *)v142;
            while (2)
            {
              for (i = 0; i != v130; ++i)
              {
                if (*(_QWORD *)v142 != obja)
                  objc_enumerationMutation(v127);
                v34 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i);
                v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v36);

                +[NEPolicyCondition packetFilterTags:](NEPolicyCondition, "packetFilterTags:", 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v37);

                +[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v38);

                +[NEPolicyResult passWithFlags:](NEPolicyResult, "passWithFlags:", 2);
                v39 = objc_claimAutoreleasedReturnValue();

                v134 = v35;
                v40 = -[NEPolicy initWithOrder:result:conditions:]([NEPolicy alloc], "initWithOrder:result:conditions:", v9, v39, v35);

                v42 = objc_msgSend(objc_getProperty(selfa, v41, 8, 1), "addPolicy:", v40);
                v43 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v44 = objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (!v42)
                {
                  v116 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
                  if (v43)
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v40;
                      _os_log_error_impl(&dword_19BD16000, v45, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v40, "descriptionWithIndent:options:", 0, 2);
                      v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v122;
                      _os_log_error_impl(&dword_19BD16000, v45, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);

                    }
                  }
                  v58 = v40;
                  v56 = v39;
                  goto LABEL_110;
                }
                if (v43)
                {
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v40;
                    _os_log_debug_impl(&dword_19BD16000, v45, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v40, "descriptionWithIndent:options:", 0, 2);
                  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v46;
                  _os_log_impl(&dword_19BD16000, v45, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);

                }
                v48 = objc_getProperty(selfa, v47, 16, 1);
                v49 = (void *)MEMORY[0x1E0CB37E8];
                v50 = v48;
                objc_msgSend(v49, "numberWithUnsignedInteger:", v42);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "addObject:", v51);

                v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v34);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v45, "addObject:", v52);

                objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("224.0.0.251"), CFSTR("5353"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                +[NEPolicyCondition remoteAddress:prefix:](NEPolicyCondition, "remoteAddress:prefix:", v53, 0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v45, "addObject:", v54);

                +[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v45, "addObject:", v55);

                +[NEPolicyResult passWithFlags:](NEPolicyResult, "passWithFlags:", 2);
                v56 = objc_claimAutoreleasedReturnValue();

                v129 = v9;
                v57 = v9 + 1;
                v58 = -[NEPolicy initWithOrder:result:conditions:]([NEPolicy alloc], "initWithOrder:result:conditions:", (v9 + 1), v56, v45);

                v60 = objc_msgSend(objc_getProperty(selfa, v59, 8, 1), "addPolicy:", v58);
                v61 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v62 = objc_claimAutoreleasedReturnValue();
                v63 = v62;
                if (!v60)
                {
                  v117 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
                  if (v61)
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v58;
                      _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v58, "descriptionWithIndent:options:", 0, 2);
                      v123 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v123;
                      _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);

                    }
                  }

                  goto LABEL_111;
                }
                if (v61)
                {
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v58;
                    _os_log_debug_impl(&dword_19BD16000, v63, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v58, "descriptionWithIndent:options:", 0, 2);
                  v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v64;
                  _os_log_impl(&dword_19BD16000, v63, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);

                }
                v66 = objc_getProperty(selfa, v65, 16, 1);
                v67 = (void *)MEMORY[0x1E0CB37E8];
                v68 = v66;
                objc_msgSend(v67, "numberWithUnsignedInteger:", v60);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addObject:", v69);

                v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v34);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "addObject:", v71);

                objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("FF02::FB"), CFSTR("5353"));
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                +[NEPolicyCondition remoteAddress:prefix:](NEPolicyCondition, "remoteAddress:prefix:", v72, 0);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "addObject:", v73);

                +[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "addObject:", v74);

                +[NEPolicyResult passWithFlags:](NEPolicyResult, "passWithFlags:", 2);
                v11 = objc_claimAutoreleasedReturnValue();

                v75 = (v57 + 1);
                v10 = -[NEPolicy initWithOrder:result:conditions:]([NEPolicy alloc], "initWithOrder:result:conditions:", v75, v11, v70);

                v77 = objc_msgSend(objc_getProperty(selfa, v76, 8, 1), "addPolicy:", v10);
                v78 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v79 = objc_claimAutoreleasedReturnValue();
                v80 = v79;
                if (!v77)
                {
                  v119 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
                  if (v78)
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl(&dword_19BD16000, v80, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v124;
                      _os_log_error_impl(&dword_19BD16000, v80, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);

                    }
                  }

                  v58 = v10;
                  v56 = v11;
LABEL_110:
                  v118 = v134;
LABEL_111:

                  v31 = 0;
                  v11 = v56;
                  goto LABEL_82;
                }
                if (v78)
                {
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_19BD16000, v80, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                  v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v81;
                  _os_log_impl(&dword_19BD16000, v80, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);

                }
                v83 = objc_getProperty(selfa, v82, 16, 1);
                v84 = (void *)MEMORY[0x1E0CB37E8];
                v85 = v83;
                objc_msgSend(v84, "numberWithUnsignedInteger:", v77);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "addObject:", v86);

                v9 = (v75 + 1);
              }
              v9 = (v129 + 3);
              v130 = -[NSObject countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
              if (v130)
                continue;
              break;
            }
          }

          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          v135 = v126;
          v87 = -[NSObject countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
          if (v87)
          {
            v88 = v87;
            v89 = *(_QWORD *)v138;
            while (2)
            {
              v90 = 0;
              v91 = v9;
              do
              {
                v92 = v11;
                v93 = v10;
                if (*(_QWORD *)v138 != v89)
                  objc_enumerationMutation(v135);
                v94 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * v90);
                v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                +[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v94);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "addObject:", v96);

                +[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "addObject:", v97);

                +[NEPolicyResult passWithFlags:](NEPolicyResult, "passWithFlags:", 2);
                v11 = objc_claimAutoreleasedReturnValue();

                v10 = -[NEPolicy initWithOrder:result:conditions:]([NEPolicy alloc], "initWithOrder:result:conditions:", v91 + v90, v11, v95);
                v99 = objc_msgSend(objc_getProperty(selfa, v98, 8, 1), "addPolicy:", v10);
                v100 = nelog_is_debug_logging_enabled();
                ne_log_obj();
                v101 = objc_claimAutoreleasedReturnValue();
                v102 = v101;
                if (!v99)
                {
                  v115 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
                  if (v100)
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (const __CFString *)v10;
                      _os_log_error_impl(&dword_19BD16000, v102, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                      v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v153 = v121;
                      _os_log_error_impl(&dword_19BD16000, v102, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);

                    }
                  }

                  v113 = v135;
                  goto LABEL_80;
                }
                if (v100)
                {
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (const __CFString *)v10;
                    _os_log_debug_impl(&dword_19BD16000, v102, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                {
                  -[NEPolicy descriptionWithIndent:options:](v10, "descriptionWithIndent:options:", 0, 2);
                  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v153 = v103;
                  _os_log_impl(&dword_19BD16000, v102, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);

                }
                v105 = objc_getProperty(selfa, v104, 16, 1);
                v106 = (void *)MEMORY[0x1E0CB37E8];
                v107 = v105;
                objc_msgSend(v106, "numberWithUnsignedInteger:", v99);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "addObject:", v108);

                ++v90;
              }
              while (v88 != v90);
              LODWORD(v9) = v91 + v90;
              v88 = -[NSObject countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
              if (v88)
                continue;
              break;
            }
          }

          v110 = objc_msgSend(objc_getProperty(selfa, v109, 8, 1), "apply");
          ne_log_obj();
          v111 = objc_claimAutoreleasedReturnValue();
          v112 = v111;
          if ((v110 & 1) != 0)
          {
            v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19BD16000, v112, OS_LOG_TYPE_INFO, "Sidecar policies install successful", buf, 2u);
            }

            v31 = 1;
          }
          else
          {
            v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v112, OS_LOG_TYPE_ERROR, "Sidecar policies install failed", buf, 2u);
            }

            v31 = 0;
          }
          v4 = v126;
        }
        else
        {
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "failed to get DNS UUID", buf, 2u);
          }
LABEL_81:
          v31 = 0;
        }
LABEL_82:

      }
      else
      {
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v153 = CFSTR("/usr/libexec/SidecarRelay");
          _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "failed to get sidecarrelay UUID %@", buf, 0xCu);
        }
        v31 = 0;
      }

    }
    else
    {
      ne_log_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v153 = CFSTR("/usr/libexec/rapportd");
        _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "failed to get rapportd UUID %@", buf, 0xCu);
      }
      v31 = 0;
    }

  }
  else
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v153 = (const __CFString *)"-[NEAppSidecarPolicySession installPolicies]";
      _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, "%s called with null self.policySession", buf, 0xCu);
    }
    v31 = 0;
  }

  return v31;
}

- (BOOL)uninstallPolicies
{
  const char *v3;
  BOOL v4;
  SEL v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 8, 1))
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[NEAppSidecarPolicySession uninstallPolicies]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.policySession", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_8;
  }
  v4 = 1;
  objc_msgSend(objc_getProperty(self, v3, 8, 1), "removeAllPolicies");
  if ((objc_msgSend(objc_getProperty(self, v5, 8, 1), "apply") & 1) == 0)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to uninstall Sidecar policies", (uint8_t *)&v8, 2u);
    }
LABEL_8:

    return 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyIDList, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
}

+ (id)connectionIdentifier
{
  return CFSTR("AppleSidecar");
}

@end

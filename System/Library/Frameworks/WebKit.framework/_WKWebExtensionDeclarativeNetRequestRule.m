@implementation _WKWebExtensionDeclarativeNetRequestRule

- (_WKWebExtensionDeclarativeNetRequestRule)initWithDictionary:(id)a3 errorString:(id *)a4
{
  id v6;
  _WKWebExtensionDeclarativeNetRequestRule *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t ruleID;
  id v15;
  _WKWebExtensionDeclarativeNetRequestRule *v16;
  uint64_t v17;
  NSDictionary *action;
  uint64_t v19;
  void *v20;
  NSDictionary *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *condition;
  NSDictionary *v27;
  BOOL v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  id v64;
  id v66;
  void *v67;
  WTF::StringImpl *v68;
  char v69;
  WTF::StringImpl *v70;
  const __CFString *v71;
  int v72;
  void *v73;
  int v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t k;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  _BOOL4 v89;
  BOOL v90;
  id v91;
  BOOL v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  id obj;
  id obja;
  uint64_t objb;
  id objc;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  id v139;
  WTF::StringImpl *v140;
  int v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  id v147;
  id v148;
  objc_super v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[2];
  uint64_t v156;
  uint64_t v157;
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[9];
  _QWORD v161[9];
  _BYTE v162[128];
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD v168[9];
  _QWORD v169[9];
  _QWORD v170[6];
  uint64_t v171;
  uint64_t v172;
  _QWORD v173[4];
  _QWORD v174[4];
  const __CFString *v175;
  _QWORD v176[4];
  _QWORD v177[4];
  _QWORD v178[5];

  v178[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v149.receiver = self;
  v149.super_class = (Class)_WKWebExtensionDeclarativeNetRequestRule;
  v7 = -[_WKWebExtensionDeclarativeNetRequestRule init](&v149, sel_init);

  if (!v7)
    goto LABEL_15;
  if ((_MergedGlobals_36 & 1) == 0)
  {
    v178[0] = CFSTR("id");
    v178[1] = CFSTR("action");
    v178[2] = CFSTR("condition");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 3);
    qword_1ECE71C98 = objc_claimAutoreleasedReturnValue();
    _MergedGlobals_36 = 1;
  }
  if ((byte_1ECE71C89 & 1) == 0)
  {
    v176[0] = CFSTR("id");
    v177[0] = objc_opt_class();
    v176[1] = CFSTR("priority");
    v177[1] = objc_opt_class();
    v176[2] = CFSTR("action");
    v177[2] = objc_opt_class();
    v176[3] = CFSTR("condition");
    v177[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 4);
    qword_1ECE71CA0 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECE71C89 = 1;
  }
  WebKit::objectForKey<NSNumber>(v6, (uint64_t)CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_ruleID = objc_msgSend(v8, "integerValue");

  if (v7->_ruleID)
  {
    v148 = 0;
    v9 = WebKit::validateDictionary(v6, 0, (void *)qword_1ECE71C98, qword_1ECE71CA0, &v148);
    v10 = v148;
    if (!v9)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. %@"), v7->_ruleID, v10);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_100;
    }
    WebKit::objectForKey<NSNumber>(v6, (uint64_t)CFSTR("priority"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "integerValue");
      v7->_priority = v13;
      ruleID = v7->_ruleID;
      if (ruleID >= 1)
      {
        if (v13 <= 0)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. Rule priority must be non-negative."), v7->_ruleID);
            v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
            v16 = 0;
            *a4 = v15;
LABEL_99:

LABEL_100:
            goto LABEL_101;
          }
          goto LABEL_36;
        }
LABEL_20:
        WebKit::objectForKey<NSDictionary>(v6, (uint64_t)CFSTR("action"), 1, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        action = v7->_action;
        v7->_action = (NSDictionary *)v17;

        v175 = CFSTR("type");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v173[0] = CFSTR("type");
        v174[0] = objc_opt_class();
        v173[1] = CFSTR("redirect");
        v174[1] = objc_opt_class();
        v173[2] = CFSTR("requestHeaders");
        v172 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v172, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        v174[2] = v19;
        v173[3] = CFSTR("responseHeaders");
        v171 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v174[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 4);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v7->_action;
        v147 = v10;
        LOBYTE(v19) = WebKit::validateDictionary(v21, 0, v124, v123, &v147);
        v22 = v147;

        v10 = v22;
        if ((v19 & 1) != 0)
        {
          if ((byte_1ECE71C8A & 1) == 0)
          {
            v121 = (void *)MEMORY[0x1E0C99E60];
            v170[0] = CFSTR("allow");
            v170[1] = CFSTR("allowAllRequests");
            v170[2] = CFSTR("block");
            v170[3] = CFSTR("redirect");
            v170[4] = CFSTR("modifyHeaders");
            v170[5] = CFSTR("upgradeScheme");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 6);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "setWithArray:", v100);
            qword_1ECE71CA8 = objc_claimAutoreleasedReturnValue();

            byte_1ECE71C8A = 1;
          }
          v23 = qword_1ECE71CA8;
          -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("type"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v23) = objc_msgSend((id)v23, "containsObject:", v24);

          if ((v23 & 1) != 0)
          {
            WebKit::objectForKey<NSDictionary>(v6, (uint64_t)CFSTR("condition"), 1, 0);
            v25 = objc_claimAutoreleasedReturnValue();
            condition = v7->_condition;
            v7->_condition = (NSDictionary *)v25;

            if ((byte_1ECE71C8B & 1) == 0)
            {
              v168[0] = CFSTR("domainType");
              v169[0] = objc_opt_class();
              v168[1] = CFSTR("domains");
              v167 = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v167, 1);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v169[1] = v122;
              v168[2] = CFSTR("requestDomains");
              v166 = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1);
              objc = (id)objc_claimAutoreleasedReturnValue();
              v169[2] = objc;
              v168[3] = CFSTR("excludedDomains");
              v165 = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v169[3] = v115;
              v168[4] = CFSTR("excludedRequestDomains");
              v164 = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v169[4] = v113;
              v168[5] = CFSTR("isUrlFilterCaseSensitive");
              v169[5] = objc_opt_class();
              v168[6] = CFSTR("regexFilter");
              v169[6] = objc_opt_class();
              v168[7] = CFSTR("resourceTypes");
              v163 = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v163, 1);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v169[7] = v101;
              v168[8] = CFSTR("urlFilter");
              v169[8] = objc_opt_class();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 9);
              qword_1ECE71CB0 = objc_claimAutoreleasedReturnValue();

              byte_1ECE71C8B = 1;
            }
            v27 = v7->_condition;
            v146 = v10;
            v28 = WebKit::validateDictionary(v27, 0, MEMORY[0x1E0C9AA60], (void *)qword_1ECE71CB0, &v146);
            v120 = v146;

            if (!v28)
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. %@"), v7->_ruleID, v120);
                v32 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_42;
              }
LABEL_96:
              v16 = 0;
              goto LABEL_97;
            }
            -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("regexFilter"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("urlFilter"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30 == 0;

              if (!v31)
              {
                if (a4)
                {
                  v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
                  v16 = 0;
                  *a4 = v32;
LABEL_97:
                  v10 = v120;
                  goto LABEL_98;
                }
                goto LABEL_96;
              }
            }
            -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("regexFilter"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (!v36)
            {
LABEL_46:

              -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("urlFilter"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (v38 && (objc_msgSend(v38, "canBeConvertedToEncoding:", 1) & 1) == 0)
              {
                if (a4)
                {
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_96;
              }

              -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("resourceTypes"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("excludedResourceTypes"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v41 == 0;

                if (!v42)
                {
                  if (a4)
                  {
                    v32 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_42;
                  }
                  goto LABEL_96;
                }
              }
              -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("resourceTypes"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44;
              v114 = v44;
              if (v44)
              {
                if (!objc_msgSend(v44, "count"))
                {
                  if (a4)
                  {
                    v66 = (id)objc_claimAutoreleasedReturnValue();
LABEL_106:
                    v16 = 0;
                    *a4 = v66;
LABEL_175:
                    v45 = v114;
                    goto LABEL_176;
                  }
LABEL_107:
                  v16 = 0;
LABEL_176:

                  goto LABEL_97;
                }
                -[_WKWebExtensionDeclarativeNetRequestRule removeInvalidResourceTypesForKey:](v7, "removeInvalidResourceTypesForKey:", CFSTR("resourceTypes"));
              }
              -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("excludedResourceTypes"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46)
                -[_WKWebExtensionDeclarativeNetRequestRule removeInvalidResourceTypesForKey:](v7, "removeInvalidResourceTypesForKey:", CFSTR("resourceTypes"));

              -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("type"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("allowAllRequests"));

              if (!v48)
                goto LABEL_71;
              v45 = v114;
              if (v114)
              {
                v144 = 0u;
                v145 = 0u;
                v142 = 0u;
                v143 = 0u;
                obj = v114;
                v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
                if (v49)
                {
                  v50 = *(_QWORD *)v143;
                  while (2)
                  {
                    for (i = 0; i != v49; ++i)
                    {
                      if (*(_QWORD *)v143 != v50)
                        objc_enumerationMutation(obj);
                      v52 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("main_frame")) & 1) == 0
                        && (objc_msgSend(v52, "isEqualToString:", CFSTR("sub_frame")) & 1) == 0)
                      {
                        if (a4)
                        {
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }

                        goto LABEL_174;
                      }
                    }
                    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
                    if (v49)
                      continue;
                    break;
                  }
                }

LABEL_71:
                -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("domainType"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (v53)
                {
                  -[_WKWebExtensionDeclarativeNetRequestRule _chromeDomainTypeToWebKitDomainType](v7, "_chromeDomainTypeToWebKitDomainType");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "objectForKey:", v53);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = v55 == 0;

                  if (v56)
                  {
                    if (a4)
                    {
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    goto LABEL_174;
                  }
                }

                -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("domains"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = v57;
                if (v57 && (isArrayOfDomainsValid(v57) & 1) == 0)
                {
                  if (a4)
                  {
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                }
                else
                {

                  -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("requestDomains"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v59;
                  if (v59 && (isArrayOfDomainsValid(v59) & 1) == 0)
                  {
                    if (a4)
                    {
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  else
                  {

                    -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("excludedDomains"));
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = v60;
                    if (v60 && (isArrayOfExcludedDomainsValid(v60) & 1) == 0)
                    {
                      if (a4)
                      {
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                    }
                    else
                    {

                      -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("excludedRequestDomains"));
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = v61;
                      if (!v61 || (isArrayOfExcludedDomainsValid(v61) & 1) != 0)
                      {

                        -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("type"));
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("redirect"));

                        if (!v63)
                          goto LABEL_141;
                        -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("redirect"));
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        WebKit::objectForKey<NSString>(v108, (uint64_t)CFSTR("url"), 1);
                        obja = (id)objc_claimAutoreleasedReturnValue();
                        WebKit::objectForKey<NSString>(v108, (uint64_t)CFSTR("extensionPath"), 1);
                        v110 = (void *)objc_claimAutoreleasedReturnValue();
                        WebKit::objectForKey<NSString>(v108, (uint64_t)CFSTR("regexSubstitution"), 1);
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        WebKit::objectForKey<NSDictionary>(v108, (uint64_t)CFSTR("transform"), 0, 0);
                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!obja && !v110 && !v111 && !v109)
                        {
                          if (!a4)
                          {
LABEL_139:
                            v72 = 1;
                            goto LABEL_140;
                          }
                          v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_88:
                          *a4 = v64;
                          goto LABEL_139;
                        }
                        if (obja)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", obja);
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v67)
                          {
                            if (a4)
                            {
LABEL_137:
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v71, v7->_ruleID);
                              *a4 = (id)objc_claimAutoreleasedReturnValue();
                            }
LABEL_138:

                            goto LABEL_139;
                          }
                          MEMORY[0x19AEABB18](&v140, v67);
                          v69 = v141;
                          v70 = v140;
                          v140 = 0;
                          if (v70)
                          {
                            if (*(_DWORD *)v70 == 2)
                              WTF::StringImpl::destroy(v70, v68);
                            else
                              *(_DWORD *)v70 -= 2;
                          }
                          if ((v69 & 2) == 0)
                          {
                            if (a4)
                            {
                              goto LABEL_137;
                            }
                            goto LABEL_138;
                          }

                        }
                        if (v109)
                        {
                          -[NSDictionary objectForKeyedSubscript:](v7->_condition, "objectForKeyedSubscript:", CFSTR("regexFilter"));
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          v89 = v88 == 0;

                          if (v89)
                          {
                            if (!a4)
                              goto LABEL_139;
                            v64 = (id)objc_claimAutoreleasedReturnValue();
                            goto LABEL_88;
                          }
                        }
                        if (v110 && (objc_msgSend(v110, "hasPrefix:", CFSTR("/")) & 1) == 0)
                        {
                          if (!a4)
                            goto LABEL_139;
                          v64 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_88;
                        }
                        if (v111 && !objc_msgSend(v111, "count"))
                        {
                          if (!a4)
                            goto LABEL_139;
                          v64 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_88;
                        }
                        if ((byte_1ECE71C8C & 1) == 0)
                        {
                          v160[0] = CFSTR("fragment");
                          v161[0] = objc_opt_class();
                          v160[1] = CFSTR("host");
                          v161[1] = objc_opt_class();
                          v160[2] = CFSTR("password");
                          v161[2] = objc_opt_class();
                          v160[3] = CFSTR("path");
                          v161[3] = objc_opt_class();
                          v160[4] = CFSTR("port");
                          v161[4] = objc_opt_class();
                          v160[5] = CFSTR("query");
                          v161[5] = objc_opt_class();
                          v160[6] = CFSTR("queryTransform");
                          v161[6] = objc_opt_class();
                          v160[7] = CFSTR("scheme");
                          v161[7] = objc_opt_class();
                          v160[8] = CFSTR("username");
                          v161[8] = objc_opt_class();
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 9);
                          qword_1ECE71CB8 = objc_claimAutoreleasedReturnValue();
                          byte_1ECE71C8C = 1;
                        }
                        if (v111)
                        {
                          v139 = v120;
                          v90 = WebKit::validateDictionary(v111, 0, MEMORY[0x1E0C9AA60], (void *)qword_1ECE71CB8, &v139);
                          v91 = v139;

                          if (!v90)
                          {
                            if (a4)
                            {
                              *a4 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            v72 = 1;
                            v120 = v91;
LABEL_140:

                            if (!v72)
                            {
LABEL_141:
                              -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("type"));
                              v73 = (void *)objc_claimAutoreleasedReturnValue();
                              v74 = objc_msgSend(v73, "isEqual:", CFSTR("modifyHeaders"));

                              if (!v74)
                              {
LABEL_164:
                                v16 = v7;
                                goto LABEL_175;
                              }
                              -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("requestHeaders"));
                              objb = objc_claimAutoreleasedReturnValue();
                              -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("responseHeaders"));
                              v112 = objc_claimAutoreleasedReturnValue();
                              if (objb | v112)
                              {
                                if ((!objb || objc_msgSend((id)objb, "count"))
                                  && (!v112 || objc_msgSend((id)v112, "count")))
                                {
                                  v131 = 0u;
                                  v132 = 0u;
                                  v129 = 0u;
                                  v130 = 0u;
                                  v75 = (id)objb;
                                  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
                                  if (v76)
                                  {
                                    v77 = *(_QWORD *)v130;
                                    while (2)
                                    {
                                      for (j = 0; j != v76; ++j)
                                      {
                                        if (*(_QWORD *)v130 != v77)
                                          objc_enumerationMutation(v75);
                                        -[_WKWebExtensionDeclarativeNetRequestRule _validateHeaderInfoDictionary:](v7, "_validateHeaderInfoDictionary:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j));
                                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                                        v80 = v79;
                                        if (v79)
                                        {
                                          if (a4)
                                            *a4 = objc_retainAutorelease(v79);

                                          goto LABEL_173;
                                        }
                                      }
                                      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
                                      if (v76)
                                        continue;
                                      break;
                                    }
                                  }

                                  v127 = 0u;
                                  v128 = 0u;
                                  v125 = 0u;
                                  v126 = 0u;
                                  v81 = (id)v112;
                                  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
                                  if (v82)
                                  {
                                    v83 = *(_QWORD *)v126;
                                    while (2)
                                    {
                                      for (k = 0; k != v82; ++k)
                                      {
                                        if (*(_QWORD *)v126 != v83)
                                          objc_enumerationMutation(v81);
                                        -[_WKWebExtensionDeclarativeNetRequestRule _validateHeaderInfoDictionary:](v7, "_validateHeaderInfoDictionary:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k));
                                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                                        v86 = v85;
                                        if (v85)
                                        {
                                          if (a4)
                                            *a4 = objc_retainAutorelease(v85);

                                          goto LABEL_174;
                                        }
                                      }
                                      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
                                      if (v82)
                                        continue;
                                      break;
                                    }
                                  }

                                  goto LABEL_164;
                                }
                                if (!a4)
                                  goto LABEL_173;
                                v87 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                if (!a4)
                                {
LABEL_173:

                                  goto LABEL_174;
                                }
                                v87 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              *a4 = v87;
                              goto LABEL_173;
                            }
LABEL_174:
                            v16 = 0;
                            goto LABEL_175;
                          }
                          v120 = v91;
                        }
                        WebKit::objectForKey<NSDictionary>(v111, (uint64_t)CFSTR("queryTransform"), 0, 0);
                        v107 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v107 && !objc_msgSend(v107, "count"))
                        {
                          if (a4)
                          {
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          v72 = 1;
                        }
                        else
                        {
                          if ((byte_1ECE71C8D & 1) == 0)
                          {
                            v158[0] = CFSTR("addOrReplaceParams");
                            v157 = objc_opt_class();
                            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v157, 1);
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            v159[0] = v102;
                            v158[1] = CFSTR("removeParams");
                            v156 = objc_opt_class();
                            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 1);
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            v159[1] = v103;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 2);
                            qword_1ECE71CC0 = objc_claimAutoreleasedReturnValue();

                            byte_1ECE71C8D = 1;
                          }
                          if (!v107)
                            goto LABEL_196;
                          v138 = v120;
                          v92 = WebKit::validateDictionary(v107, 0, MEMORY[0x1E0C9AA60], (void *)qword_1ECE71CC0, &v138);
                          v93 = v138;

                          if (v92)
                          {
                            v120 = v93;
LABEL_196:
                            objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("removeParams"));
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v105 && !objc_msgSend(v105, "count"))
                            {
                              if (a4)
                              {
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              v72 = 1;
                            }
                            else
                            {
                              if ((byte_1ECE71C8E & 1) == 0)
                              {
                                v155[0] = CFSTR("key");
                                v155[1] = CFSTR("value");
                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 2);
                                qword_1ECE71CC8 = objc_claimAutoreleasedReturnValue();
                                byte_1ECE71C8E = 1;
                              }
                              if ((byte_1ECE71C8F & 1) == 0)
                              {
                                v153[0] = CFSTR("key");
                                v154[0] = objc_opt_class();
                                v153[1] = CFSTR("value");
                                v154[1] = objc_opt_class();
                                v153[2] = CFSTR("replaceOnly");
                                v154[2] = objc_opt_class();
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 3);
                                qword_1ECE71CD0 = (void *)objc_claimAutoreleasedReturnValue();
                                byte_1ECE71C8F = 1;
                              }
                              objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("addOrReplaceParams"));
                              v104 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v104 && !objc_msgSend(v104, "count"))
                              {
                                if (a4)
                                {
                                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                v72 = 1;
                              }
                              else
                              {
                                v136 = 0u;
                                v137 = 0u;
                                v134 = 0u;
                                v135 = 0u;
                                v106 = v104;
                                v94 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
                                if (v94)
                                {
                                  v95 = *(_QWORD *)v135;
                                  while (2)
                                  {
                                    v96 = 0;
                                    v97 = v120;
                                    do
                                    {
                                      if (*(_QWORD *)v135 != v95)
                                        objc_enumerationMutation(v106);
                                      v98 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v96);
                                      v133 = v97;
                                      v99 = WebKit::validateDictionary(v98, 0, (void *)qword_1ECE71CC8, qword_1ECE71CD0, &v133);
                                      v120 = v133;

                                      if (!v99)
                                      {
                                        if (a4)
                                        {
                                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                                        }
                                        v72 = 1;
                                        goto LABEL_234;
                                      }
                                      ++v96;
                                      v97 = v120;
                                    }
                                    while (v94 != v96);
                                    v94 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
                                    if (v94)
                                      continue;
                                    break;
                                  }
                                }
                                v72 = 0;
LABEL_234:

                              }
                            }

                            goto LABEL_243;
                          }
                          if (a4)
                          {
                            *a4 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          v72 = 1;
                          v120 = v93;
                        }
LABEL_243:

                        goto LABEL_140;
                      }
                      if (a4)
                      {
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                    }
                  }
                }

                goto LABEL_174;
              }
              if (a4)
              {
                v66 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_106;
              }
              goto LABEL_107;
            }
            if ((objc_msgSend(v36, "canBeConvertedToEncoding:", 1) & 1) != 0)
            {
              if (+[WKContentRuleList _supportsRegularExpression:](WKContentRuleList, "_supportsRegularExpression:", v37))
              {
                goto LABEL_46;
              }
              if (a4)
              {
                goto LABEL_94;
              }
            }
            else if (a4)
            {
LABEL_94:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v43, v7->_ruleID);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_96;
          }
          if (a4)
          {
            v33 = (void *)MEMORY[0x1E0CB3940];
            v34 = v7->_ruleID;
            -[NSDictionary objectForKeyedSubscript:](v7->_action, "objectForKeyedSubscript:", CFSTR("type"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. %@"), v7->_ruleID, v22);
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:

          goto LABEL_99;
        }
        v16 = 0;
        goto LABEL_98;
      }
    }
    else
    {
      v7->_priority = 1;
      ruleID = v7->_ruleID;
      if (ruleID > 0)
        goto LABEL_20;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. Rule id must be non-negative."), ruleID);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
LABEL_36:
    v16 = 0;
    goto LABEL_99;
  }
  if (a4)
  {
    v16 = 0;
    *a4 = CFSTR("Missing rule id.");
  }
  else
  {
LABEL_15:
    v16 = 0;
  }
LABEL_101:

  return v16;
}

- (id)_validateHeaderInfoDictionary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  char v17;
  const __CFString *v18;
  void *v19;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((byte_1ECE71C90 & 1) == 0)
  {
    v24[0] = CFSTR("header");
    v24[1] = CFSTR("operation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    qword_1ECE71CD8 = objc_claimAutoreleasedReturnValue();
    byte_1ECE71C90 = 1;
  }
  if (byte_1ECE71C91 == 1)
  {
    v5 = (void *)qword_1ECE71CE0;
  }
  else
  {
    v22[0] = CFSTR("header");
    v23[0] = objc_opt_class();
    v22[1] = CFSTR("operation");
    v23[1] = objc_opt_class();
    v22[2] = CFSTR("value");
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    qword_1ECE71CE0 = (uint64_t)v5;
    byte_1ECE71C91 = 1;
  }
  v21 = 0;
  v6 = WebKit::validateDictionary(v4, 0, (void *)qword_1ECE71CD8, v5, &v21);
  v7 = v21;
  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("set"));
    v10 = objc_msgSend(v8, "isEqual:", CFSTR("append"));
    v11 = objc_msgSend(v8, "isEqual:", CFSTR("remove"));
    if (((v9 | v10 | v11) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(&unk_1E356F678, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = v11;
    else
      v17 = 0;
    if ((v17 & 1) != 0)
    {
      v18 = CFSTR("Rule with id %ld is invalid. Do not provide a value when removing a header.");
    }
    else
    {
      if ((v9 & 1) != 0)
      {
        if (v15)
        {
          v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        v19 = 0;
        if (!v10 || v15)
          goto LABEL_23;
      }
      v18 = CFSTR("Rule with id %ld is invalid. You must provide a value when modifying a header.");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v18, self->_ruleID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rule with id %ld is invalid. One of the headers dictionaries is not formatted correctly. %@"), self->_ruleID, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v19;
}

- (void)removeInvalidResourceTypesForKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *condition;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77___WKWebExtensionDeclarativeNetRequestRule_removeInvalidResourceTypesForKey___block_invoke;
  v10[3] = &unk_1E34AACC8;
  v10[4] = self;
  WebKit::mapObjects<NSArray>(v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 != objc_msgSend(v4, "count"))
  {
    v7 = (NSDictionary *)-[NSDictionary mutableCopy](self->_condition, "mutableCopy");
    -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, v9);
    condition = self->_condition;
    self->_condition = v7;

  }
}

- (NSArray)ruleInWebKitFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  if ((byte_1ECE71C92 & 1) == 0)
  {
    v12[0] = CFSTR("allow");
    v12[1] = CFSTR("allowAllRequests");
    v13[0] = CFSTR("ignore-previous-rules");
    v13[1] = CFSTR("ignore-previous-rules");
    v12[2] = CFSTR("block");
    v12[3] = CFSTR("modifyHeaders");
    v13[2] = CFSTR("block");
    v13[3] = CFSTR("modify-headers");
    v12[4] = CFSTR("redirect");
    v12[5] = CFSTR("upgradeScheme");
    v13[4] = CFSTR("redirect");
    v13[5] = CFSTR("make-https");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
    qword_1ECE71CE8 = objc_claimAutoreleasedReturnValue();
    byte_1ECE71C92 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECE71CE8;
  -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("make-https")))
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _convertedRulesForWebKitActionType:chromeActionType:](self, "_convertedRulesForWebKitActionType:chromeActionType:", CFSTR("ignore-previous-rules"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  -[_WKWebExtensionDeclarativeNetRequestRule _convertedRulesForWebKitActionType:chromeActionType:](self, "_convertedRulesForWebKitActionType:chromeActionType:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (id)_convertedRulesForWebKitActionType:(id)a3 chromeActionType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionDeclarativeNetRequestRule _allChromeResourceTypes](self, "_allChromeResourceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_msgSend(v10, "containsObject:", CFSTR("main_frame"));
  v12 = objc_msgSend(v10, "containsObject:", CFSTR("sub_frame"));
  if (((v11 | v12) & 1) != 0)
  {
    v13 = &unk_1E356F618;
    if ((v11 & v12) != 0)
      v13 = &unk_1E356F600;
    if (v11)
      v14 = v13;
    else
      v14 = &unk_1E356F630;
    -[_WKWebExtensionDeclarativeNetRequestRule _webKitRuleWithWebKitActionType:chromeActionType:chromeResourceTypes:](self, "_webKitRuleWithWebKitActionType:chromeActionType:chromeResourceTypes:", v6, v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

  }
  objc_msgSend(v10, "removeObjectsInArray:", &unk_1E356F648);
  if (objc_msgSend(v10, "count"))
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _webKitRuleWithWebKitActionType:chromeActionType:chromeResourceTypes:](self, "_webKitRuleWithWebKitActionType:chromeActionType:chromeResourceTypes:", v6, v7, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

  }
  v17 = (void *)objc_msgSend(v8, "copy");

  return v17;
}

- (id)_webKitRuleWithWebKitActionType:(id)a3 chromeActionType:(id)a4 chromeResourceTypes:(id)a5
{
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v59;
  void *v60;
  __CFString *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  const __CFString *v69;
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  const __CFString *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v8 = a4;
  v63 = a5;
  v66 = v8;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("allowAllRequests"));
  if ((v9 & 1) != 0)
  {
    v65 = 0;
    v10 = CFSTR(".*");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("urlFilter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionDeclarativeNetRequestRule _regexURLFilterForChromeURLFilter:](self, "_regexURLFilterForChromeURLFilter:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v10 = v12;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("regexFilter"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (__CFString *)v14;
      else
        v16 = CFSTR(".*");
      v10 = v16;

    }
    -[_WKWebExtensionDeclarativeNetRequestRule _convertedResourceTypesForChromeResourceTypes:](self, "_convertedResourceTypesForChromeResourceTypes:", v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v73 = CFSTR("type");
  v74[0] = v62;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v9;
  v61 = (__CFString *)v10;
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("isUrlFilterCaseSensitive"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x1E0C9AAA0];
  if (v20)
    v22 = (void *)v20;
  v64 = v22;

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("url-filter"));
  if (objc_msgSend(v64, "BOOLValue"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v64, CFSTR("url-filter-is-case-sensitive"));
  v71[0] = CFSTR("action");
  v71[1] = CFSTR("trigger");
  v72[0] = v18;
  v72[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "isEqualToString:", CFSTR("modifyHeaders")))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("requestHeaders"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("responseHeaders"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("request-headers"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("response-headers"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_priority);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("priority"));

  }
  if (objc_msgSend(v66, "isEqualToString:", CFSTR("redirect")))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("redirect"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("url"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("url"));

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("regexSubstitution"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("regex-substitution"));

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("extensionPath"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("extension-path"));

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("transform"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("queryTransform"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("addOrReplaceParams"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("removeParams"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("query-transform"));
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("queryTransform"));
    WebKit::mapObjects<NSArray>(v34, &__block_literal_global);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("add-or-replace-parameters"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, CFSTR("addOrReplaceParams"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("remove-parameters"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, CFSTR("removeParams"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("transform"));
    v21 = v36;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("redirect"));

  }
  if (v65)
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _chromeResourceTypeToWebKitLoadContext](self, "_chromeResourceTypeToWebKitLoadContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_2;
    v67[3] = &unk_1E34AAD30;
    v38 = v37;
    v68 = v38;
    WebKit::mapObjects<NSArray>(v63, v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v21, "count");
    v40 = v65;
    if (v39)
    {
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("load-context"));
      v40 = &unk_1E356F660;
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v40, CFSTR("resource-type"));

  }
  -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("domainType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _chromeDomainTypeToWebKitDomainType](self, "_chromeDomainTypeToWebKitDomainType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", v41);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v43, CFSTR("load-type"));

  }
  -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("domains"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    WebKit::mapObjects<NSArray>(v44, &__block_literal_global_228);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v46, CFSTR("if-domain"));
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("requestDomains"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v47;
    if (v47)
    {
      WebKit::mapObjects<NSArray>(v47, &__block_literal_global_228);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v48, CFSTR("if-domain"));
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("excludedDomains"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v49;
      if (v49)
      {
        WebKit::mapObjects<NSArray>(v49, &__block_literal_global_228);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("unless-domain"));
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("excludedRequestDomains"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v50;
        if (v50)
        {
          WebKit::mapObjects<NSArray>(v50, &__block_literal_global_228);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v51, CFSTR("unless-domain"));

        }
      }

    }
  }

  if (v59)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("urlFilter"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionDeclarativeNetRequestRule _regexURLFilterForChromeURLFilter:](self, "_regexURLFilterForChromeURLFilter:", v52);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (!v53)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("regexFilter"));
      v55 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v55;
      v54 = &stru_1E351F1B8;
      if (v55)
        v54 = (const __CFString *)v55;
    }
    v69 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v56, CFSTR("if-top-url"));

    if (!v53)
  }
  v57 = (void *)objc_msgSend(v60, "copy");

  return v57;
}

- (id)_chromeResourceTypeToWebKitLoadContext
{
  return &unk_1E356F708;
}

- (id)_chromeDomainTypeToWebKitDomainType
{
  return &unk_1E356F730;
}

- (id)_chromeResourceTypeToWebKitResourceType
{
  return &unk_1E356F758;
}

- (id)_resourcesToTargetWhenNoneAreSpecifiedInRule
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
  if (!-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame)
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _chromeResourceTypeToWebKitResourceType](self, "_chromeResourceTypeToWebKitResourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("main_frame"));
    objc_msgSend(v5, "allKeys");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
    -[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame = v6;

    v3 = (void *)-[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule]::resourceTypesExceptMainFrame;
  }
  return v3;
}

- (id)_allChromeResourceTypes
{
  NSDictionary **p_condition;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_condition = &self->_condition;
  -[NSDictionary objectForKeyedSubscript:](self->_condition, "objectForKeyedSubscript:", CFSTR("resourceTypes"));
  v4 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](*p_condition, "objectForKeyedSubscript:", CFSTR("excludedResourceTypes"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    if (!v4)
    {
      -[_WKWebExtensionDeclarativeNetRequestRule _chromeResourceTypeToWebKitResourceType](self, "_chromeResourceTypeToWebKitResourceType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = (id)v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      objc_msgSend(v7, "allKeys");
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = v12;
    }
  }
  else
  {
    -[_WKWebExtensionDeclarativeNetRequestRule _resourcesToTargetWhenNoneAreSpecifiedInRule](self, "_resourcesToTargetWhenNoneAreSpecifiedInRule");
    v4 = objc_claimAutoreleasedReturnValue();
  }

  return (id)v4;
}

- (id)_convertedResourceTypesForChromeResourceTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_WKWebExtensionDeclarativeNetRequestRule _chromeResourceTypeToWebKitResourceType](self, "_chromeResourceTypeToWebKitResourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90___WKWebExtensionDeclarativeNetRequestRule__convertedResourceTypesForChromeResourceTypes___block_invoke;
  v9[3] = &unk_1E34AAD30;
  v10 = v5;
  v6 = v5;
  WebKit::mapObjects<NSArray>(v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_regexURLFilterForChromeURLFilter:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSString *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v6 = 0;
    goto LABEL_18;
  }
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("||"));
  if (v4)
  {
    objc_msgSend(v3, "substringFromIndex:", 2);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("|")))
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "substringFromIndex:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  v8 = v4 ^ 1;

  v3 = v7;
LABEL_9:
  v10 = objc_msgSend(v3, "hasSuffix:", CFSTR("|"));
  if (v10)
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v11;
  }
  WebKit::escapeCharactersInString((WebKit *)v3, CFSTR("?+[(){}$|\\."), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), CFSTR(".*"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("^"), CFSTR("[^a-zA-Z0-9_.%-]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(CFSTR("^[^:]+://+([^:/]+\\.)?"), "stringByAppendingString:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v15;
    if (!v8)
      goto LABEL_13;
  }
  else
  {
    v6 = v14;
    if (!v8)
    {
LABEL_13:
      if (!v10)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  objc_msgSend(CFSTR("^"), "stringByAppendingString:", v6);
  v16 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v16;
  if (v10)
  {
LABEL_17:
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("$"));
    v17 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v17;
  }
LABEL_18:

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t priority;
  int64_t v6;
  int64_t v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;

  v4 = a3;
  priority = self->_priority;
  if (priority >= objc_msgSend(v4, "priority"))
  {
    v7 = self->_priority;
    if (v7 > objc_msgSend(v4, "priority"))
    {
      v6 = 1;
      goto LABEL_7;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = priorityForRuleType(v8);
    objc_msgSend(v4, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = priorityForRuleType(v11);

    if (v9 >= v12)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_action, "objectForKeyedSubscript:", CFSTR("type"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = priorityForRuleType(v13);
      objc_msgSend(v4, "action");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("type"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = v14 > priorityForRuleType(v16);

      goto LABEL_7;
    }
  }
  v6 = -1;
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSDictionary *action;
  NSDictionary *condition;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v12[0] = CFSTR("id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_ruleID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_priority);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  condition = self->_condition;
  v13[1] = v6;
  v13[2] = action;
  v12[2] = CFSTR("action");
  v12[3] = CFSTR("condition");
  v13[3] = condition;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)ruleID
{
  return self->_ruleID;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSDictionary)action
{
  return self->_action;
}

- (NSDictionary)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end

@implementation MCMCommandReplaceContainer

- (MCMCommandReplaceContainer)initWithConcreteContainerIdentityOld:(id)a3 concreteContainerIdentityNew:(id)a4 preserveOldPathIdentifier:(BOOL)a5 preserveOldInternalUUID:(BOOL)a6 asyncReclaim:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  id v16;
  id v17;
  MCMCommandReplaceContainer *v18;
  MCMCommandReplaceContainer *v19;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MCMCommandReplaceContainer;
  v18 = -[MCMCommand initWithContext:resultPromise:](&v21, sel_initWithContext_resultPromise_, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_containerIdentityOld, a3);
    objc_storeStrong((id *)&v19->_containerIdentityNew, a4);
    v19->_preserveOldPathIdentifier = a5;
    v19->_preserveOldInternalUUID = a6;
    v19->_asyncReclaim = a7;
  }

  return v19;
}

- (MCMCommandReplaceContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandReplaceContainer *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *containerIdentityOld;
  uint64_t v12;
  MCMConcreteContainerIdentity *containerIdentityNew;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReplaceContainer;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "containerIdentityOld");
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentityOld = v9->_containerIdentityOld;
    v9->_containerIdentityOld = (MCMConcreteContainerIdentity *)v10;

    objc_msgSend(v8, "containerIdentityNew");
    v12 = objc_claimAutoreleasedReturnValue();
    containerIdentityNew = v9->_containerIdentityNew;
    v9->_containerIdentityNew = (MCMConcreteContainerIdentity *)v12;

    v9->_preserveOldPathIdentifier = 0;
    v9->_preserveOldInternalUUID = 0;
    v9->_asyncReclaim = 1;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToReplaceContainers");

  return v4;
}

- (void)execute
{
  MCMCommandReplaceContainer *v2;
  uint64_t v3;
  MCMError *v4;
  MCMError *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  MCMError *v15;
  MCMCommandReplaceContainer *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  MCMError *v21;
  MCMError *v22;
  NSObject *v23;
  void *v24;
  MCMError *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  MCMError *v34;
  MCMError *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  MCMError *v41;
  id v42;
  char v43;
  MCMError *v44;
  MCMCommandReplaceContainer *v45;
  void *v46;
  void *v47;
  char v48;
  MCMError *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  MCMError *v55;
  void *v56;
  void *v57;
  char v58;
  char v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  MCMCommandOperationReclaimDiskSpace *v66;
  void *v67;
  NSObject *v68;
  MCMResultWithContainerBase *v69;
  uint64_t v70;
  void *v71;
  MCMError *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  NSObject *v76;
  void *v77;
  char v78;
  MCMError *v79;
  void *v80;
  void *v81;
  MCMError *v82;
  int v83;
  MCMError *v84;
  MCMError *v85;
  MCMError *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  MCMError *v97;
  void *v98;
  char v99;
  MCMError *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  MCMError *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  MCMError *v113;
  NSObject *v114;
  MCMError *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  MCMError *v119;
  NSObject *v120;
  void *v121;
  MCMError *v122;
  MCMError *v123;
  uint64_t v124;
  NSObject *v125;
  void *v126;
  BOOL v127;
  MCMError *v128;
  NSObject *v129;
  void *v130;
  MCMError *v131;
  MCMError *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  char v140;
  MCMError *v141;
  void *v142;
  void *v143;
  char v144;
  char v145;
  MCMError *v146;
  MCMError *v147;
  MCMError *v148;
  uint64_t v149;
  uint64_t v150;
  int v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  char v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  MCMError *v162;
  id v163;
  MCMError *v164;
  void *v165;
  void *v166;
  void *v167;
  MCMError *v168;
  MCMError *v169;
  int v170;
  void *v171;
  MCMError *v172;
  MCMError *v173;
  void *v174;
  void *v175;
  void *v176;
  MCMError *v177;
  MCMError *v178;
  int v179;
  int v180;
  int v181;
  MCMError *v182;
  void *v183;
  MCMError *v184;
  MCMError *v185;
  unsigned int v186;
  void *v187;
  void *v188;
  MCMError *v189;
  MCMError *v190;
  uint64_t v191;
  char v192;
  void *v193;
  void *v194;
  MCMCommandReplaceContainer *v195;
  MCMCommandReplaceContainer *v196;
  void *v197;
  MCMError *v198;
  MCMError *v199;
  void *v200;
  void *v201;
  MCMError *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  _BOOL4 v209;
  MCMError *v210;
  uint64_t v211;
  uint64_t v212;
  MCMError *v213;
  MCMError *v214;
  void *context;
  void *v216;
  MCMError *v217;
  MCMError *v218;
  void *v219;
  void *v220;
  MCMError *v221;
  MCMError *v222;
  void *v223;
  MCMError *v224;
  MCMError *v225;
  MCMError *v226;
  MCMError *v227;
  void *v228;
  void *v229;
  MCMError *v230;
  MCMError *v231;
  id v232;
  id v233[2];
  _QWORD v234[4];
  id v235;
  id v236;
  MCMError *v237;
  MCMError *v238;
  MCMError *v239;
  id v240;
  MCMError *v241;
  MCMError *v242;
  id v243;
  MCMError *v244;
  MCMError *v245;
  MCMError *v246;
  id v247;
  uint8_t buf[4];
  MCMError *v249;
  __int16 v250;
  MCMError *v251;
  __int16 v252;
  uint64_t v253;
  __int16 v254;
  void *v255;
  __int16 v256;
  void *v257;
  __int16 v258;
  uint64_t v259;
  uint64_t v260;

  v2 = self;
  v260 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandReplaceContainer containerIdentityNew](v2, "containerIdentityNew");
  v4 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandReplaceContainer containerIdentityOld](v2, "containerIdentityOld");
  v5 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError uuid](v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = -[MCMError containerClass](v4, "containerClass");
  v7 = -[MCMError containerClass](v5, "containerClass");
  -[MCMError identifier](v4, "identifier");
  v218 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError identifier](v5, "identifier");
  v217 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError userIdentity](v4, "userIdentity");
  v226 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError userIdentity](v5, "userIdentity");
  v227 = (MCMError *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = -[MCMCommandReplaceContainer preserveOldPathIdentifier](v2, "preserveOldPathIdentifier");
    v209 = -[MCMCommandReplaceContainer preserveOldInternalUUID](v2, "preserveOldInternalUUID");
  }
  else
  {
    v8 = 0;
    v209 = 0;
  }
  v9 = containermanager_copy_global_configuration();
  objc_msgSend(v9, "managedPathRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containermanagerReplaceOperations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v216 = v11;
  objc_msgSend(v11, "url");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)v3;
  if (!v219)
  {
    v204 = v7;
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 84);
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to get url for storing replace operations.", buf, 2u);
    }
    v24 = 0;
    v221 = 0;
    v225 = 0;
    v220 = 0;
    v228 = 0;
    v229 = 0;
    v25 = 0;
    v26 = 0;
LABEL_37:

    if (!v6)
      goto LABEL_75;
    goto LABEL_38;
  }
  if (v6)
  {
    if (v7 == v211)
    {
      if (-[MCMError isEqual:](v227, "isEqual:", v226))
      {
        v205 = v6;
        -[MCMCommand context](v2, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "containerCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = 0;
        objc_msgSend(v13, "entryForContainerIdentity:error:", v5, &v247);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (MCMError *)v247;

        if (v14)
        {
          v204 = v7;
          v16 = v2;
          -[NSObject uuid](v14, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMError uuid](v5, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) != 0)
          {
            v246 = v15;
            -[NSObject metadataWithError:](v14, "metadataWithError:", &v246);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v246;

            v6 = v205;
            v207 = (void *)v20;
            if (v20)
            {

              v2 = v16;
              v22 = v4;
              goto LABEL_22;
            }
            v15 = v21;
          }
          else
          {
            v55 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 21, 3);

            v14 = 0;
            v15 = v55;
            v6 = v205;
          }
          v2 = v16;
        }
        else
        {
          v6 = v205;
        }
        container_log_handle_for_category();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v5;
          v250 = 2112;
          v251 = v15;
          _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, "No Container with identity: %@; error = %@",
            buf,
            0x16u);
        }

        v220 = 0;
        v221 = 0;
        v26 = 0;
        v213 = 0;
        v228 = 0;
        v229 = 0;
        v225 = 0;
        v24 = 0;
        goto LABEL_70;
      }
      v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 76);
      container_log_handle_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v220 = 0;
        v221 = 0;
        v26 = 0;
        v213 = 0;
        v228 = 0;
        v229 = 0;
        v225 = 0;
        v24 = 0;
LABEL_70:

        goto LABEL_71;
      }
      *(_DWORD *)buf = 138412546;
      v249 = v227;
      v250 = 2112;
      v251 = v226;
      v28 = "Can't replace containers of different personas: %@ and %@";
    }
    else
    {
      v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 23);
      container_log_handle_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 134218240;
      v249 = (MCMError *)v7;
      v250 = 2048;
      v251 = (MCMError *)v211;
      v28 = "Can't replace containers of different class types: %ld and %ld";
    }
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_31;
  }
  if (v8)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 11);
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Can't have a nil oldContainerUUID when preserving the UUID", buf, 2u);
    }
    v220 = 0;
    v221 = 0;
    v26 = 0;
    v25 = 0;
    v228 = 0;
    v229 = 0;
    v225 = 0;
    v24 = 0;
    goto LABEL_73;
  }
  v204 = v7;
  v205 = 0;
  v22 = v4;
  v207 = 0;
  v21 = 0;
LABEL_22:
  -[MCMCommand context](v2, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "containerCache");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = v21;
  objc_msgSend(v30, "entryForContainerIdentity:error:", v22, &v245);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v245;

  if (!v24)
  {
LABEL_34:
    v6 = v205;
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = v207;
    v4 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v22;
      v250 = 2112;
      v251 = v15;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "No Container with identity: %@; error = %@",
        buf,
        0x16u);
    }
    v221 = 0;
    v225 = 0;
    v220 = 0;
    v228 = 0;
    v229 = 0;
    v25 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v24, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMError uuid](v22, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqual:", v32);

  if ((v33 & 1) == 0)
  {
    v35 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 21, 3);

    v24 = 0;
    goto LABEL_33;
  }
  v244 = v15;
  objc_msgSend(v24, "metadataWithError:", &v244);
  v34 = (MCMError *)objc_claimAutoreleasedReturnValue();
  v35 = v244;

  if (!v34)
  {
LABEL_33:
    v15 = v35;
    goto LABEL_34;
  }
  v190 = v35;
  v202 = v5;
  v203 = v24;
  v198 = v22;
  v36 = -[MCMError transient](v34, "transient");
  v6 = v205;
  if (v207)
  {
    -[MCMError containerPath](v34, "containerPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "containerPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (v39)
    {
      v25 = v34;
      v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 22);

      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      v4 = v198;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v147 = v25;
        -[MCMError containerPath](v25, "containerPath");
        v148 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v249 = v148;
        _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Can't replace the same container at %@", buf, 0xCu);

        v25 = v147;
      }
      v221 = 0;
      v225 = 0;
      v220 = 0;
      v228 = 0;
      v229 = 0;
      v26 = v207;
      v24 = v203;
      goto LABEL_37;
    }
  }
  v196 = v2;
  -[MCMCommand context](v2, "context");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "clientIdentity");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "platform");
  -[MCMError containerClass](v34, "containerClass");
  -[MCMError transient](v34, "transient");
  v58 = container_class_supports_randomized_path();

  v59 = v58 ^ 1;
  if (v205)
    v60 = v58 ^ 1 | v8;
  else
    v60 = v8;
  v214 = v34;
  -[MCMError containerPath](v34, "containerPath");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "containerRootURL");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "lastPathComponent");
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v207;
  v4 = v198;
  if ((v59 & 1) == 0)
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v220);
    if (!v63)
    {
      v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[MCMError containerPath](v214, "containerPath");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "containerRootURL");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "path");
        v168 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v249 = v168;
        _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Invalid URL (last path component not UUID): %@", buf, 0xCu);

        v26 = v207;
        v25 = v214;
        v221 = 0;
        v225 = 0;
        v228 = 0;
        v229 = 0;
        v2 = v196;
        goto LABEL_37;
      }
      v221 = 0;
      v225 = 0;
      v228 = 0;
      v229 = 0;
      v2 = v196;
      goto LABEL_97;
    }

  }
  objc_msgSend(v207, "containerPath");
  v64 = objc_claimAutoreleasedReturnValue();
  if ((v60 & 1) != 0)
  {
    v221 = 0;
    v2 = v196;
    goto LABEL_100;
  }
  v225 = (MCMError *)v64;
  v74 = (void *)objc_opt_class();
  v2 = v196;
  v75 = v36;
  if (objc_msgSend(v207, "transient"))
    v74 = (void *)objc_opt_class();
  objc_msgSend(v74, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v226, v211, v220);
  v76 = objc_claimAutoreleasedReturnValue();
  -[NSObject containerClassPath](v76, "containerClassPath");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v243 = 0;
  v78 = objc_msgSend(v77, "createIfNecessaryWithError:", &v243);
  v79 = (MCMError *)v243;

  v221 = v79;
  if ((v78 & 1) == 0)
  {
    v86 = [MCMError alloc];
    -[NSObject containerClassPath](v76, "containerClassPath");
    v87 = v76;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "classURL");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCMError initWithNSError:url:defaultErrorType:](v86, "initWithNSError:url:defaultErrorType:", v79, v89, 3);

    container_log_handle_for_category();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = (MCMError *)v87;
      v250 = 2112;
      v251 = v79;
      _os_log_error_impl(&dword_1CF807000, v90, OS_LOG_TYPE_ERROR, "Failed to create class path dir for %@: %@", buf, 0x16u);
    }

    v228 = 0;
    v229 = 0;
    v23 = v87;
    v26 = v207;
    goto LABEL_97;
  }

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject containerRootURL](v76, "containerRootURL");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (MCMError *)v76;
  v83 = objc_msgSend(v80, "itemExistsAtURL:", v81);

  if (v83)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 27);

    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[MCMError containerRootURL](v82, "containerRootURL");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "path");
      v172 = (MCMError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v249 = v172;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Container already exists at %@", buf, 0xCu);

      v26 = v207;
    }
    v228 = 0;
    v229 = 0;
    v225 = v82;
LABEL_97:
    v24 = v203;
    goto LABEL_98;
  }
  v64 = (uint64_t)v82;
  v36 = v75;
LABEL_100:
  v225 = (MCMError *)v64;
  if (!v205)
  {
    -[MCMError identityByChangingTransient:](v198, "identityByChangingTransient:", 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "containerIdentity");
    v27 = objc_claimAutoreleasedReturnValue();

    -[MCMCommand context](v2, "context");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "containerCache");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = v190;
    objc_msgSend(v111, "entryForContainerIdentity:error:", v27, &v242);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v242;

    if (v112)
    {
      v113 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 27);

      container_log_handle_for_category();
      v114 = objc_claimAutoreleasedReturnValue();
      v24 = v203;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        -[MCMError identifier](v214, "identifier");
        v169 = (MCMError *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend(v207, "transient");
        *(_DWORD *)buf = 138412802;
        v249 = v169;
        v250 = 2048;
        v251 = (MCMError *)v211;
        v252 = 1024;
        LODWORD(v253) = v170;
        _os_log_error_impl(&dword_1CF807000, v114, OS_LOG_TYPE_ERROR, "Container with identifier: %@, class: %ld, transient: %d already exists", buf, 0x1Cu);

      }
      v15 = v113;
    }
    else
    {
      v24 = v203;
      if (-[MCMError type](v15, "type") == 21)
      {

        container_log_handle_for_category();
        v120 = objc_claimAutoreleasedReturnValue();
        v2 = v196;
        v25 = v214;
        if (os_signpost_enabled(v120))
        {
          -[MCMError containerPath](v214, "containerPath");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "containerPathIdentifier");
          v122 = (MCMError *)objc_claimAutoreleasedReturnValue();
          -[MCMError identifier](v214, "identifier");
          v123 = (MCMError *)objc_claimAutoreleasedReturnValue();
          v124 = -[MCMError containerClass](v214, "containerClass");
          *(_DWORD *)buf = 138478339;
          v249 = v122;
          v250 = 2113;
          v251 = v123;
          v252 = 2050;
          v253 = v124;
          _os_signpost_emit_with_name_impl(&dword_1CF807000, v120, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PromotingTransientContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu ", buf, 0x20u);

          v25 = v214;
        }

        v228 = 0;
        v229 = 0;
        v15 = 0;
        v26 = v207;
        goto LABEL_141;
      }
    }
    v2 = v196;
    v25 = v214;

    v228 = 0;
    v229 = 0;
    v26 = v207;
    goto LABEL_73;
  }
  v186 = v36;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "UUIDString");
  v92 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v207, "containerPath");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "containerRootURL");
  v185 = (MCMError *)objc_claimAutoreleasedReturnValue();

  -[MCMError containerPath](v214, "containerPath");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "containerRootURL");
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v92);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "URLWithString:relativeToURL:", v96, v219);
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:](MCMContainerStagingPath, "stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:", v225, v92);
  v97 = (MCMError *)objc_claimAutoreleasedReturnValue();
  -[MCMError containerClassPath](v97, "containerClassPath");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v241 = v221;
  v99 = objc_msgSend(v98, "createIfNecessaryWithError:", &v241);
  v100 = v241;

  v182 = v97;
  v183 = (void *)v92;
  if ((v99 & 1) != 0)
  {
    v222 = v100;
    -[MCMError containerRootURL](v97, "containerRootURL");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = +[MCMContainerCacheEntry birthtimeForURL:](MCMContainerCacheEntry, "birthtimeForURL:", v185);
    if (v101 | v102)
    {
      v106 = v101;
      v108 = v102;
    }
    else
    {
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = 0;
      objc_msgSend(v103, "fsNodeOfURL:followSymlinks:error:", v185, 0, &v240);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (MCMError *)v240;

      if (v104)
      {
        v106 = objc_msgSend(v104, "birthtime");
        v108 = v107;
      }
      else
      {
        container_log_handle_for_category();
        v125 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v249 = v185;
          v250 = 2112;
          v251 = v105;
          _os_log_error_impl(&dword_1CF807000, v125, OS_LOG_TYPE_ERROR, "Could not read fs node for old container at [%@] (non-fatal); error = %@",
            buf,
            0x16u);
        }

        v106 = 0;
        v108 = 0;
      }

    }
    if (v106 | v108)
      +[MCMContainerCacheEntry setBirthtime:forURL:](MCMContainerCacheEntry, "setBirthtime:forURL:", v106, v108, v187);
    -[MCMError containerRootURL](v225, "containerRootURL");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = v190;
    v127 = -[MCMCommandReplaceContainer _writeToDiskReplaceAt:old:withNew:usingStaging:toDestination:error:](v2, "_writeToDiskReplaceAt:old:withNew:usingStaging:toDestination:error:", v228, v185, v187, v229, v126, &v239);
    v128 = v239;

    v184 = v128;
    if (v127)
    {
      container_log_handle_for_category();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v129))
      {
        objc_msgSend(v207, "containerPath");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "containerPathIdentifier");
        v131 = (MCMError *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "identifier");
        v132 = (MCMError *)objc_claimAutoreleasedReturnValue();
        v191 = objc_msgSend(v207, "containerClass");
        -[MCMError containerPath](v214, "containerPath");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "containerPathIdentifier");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMError identifier](v214, "identifier");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = -[MCMError containerClass](v214, "containerClass");
        *(_DWORD *)buf = 138479107;
        v249 = v131;
        v250 = 2113;
        v251 = v132;
        v252 = 2050;
        v253 = v191;
        v254 = 2113;
        v255 = v134;
        v256 = 2113;
        v257 = v135;
        v258 = 2050;
        v259 = v136;
        _os_signpost_emit_with_name_impl(&dword_1CF807000, v129, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReplacingContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  -->  uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu ", buf, 0x3Eu);

      }
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "containerPath");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "containerRootURL");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v222;
      v140 = objc_msgSend(v137, "moveItemAtURL:toURL:error:", v139, v229, &v238);
      v141 = v238;

      v36 = v186;
      if ((v140 & 1) != 0)
      {
        v221 = v141;
        -[MCMCommand context](v2, "context");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "containerCache");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = v184;
        v144 = objc_msgSend(v143, "removeContainerForUserIdentity:contentClass:identifier:transient:error:", v227, v204, v217, objc_msgSend(v207, "transient"), &v237);
        v15 = v237;

        v26 = v207;
        if ((v144 & 1) != 0)
        {
          v145 = 1;
          v4 = v198;
          v5 = v202;
          v24 = v203;
          goto LABEL_140;
        }
        v184 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 46);

        container_log_handle_for_category();
        v118 = objc_claimAutoreleasedReturnValue();
        v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v180 = objc_msgSend(v207, "transient");
          *(_DWORD *)buf = 138412802;
          v249 = v217;
          v250 = 2048;
          v251 = (MCMError *)v204;
          v252 = 1024;
          LODWORD(v253) = v180;
          _os_log_error_impl(&dword_1CF807000, v118, OS_LOG_TYPE_ERROR, "Failed to remove from cache id: %@, class: %ld, transient: %d", buf, 0x1Cu);
        }
        v119 = v221;
      }
      else
      {
        v146 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 14);

        container_log_handle_for_category();
        v118 = objc_claimAutoreleasedReturnValue();
        v4 = v198;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v224 = v141;
          v26 = v207;
          objc_msgSend(v207, "containerPath");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "containerRootURL");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "path");
          v177 = (MCMError *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "path");
          v178 = (MCMError *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v249 = v177;
          v250 = 2112;
          v251 = v178;
          _os_log_error_impl(&dword_1CF807000, v118, OS_LOG_TYPE_ERROR, "Failed to move old %@ to staging %@", buf, 0x16u);

          v119 = v224;
          v184 = v146;
        }
        else
        {
          v119 = v141;
          v184 = v146;
          v26 = v207;
        }
      }
      v5 = v202;
      v24 = v203;
    }
    else
    {
      container_log_handle_for_category();
      v118 = objc_claimAutoreleasedReturnValue();
      v36 = v186;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v249 = v128;
        _os_log_error_impl(&dword_1CF807000, v118, OS_LOG_TYPE_ERROR, "Failed to write replace file: %@", buf, 0xCu);
      }
      v26 = v207;
      v24 = v203;
      v119 = v100;
    }
  }
  else
  {
    v115 = [MCMError alloc];
    -[MCMError containerClassPath](v97, "containerClassPath");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "classURL");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = -[MCMError initWithNSError:url:defaultErrorType:](v115, "initWithNSError:url:defaultErrorType:", v100, v117, 7);

    container_log_handle_for_category();
    v118 = objc_claimAutoreleasedReturnValue();
    v119 = v100;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v249 = v97;
      v250 = 2112;
      v251 = v100;
      _os_log_error_impl(&dword_1CF807000, v118, OS_LOG_TYPE_ERROR, "Failed to create class path dir for %@: %@", buf, 0x16u);
    }
    v229 = 0;
    v26 = v207;
    v24 = v203;
    v36 = v186;
  }

  v145 = 0;
  v221 = v119;
  v15 = v184;
LABEL_140:

  v25 = v214;
  if ((v145 & 1) == 0)
    goto LABEL_38;
LABEL_141:
  if (v36)
  {
    -[MCMError metadataBySettingTransient:](v25, "metadataBySettingTransient:", 0);
    v149 = objc_claimAutoreleasedReturnValue();

    v25 = (MCMError *)v149;
  }
  if (v209)
  {
    -[MCMError metadataByChangingUUID:](v25, "metadataByChangingUUID:", v205);
    v150 = objc_claimAutoreleasedReturnValue();

    v25 = (MCMError *)v150;
  }
  else if (((v26 == 0) & ~v36) != 0)
  {
    goto LABEL_148;
  }
  v236 = 0;
  v151 = -[MCMError writeMetadataToDiskWithError:](v25, "writeMetadataToDiskWithError:", &v236);
  v152 = v236;
  if (!v151)
  {
    v234[0] = MEMORY[0x1E0C809B0];
    v234[1] = 3221225472;
    v234[2] = __37__MCMCommandReplaceContainer_execute__block_invoke;
    v234[3] = &unk_1E8CB67B8;
    v235 = v152;
    v23 = v152;
    v163 = __37__MCMCommandReplaceContainer_execute__block_invoke((uint64_t)v234);

    goto LABEL_37;
  }

LABEL_148:
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = v25;
  -[MCMError containerPath](v25, "containerPath");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "containerRootURL");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMError containerRootURL](v225, "containerRootURL");
  v233[1] = v221;
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = objc_msgSend(v188, "moveItemAtURL:toURL:error:", v153);
  v210 = v221;

  if ((v192 & 1) == 0)
  {
    v164 = [MCMError alloc];
    -[MCMError containerRootURL](v225, "containerRootURL");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = -[MCMError initWithNSError:url:defaultErrorType:](v164, "initWithNSError:url:defaultErrorType:", v210, v165, 15);

    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v26, "containerPath");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "containerRootURL");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "path");
      v189 = (MCMError *)objc_claimAutoreleasedReturnValue();
      -[MCMError containerPath](v214, "containerPath");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "containerRootURL");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "path");
      v173 = (MCMError *)objc_claimAutoreleasedReturnValue();
      -[MCMError containerRootURL](v225, "containerRootURL");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "path");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v249 = v189;
      v250 = 2112;
      v251 = v173;
      v252 = 2112;
      v253 = (uint64_t)v175;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to replace: %@ with: %@ at: %@", buf, 0x20u);

      v24 = v203;
      v26 = v207;

      v25 = v214;
      v221 = v210;
      v15 = (MCMError *)v212;
    }
    else
    {
      v221 = v210;
      v15 = (MCMError *)v212;
      v25 = v214;
    }
    goto LABEL_37;
  }
  -[MCMCommand context](v2, "context");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "containerCache");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v233[0] = v15;
  v157 = objc_msgSend(v156, "removeContainerForUserIdentity:contentClass:identifier:transient:error:", v226, v211, v218, v36, v233);
  v158 = v233[0];

  if ((v157 & 1) == 0)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 46);

    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v203;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = v214;
      v179 = -[MCMError transient](v214, "transient");
      *(_DWORD *)buf = 138412802;
      v249 = v218;
      v250 = 2048;
      v251 = (MCMError *)v211;
      v252 = 1024;
      LODWORD(v253) = v179;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to remove from cache id: %@, class: %ld, transient: %d", buf, 0x1Cu);
      v221 = v210;
      v26 = v207;
      goto LABEL_37;
    }
    v221 = v210;
    v26 = v207;
LABEL_98:
    v25 = v214;
    goto LABEL_37;
  }
  -[MCMError metadataByChangingContainerPath:](v214, "metadataByChangingContainerPath:", v225);
  v25 = (MCMError *)objc_claimAutoreleasedReturnValue();

  -[MCMCommand context](v2, "context");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "containerCache");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = v158;
  objc_msgSend(v160, "addContainerMetadata:error:", v25, &v232);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (MCMError *)v232;

  v24 = v203;
  if (!v161)
  {
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 45);

    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = v207;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v181 = objc_msgSend(v207, "transient");
      *(_DWORD *)buf = 138412802;
      v249 = v25;
      v250 = 2112;
      v251 = v225;
      v252 = 1024;
      LODWORD(v253) = v181;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@, transient: %d", buf, 0x1Cu);
    }
    v221 = v210;
    v6 = v205;
    v2 = v196;
    goto LABEL_37;
  }
  v15 = v162;
  v221 = v210;
  v6 = v205;
  v26 = v207;
  v2 = v196;
  if (!v205)
    goto LABEL_75;
LABEL_38:
  v213 = v25;
  v40 = v6;
  v41 = v5;
  v208 = v26;
  if (v229)
  {
    v199 = v4;
    v206 = v40;
    v42 = containermanager_copy_global_configuration();
    v43 = objc_msgSend(v42, "isGlobalContainerClass:", v204);

    if ((v43 & 1) != 0)
      v44 = 0;
    else
      v44 = v227;
    v45 = v2;
    -[MCMCommand context](v2, "context");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "containerFactory");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = v15;
    v48 = objc_msgSend(v47, "deleteURL:forUserIdentity:error:", v229, v44, &v231);
    v49 = v231;

    if ((v48 & 1) == 0)
    {
      container_log_handle_for_category();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v229, "path");
        v84 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v249 = v84;
        v250 = 2112;
        v251 = v49;
        _os_log_error_impl(&dword_1CF807000, v50, OS_LOG_TYPE_ERROR, "Failed to remove staging dir: %@; error = %@",
          buf,
          0x16u);

      }
      v49 = 0;
    }
    v2 = v45;

    v15 = v49;
    v40 = v206;
    v4 = v199;
    v41 = v5;
  }
  if (!v228)
  {
    v228 = 0;
    goto LABEL_51;
  }
  v195 = v2;
  -[MCMCommand context](v2, "context");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "containerFactory");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = v15;
  v53 = objc_msgSend(v52, "deleteURL:forUserIdentity:error:", v228, 0, &v230);
  v14 = v230;

  if ((v53 & 1) == 0)
  {
    container_log_handle_for_category();
    v54 = objc_claimAutoreleasedReturnValue();
    v26 = v208;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v228, "path");
      v85 = (MCMError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v249 = v85;
      v250 = 2112;
      v251 = (MCMError *)v14;
      _os_log_error_impl(&dword_1CF807000, v54, OS_LOG_TYPE_ERROR, "Failed to remove replace file: %@; error = %@",
        buf,
        0x16u);

    }
    v15 = 0;
    v2 = v195;
    v5 = v41;
    v6 = v40;
    goto LABEL_70;
  }
  v15 = (MCMError *)v14;
  v2 = v195;
LABEL_51:
  v26 = v208;
  v5 = v41;
  v6 = v40;
LABEL_71:
  if (-[MCMCommandReplaceContainer asyncReclaim](v2, "asyncReclaim"))
  {
    v66 = [MCMCommandOperationReclaimDiskSpace alloc];
    -[MCMCommand context](v2, "context");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:](v66, "initWithAsynchronously:context:resultPromise:", 1, v67, 0);

    -[NSObject execute](v27, "execute");
    v25 = v213;
LABEL_73:

    goto LABEL_75;
  }
  v25 = v213;
LABEL_75:
  if (v15)
  {

    v25 = 0;
  }
  container_log_handle_for_category();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v249 = v15;
    _os_log_impl(&dword_1CF807000, v68, OS_LOG_TYPE_DEFAULT, "Replace; error = %@", buf, 0xCu);
  }

  v69 = [MCMResultWithContainerBase alloc];
  if (v15)
    v70 = -[MCMResultBase initWithError:](v69, "initWithError:", v15);
  else
    v70 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:](v69, "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:", v25, 0, 1, 0, 0, 0);
  v71 = (void *)v70;
  v72 = v25;
  -[MCMCommand resultPromise](v2, "resultPromise");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "completeWithResult:", v71);

  objc_autoreleasePoolPop(context);
}

- (BOOL)_writeToDiskReplaceAt:(id)a3 old:(id)a4 withNew:(id)a5 usingStaging:(id)a6 toDestination:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  MCMError *v26;
  BOOL v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "dataWritingOptionsForFileAtURL:", v13);

  if (v14 && v15 && v16 && v17)
  {
    v33 = a8;
    v35 = v14;
    v38[0] = CFSTR("MCMReplaceOperationOldURL");
    objc_msgSend(v14, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    v38[1] = CFSTR("MCMReplaceOperationNewURL");
    objc_msgSend(v15, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v21;
    v38[2] = CFSTR("MCMReplaceOperationStagingURL");
    objc_msgSend(v16, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v22;
    v38[3] = CFSTR("MCMReplaceOperationDestURL");
    objc_msgSend(v17, "path");
    v23 = objc_claimAutoreleasedReturnValue();
    v39[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    LOBYTE(v23) = objc_msgSend(v24, "MCM_writeToURL:withOptions:error:", v13, v19, &v37);
    v25 = v37;
    if ((v23 & 1) != 0)
    {
      v26 = 0;
      v27 = 1;
      v14 = v35;
      goto LABEL_16;
    }
    v26 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v25, v13, 86);
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v32;
      v42 = 2112;
      v43 = v25;
      _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Failed to write replace dictionary to URL %@; error = %@",
        buf,
        0x16u);

    }
    a8 = v33;
    v14 = v35;
  }
  else
  {
    v26 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 33, 4);
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      *(_DWORD *)buf = 138413058;
      v41 = v36;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = v30;
      v46 = 2112;
      v47 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v47;
      _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Invalid Replace File Info: old: %@, new: %@, staging: %@, dest: %@", buf, 0x2Au);

    }
    v24 = 0;
    v25 = 0;
  }

  if (a8)
  {
    v26 = objc_retainAutorelease(v26);
    v27 = 0;
    *a8 = v26;
  }
  else
  {
    v27 = 0;
  }
LABEL_16:

  return v27;
}

- (MCMConcreteContainerIdentity)containerIdentityOld
{
  return self->_containerIdentityOld;
}

- (MCMConcreteContainerIdentity)containerIdentityNew
{
  return self->_containerIdentityNew;
}

- (BOOL)preserveOldPathIdentifier
{
  return self->_preserveOldPathIdentifier;
}

- (BOOL)preserveOldInternalUUID
{
  return self->_preserveOldInternalUUID;
}

- (BOOL)asyncReclaim
{
  return self->_asyncReclaim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentityNew, 0);
  objc_storeStrong((id *)&self->_containerIdentityOld, 0);
}

id __37__MCMCommandReplaceContainer_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to write metadata during replace: %@"), *(_QWORD *)(a1 + 32));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMCommandReplaceContainer execute]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = &unk_1E8CD69A8;
  v4 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v4;
  v12[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v2;
    _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), objc_msgSend(*(id *)(a1 + 32), "type"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)command
{
  return 2;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)recoverFromReplaceOperationsWithContext:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  MCMError *v12;
  NSObject *v13;
  MCMError *v14;
  id v15;
  uint64_t v16;
  void *v17;
  MCMError *v18;
  MCMError *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  MCMError *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  MCMError *v45;
  void *v46;
  void *v47;
  MCMError *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v59;
  MCMError *v60;
  uint64_t v61;
  uint64_t v62;
  MCMError *v63;
  MCMError *v64;
  MCMError *v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  MCMError *v70;
  __int16 v71;
  MCMError *v72;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = containermanager_copy_global_configuration();
  objc_msgSend(v6, "managedPathRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containermanagerReplaceOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v14 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 84, 1);
    container_log_handle_for_category();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Failed to get url for storing replace operations.", buf, 2u);
    }

    v12 = 0;
    v40 = 0;
    v13 = 0;
    goto LABEL_47;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v10, "urlsForItemsInDirectoryAtURL:error:", v9, &v66);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (MCMError *)v66;

  if (!v11)
  {
    -[MCMError domain](v12, "domain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v42 = -[MCMError code](v12, "code");

      if (v42 == 2)
      {
        v14 = 0;
        if (!a4)
          goto LABEL_46;
LABEL_45:
        v14 = objc_retainAutorelease(v14);
        *a4 = v14;
        goto LABEL_46;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "url");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "path");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v68 = v51;
      v69 = 2112;
      v70 = v12;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to get items at replace URL %@ : %@", buf, 0x16u);

    }
    goto LABEL_43;
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v13 = v11;
  v62 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
  if (!v62)
  {
LABEL_43:
    v14 = 0;
    goto LABEL_44;
  }
  v52 = v11;
  v53 = a4;
  v60 = v12;
  v54 = v9;
  v55 = v8;
  v56 = v5;
  v57 = 0;
  v14 = 0;
  v61 = *(_QWORD *)v75;
  v15 = a1;
  v59 = v13;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v75 != v61)
        objc_enumerationMutation(v13);
      v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v16);
      v65 = v14;
      objc_msgSend(v15, "_readAndValidateReplaceFileAtUrl:error:", v17, &v65);
      v18 = (MCMError *)objc_claimAutoreleasedReturnValue();
      v19 = v65;

      container_log_handle_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "path");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v37;
          v69 = 2112;
          v70 = v19;
          _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Pending replace operation found, but not valid at [%@], ignoring: %@", buf, 0x16u);

        }
        goto LABEL_15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        v69 = 2112;
        v70 = v18;
        _os_log_impl(&dword_1CF807000, v21, OS_LOG_TYPE_INFO, "Doing a replace of %@ with info: %@", buf, 0x16u);

      }
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v21 = objc_claimAutoreleasedReturnValue();
      -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject itemExistsAtURL:](v21, "itemExistsAtURL:", v23))
      {

LABEL_15:
        goto LABEL_16;
      }
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationDestURL"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "itemExistsAtURL:", v28);

      if ((v29 & 1) != 0)
      {
        v13 = v59;
      }
      else
      {
        container_log_handle_for_category();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
          v32 = (MCMError *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v31;
          v69 = 2112;
          v70 = v32;
          _os_log_impl(&dword_1CF807000, v30, OS_LOG_TYPE_INFO, "Recovering from failed replace by moving: %@ to %@", buf, 0x16u);

        }
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v60;
        v36 = objc_msgSend(v33, "moveItemAtURL:toURL:error:", v34, v35, &v64);
        v12 = v64;

        if ((v36 & 1) == 0)
        {
          v45 = [MCMError alloc];
          -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[MCMError initWithNSError:url:defaultErrorType:](v45, "initWithNSError:url:defaultErrorType:", v12, v46, 35);

          container_log_handle_for_category();
          v43 = objc_claimAutoreleasedReturnValue();
          v13 = v59;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMError objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
            v48 = (MCMError *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v68 = v47;
            v69 = 2112;
            v70 = v48;
            v71 = 2112;
            v72 = v12;
            _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "Failed to recover replace move: %@ to %@; error = %@",
              buf,
              0x20u);

          }
          goto LABEL_39;
        }
        v57 = 1;
        v60 = v12;
        v15 = a1;
        v13 = v59;
      }
LABEL_16:
      +[MCMCommandContext privileged](MCMCommandContext, "privileged");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containerFactory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v19;
      v26 = objc_msgSend(v25, "deleteURL:forUserIdentity:error:", v17, 0, &v63);
      v14 = v63;

      if ((v26 & 1) == 0)
      {
        container_log_handle_for_category();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "path");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v49;
          v69 = 2112;
          v70 = v14;
          _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "Failed to remove replace file at %@; error = %@",
            buf,
            0x16u);

        }
        v12 = v60;
LABEL_39:
        v8 = v55;
        v5 = v56;
        v9 = v54;

        v40 = 0;
        goto LABEL_47;
      }

      ++v16;
    }
    while (v62 != v16);
    v38 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
    v62 = v38;
  }
  while (v38);

  if ((v57 & 1) != 0)
  {
    v5 = v56;
    objc_msgSend(v56, "containerCache");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject flush](v13, "flush");
    v9 = v54;
    v8 = v55;
    v12 = v60;
    v11 = v52;
    a4 = v53;
LABEL_44:

    if (!a4)
      goto LABEL_46;
    goto LABEL_45;
  }
  v8 = v55;
  v5 = v56;
  a4 = v53;
  v9 = v54;
  v12 = v60;
  v11 = v52;
  if (v53)
    goto LABEL_45;
LABEL_46:
  v40 = 1;
  v13 = v11;
LABEL_47:

  return v40;
}

+ (id)_readAndValidateReplaceFileAtUrl:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  MCMError *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "MCM_dictionaryWithContentsOfURL:options:error:", v5, 1, &v52);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v52;
  v50 = v7;
  v51 = v5;
  if (v6)
  {
    objc_opt_class();
    v8 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (!v9)
    {
      v10 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 35, 5);
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v8;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Bad Data in replace file: %@", buf, 0xCu);
      }
      goto LABEL_23;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    if (!v14)
    {
LABEL_21:

LABEL_22:
      v10 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 35, 5);
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationNewURL"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationDestURL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v54 = v12;
      v55 = 2112;
      v56 = v31;
      v57 = 2112;
      v58 = v32;
      v59 = 2112;
      v60 = (uint64_t)v33;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@", buf, 0x2Au);

LABEL_30:
      goto LABEL_23;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationNewURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v16)
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v18)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationDestURL"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;

          if (v21)
          {
            v49 = a4;
            v34 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationOldURL"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "fileURLWithPath:isDirectory:", v35, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationNewURL"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "fileURLWithPath:isDirectory:", v38, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v39 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationStagingURL"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "fileURLWithPath:isDirectory:", v40, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MCMReplaceOperationDestURL"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "fileURLWithPath:isDirectory:", v42, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            v25 = v36;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!v25)
              {
LABEL_44:
                v10 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 35, 5);
                container_log_handle_for_category();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v25, "path");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "path");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "path");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "path");
                  v46 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v54 = v48;
                  v55 = 2112;
                  v56 = v44;
                  v57 = 2112;
                  v58 = v45;
                  v59 = 2112;
                  v60 = v46;
                  v47 = (void *)v46;
                  _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Invalid replace data: Old: %@, New: %@, Staging: %@, Dest: %@", buf, 0x2Au);

                }
                a4 = v49;
                goto LABEL_24;
              }
              objc_opt_class();
              v26 = v22;
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_42;
              if (v26)
              {
                objc_opt_class();
                v27 = v23;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (v27)
                  {
                    objc_opt_class();
                    v28 = v24;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v43 = v28;
                    else
                      v43 = 0;

                    if (v43)
                    {
                      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("MCMReplaceOperationOldURL"));
                      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("MCMReplaceOperationNewURL"));
                      objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("MCMReplaceOperationStagingURL"));
                      objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("MCMReplaceOperationDestURL"));
                      v10 = 0;
                      goto LABEL_28;
                    }
                    goto LABEL_44;
                  }
                }
                else
                {

                }
LABEL_42:

              }
            }

            goto LABEL_44;
          }
          goto LABEL_22;
        }
      }
      else
      {

      }
    }

    goto LABEL_20;
  }
  v10 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v7, v5, 35);
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v12;
    _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to read replace file at URL %@", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_23:
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
LABEL_24:

  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v8 = 0;
    *a4 = v10;
  }
  else
  {
    v8 = 0;
  }
  v26 = v22;
  v27 = v23;
  v28 = v24;
LABEL_28:
  v29 = (void *)objc_msgSend(v8, "copy");

  return v29;
}

@end

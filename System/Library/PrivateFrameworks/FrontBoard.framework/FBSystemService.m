@implementation FBSystemService

uint64_t __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  char v30;
  void *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  _QWORD block[4];
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "signal") & 1) != 0)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22CD0]);

    if (a2)
    {
      +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (_QWORD *)MEMORY[0x1E0CB2D68];
      if (a2 == 1)
      {
        if (v7)
        {
          objc_msgSend(v5, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", *v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "code");
          FBSOpenApplicationErrorCodeToString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("The request was denied by service delegate (%@) for reason: %@ (\"%@\")."), v11, v22, v24);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = (_QWORD *)MEMORY[0x1E0CB2D68];
          }
          else
          {
            objc_msgSend(v20, "stringWithFormat:", CFSTR("The request was denied by service delegate (%@) for reason: %@."), v11, v21);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request was denied by service delegate (%@)."), v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a2 == 2)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "processName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("This is probably a bug in %@."), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request was ignored by service delegate (%@). %@"), v11, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request to open \"%@\" failed."), *(_QWORD *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v26, *MEMORY[0x1E0CB2D50]);

      objc_msgSend(v25, "bs_setSafeObject:forKey:", v17, *v12);
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
      FBSOpenApplicationServiceErrorCodeToString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v27, *MEMORY[0x1E0D22A98]);

      objc_msgSend(v25, "bs_setSafeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("FBSOpenApplicationRequestID"));
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22DC0], a2, v25);
      a2 = objc_claimAutoreleasedReturnValue();

    }
    v28 = v7 ^ 1;
    if (v5)
      v29 = v7 ^ 1;
    else
      v29 = 0;
    if ((v28 & 1) != 0)
    {
      if (!v29)
      {
LABEL_28:
        FBLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (a2)
        {
          if (v35)
          {
            v36 = *(_QWORD *)(a1 + 40);
            v37 = *(_QWORD *)(a1 + 48);
            v38 = *(_QWORD *)(a1 + 64);
            -[NSObject descriptionWithMultilinePrefix:](a2, "descriptionWithMultilinePrefix:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v53 = v36;
            v54 = 2114;
            v55 = v37;
            v56 = 2114;
            v57 = v38;
            v58 = 2114;
            v59 = v39;
            _os_log_impl(&dword_1A359A000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Open \"%{public}@\" request from %{public}@ failed with error: %{public}@", buf, 0x2Au);

          }
        }
        else if (v35)
        {
          v40 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v53 = v40;
          _os_log_impl(&dword_1A359A000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request complete; no error reported.",
            buf,
            0xCu);
        }

        if (*(_QWORD *)(a1 + 72))
        {
          +[FBProcess _currentProcess](FBProcess, "_currentProcess");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v41, "isApplicationProcess"))
          {
            objc_msgSend(v41, "bundleIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "isEqualToString:", *(_QWORD *)(a1 + 48));

            if ((v43 & 1) != 0)
              goto LABEL_38;
          }
          +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "processesForBundleIdentifier:", *(_QWORD *)(a1 + 48));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "firstObject");
          v46 = (id)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            if (!v46)
LABEL_38:
              v46 = v41;
          }
          v47 = *(_QWORD *)(a1 + 72);
          objc_msgSend(v46, "handle");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, NSObject *))(v47 + 16))(v47, v48, a2);

        }
        goto LABEL_40;
      }
    }
    else
    {
      if ((objc_msgSend(v5, "code") & 0xFFFFFFFFFFFFFFFELL) == 4)
        v30 = 1;
      else
        v30 = v29;
      if ((v30 & 1) == 0)
        goto LABEL_28;
    }
    objc_msgSend(*(id *)(a1 + 56), "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "bs_BOOLForKey:", *MEMORY[0x1E0D22D00]);

    if ((v32 & 1) == 0)
    {
      dispatch_get_global_queue(21, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_143;
      block[3] = &unk_1E4A11FD0;
      v50 = *(id *)(a1 + 56);
      v51 = *(id *)(a1 + 48);
      dispatch_async(v33, block);

    }
    goto LABEL_28;
  }
  FBLogCommon();
  a2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
    __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_cold_1(a1, a2);
LABEL_40:

}

uint64_t __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)openApplication:(id)a3 withOptions:(id)a4 originator:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  void *v89;
  id v90;
  void *v91;
  void (**v92)(_QWORD, _QWORD, _QWORD);
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void (**v98)(_QWORD);
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v114;
  id v115;
  id v116;
  void *v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  id v122;
  FBSystemService *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  void (**v132)(_QWORD, _QWORD, _QWORD);
  _QWORD v133[4];
  id v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[5];
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  char v141;
  _QWORD v142[4];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  char v149[32];
  uint8_t buf[4];
  id v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  id v159;
  __int16 v160;
  uint64_t v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteProcess");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_msgSend(v17, "hasEntitlement:", *MEMORY[0x1E0D22CB8]) & 1) == 0)
  {
    v18 = v17;

    v13 = v18;
  }
  if (!v11)
  {
    FBSystemAppBundleID();
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerProcessForHandle:", v13);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  FBSProcessPrettyDescription();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0D22F78]);
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke;
  v142[3] = &unk_1E4A12A60;
  v116 = v21;
  v143 = v116;
  v22 = v14;
  v144 = v22;
  v23 = v11;
  v145 = v23;
  v24 = v12;
  v146 = v24;
  v25 = v20;
  v147 = v25;
  v115 = v15;
  v148 = v115;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8590C4C](v142);
  if (v13 && (objc_msgSend(v13, "isValid") & 1) != 0)
  {
    v138 = 0;
    v139 = &v138;
    v140 = 0x2020000000;
    v141 = 0;
    objc_msgSend(v24, "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_149;
    v137[3] = &unk_1E4A12A88;
    v137[4] = &v138;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v137);

    if (*((_BYTE *)v139 + 24) && (objc_msgSend(v17, "hasEntitlement:", *MEMORY[0x1E0D22CB8]) & 1) == 0)
    {
      FBSOpenApplicationErrorCreate();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v26)[2](v26, 4, v39);
LABEL_74:

      _Block_object_dispose(&v138, 8);
      goto LABEL_75;
    }
    objc_msgSend(v24, "url");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "auditToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "auditToken");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) != 0)
    {
      if (v112)
      {
        FBLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v112, "scheme");
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "resourceSpecifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544387;
          v151 = v22;
          v152 = 2114;
          v153 = (uint64_t)v23;
          v154 = 2114;
          v155 = (uint64_t)v32;
          v156 = 2117;
          v157 = (uint64_t)v33;
          v158 = 2114;
          v159 = v25;
          _os_log_impl(&dword_1A359A000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" with url \"%{public}@:%{sensitive}@\" from %{public}@.", buf, 0x34u);

        }
      }
      else
      {
        FBLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v151 = v22;
          v152 = 2114;
          v153 = (uint64_t)v23;
          v154 = 2114;
          v155 = (uint64_t)v25;
          _os_log_impl(&dword_1A359A000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" from %{public}@.", buf, 0x20u);
        }
      }
    }
    else if (v112)
    {
      FBLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v112, "scheme");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "resourceSpecifier");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        FBSProcessPrettyDescription();
        v37 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544643;
        v151 = v22;
        v152 = 2114;
        v153 = (uint64_t)v23;
        v154 = 2114;
        v110 = v35;
        v155 = (uint64_t)v35;
        v156 = 2117;
        v157 = (uint64_t)v36;
        v158 = 2114;
        v159 = v25;
        v160 = 2114;
        v38 = (void *)v37;
        v161 = v37;
        _os_log_impl(&dword_1A359A000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" with url \"%{public}@:%{sensitive}@\" from %{public}@ on behalf of %{public}@.", buf, 0x3Eu);

      }
    }
    else
    {
      FBLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        FBSProcessPrettyDescription();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v151 = v22;
        v152 = 2114;
        v153 = (uint64_t)v23;
        v154 = 2114;
        v155 = (uint64_t)v25;
        v156 = 2114;
        v157 = (uint64_t)v40;
        _os_log_impl(&dword_1A359A000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" from %{public}@ on behalf of %{public}@.", buf, 0x2Au);

      }
    }

    objc_msgSend(v24, "actions");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v111, "count"))
    {
      FBLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v111, "fbs_singleLineDescriptionOfBSActions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v151 = v22;
        v152 = 2114;
        v153 = (uint64_t)v42;
        _os_log_impl(&dword_1A359A000, v41, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request contains action(s): %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v24, "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0D22CD8];
    objc_msgSend(v43, "objectForKey:", *MEMORY[0x1E0D22CD8]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45 == 0;

    if (v46)
    {
LABEL_54:
      if (!v112)
        goto LABEL_62;
      objc_msgSend(v13, "auditToken");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v79;
      if (v79)
      {
        objc_msgSend(v79, "realToken");
      }
      else
      {
        v135 = 0u;
        v136 = 0u;
      }
      v81 = sandbox_check_by_audit_token() == 0;

      if (v81)
      {
LABEL_62:
        objc_msgSend(v24, "dictionary");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", *MEMORY[0x1E0D22D38]);
        v107 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKey:", *MEMORY[0x1E0D22D30]);
        v86 = objc_claimAutoreleasedReturnValue();
        v109 = v85;
        v105 = (void *)v86;
        if ((v107 != 0) == (v86 != 0))
        {
          if (v86)
          {
            FBLogCommon();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v151 = v22;
              v152 = 2114;
              v153 = (uint64_t)v23;
              v154 = 2114;
              v155 = (uint64_t)v105;
              v156 = 2114;
              v157 = v107;
              _os_log_impl(&dword_1A359A000, v88, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Activation request for %{public}@ contained LSCacheGUID %{public}@ and LSSequenceNumber %{public}@.", buf, 0x2Au);
            }

          }
          objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "instance");
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          v90 = objc_alloc(MEMORY[0x1E0D22F58]);
          v91 = (void *)MEMORY[0x1E0D22F60];
          v133[0] = MEMORY[0x1E0C809B0];
          v133[1] = 3221225472;
          v133[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_161;
          v133[3] = &unk_1E4A12AB0;
          v92 = v26;
          v134 = v92;
          objc_msgSend(v91, "responderWithHandler:", v133);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (void *)objc_msgSend(v90, "initWithInfo:responder:", 0, v93);

          v130[0] = MEMORY[0x1E0C809B0];
          v130[1] = 3221225472;
          v130[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2;
          v130[3] = &unk_1E4A12AD8;
          v132 = v92;
          v101 = v94;
          v131 = v101;
          v95 = (void *)MEMORY[0x1A8590C4C](v130);
          -[FBSystemService _applicationInfoProvider](self, "_applicationInfoProvider");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_3;
          v118[3] = &unk_1E4A12B50;
          v97 = v96;
          v119 = v97;
          v120 = v23;
          v121 = v22;
          v122 = v105;
          v123 = self;
          v124 = v17;
          v125 = v13;
          v126 = v109;
          v127 = v24;
          v87 = v102;
          v128 = v87;
          v114 = v95;
          v129 = v114;
          v98 = (void (**)(_QWORD))MEMORY[0x1A8590C4C](v118);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v97, "synchronize:", v98);
          else
            v98[2](v98);

        }
        else
        {
          FBSOpenApplicationErrorCreate();
          v87 = (id)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, id))v26)[2](v26, 4, v87);
        }

        v84 = (void *)v107;
      }
      else
      {
        FBLogCommon();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          FBSProcessPrettyDescription();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v151 = v22;
          v152 = 2114;
          v153 = (uint64_t)v83;
          _os_log_impl(&dword_1A359A000, v82, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Caller \"%{public}@\" has a sandbox that does not allow opening URL's.", buf, 0x16u);

        }
        FBSProcessPrettyDescription();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        FBSOpenApplicationErrorCreate();
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v26)[2](v26, 4, v84);
      }

      v39 = v112;
      goto LABEL_74;
    }
    objc_msgSend(v24, "dictionary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKey:", v44);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v117, "applicationInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "advertisingAttributionReportEndpoint");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v108)
    {
      FBLogCommon();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[FBSystemService openApplication:withOptions:originator:requestID:completion:].cold.1((uint64_t)v22, v58, v59, v60, v61, v62, v63, v64);

      objc_msgSend(v24, "_updateOption:forKey:", 0, v44);
      goto LABEL_53;
    }
    objc_msgSend(v106, "eventMessage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v49;
    v50 = v49;
    if (v49)
    {
      v51 = objc_msgSend(v49, "originIdentifier");
      v52 = objc_msgSend(v50, "context");
      if (v51 != 0xC181BADB23D8497BLL || v52)
      {
        FBLogCommon();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v103 = objc_msgSend(v104, "originIdentifier");
          v99 = objc_msgSend(v104, "context");
          *(_DWORD *)buf = 138543874;
          v151 = v22;
          v152 = 2048;
          v153 = v103;
          v154 = 2048;
          v155 = v99;
          _os_log_error_impl(&dword_1A359A000, v65, OS_LOG_TYPE_ERROR, "[FBSystemService][%{public}@] Ignoring click attribution with invalid origin (%llx) or context (%llx).", buf, 0x20u);
        }
      }
      else
      {
        v53 = objc_msgSend(v104, "timestamp");
        if (v53 <= openApplication_withOptions_originator_requestID_completion__sLastSeenBackBoardTimestamp)
        {
          FBLogCommon();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            -[FBSystemService openApplication:withOptions:originator:requestID:completion:].cold.4((uint64_t)v22, v65, v72, v73, v74, v75, v76, v77);
        }
        else
        {
          openApplication_withOptions_originator_requestID_completion__sLastSeenBackBoardTimestamp = v53;
          objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "authenticateMessage:", v104);

          if ((v55 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            FBLogCommon();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v151 = v22;
              _os_log_impl(&dword_1A359A000, v56, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request contains valid click attribution.", buf, 0xCu);
            }

            objc_msgSend(v106, "clickAttributionWithReportEndpoint:", v108);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "_updateOption:forKey:", v57, v44);

            goto LABEL_52;
          }
          FBLogCommon();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            NSStringFromBKSHIDEventAuthenticationStatus();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[FBSystemService openApplication:withOptions:originator:requestID:completion:].cold.3((uint64_t)v22, v78, (uint64_t)v149, v65);
          }
        }
      }
    }
    else
    {
      FBLogCommon();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        -[FBSystemService openApplication:withOptions:originator:requestID:completion:].cold.2((uint64_t)v22, v65, v66, v67, v68, v69, v70, v71);
    }

    objc_msgSend(v24, "_updateOption:forKey:", 0, v44);
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  FBSProcessPrettyDescription();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  FBSOpenApplicationErrorCreate();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v26)[2](v26, 4, v34);

LABEL_75:
}

- (FBSApplicationInfoProvider)_applicationInfoProvider
{
  os_unfair_lock_s *p_defaultInfoProviderLock;
  FBSApplicationInfoProvider *v4;

  p_defaultInfoProviderLock = &self->_defaultInfoProviderLock;
  os_unfair_lock_lock(&self->_defaultInfoProviderLock);
  v4 = self->_lock_defaultInfoProvider;
  os_unfair_lock_unlock(p_defaultInfoProviderLock);
  return v4;
}

- (FBSystemServiceDelegate)delegate
{
  return (FBSystemServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_isTrustedRequest:(id)a3 forCaller:(id)a4 fromClient:(id)a5 forBundleInfo:(id)a6 withOptions:(id)a7 fatalError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  char v26;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  int v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D22D18]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if ((objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.frontboard.launchapplications")) & 1) == 0
      && (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.backboardd.launchapplications")) & 1) == 0
      && (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.launchapplications")) & 1) == 0
      && (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.frontboard.debugapplications")) & 1) == 0
      && (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.backboardd.debugapplications")) & 1) == 0
      && !objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.debugapplications")))
    {
LABEL_20:
      if (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E0D22D28]))
      {
        if (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.opensensitiveurl")))
        {
          FBLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          FBSProcessPrettyDescription();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v14;
          v46 = 2114;
          v47 = v24;
          v25 = "[FBSystemService][%{public}@] Trusting legacy sensitive URL request from %{public}@.";
          goto LABEL_15;
        }
        if ((objc_msgSend(v15, "hasEntitlement:", *MEMORY[0x1E0D22CB8]) & 1) == 0)
        {
          FBSOpenApplicationErrorCreate();
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
            goto LABEL_6;
        }
      }
      if (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E0D22D00]))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v17;
        else
          v28 = 0;
        v29 = v28;
        objc_msgSend(v17, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[FBSystemService _isAllowListedLaunchSuspendedApp:](self, "_isAllowListedLaunchSuspendedApp:", v30);

        if (v29 && (unint64_t)objc_msgSend(v29, "type") <= 1)
          v32 = objc_msgSend(v29, "hasViewServicesEntitlement");
        else
          v32 = 0;
        v22 = v31 | v32;
        if ((v31 | v32) == 1)
        {
          FBLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            FBSProcessPrettyDescription();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v45 = v14;
            v46 = 2114;
            v47 = v34;
            _os_log_impl(&dword_1A359A000, v33, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Trusting allow-listed background activation from %{public}@.", buf, 0x16u);

          }
          v21 = 0;
        }
        else
        {
          FBSOpenApplicationErrorCreate();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v22 = 0;
        v21 = 0;
      }
      if ((v22 & 1) != 0 || v21)
      {
LABEL_55:
        if (!v21)
        {
          v26 = 1;
          if (!a8)
            goto LABEL_19;
          goto LABEL_18;
        }
        goto LABEL_56;
      }
      objc_msgSend(v18, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        if (objc_msgSend(v35, "isFileURL")
          && (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E0D22D20]) & 1) == 0)
        {
          FBSOpenApplicationErrorCreate();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
LABEL_54:

            goto LABEL_55;
          }
LABEL_50:
          FBSOpenApplicationErrorCreate();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
      }
      else
      {
        v37 = objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E0D22DB0]);
        v38 = objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E0D22D68]);
        if ((v37 & 1) == 0 && !v38)
          goto LABEL_50;
      }
      FBLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        FBSProcessPrettyDescription();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v14;
        v46 = 2114;
        v47 = v40;
        _os_log_impl(&dword_1A359A000, v39, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Allowing un-trusted request from %{public}@.", buf, 0x16u);

      }
      v21 = 0;
      goto LABEL_54;
    }
LABEL_13:
    FBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:
      v21 = 0;
      v26 = 1;
      v22 = 1;
      goto LABEL_17;
    }
    FBSProcessPrettyDescription();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v14;
    v46 = 2114;
    v47 = v24;
    v25 = "[FBSystemService][%{public}@] Trusting entitled client %{public}@.";
LABEL_15:
    _os_log_impl(&dword_1A359A000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);

    goto LABEL_16;
  }
  if ((objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.frontboard.debugapplications")) & 1) != 0
    || (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.backboardd.debugapplications")) & 1) != 0
    || (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.debugapplications")) & 1) != 0)
  {
    goto LABEL_13;
  }
  FBSOpenApplicationErrorCreate();
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_20;
LABEL_6:
  v21 = (void *)v20;
  v22 = 0;
LABEL_56:
  FBLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    FBSProcessPrettyDescription();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "succinctDescription");
    v41 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v14;
    v46 = 2114;
    v47 = v43;
    v48 = 2114;
    v49 = v41;
    v42 = (void *)v41;
    _os_log_error_impl(&dword_1A359A000, v23, OS_LOG_TYPE_ERROR, "[FBSystemService][%{public}@] Request from %{public}@ is denied: %{public}@", buf, 0x20u);

  }
  v26 = 0;
LABEL_17:

  if (a8)
LABEL_18:
    *a8 = objc_retainAutorelease(v21);
LABEL_19:

  return v26 & v22;
}

void __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0D23178];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  +[FBSystemAppProxyServiceServer targetQueue](FBSystemAppProxyServiceServer, "targetQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetDispatchingQueue:", v6);

  objc_msgSend(MEMORY[0x1E0D23178], "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v7);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E4A129E8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setInvalidationHandler:", v8);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke;
  v8[3] = &unk_1E4A12A10;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "_configureConnection:", v8);
  objc_msgSend(v7, "activate");

}

+ (id)sharedInstanceIfExists
{
  void *v2;
  void *v3;

  +[FBServiceFacilityServer sharedInstanceDomain](FBServiceFacilityServer, "sharedInstanceDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSystemService _sharedInstanceCreatingIfNecessary:]((uint64_t)FBSystemService, v2 != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_sharedInstanceCreatingIfNecessary:(uint64_t)a1
{
  objc_class *v3;
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceCreatingIfNecessary____lock);
  v4 = (id)_sharedInstanceCreatingIfNecessary____sharedInstance;
  if (v4)
    v5 = 1;
  else
    v5 = a2 == 0;
  if (!v5)
  {
    v6 = [v3 alloc];
    objc_msgSend(MEMORY[0x1E0D23258], "mainDispatchQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithQueue:", v7);
    v9 = (void *)_sharedInstanceCreatingIfNecessary____sharedInstance;
    _sharedInstanceCreatingIfNecessary____sharedInstance = (uint64_t)v8;

    v4 = v8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceCreatingIfNecessary____lock);
  return v4;
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "applicationInfoForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 32), "placeholderWithBundleIdentifier:", *(_QWORD *)(a1 + 40)),
          (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      FBLogCommon();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 48);
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v32 = v4;
        v33 = 2112;
        v34 = v6;
        v35 = 2114;
        v36 = v7;
        _os_log_impl(&dword_1A359A000, v3, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Application info provider (%@) returned nil for \"%{public}@\", buf, 0x20u);

      }
      if (!*(_QWORD *)(a1 + 56))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        FBSOpenApplicationErrorCreate();
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 112) + 16))(*(_QWORD *)(a1 + 112), 4, v2);
        goto LABEL_12;
      }
      v2 = 0;
    }
  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 88);
  v30 = 0;
  v13 = objc_msgSend(v9, "_isTrustedRequest:forCaller:fromClient:forBundleInfo:withOptions:fatalError:", v8, v10, v11, v2, v12, &v30);
  v14 = v30;
  if (v30)
  {
    (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 112) + 16))(*(_QWORD *)(a1 + 112), 4, v30);
  }
  else
  {
    v15 = v13;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(void **)(v16 + 8);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_163;
    v21[3] = &unk_1E4A12B28;
    v21[4] = v16;
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    v29 = v15;
    v24 = *(id *)(a1 + 96);
    v25 = *(id *)(a1 + 104);
    v26 = *(id *)(a1 + 72);
    v27 = *(id *)(a1 + 80);
    v28 = *(id *)(a1 + 112);
    v18 = 0;
    objc_msgSend(v17, "performAsync:", v21);

  }
LABEL_12:

}

+ (id)sharedInstance
{
  return +[FBSystemService _sharedInstanceCreatingIfNecessary:]((uint64_t)FBSystemService, 1);
}

- (FBSystemService)initWithQueue:(id)a3
{
  id v5;
  FBSystemService *v6;
  FBSystemService *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  FBSystemService *v14;
  uint64_t v15;
  BSServiceConnectionListener *legacyOpenServiceListener;
  void *v17;
  id v18;
  FBSystemService *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  FBSystemService *v27;
  _QWORD v28[4];
  FBSystemService *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  FBSystemService *v33;
  objc_super v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FBSystemService;
  v6 = -[FBSystemService init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    +[FBServiceFacilityServer sharedInstance](FBServiceFacilityServer, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23178], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v11 && objc_msgSend(v11, "isDerived"))
    {
      v13 = (void *)MEMORY[0x1E0D23030];
      v30[0] = v12;
      v30[1] = 3221225472;
      v30[2] = __33__FBSystemService_initWithQueue___block_invoke;
      v30[3] = &unk_1E4A12758;
      v31 = v8;
      v32 = v11;
      v14 = v7;
      v33 = v14;
      objc_msgSend(v13, "listenerWithConfigurator:", v30);
      v15 = objc_claimAutoreleasedReturnValue();
      legacyOpenServiceListener = v14->_legacyOpenServiceListener;
      v14->_legacyOpenServiceListener = (BSServiceConnectionListener *)v15;

    }
    v7->_defaultInfoProviderLock._os_unfair_lock_opaque = 0;
    -[FBSystemService _setInfoProvider](v7, "_setInfoProvider");
    -[BSServiceConnectionListener activate](v7->_legacyOpenServiceListener, "activate");
    if (objc_msgSend(MEMORY[0x1E0D23068], "isServerProcess"))
    {
      v17 = (void *)MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __33__FBSystemService_initWithQueue___block_invoke_2;
      v28[3] = &unk_1E4A12780;
      v19 = v7;
      v29 = v19;
      v20 = v17;
      v21 = v28;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v22 = getAKSEventsRegisterSymbolLoc_ptr;
      v39 = getAKSEventsRegisterSymbolLoc_ptr;
      if (!getAKSEventsRegisterSymbolLoc_ptr)
      {
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __getAKSEventsRegisterSymbolLoc_block_invoke;
        v35[3] = &unk_1E4A11EE8;
        v35[4] = &v36;
        __getAKSEventsRegisterSymbolLoc_block_invoke((uint64_t)v35);
        v22 = (void *)v37[3];
      }
      _Block_object_dispose(&v36, 8);
      if (!v22)
        -[FBSystemService initWithQueue:].cold.1();
      v23 = (void *)MEMORY[0x1E0C80D38];
      v24 = ((uint64_t (*)(_QWORD, _QWORD *))v22)(MEMORY[0x1E0C80D38], v21);

      v19->_aksEvent = (_AKSEvent *)v24;
    }
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __33__FBSystemService_initWithQueue___block_invoke_19;
    v26[3] = &unk_1E4A12348;
    v27 = v7;
    atexit_b(v26);

  }
  return v7;
}

void __33__FBSystemService_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDomain:", v5);

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setService:", v6);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 48));
}

void __33__FBSystemService_initWithQueue___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;

  if (a2 == 5)
  {
    FBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __33__FBSystemService_initWithQueue___block_invoke_2_cold_1(v3);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23280]), "initWithReason:", CFSTR("SEP idle reboot"));
    objc_msgSend(v4, "setRebootType:", 1);
    objc_msgSend(*(id *)(a1 + 32), "shutdownUsingOptions:", v4);

  }
}

void __33__FBSystemService_initWithQueue___block_invoke_19(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareForExitAndRelaunch:", 1);

  }
  else
  {
    v2 = dispatch_semaphore_create(0);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__FBSystemService_initWithQueue___block_invoke_2_21;
    v7[3] = &unk_1E4A12348;
    v8 = v2;
    v4 = v2;
    objc_msgSend(v3, "performAsync:", v7);
    v5 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v4, v5);

  }
}

intptr_t __33__FBSystemService_initWithQueue___block_invoke_2_21(uint64_t a1)
{
  void *v2;

  +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForExitAndRelaunch:", 1);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (FBSystemService)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSystemService *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSystemService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBSystemService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSystemService.m");
    v17 = 1024;
    v18 = 214;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSystemService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBSystemService *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should NEVER be deallocated: %@"), "-[FBSystemService dealloc]", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBSystemService.m");
    v16 = 1024;
    v17 = 219;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[FBSystemService _setInfoProvider](self, "_setInfoProvider");
    v5 = obj;
  }

}

+ (NSString)currentOpenApplicationInstance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("missing thread-local storage on %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSystemService currentOpenApplicationInstance].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("FBOpenAppSystemServiceInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v8 = v7;
      goto LABEL_5;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_msgSend(v7, "classForCoder");
    if (!v14)
      v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("instance"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSystemService currentOpenApplicationInstance].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_14:
    JUMPOUT(0x1A35CCF08);
  }
LABEL_5:

  return (NSString *)v6;
}

- (void)shutdownAndReboot:(BOOL)a3
{
  FBSystemService *v3;
  SEL v4;
  unint64_t v5;
  int64_t v6;

  v3 = (FBSystemService *)-[FBSystemService shutdownWithOptions:forSource:](self, "shutdownWithOptions:forSource:", a3, 0);
  -[FBSystemService shutdownWithOptions:forSource:](v3, v4, v5, v6);
}

- (void)shutdownWithOptions:(unint64_t)a3 forSource:(int64_t)a4
{
  char v5;
  void *v7;
  void *v8;
  uint64_t v9;
  FBSystemService *v10;
  SEL v11;
  id v12;

  v5 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23280]), "initWithReason:", CFSTR("GenericSystemService"));
  v8 = v7;
  if ((v5 & 2) != 0)
    v9 = 2;
  else
    v9 = v5 & 1;
  objc_msgSend(v7, "setRebootType:", v9);
  objc_msgSend(v8, "setSource:", a4);
  v10 = (FBSystemService *)-[FBSystemService shutdownWithOptions:origin:](self, "shutdownWithOptions:origin:", v8, 0);
  -[FBSystemService shutdownUsingOptions:](v10, v11, v12);
}

- (void)shutdownUsingOptions:(id)a3
{
  FBSystemService *v3;
  SEL v4;
  id v5;
  id v6;

  v3 = (FBSystemService *)-[FBSystemService shutdownWithOptions:origin:](self, "shutdownWithOptions:origin:", a3, 0);
  -[FBSystemService shutdownWithOptions:origin:](v3, v4, v5, v6);
}

- (void)shutdownWithOptions:(id)a3 origin:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double *v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  _FBDarkBootHelper *v22;
  _FBDarkBootHelper *v23;
  NSObject *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  char v34;
  _QWORD v35[4];
  char v36;
  _BYTE buf[24];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "rebootType");
  v9 = objc_msgSend(v6, "isReboot");
  -[FBSystemService setPendingExit:](self, "setPendingExit:", 1);
  if (!objc_msgSend(v6, "isShutdown"))
  {
    +[FBAsynchronousShutdownTask startTaskWithName:timeout:workItem:](FBAsynchronousShutdownTask, "startTaskWithName:timeout:workItem:", CFSTR("NotifyNearField"), &__block_literal_global_51, 1.0);
    goto LABEL_5;
  }
  v10 = objc_msgSend(v6, "LPEMOption");
  if (v10)
    v11 = v10 == 2;
  else
    v11 = objc_msgSend(v6, "isUserInitiated") ^ 1;
  FBLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v11;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = objc_msgSend(v6, "isUserInitiated");
    _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "Performing shutdown for low power: %{BOOL}u; userInitiated: %{BOOL}u",
      buf,
      0xEu);
  }

  if ((v11 & 1) == 0)
    +[FBAsynchronousShutdownTask startTaskWithName:timeout:workItem:](FBAsynchronousShutdownTask, "startTaskWithName:timeout:workItem:", CFSTR("NotifyNearField"), &__block_literal_global_6, 1.0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = (uint64_t *)getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr;
  v38 = getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr;
  if (!getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr)
  {
    v15 = (void *)CoreBluetoothLibrary();
    v14 = (uint64_t *)dlsym(v15, "CBControllerLowPowerModeCompletionTimeoutSeconds");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v14;
    getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(buf, 8);
  if (v14)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = (double)*v14;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_3;
    v35[3] = &__block_descriptor_33_e56_v24__0__NSObject_OS_dispatch_queue__8___v____NSError__16l;
    v36 = v11;
    +[FBAsynchronousShutdownTask startTaskWithName:timeout:workItem:](FBAsynchronousShutdownTask, "startTaskWithName:timeout:workItem:", CFSTR("NotifyBluetooth"), v35, v17);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v18 = (double *)getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr;
    v38 = getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr;
    if (!getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr)
    {
      v19 = (void *)NearbyInteractionLibrary();
      v18 = (double *)dlsym(v19, "kNISystemShutdownCompletionTimeoutSeconds");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
      getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(buf, 8);
    if (v18)
    {
      v20 = *v18;
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5;
      v32[3] = &unk_1E4A12810;
      v34 = v11;
      v33 = v6;
      +[FBAsynchronousShutdownTask startTaskWithName:timeout:workItem:](FBAsynchronousShutdownTask, "startTaskWithName:timeout:workItem:", CFSTR("NotifyNearbyInteraction"), v32, v20);

LABEL_5:
      -[FBSystemService delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "systemService:prepareForShutdownWithOptions:origin:", self, v6, v7);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "systemServicePrepareForShutdown:withOptions:", self, -[FBSystemService _mapShutdownOptionsToOptions:](self, "_mapShutdownOptionsToOptions:", v6));
      }
      v21 = v8 == 2;
      -[FBSystemService _performExitTasksForRelaunch:](self, "_performExitTasksForRelaunch:", 0);
      v22 = objc_alloc_init(_FBDarkBootHelper);
      v23 = v22;
      if (v21)
        -[_FBDarkBootHelper setNextBootDark](v22, "setNextBootDark");
      FBLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v25)
        {
          v26 = -[_FBDarkBootHelper isBootingDark](v23, "isBootingDark");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v26;
          _os_log_impl(&dword_1A359A000, v24, OS_LOG_TYPE_DEFAULT, "Rebooting... options:%@ darkBootGotSet:%{BOOL}u", buf, 0x12u);
        }
      }
      else if (v25)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1A359A000, v24, OS_LOG_TYPE_DEFAULT, "Shutting Down... options:%@", buf, 0xCu);
      }

      +[FBAsynchronousShutdownTask waitForTasks](FBAsynchronousShutdownTask, "waitForTasks");
      if (reboot3())
        v27 = -1;
      else
        v27 = 0;
      exit(v27);
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSTimeInterval getkNISystemShutdownCompletionTimeoutSeconds(void)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("FBSystemService.m"), 81, CFSTR("%s"), dlerror());

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const NSInteger getCBControllerLowPowerModeCompletionTimeoutSeconds(void)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("FBSystemService.m"), 70, CFSTR("%s"), dlerror());

  }
  __break(1u);
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_2;
  v6[3] = &unk_1E4A12168;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "actOnUserInitiatedSystemShutDown:completion:", 2, v6);

}

uint64_t __46__FBSystemService_shutdownWithOptions_origin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = *(unsigned __int8 *)(a1 + 32);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)getCBControllerClass_softClass;
  v22 = getCBControllerClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCBControllerClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getCBControllerClass_block_invoke;
    v18[3] = &unk_1E4A11EE8;
    v18[4] = &v19;
    __getCBControllerClass_block_invoke((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  if (v7)
    v10 = 1;
  else
    v10 = 2;
  v11 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setDispatchQueue:", v5);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_4;
  v15[3] = &unk_1E4A127C8;
  v16 = v12;
  v17 = v6;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v14, "setLowPowerModeWithReason:completion:", v10, v15);

}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isUserInitiated"))
  {
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  v8 = v6;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v9 = getNINotifySystemShutdownWithReasonSymbolLoc_ptr;
  v14 = getNINotifySystemShutdownWithReasonSymbolLoc_ptr;
  if (!getNINotifySystemShutdownWithReasonSymbolLoc_ptr)
  {
    v10 = (void *)NearbyInteractionLibrary();
    v9 = dlsym(v10, "NINotifySystemShutdownWithReason");
    v12[3] = (uint64_t)v9;
    getNINotifySystemShutdownWithReasonSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v11, 8);
  if (!v9)
    __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5_cold_1();
  ((void (*)(uint64_t, id))v9)(v7, v8);

}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_7;
  v6[3] = &unk_1E4A12168;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "actOnUserInitiatedSystemShutDown:completion:", 4, v6);

}

uint64_t __46__FBSystemService_shutdownWithOptions_origin___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shutdownWithOptions:(unint64_t)a3
{
  FBSystemService *v3;
  SEL v4;
  BOOL v5;

  v3 = (FBSystemService *)-[FBSystemService shutdownWithOptions:forSource:](self, "shutdownWithOptions:forSource:", a3, 0);
  -[FBSystemService exitAndRelaunch:](v3, v4, v5);
}

- (void)exitAndRelaunch:(BOOL)a3
{
  -[FBSystemService exitAndRelaunch:withOptions:](self, "exitAndRelaunch:withOptions:", a3, 0);
}

- (void)prepareForExitAndRelaunch:(BOOL)a3
{
  -[FBSystemService exitAndRelaunch:withOptions:](self, "exitAndRelaunch:withOptions:", a3, 2);
}

- (void)setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  +[FBSystemShell sharedInstance](FBSystemShell, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSystemIdleSleepDisabled:forReason:", v4, v5);

}

- (void)prepareDisplaysForExit
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllDisplays");

}

- (BOOL)isPendingExit
{
  return BSAtomicGetFlag();
}

- (void)setPendingExit:(BOOL)a3
{
  BSAtomicSetFlag();
}

- (void)exitAndRelaunch:(BOOL)a3 withOptions:(unint64_t)a4
{
  char v4;
  _BOOL8 v5;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  __int16 v13;

  v4 = a4;
  v5 = a3;
  if (-[FBSystemService isPendingExit](self, "isPendingExit"))
    return;
  -[FBSystemService setPendingExit:](self, "setPendingExit:", 1);
  FBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v13 = 0;
      v9 = "Exiting...";
      v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1A359A000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (v8)
  {
    LOWORD(v12) = 0;
    v9 = "Tearing Down...";
    v10 = (uint8_t *)&v12;
    goto LABEL_7;
  }

  -[FBSystemService delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "systemServicePrepareForExit:andRelaunch:", self, v5);
  -[FBSystemService _performExitTasksForRelaunch:](self, "_performExitTasksForRelaunch:", v5, v12);
  if (!v5)
    BKSHIDServicesSetBacklightFactorWithFadeDuration();
  if ((v4 & 2) == 0)
    exit(0);

}

- (void)_terminateProcesses:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v11;
  void (**v12)(void);
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void (**v21)(void);
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  void (**v33)(void);
  uint8_t *v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v9 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v24 = a6;
  v12 = (void (**)(void))a7;
  v23 = v11;
  if (objc_msgSend(v11, "count"))
  {
    *(_QWORD *)buf = 0;
    v36 = buf;
    v37 = 0x2020000000;
    v38 = 0;
    v13 = (void *)MEMORY[0x1E0D22F88];
    v14 = objc_msgSend(v11, "count");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke;
    v32[3] = &unk_1E4A12858;
    v34 = buf;
    v33 = v12;
    objc_msgSend(v13, "sentinelWithSignalCount:signalHandler:", v14, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v20, "isCurrentProcess") & 1) != 0)
          {
            objc_msgSend(v15, "signal");
          }
          else
          {
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke_64;
            v25[3] = &unk_1E4A12880;
            v27 = buf;
            v26 = v15;
            objc_msgSend(v20, "_killForReason:andReport:withDescription:completion:", a4, v9, v24, v25);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v17);
    }

    _Block_object_dispose(buf, 8);
    v21 = v12;
  }
  else
  {
    FBLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A359A000, v22, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Found no processes to terminate.", buf, 2u);
    }

    v21 = v12;
    if (v12)
    {
      v12[2]();
      v21 = v12;
    }
  }

}

uint64_t __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "isComplete");
  if ((_DWORD)result)
  {
    FBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Completed termination of %lu process(es)", (uint8_t *)&v6, 0xCu);
    }

    result = *(_QWORD *)(a1 + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0);
  }
  return result;
}

uint64_t __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke_64(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  FBSystemService *v30;
  id v31;
  int64_t v32;
  unsigned int v33;
  id v34;
  _BYTE v35[32];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v9 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applicationProcessesForBundleIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v17 = v16;
  }
  else
  {
    v29 = v14;
    v30 = self;
    v31 = v13;
    v32 = a4;
    v33 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D87DB8];
    v34 = v12;
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "statesForPredicate:withDescriptor:error:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v25), "process");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "auditToken");
            objc_msgSend(v27, "registerProcessForAuditToken:", v35);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
              objc_msgSend(v17, "addObject:", v28);

          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v23);
    }

    v12 = v34;
    v9 = v33;
    v13 = v31;
    a4 = v32;
    v14 = v29;
    self = v30;
  }
  -[FBSystemService _terminateProcesses:forReason:andReport:withDescription:completion:](self, "_terminateProcesses:forReason:andReport:withDescription:completion:", v17, a4, v9, v13, v14);

}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  _BOOL4 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v22 = a5;
  v21 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a7;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allApplicationProcesses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
        if (a3 || objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "isForeground"))
          objc_msgSend(v12, "addObject:", v19, v21);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v12, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSystemService _terminateProcesses:forReason:andReport:withDescription:completion:](self, "_terminateProcesses:forReason:andReport:withDescription:completion:", v20, v21, v22, v10, v11);

}

- (void)_activateBundleID:(id)a3 requestID:(id)a4 isTrusted:(BOOL)a5 options:(id)a6 serviceInstance:(id)a7 source:(id)a8 originalSource:(id)a9 withResult:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  int v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  FBSystemService *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD *v74;
  _BYTE *v75;
  double v76;
  double v77;
  uint64_t v78;
  BOOL v79;
  char v80;
  _QWORD v81[3];
  char v82;
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v55 = a7;
  v18 = a8;
  v60 = a9;
  v57 = self;
  v59 = a10;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleID != ((void *)0)"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CE8DCLL);
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("requestID != ((void *)0)"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.2();
    objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CE940);
  }
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sourceToken != ((void *)0)"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.3();
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CE9A4);
  }
  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("originalSourceToken != ((void *)0)"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.4();
    objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CEA08);
  }
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("resultBlock != ((void *)0)"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.5();
    objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35CEA6CLL);
  }
  FBSystemAppBundleID();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v15, "isEqualToString:", v19);

  if (v20)
  {
    FBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Open request is targeting the system app itself; swizzling bundleID to nil.",
        buf,
        0xCu);
    }

    v15 = 0;
  }
  objc_msgSend(v17, "dictionary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKey:", *MEMORY[0x1E0D22D98]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "doubleValue");
  v23 = v22;
  v24 = CACurrentMediaTime();
  v25 = v23 <= 0.0 || v62 == 0;
  v26 = v25;
  v27 = fmin(v23, 30.0);
  if (v25)
    v28 = -0.0;
  else
    v28 = v27;
  if (v25)
    v29 = v23;
  else
    v29 = v27;
  objc_msgSend(v63, "objectForKey:", *MEMORY[0x1E0D22D38]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKey:", *MEMORY[0x1E0D22D30]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24 + v28;
  if (v61)
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v61);
    v33 = (void *)v32;
    if (v30)
      v34 = v26;
    else
      v34 = 0;
    if (v34 == 1 && v32)
    {
      v29 = fmin(fmax(v29, 0.0), 2.0);
      v31 = v31 + v29;
      v35 = 0x3FE0000000000000;
      goto LABEL_32;
    }
  }
  else
  {
    v33 = 0;
  }
  v35 = 0x4000000000000000;
  if ((v26 & 1) != 0)
  {
    v36 = v18;
    v37 = v33;
    v38 = 0;
    goto LABEL_35;
  }
LABEL_32:
  FBLogCommon();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v84 = *(uint64_t (**)(uint64_t, uint64_t))&v29;
    LOWORD(v85) = 2048;
    *(_QWORD *)((char *)&v85 + 2) = v35;
    _os_log_impl(&dword_1A359A000, v39, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Activation request for %{public}@ will wait %.2fs for app availability, with retry every %.2fs.", buf, 0x2Au);
  }

  v36 = v18;
  v37 = v33;
  v38 = 1;
LABEL_35:
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  v82 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v84 = __Block_byref_object_copy__2;
  *(_QWORD *)&v85 = __Block_byref_object_dispose__2;
  *((_QWORD *)&v85 + 1) = 0;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke;
  v64[3] = &unk_1E4A128F8;
  v64[4] = v57;
  v54 = v15;
  v65 = v54;
  v74 = v81;
  v75 = buf;
  v58 = v16;
  v66 = v58;
  v40 = v17;
  v67 = v40;
  v41 = v55;
  v68 = v41;
  v42 = v36;
  v69 = v42;
  v43 = v60;
  v70 = v43;
  v79 = a5;
  v44 = v30;
  v71 = v44;
  v45 = v37;
  v72 = v45;
  v80 = v38;
  v76 = v24;
  v77 = v31;
  v78 = v35;
  v46 = v59;
  v73 = v46;
  v47 = objc_msgSend(v64, "copy");
  v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v47;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)&buf[8] + 40) + 16))();
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v81, 8);
}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  int8x16_t v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  _QWORD v42[6];

  objc_msgSend(*(id *)(a1 + 32), "_applicationInfoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationInfoForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "sequenceNumber");
  v30 = v3;
  objc_msgSend(v3, "cacheGUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v7, "sequenceNumber");
    objc_msgSend(v7, "cacheGUID");
    v8 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v8;
  }
  else
  {
    v28 = v4;
    v29 = (void *)v5;
  }
  v9 = objc_alloc(MEMORY[0x1E0D22F58]);
  v10 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_2;
  v42[3] = &unk_1E4A128A8;
  v42[4] = *(_QWORD *)(a1 + 120);
  objc_msgSend(MEMORY[0x1E0D22F60], "responderWithHandler:", v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithInfo:responder:", 0, v11);

  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_BYTE *)(a1 + 152);
  v17 = *(_QWORD *)(a1 + 80);
  v18 = objc_msgSend(*(id *)(a1 + 88), "unsignedIntegerValue");
  v19 = *(_QWORD *)(a1 + 96);
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_3;
  v31[3] = &unk_1E4A128D0;
  v32 = v12;
  v41 = *(_BYTE *)(a1 + 153);
  v33 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 32);
  v34 = v20;
  v35 = v21;
  v40 = *(_QWORD *)(a1 + 144);
  v22 = *(_OWORD *)(a1 + 128);
  v38 = vextq_s8(*(int8x16_t *)(a1 + 112), *(int8x16_t *)(a1 + 112), 8uLL);
  v39 = v22;
  v36 = *(id *)(a1 + 72);
  v37 = *(id *)(a1 + 104);
  v23 = v12;
  LOBYTE(v24) = v16;
  objc_msgSend(v27, "_reallyActivateApplication:requestID:options:serviceInstance:source:originalSource:isTrusted:sequenceNumber:cacheGUID:ourSequenceNumber:ourCacheGUID:withResult:", v26, v25, v13, v14, v15, v17, v24, v18, v19, v28, v29, v31);

}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "code");

  if (v4 == 1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D22CD0]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if (v6 <= 9)
    {
      v7 = v6;
      if (((1 << v6) & 0x250) != 0)
      {
        if (*(_BYTE *)(a1 + 120))
        {
          FBLogCommon();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(_QWORD *)(a1 + 40);
            v10 = *(_QWORD *)(a1 + 48);
            FBSOpenApplicationErrorCodeToString();
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543874;
            v24 = v9;
            v25 = 2114;
            v26 = v10;
            v27 = 2114;
            v28 = v11;
            _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Retry attempt failed for %{public}@ with reason \"%{public}@\", (uint8_t *)&v23, 0x20u);

          }
          v12 = CACurrentMediaTime();
          if (*(double *)(a1 + 96) >= v12 || v12 >= *(double *)(a1 + 104))
          {
            if (v7 != 9 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
            {
              FBLogCommon();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v14 = *(_QWORD *)(a1 + 40);
                v15 = *(_QWORD *)(a1 + 48);
                FBSProcessPrettyDescription();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = 138543874;
                v24 = v14;
                v25 = 2114;
                v26 = v15;
                v27 = 2114;
                v28 = v16;
                _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Exhausted retry attempts for opening application: %{public}@ from source: %{public}@", (uint8_t *)&v23, 0x20u);

              }
              goto LABEL_14;
            }
            FBLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *(_QWORD *)(a1 + 40);
              v21 = *(_QWORD *)(a1 + 48);
              FBSProcessPrettyDescription();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 138543874;
              v24 = v20;
              v25 = 2114;
              v26 = v21;
              v27 = 2114;
              v28 = v22;
              _os_log_impl(&dword_1A359A000, v19, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Attempting final launch request of: %{public}@ from source: %{public}@", (uint8_t *)&v23, 0x20u);

            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "performAfter:withBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(double *)(a1 + 112));
          goto LABEL_15;
        }
      }
    }
  }
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

LABEL_15:
}

- (BOOL)_shouldPendRequestForClientSequenceNumber:(unint64_t)a3 clientCacheGUID:(id)a4 ourSequenceNumber:(unint64_t)a5 ourCacheGUID:(id)a6
{
  int v8;

  v8 = objc_msgSend(a4, "isEqual:", a6) ^ 1;
  if (a5 == a3)
    return v8;
  else
    return 1;
}

- (void)_reallyActivateApplication:(id)a3 requestID:(id)a4 options:(id)a5 serviceInstance:(id)a6 source:(id)a7 originalSource:(id)a8 isTrusted:(BOOL)a9 sequenceNumber:(unint64_t)a10 cacheGUID:(id)a11 ourSequenceNumber:(unint64_t)a12 ourCacheGUID:(id)a13 withResult:(id)a14
{
  id v19;
  id v20;
  FBSystemService *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *);
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void (**v31)(id, void *);
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  FBSystemServiceOpenApplicationRequest *v38;
  FBSystemService *v39;
  void *v40;
  void *v41;
  FBSystemServiceOpenApplicationRequest *v42;
  int v43;
  void *v44;
  id v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  id v50;
  void *v51;
  FBSystemService *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  FBSystemService *v59;
  FBSystemServiceOpenApplicationRequest *v60;
  id v61;
  id v62;
  id v63;
  void (**v64)(id, void *);
  _QWORD v65[4];
  id v66;
  FBSystemService *v67;
  id v68;
  id v69;
  id v70;
  void (**v71)(id, void *);
  _QWORD v72[4];
  id v73;
  FBSystemService *v74;
  FBSystemServiceOpenApplicationRequest *v75;
  void (**v76)(id, void *);
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  _BYTE v82[10];
  unint64_t v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  unint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v56 = a4;
  v20 = a5;
  v21 = self;
  v55 = v20;
  v54 = a6;
  v22 = a8;
  v23 = a11;
  v24 = a13;
  v25 = (void (**)(id, void *))a14;
  -[FBSystemService _applicationInfoProvider](v21, "_applicationInfoProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "applicationInfoForBundleIdentifier:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && v23)
  {
    v28 = v27;
    v29 = v22;
    FBLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "UUIDString");
      v52 = v21;
      v31 = v25;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v78 = v56;
      v79 = 2112;
      v80 = v19;
      v81 = 2114;
      *(_QWORD *)v82 = v32;
      *(_WORD *)&v82[8] = 2048;
      v83 = a10;
      v84 = 2114;
      v85 = (unint64_t)v24;
      v86 = 2048;
      v87 = a12;
      _os_log_impl(&dword_1A359A000, v30, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Attempting activation of %@ with {UUID: %{public}@, Sequence: %lu} vs {UUID: %{public}@, Sequence: %lu}", buf, 0x3Eu);

      v25 = v31;
      v21 = v52;
    }

    v22 = v29;
    v27 = v28;
    if (-[FBSystemService _shouldPendRequestForClientSequenceNumber:clientCacheGUID:ourSequenceNumber:ourCacheGUID:](v21, "_shouldPendRequestForClientSequenceNumber:clientCacheGUID:ourSequenceNumber:ourCacheGUID:", a10, v23, a12, v24))
    {
      v33 = v24;
      FBLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v78 = v56;
        v79 = 2114;
        v80 = v23;
        v81 = 2048;
        *(_QWORD *)v82 = a10;
        *(_WORD *)&v82[8] = 2114;
        v83 = (unint64_t)v33;
        v84 = 2048;
        v85 = a12;
        _os_log_impl(&dword_1A359A000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Pending activate request due to LS value mismatch.\n\tClient LS values: {%{public}@, %lu}\n\t Our LS values: {%{public}@, %lu}", buf, 0x34u);
      }
LABEL_21:

      FBSOpenApplicationErrorCreate();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v35);
      v24 = v33;
      goto LABEL_22;
    }
  }
  if (!v19 || v27)
  {
    if ((objc_msgSend(v27, "_isInstalling") & 1) != 0
      || (objc_msgSend(v27, "_isUninstalling") & 1) != 0
      || objc_msgSend(v27, "_isPendingUninstall") && (objc_msgSend(v27, "_isTentativeUninstall") & 1) == 0)
    {
      v33 = v24;
      FBLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_msgSend(v27, "_isInstalling");
        v44 = v27;
        v45 = v22;
        v46 = v43;
        v47 = objc_msgSend(v44, "_isUninstalling");
        v48 = objc_msgSend(v44, "_isPendingUninstall");
        *(_DWORD *)buf = 138544386;
        v78 = v56;
        v79 = 2112;
        v80 = v19;
        v81 = 1024;
        *(_DWORD *)v82 = v46;
        v22 = v45;
        v27 = v44;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v47;
        LOWORD(v83) = 1024;
        *(_DWORD *)((char *)&v83 + 2) = v48;
        _os_log_impl(&dword_1A359A000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Application \"%@\" is installing (%d), uninstalling (%d), or pending uninstall (%d) and cannot be launched.", buf, 0x28u);
      }
      goto LABEL_21;
    }
    -[FBSystemService delegate](v21, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v53 = v27;
      v36 = v23;
      v37 = v22;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v38 = -[FBSystemServiceOpenApplicationRequest initWithBundleId:]([FBSystemServiceOpenApplicationRequest alloc], "initWithBundleId:", v19);
        -[FBSystemServiceOpenApplicationRequest setTrusted:](v38, "setTrusted:", a9);
        -[FBSystemServiceOpenApplicationRequest setOptions:](v38, "setOptions:", v55);
        +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
        v39 = v21;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "registerProcessForHandle:", v22);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBSystemServiceOpenApplicationRequest setClientProcess:](v38, "setClientProcess:", v41);

        v22 = v37;
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke;
        v72[3] = &unk_1E4A12920;
        v73 = v35;
        v74 = v39;
        v75 = v38;
        v76 = v25;
        v42 = v38;
        FBOpenAppSystemServiceExecuteCallOut(v54, v72);

        v23 = v36;
      }
      else
      {
        objc_msgSend(v55, "url");
        v49 = objc_claimAutoreleasedReturnValue();
        v42 = (FBSystemServiceOpenApplicationRequest *)v49;
        v50 = v24;
        if (a9)
        {
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_2;
          v65[3] = &unk_1E4A12970;
          v66 = v35;
          v67 = v21;
          v68 = v19;
          v69 = v55;
          v70 = v22;
          v71 = v25;
          FBOpenAppSystemServiceExecuteCallOut(v54, v65);

          v51 = v66;
        }
        else if (v49)
        {
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_4;
          v57[3] = &unk_1E4A12998;
          v58 = v35;
          v59 = v21;
          v60 = v42;
          v61 = v19;
          v62 = v55;
          v63 = v22;
          v64 = v25;
          FBOpenAppSystemServiceExecuteCallOut(v54, v57);

          v51 = v58;
        }
        else
        {
          FBSOpenApplicationErrorCreate();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2](v25, v51);
        }

        v23 = v36;
        v24 = v50;
      }
      v27 = v53;
    }
    else
    {
      FBSOpenApplicationErrorCreate();
      v42 = (FBSystemServiceOpenApplicationRequest *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v42);
    }

  }
  else
  {
    FBSOpenApplicationErrorCreate();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v35);
  }
LABEL_22:

}

uint64_t __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemService:handleOpenApplicationRequest:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_3;
  v7[3] = &unk_1E4A12948;
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "systemService:handleOpenApplicationRequest:options:origin:withResult:", v3, v4, v5, v6, v7);

}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  FBSOpenApplicationErrorCodeToString();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  FBSOpenApplicationErrorCreate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_5;
  v8[3] = &unk_1E4A12948;
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "systemService:handleOpenURLRequest:application:options:origin:withResult:", v3, v4, v5, v6, v7, v8);

}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  FBSOpenApplicationErrorCodeToString();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  FBSOpenApplicationErrorCreate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

- (void)isPasscodeLockedOrBlockedWithResult:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  -[FBSystemService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "systemService:isPasscodeLockedOrBlockedWithResult:", self, v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)handleActions:(id)a3 source:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBSSerialQueue assertOnQueue](self->_queue, "assertOnQueue");
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __51__FBSystemService_handleActions_source_withResult___block_invoke;
  v30 = &unk_1E4A129C0;
  v11 = v8;
  v31 = v11;
  v12 = v10;
  v32 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8590C4C](&v27);
  -[FBSystemService delegate](self, "delegate", v27, v28, v29, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.frontboard.launchapplications")) & 1) == 0
    && (objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.backboardd.launchapplications")) & 1) == 0
    && (objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.springboard.launchapplications")) & 1) == 0)
  {
    FBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = CFSTR("com.apple.frontboard.launchapplications");
      _os_log_impl(&dword_1A359A000, v17, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Entitlement %@ is required to send actions to the system app.", buf, 0xCu);
    }
    v26 = 3;
    goto LABEL_14;
  }
  v15 = objc_opt_respondsToSelector();
  FBLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FBSystemService handleActions:source:withResult:].cold.1(v17, v19, v20, v21, v22, v23, v24, v25);
    v26 = 8;
LABEL_14:

    v13[2](v13, v26);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "fbs_singleLineDescriptionOfBSActions");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v18;
    _os_log_impl(&dword_1A359A000, v17, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Received action(s): %{public}@", buf, 0xCu);

  }
  objc_msgSend(v14, "systemService:handleActions:origin:withResult:", self, v11, v9, v13);
LABEL_15:

}

uint64_t __51__FBSystemService_handleActions_source_withResult___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;

  if (a2)
  {
    FBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__FBSystemService_handleActions_source_withResult___block_invoke_cold_1(a1, a2, v4);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)canOpenApplication:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  FBSystemService *v22;
  id v23;
  void (**v24)(id, id);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteProcess");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[FBSystemService _applicationInfoProvider](self, "_applicationInfoProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "applicationInfoForBundleIdentifier:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0;
        -[FBSystemService _isTrustedRequest:forCaller:fromClient:forBundleInfo:withOptions:fatalError:](self, "_isTrustedRequest:forCaller:fromClient:forBundleInfo:withOptions:fatalError:", CFSTR("(CanOpen)"), v9, v9, v11, 0, &v25);
        v12 = v25;
        if (v12)
        {
          v7[2](v7, v12);
        }
        else
        {
          -[FBSystemService delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "instance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            -[FBSystemService queue](self, "queue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke;
            v19[3] = &unk_1E4A12A38;
            v20 = v16;
            v21 = v14;
            v22 = self;
            v23 = v6;
            v24 = v7;
            v18 = v16;
            objc_msgSend(v17, "performAsync:", v19);

          }
          else
          {
            FBSOpenApplicationErrorCreate();
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v18);
          }

        }
      }
      else
      {
        FBSOpenApplicationErrorCreate();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v13);

      }
    }
    else
    {
      FBSOpenApplicationErrorCreate();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9);
    }

  }
}

void __49__FBSystemService_canOpenApplication_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke_2;
  v6[3] = &unk_1E4A12920;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 64);
  FBOpenAppSystemServiceExecuteCallOut(v2, v6);

}

void __49__FBSystemService_canOpenApplication_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke_3;
  v4[3] = &unk_1E4A12948;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "systemService:canActivateApplication:withResult:", v2, v3, v4);

}

void __49__FBSystemService_canOpenApplication_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    FBSOpenApplicationErrorCreate();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_143(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_LSFailedToOpenURL:withBundle:", v2, *(_QWORD *)(a1 + 40));

}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_149(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22D20]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22DB0]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22D68]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22D08]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D22D10]) & 1) != 0
    || objc_msgSend(v6, "hasSuffix:", CFSTR("4LS")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_161(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "code");

  if (v4 == 1)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_163(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2_164;
  v9[3] = &unk_1E4A12B00;
  v8 = *(_QWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  objc_msgSend(v1, "_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:", v2, v4, v3, v5, v6, v7, v8, v9);

}

uint64_t __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2_164(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0, a2);
}

- (void)_setInfoProvider
{
  os_unfair_lock_s *p_defaultInfoProviderLock;
  FBSApplicationInfoProvider *v4;
  FBSApplicationInfoProvider *lock_defaultInfoProvider;
  id WeakRetained;

  p_defaultInfoProviderLock = &self->_defaultInfoProviderLock;
  os_unfair_lock_lock(&self->_defaultInfoProviderLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "systemServiceApplicationInfoProvider:", self),
        (v4 = (FBSApplicationInfoProvider *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = (FBSApplicationInfoProvider *)objc_alloc_init(MEMORY[0x1E0D23120]);
  }
  lock_defaultInfoProvider = self->_lock_defaultInfoProvider;
  self->_lock_defaultInfoProvider = v4;

  os_unfair_lock_unlock(p_defaultInfoProviderLock);
}

- (void)_performExitTasksForRelaunch:(BOOL)a3
{
  void *v4;

  -[FBSystemService prepareDisplaysForExit](self, "prepareDisplaysForExit");
  if (objc_msgSend(MEMORY[0x1E0D23068], "isServerProcess"))
    objc_msgSend(MEMORY[0x1E0D23068], "synchronize");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronize");

  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!a3)
    signal(15, (void (__cdecl *)(int))1);
}

- (BOOL)_isAllowListedLaunchSuspendedApp:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (_isAllowListedLaunchSuspendedApp__onceToken != -1)
  {
    dispatch_once(&_isAllowListedLaunchSuspendedApp__onceToken, &__block_literal_global_184);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)_isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps, "containsObject:", v4);
LABEL_6:

  return v5;
}

void __52__FBSystemService__isAllowListedLaunchSuspendedApp___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.Music"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.AdSheetPhone"), CFSTR("com.apple.AdSheetPad"), CFSTR("com.apple.DataActivation"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps;
  _isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps = v0;

}

- (unint64_t)_mapShutdownOptionsToOptions:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "rebootType");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (FBSSerialQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_defaultInfoProvider, 0);
  objc_storeStrong((id *)&self->_legacyOpenServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AKSEvent *soft_AKSEventsRegister(__strong dispatch_queue_t, void (^__strong)(AKSEventType, CFDictionaryRef))");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBSystemService.m"), 55, CFSTR("%s"), dlerror());

  __break(1u);
}

void __33__FBSystemService_initWithQueue___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A359A000, log, OS_LOG_TYPE_ERROR, "Received device inactivity notification. Rebooting...", v1, 2u);
}

+ (void)currentOpenApplicationInstance
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_NINotifySystemShutdownWithReason(NISystemShutdownReason, void (^__strong)(NSError * _Nullable __strong))");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FBSystemService.m"), 80, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleActions:(uint64_t)a3 source:(uint64_t)a4 withResult:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a1, a3, "%s is not available with this system app", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

void __51__FBSystemService_handleActions_source_withResult___block_invoke_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[22];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  FBSOpenApplicationErrorCodeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_1();
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "[FBSystemService] Error handling sent actions %{public}@: %{public}@ (%d)", v6, 0x1Cu);

}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[FBSystemService][%{public}@] Ignoring click attribution from client without a valid report endpoint.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[FBSystemService][%{public}@] Ignoring click attribution that contained no authentication message.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)openApplication:(uint64_t)a3 withOptions:(NSObject *)a4 originator:requestID:completion:.cold.3(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_15(&dword_1A359A000, a4, a3, "[FBSystemService][%{public}@] Ignoring click attribution that failed authentication: %{public}@.", (uint8_t *)a3);

}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A359A000, a2, a3, "[FBSystemService][%{public}@] Ignoring click attribution from the past.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_15(&dword_1A359A000, a2, v5, "[%{public}@] %{public}@ called open application completion more than once. Ignoring.", v6);

}

@end

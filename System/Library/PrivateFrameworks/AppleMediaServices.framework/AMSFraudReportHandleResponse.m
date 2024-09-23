@implementation AMSFraudReportHandleResponse

id __AMSFraudReportHandleResponse_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  void (**v49)(_QWORD);
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  int v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  _UNKNOWN **v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  NSObject *v87;
  os_log_type_t v88;
  NSObject *v89;
  uint64_t v90;
  const char *v91;
  int v92;
  void *v93;
  NSObject *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  const char *v99;
  void *v100;
  id v101;
  void *v102;
  double v103;
  void *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  id obj;
  id obja;
  _QWORD v148[4];
  id v149;
  __int128 buf;
  void *v151;
  void *v152;
  id v153;
  id v154;
  id v155;
  id v156;
  double v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    AMSSetLogKeyIfNeeded();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_msgSend(v3, "ams_isLocalAccount") & 1) == 0 && (objc_msgSend(v3, "isActive") & 1) != 0)
    {
LABEL_19:

      if (!objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportInitURLResponse"))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportRetryResponse"))
        {
          +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v57)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v57, "OSLogObject");
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v59 = *(_QWORD *)(a1 + 48);
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v59;
            _os_log_impl(&dword_18C849000, v58, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling retry-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
          }

          v60 = *(id *)(a1 + 40);
          v61 = v3;
          AMSSetLogKeyIfNeeded();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          AMSFraudReportGetFSRHeadersForFraudReportResponse(v60, v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v151 = __AMSFraudReportHandleRetryFraudReportResponse_block_invoke;
          v152 = &unk_1E25424A8;
          v153 = v62;
          v64 = v62;
          objc_msgSend(v63, "continueWithBlock:", &buf);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v65 = objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportCallbackResponse");
          +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)v66;
          if (v65)
          {
            if (!v66)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v67, "OSLogObject");
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              v69 = *(_QWORD *)(a1 + 48);
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v69;
              _os_log_impl(&dword_18C849000, v68, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling callback-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
            }

            v70 = *(void **)(a1 + 40);
            v71 = *(void **)(a1 + 64);
            v72 = *(id *)(a1 + 56);
            v73 = v70;
            v74 = v71;
            v75 = v3;
            AMSSetLogKeyIfNeeded();
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            AMSFraudReportGetFSRHeadersForFraudReportResponse(v73, v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v151 = __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke;
            v152 = &unk_1E25424F8;
            v153 = v76;
            v154 = v73;
            v155 = v72;
            v156 = v74;
            v78 = v76;
            v79 = v73;
            v80 = v72;
            v81 = v74;
            objc_msgSend(v77, "continueWithBlock:", &buf);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (!v66)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v67, "OSLogObject");
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
            {
              v90 = *(_QWORD *)(a1 + 48);
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v90;
              _os_log_impl(&dword_18C849000, v89, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Skipping fraud report score refresh.", (uint8_t *)&buf, 0xCu);
            }

            +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v77);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
LABEL_143:

        return v12;
      }
      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 48);
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling init-URL-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
      }

      v17 = *(void **)(a1 + 40);
      v18 = *(void **)(a1 + 56);
      v19 = *(void **)(a1 + 64);
      v20 = *(void **)(a1 + 72);
      v21 = v18;
      v22 = v17;
      v23 = v3;
      v24 = v19;
      v25 = v20;
      AMSSetLogKeyIfNeeded();
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v22, "ams_fsrInitUrl");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLWithString:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v144 = (void *)v28;
      if (!v28)
      {
        v82 = v25;
        v83 = &off_1E2519000;
        +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v84)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v84, "OSLogObject");
        v85 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          goto LABEL_107;
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v145;
        v86 = "AMSFraudReport: [%{public}@] Failed to create init URL, not calling.";
        v87 = v85;
        v88 = OS_LOG_TYPE_ERROR;
        goto LABEL_106;
      }
      v29 = (void *)v28;
      objc_msgSend(v22, "ams_fsrNameSpace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ams_fsrRequestInterval");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v29;
      v33 = (void *)v31;
      v135 = v32;
      obj = v30;
      v34 = v33;
      v35 = v23;
      v137 = v25;
      v36 = v25;
      AMSSetLogKeyIfNeeded();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v23;
      v142 = v22;
      v139 = v24;
      if (v35)
      {
        if (v36)
        {
          v130 = v34;
          v133 = v3;
          objc_msgSend(v34, "doubleValue");
          v39 = v38;
          v40 = v37;
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = obj;
          v129 = v35;
          objc_msgSend(v35, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("%@::%@"), v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "objectForKeyedSubscript:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v151 = __AMSFraudReportShouldCallInitURL_block_invoke;
          v152 = &unk_1E2542480;
          v46 = v135;
          v47 = v135;
          v153 = v47;
          v157 = v39;
          v154 = v36;
          v48 = v44;
          v155 = v48;
          v131 = v40;
          v128 = v40;
          v156 = v128;
          v49 = (void (**)(_QWORD))_Block_copy(&buf);
          if (!v45)
          {
            +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v93)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v93, "OSLogObject");
            v94 = objc_claimAutoreleasedReturnValue();
            v3 = v133;
            v34 = v130;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
            {
              LODWORD(v158) = 138543362;
              *(_QWORD *)((char *)&v158 + 4) = v128;
              _os_log_impl(&dword_18C849000, v94, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] No persisted state for key, will call init URL.", (uint8_t *)&v158, 0xCu);
            }

            v49[2](v49);
            v92 = 1;
            v46 = v135;
            v37 = v131;
            goto LABEL_99;
          }
          -[NSObject objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", CFSTR("initURL"));
          v50 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v127 = (void *)v50;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v95)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v95, "OSLogObject");
            v96 = objc_claimAutoreleasedReturnValue();
            v3 = v133;
            v34 = v130;
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              LODWORD(v158) = 138543362;
              *(_QWORD *)((char *)&v158 + 4) = v128;
              _os_log_impl(&dword_18C849000, v96, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] No or malformed last init URL, will call init URL.", (uint8_t *)&v158, 0xCu);
            }

            v49[2](v49);
            v92 = 1;
            v46 = v135;
            v37 = v131;
            goto LABEL_98;
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v51;
          if (v51)
          {
            v34 = v130;
            if ((objc_msgSend(v51, "isEqual:", v47) & 1) != 0)
            {
              -[NSObject objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", CFSTR("date"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v52, "timeIntervalSinceNow");
                if (v39 >= -v53)
                {
                  v92 = 0;
                  goto LABEL_96;
                }
                +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v54)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v54, "OSLogObject");
                v55 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
LABEL_94:

                  v49[2](v49);
                  v92 = 1;
                  v46 = v135;
LABEL_96:

                  v3 = v133;
                  goto LABEL_97;
                }
                LODWORD(v158) = 138543362;
                *(_QWORD *)((char *)&v158 + 4) = v128;
                v56 = "AMSFraudReport: [%{public}@] Request interval elapsed, will call init URL.";
              }
              else
              {
                +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v54)
                {
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v54, "OSLogObject");
                v55 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                  goto LABEL_94;
                LODWORD(v158) = 138543362;
                *(_QWORD *)((char *)&v158 + 4) = v128;
                v56 = "AMSFraudReport: [%{public}@] No or malformed last init date, will call init URL.";
              }
              _os_log_impl(&dword_18C849000, v55, OS_LOG_TYPE_INFO, v56, (uint8_t *)&v158, 0xCu);
              goto LABEL_94;
            }
            +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v133;
            if (!v97)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v97, "OSLogObject");
            v98 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
LABEL_88:

              v49[2](v49);
              v92 = 1;
              v46 = v135;
LABEL_97:
              v37 = v131;

LABEL_98:
LABEL_99:

              v35 = v129;
              goto LABEL_100;
            }
            LODWORD(v158) = 138543362;
            *(_QWORD *)((char *)&v158 + 4) = v128;
            v99 = "AMSFraudReport: [%{public}@] Last init URL differs from current init URL, will call init URL.";
          }
          else
          {
            +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v133;
            v34 = v130;
            if (!v97)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v97, "OSLogObject");
            v98 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
              goto LABEL_88;
            LODWORD(v158) = 138543362;
            *(_QWORD *)((char *)&v158 + 4) = v128;
            v99 = "AMSFraudReport: [%{public}@] Unable to create last init URL, will call init URL.";
          }
          _os_log_impl(&dword_18C849000, v98, OS_LOG_TYPE_INFO, v99, (uint8_t *)&v158, 0xCu);
          goto LABEL_88;
        }
        +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v48, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v135;
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
LABEL_68:
          v92 = 1;
LABEL_100:

          if (v92)
          {
            v24 = v139;
            AMSFraudReportCallURL(v21, v46, 2, 0, v139);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v148[0] = MEMORY[0x1E0C809B0];
            v148[1] = 3221225472;
            v148[2] = __AMSFraudReportHandleInitURLFraudReportResponse_block_invoke;
            v148[3] = &unk_1E253FFE0;
            v149 = v145;
            objc_msgSend(v100, "resultWithCompletion:", v148);

            v84 = v149;
            v23 = v140;
            v22 = v142;
            v82 = v137;
            v83 = &off_1E2519000;
LABEL_108:

            if (v82)
            {
              v101 = v82;
              AMSSetLogKeyIfNeeded();
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "lastCleanupDate");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = v102;
              if (v102 && (objc_msgSend(v102, "timeIntervalSinceNow"), v103 >= -7257600.0))
              {
                objc_msgSend(v83[274], "sharedFraudReportConfig");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v121)
                {
                  objc_msgSend(v83[274], "sharedConfig");
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                }
                obja = v121;
                objc_msgSend(v121, "OSLogObject");
                v122 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v136;
                  _os_log_impl(&dword_18C849000, v122, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Not enough time passed since last persistent state cleanup, not cleaning up persistent state.", (uint8_t *)&buf, 0xCu);
                }

              }
              else
              {
                objc_msgSend(v83[274], "sharedFraudReportConfig");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v104)
                {
                  objc_msgSend(v83[274], "sharedConfig");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v134 = v3;
                objc_msgSend(v104, "OSLogObject");
                v105 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v136;
                  _os_log_impl(&dword_18C849000, v105, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Cleaning up old entries in persistent state.", (uint8_t *)&buf, 0xCu);
                }

                v106 = (void *)objc_opt_new();
                objc_msgSend(v101, "setLastCleanupDate:", v106);

                objc_msgSend(v101, "allKeys");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                v158 = 0u;
                v159 = 0u;
                v160 = 0u;
                v161 = 0u;
                obja = v107;
                v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v158, &buf, 16);
                if (v108)
                {
                  v109 = v108;
                  v138 = v82;
                  v141 = v23;
                  v143 = v22;
                  v110 = *(_QWORD *)v159;
                  while (1)
                  {
                    for (i = 0; i != v109; ++i)
                    {
                      if (*(_QWORD *)v159 != v110)
                        objc_enumerationMutation(obja);
                      v112 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * i);
                      objc_msgSend(v101, "objectForKeyedSubscript:", v112);
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v114 = v113;
                      else
                        v114 = 0;

                      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("date"));
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v116 = v115;
                      else
                        v116 = 0;

                      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("requestInterval"));
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {

                        v117 = 0;
LABEL_132:
                        objc_msgSend(v101, "setObject:forKeyedSubscript:", 0, v112);
                        goto LABEL_133;
                      }
                      if (!v116)
                        goto LABEL_132;
                      if (!v117)
                        goto LABEL_132;
                      objc_msgSend(v116, "timeIntervalSinceNow");
                      v119 = -v118;
                      objc_msgSend(v117, "doubleValue");
                      if (v120 < v119)
                        goto LABEL_132;
LABEL_133:

                    }
                    v109 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v158, &buf, 16);
                    if (!v109)
                    {
                      v3 = v134;
                      v23 = v141;
                      v22 = v143;
                      v82 = v138;
                      break;
                    }
                  }
                }
              }

            }
            +[AMSURLAction proceedAction](AMSURLAction, "proceedAction");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSOptional optionalWithValue:](AMSOptional, "optionalWithValue:", v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v124);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_143;
          }
          v83 = &off_1E2519000;
          +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v139;
          if (!v84)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v84, "OSLogObject");
          v85 = objc_claimAutoreleasedReturnValue();
          v23 = v140;
          v22 = v142;
          v82 = v137;
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
LABEL_107:

            goto LABEL_108;
          }
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v145;
          v86 = "AMSFraudReport [%{public}@] Don't need to call init URL at this point, not calling.";
          v87 = v85;
          v88 = OS_LOG_TYPE_INFO;
LABEL_106:
          _os_log_impl(&dword_18C849000, v87, v88, v86, (uint8_t *)&buf, 0xCu);
          goto LABEL_107;
        }
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v37;
        v91 = "AMSFraudReport: [%{public}@] Persistent state storage is not available, will call init URL.";
      }
      else
      {
        +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v48, "OSLogObject");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v135;
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v37;
        v91 = "AMSFraudReport: [%{public}@] No account available to look up persisted state, will call init URL.";
      }
      _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, v91, (uint8_t *)&buf, 0xCu);
      goto LABEL_68;
    }
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;

      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      v10 = "AMSFraudReport: [%{public}@] Fraud report: account overridden with the active account.";
    }
    else
    {
      if ((objc_msgSend(v3, "ams_isLocalAccount") & 1) != 0)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ams_localiTunesAccount");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      +[AMSLogConfig sharedFraudReportConfig](AMSLogConfig, "sharedFraudReportConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        v3 = v7;
        goto LABEL_18;
      }
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      v10 = "AMSFraudReport: [%{public}@] Fraud report: account overridden with the local account.";
    }
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, 0xCu);
    goto LABEL_17;
  }
  +[AMSOptional optionalWithNil](AMSOptional, "optionalWithNil");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

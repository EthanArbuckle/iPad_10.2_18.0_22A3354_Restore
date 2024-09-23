@implementation HMDRemoteMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  int64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  id *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  id v109;
  NSObject *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  NSObject *v122;
  void *v123;
  void *v124;
  void *v125;
  id *v127;
  id *v128;
  void *v129;
  void *v130;
  id *v131;
  uint64_t v132;
  _BOOL4 v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "isRemote"))
  {
    objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v148 = v18;
        v149 = 2114;
        v150 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing remote policy for message %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v14 = -1;
      goto LABEL_125;
    }
    v11 = objc_msgSend(v8, "remoteRestriction");
    v141 = a1;
    if (objc_msgSend(v10, "transportRestriction") == -1)
    {
      v13 = 0;
      v12 = 1;
    }
    else
    {
      v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;
      if ((unint64_t)(v11 - 1) >= 0xFFFFFFFFFFFFFFFELL)
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = a1;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transport");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v138 = v20;
          v25 = a5;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v148 = v23;
          v149 = 2112;
          v150 = v24;
          v151 = 2114;
          v152 = v26;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v25;
          v20 = v138;

          v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;
        }

        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, 0, CFSTR("Invalid transport"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = v141;
      }
      else
      {
        v13 = 0;
      }
      if ((objc_msgSend(v10, "transportRestriction") & v11) == 0)
      {
        v134 = v13;
        v27 = (void *)MEMORY[0x227676638]();
        v28 = a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v139 = v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transport");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v32 = a5;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v148 = v30;
          v149 = 2112;
          v150 = v31;
          v151 = 2114;
          v152 = v33;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v32;
          v27 = v139;
        }

        objc_autoreleasePoolPop(v27);
        v13 = v134;
        if (!v134)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Invalid transport"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = 0;
        a1 = v141;
      }
    }
    objc_msgSend(v9, "hmf_objectPassingTest:", &__block_literal_global_97442);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 4)
      +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    else
      objc_msgSend(v8, "remoteSourceDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "account");
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "requiresSecureMessage"))
    {
      if ((objc_msgSend(v8, "isSecureRemote") & 1) == 0)
      {
        v44 = (void *)MEMORY[0x227676638]();
        v45 = a1;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v148 = v47;
          v149 = 2114;
          v150 = v48;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be secure", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        if (v13)
          goto LABEL_39;
        v41 = (void *)MEMORY[0x24BDD1540];
        v42 = CFSTR("Message is required to be secure.");
        v43 = 17;
        goto LABEL_38;
      }
      if ((objc_msgSend(v10, "allowsAnonymousMessage") & 1) == 0)
      {
        v35 = objc_msgSend(v140, "isCurrentAccount");
        if (v11 != 4 && (v35 & 1) == 0 && !v137)
        {
          v36 = (void *)MEMORY[0x227676638]();
          v37 = a1;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v39;
            v149 = 2114;
            v150 = v40;
            _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to authenticate message %{public}@, not our account and no user message policy", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v36);
          if (v13)
            goto LABEL_39;
          v41 = (void *)MEMORY[0x24BDD1540];
          v42 = CFSTR("Unable to authenticate message.");
          v43 = 55;
LABEL_38:
          objc_msgSend(v41, "hmErrorWithCode:description:reason:suggestion:", v43, 0, v42, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
          v12 = 0;
          a1 = v141;
        }
      }
    }
    if (!objc_msgSend(v10, "requiresAccountMessage"))
      goto LABEL_53;
    if (v140)
    {
      if ((objc_msgSend(v140, "isCurrentAccount") & 1) != 0)
        goto LABEL_53;
      v49 = (void *)MEMORY[0x227676638]();
      v50 = a1;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "shortDescription");
        v135 = v13;
        v54 = a5;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v148 = v52;
        v149 = 2114;
        v150 = v53;
        v151 = 2112;
        v152 = v55;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be from the current account: %@", buf, 0x20u);

        a5 = v54;
        v13 = v135;

      }
      objc_autoreleasePoolPop(v49);
      if (v13)
      {
LABEL_52:
        v12 = 0;
        a1 = v141;
LABEL_53:
        if (!objc_msgSend(v10, "roles"))
        {
LABEL_116:
          if (a5)
          {
            if (v12)
              v125 = 0;
            else
              v125 = v13;
            *a5 = objc_retainAutorelease(v125);
          }
          if (v12)
            v14 = 1;
          else
            v14 = -1;

LABEL_125:
          goto LABEL_126;
        }
        objc_msgSend(v8, "remoteSourceDevice");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (uint64_t)v13;
        v133 = v12;
        if ((objc_msgSend(v10, "roles") & 1) == 0)
        {
          v132 = 0;
          goto LABEL_67;
        }
        if (v64)
        {
          v65 = a5;
          +[HMDCompanionManager sharedManager](HMDCompanionManager, "sharedManager");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "companion");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v64, "isRelatedToDevice:", v67);

          if (!v68)
          {
            v132 = 0;
            a5 = v65;
            a1 = v141;
            v12 = v133;
            goto LABEL_67;
          }
          v69 = (void *)MEMORY[0x227676638]();
          v70 = v141;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v72;
            v149 = 2114;
            v150 = v73;
            v132 = 1;
            _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from companion", buf, 0x16u);

          }
          else
          {
            v132 = 1;
          }
          a5 = v65;
          a1 = v141;
          v12 = v133;
        }
        else
        {
          v69 = (void *)MEMORY[0x227676638]();
          v74 = a1;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v75;
            v149 = 2114;
            v150 = v76;
            _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

            v12 = v133;
          }
          v132 = 0;
        }

        objc_autoreleasePoolPop(v69);
        v13 = (void *)v136;
LABEL_67:
        if ((objc_msgSend(v10, "roles") & 2) != 0)
        {
          if (v64)
          {
            v144 = 0u;
            v145 = 0u;
            v142 = 0u;
            v143 = 0u;
            +[HMDWatchManager sharedManager](HMDWatchManager, "sharedManager");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "watches");
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
            if (v79)
            {
              v80 = v79;
              v127 = a5;
              v81 = *(_QWORD *)v143;
              while (2)
              {
                for (i = 0; i != v80; ++i)
                {
                  if (*(_QWORD *)v143 != v81)
                    objc_enumerationMutation(v78);
                  if (objc_msgSend(v64, "isRelatedToDevice:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i)))
                  {
                    v83 = (void *)MEMORY[0x227676638]();
                    v84 = a1;
                    HMFGetOSLogHandle();
                    v85 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v8, "identifier");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v148 = v86;
                      v149 = 2114;
                      v150 = v87;
                      _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from watch", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v83);
                    a5 = v127;
                    ++v132;
                    a1 = v141;
                    goto LABEL_81;
                  }
                }
                v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
                if (v80)
                  continue;
                break;
              }
              a5 = v127;
            }
LABEL_81:

            v13 = (void *)v136;
            v12 = v133;
          }
          else
          {
            v88 = (void *)MEMORY[0x227676638]();
            v89 = a1;
            HMFGetOSLogHandle();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v92 = a5;
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v91;
              v149 = 2114;
              v150 = v93;
              _os_log_impl(&dword_2218F0000, v90, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

              a5 = v92;
              v13 = (void *)v136;

              v12 = v133;
            }

            objc_autoreleasePoolPop(v88);
            a1 = v141;
          }
        }
        if ((objc_msgSend(v10, "roles") & 4) != 0)
        {
          objc_msgSend(v137, "home");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v94;
          if (v94)
          {
            if (objc_msgSend(v94, "isCurrentDeviceAvailableResident"))
            {
              v128 = a5;
              v96 = (void *)MEMORY[0x227676638]();
              v97 = a1;
              HMFGetOSLogHandle();
              v98 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "identifier");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v148 = v99;
                v149 = 2114;
                v150 = v100;
                _os_log_impl(&dword_2218F0000, v98, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting resident", buf, 0x16u);

                v12 = v133;
              }

              objc_autoreleasePoolPop(v96);
              a5 = v128;
              v13 = (void *)v136;
LABEL_115:

              goto LABEL_116;
            }
          }
          else
          {
            v101 = (void *)MEMORY[0x227676638]();
            v102 = a1;
            HMFGetOSLogHandle();
            v103 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v148 = v104;
              _os_log_impl(&dword_2218F0000, v103, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              v12 = v133;
            }

            objc_autoreleasePoolPop(v101);
            a1 = v141;
          }

          v13 = (void *)v136;
        }
        if ((objc_msgSend(v10, "roles") & 8) != 0)
        {
          objc_msgSend(v137, "home");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v105;
          if (v105)
          {
            v107 = objc_msgSend(v105, "isCurrentDevicePrimaryResident");
            v108 = (void *)MEMORY[0x227676638]();
            v109 = a1;
            HMFGetOSLogHandle();
            v110 = objc_claimAutoreleasedReturnValue();
            v111 = v110;
            if (v107)
            {
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "identifier");
                v129 = v108;
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v148 = v112;
                v149 = 2114;
                v150 = v113;
                _os_log_impl(&dword_2218F0000, v111, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting the primary resident", buf, 0x16u);

                v108 = v129;
              }

              objc_autoreleasePoolPop(v108);
              v13 = (void *)v136;
              v12 = v133;
              goto LABEL_115;
            }
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v130 = v108;
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v118;
              v149 = 2114;
              v150 = v119;
              _os_log_impl(&dword_2218F0000, v111, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ can only be handled by the primary resident", buf, 0x16u);

              v108 = v130;
            }

            objc_autoreleasePoolPop(v108);
            v12 = v133;
            if (!v136)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3202);
              v136 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v114 = (void *)MEMORY[0x227676638]();
            v115 = a1;
            HMFGetOSLogHandle();
            v116 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v148 = v117;
              _os_log_impl(&dword_2218F0000, v116, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              v12 = v133;
            }

            objc_autoreleasePoolPop(v114);
          }

          v13 = (void *)v136;
          a1 = v141;
        }
        if (!v132)
        {
          v131 = a5;
          v120 = (void *)MEMORY[0x227676638]();
          v121 = a1;
          HMFGetOSLogHandle();
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v123;
            v149 = 2114;
            v150 = v124;
            _os_log_impl(&dword_2218F0000, v122, OS_LOG_TYPE_ERROR, "%{public}@Failed to satisfy the role(s) for message %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v120);
          if (!v13)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 10, 0, CFSTR("Failed to satisfy the role(s)"), 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v12 = 0;
          a5 = v131;
        }
        goto LABEL_115;
      }
      v56 = (void *)MEMORY[0x24BDD1540];
      v57 = CFSTR("Message is required to be from the current account");
      v58 = 17;
    }
    else
    {
      v59 = (void *)MEMORY[0x227676638]();
      v60 = a1;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v148 = v62;
        v149 = 2114;
        v150 = v63;
        _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the account of the message %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v59);
      if (v13)
        goto LABEL_52;
      v56 = (void *)MEMORY[0x24BDD1540];
      v57 = CFSTR("Unable to determine the account of the message");
      v58 = 2;
    }
    objc_msgSend(v56, "hmErrorWithCode:description:reason:suggestion:", v58, 0, v57, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  v14 = 0;
LABEL_126:

  return v14;
}

uint64_t __59__HMDRemoteMessageFilter_filterMessage_withPolicies_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

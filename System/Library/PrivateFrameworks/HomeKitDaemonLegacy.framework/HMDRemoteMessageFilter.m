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
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  void *v98;
  id v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v105;
  void *v106;
  void *context;
  void *contexta;
  void *contextb;
  _BOOL4 v110;
  _BOOL4 v111;
  _BOOL4 v112;
  _BOOL4 v113;
  _BOOL4 v114;
  id *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t v127[128];
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "isRemote"))
  {
    objc_msgSend(a1, "requiredPolicyOfClass:fromPolicies:error:", objc_opt_class(), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
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
        v129 = v18;
        v130 = 2114;
        v131 = v19;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing remote policy for message %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v14 = -1;
      goto LABEL_112;
    }
    v11 = objc_msgSend(v8, "remoteRestriction");
    v115 = a5;
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
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = a1;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v120 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transport");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v129 = v23;
          v130 = 2112;
          v131 = v24;
          v132 = 2114;
          v133 = v25;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v115;
          v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;

          v20 = v120;
        }

        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, 0, CFSTR("Invalid transport"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      if ((objc_msgSend(v10, "transportRestriction") & v11) == 0)
      {
        v116 = v13;
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = a1;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v121 = v26;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transport");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v129 = v29;
          v130 = 2112;
          v131 = v30;
          v132 = 2114;
          v133 = v31;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v115;
          v26 = v121;
        }

        objc_autoreleasePoolPop(v26);
        v13 = v116;
        if (!v116)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Invalid transport"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = 0;
      }
    }
    objc_msgSend(v9, "hmf_objectPassingTest:", &__block_literal_global_67948);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 4)
      +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    else
      objc_msgSend(v8, "remoteSourceDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "account");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v122 = v33;
    if (objc_msgSend(v10, "requiresSecureMessage"))
    {
      if ((objc_msgSend(v8, "isSecureRemote") & 1) == 0)
      {
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        v44 = a1;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v129 = v46;
          v130 = 2114;
          v131 = v47;
          _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be secure", buf, 0x16u);

          a5 = v115;
        }

        objc_autoreleasePoolPop(v43);
        if (v13)
          goto LABEL_39;
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v41 = CFSTR("Message is required to be secure.");
        v42 = 17;
        goto LABEL_38;
      }
      if ((objc_msgSend(v10, "allowsAnonymousMessage") & 1) == 0)
      {
        v34 = objc_msgSend(v33, "isCurrentAccount");
        if (v11 != 4 && (v34 & 1) == 0 && !v119)
        {
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = a1;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v129 = v38;
            v130 = 2114;
            v131 = v39;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to authenticate message %{public}@, not our account and no user message policy", buf, 0x16u);

            a5 = v115;
          }

          objc_autoreleasePoolPop(v35);
          if (v13)
            goto LABEL_39;
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v41 = CFSTR("Unable to authenticate message.");
          v42 = 55;
LABEL_38:
          objc_msgSend(v40, "hmErrorWithCode:description:reason:suggestion:", v42, 0, v41, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
          v12 = 0;
          v33 = v122;
        }
      }
    }
    if (objc_msgSend(v10, "requiresAccountMessage"))
    {
      if (v33)
      {
        if ((objc_msgSend(v33, "isCurrentAccount") & 1) == 0)
        {
          v117 = v13;
          v48 = (void *)MEMORY[0x1D17BA0A0]();
          v49 = a1;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "shortDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v129 = v51;
            v130 = 2114;
            v131 = v52;
            v132 = 2112;
            v133 = v53;
            _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be from the current account: %@", buf, 0x20u);

            a5 = v115;
            v33 = v122;

          }
          objc_autoreleasePoolPop(v48);
          v13 = v117;
          if (!v117)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Message is required to be from the current account"), 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v12 = 0;
        }
      }
      else
      {
        v54 = (void *)MEMORY[0x1D17BA0A0]();
        v55 = a1;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v129 = v57;
          v130 = 2114;
          v131 = v58;
          _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the account of the message %{public}@", buf, 0x16u);

          a5 = v115;
        }

        objc_autoreleasePoolPop(v54);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, 0, CFSTR("Unable to determine the account of the message"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = 0;
        v33 = v122;
      }
    }
    if (!objc_msgSend(v10, "roles"))
      goto LABEL_103;
    objc_msgSend(v8, "remoteSourceDevice");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v13;
    if ((objc_msgSend(v10, "roles") & 1) == 0)
    {
      v60 = 0;
      goto LABEL_66;
    }
    if (v59)
    {
      v110 = v12;
      +[HMDCompanionManager sharedManager](HMDCompanionManager, "sharedManager");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "companion");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v59, "isRelatedToDevice:", v62);

      if (!v63)
      {
        v60 = 0;
        a5 = v115;
        v12 = v110;
LABEL_66:
        if ((objc_msgSend(v10, "roles") & 2) != 0)
        {
          contexta = (void *)v60;
          if (v59)
          {
            v111 = v12;
            v125 = 0u;
            v126 = 0u;
            v123 = 0u;
            v124 = 0u;
            +[HMDWatchManager sharedManager](HMDWatchManager, "sharedManager");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "watches");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
            if (v74)
            {
              v75 = v74;
              v76 = *(_QWORD *)v124;
              while (2)
              {
                for (i = 0; i != v75; ++i)
                {
                  if (*(_QWORD *)v124 != v76)
                    objc_enumerationMutation(v73);
                  if (objc_msgSend(v59, "isRelatedToDevice:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i)))
                  {
                    v78 = (void *)MEMORY[0x1D17BA0A0]();
                    v79 = a1;
                    HMFGetOSLogHandle();
                    v80 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v105 = v78;
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v8, "identifier");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v129 = v81;
                      v130 = 2114;
                      v131 = v82;
                      _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from watch", buf, 0x16u);

                      v78 = v105;
                    }

                    objc_autoreleasePoolPop(v78);
                    v60 = (uint64_t)contexta + 1;
                    a5 = v115;
                    v33 = v122;
                    goto LABEL_81;
                  }
                }
                v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
                if (v75)
                  continue;
                break;
              }
              a5 = v115;
            }
            v60 = (uint64_t)contexta;
LABEL_81:

            v13 = v118;
            v12 = v111;
          }
          else
          {
            v83 = (void *)MEMORY[0x1D17BA0A0]();
            v84 = a1;
            HMFGetOSLogHandle();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v112 = v12;
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "identifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v129 = v86;
              v130 = 2114;
              v131 = v87;
              _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

              a5 = v115;
              v12 = v112;
            }

            objc_autoreleasePoolPop(v83);
            v13 = v118;
            v33 = v122;
            v60 = (uint64_t)contexta;
          }
        }
        if ((objc_msgSend(v10, "roles") & 4) != 0)
        {
          objc_msgSend(v119, "home");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v88;
          if (v88)
          {
            if (objc_msgSend(v88, "isCurrentDeviceAvailableResident"))
            {
              v90 = (void *)MEMORY[0x1D17BA0A0]();
              v91 = a1;
              HMFGetOSLogHandle();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v113 = v12;
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "identifier");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v129 = v93;
                v130 = 2114;
                v131 = v94;
                _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting resident", buf, 0x16u);

                a5 = v115;
                v12 = v113;
              }

              objc_autoreleasePoolPop(v90);
              v13 = v118;
              goto LABEL_101;
            }
          }
          else
          {
            contextb = (void *)v60;
            v106 = (void *)MEMORY[0x1D17BA0A0]();
            v95 = a1;
            HMFGetOSLogHandle();
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v114 = v12;
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v129 = v97;
              _os_log_impl(&dword_1CD062000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              v12 = v114;
            }

            objc_autoreleasePoolPop(v106);
            v33 = v122;
            v60 = (uint64_t)contextb;
          }

          v13 = v118;
        }
        if (v60)
        {
LABEL_102:

LABEL_103:
          if (a5)
          {
            if (v12)
              v103 = 0;
            else
              v103 = v13;
            *a5 = objc_retainAutorelease(v103);
          }
          if (v12)
            v14 = 1;
          else
            v14 = -1;

LABEL_112:
          goto LABEL_113;
        }
        v98 = (void *)MEMORY[0x1D17BA0A0]();
        v99 = a1;
        HMFGetOSLogHandle();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v129 = v101;
          v130 = 2114;
          v131 = v102;
          _os_log_impl(&dword_1CD062000, v100, OS_LOG_TYPE_ERROR, "%{public}@Failed to satisfy the role(s) for message %{public}@", buf, 0x16u);

          a5 = v115;
        }

        objc_autoreleasePoolPop(v98);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 10, 0, CFSTR("Failed to satisfy the role(s)"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = 0;
LABEL_101:
        v33 = v122;
        goto LABEL_102;
      }
      context = (void *)MEMORY[0x1D17BA0A0]();
      v64 = a1;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      v60 = 1;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v129 = v66;
        v130 = 2114;
        v131 = v67;
        v60 = 1;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from companion", buf, 0x16u);

      }
      a5 = v115;
      v33 = v122;
      v12 = v110;
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v68 = a1;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v69 = v12;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v129 = v70;
        v130 = 2114;
        v131 = v71;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

        a5 = v115;
        v12 = v69;
      }
      v60 = 0;
      v33 = v122;
    }

    objc_autoreleasePoolPop(context);
    v13 = v118;
    goto LABEL_66;
  }
  v14 = 0;
LABEL_113:

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

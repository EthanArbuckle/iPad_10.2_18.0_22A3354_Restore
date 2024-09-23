@implementation HMDUserMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  unint64_t v34;
  __CFString *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  __CFString *v45;
  __CFString *v46;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  __CFString *v67;
  __int16 v68;
  __CFString *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "proxyConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "isRemote");
  v12 = v11;
  if (v10 || v11)
  {
    objc_msgSend(a1, "policyOfClass:fromPolicies:", objc_opt_class(), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v13 = 1;
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v14, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v22;
        v62 = 2112;
        v63 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@The home is no longer valid for message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, CFSTR("Home is no longer valid."), 0, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = -1;
      goto LABEL_43;
    }
    objc_msgSend(v8, "userForHome:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (HMDUserPrivilegeCompare(objc_msgSend(v17, "privilege"), objc_msgSend(v15, "userPrivilege")) == -1)
      {
        v31 = (void *)MEMORY[0x227676638]();
        v32 = a1;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v55 = v31;
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shortDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v15, "userPrivilege");
          if (v34 > 5)
            v35 = CFSTR("None");
          else
            v35 = off_24E793D90[v34];
          v52 = v35;
          v44 = objc_msgSend(v18, "privilege");
          if (v44 > 5)
            v45 = CFSTR("None");
          else
            v45 = off_24E793D90[v44];
          v46 = v45;
          *(_DWORD *)buf = 138544386;
          v61 = v57;
          v62 = 2112;
          v63 = v54;
          v64 = 2112;
          v65 = v53;
          v66 = 2112;
          v67 = v52;
          v68 = 2112;
          v69 = v46;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Insufficient privilege for user: [%@] [%@] / (required: %@, actual: %@)", buf, 0x34u);

          v31 = v55;
        }

        objc_autoreleasePoolPop(v31);
        if (!a5)
          goto LABEL_41;
        v42 = (void *)MEMORY[0x24BDD1540];
        v43 = 17;
      }
      else
      {
        if (!objc_msgSend(a1, "areWeGoingToRejectMessage:basedOnRemoteAccessPolicy:forUser:", v8, v15, v18)|| objc_msgSend(v15, "useProofOfLocality")&& (objc_msgSend(v8, "shouldWeProcessRemoteMessageDespiteNoRemoteAccessAllowedForUser:", v18) & 1) != 0)
        {
          if (!v12
            || !objc_msgSend(v15, "requiresCameraStreamingAccess")
            || (objc_msgSend(v18, "camerasAccessLevel"), (HMUserIsStreamingAllowedWithCameraAccessLevel() & 1) != 0))
          {
            v13 = 1;
LABEL_42:

LABEL_43:
            goto LABEL_44;
          }
          v48 = (void *)MEMORY[0x227676638]();
          v49 = a1;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v51;
            _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@User does not have access to view remote camera streams", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v48);
LABEL_41:
          v13 = -1;
          goto LABEL_42;
        }
        v36 = (void *)MEMORY[0x227676638]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v58 = v36;
          v59 = v18;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "shortDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v39;
          v62 = 2112;
          v63 = v40;
          v64 = 2112;
          v65 = v41;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Message %@ arrived on a non-direct transport from user does not have remote access: %@", buf, 0x20u);

          v36 = v58;
          v18 = v59;

        }
        objc_autoreleasePoolPop(v36);
        if (!a5)
          goto LABEL_41;
        v42 = (void *)MEMORY[0x24BDD1540];
        v43 = 10;
      }
      objc_msgSend(v42, "hmErrorWithCode:", v43);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v56 = v24;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v27;
        v62 = 2112;
        v63 = v28;
        v64 = 2112;
        v65 = v29;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine user of home, %@, for message: %@", buf, 0x20u);

        v24 = v56;
        v18 = 0;
      }

      objc_autoreleasePoolPop(v24);
      if (!a5)
        goto LABEL_41;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 10, 0, CFSTR("Unable to determine user."), 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a5 = v30;
    goto LABEL_41;
  }
  v13 = 0;
LABEL_45:

  return v13;
}

+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "requiresRemoteAccess")
    && (objc_msgSend(v8, "isRemoteAccessAllowed") & 1) == 0
    && objc_msgSend(v7, "isRemote")
    && (objc_msgSend(v7, "remoteRestriction") & 0xE) == 0;

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_207855 != -1)
    dispatch_once(&logCategory__hmf_once_t6_207855, &__block_literal_global_207856);
  return (id)logCategory__hmf_once_v7_207857;
}

void __35__HMDUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_207857;
  logCategory__hmf_once_v7_207857 = v0;

}

@end

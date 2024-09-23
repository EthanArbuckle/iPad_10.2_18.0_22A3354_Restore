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
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  unint64_t v42;
  __CFString *v43;
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

  v70 = *MEMORY[0x1E0C80C00];
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
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(v14, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v30;
        v62 = 2112;
        v63 = v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@The home is no longer valid for message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, CFSTR("Home is no longer valid."), 0, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = -1;
      goto LABEL_41;
    }
    objc_msgSend(v8, "userForHome:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (HMDUserPrivilegeCompare(objc_msgSend(v17, "privilege"), objc_msgSend(v15, "userPrivilege")) == -1)
      {
        v39 = (void *)MEMORY[0x1D17BA0A0]();
        v40 = a1;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v55 = v39;
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shortDescription");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v15, "userPrivilege");
          if (v42 > 4)
            v43 = CFSTR("None");
          else
            v43 = off_1E89BB648[v42];
          v52 = v43;
          v44 = objc_msgSend(v18, "privilege");
          if (v44 > 4)
            v45 = CFSTR("None");
          else
            v45 = off_1E89BB648[v44];
          v46 = v45;
          *(_DWORD *)buf = 138544386;
          v61 = v58;
          v62 = 2112;
          v63 = v54;
          v64 = 2112;
          v65 = v53;
          v66 = 2112;
          v67 = v52;
          v68 = 2112;
          v69 = v46;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Insufficient privilege for user: [%@] [%@] / (required: %@, actual: %@)", buf, 0x34u);

          v39 = v55;
        }

        objc_autoreleasePoolPop(v39);
        if (!a5)
          goto LABEL_39;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = 17;
      }
      else
      {
        if (!objc_msgSend(a1, "areWeGoingToRejectMessage:basedOnRemoteAccessPolicy:forUser:", v8, v15, v18))
        {
          if (!v12
            || !objc_msgSend(v15, "requiresCameraStreamingAccess")
            || (objc_msgSend(v18, "camerasAccessLevel"), (HMUserIsStreamingAllowedWithCameraAccessLevel() & 1) != 0))
          {
            v13 = 1;
LABEL_40:

LABEL_41:
            goto LABEL_42;
          }
          v48 = (void *)MEMORY[0x1D17BA0A0]();
          v49 = a1;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = v51;
            _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@User does not have access to view remote camera streams", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v48);
LABEL_39:
          v13 = -1;
          goto LABEL_40;
        }
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = a1;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v56 = v19;
          v59 = v18;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "shortDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v22;
          v62 = 2112;
          v63 = v23;
          v64 = 2112;
          v65 = v24;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Message %@ arrived on a non-direct transport from user does not have remote access: %@", buf, 0x20u);

          v19 = v56;
          v18 = v59;

        }
        objc_autoreleasePoolPop(v19);
        if (!a5)
          goto LABEL_39;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = 10;
      }
      objc_msgSend(v25, "hmErrorWithCode:", v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = a1;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v57 = v32;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v35;
        v62 = 2112;
        v63 = v36;
        v64 = 2112;
        v65 = v37;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine user of home, %@, for message: %@", buf, 0x20u);

        v32 = v57;
        v18 = 0;
      }

      objc_autoreleasePoolPop(v32);
      if (!a5)
        goto LABEL_39;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 10, 0, CFSTR("Unable to determine user."), 0, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a5 = v38;
    goto LABEL_39;
  }
  v13 = 0;
LABEL_43:

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_149318 != -1)
    dispatch_once(&logCategory__hmf_once_t6_149318, &__block_literal_global_149319);
  return (id)logCategory__hmf_once_v7_149320;
}

+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "requiresRemoteAccess");

  v12 = v11
     && (objc_msgSend(v8, "isRemoteAccessAllowed") & 1) == 0
     && objc_msgSend(v7, "isRemote")
     && (objc_msgSend(v7, "remoteRestriction") & 0xE) == 0
     && (objc_msgSend(v10, "isResidentFirstAccessoryCommunicationEnabled") & 1) != 0;

  return v12;
}

void __35__HMDUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_149320;
  logCategory__hmf_once_v7_149320 = v0;

}

@end

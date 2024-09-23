@implementation HMDHelper

- (HMDHelper)initWithExternalProtocol:(id)a3
{
  id v5;
  HMDHelper *v6;
  HMDHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHelper;
  v6 = -[HMDHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_externalProtocol, a3);

  return v7;
}

- (id)hashedRouteIDForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  __int128 *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDHelper externalProtocol](self, "externalProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createAFSecurityConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v38) = 138543362;
        *(_QWORD *)((char *)&v38 + 4) = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot set up a connection to assistantServices framework to hash the routeID", (uint8_t *)&v38, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v14 = 0;
      goto LABEL_15;
    }
    v7 = dispatch_group_create();
    *(_QWORD *)&v38 = 0;
    *((_QWORD *)&v38 + 1) = &v38;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__157420;
    v41 = __Block_byref_object_dispose__157421;
    v42 = 0;
    dispatch_group_enter(v7);
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __40__HMDHelper_hashedRouteIDForIdentifier___block_invoke;
    v30[3] = &unk_1E89BB9A0;
    v33 = &v38;
    v31 = v6;
    v9 = v7;
    v32 = v9;
    objc_msgSend(v31, "processData:usingProcedure:completion:", v8, 1, v30);
    v10 = dispatch_time(0, 15000000000);
    if (dispatch_group_wait(v9, v10))
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v13;
        v36 = 2112;
        v37 = v4;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Timed out encoding routeID %@", buf, 0x16u);

      }
    }
    else
    {
      v22 = *(void **)(*((_QWORD *)&v38 + 1) + 40);
      if (v22)
      {
        objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        if (v14)
        {
          HMFGetOSLogHandle();
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v25;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Base64-converted hashedRouteUID %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          goto LABEL_8;
        }
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(void **)(*((_QWORD *)&v38 + 1) + 40);
          *(_DWORD *)buf = 138543618;
          v35 = v28;
          v36 = 2112;
          v37 = v29;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to base64 encode hashedRouteUIDData %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
LABEL_7:
        v14 = 0;
LABEL_8:

        _Block_object_dispose(&v38, 8);
LABEL_15:

        goto LABEL_16;
      }
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        v36 = 2112;
        v37 = v4;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode routeID %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 138543362;
    *(_QWORD *)((char *)&v38 + 4) = v17;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@nil routeID - nothing to hash", (uint8_t *)&v38, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_16:

  return v14;
}

- (HMDHelperExternalProtocol)externalProtocol
{
  return self->_externalProtocol;
}

- (void)setExternalProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_externalProtocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalProtocol, 0);
}

void __40__HMDHelper_hashedRouteIDForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Hashed routeUID as %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)sharedHelper
{
  return (id)_helper;
}

+ (void)setSharedHelper:(id)a3
{
  objc_storeStrong((id *)&_helper, a3);
}

@end

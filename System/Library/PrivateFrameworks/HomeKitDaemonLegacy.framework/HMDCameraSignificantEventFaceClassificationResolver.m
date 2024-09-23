@implementation HMDCameraSignificantEventFaceClassificationResolver

- (HMDCameraSignificantEventFaceClassificationResolver)initWithHome:(id)a3
{
  id v4;
  HMDCameraSignificantEventFaceClassificationResolver *v5;
  HMDCameraSignificantEventFaceClassificationResolver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraSignificantEventFaceClassificationResolver;
  v5 = -[HMDCameraSignificantEventFaceClassificationResolver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_home, v4);

  return v6;
}

- (id)faceClassificationForSignificantEventFaceClassifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDCameraSignificantEventFaceClassificationResolver home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassificationResolver _faceClassificationForSignificantEventFaceClassifications:user:](self, "_faceClassificationForSignificantEventFaceClassifications:user:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_faceClassificationForSignificantEventFaceClassifications:(id)a3 user:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  HMDCameraSignificantEventFaceClassificationResolver *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDCameraSignificantEventFaceClassificationResolver *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;
  id v58;
  HMDCameraSignificantEventFaceClassificationResolver *v59;
  void *v60;
  id obj;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v58 = a4;
  -[HMDCameraSignificantEventFaceClassificationResolver home](self, "home");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v57 = v6;
    obj = v6;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v64)
    {
      v59 = self;
      v62 = 0;
      v63 = *(_QWORD *)v67;
      v7 = v58;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v67 != v63)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v8);
        objc_msgSend(v7, "photosPersonManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personManagerUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v9, "personUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v10, "personWithUUID:", v14);
            v15 = objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v48 = (void *)v15;
              v49 = objc_alloc(MEMORY[0x1E0CBA4F0]);
              objc_msgSend(v9, "personManagerUUID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = (void *)objc_msgSend(v49, "initWithPersonManagerUUID:person:faceCrop:", v50, v48, 0);

              if (!v51)
                goto LABEL_41;
              v52 = v51;
              v47 = v52;
              v6 = v57;
              v53 = v60;
              goto LABEL_45;
            }
          }

        }
        objc_msgSend(v65, "personManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personManagerUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_25;
        objc_msgSend(v9, "personUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 && (objc_msgSend(v16, "personWithUUID:", v20), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v22 = (void *)v21;
          v23 = objc_alloc(MEMORY[0x1E0CBA4F0]);
          objc_msgSend(v9, "personManagerUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "initWithPersonManagerUUID:person:faceCrop:", v24, v22, 0);

        }
        else
        {
          objc_msgSend(v9, "unassociatedFaceCropUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
            goto LABEL_24;
          objc_msgSend(v16, "unassociatedFaceCropWithUUID:", v22);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = objc_alloc(MEMORY[0x1E0CBA4F0]);
            objc_msgSend(v9, "personManagerUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v28, "initWithPersonManagerUUID:person:faceCrop:", v29, 0, v27);
            v30 = v62;
          }
          else
          {
            objc_msgSend(v16, "personFaceCropWithUnassociatedFaceCropUUID:", v22);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v31;
            if (!v31
              || (objc_msgSend(v31, "personUUID"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v16, "personWithUUID:", v32),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v32,
                  !v29))
            {

LABEL_24:
LABEL_25:
              objc_msgSend(v9, "personUUID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "personName");
              v34 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v34;
              if (v20 && v34)
              {
                v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA6D8]), "initWithUUID:", v20);
                objc_msgSend(v35, "setName:", v22);
                v36 = objc_alloc(MEMORY[0x1E0CBA4F0]);
                objc_msgSend(v9, "personManagerUUID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void *)objc_msgSend(v36, "initWithPersonManagerUUID:person:faceCrop:", v37, v35, 0);

                objc_msgSend(v60, "addObject:", v38);
              }
              else
              {
                v39 = (void *)MEMORY[0x1D17BA0A0]();
                v40 = v59;
                HMFGetOSLogHandle();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v71 = v42;
                  v72 = 2112;
                  v73 = v9;
                  _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Could not determine face classification for significant event face classification: %@", buf, 0x16u);

                  v7 = v58;
                }

                objc_autoreleasePoolPop(v39);
              }
              goto LABEL_31;
            }
            v33 = objc_alloc(MEMORY[0x1E0CBA4F0]);
            objc_msgSend(v9, "personManagerUUID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v33, "initWithPersonManagerUUID:person:faceCrop:", v30, v29, 0);

          }
        }
        v62 = (void *)v25;
LABEL_31:

        if (v64 == ++v8)
        {
          v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
          if (v64)
            goto LABEL_4;
          goto LABEL_40;
        }
      }
    }
    v62 = 0;
LABEL_40:

LABEL_41:
    v53 = v60;
    if (v62)
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
    else
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v57;
    objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_84633);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObjectsFromArray:", v55);
    objc_msgSend(v54, "sortWithOptions:usingComparator:", 16, &__block_literal_global_3_84634);
    objc_msgSend(v54, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0;
LABEL_45:

  }
  else
  {
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v46;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Not returning a face classification because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    v47 = 0;
  }

  return v47;
}

- (id)personManagerWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  HMDCameraSignificantEventFaceClassificationResolver *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSignificantEventFaceClassificationResolver home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "personManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      v10 = v7;
    }
    else
    {
      objc_msgSend(v6, "users");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __77__HMDCameraSignificantEventFaceClassificationResolver_personManagerWithUUID___block_invoke;
      v18[3] = &unk_1E89B7AD8;
      v19 = v4;
      objc_msgSend(v15, "na_firstObjectPassingTest:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "photosPersonManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Returning nil because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraSignificantEventFaceClassificationResolver home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __77__HMDCameraSignificantEventFaceClassificationResolver_personManagerWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "photosPersonManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __118__HMDCameraSignificantEventFaceClassificationResolver__faceClassificationForSignificantEventFaceClassifications_user___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v4, "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16 == 0;

  }
  else
  {

    v11 = 0;
  }
LABEL_8:

  return v11;
}

uint64_t __118__HMDCameraSignificantEventFaceClassificationResolver__faceClassificationForSignificantEventFaceClassifications_user___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personManagerUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_84640 != -1)
    dispatch_once(&logCategory__hmf_once_t3_84640, &__block_literal_global_6_84641);
  return (id)logCategory__hmf_once_v4_84642;
}

void __66__HMDCameraSignificantEventFaceClassificationResolver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_84642;
  logCategory__hmf_once_v4_84642 = v0;

}

@end

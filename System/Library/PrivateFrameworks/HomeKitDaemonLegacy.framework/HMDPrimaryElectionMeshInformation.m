@implementation HMDPrimaryElectionMeshInformation

- (HMDPrimaryElectionMeshInformation)initWithResponder:(id)a3 leader:(id)a4 primary:(id)a5 reachableIPAccessories:(unint64_t)a6 residentsInMesh:(unint64_t)a7
{
  HMDResidentDevice *v12;
  HMDResidentDevice *v13;
  HMDResidentDevice *v14;
  HMDPrimaryElectionMeshInformation *v15;
  HMDResidentDevice *responder;
  HMDResidentDevice *v17;
  HMDResidentDevice *leader;
  HMDResidentDevice *v19;
  HMDResidentDevice *primary;
  objc_super v22;

  v12 = (HMDResidentDevice *)a3;
  v13 = (HMDResidentDevice *)a4;
  v14 = (HMDResidentDevice *)a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDPrimaryElectionMeshInformation;
  v15 = -[HMDPrimaryElectionMeshInformation init](&v22, sel_init);
  responder = v15->_responder;
  v15->_responder = v12;
  v17 = v12;

  leader = v15->_leader;
  v15->_leader = v13;
  v19 = v13;

  primary = v15->_primary;
  v15->_primary = v14;

  v15->_reachableIPAccessories = a6;
  v15->_residentsInMesh = a7;
  return v15;
}

- (id)toMessagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("r");
  -[HMDPrimaryElectionMeshInformation responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v20[1] = CFSTR("rip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDPrimaryElectionMeshInformation reachableIPAccessories](self, "reachableIPAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("res");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDPrimaryElectionMeshInformation residentsInMesh](self, "residentsInMesh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[HMDPrimaryElectionMeshInformation leader](self, "leader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDPrimaryElectionMeshInformation leader](self, "leader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("l"));

  }
  -[HMDPrimaryElectionMeshInformation primary](self, "primary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDPrimaryElectionMeshInformation primary](self, "primary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("p"));

  }
  v18 = (void *)objc_msgSend(v9, "copy");

  return v18;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionMeshInformation responder](self, "responder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionMeshInformation leader](self, "leader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionMeshInformation primary](self, "primary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ responder: %@, leader: %@, primary: %@, IP accessories: %d residents: %d>"), v5, v7, v9, v11, -[HMDPrimaryElectionMeshInformation reachableIPAccessories](self, "reachableIPAccessories"), -[HMDPrimaryElectionMeshInformation residentsInMesh](self, "residentsInMesh"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMDResidentDevice)responder
{
  return self->_responder;
}

- (HMDResidentDevice)leader
{
  return self->_leader;
}

- (HMDResidentDevice)primary
{
  return self->_primary;
}

- (unint64_t)reachableIPAccessories
{
  return self->_reachableIPAccessories;
}

- (unint64_t)residentsInMesh
{
  return self->_residentsInMesh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_responder, 0);
}

+ (id)meshInformationWithMeshController:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  HMDPrimaryElectionMeshInformation *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDPrimaryElectionMeshInformation *v20;
  void *v21;
  _QWORD v23[5];
  __int128 buf;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "residentDeviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_23793);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (objc_msgSend(v5, "isLeader"))
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v5, "leaderNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmd_residentDeviceForMeshNode:", v16);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(v6, "accessories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke_1;
    v23[3] = &unk_1E89A75A8;
    v23[4] = &buf;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);

    objc_msgSend(v5, "meshNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = [HMDPrimaryElectionMeshInformation alloc];
    objc_msgSend(v7, "primaryResidentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDPrimaryElectionMeshInformation initWithResponder:leader:primary:reachableIPAccessories:residentsInMesh:](v20, "initWithResponder:leader:primary:reachableIPAccessories:residentsInMesh:", v9, v10, v21, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), v19 + 1);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find responder, not creating mesh information", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }

  return v15;
}

+ (id)meshInformationFromMessagePayload:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  HMDPrimaryElectionMeshInformation *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "residentDeviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("r"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  findResidentDevice(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("l"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      findResidentDevice(v8, v11);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = v28;
          v31 = v12;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v32;
          v52 = 2114;
          v53 = v31;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to find leader identifier: %{public}@", buf, 0x16u);

          v12 = v31;
          v28 = v47;
        }

        objc_autoreleasePoolPop(v28);
        v27 = 0;
        goto LABEL_25;
      }
    }
    v46 = v11;
    objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("p"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      findResidentDevice(v8, v13);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v45 = v7;
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = v12;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          v52 = 2114;
          v53 = v14;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to find leader identifier: %{public}@", buf, 0x16u);

          v12 = v43;
        }

        objc_autoreleasePoolPop(v35);
        v27 = 0;
        v7 = v45;
        goto LABEL_24;
      }
    }
    v41 = v13;
    v42 = v12;
    v49 = 0;
    v15 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("rip"), &v49);
    v16 = v49;
    if (v16)
    {
      v17 = v16;
      v44 = v7;
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      objc_opt_class();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v21;
        v52 = 2112;
        v53 = v17;
        v22 = "%{public}@Unable to find reachable IP accessories: %@";
LABEL_18:
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);

        v6 = v40;
      }
    }
    else
    {
      v48 = 0;
      v33 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("res"), &v48);
      v34 = v48;
      if (!v34)
      {
        v27 = -[HMDPrimaryElectionMeshInformation initWithResponder:leader:primary:reachableIPAccessories:residentsInMesh:]([HMDPrimaryElectionMeshInformation alloc], "initWithResponder:leader:primary:reachableIPAccessories:residentsInMesh:", v10, v46, v41, v15, v33);
        goto LABEL_20;
      }
      v17 = v34;
      v44 = v7;
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      objc_opt_class();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v21;
        v52 = 2112;
        v53 = v17;
        v22 = "%{public}@Unable to find residents in mesh: %@";
        goto LABEL_18;
      }
    }

    objc_autoreleasePoolPop(v18);
    v27 = 0;
    v7 = v44;
LABEL_20:

    v12 = v42;
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  objc_opt_class();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v26;
    v52 = 2114;
    v53 = v9;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find responder identifier: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  v27 = 0;
LABEL_26:

  return v27;
}

void __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke_1(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v8;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hostAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      && objc_msgSend(v5, "hasIPLink")
      && objc_msgSend(v5, "isReachable"))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }

}

uint64_t __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

@end

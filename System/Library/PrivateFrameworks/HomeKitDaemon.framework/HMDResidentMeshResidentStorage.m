@implementation HMDResidentMeshResidentStorage

- (HMDResidentMeshResidentStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentMeshResidentStorage *v9;
  HMDResidentMeshResidentStorage *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *metrics;
  uint64_t v14;
  NSDictionary *lastSentMetrics;
  HMDResidentMeshResidentStorage *v17;
  SEL v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v17 = (HMDResidentMeshResidentStorage *)_HMFPreconditionFailure();
    return (HMDResidentMeshResidentStorage *)-[HMDResidentMeshResidentStorage _residentDidChange](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDResidentMeshResidentStorage;
  v9 = -[HMDResidentMeshResidentStorage init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_owner, v8);
    objc_storeWeak((id *)&v10->_residentDevice, v6);
    objc_msgSend(v8, "loadMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    metrics = v10->_metrics;
    v10->_metrics = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    lastSentMetrics = v10->_lastSentMetrics;
    v10->_lastSentMetrics = (NSDictionary *)v14;

  }
  return v10;
}

- (BOOL)_residentDidChange
{
  void *v3;
  void *v4;
  char v5;

  -[HMDResidentMeshResidentStorage metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMeshResidentStorage lastSentMetrics](self, "lastSentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDictionary:", v4) ^ 1;

  return v5;
}

- (void)_transmitAfter:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDResidentMeshResidentStorage *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v12 = MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot transmit after delay because owner reference is nil", (uint8_t *)&v31, 0xCu);

    }
    v11 = (void *)v12;
    goto LABEL_16;
  }
  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = MEMORY[0x227676638]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling transmit timer because one already exists", (uint8_t *)&v31, 0xCu);

    }
    v11 = (void *)v7;
LABEL_16:
    objc_autoreleasePoolPop(v11);
    goto LABEL_17;
  }
  v16 = -[HMDResidentMeshResidentStorage _residentDidChange](self, "_residentDidChange");
  v17 = (void *)MEMORY[0x227676638]();
  v18 = v5;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v20)
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not scheduling transmit timer because metrics didn't change", (uint8_t *)&v31, 0xCu);

    }
    v11 = v17;
    goto LABEL_16;
  }
  if (v20)
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shortDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v21;
    v33 = 2114;
    v34 = v24;
    v35 = 2048;
    v36 = a3;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting transmit timer for %{public}@ for %fs", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a3);
  -[HMDResidentMeshResidentStorage setTransmitTimer:](self, "setTransmitTimer:", v25);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "workQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDelegateQueue:", v28);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "resume");

LABEL_17:
}

- (id)_buildPayload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resident");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = &unk_24E96BD80;
  v14[0] = CFSTR("kMeshVersion");
  v14[1] = CFSTR("kMeshDeviceStorageGenerationCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "generationCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  v14[2] = CFSTR("kMeshDevice");
  objc_msgSend(v3, "residentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("kMeshDeviceStorageEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  v14[4] = CFSTR("kMeshDeviceStorageSystemLoad");
  objc_msgSend(v2, "loadMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v15[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_transmitStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDResidentMeshResidentStorage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resident");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      v46 = 2112;
      v47 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending status update with force: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDResidentMeshResidentStorage setTransmitTimer:](self, "setTransmitTimer:", 0);
    if (!-[HMDResidentMeshResidentStorage _residentDidChange](self, "_residentDidChange") && !v3)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v11;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v18;
        v46 = 2112;
        v47 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (metrics for %@ did not change and not forced)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      goto LABEL_26;
    }
    objc_msgSend(v11, "_meshStorageForResidentDevice:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if ((objc_msgSend(v25, "enabled") & 1) != 0)
      {
        objc_msgSend(v9, "residentDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v8, "isEqual:", v27);

        if (v28)
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "device");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "shortDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v45 = v32;
            v46 = 2114;
            v47 = v34;
            v35 = "%{public}@Not sending status update (%{public}@ is ourself)";
LABEL_19:
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x16u);
LABEL_22:

LABEL_23:
          }
        }
        else
        {
          if (v9)
          {
            -[HMDResidentMeshResidentStorage metrics](self, "metrics");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDResidentMeshResidentStorage setLastSentMetrics:](self, "setLastSentMetrics:", v37);

            -[HMDResidentMeshResidentStorage _buildPayload](self, "_buildPayload");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke;
            v40[3] = &unk_24E795C28;
            v41 = v11;
            v42 = v8;
            v43 = v26;
            objc_msgSend(v41, "_sendMessage:payload:target:force:responseHandler:", CFSTR("kDeviceMeshUpdateKey"), v38, v42, v3, v40);

            goto LABEL_25;
          }
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v32;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (our resident device identifier is not set (probably unaccessible))", buf, 0xCu);
            goto LABEL_23;
          }
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v11;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "residentDevice");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "device");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "shortDescription");
          v39 = v29;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v32;
          v46 = 2114;
          v47 = v36;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (%{public}@ is not enabled)", buf, 0x16u);

          v29 = v39;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v11;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        v46 = 2112;
        v47 = v34;
        v35 = "%{public}@Not sending status update (have not heard about %@ from device manager)";
        goto LABEL_19;
      }
    }

    objc_autoreleasePoolPop(v29);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v24;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
LABEL_27:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  HMDResidentMeshResidentStorage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDResidentMeshResidentStorage *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Transmit timer fired; sending status update",
          (uint8_t *)&v17,
          0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDResidentMeshResidentStorage _transmitStatus:](v10, "_transmitStatus:", 0);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (HMDResidentMesh)owner
{
  return (HMDResidentMesh *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (HMDResidentDevice)residentDevice
{
  return (HMDResidentDevice *)objc_loadWeakRetained((id *)&self->_residentDevice);
}

- (void)setResidentDevice:(id)a3
{
  objc_storeWeak((id *)&self->_residentDevice, a3);
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSDictionary)lastSentMetrics
{
  return self->_lastSentMetrics;
}

- (void)setLastSentMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HMFTimer)transmitTimer
{
  return self->_transmitTimer;
}

- (void)setTransmitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transmitTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transmitTimer, 0);
  objc_storeStrong((id *)&self->_lastSentMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_residentDevice);
  objc_destroyWeak((id *)&self->_owner);
}

void __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to send status update to %{public}@: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(a1[6], "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kMeshDeviceStorageEnabled")));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_144159 != -1)
    dispatch_once(&logCategory__hmf_once_t16_144159, &__block_literal_global_144160);
  return (id)logCategory__hmf_once_v17_144161;
}

void __45__HMDResidentMeshResidentStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_144161;
  logCategory__hmf_once_v17_144161 = v0;

}

@end

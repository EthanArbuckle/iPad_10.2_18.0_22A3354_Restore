@implementation HMResidentDevice

- (HMResidentDevice)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;

  v6 = a4;
  -[HMResidentDevice setContext:](self, "setContext:", a3);
  -[HMResidentDevice setHome:](self, "setHome:", v6);

}

- (void)_unconfigureContext
{
  void *v3;
  _HMContext *context;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMResidentDevice *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring residentDevice", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMResidentDevice setHome:](v5, "setHome:", 0);
    -[HMResidentDevice _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSString)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMResidentDevice residentName](self, "residentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HMResidentDevice device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (BOOL)isCurrentDevice
{
  void *v2;
  char v3;

  -[HMResidentDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (BOOL)isEnabled
{
  HMResidentDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)status
{
  os_unfair_lock_s *p_lock;
  unint64_t status;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (void)setStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_status = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)IDSIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_IDSIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIDSIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *IDSIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  IDSIdentifier = self->_IDSIdentifier;
  self->_IDSIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)IDSDestination
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_IDSDestination;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIDSDestination:(id)a3
{
  NSString *v4;
  NSString *IDSDestination;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  IDSDestination = self->_IDSDestination;
  self->_IDSDestination = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)deviceIRKData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeviceIRKData:(id)a3
{
  NSData *v4;
  NSData *deviceIRKData;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  deviceIRKData = self->_deviceIRKData;
  self->_deviceIRKData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)capabilities
{
  os_unfair_lock_s *p_lock;
  unint64_t capabilities;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  capabilities = self->_capabilities;
  os_unfair_lock_unlock(p_lock);
  return capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_capabilities = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)residentName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_residentName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResidentName:(id)a3
{
  NSString *v4;
  NSString *residentName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  residentName = self->_residentName;
  self->_residentName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updatedEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMResidentDevice *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMResidentDevice *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMResidentDevice context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMResidentDevice updatedEnabled:completionHandler:]", CFSTR("completionHandler"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke;
    block[3] = &unk_1E3AB19C0;
    block[4] = self;
    v23 = v6;
    v24 = a3;
    v22 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2080;
      v28 = "-[HMResidentDevice updatedEnabled:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (HMResidentDevice)initWithCoder:(id)a3
{
  id v4;
  HMResidentDevice *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  HMDevice *device;
  void *v10;
  uint64_t v11;
  NSString *residentName;
  uint64_t v13;
  NSUUID *IDSIdentifier;
  uint64_t v15;
  NSString *IDSDestination;
  uint64_t v17;
  NSData *deviceIRKData;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMResidentDevice;
  v5 = -[HMResidentDevice init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
    v8 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HMDevice *)v8;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.enabled"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.status"));
    v5->_capabilities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.capabilities"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_home, v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
    v11 = objc_claimAutoreleasedReturnValue();
    residentName = v5->_residentName;
    v5->_residentName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accountIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    IDSIdentifier = v5->_IDSIdentifier;
    v5->_IDSIdentifier = (NSUUID *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.idsDestination"));
    v15 = objc_claimAutoreleasedReturnValue();
    IDSDestination = v5->_IDSDestination;
    v5->_IDSDestination = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMResidentDeviceDeviceIRKDataCodingKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    deviceIRKData = v5->_deviceIRKData;
    v5->_deviceIRKData = (NSData *)v17;

    v5->_supportsResidentSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMResidentDeviceSupportsResidentSelectionCodingKey"));
  }

  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  HMResidentDevice *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  HMResidentDevice *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMResidentDevice *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  HMResidentDevice *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  unint64_t v47;
  void *v48;
  HMResidentDevice *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  HMResidentDevice *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t);
  void *v82;
  HMResidentDevice *v83;
  id v84;
  _QWORD v85[5];
  id v86;
  unint64_t v87;
  _QWORD v88[5];
  id v89;
  unint64_t v90;
  _QWORD v91[5];
  id v92;
  char v93;
  _QWORD block[5];
  id v95;
  id v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMResidentDevice name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);
    v10 = v9 ^ 1;

    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMResidentDevice name](v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v14;
        v99 = 2112;
        v100 = v15;
        v101 = 2112;
        v102 = v7;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating name from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMResidentDevice delegate](v12, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMResidentDevice context](v12, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "queue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E3AB5CD0;
        block[4] = v12;
        v95 = v16;
        v96 = v7;
        dispatch_async(v18, block);

      }
    }

    objc_msgSend(v6, "residentName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMResidentDevice residentName](self, "residentName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMResidentDevice residentName](v23, "residentName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v25;
        v99 = 2112;
        v100 = v26;
        v101 = 2112;
        v102 = v19;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating resident name from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMResidentDevice setResidentName:](v23, "setResidentName:", v19);
      v10 = 1;
    }

    v27 = objc_msgSend(v6, "isEnabled");
    if ((_DWORD)v27 != -[HMResidentDevice isEnabled](self, "isEnabled"))
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMResidentDevice isEnabled](v29, "isEnabled");
        HMFBooleanToString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v31;
        v99 = 2112;
        v100 = v32;
        v101 = 2112;
        v102 = v33;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating enabled from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      -[HMResidentDevice setEnabled:](v29, "setEnabled:", v27);
      -[HMResidentDevice delegate](v29, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMResidentDevice context](v29, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "queue");
        v36 = objc_claimAutoreleasedReturnValue();
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_118;
        v91[3] = &unk_1E3AB57F8;
        v91[4] = v29;
        v92 = v34;
        v93 = v27;
        dispatch_async(v36, v91);

      }
      v10 = 1;
    }
    v37 = objc_msgSend(v6, "status");
    if (-[HMResidentDevice status](self, "status") != v37)
    {
      v38 = (void *)MEMORY[0x1A1AC1AAC]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceStatusDescription(-[HMResidentDevice status](v39, "status"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceStatusDescription(v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v41;
        v99 = 2112;
        v100 = v42;
        v101 = 2112;
        v102 = v43;
        _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating status from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v38);
      -[HMResidentDevice setStatus:](v39, "setStatus:", v37);
      -[HMResidentDevice delegate](v39, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMResidentDevice context](v39, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "queue");
        v46 = objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_122;
        v88[3] = &unk_1E3AB5C80;
        v88[4] = v39;
        v89 = v44;
        v90 = v37;
        dispatch_async(v46, v88);

      }
      v10 = 1;
    }
    v47 = objc_msgSend(v6, "capabilities");
    if (-[HMResidentDevice capabilities](self, "capabilities") != v47)
    {
      v48 = (void *)MEMORY[0x1A1AC1AAC]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceCapabilitiesDescription(-[HMResidentDevice capabilities](v49, "capabilities"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceCapabilitiesDescription(v47);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v51;
        v99 = 2112;
        v100 = v52;
        v101 = 2112;
        v102 = v53;
        _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating capabilities from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v48);
      -[HMResidentDevice setCapabilities:](v49, "setCapabilities:", v47);
      -[HMResidentDevice delegate](v49, "delegate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMResidentDevice context](v49, "context");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "queue");
        v56 = objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_126;
        v85[3] = &unk_1E3AB5C80;
        v85[4] = v49;
        v86 = v54;
        v87 = v47;
        dispatch_async(v56, v85);

      }
      v10 = 1;
    }
    v57 = objc_msgSend(v6, "supportsResidentSelection");
    if ((_DWORD)v57 != -[HMResidentDevice supportsResidentSelection](self, "supportsResidentSelection"))
    {
      v58 = (void *)MEMORY[0x1A1AC1AAC]();
      v59 = self;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMResidentDevice supportsResidentSelection](v59, "supportsResidentSelection");
        HMFBooleanToString();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v61;
        v99 = 2112;
        v100 = v62;
        v101 = 2112;
        v102 = v63;
        _os_log_impl(&dword_19B1B0000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating supportsResidentSelection from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v58);
      -[HMResidentDevice setSupportsResidentSelection:](v59, "setSupportsResidentSelection:", v57);
      -[HMResidentDevice delegate](v59, "delegate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMResidentDevice context](v59, "context");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "queue");
        v66 = objc_claimAutoreleasedReturnValue();
        v79 = MEMORY[0x1E0C809B0];
        v80 = 3221225472;
        v81 = __39__HMResidentDevice_mergeFromNewObject___block_invoke_130;
        v82 = &unk_1E3AB5ED8;
        v83 = v59;
        v84 = v64;
        dispatch_async(v66, &v79);

      }
      v10 = 1;
    }
    objc_msgSend(v6, "IDSIdentifier", v79, v80, v81, v82, v83);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMResidentDevice IDSIdentifier](self, "IDSIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = HMFEqualObjects();

    if ((v69 & 1) == 0)
    {
      -[HMResidentDevice setIDSIdentifier:](self, "setIDSIdentifier:", v67);
      v10 = 1;
    }

    objc_msgSend(v6, "IDSDestination");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMResidentDevice IDSDestination](self, "IDSDestination");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = HMFEqualObjects();

    if ((v72 & 1) == 0)
    {
      -[HMResidentDevice setIDSDestination:](self, "setIDSDestination:", v70);
      v10 = 1;
    }

    objc_msgSend(v6, "deviceIRKData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMResidentDevice deviceIRKData](self, "deviceIRKData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = HMFEqualObjects();

    if ((v75 & 1) == 0)
    {
      -[HMResidentDevice setDeviceIRKData:](self, "setDeviceIRKData:", v73);
      v10 = 1;
    }

    -[HMResidentDevice device](self, "device");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "mergeFromNewObject:", v77);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleRuntimeStateUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMResidentDevice *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HMResidentDevice *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMResidentDevice context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v13 = v4;
    v14 = self;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2080;
      v18 = "-[HMResidentDevice handleRuntimeStateUpdate:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (NSString)shortDescription
{
  void *v2;
  void *v3;

  -[HMResidentDevice uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];

  v27[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMResidentDevice device](self, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Device"), v26);
  v27[0] = v25;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMResidentDevice uniqueIdentifier](self, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v24);
  v27[1] = v23;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMResidentDevice uuid](self, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:options:formatter:", CFSTR("UUID"), v22, 0, v21);
  v27[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMResidentDevice isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Enabled"), v8);
  v27[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  HMResidentDeviceStatusDescription(-[HMResidentDevice status](self, "status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Status"), v11);
  v27[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  HMResidentDeviceCapabilitiesDescription(-[HMResidentDevice capabilities](self, "capabilities"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Capabilities"), v14);
  v27[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMResidentDevice supportsResidentSelection](self, "supportsResidentSelection");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Supports Resident Selection"), v17);
  v27[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMResidentDevice uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMResidentDeviceDelegate)delegate
{
  return (HMResidentDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDevice)device
{
  return (HMDevice *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)supportsResidentSelection
{
  return self->_supportsResidentSelection;
}

- (void)setSupportsResidentSelection:(BOOL)a3
{
  self->_supportsResidentSelection = a3;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_residentName, 0);
  objc_storeStrong((id *)&self->_IDSDestination, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  unint64_t v82;
  _QWORD v83[4];
  id v84;
  uint64_t v85;
  char v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("enabled"));
  if ((_DWORD)v2 != objc_msgSend(*(id *)(a1 + 40), "isEnabled"))
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "isEnabled");
      HMFBooleanToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v6;
      v89 = 2112;
      v90 = v7;
      v91 = 2112;
      v92 = v8;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating enabled from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", v2);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "isEnabled");
        HMFBooleanToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v88 = v13;
        v89 = 2112;
        v90 = v14;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated enabled value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_132;
      v83[3] = &unk_1E3AB57F8;
      v17 = v9;
      v18 = *(_QWORD *)(a1 + 40);
      v84 = v17;
      v85 = v18;
      v86 = v2;
      objc_msgSend(v16, "invokeBlock:", v83);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", CFSTR("status"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  if (objc_msgSend(*(id *)(a1 + 40), "status") != v20)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HMResidentDeviceStatusDescription(objc_msgSend(*(id *)(a1 + 40), "status"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMResidentDeviceStatusDescription(v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v24;
      v89 = 2112;
      v90 = v25;
      v91 = 2112;
      v92 = v26;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating status from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(*(id *)(a1 + 40), "setStatus:", v20);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceStatusDescription(objc_msgSend(*(id *)(a1 + 40), "status"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v88 = v31;
        v89 = 2112;
        v90 = v32;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated status: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "delegateCaller");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_133;
      v79[3] = &unk_1E3AB5C80;
      v35 = v27;
      v36 = *(_QWORD *)(a1 + 40);
      v80 = v35;
      v81 = v36;
      v82 = v20;
      objc_msgSend(v34, "invokeBlock:", v79);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", CFSTR("capabilities"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "unsignedIntegerValue");

  if (objc_msgSend(*(id *)(a1 + 40), "capabilities") != v38)
  {
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    v40 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      HMResidentDeviceCapabilitiesDescription(objc_msgSend(*(id *)(a1 + 40), "capabilities"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      HMResidentDeviceCapabilitiesDescription(v38);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v42;
      v89 = 2112;
      v90 = v43;
      v91 = 2112;
      v92 = v44;
      _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating capabilities from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v39);
    objc_msgSend(*(id *)(a1 + 40), "setCapabilities:", v38);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v46 = (void *)MEMORY[0x1A1AC1AAC]();
      v47 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        HMResidentDeviceCapabilitiesDescription(objc_msgSend(*(id *)(a1 + 40), "capabilities"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v88 = v49;
        v89 = 2112;
        v90 = v50;
        _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated capabilities: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v46);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "delegateCaller");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_134;
      v75[3] = &unk_1E3AB5C80;
      v53 = v45;
      v54 = *(_QWORD *)(a1 + 40);
      v76 = v53;
      v77 = v54;
      v78 = v38;
      objc_msgSend(v52, "invokeBlock:", v75);

    }
  }
  v55 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("supportsResidentSelection"));
  if ((_DWORD)v55 != objc_msgSend(*(id *)(a1 + 40), "supportsResidentSelection"))
  {
    v56 = (void *)MEMORY[0x1A1AC1AAC]();
    v57 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "supportsResidentSelection");
      HMFBooleanToString();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v59;
      v89 = 2112;
      v90 = v60;
      v91 = 2112;
      v92 = v61;
      _os_log_impl(&dword_19B1B0000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating supportsResidentSelection from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v56);
    objc_msgSend(*(id *)(a1 + 40), "setSupportsResidentSelection:", v55);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v63 = (void *)MEMORY[0x1A1AC1AAC]();
      v64 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "supportsResidentSelection");
        HMFBooleanToString();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v88 = v66;
        v89 = 2112;
        v90 = v67;
        _os_log_impl(&dword_19B1B0000, v65, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated supportsResidentSelection value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v63);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "delegateCaller");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_135;
      v72[3] = &unk_1E3AB5ED8;
      v70 = v62;
      v71 = *(_QWORD *)(a1 + 40);
      v73 = v70;
      v74 = v71;
      objc_msgSend(v69, "invokeBlock:", v72);

    }
  }
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_132(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "residentDevice:didUpdateEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "residentDevice:didUpdateStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "residentDevice:didUpdateCapabilities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateSupportedCapabilitiesForResidentDevice:", *(_QWORD *)(a1 + 40));
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_118(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_119;
  v5[3] = &unk_1E3AB57F8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_122(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_123;
  v7[3] = &unk_1E3AB5C80;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "invokeBlock:", v7);

}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_126(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_127;
  v7[3] = &unk_1E3AB5C80;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "invokeBlock:", v7);

}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_130(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_131;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_131(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "supportsResidentSelection");
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated supportsResidentSelection value: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "didUpdateSupportedCapabilitiesForResidentDevice:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_127(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMResidentDeviceCapabilitiesDescription(objc_msgSend(*(id *)(a1 + 32), "capabilities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated capabilities: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "residentDevice:didUpdateCapabilities:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_123(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMResidentDeviceStatusDescription(objc_msgSend(*(id *)(a1 + 32), "status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated status: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "residentDevice:didUpdateStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_119(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "isEnabled");
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated enabled value: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "residentDevice:didUpdateEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated name: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "residentDevice:didUpdateName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    if (v3 != objc_msgSend(*(id *)(a1 + 32), "isEnabled"))
    {
      v8 = objc_alloc(MEMORY[0x1E0D285D8]);
      objc_msgSend(v2, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

      v11 = (void *)MEMORY[0x1E0D285F8];
      v23[0] = CFSTR("kIdentifierKey");
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("kEnabledKey");
      v24[0] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("kResidentDeviceUpdateEnabledRequestKey"), v10, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, *(id *)(a1 + 32));
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_2;
      v18[3] = &unk_1E3AB4B30;
      objc_copyWeak(&v21, &location);
      v19 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 48);
      objc_msgSend(v16, "setResponseHandler:", v18);
      objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendMessage:completionHandler:", v16, 0);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callCompletion:error:", v6, v7);

  }
LABEL_7:

}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_3;
    v9[3] = &unk_1E3AB4D20;
    v10 = v5;
    v11 = v6;
    v12 = WeakRetained;
    v13 = a1[5];
    dispatch_async(v8, v9);

  }
}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  v2 = *(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v7 = 0;
    v3 = objc_msgSend(*(id *)(a1 + 40), "hmf_BOOLForKey:isPresent:", CFSTR("kEnabledKey"), &v7);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "setEnabled:", v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v4;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 56), v2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1)
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_6412);
  return (id)logCategory__hmf_once_v43;
}

void __31__HMResidentDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43;
  logCategory__hmf_once_v43 = v0;

}

@end

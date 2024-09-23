@implementation HMDevice

- (HMDevice)init
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

- (HMDevice)initWithUUID:(id)a3 name:(id)a4 isCurrentDevice:(BOOL)a5
{
  id v8;
  id v9;
  HMDevice *v10;
  HMDevice *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  NSString *name;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDevice;
  v10 = -[HMDevice init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v11->_currentDevice = a5;
  }

  return v11;
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
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFProductInfo)productInfo
{
  os_unfair_lock_s *p_lock;
  HMFProductInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_productInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setProductInfo:(id)a3
{
  HMFProductInfo *v4;
  HMFProductInfo *productInfo;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (HMFProductInfo *)objc_msgSend(v6, "copy");
  productInfo = self->_productInfo;
  self->_productInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)supportsHH2
{
  HMDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsHH2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsHH2:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsHH2 = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMFKey)rapportIRK
{
  os_unfair_lock_s *p_lock;
  HMFKey *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rapportIRK;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRapportIRK:(id)a3
{
  HMFKey *v4;
  HMFKey *rapportIRK;

  v4 = (HMFKey *)a3;
  os_unfair_lock_lock_with_options();
  rapportIRK = self->_rapportIRK;
  self->_rapportIRK = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)idsIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_idsIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdsIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *idsIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)idsDestination
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_idsDestination;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdsDestination:(id)a3
{
  NSString *v4;
  NSString *idsDestination;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  idsDestination = self->_idsDestination;
  self->_idsDestination = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDevice uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDevice uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
      goto LABEL_13;
    -[HMDevice name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_13;
    -[HMDevice productInfo](self, "productInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (!v14)
      goto LABEL_13;
    v15 = -[HMDevice isCurrentDevice](self, "isCurrentDevice");
    if (v15 != objc_msgSend(v6, "isCurrentDevice"))
      goto LABEL_13;
    v16 = -[HMDevice supportsHH2](self, "supportsHH2");
    if (v16 != objc_msgSend(v6, "supportsHH2"))
      goto LABEL_13;
    -[HMDevice rapportIRK](self, "rapportIRK");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rapportIRK");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if (!v19)
      goto LABEL_13;
    -[HMDevice idsIdentifier](self, "idsIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = HMFEqualObjects();

    if (v22)
    {
      -[HMDevice idsDestination](self, "idsDestination");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "idsDestination");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = HMFEqualObjects();

    }
    else
    {
LABEL_13:
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (HMDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HMDevice *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDevice *v13;
  HMDevice *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.currentDevice"));
  if (v5)
  {
    v8 = -[HMDevice initWithUUID:name:isCurrentDevice:](self, "initWithUUID:name:isCurrentDevice:", v5, v6, v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.productInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice setProductInfo:](v8, "setProductInfo:", v9);

    -[HMDevice setSupportsHH2:](v8, "setSupportsHH2:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.supportsHH2")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.rpDeviceIRK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice setRapportIRK:](v8, "setRapportIRK:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.idsIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice setIdsIdentifier:](v8, "setIdsIdentifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.idsDestination"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice setIdsDestination:](v8, "setIdsDestination:", v12);

    v13 = v8;
    v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC](v7);
    v13 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = 0;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ name: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMDevice uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[HMDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.name"));

  -[HMDevice productInfo](self, "productInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.productInfo"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDevice isCurrentDevice](self, "isCurrentDevice"), CFSTR("HM.currentDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDevice supportsHH2](self, "supportsHH2"), CFSTR("HM.supportsHH2"));
  -[HMDevice rapportIRK](self, "rapportIRK");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.rpDeviceIRK"));

  -[HMDevice idsIdentifier](self, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HM.idsIdentifier"));

  -[HMDevice idsDestination](self, "idsDestination");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.idsDestination"));

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  HMDevice *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  HMDevice *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDevice *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  HMDevice *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  HMDevice *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  HMDevice *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
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
    v7 = objc_claimAutoreleasedReturnValue();
    -[HMDevice name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v7;
    v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice name](v11, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v13;
        v62 = 2112;
        v63 = v14;
        v64 = 2112;
        v65 = v7;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating name from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDevice setName:](v11, "setName:", v7);
    }
    objc_msgSend(v6, "productInfo");
    v15 = objc_claimAutoreleasedReturnValue();
    -[HMDevice productInfo](self, "productInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if ((v17 & 1) != 0)
    {
      v18 = v9 ^ 1;
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice productInfo](v20, "productInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v22;
        v62 = 2112;
        v63 = v23;
        v64 = 2112;
        v65 = v15;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating productInfo from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDevice setProductInfo:](v20, "setProductInfo:", v15);
      v18 = 1;
    }
    v24 = objc_msgSend(v6, "supportsHH2");
    if ((_DWORD)v24 != -[HMDevice supportsHH2](self, "supportsHH2"))
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice supportsHH2](v26, "supportsHH2");
        HMFBooleanToString();
        v57 = v25;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v30 = v15;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v28;
        v62 = 2112;
        v63 = v29;
        v64 = 2112;
        v65 = (uint64_t)v31;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating supportsHH2 from %@ to %@", buf, 0x20u);

        v15 = v30;
        v25 = v57;

      }
      objc_autoreleasePoolPop(v25);
      -[HMDevice setSupportsHH2:](v26, "setSupportsHH2:", v24);
      v18 = 1;
    }
    v58 = (void *)v15;
    objc_msgSend(v6, "rapportIRK");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice rapportIRK](self, "rapportIRK");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = HMFEqualObjects();

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1A1AC1AAC]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice rapportIRK](v36, "rapportIRK");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v38;
        v62 = 2112;
        v63 = v39;
        v64 = 2112;
        v65 = (uint64_t)v32;
        _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating rapportIRK from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v35);
      -[HMDevice setRapportIRK:](v36, "setRapportIRK:", v32);
      v18 = 1;
    }
    objc_msgSend(v6, "idsIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice idsIdentifier](self, "idsIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
    {
      v43 = (void *)MEMORY[0x1A1AC1AAC]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice idsIdentifier](v44, "idsIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v46;
        v62 = 2112;
        v63 = v47;
        v64 = 2112;
        v65 = (uint64_t)v40;
        _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating idsIdentifier from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v43);
      -[HMDevice setIdsIdentifier:](v44, "setIdsIdentifier:", v40);
      v18 = 1;
    }
    objc_msgSend(v6, "idsDestination");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDevice idsDestination](self, "idsDestination");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = HMFEqualObjects();

    if ((v50 & 1) == 0)
    {
      v51 = (void *)MEMORY[0x1A1AC1AAC]();
      v52 = self;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDevice idsDestination](v52, "idsDestination");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v54;
        v62 = 2112;
        v63 = v55;
        v64 = 2112;
        v65 = (uint64_t)v48;
        _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating idsDestination from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v51);
      -[HMDevice setIdsDestination:](v52, "setIdsDestination:", v48);
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)shortDescription
{
  void *v2;
  void *v3;

  -[HMDevice uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
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
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDevice uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDevice uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Identifier"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDevice name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Name"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDevice productInfo](self, "productInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Product Info"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDevice rapportIRK](self, "rapportIRK");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Rapport IRK"), v17);
  objc_msgSend(v3, "addObject:", v18);

  if (-[HMDevice isCurrentDevice](self, "isCurrentDevice"))
  {
    v19 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDevice isCurrentDevice](self, "isCurrentDevice");
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Is Current Device"), v20);
    objc_msgSend(v3, "addObject:", v21);

  }
  if (-[HMDevice supportsHH2](self, "supportsHH2"))
  {
    v22 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDevice supportsHH2](self, "supportsHH2");
    HMFBooleanToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Supports HH2"), v23);
    objc_msgSend(v3, "addObject:", v24);

  }
  v25 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v25;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDevice uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIRK, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
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
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_3610);
  return (id)logCategory__hmf_once_v23;
}

void __23__HMDevice_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

- (id)IDSDeviceForIDSService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDevice idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  if (!IDSLibraryCore_frameworkLibrary)
  {
    v20 = xmmword_1E3AADD48;
    v21 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (IDSLibraryCore_frameworkLibrary)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "devices", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "uniqueIDOverride");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_16;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
LABEL_14:
    v7 = 0;
  }

  return v7;
}

- (id)IDSDestinationForIDSService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDevice *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDevice idsDestination](self, "idsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  if (!IDSFoundationLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E3AADD60;
    *(_QWORD *)&buf[16] = 0;
    IDSFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (IDSFoundationLibraryCore_frameworkLibrary)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v6 = (void *)getIDSDestinationClass_softClass;
    v18 = getIDSDestinationClass_softClass;
    if (!getIDSDestinationClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getIDSDestinationClass_block_invoke;
      v20 = &unk_1E3AB4620;
      v21[0] = &v15;
      __getIDSDestinationClass_block_invoke((uint64_t)buf);
      v6 = (void *)v16[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destinationWithStrings:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v20 = v4;
      LOWORD(v21[0]) = 2112;
      *(_QWORD *)((char *)v21 + 2) = v11;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to get IDSDestination from destination: (%@) for service: (%@) on device: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)hmmmMessageDestination
{
  HMMMMessageDestination *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMMMessageDestination *v7;

  v3 = [HMMMMessageDestination alloc];
  -[HMDevice idsIdentifier](self, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDevice idsDestination](self, "idsDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMMMessageDestination initWithIDSIdentifier:idsTokenURI:](v3, "initWithIDSIdentifier:idsTokenURI:", v5, v6);

  return v7;
}

@end

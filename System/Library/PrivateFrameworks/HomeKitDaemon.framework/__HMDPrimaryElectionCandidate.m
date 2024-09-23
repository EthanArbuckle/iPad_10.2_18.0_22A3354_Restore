@implementation __HMDPrimaryElectionCandidate

- (__HMDPrimaryElectionCandidate)initWithVersion:(id)a3 deviceIdentifier:(id)a4 name:(id)a5 currentPrimaryIdentifier:(id)a6 enabledAsResident:(BOOL)a7 supportsPingRequest:(BOOL)a8 connectionType:(unint64_t)a9 pcsEnabled:(BOOL)a10 swVersion:(id)a11
{
  HMDHomeKitVersion *v16;
  NSUUID *v17;
  NSString *v18;
  NSUUID *v19;
  HMFSoftwareVersion *v20;
  __HMDPrimaryElectionCandidate *v21;
  HMDHomeKitVersion *homeKitVersion;
  HMDHomeKitVersion *v23;
  NSUUID *deviceIdentifier;
  NSUUID *v25;
  NSString *name;
  NSString *v27;
  NSUUID *currentPrimaryIdentifier;
  NSUUID *v29;
  HMFSoftwareVersion *swVersion;
  _BOOL4 v32;
  objc_super v33;

  v32 = a8;
  v16 = (HMDHomeKitVersion *)a3;
  v17 = (NSUUID *)a4;
  v18 = (NSString *)a5;
  v19 = (NSUUID *)a6;
  v20 = (HMFSoftwareVersion *)a11;
  v33.receiver = self;
  v33.super_class = (Class)__HMDPrimaryElectionCandidate;
  v21 = -[__HMDPrimaryElectionCandidate init](&v33, sel_init);
  homeKitVersion = v21->_homeKitVersion;
  v21->_homeKitVersion = v16;
  v23 = v16;

  deviceIdentifier = v21->_deviceIdentifier;
  v21->_deviceIdentifier = v17;
  v25 = v17;

  name = v21->_name;
  v21->_name = v18;
  v27 = v18;

  currentPrimaryIdentifier = v21->_currentPrimaryIdentifier;
  v21->_currentPrimaryIdentifier = v19;
  v29 = v19;

  v21->_enabledAsResident = a7;
  v21->_capabilities = +[__HMDPrimaryElectionCandidate setSupportsPingRequest:capabilities:](__HMDPrimaryElectionCandidate, "setSupportsPingRequest:capabilities:", v32, 0);
  v21->_connectionType = a9;
  v21->_pcsEnabled = a10;
  swVersion = v21->_swVersion;
  v21->_swVersion = v20;

  return v21;
}

- (BOOL)matchesPreferredPrimaryIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  -[__HMDPrimaryElectionCandidate name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
    if (!v8)
      goto LABEL_8;
    -[__HMDPrimaryElectionCandidate deviceIdentifier](self, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if ((v10 & 1) != 0)
      goto LABEL_7;
    -[__HMDPrimaryElectionCandidate residentDevice](self, "residentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v8);

    if ((v13 & 1) != 0)
      goto LABEL_7;
    -[__HMDPrimaryElectionCandidate residentDevice](self, "residentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v8);

    if ((v17 & 1) != 0)
LABEL_7:
      v7 = 1;
    else
LABEL_8:
      v7 = 0;

  }
  return v7;
}

- (BOOL)supportsPingRequest
{
  return +[__HMDPrimaryElectionCandidate supportsPingRequest:](__HMDPrimaryElectionCandidate, "supportsPingRequest:", -[__HMDPrimaryElectionCandidate capabilities](self, "capabilities"));
}

- (id)toMessagePayload
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("parameters");
  encodeRootObject();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *name;
  NSUUID *currentPrimaryIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldLogPrivateInformation())
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("<redacted>");
  v15 = *(_OWORD *)&self->_homeKitVersion;
  currentPrimaryIdentifier = self->_currentPrimaryIdentifier;
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[__HMDPrimaryElectionCandidate supportsPingRequest:](__HMDPrimaryElectionCandidate, "supportsPingRequest:", self->_capabilities);
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFSoftwareVersion versionString](self->_swVersion, "versionString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ name: %@, homekitVersion: %@, id: %@, primary: %@, enabled: %@ supportsPingRequest: %@, wired: %@, pcsEnabled: %@>, swVersion: %@"), v5, name, v15, currentPrimaryIdentifier, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (__HMDPrimaryElectionCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  char v11;
  void *v12;
  __HMDPrimaryElectionCandidate *v13;
  uint64_t v15;
  unsigned int v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("v"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("e"));
  v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("caps"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conn"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pcs"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("swv"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v5 && v6)
  {
    LOBYTE(v15) = v11;
    self = -[__HMDPrimaryElectionCandidate initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:](self, "initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:", v5, v6, v7, v8, v16, +[__HMDPrimaryElectionCandidate supportsPingRequest:](__HMDPrimaryElectionCandidate, "supportsPingRequest:", v9), v10, v15, v12);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  HMDHomeKitVersion *homeKitVersion;
  id v5;

  homeKitVersion = self->_homeKitVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeKitVersion, CFSTR("v"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("n"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentPrimaryIdentifier, CFSTR("pid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledAsResident, CFSTR("e"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_capabilities), CFSTR("caps"));
  objc_msgSend(v5, "encodeInteger:forKey:", SLODWORD(self->_connectionType), CFSTR("conn"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pcsEnabled, CFSTR("pcs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_swVersion, CFSTR("swv"));

}

- (int64_t)comparePreferredPrimaryStatusWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __HMDPrimaryElectionCandidate *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  __HMDPrimaryElectionCandidate *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("hmd.preferred.primary"), CFSTR("hmd.preferred.primary.homeutil"));
  if (!v5)
    goto LABEL_11;
  if (!-[__HMDPrimaryElectionCandidate matchesPreferredPrimaryIdentifier:](self, "matchesPreferredPrimaryIdentifier:", v5))
  {
    if (objc_msgSend(v4, "matchesPreferredPrimaryIdentifier:", v5))
    {
      v6 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[__HMDPrimaryElectionCandidate name](v13, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138544130;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Preferring %@ over %@ in resident election due to preferred primary: %@", (uint8_t *)&v18, 0x2Au);

      }
      v12 = -1;
      goto LABEL_10;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__HMDPrimaryElectionCandidate name](v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Preferring %@ over %@ in resident election due to preferred primary: %@", (uint8_t *)&v18, 0x2Au);

  }
  v12 = 1;
LABEL_10:

  objc_autoreleasePoolPop(v6);
LABEL_12:

  return v12;
}

- (int64_t)compare:(id)a3 currentPrimary:(id)a4 outCriteria:(unint64_t *)a5
{
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = -[__HMDPrimaryElectionCandidate comparePreferredPrimaryStatusWith:](self, "comparePreferredPrimaryStatusWith:", v8);
  if (!v10)
  {
    v13 = -[__HMDPrimaryElectionCandidate enabledAsResident](self, "enabledAsResident");
    v14 = objc_msgSend(v8, "enabledAsResident");
    if (!self)
      goto LABEL_7;
    if ((v14 | !v13) == 1)
    {
      if (((v13 | v14 ^ 1) & 1) != 0)
      {
LABEL_7:
        v15 = -[__HMDPrimaryElectionCandidate pcsEnabled](self, "pcsEnabled");
        v16 = objc_msgSend(v8, "pcsEnabled");
        if (self)
        {
          if ((v16 | !v15) == 1)
          {
            if (((v15 | v16 ^ 1) & 1) != 0)
            {
              v17 = -[__HMDPrimaryElectionCandidate productClass](self);
              v18 = -[__HMDPrimaryElectionCandidate productClass](v8);
              if (v17 != (void *)3 && v18 == (void *)3)
              {
                v11 = 1;
                goto LABEL_24;
              }
              if (v17 == (void *)3 && v18 != (void *)3)
              {
                v11 = -1;
LABEL_24:
                if (a5)
                {
                  v12 = 4;
                  goto LABEL_26;
                }
                goto LABEL_27;
              }
LABEL_29:
              -[__HMDPrimaryElectionCandidate homeKitVersion](self, "homeKitVersion");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "homeKitVersion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v20, "compare:", v21);

              if (v11)
              {
                if (!a5)
                  goto LABEL_27;
                v12 = 5;
                goto LABEL_26;
              }
              -[__HMDPrimaryElectionCandidate swVersion](self, "swVersion");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "swVersion");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = -[__HMDPrimaryElectionCandidate compareSoftwareVersion:with:]((uint64_t)self, v22, v23);

              if (v11)
              {
                if (!a5)
                  goto LABEL_27;
                v12 = 16;
                goto LABEL_26;
              }
              if (v9)
              {
                -[__HMDPrimaryElectionCandidate residentDevice](self, "residentDevice");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "isEqual:", v9);

                if (v25)
                {
                  if (a5)
                    *a5 = 10;
                  v11 = 1;
                  goto LABEL_27;
                }
                objc_msgSend(v8, "residentDevice");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqual:", v9);

                if (v27)
                {
                  if (a5)
                    *a5 = 10;
                  v11 = -1;
                  goto LABEL_27;
                }
              }
              v28 = -[__HMDPrimaryElectionCandidate connectionType](self, "connectionType");
              v29 = objc_msgSend(v8, "connectionType");
              if (self)
              {
                if (v28 == 1 && v29 != 1)
                {
                  v11 = 1;
LABEL_51:
                  if (!a5)
                    goto LABEL_27;
                  v12 = 14;
                  goto LABEL_26;
                }
                if (v28 != 1 && v29 == 1)
                {
                  v11 = -1;
                  goto LABEL_51;
                }
              }
              if (a5)
                *a5 = 13;
              -[__HMDPrimaryElectionCandidate deviceIdentifier](self, "deviceIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "UUIDString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "deviceIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "UUIDString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v31, "compare:", v33);

              goto LABEL_27;
            }
            v11 = -1;
            if (!a5)
              goto LABEL_27;
          }
          else
          {
            v11 = 1;
            if (!a5)
              goto LABEL_27;
          }
          v12 = 15;
          goto LABEL_26;
        }
        -[__HMDPrimaryElectionCandidate productClass](v8);
        goto LABEL_29;
      }
      v11 = -1;
      if (!a5)
        goto LABEL_27;
    }
    else
    {
      v11 = 1;
      if (!a5)
        goto LABEL_27;
    }
    v12 = 1;
    goto LABEL_26;
  }
  v11 = v10;
  if (a5)
  {
    v12 = 17;
LABEL_26:
    *a5 = v12;
  }
LABEL_27:

  return v11;
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void)setResidentDevice:(id)a3
{
  objc_storeStrong((id *)&self->_residentDevice, a3);
}

- (HMDHomeKitVersion)homeKitVersion
{
  return self->_homeKitVersion;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)currentPrimaryIdentifier
{
  return self->_currentPrimaryIdentifier;
}

- (BOOL)enabledAsResident
{
  return self->_enabledAsResident;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (BOOL)pcsEnabled
{
  return self->_pcsEnabled;
}

- (HMFSoftwareVersion)swVersion
{
  return self->_swVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_currentPrimaryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitVersion, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
}

- (void)productClass
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    objc_msgSend(result, "residentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "productInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "productClass");

    return (void *)v4;
  }
  return result;
}

- (uint64_t)compareSoftwareVersion:(void *)a3 with:
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5 && !v6)
    {
      a1 = 1;
      goto LABEL_13;
    }
    if (!v5 && v6)
    {
      a1 = -1;
      goto LABEL_13;
    }
    if (v5)
    {
      objc_msgSend(v5, "operatingSystemVersion");
      if (!v7)
      {
LABEL_12:
        a1 = HMFOperatingSystemVersionCompare();
        goto LABEL_13;
      }
    }
    else if (!v6)
    {
      goto LABEL_12;
    }
    objc_msgSend(v7, "operatingSystemVersion");
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

+ (id)fromMessagePayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "hmf_dataForKey:", CFSTR("parameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode election parameters: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find election parameters in payload (keys: %@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)setSupportsPingRequest:(BOOL)a3 capabilities:(unint64_t)a4
{
  return a3 | a4;
}

+ (BOOL)supportsPingRequest:(unint64_t)a3
{
  return a3 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

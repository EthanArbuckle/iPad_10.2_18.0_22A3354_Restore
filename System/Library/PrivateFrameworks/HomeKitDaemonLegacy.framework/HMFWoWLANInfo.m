@implementation HMFWoWLANInfo

- (HMFWoWLANInfo)initWithPrimaryIdentifier:(id)a3 wifiIdentifiers:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMFWoWLANInfo *v10;
  id *p_isa;
  HMFWoWLANInfo *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 || objc_msgSend(v8, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFWoWLANInfo;
    v10 = -[HMFWoWLANInfo init](&v17, sel_init);
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_primaryMACAddress, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid inputs for HMFWoWLANInfo.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v12 = 0;
  }

  return v12;
}

- (HMFWoWLANInfo)initWithWakeVersion:(unsigned __int8)a3 wakePort:(unsigned __int16)a4 wakeAddress:(id)a5 wakeType:(int64_t)a6 wakePacketType:(int64_t)a7 wakePattern:(id)a8
{
  id v15;
  id v16;
  HMFWoWLANInfo *v17;
  HMFWoWLANInfo *v18;
  HMFWoWLANInfo *v19;
  HMFWoWLANInfo *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a8;
  if (v15)
  {
    v25.receiver = self;
    v25.super_class = (Class)HMFWoWLANInfo;
    v17 = -[HMFWoWLANInfo init](&v25, sel_init);
    v18 = v17;
    if (v17)
    {
      v17->_supportsSleepConfig = 1;
      v17->_version = a3;
      v17->_wakePort = a4;
      objc_storeStrong((id *)&v17->_wakeAddress, a5);
      v18->_wakeType = a6;
      v18->_wakePacketType = a7;
      objc_storeStrong((id *)&v18->_wakePattern, a8);
    }
    v19 = v18;
    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid wake address", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"))
  {
    v3 = -[HMFWoWLANInfo version](self, "version");
    v4 = -[HMFWoWLANInfo wakeType](self, "wakeType");
    v5 = v4 ^ -[HMFWoWLANInfo wakePacketType](self, "wakePacketType") ^ v3;
    v6 = -[HMFWoWLANInfo wakePort](self, "wakePort");
    -[HMFWoWLANInfo wakePattern](self, "wakePattern");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 ^ v6 ^ objc_msgSend(v7, "hash");
    -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 ^ objc_msgSend(v9, "hash");

  }
  else
  {
    -[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hash");
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMFWoWLANInfo *v4;
  HMFWoWLANInfo *v5;
  HMFWoWLANInfo *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int64_t v14;
  int v15;
  int64_t v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;

  v4 = (HMFWoWLANInfo *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_15;
    -[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWoWLANInfo primaryMACAddress](v6, "primaryMACAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_15;
    -[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWoWLANInfo additionalMACAddresses](v6, "additionalMACAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (!v12)
      goto LABEL_15;
    v13 = -[HMFWoWLANInfo version](self, "version");
    if (v13 != -[HMFWoWLANInfo version](v6, "version"))
      goto LABEL_15;
    v14 = -[HMFWoWLANInfo wakeType](self, "wakeType");
    if (v14 != -[HMFWoWLANInfo wakeType](v6, "wakeType"))
      goto LABEL_15;
    v15 = -[HMFWoWLANInfo wakePort](self, "wakePort");
    if (v15 != -[HMFWoWLANInfo wakePort](v6, "wakePort"))
      goto LABEL_15;
    v16 = -[HMFWoWLANInfo wakePacketType](self, "wakePacketType");
    if (v16 != -[HMFWoWLANInfo wakePacketType](v6, "wakePacketType"))
      goto LABEL_15;
    v17 = -[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig");
    if (v17 != -[HMFWoWLANInfo supportsSleepConfig](v6, "supportsSleepConfig"))
      goto LABEL_15;
    -[HMFWoWLANInfo wakePattern](self, "wakePattern");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWoWLANInfo wakePattern](v6, "wakePattern");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if (v20)
    {
      -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFWoWLANInfo wakeAddress](v6, "wakeAddress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = HMFEqualObjects();

    }
    else
    {
LABEL_15:
      v23 = 0;
    }

  }
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("HMFCI.woWLAN.pID"));

  }
  -[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("HMFCI.woWLAN.sIDs"));

  }
  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig"))
  {
    objc_msgSend(v12, "encodeBool:forKey:", 1, CFSTR("HMFCI.woWLAN.sleepConfig"));
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo version](self, "version"), CFSTR("HMFCI.woWLAN.version"));
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePort](self, "wakePort"), CFSTR("HMFCI.woWLAN.WakePort"));
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakeType](self, "wakeType"), CFSTR("HMFCI.woWLAN.wakeType"));
    objc_msgSend(v12, "encodeInteger:forKey:", -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"), CFSTR("HMFCI.woWLAN.wakePacketType"));
    -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("HMFCI.woWLAN.WakeAddress"));

    }
    -[HMFWoWLANInfo wakePattern](self, "wakePattern");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMFWoWLANInfo wakePattern](self, "wakePattern");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("HMFCI.woWLAN.wakePattern"));

    }
  }

}

- (HMFWoWLANInfo)initWithCoder:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMFWoWLANInfo *v11;
  HMFWoWLANInfo *v12;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMFCI.woWLAN.sleepConfig")))
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMFCI.woWLAN.WakePort"));
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMFCI.woWLAN.version"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMFCI.woWLAN.wakeType"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMFCI.woWLAN.wakePacketType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.woWLAN.wakePattern"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.woWLAN.WakeAddress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HMFWoWLANInfo initWithWakeVersion:wakePort:wakeAddress:wakeType:wakePacketType:wakePattern:](self, "initWithWakeVersion:wakePort:wakeAddress:wakeType:wakePacketType:wakePattern:", v6, v5, v10, v7, v8, v9);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.woWLAN.pID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.woWLAN.sIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HMFWoWLANInfo initWithPrimaryIdentifier:wifiIdentifiers:](self, "initWithPrimaryIdentifier:wifiIdentifiers:", v9, v10);
  }
  v12 = v11;

  return v12;
}

- (NSString)wakeAddressString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BYTE v20[6];

  if (-[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig")
    && -[HMFWoWLANInfo wakePacketType](self, "wakePacketType") == 1)
  {
    -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0D285C0]);
      -[HMFWoWLANInfo wakeAddress](self, "wakeAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithAddressData:", v5);

      objc_msgSend(v6, "formattedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HMFWoWLANInfo wakePattern](self, "wakePattern");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HMFWoWLANInfo wakePattern](self, "wakePattern");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (unint64_t)objc_msgSend(v9, "length") >= 0x66)
        {
          v11 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
          v12 = 0;
          while (*(unsigned __int8 *)(v11 + v12) == 255)
          {
            if (++v12 == 6)
            {
              for (i = 0; i != 6; ++i)
                v20[i] = *(_BYTE *)(v11 + 6 + i);
              v14 = v11 + 6;
              v15 = 1;
LABEL_18:
              v16 = 0;
              while (*(unsigned __int8 *)(v14 + v16) == v20[v16])
              {
                if (++v16 == 6)
                {
                  ++v15;
                  v14 += 6;
                  if (v15 != 16)
                    goto LABEL_18;
                  v17 = objc_alloc(MEMORY[0x1E0D285C0]);
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 6);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)objc_msgSend(v17, "initWithAddressData:", v18);

                  objc_msgSend(v19, "formattedString");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_11;
                }
              }
              break;
            }
          }
        }
        v7 = 0;
LABEL_11:

      }
    }
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[HMFWoWLANInfo supportsSleepConfig](self, "supportsSleepConfig");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HMFWoWLANInfo version](self, "version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMFWoWLANInfo wakeType](self, "wakeType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMFWoWLANInfo wakePort](self, "wakePort"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWoWLANInfo wakeAddressString](self, "wakeAddressString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMFWoWLANInfo wakePacketType](self, "wakePacketType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<Version: %@, Wake Type: %@, Wake Port: %@, Wake Address: %@, Wake Packet Type: %@>"), v5, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMFWoWLANInfo primaryMACAddress](self, "primaryMACAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFWoWLANInfo additionalMACAddresses](self, "additionalMACAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<Primary Address: %@, Additional MAC Addresses: %@>"), v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSData)primaryMACAddress
{
  return self->_primaryMACAddress;
}

- (NSArray)additionalMACAddresses
{
  return self->_additionalMACAddresses;
}

- (BOOL)supportsSleepConfig
{
  return self->_supportsSleepConfig;
}

- (unsigned)wakePort
{
  return self->_wakePort;
}

- (NSData)wakeAddress
{
  return self->_wakeAddress;
}

- (void)setWakeAddress:(id)a3
{
  objc_storeStrong((id *)&self->_wakeAddress, a3);
}

- (int64_t)wakeType
{
  return self->_wakeType;
}

- (int64_t)wakePacketType
{
  return self->_wakePacketType;
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void)setWakePattern:(id)a3
{
  objc_storeStrong((id *)&self->_wakePattern, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
  objc_storeStrong((id *)&self->_additionalMACAddresses, 0);
  objc_storeStrong((id *)&self->_primaryMACAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

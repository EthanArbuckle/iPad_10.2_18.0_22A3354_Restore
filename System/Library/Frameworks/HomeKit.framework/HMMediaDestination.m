@implementation HMMediaDestination

- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5
{
  return -[HMMediaDestination initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:](self, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", a3, a4, a5, 0);
}

- (HMMediaDestination)initWithUniqueIdentifier:(id)a3 parentIdentifier:(id)a4 supportedOptions:(unint64_t)a5 audioGroupIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMediaDestination *v15;
  HMMediaDestination *v16;
  HMMediaDestination *v18;
  SEL v19;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v12)
  {
LABEL_7:
    v18 = (HMMediaDestination *)_HMFPreconditionFailure();
    return (HMMediaDestination *)-[HMMediaDestination identifier](v18, v19);
  }
  v14 = v13;
  v20.receiver = self;
  v20.super_class = (Class)HMMediaDestination;
  v15 = -[HMMediaDestination init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v16->_parentIdentifier, a4);
    v16->_supportedOptions = a5;
    objc_storeStrong((id *)&v16->_audioGroupIdentifier, a6);
  }

  return v16;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)containsSupportedOptions:(unint64_t)a3
{
  return (a3 & ~-[HMMediaDestination supportedOptions](self, "supportedOptions")) == 0;
}

- (BOOL)containsHomeTheaterSupportedOptions
{
  return -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 1)
      || -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 4)
      || -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 64);
}

- (BOOL)containsMediaSystemSupportedOptions
{
  return -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 16)
      || -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 32)
      || -[HMMediaDestination containsSupportedOptions:](self, "containsSupportedOptions:", 128);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestination identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("parentIdentifier"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  HMMediaDestinationSupportOptionsAsString(-[HMMediaDestination supportedOptions](self, "supportedOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("supportOptions"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestination attributeDescriptionForAudioGroupIdentifier](self, "attributeDescriptionForAudioGroupIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("audioGroupIdentifier"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (id)attributeDescriptionForAudioGroupIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "UUIDString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Not Set");
  }

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaDestination *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  HMMutableMediaDestination *v9;

  v4 = [HMMutableMediaDestination alloc];
  -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaDestination supportedOptions](self, "supportedOptions");
  -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMediaDestination initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:](v4, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaDestination *v4;
  HMMediaDestination *v5;
  HMMediaDestination *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMMediaDestination *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestination uniqueIdentifier](v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaDestination parentIdentifier](v6, "parentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hmf_isEqualToUUID:", v10)
          && (v11 = -[HMMediaDestination supportedOptions](self, "supportedOptions"),
              v11 == -[HMMediaDestination supportedOptions](v6, "supportedOptions")))
        {
          -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMediaDestination audioGroupIdentifier](v6, "audioGroupIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = HMFEqualObjects();

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaDestination identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMMediaDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMediaDestination *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMMediaDestination *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMMediaDestination *v21;
  NSObject *v22;
  void *v23;
  HMMediaDestination *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationIdentifierCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationParentIdentifierCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationAudioGroupIdentifierCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMMediaDestinationSupportedOptionsCodingKey")))
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get supported options", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMMediaDestinationSupportedOptionsCodingKey"));
    if (!v5)
      goto LABEL_8;
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_11;
    goto LABEL_8;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationSupportedOptionsNumberCodingKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v13, "unsignedIntegerValue");

  if (v5)
    goto LABEL_7;
LABEL_8:
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v17;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get identifier", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationIdentifierCodingKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);

  v5 = (void *)v19;
LABEL_11:
  if (!v6)
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v23;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No parent identifier given - user is in a legacy state", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  }
  v24 = -[HMMediaDestination initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:](self, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v5, v6, v12, v7);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMMediaDestinationIdentifierCodingKey"));

  -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMMediaDestinationParentIdentifierCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMMediaDestination supportedOptions](self, "supportedOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMMediaDestinationSupportedOptionsNumberCodingKey"));

  -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMMediaDestinationAudioGroupIdentifierCodingKey"));

}

- (id)encodeToProtoBufferData
{
  HMMediaGroupProtoMediaDestination *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(HMMediaGroupProtoMediaDestination);
  -[HMMediaDestination uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestination setIdentifier:](v3, "setIdentifier:", v5);

  -[HMMediaDestination parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestination setParentIdentifier:](v3, "setParentIdentifier:", v7);

  -[HMMediaGroupProtoMediaDestination setSupportedOptions:](v3, "setSupportedOptions:", -[HMMediaDestination supportedOptions](self, "supportedOptions"));
  -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMMediaDestination audioGroupIdentifier](self, "audioGroupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaGroupProtoMediaDestination setAudioGroupIdentifier:](v3, "setAudioGroupIdentifier:", v10);

  }
  else
  {
    -[HMMediaGroupProtoMediaDestination setAudioGroupIdentifier:](v3, "setAudioGroupIdentifier:", CFSTR("00000000-0000-0000-0000-000000000000"));
  }

  -[HMMediaGroupProtoMediaDestination data](v3, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMMediaDestination)initWithProtoBufferData:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaDestination *v5;
  HMMediaGroupProtoMediaDestination *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  HMMediaDestination *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  id v31;
  void *v32;
  int v34;
  void *v35;
  __int16 v36;
  HMMediaGroupProtoMediaDestination *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMMediaGroupProtoMediaDestination initWithData:]([HMMediaGroupProtoMediaDestination alloc], "initWithData:", v4);
  v6 = v5;
  if (v5)
  {
    if (-[HMMediaGroupProtoMediaDestination hasIdentifier](v5, "hasIdentifier"))
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMMediaGroupProtoMediaDestination identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

      if (!-[HMMediaGroupProtoMediaDestination hasParentIdentifier](v6, "hasParentIdentifier"))
      {
        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v26;
          v36 = 2112;
          v37 = v6;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@missing field=parentIdentifier from data=%@", (uint8_t *)&v34, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        v23 = 0;
        goto LABEL_26;
      }
      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMMediaGroupProtoMediaDestination parentIdentifier](v6, "parentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

      if (-[HMMediaGroupProtoMediaDestination hasSupportedOptions](v6, "hasSupportedOptions"))
      {
        v13 = -[HMMediaGroupProtoMediaDestination supportedOptions](v6, "supportedOptions");
        if (-[HMMediaGroupProtoMediaDestination hasAudioGroupIdentifier](v6, "hasAudioGroupIdentifier"))
        {
          -[HMMediaGroupProtoMediaDestination audioGroupIdentifier](v6, "audioGroupIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000000"));

          if ((v15 & 1) != 0)
          {
            v16 = 0;
          }
          else
          {
            v31 = objc_alloc(MEMORY[0x1E0CB3A28]);
            -[HMMediaGroupProtoMediaDestination audioGroupIdentifier](v6, "audioGroupIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v31, "initWithUUIDString:", v32);

          }
          self = -[HMMediaDestination initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:](self, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v9, v12, v13, v16);

          v23 = self;
          goto LABEL_25;
        }
        v27 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v29;
          v36 = 2112;
          v37 = v6;
          v30 = "%{public}@missing field=audioGroupIdentifier from data=%@";
          goto LABEL_21;
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v29;
          v36 = 2112;
          v37 = v6;
          v30 = "%{public}@missing field=supportedOptions from data=%@";
LABEL_21:
          _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v34, 0x16u);

        }
      }

      objc_autoreleasePoolPop(v27);
      v23 = 0;
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v19;
      v36 = 2112;
      v37 = v6;
      v20 = "%{public}@missing field=identifier from data=%@";
      v21 = v18;
      v22 = 22;
      goto LABEL_12;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v19;
      v20 = "%{public}@Error deserializing ProtoBuffer data";
      v21 = v18;
      v22 = 12;
LABEL_12:
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v34, v22);

    }
  }

  objc_autoreleasePoolPop(v17);
  v23 = 0;
LABEL_27:

  return v23;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (NSUUID)audioGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAudioGroupIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)payloadForDestination:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if ((a4 & 2) != 0)
  {
    v10 = v6;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE421188))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
    {
      v19 = MEMORY[0x1A1AC1AAC]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = v10;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to internal destination for destination: %@", buf, 0x16u);

      }
      v18 = (void *)v19;
      goto LABEL_15;
    }
    objc_msgSend(v12, "audioDestinationParentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_3;
LABEL_9:
    v13 = MEMORY[0x1A1AC1AAC]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMMediaDestinationControllerUpateOptionsAsString(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier with options: %@ destination: %@", buf, 0x20u);

    }
    v18 = (void *)v13;
LABEL_15:
    objc_autoreleasePoolPop(v18);
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "audioDestinationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
LABEL_3:
  v24 = CFSTR("HMMediaDestinationIdentifierPayloadKey");
  v25 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v9;
}

+ (NSDictionary)payloadForNullDestination
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("HMMediaDestinationIdentifierPayloadKey");
  v4[0] = CFSTR("00000000-0000-0000-0000-000000000000");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_5286);
  return (id)logCategory__hmf_once_v4;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __33__HMMediaDestination_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end

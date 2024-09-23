@implementation HMMediaDestinationControllerData

- (HMMediaDestinationControllerData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 destinationIdentifier:(id)a5 supportedOptions:(unint64_t)a6 availableDestinationIdentifiers:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMMediaDestinationControllerData *v18;
  HMMediaDestinationControllerData *v19;
  HMMediaDestinationControllerData *v21;
  SEL v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_9:
    v21 = (HMMediaDestinationControllerData *)_HMFPreconditionFailure();
    return (HMMediaDestinationControllerData *)-[HMMediaDestinationControllerData logIdentifier](v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMMediaDestinationControllerData;
  v18 = -[HMMediaDestinationControllerData init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_parentIdentifier, a4);
    objc_storeStrong((id *)&v19->_destinationIdentifier, a5);
    v19->_supportedOptions = a6;
    objc_storeStrong((id *)&v19->_availableDestinationIdentifiers, a7);
  }

  return v19;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v21);
  v22[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("parentIdentifier"), v6);
  v22[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("not set");
  v12 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("destinationIdentifier"), v11);
  v22[2] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  HMMediaDestinationControllerSupportOptionsAsString(-[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("supportedOptions"), v14);
  v22[3] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("availableDestinationIdentifiers"), v17);
  v22[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaDestinationControllerData *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  HMMutableMediaDestinationControllerData *v10;

  v4 = [HMMutableMediaDestinationControllerData alloc];
  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions");
  -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMediaDestinationControllerData initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:](v4, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaDestinationControllerData *v4;
  HMMediaDestinationControllerData *v5;
  HMMediaDestinationControllerData *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v21[4];
  HMMediaDestinationControllerData *v22;

  v4 = (HMMediaDestinationControllerData *)a3;
  if (self == v4)
  {
    v19 = 1;
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
      -[HMMediaDestinationControllerData identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaDestinationControllerData identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaDestinationControllerData parentIdentifier](v6, "parentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "hmf_isEqualToUUID:", v10))
          goto LABEL_15;
        -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaDestinationControllerData destinationIdentifier](v6, "destinationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if (!v13)
          goto LABEL_15;
        v14 = -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions");
        if (v14 == -[HMMediaDestinationControllerData supportedOptions](v6, "supportedOptions"))
        {
          -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");
          -[HMMediaDestinationControllerData availableDestinationIdentifiers](v6, "availableDestinationIdentifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == objc_msgSend(v17, "count"))
          {
            -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __44__HMMediaDestinationControllerData_isEqual___block_invoke;
            v21[3] = &unk_1E3AB0478;
            v22 = v6;
            v19 = objc_msgSend(v18, "na_allObjectsPassTest:", v21);

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
LABEL_15:
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMMediaDestinationControllerData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMediaDestinationControllerData *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMediaDestinationControllerData *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMMediaDestinationControllerData *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMediaDestinationControllerData *v32;
  HMMediaDestinationControllerData *v33;
  uint64_t v34;
  HMMediaDestinationControllerData *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  HMMediaDestinationControllerData *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationControllerIdentifierCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationControllerParentIdentifierCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationControllerDestinationIdentifierCodingKey"));
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaDestinationControllerSupportedOptionsCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v7, "unsignedIntegerValue");
  v8 = (void *)MEMORY[0x1E0C99E60];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("HMMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v40 = self;
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Using legacy encoding to get available destination identifiers", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HMMediaDestinationControllerAvailableDestinationsCodingKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "na_map:", &__block_literal_global_52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    self = v40;
    if (!v11)
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v13;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Using legacy homed encoding to get available destination identifiers", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v24 = (void *)MEMORY[0x1E0C99E60];
      v49[0] = objc_opt_class();
      v49[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithArray:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("HMDMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      self = v40;
      if (!v11)
      {
        v27 = (void *)MEMORY[0x1A1AC1AAC]();
        v28 = v21;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v30;
          _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not get encoded available destination identifiers", buf, 0xCu);

          self = v40;
        }

        objc_autoreleasePoolPop(v27);
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
  }
  if (v5 && v6)
  {
    v31 = (void *)v42;
    v32 = -[HMMediaDestinationControllerData initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:](self, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v5, v6, v42, v41, v11);
    v33 = v32;
  }
  else
  {
    v34 = MEMORY[0x1A1AC1AAC]();
    v35 = self;
    v36 = (void *)v34;
    v32 = v35;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v42;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v38;
      v45 = 2112;
      v46 = v5;
      v47 = 2112;
      v48 = v6;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data with identifier: %@ parent identifier: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    v33 = 0;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMMediaDestinationControllerIdentifierCodingKey"));

  -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMMediaDestinationControllerParentIdentifierCodingKey"));

  -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMMediaDestinationControllerDestinationIdentifierCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMMediaDestinationControllerSupportedOptionsCodingKey"));

  -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMMediaDestinationControllerAvailableDestinationIdentifiersCodingKey"));

}

- (id)encodeToProtoBufferData
{
  HMMediaGroupProtoMediaDestinationControllerData *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HMMediaGroupProtoMediaDestinationControllerData);
  -[HMMediaDestinationControllerData identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestinationControllerData setIdentifier:](v3, "setIdentifier:", v5);

  -[HMMediaDestinationControllerData parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestinationControllerData setParentIdentifier:](v3, "setParentIdentifier:", v7);

  -[HMMediaDestinationControllerData destinationIdentifier](self, "destinationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("00000000-0000-0000-0000-000000000000");
  -[HMMediaGroupProtoMediaDestinationControllerData setDestinationIdentifier:](v3, "setDestinationIdentifier:", v11);

  -[HMMediaGroupProtoMediaDestinationControllerData setSupportedOptions:](v3, "setSupportedOptions:", -[HMMediaDestinationControllerData supportedOptions](self, "supportedOptions"));
  -[HMMediaDestinationControllerData availableDestinationIdentifiers](self, "availableDestinationIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_55);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[HMMediaGroupProtoMediaDestinationControllerData setAvailableDestinations:](v3, "setAvailableDestinations:", v14);

  -[HMMediaGroupProtoMediaDestinationControllerData availableDestinations](v3, "availableDestinations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    -[HMMediaGroupProtoMediaDestinationControllerData availableDestinations](v3, "availableDestinations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaGroupProtoMediaDestinationControllerData setAvailableDestinations:](v3, "setAvailableDestinations:", v16);
  }
  else
  {
    v20[0] = CFSTR("00000000-0000-0000-0000-000000000000");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    -[HMMediaGroupProtoMediaDestinationControllerData setAvailableDestinations:](v3, "setAvailableDestinations:", v17);

  }
  -[HMMediaGroupProtoMediaDestinationControllerData data](v3, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMMediaDestinationControllerData)initWithProtoBufferData:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaDestinationControllerData *v5;
  HMMediaGroupProtoMediaDestinationControllerData *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  HMMediaDestinationControllerData *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  int v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  HMMediaGroupProtoMediaDestinationControllerData *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMMediaGroupProtoMediaDestinationControllerData initWithData:]([HMMediaGroupProtoMediaDestinationControllerData alloc], "initWithData:", v4);
  v6 = v5;
  if (!v5)
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543618;
      v46 = v18;
      v47 = 2112;
      v48 = objc_opt_class();
      v19 = "%{public}@[%@] Error deserializing ProtoBuffer data";
      v20 = v17;
      v21 = 22;
LABEL_11:
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v45, v21);

    }
LABEL_12:

    objc_autoreleasePoolPop(v16);
    v22 = 0;
    goto LABEL_36;
  }
  if (!-[HMMediaGroupProtoMediaDestinationControllerData hasIdentifier](v5, "hasIdentifier"))
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543874;
      v46 = v18;
      v47 = 2112;
      v48 = objc_opt_class();
      v49 = 2112;
      v50 = v6;
      v19 = "%{public}@[%@] missing field=identifier from data=%@";
      v20 = v17;
      v21 = 32;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMMediaGroupProtoMediaDestinationControllerData identifier](v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if (-[HMMediaGroupProtoMediaDestinationControllerData hasParentIdentifier](v6, "hasParentIdentifier"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMMediaGroupProtoMediaDestinationControllerData parentIdentifier](v6, "parentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

    if (-[HMMediaGroupProtoMediaDestinationControllerData hasDestinationIdentifier](v6, "hasDestinationIdentifier"))
    {
      -[HMMediaGroupProtoMediaDestinationControllerData destinationIdentifier](v6, "destinationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000000"));

      if ((v14 & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[HMMediaGroupProtoMediaDestinationControllerData destinationIdentifier](v6, "destinationIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

      }
      -[HMMediaGroupProtoMediaDestinationControllerData availableDestinations](v6, "availableDestinations");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[HMMediaGroupProtoMediaDestinationControllerData availableDestinations](v6, "availableDestinations");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "na_map:", &__block_literal_global_57);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v33, "count") == 1)
        {
          objc_msgSend(v33, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "UUIDString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("00000000-0000-0000-0000-000000000000"));

          if (v36)
          {

            v33 = (void *)MEMORY[0x1E0C9AA60];
          }
        }
        if (-[HMMediaGroupProtoMediaDestinationControllerData hasSupportedOptions](v6, "hasSupportedOptions"))
        {
          v37 = -[HMMediaGroupProtoMediaDestinationControllerData supportedOptions](v6, "supportedOptions");
        }
        else
        {
          v41 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 138543874;
            v46 = v43;
            v47 = 2112;
            v48 = objc_opt_class();
            v49 = 2112;
            v50 = v6;
            _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=supportedOptions from data=%@", (uint8_t *)&v45, 0x20u);

          }
          objc_autoreleasePoolPop(v41);
          v37 = 0;
        }
        self = -[HMMediaDestinationControllerData initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:](self, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v9, v12, v15, v37, v33);

        v22 = self;
      }
      else
      {
        v38 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 138543874;
          v46 = v40;
          v47 = 2112;
          v48 = objc_opt_class();
          v49 = 2112;
          v50 = v6;
          _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=availableDestinations from data=%@", (uint8_t *)&v45, 0x20u);

        }
        objc_autoreleasePoolPop(v38);
        v22 = 0;
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543874;
        v46 = v28;
        v47 = 2112;
        v48 = objc_opt_class();
        v49 = 2112;
        v50 = v6;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=destinationIdentifier from data=%@", (uint8_t *)&v45, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      v22 = 0;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543874;
      v46 = v25;
      v47 = 2112;
      v48 = objc_opt_class();
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%@] missing field=parentIdentifier from data=%@", (uint8_t *)&v45, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

LABEL_36:
  return v22;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)destinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (NSArray)availableDestinationIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAvailableDestinationIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDestinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __60__HMMediaDestinationControllerData_initWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

uint64_t __59__HMMediaDestinationControllerData_encodeToProtoBufferData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __50__HMMediaDestinationControllerData_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __44__HMMediaDestinationControllerData_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "availableDestinationIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_21475 != -1)
    dispatch_once(&logCategory__hmf_once_t0_21475, &__block_literal_global_21476);
  return (id)logCategory__hmf_once_v1_21477;
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

void __47__HMMediaDestinationControllerData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_21477;
  logCategory__hmf_once_v1_21477 = v0;

}

@end

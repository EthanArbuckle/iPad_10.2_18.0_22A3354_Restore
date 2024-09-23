@implementation HMMediaGroup

- (HMMediaGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 destinationIdentifiers:(id)a7 associatedGroupIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMMediaGroup *v20;
  HMMediaGroup *v21;
  HMMediaGroup *v23;
  SEL v24;
  id obj;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    v23 = (HMMediaGroup *)_HMFPreconditionFailure();
    return (HMMediaGroup *)-[HMMediaGroup destinationUniqueIdentifiers](v23, v24);
  }
  obj = a8;
  v19 = v18;
  v27.receiver = self;
  v27.super_class = (Class)HMMediaGroup;
  v20 = -[HMMediaGroup init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_parentIdentifier, a4);
    objc_storeStrong((id *)&v21->_name, a5);
    v21->_defaultName = a6;
    objc_storeStrong((id *)&v21->_destinationUniqueIdentifiersInternal, a7);
    objc_storeStrong((id *)&v21->_associatedGroupIdentifier, obj);
  }

  return v21;
}

- (NSArray)destinationIdentifiers
{
  void *v2;
  void *v3;

  -[HMMediaGroup destinationUniqueIdentifiers](self, "destinationUniqueIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_34960);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)mediaSystemData
{
  HMMediaGroup *v2;
  HMMediaGroup *v3;
  HMMediaGroup *v4;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaGroup identifier](self, "identifier");
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
  id v4;
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("parentIdentifier"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("name"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup isDefaultName](self, "isDefaultName");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("isDefaultName"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup destinationUniqueIdentifiers](self, "destinationUniqueIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("destinationIdentifiers"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("associatedGroupIdentifier"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaGroup *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  HMMutableMediaGroup *v11;

  v4 = [HMMutableMediaGroup alloc];
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaGroup isDefaultName](self, "isDefaultName");
  -[HMMediaGroup destinationUniqueIdentifiers](self, "destinationUniqueIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](v4, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaGroup *v4;
  HMMediaGroup *v5;
  HMMediaGroup *v6;
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
  _BOOL4 v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (HMMediaGroup *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && ((v7 = (void *)objc_opt_class(), (objc_msgSend(v7, "isEqual:", objc_opt_class()) & 1) == 0)
       && (v8 = (void *)objc_opt_class(), !objc_msgSend(v8, "isEqual:", objc_opt_class()))
       || (v9 = (void *)objc_opt_class(), (objc_msgSend(v9, "isEqual:", objc_opt_class()) & 1) != 0)
       || (v10 = (void *)objc_opt_class(), objc_msgSend(v10, "isEqual:", objc_opt_class()))))
    {
      -[HMMediaGroup identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaGroup identifier](v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hmf_isEqualToUUID:", v12))
      {
        -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaGroup parentIdentifier](v6, "parentIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "hmf_isEqualToUUID:", v14))
        {
          -[HMMediaGroup name](self, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMediaGroup name](v6, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v16)
            && (v17 = -[HMMediaGroup isDefaultName](self, "isDefaultName"),
                v17 == -[HMMediaGroup isDefaultName](v6, "isDefaultName")))
          {
            v19 = (void *)MEMORY[0x1E0C99E60];
            -[HMMediaGroup destinationIdentifiers](self, "destinationIdentifiers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setWithArray:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x1E0C99E60];
            -[HMMediaGroup destinationIdentifiers](v6, "destinationIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setWithArray:");
            v27 = v20;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isEqual:"))
            {
              -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMediaGroup associatedGroupIdentifier](v6, "associatedGroupIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = HMFEqualObjects();

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMMediaGroup)initWithCoder:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  HMMediaGroup *v18;
  HMMediaGroup *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaGroupIdentifierCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaGroupParentIdentifierCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaGroupNameCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaGroupDefaultNameCodingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HMMediaGroupDestinationIdentifiersCodingKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "na_map:", &__block_literal_global_53);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaGroupAssociatedGroupIdentifierCodingKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v20 = self;
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = objc_opt_class();
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to decode parent identifier", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
    self = v20;
  }
  v18 = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](self, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v5, v6, v7, objc_msgSend(v8, "BOOLValue"), v13, v14);

  return v18;
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
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMMediaGroupIdentifierCodingKey"));

  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMMediaGroupParentIdentifierCodingKey"));

  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMMediaGroupNameCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMMediaGroupDefaultNameCodingKey"));

  -[HMMediaGroup destinationIdentifiers](self, "destinationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMMediaGroupDestinationIdentifiersCodingKey"));

  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HMMediaGroupAssociatedGroupIdentifierCodingKey"));

}

- (id)initClassWithProtoBufferData:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaGroupData *v5;
  HMMediaGroupProtoMediaGroupData *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  HMMediaGroup *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  HMMediaGroupProtoMediaGroupData *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMMediaGroupProtoMediaGroupData initWithData:]([HMMediaGroupProtoMediaGroupData alloc], "initWithData:", v4);
  v6 = v5;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v14;
      v39 = 2112;
      v40 = objc_opt_class();
      v41 = 2112;
      v42 = 0;
      v15 = "%{public}@[%@] Failed to decode event data: %@";
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x20u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v12);
    v16 = 0;
    goto LABEL_29;
  }
  if (!-[HMMediaGroupProtoMediaGroupData hasIdentifier](v5, "hasIdentifier"))
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v14;
      v39 = 2112;
      v40 = objc_opt_class();
      v41 = 2112;
      v42 = v6;
      v15 = "%{public}@[%@] Missing field=identifier from data=%@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMMediaGroupProtoMediaGroupData identifier](v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if (-[HMMediaGroupProtoMediaGroupData hasName](v6, "hasName"))
  {
    -[HMMediaGroupProtoMediaGroupData name](v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMMediaGroupProtoMediaGroupData hasIsDefaultName](v6, "hasIsDefaultName"))
      v11 = -[HMMediaGroupProtoMediaGroupData isDefaultName](v6, "isDefaultName");
    else
      v11 = 0;
    if (-[HMMediaGroupProtoMediaGroupData hasParentIdentifier](v6, "hasParentIdentifier"))
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMMediaGroupProtoMediaGroupData parentIdentifier](v6, "parentIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

      -[HMMediaGroupProtoMediaGroupData destinationIdentifiers](v6, "destinationIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[HMMediaGroupProtoMediaGroupData destinationIdentifiers](v6, "destinationIdentifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0C9AA60];
      }

      objc_msgSend(v24, "na_map:", &__block_literal_global_59);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMMediaGroupProtoMediaGroupData hasAssociatedGroupIdentifier](v6, "hasAssociatedGroupIdentifier"))
      {
        v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[HMMediaGroupProtoMediaGroupData associatedGroupIdentifier](v6, "associatedGroupIdentifier");
        v36 = v9;
        v30 = v22;
        v31 = v11;
        v32 = v10;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v29, "initWithUUIDString:", v33);

        v10 = v32;
        v11 = v31;
        v22 = v30;
        v9 = v36;
      }
      else
      {
        v34 = 0;
      }
      self = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](self, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v9, v22, v10, v11, v28, v34);

      v16 = self;
    }
    else
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v27;
        v39 = 2112;
        v40 = objc_opt_class();
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing field=parentIdentifier from data=%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v16 = 0;
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
      *(_DWORD *)buf = 138543874;
      v38 = v19;
      v39 = 2112;
      v40 = objc_opt_class();
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%@] Missing field=name from data=%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

LABEL_29:
  return v16;
}

- (HMMediaGroup)initWithProtoBufferData:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaGroupData *v5;
  HMMediaGroupProtoMediaGroupData *v6;
  void *v7;
  int v8;
  HMMediaSystemData *v9;
  HMMediaGroup *p_super;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMMediaGroupProtoMediaGroupData initWithData:]([HMMediaGroupProtoMediaGroupData alloc], "initWithData:", v4);
  v6 = v5;
  if (v5)
  {
    if (-[HMMediaGroupProtoMediaGroupData hasGroupRole](v5, "hasGroupRole")
      && (-[HMMediaGroupProtoMediaGroupData groupRole](v6, "groupRole"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "hasMediaSystem"),
          v7,
          v8))
    {
      v9 = -[HMMediaSystemData initWithProtoBufferData:]([HMMediaSystemData alloc], "initWithProtoBufferData:", v4);
    }
    else
    {
      v9 = (HMMediaSystemData *)-[HMMediaGroup initClassWithProtoBufferData:](self, "initClassWithProtoBufferData:", v4);
      self = &v9->super;
    }
    p_super = &v9->super;
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = objc_opt_class();
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to decode event data: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    p_super = 0;
  }

  return p_super;
}

- (void)encodeToProtoBufferDataWithEvent:(id)a3
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
  id v13;

  v4 = a3;
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParentIdentifier:", v8);

  -[HMMediaGroup name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v9);

  objc_msgSend(v4, "setIsDefaultName:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  -[HMMediaGroup destinationIdentifiers](self, "destinationIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v4, "setDestinationIdentifiers:", v11);

  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedGroupIdentifier:", v12);

}

- (id)encodeToProtoBufferData
{
  HMMediaGroupProtoMediaGroupData *v3;
  void *v4;

  v3 = objc_alloc_init(HMMediaGroupProtoMediaGroupData);
  -[HMMediaGroup encodeToProtoBufferDataWithEvent:](self, "encodeToProtoBufferDataWithEvent:", v3);
  -[HMMediaGroupProtoMediaGroupData data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)isDefaultName
{
  return self->_defaultName;
}

- (void)setDefaultName:(BOOL)a3
{
  self->_defaultName = a3;
}

- (NSUUID)associatedGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)destinationUniqueIdentifiersInternal
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDestinationUniqueIdentifiersInternal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationUniqueIdentifiersInternal, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __45__HMMediaGroup_initClassWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

id __30__HMMediaGroup_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

uint64_t __38__HMMediaGroup_destinationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_34974 != -1)
    dispatch_once(&logCategory__hmf_once_t1_34974, &__block_literal_global_37_34975);
  return (id)logCategory__hmf_once_v2_34976;
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

+ (id)groupsWithProtoBufferData:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_55_34972);
}

+ (id)protoBufferDataWithGroups:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_57_34970);
}

uint64_t __42__HMMediaGroup_protoBufferDataWithGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeToProtoBufferData");
}

HMMediaGroup *__42__HMMediaGroup_groupsWithProtoBufferData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMMediaGroup *v3;

  v2 = a2;
  v3 = -[HMMediaGroup initWithProtoBufferData:]([HMMediaGroup alloc], "initWithProtoBufferData:", v2);

  return v3;
}

void __27__HMMediaGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_34976;
  logCategory__hmf_once_v2_34976 = v0;

}

@end

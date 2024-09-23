@implementation HMMediaSystemData

- (HMMediaSystemData)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 associatedGroupIdentifier:(id)a7 leftDestinationIdentifier:(id)a8 rightDestinationIdentifier:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  HMMediaSystemData *v18;
  HMMediaSystemData *v19;
  objc_super v21;

  v11 = a6;
  v16 = a8;
  v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)HMMediaSystemData;
  v18 = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](&v21, sel_initWithIdentifier_parentIdentifier_name_defaultName_destinationIdentifiers_associatedGroupIdentifier_, a3, a4, a5, v11, MEMORY[0x1E0C9AA60], a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_leftDestinationIdentifier, a8);
    objc_storeStrong((id *)&v19->_rightDestinationIdentifier, a9);
  }

  return v19;
}

- (id)destinationUniqueIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasRoleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hmf_isEqualToUUID:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hmf_isEqualToUUID:", v4);

  }
  return v6;
}

- (HMMediaSystemData)initWithProtoBufferData:(id)a3
{
  id v4;
  id *v5;
  HMMediaGroupProtoMediaGroupData *v6;
  HMMediaGroupProtoMediaGroupData *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  id *v23;
  HMMediaSystemData *v24;
  id *v25;
  HMMediaGroupProtoMediaGroupData *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  HMMediaGroupProtoMediaGroupData *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)HMMediaSystemData;
  v5 = -[HMMediaGroup initClassWithProtoBufferData:](&v37, sel_initClassWithProtoBufferData_, v4);
  if (!v5)
  {
LABEL_21:
    v24 = v5;
    goto LABEL_22;
  }
  v6 = -[HMMediaGroupProtoMediaGroupData initWithData:]([HMMediaGroupProtoMediaGroupData alloc], "initWithData:", v4);
  v7 = v6;
  if (!v6)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v5;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2112;
    v41 = 0;
    v22 = "%{public}@Failed to decode event data: %@";
LABEL_11:
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
LABEL_12:

    goto LABEL_13;
  }
  if (!-[HMMediaGroupProtoMediaGroupData hasGroupRole](v6, "hasGroupRole"))
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = v5;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2112;
    v41 = v7;
    v22 = "%{public}@Missing field=groupRole from data=%@";
    goto LABEL_11;
  }
  -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasMediaSystem");

  if ((v9 & 1) != 0)
  {
    -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaSystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasRightDestinationIdentifier");

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaSystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rightDestinationIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithUUIDString:", v16);

    }
    else
    {
      v17 = 0;
    }
    objc_storeStrong(v5 + 8, v17);
    -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mediaSystem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasLeftDestinationIdentifier");

    if (v29)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "mediaSystem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leftDestinationIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v30, "initWithUUIDString:", v33);

    }
    else
    {
      v34 = 0;
    }
    v35 = v5[7];
    v5[7] = (id)v34;

    goto LABEL_21;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v25 = v5;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaGroupProtoMediaGroupData groupRole](v7, "groupRole");
    v26 = (HMMediaGroupProtoMediaGroupData *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2112;
    v41 = v26;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing field=mediaSystem from role=%@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

  objc_autoreleasePoolPop(v18);
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)encodeToProtoBufferData
{
  HMMediaGroupProtoMediaGroupData *v3;
  void *v4;
  HMMediaGroupProtoMediaGroupData *v5;
  HMMediaGroupProtoMediaGroupRole *v6;
  HMMediaGroupProtoMediaSystemRoles *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = [HMMediaGroupProtoMediaGroupData alloc];
  v16.receiver = self;
  v16.super_class = (Class)HMMediaSystemData;
  -[HMMediaGroup encodeToProtoBufferData](&v16, sel_encodeToProtoBufferData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMMediaGroupProtoMediaGroupData initWithData:](v3, "initWithData:", v4);

  v6 = objc_alloc_init(HMMediaGroupProtoMediaGroupRole);
  v7 = objc_alloc_init(HMMediaGroupProtoMediaSystemRoles);
  -[HMMediaGroupProtoMediaGroupRole setMediaSystem:](v6, "setMediaSystem:", v7);

  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaGroupRole mediaSystem](v6, "mediaSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightDestinationIdentifier:", v9);

  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaGroupRole mediaSystem](v6, "mediaSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftDestinationIdentifier:", v12);

  -[HMMediaGroupProtoMediaGroupData setGroupRole:](v5, "setGroupRole:", v6);
  -[HMMediaGroupProtoMediaGroupData data](v5, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMMediaSystemData;
  -[HMMediaGroup attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("leftDestinationIdentifier"), v6);
  v14[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("rightDestinationIdentifier"), v9);
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v11);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaSystemData *v4;
  HMMediaSystemData *v5;
  HMMediaSystemData *v6;
  HMMediaSystemData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (HMMediaSystemData *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMMediaSystemData;
    if (-[HMMediaGroup isEqual:](&v14, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystemData rightDestinationIdentifier](v7, "rightDestinationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
        {
          -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMediaSystemData leftDestinationIdentifier](v7, "leftDestinationIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMMediaSystemData;
  return -[HMMediaGroup hash](&v3, sel_hash);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaSystemData *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  HMMutableMediaSystemData *v12;

  v4 = [HMMutableMediaSystemData alloc];
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaGroup isDefaultName](self, "isDefaultName");
  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMMediaSystemData initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:](v4, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (HMMediaSystemData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMediaSystemData *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataIdentifierCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataParentIdentifierCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataNameCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataDefaultNameCodingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataAssociatedGroupIdentifierCodingKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataLeftDestinationIdentifierCodingKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSystemDataRightDestinationIdentifierCodingKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMMediaSystemData initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:](self, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v5, v6, v7, objc_msgSend(v8, "BOOLValue"), v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMMediaSystemDataIdentifierCodingKey"));

  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMMediaSystemDataParentIdentifierCodingKey"));

  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMMediaSystemDataNameCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMMediaGroup isDefaultName](self, "isDefaultName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMMediaSystemDataDefaultNameCodingKey"));

  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMMediaSystemDataAssociatedGroupIdentifierCodingKey"));

  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HMMediaSystemDataLeftDestinationIdentifierCodingKey"));

  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HMMediaSystemDataRightDestinationIdentifierCodingKey"));

}

- (NSUUID)leftDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLeftDestinationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSUUID)rightDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRightDestinationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDestinationIdentifier, 0);
  objc_storeStrong((id *)&self->_leftDestinationIdentifier, 0);
}

+ (NSString)codingKey
{
  return (NSString *)CFSTR("HMMediaSystemDataCodingKey");
}

+ (NSString)roomNameSentinel
{
  return (NSString *)CFSTR("HMMediaSystemDataRoomNameSentinel");
}

+ (NSString)defaultGroupName
{
  void *v2;
  void *v3;

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalizedString:", CFSTR("STEREO_PAIR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSUUID)unknownDestinationSentinel
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

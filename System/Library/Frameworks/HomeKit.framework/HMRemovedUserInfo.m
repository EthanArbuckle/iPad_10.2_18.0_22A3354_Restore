@implementation HMRemovedUserInfo

- (HMRemovedUserInfo)initWithName:(id)a3 userUUID:(id)a4 userID:(id)a5 dateRemoved:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMRemovedUserInfo *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSUUID *userUUID;
  uint64_t v19;
  NSString *userID;
  uint64_t v21;
  NSDate *dateRemoved;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMRemovedUserInfo;
  v14 = -[HMRemovedUserInfo init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    userUUID = v14->_userUUID;
    v14->_userUUID = (NSUUID *)v17;

    v19 = objc_msgSend(v12, "copy");
    userID = v14->_userID;
    v14->_userID = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    dateRemoved = v14->_dateRemoved;
    v14->_dateRemoved = (NSDate *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  -[HMRemovedUserInfo name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_9;
  -[HMRemovedUserInfo userUUID](self, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_9;
  -[HMRemovedUserInfo userID](self, "userID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (v15)
  {
    -[HMRemovedUserInfo dateRemoved](self, "dateRemoved");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateRemoved");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HMRemovedUserInfo name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMRemovedUserInfo userUUID](self, "userUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMRemovedUserInfo userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMRemovedUserInfo dateRemoved](self, "dateRemoved");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMRemovedUserInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMRemovedUserInfoCodingKeyName"));

  -[HMRemovedUserInfo userUUID](self, "userUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMRemovedUserInfoCodingKeyUserUUID"));

  -[HMRemovedUserInfo userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMRemovedUserInfoCodingKeyUserID"));

  -[HMRemovedUserInfo dateRemoved](self, "dateRemoved");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMRemovedUserInfoCodingKeyDateRemoved"));

}

- (HMRemovedUserInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  NSObject *v13;
  void *v14;
  HMRemovedUserInfo *v15;
  HMRemovedUserInfo *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMRemovedUserInfoCodingKeyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMRemovedUserInfoCodingKeyUserUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMRemovedUserInfoCodingKeyUserID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMRemovedUserInfoCodingKeyDateRemoved"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v14;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding name: %@, userUUID: %@, dateRemoved: %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v16 = 0;
  }
  else
  {
    v15 = -[HMRemovedUserInfo initWithName:userUUID:userID:dateRemoved:](self, "initWithName:userUUID:userID:dateRemoved:", v5, v6, v7, v8);
    v16 = v15;
  }

  return v16;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRemovedUserInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:options:formatter:", CFSTR("name"), v5, 2, v6);
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRemovedUserInfo userUUID](self, "userUUID", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("userUUID"), v9);
  v22[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMRemovedUserInfo dateRemoved](self, "dateRemoved");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("dateRemoved"), v12);
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMRemovedUserInfo userID](self, "userID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMRemovedUserInfo userID](self, "userID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithName:value:options:formatter:", CFSTR("userID"), v18, 2, v19);
    objc_msgSend(v15, "addObject:", v20);

  }
  return (NSArray *)v15;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)dateRemoved
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRemoved, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

@end

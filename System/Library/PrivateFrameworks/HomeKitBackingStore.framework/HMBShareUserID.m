@implementation HMBShareUserID

- (HMBShareUserID)initWithUserRecordID:(id)a3
{
  id v5;
  void *v6;
  HMBShareUserID *v7;
  HMBShareUserID *v8;
  HMBShareUserID *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMBShareUserID;
    v7 = -[HMBShareUserID init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_userRecordID, a3);

    return v8;
  }
  else
  {
    v10 = (HMBShareUserID *)_HMFPreconditionFailure();
    return (HMBShareUserID *)-[HMBShareUserID logIdentifier](v10, v11);
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMBShareUserID userRecordID](self, "userRecordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareUserID userRecordID](self, "userRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("userRecordID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMBShareUserID *v4;
  HMBShareUserID *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMBShareUserID *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMBShareUserID userRecordID](self, "userRecordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBShareUserID userRecordID](v5, "userRecordID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBShareUserID userRecordID](self, "userRecordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMBShareUserID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMBShareUserID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBShareUserID.CodingKey.UserRecordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HMBShareUserID initWithUserRecordID:](self, "initWithUserRecordID:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMBShareUserID userRecordID](self, "userRecordID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBShareUserID.CodingKey.UserRecordID"));

}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRecordID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1)
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_1771);
  return (id)logCategory__hmf_once_v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __29__HMBShareUserID_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1;
  logCategory__hmf_once_v1 = v0;

}

@end

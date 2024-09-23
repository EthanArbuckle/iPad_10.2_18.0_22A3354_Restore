@implementation HMDAccessoryNetworkAccessViolation

- (NSDate)lastViolationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4
{
  id v7;
  id v8;
  HMDAccessoryNetworkAccessViolation *v9;
  HMDAccessoryNetworkAccessViolation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryNetworkAccessViolation;
  v9 = -[HMDAccessoryNetworkAccessViolation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastViolationDate, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

- (BOOL)hasCurrentViolation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6) == 1;

  return v7;
}

- (HMDAccessoryNetworkAccessViolation)initWithLastViolationTimeInterval:(id)a3 lastViolationResetTimeInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDAccessoryNetworkAccessViolation *v9;

  v6 = a4;
  DateFromEpochInterval(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DateFromEpochInterval(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDAccessoryNetworkAccessViolation initWithLastViolationDate:lastViolationResetDate:](self, "initWithLastViolationDate:lastViolationResetDate:", v7, v8);
  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryNetworkAccessViolation *v4;
  HMDAccessoryNetworkAccessViolation *v5;
  HMDAccessoryNetworkAccessViolation *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMDAccessoryNetworkAccessViolation *)a3;
  if (self == v4)
  {
    v12 = 1;
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
      && (-[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDAccessoryNetworkAccessViolation lastViolationDate](v6, "lastViolationDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNetworkAccessViolation lastResetDate](v6, "lastResetDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (HMDAccessoryNetworkAccessViolation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAccessoryNetworkAccessViolation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7CE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7CF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDAccessoryNetworkAccessViolation initWithLastViolationDate:lastViolationResetDate:](self, "initWithLastViolationDate:lastViolationResetDate:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "hmd_isForXPCTransport")
    || objc_msgSend(v6, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    -[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB7CE8]);

    -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB7CF0]);

  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("lastViolationDate"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("lastResetDate"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_lastViolationDate, 0);
}

+ (id)noViolation
{
  if (noViolation_onceToken != -1)
    dispatch_once(&noViolation_onceToken, &__block_literal_global_69022);
  return (id)noViolation_noViolation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__HMDAccessoryNetworkAccessViolation_noViolation__block_invoke()
{
  HMDAccessoryNetworkAccessViolation *v0;
  void *v1;

  v0 = -[HMDAccessoryNetworkAccessViolation initWithLastViolationDate:lastViolationResetDate:]([HMDAccessoryNetworkAccessViolation alloc], "initWithLastViolationDate:lastViolationResetDate:", 0, 0);
  v1 = (void *)noViolation_noViolation;
  noViolation_noViolation = (uint64_t)v0;

}

@end

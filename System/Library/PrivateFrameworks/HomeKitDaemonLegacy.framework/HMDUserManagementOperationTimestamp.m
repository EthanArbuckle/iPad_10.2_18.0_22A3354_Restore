@implementation HMDUserManagementOperationTimestamp

- (HMDUserManagementOperationTimestamp)initWithDevice:(id)a3 state:(unint64_t)a4
{
  id v7;
  HMDUserManagementOperationTimestamp *v8;
  HMDUserManagementOperationTimestamp *v9;
  uint64_t v10;
  NSDate *timestamp;
  uint64_t v12;
  NSNumber *state;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserManagementOperationTimestamp;
  v8 = -[HMDUserManagementOperationTimestamp init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v9->_timestamp;
    v9->_timestamp = (NSDate *)v10;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    state = v9->_state;
    v9->_state = (NSNumber *)v12;

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserManagementOperationTimestamp timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
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
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserManagementOperationTimestamp device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Device"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserManagementOperationTimestamp timestamp](self, "timestamp", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Timestamp"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserManagementOperationTimestamp state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("State"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HMDUserManagementOperationTimestamp *v4;
  HMDUserManagementOperationTimestamp *v5;
  HMDUserManagementOperationTimestamp *v6;
  HMDUserManagementOperationTimestamp *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (HMDUserManagementOperationTimestamp *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (!v6)
      goto LABEL_9;
    -[HMDUserManagementOperationTimestamp timestamp](v6, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperationTimestamp timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_9;
    -[HMDUserManagementOperationTimestamp state](v7, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperationTimestamp state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      -[HMDUserManagementOperationTimestamp device](v7, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperationTimestamp device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

    }
    else
    {
LABEL_9:
      v16 = 0;
    }

  }
  return v16;
}

- (HMDUserManagementOperationTimestamp)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDUserManagementOperationTimestamp *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0;
  v9 = -[HMDUserManagementOperationTimestamp initWithDevice:state:](self, "initWithDevice:state:", v5, v8);
  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v9->_timestamp, v10);

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDUserManagementOperationTimestamp device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.device"));

  -[HMDUserManagementOperationTimestamp timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.date"));

  -[HMDUserManagementOperationTimestamp state](self, "state");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.state"));

}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)state
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

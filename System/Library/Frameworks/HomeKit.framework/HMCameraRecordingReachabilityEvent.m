@implementation HMCameraRecordingReachabilityEvent

- (HMCameraRecordingReachabilityEvent)initWithUniqueIdentifier:(id)a3 dateOfOccurrence:(id)a4 reachable:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  HMCameraRecordingReachabilityEvent *v11;
  uint64_t v12;
  NSUUID *uniqueIdentifier;
  uint64_t v14;
  NSDate *dateOfOccurrence;
  HMCameraRecordingReachabilityEvent *v17;
  SEL v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMCameraRecordingReachabilityEvent *)_HMFPreconditionFailure();
    return (HMCameraRecordingReachabilityEvent *)-[HMCameraRecordingReachabilityEvent description](v17, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)HMCameraRecordingReachabilityEvent;
  v11 = -[HMCameraRecordingReachabilityEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uniqueIdentifier = v11->_uniqueIdentifier;
    v11->_uniqueIdentifier = (NSUUID *)v12;

    v14 = objc_msgSend(v10, "copy");
    dateOfOccurrence = v11->_dateOfOccurrence;
    v11->_dateOfOccurrence = (NSDate *)v14;

    v11->_reachable = a5;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingReachabilityEvent uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uniqueIdentifier: %@"), v4);

  v5 = (void *)MEMORY[0x1E0CB3578];
  -[HMCameraRecordingReachabilityEvent dateOfOccurrence](self, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v6, 1, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateOfOccurrence: %@"), v7);

  -[HMCameraRecordingReachabilityEvent isReachable](self, "isReachable");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" reachable: %@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraRecordingReachabilityEvent uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMCameraRecordingReachabilityEvent dateOfOccurrence](self, "dateOfOccurrence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateOfOccurrence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToDate:", v10))
      {
        v11 = -[HMCameraRecordingReachabilityEvent isReachable](self, "isReachable");
        v12 = v11 ^ objc_msgSend(v6, "isReachable") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraRecordingReachabilityEvent uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMCameraRecordingReachabilityEvent uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMCRRE.ck.ui"));

  -[HMCameraRecordingReachabilityEvent dateOfOccurrence](self, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMCRRE.ck.doo"));

  objc_msgSend(v6, "encodeBool:forKey:", -[HMCameraRecordingReachabilityEvent isReachable](self, "isReachable"), CFSTR("HMCRRE.ck.r"));
}

- (HMCameraRecordingReachabilityEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCameraRecordingReachabilityEvent *v12;
  HMCameraRecordingReachabilityEvent *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCRRE.ck.ui"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCRRE.ck.doo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCRRE.ck.r"));
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC](v7);
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ dateOfOccurrence: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMCameraRecordingReachabilityEvent initWithUniqueIdentifier:dateOfOccurrence:reachable:](self, "initWithUniqueIdentifier:dateOfOccurrence:reachable:", v5, v6, v7);
    v13 = v12;
  }

  return v13;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

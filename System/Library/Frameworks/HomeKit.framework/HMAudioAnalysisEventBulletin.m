@implementation HMAudioAnalysisEventBulletin

- (HMAudioAnalysisEventBulletin)initWithAccessoryIdentifier:(id)a3 homeIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 reason:(unint64_t)a7 state:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMAudioAnalysisEventBulletin *v18;
  HMAudioAnalysisEventBulletin *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMAudioAnalysisEventBulletin;
  v18 = -[HMAudioAnalysisEventBulletin init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v19->_homeIdentifier, a4);
    objc_storeStrong((id *)&v19->_dateOfOccurrence, a6);
    v19->_state = a8;
    v19->_reason = a7;
    objc_storeStrong((id *)&v19->_startDate, a5);
  }

  return v19;
}

- (id)proto
{
  HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v3 = objc_alloc_init(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent);
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setState:](v3, "setState:", -[HMAudioAnalysisEventBulletin state](self, "state"));
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setReason:](v3, "setReason:", -[HMAudioAnalysisEventBulletin reason](self, "reason"));
  -[HMAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setDateOfOccurrence:](v3, "setDateOfOccurrence:", (uint64_t)(v5 * 1000.0));

  -[HMAudioAnalysisEventBulletin accessoryIdentifier](self, "accessoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setAccessoryIdentifier:](v3, "setAccessoryIdentifier:", v7);

  -[HMAudioAnalysisEventBulletin homeIdentifier](self, "homeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setHomeIdentifier:](v3, "setHomeIdentifier:", v9);

  -[HMAudioAnalysisEventBulletin startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setEventStartDate:](v3, "setEventStartDate:", (uint64_t)(v11 * 1000.0));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMAudioAnalysisEventBulletin *v4;
  HMAudioAnalysisEventBulletin *v5;
  HMAudioAnalysisEventBulletin *v6;
  HMAudioAnalysisEventBulletin *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (HMAudioAnalysisEventBulletin *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (self == v4)
  {
    v16 = 1;
  }
  else if (v6)
  {
    -[HMAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAudioAnalysisEventBulletin dateOfOccurrence](v7, "dateOfOccurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      && (v10 = -[HMAudioAnalysisEventBulletin state](self, "state"),
          v10 == -[HMAudioAnalysisEventBulletin state](v7, "state"))
      && (v11 = -[HMAudioAnalysisEventBulletin reason](self, "reason"),
          v11 == -[HMAudioAnalysisEventBulletin reason](v7, "reason")))
    {
      -[HMAudioAnalysisEventBulletin homeIdentifier](self, "homeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAudioAnalysisEventBulletin homeIdentifier](v7, "homeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {
        -[HMAudioAnalysisEventBulletin accessoryIdentifier](self, "accessoryIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAudioAnalysisEventBulletin accessoryIdentifier](v7, "accessoryIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)attributeDescriptions
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAudioAnalysisEventBulletin accessoryIdentifier](self, "accessoryIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("nil");
  v29 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessory"), v5);
  v31[0] = v29;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAudioAnalysisEventBulletin homeIdentifier](self, "homeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  v28 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("homeIdentifier"), v9);
  v31[1] = v28;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAudioAnalysisEventBulletin reason](self, "reason"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("reason"), v27);
  v31[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAudioAnalysisEventBulletin state](self, "state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("state"), v13);
  v31[3] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAudioAnalysisEventBulletin startDate](self, "startDate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("nil");
  v19 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("startDate"), v18);
  v31[4] = v19;
  v20 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAudioAnalysisEventBulletin dateOfOccurrence](self, "dateOfOccurrence");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = CFSTR("nil");
  v24 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("endDate"), v23);
  v31[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v25;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)homeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)accessoryIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
}

+ (id)initWithProto:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  HMAudioAnalysisEventBulletin *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMAudioAnalysisEventBulletin *v17;

  v3 = a3;
  if (objc_msgSend(v3, "hasState")
    && objc_msgSend(v3, "hasReason")
    && objc_msgSend(v3, "hasAccessoryIdentifier")
    && objc_msgSend(v3, "hasHomeIdentifier")
    && objc_msgSend(v3, "hasDateOfOccurrence"))
  {
    v4 = (double)objc_msgSend(v3, "dateOfOccurrence") / 1000.0;
    v5 = (double)objc_msgSend(v3, "eventStartDate") / 1000.0;
    v6 = objc_msgSend(v3, "reason");
    v7 = objc_msgSend(v3, "state");
    v8 = [HMAudioAnalysisEventBulletin alloc];
    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "accessoryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
    v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "homeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMAudioAnalysisEventBulletin initWithAccessoryIdentifier:homeIdentifier:startDate:endDate:reason:state:](v8, "initWithAccessoryIdentifier:homeIdentifier:startDate:endDate:reason:state:", v11, v14, v15, v16, v6, v7);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_40305 != -1)
    dispatch_once(&logCategory__hmf_once_t1_40305, &__block_literal_global_40306);
  return (id)logCategory__hmf_once_v2_40307;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __43__HMAudioAnalysisEventBulletin_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_40307;
  logCategory__hmf_once_v2_40307 = v0;

}

@end

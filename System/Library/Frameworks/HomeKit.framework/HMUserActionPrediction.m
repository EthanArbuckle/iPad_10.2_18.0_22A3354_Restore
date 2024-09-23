@implementation HMUserActionPrediction

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 predictionType:(unint64_t)a4 predictionScore:(double)a5
{
  return -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:](self, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", a3, 0, 0, 0, a4, a5);
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 predictionType:(unint64_t)a5 predictionScore:(double)a6
{
  return -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:](self, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", a3, a4, 0, 0, a5, a6);
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetServiceGroupUUID:(id)a5 predictionType:(unint64_t)a6 predictionScore:(double)a7
{
  return -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:](self, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", a3, a4, a5, 1, a6, a7);
}

- (HMUserActionPrediction)initWithPredictionTargetUUID:(id)a3 targetServiceUUID:(id)a4 targetGroupUUID:(id)a5 targetGroupType:(unint64_t)a6 predictionType:(unint64_t)a7 predictionScore:(double)a8
{
  id v14;
  id v15;
  id v16;
  HMUserActionPrediction *v17;
  uint64_t v18;
  NSUUID *predictionTargetUUID;
  uint64_t v20;
  NSUUID *targetServiceUUID;
  uint64_t v22;
  NSUUID *targetGroupUUID;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMUserActionPrediction;
  v17 = -[HMUserActionPrediction init](&v25, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    predictionTargetUUID = v17->_predictionTargetUUID;
    v17->_predictionTargetUUID = (NSUUID *)v18;

    v17->_predictionType = a7;
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    targetServiceUUID = v17->_targetServiceUUID;
    v17->_targetServiceUUID = (NSUUID *)v20;

    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v16);
    v22 = objc_claimAutoreleasedReturnValue();
    targetGroupUUID = v17->_targetGroupUUID;
    v17->_targetGroupUUID = (NSUUID *)v22;

    v17->_targetGroupType = a6;
    v17->_predictionScore = a8;
  }

  return v17;
}

- (id)copyRemovingGroup
{
  HMUserActionPrediction *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  HMUserActionPrediction *v7;

  v3 = [HMUserActionPrediction alloc];
  -[HMUserActionPrediction predictionTargetUUID](self, "predictionTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserActionPrediction targetServiceUUID](self, "targetServiceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMUserActionPrediction predictionType](self, "predictionType");
  -[HMUserActionPrediction predictionScore](self, "predictionScore");
  v7 = -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:](v3, "initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:", v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return -[HMUserActionPrediction isEqual:ignoreScore:ignoreGroupProperties:](self, "isEqual:ignoreScore:ignoreGroupProperties:", a3, 0, 0);
}

- (BOOL)isEqualIgnoringScore:(id)a3
{
  return -[HMUserActionPrediction isEqual:ignoreScore:ignoreGroupProperties:](self, "isEqual:ignoreScore:ignoreGroupProperties:", a3, 1, 0);
}

- (BOOL)isEqualIgnoringScoreAndGroupProperties:(id)a3
{
  return -[HMUserActionPrediction isEqual:ignoreScore:ignoreGroupProperties:](self, "isEqual:ignoreScore:ignoreGroupProperties:", a3, 1, 1);
}

- (BOOL)isEqual:(id)a3 ignoreScore:(BOOL)a4 ignoreGroupProperties:(BOOL)a5
{
  _BOOL4 v5;
  HMUserActionPrediction *v8;
  HMUserActionPrediction *v9;
  HMUserActionPrediction *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  _BOOL4 v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;

  v5 = a5;
  v8 = (HMUserActionPrediction *)a3;
  if (v8 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
    if (!v10)
      goto LABEL_16;
    -[HMUserActionPrediction targetGroupUUID](self, "targetGroupUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPrediction targetGroupUUID](v10, "targetGroupUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (v13)
    {
      v14 = -[HMUserActionPrediction targetGroupType](self, "targetGroupType");
      v15 = v14 == -[HMUserActionPrediction targetGroupType](v10, "targetGroupType");
    }
    else
    {
      v15 = 0;
    }
    -[HMUserActionPrediction predictionTargetUUID](self, "predictionTargetUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPrediction predictionTargetUUID](v10, "predictionTargetUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if (v19)
    {
      -[HMUserActionPrediction targetServiceUUID](self, "targetServiceUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUserActionPrediction targetServiceUUID](v10, "targetServiceUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      v16 = 0;
      if (v22)
      {
        if (v5 || v15)
        {
          v23 = -[HMUserActionPrediction predictionType](self, "predictionType");
          v24 = -[HMUserActionPrediction predictionType](v10, "predictionType");
          v16 = v23 == v24;
          if (v23 == v24 && !a4)
          {
            -[HMUserActionPrediction predictionScore](self, "predictionScore");
            v26 = v25;
            -[HMUserActionPrediction predictionScore](v10, "predictionScore");
            v16 = vabdd_f64(v26, v27) < 2.22044605e-16;
          }
        }
      }
    }
    else
    {
LABEL_16:
      v16 = 0;
    }

  }
  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  -[HMUserActionPrediction predictionTargetUUID](self, "predictionTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HMUserActionPrediction predictionType](self, "predictionType") ^ v4;
  -[HMUserActionPrediction targetServiceUUID](self, "targetServiceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[HMUserActionPrediction targetGroupUUID](self, "targetGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[HMUserActionPrediction targetGroupType](self, "targetGroupType");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMUserActionPrediction predictionScore](self, "predictionScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ objc_msgSend(v12, "hash");

  return v13;
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
  void *v11;
  id v12;

  v4 = a3;
  -[HMUserActionPrediction predictionTargetUUID](self, "predictionTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.UAPT.ck.pt"));

  -[HMUserActionPrediction targetServiceUUID](self, "targetServiceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.UAPT.ck.ts"));

  -[HMUserActionPrediction targetGroupUUID](self, "targetGroupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.UAPT.ck.tsg"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMUserActionPrediction predictionType](self, "predictionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.UAPT.ck.pty"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMUserActionPrediction predictionScore](self, "predictionScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.UAPT.ck.ps"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMUserActionPrediction predictionScore](self, "predictionScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HM.UAPT.ck.tgt"));

}

- (HMUserActionPrediction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  HMUserActionPrediction *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.pt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.ts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.tsg"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.pty"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.tgt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.UAPT.ck.ps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:](self, "initWithPredictionTargetUUID:targetServiceUUID:targetGroupUUID:targetGroupType:predictionType:predictionScore:", v5, v6, v7, v11, v9, v14);
  return v15;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
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
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserActionPrediction predictionTargetUUID](self, "predictionTargetUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("predictionTargetUUID"), v26, 0, v25);
  v27[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserActionPrediction targetServiceUUID](self, "targetServiceUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v4, "initWithName:value:options:formatter:", CFSTR("targetServiceUUID"), v23, 0, v22);
  v27[1] = v21;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMUserActionPrediction targetGroupUUID](self, "targetGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithName:value:options:formatter:", CFSTR("targetGroupUUID"), v6, 0, v7);
  v27[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMUserActionPrediction predictionType](self, "predictionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("predictionType"), v10);
  v27[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMUserActionPrediction targetGroupType](self, "targetGroupType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("predictionGroupType"), v13);
  v27[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HMUserActionPrediction predictionScore](self, "predictionScore");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("predictionScore"), v17);
  v27[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
}

- (NSUUID)predictionTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)targetServiceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)predictionType
{
  return self->_predictionType;
}

- (double)predictionScore
{
  return self->_predictionScore;
}

- (NSUUID)targetGroupUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)targetGroupType
{
  return self->_targetGroupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetGroupUUID, 0);
  objc_storeStrong((id *)&self->_targetServiceUUID, 0);
  objc_storeStrong((id *)&self->_predictionTargetUUID, 0);
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

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1)
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_10340);
  return (id)logCategory__hmf_once_v2;
}

void __37__HMUserActionPrediction_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

}

@end

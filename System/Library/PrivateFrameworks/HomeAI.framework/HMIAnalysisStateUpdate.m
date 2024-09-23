@implementation HMIAnalysisStateUpdate

- (HMIAnalysisStateUpdate)initWithTorsoAnnotations:(id)a3
{
  id v4;
  HMIAnalysisStateUpdate *v5;
  uint64_t v6;
  NSSet *torsoAnnotations;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIAnalysisStateUpdate;
  v5 = -[HMIAnalysisStateUpdate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    torsoAnnotations = v5->_torsoAnnotations;
    v5->_torsoAnnotations = (NSSet *)v6;

  }
  return v5;
}

- (HMIAnalysisStateUpdate)initWithTorsoAnnotationsArray:(id)a3
{
  void *v4;
  HMIAnalysisStateUpdate *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMIAnalysisStateUpdate initWithTorsoAnnotations:](self, "initWithTorsoAnnotations:", v4);

  return v5;
}

- (id)stateUpdateByMergingStateUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMIAnalysisStateUpdate *v8;

  v4 = a3;
  -[HMIAnalysisStateUpdate torsoAnnotations](self, "torsoAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "torsoAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMIAnalysisStateUpdate initWithTorsoAnnotations:]([HMIAnalysisStateUpdate alloc], "initWithTorsoAnnotations:", v7);
  return v8;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIAnalysisStateUpdate torsoAnnotations](self, "torsoAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Torso Annotations"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMIAnalysisStateUpdate torsoAnnotations](self, "torsoAnnotations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "torsoAnnotations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMIAnalysisStateUpdate torsoAnnotations](self, "torsoAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMIAnalysisStateUpdate torsoAnnotations](self, "torsoAnnotations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIASU.ck.ta"));

}

- (HMIAnalysisStateUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMIAnalysisStateUpdate *v9;
  HMIAnalysisStateUpdate *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("HMIASU.ck.ta"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[HMIAnalysisStateUpdate initWithTorsoAnnotations:](self, "initWithTorsoAnnotations:", v8);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x220735570]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not decode torsoAnnotations", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (NSSet)torsoAnnotations
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoAnnotations, 0);
}

@end

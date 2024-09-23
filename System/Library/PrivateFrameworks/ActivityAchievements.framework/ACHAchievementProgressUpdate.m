@implementation ACHAchievementProgressUpdate

- (NSString)templateUniqueName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HKQuantity)progressQuantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 8, 1);
}

- (HKQuantity)goalQuantity
{
  return (HKQuantity *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_goalQuantity, 0);
  objc_storeStrong((id *)&self->_progressQuantity, 0);
}

- (ACHAchievementProgressUpdate)initWithTemplateUniqueName:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACHAchievementProgressUpdate *v12;
  ACHAchievementProgressUpdate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHAchievementProgressUpdate;
  v12 = -[ACHAchievementProgressUpdate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_templateUniqueName, a3);
    objc_storeStrong((id *)&v13->_progressQuantity, a4);
    objc_storeStrong((id *)&v13->_goalQuantity, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHAchievementProgressUpdate)initWithCodable:(id)a3
{
  void *v4;
  id v5;
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
  ACHAchievementProgressUpdate *v16;

  v4 = (void *)MEMORY[0x24BDD4048];
  v5 = a3;
  objc_msgSend(v5, "progressQuantityUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unitFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD4048];
  objc_msgSend(v5, "goalQuantityUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unitFromString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(v5, "progressQuantityValue");
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(v5, "goalQuantityValue");
  objc_msgSend(v13, "quantityWithUnit:doubleValue:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "templateUniqueName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ACHAchievementProgressUpdate initWithTemplateUniqueName:progressQuantity:goalQuantity:](self, "initWithTemplateUniqueName:progressQuantity:goalQuantity:", v15, v12, v14);
  return v16;
}

- (ACHAchievementProgressUpdate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ACHCodableAchievementProgressUpdate *v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = -[ACHCodableAchievementProgressUpdate initWithData:]([ACHCodableAchievementProgressUpdate alloc], "initWithData:", v8);
    if (v9)
    {
      self = -[ACHAchievementProgressUpdate initWithCodable:](self, "initWithCodable:", v9);

      v9 = (ACHCodableAchievementProgressUpdate *)self;
    }
  }
  else
  {
    v9 = 0;
  }

  return (ACHAchievementProgressUpdate *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a3;
  ACHCodableFromAchievementProgressUpdate(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, v7);

  }
}

- (void)setProgressQuantity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setGoalQuantity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end

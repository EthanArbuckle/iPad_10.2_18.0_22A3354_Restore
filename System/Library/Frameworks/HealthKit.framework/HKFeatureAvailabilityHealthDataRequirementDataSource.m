@implementation HKFeatureAvailabilityHealthDataRequirementDataSource

- (HKFeatureAvailabilityHealthDataRequirementDataSource)initWithEvaluationProvider:(id)a3
{
  id v5;
  HKFeatureAvailabilityHealthDataRequirementDataSource *v6;
  HKFeatureAvailabilityHealthDataRequirementDataSource *v7;
  NSMutableArray *v8;
  NSMutableArray *lock_prewarmedSatisfactionByRequirementStack;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFeatureAvailabilityHealthDataRequirementDataSource;
  v6 = -[HKFeatureAvailabilityHealthDataRequirementDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_evaluationProvider, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_prewarmedSatisfactionByRequirementStack = v7->_lock_prewarmedSatisfactionByRequirementStack;
    v7->_lock_prewarmedSatisfactionByRequirementStack = v8;

  }
  return v7;
}

- (id)withPrewarmedEvaluationOfRequirementSet:(id)a3 error:(id *)a4 handler:(id)a5
{
  void (**v8)(id, id *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void (**)(id, id *))a5;
  -[HKFeatureAvailabilityRequirementSet allHealthDataRequirements](a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityHealthDataRequirementEvaluationProviding evaluationOfRequirements:error:](self->_evaluationProvider, "evaluationOfRequirements:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableArray addObject:](self->_lock_prewarmedSatisfactionByRequirementStack, "addObject:", v11);
      os_unfair_lock_unlock(&self->_lock);
      v8[2](v8, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableArray removeLastObject](self->_lock_prewarmedSatisfactionByRequirementStack, "removeLastObject");
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v8[2](v8, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)isRequirementSatisfied:(id)a3 error:(id *)a4
{
  NSMutableArray *lock_prewarmedSatisfactionByRequirementStack;
  id v5;
  void *v6;
  void *v7;

  lock_prewarmedSatisfactionByRequirementStack = self->_lock_prewarmedSatisfactionByRequirementStack;
  v5 = a3;
  -[NSMutableArray lastObject](lock_prewarmedSatisfactionByRequirementStack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerObserver:(id)a3 forRequirementSet:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[HKFeatureAvailabilityRequirementSet allHealthDataRequirements](a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityHealthDataRequirementEvaluationProviding registerObserver:forRequirements:queue:](self->_evaluationProvider, "registerObserver:forRequirements:queue:", v9, v10, v8);

}

- (void)unregisterObserver:(id)a3
{
  -[HKFeatureAvailabilityHealthDataRequirementEvaluationProviding unregisterObserver:](self->_evaluationProvider, "unregisterObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_prewarmedSatisfactionByRequirementStack, 0);
  objc_storeStrong((id *)&self->_evaluationProvider, 0);
}

@end

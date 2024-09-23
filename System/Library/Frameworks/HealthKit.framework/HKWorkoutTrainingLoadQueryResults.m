@implementation HKWorkoutTrainingLoadQueryResults

- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3
{
  id v4;
  HKWorkoutTrainingLoadQueryResults *v5;
  uint64_t v6;
  HKWorkoutTrainingLoad *totalTrainingLoad;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  v5 = -[HKWorkoutTrainingLoadQueryResults init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    totalTrainingLoad = v5->_totalTrainingLoad;
    v5->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v6;

  }
  return v5;
}

- (HKWorkoutTrainingLoadQueryResults)initWithTotalTrainingLoad:(id)a3 trainingloadByActivityType:(id)a4
{
  id v6;
  id v7;
  HKWorkoutTrainingLoadQueryResults *v8;
  uint64_t v9;
  HKWorkoutTrainingLoad *totalTrainingLoad;
  uint64_t v11;
  NSDictionary *trainingloadByActivityType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  v8 = -[HKWorkoutTrainingLoadQueryResults init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    totalTrainingLoad = v8->_totalTrainingLoad;
    v8->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v9;

    v11 = objc_msgSend(v7, "copy");
    trainingloadByActivityType = v8->_trainingloadByActivityType;
    v8->_trainingloadByActivityType = (NSDictionary *)v11;

  }
  return v8;
}

- (id)trainingLoadForActivityType:(unint64_t)a3
{
  void *v3;
  NSDictionary *trainingloadByActivityType;
  void *v5;

  if (a3 == 84)
  {
    v3 = 0;
  }
  else
  {
    trainingloadByActivityType = self->_trainingloadByActivityType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](trainingloadByActivityType, "objectForKeyedSubscript:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)activityTypes
{
  return -[NSDictionary allKeys](self->_trainingloadByActivityType, "allKeys");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKWorkoutTrainingLoad *totalTrainingLoad;
  id v5;

  totalTrainingLoad = self->_totalTrainingLoad;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", totalTrainingLoad, CFSTR("totalTrainingLoad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trainingloadByActivityType, CFSTR("trainingloadByActivityType"));

}

- (HKWorkoutTrainingLoadQueryResults)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutTrainingLoadQueryResults *v5;
  uint64_t v6;
  HKWorkoutTrainingLoad *totalTrainingLoad;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *trainingloadByActivityType;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutTrainingLoadQueryResults;
  v5 = -[HKWorkoutTrainingLoadQueryResults init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalTrainingLoad"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalTrainingLoad = v5->_totalTrainingLoad;
    v5->_totalTrainingLoad = (HKWorkoutTrainingLoad *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("trainingloadByActivityType"));
    v12 = objc_claimAutoreleasedReturnValue();
    trainingloadByActivityType = v5->_trainingloadByActivityType;
    v5->_trainingloadByActivityType = (NSDictionary *)v12;

  }
  return v5;
}

- (HKWorkoutTrainingLoad)totalTrainingLoad
{
  return (HKWorkoutTrainingLoad *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)trainingloadByActivityType
{
  return self->_trainingloadByActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingloadByActivityType, 0);
  objc_storeStrong((id *)&self->_totalTrainingLoad, 0);
}

@end

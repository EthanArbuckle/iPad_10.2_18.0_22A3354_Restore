@implementation HKWorkoutTrainingLoadCollectionQueryResults

- (HKWorkoutTrainingLoadCollectionQueryResults)initWithTotalTrainingLoadCollection:(id)a3 collectionByActivityType:(id)a4
{
  id v6;
  id v7;
  HKWorkoutTrainingLoadCollectionQueryResults *v8;
  uint64_t v9;
  HKWorkoutTrainingLoadCollection *totalTrainingLoadCollection;
  uint64_t v11;
  NSDictionary *collectionByActivityType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutTrainingLoadCollectionQueryResults;
  v8 = -[HKWorkoutTrainingLoadCollectionQueryResults init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    totalTrainingLoadCollection = v8->_totalTrainingLoadCollection;
    v8->_totalTrainingLoadCollection = (HKWorkoutTrainingLoadCollection *)v9;

    v11 = objc_msgSend(v7, "copy");
    collectionByActivityType = v8->_collectionByActivityType;
    v8->_collectionByActivityType = (NSDictionary *)v11;

  }
  return v8;
}

- (id)trainingLoadCollectionForActivityType:(unint64_t)a3
{
  NSDictionary *collectionByActivityType;
  void *v4;
  void *v5;

  collectionByActivityType = self->_collectionByActivityType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](collectionByActivityType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activityTypes
{
  return -[NSDictionary allKeys](self->_collectionByActivityType, "allKeys");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKWorkoutTrainingLoadCollection *totalTrainingLoadCollection;
  id v5;

  totalTrainingLoadCollection = self->_totalTrainingLoadCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", totalTrainingLoadCollection, CFSTR("totalTrainingLoadCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collectionByActivityType, CFSTR("collectionByActivityType"));

}

- (HKWorkoutTrainingLoadCollectionQueryResults)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutTrainingLoadCollectionQueryResults *v5;
  uint64_t v6;
  HKWorkoutTrainingLoadCollection *totalTrainingLoadCollection;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *collectionByActivityType;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutTrainingLoadCollectionQueryResults;
  v5 = -[HKWorkoutTrainingLoadCollectionQueryResults init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalTrainingLoadCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalTrainingLoadCollection = v5->_totalTrainingLoadCollection;
    v5->_totalTrainingLoadCollection = (HKWorkoutTrainingLoadCollection *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("collectionByActivityType"));
    v12 = objc_claimAutoreleasedReturnValue();
    collectionByActivityType = v5->_collectionByActivityType;
    v5->_collectionByActivityType = (NSDictionary *)v12;

  }
  return v5;
}

- (HKWorkoutTrainingLoadCollection)totalTrainingLoadCollection
{
  return (HKWorkoutTrainingLoadCollection *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)collectionByActivityType
{
  return self->_collectionByActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionByActivityType, 0);
  objc_storeStrong((id *)&self->_totalTrainingLoadCollection, 0);
}

@end

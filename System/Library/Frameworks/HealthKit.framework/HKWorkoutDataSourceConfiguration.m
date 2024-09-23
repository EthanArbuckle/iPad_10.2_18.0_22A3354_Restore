@implementation HKWorkoutDataSourceConfiguration

- (HKWorkoutDataSourceConfiguration)initWithWorkoutConfiguration:(id)a3 sampleTypesToCollect:(id)a4 filters:(id)a5 eventTypesToCollect:(id)a6 collectsDefaultTypes:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKWorkoutDataSourceConfiguration *v16;
  HKWorkoutConfiguration *v17;
  HKWorkoutConfiguration *v18;
  uint64_t v19;
  NSSet *sampleTypesToCollect;
  uint64_t v21;
  NSDictionary *filtersBySampleType;
  uint64_t v23;
  NSSet *eventTypesToCollect;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKWorkoutDataSourceConfiguration;
  v16 = -[HKWorkoutDataSourceConfiguration init](&v26, sel_init);
  if (v16)
  {
    v17 = (HKWorkoutConfiguration *)objc_msgSend(v12, "copy");
    v18 = v17;
    if (!v17)
      v18 = objc_alloc_init(HKWorkoutConfiguration);
    objc_storeStrong((id *)&v16->_workoutConfiguration, v18);
    if (!v17)

    v19 = objc_msgSend(v13, "copy");
    sampleTypesToCollect = v16->_sampleTypesToCollect;
    v16->_sampleTypesToCollect = (NSSet *)v19;

    v21 = objc_msgSend(v14, "copy");
    filtersBySampleType = v16->_filtersBySampleType;
    v16->_filtersBySampleType = (NSDictionary *)v21;

    v23 = objc_msgSend(v15, "copy");
    eventTypesToCollect = v16->_eventTypesToCollect;
    v16->_eventTypesToCollect = (NSSet *)v23;

    v16->_collectsDefaultTypes = a7;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKWorkoutDataSourceConfiguration initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:](+[HKWorkoutDataSourceConfiguration allocWithZone:](HKWorkoutDataSourceConfiguration, "allocWithZone:", a3), "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", self->_workoutConfiguration, self->_sampleTypesToCollect, self->_filtersBySampleType, self->_eventTypesToCollect, self->_collectsDefaultTypes);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutDataSourceConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutDataSourceConfiguration *v5;
  uint64_t v6;
  HKWorkoutConfiguration *workoutConfiguration;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *sampleTypesToCollect;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *filtersBySampleType;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *eventTypesToCollect;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKWorkoutDataSourceConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sampleTypesToCollect"));
    v11 = objc_claimAutoreleasedReturnValue();
    sampleTypesToCollect = v5->_sampleTypesToCollect;
    v5->_sampleTypesToCollect = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("filtersBySampleType"));
    v17 = objc_claimAutoreleasedReturnValue();
    filtersBySampleType = v5->_filtersBySampleType;
    v5->_filtersBySampleType = (NSDictionary *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("eventTypesToCollect"));
    v22 = objc_claimAutoreleasedReturnValue();
    eventTypesToCollect = v5->_eventTypesToCollect;
    v5->_eventTypesToCollect = (NSSet *)v22;

    v5->_collectsDefaultTypes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("collectsDefaultTypes"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutDataSourceConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutConfiguration, CFSTR("workoutConfiguration"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sampleTypesToCollect, CFSTR("sampleTypesToCollect"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_filtersBySampleType, CFSTR("filtersBySampleType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventTypesToCollect, CFSTR("eventTypesToCollect"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_collectsDefaultTypes, CFSTR("collectsDefaultTypes"));

}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return (HKWorkoutConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)sampleTypesToCollect
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)filtersBySampleType
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)eventTypesToCollect
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)collectsDefaultTypes
{
  return self->_collectsDefaultTypes;
}

- (void)setCollectsDefaultTypes:(BOOL)a3
{
  self->_collectsDefaultTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypesToCollect, 0);
  objc_storeStrong((id *)&self->_filtersBySampleType, 0);
  objc_storeStrong((id *)&self->_sampleTypesToCollect, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end

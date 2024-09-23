@implementation HKMCPregnancyModel

- (HKMCPregnancyModel)initWithState:(int64_t)a3 pregnancyStartDate:(id)a4 pregnancyEndDate:(id)a5 estimatedDueDate:(id)a6 pregnancyDuration:(id)a7 physiologicalWashoutEndDate:(id)a8 behavioralWashoutEndDate:(id)a9 trimesters:(id)a10 sample:(id)a11 educationalStepsCompletedDate:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKMCPregnancyModel *v25;
  HKMCPregnancyModel *v26;
  uint64_t v27;
  NSDate *pregnancyStartDate;
  uint64_t v29;
  NSDate *pregnancyEndDate;
  uint64_t v31;
  NSDate *estimatedDueDate;
  uint64_t v33;
  NSDateInterval *pregnancyDuration;
  uint64_t v35;
  NSDate *physiologicalWashoutEndDate;
  uint64_t v37;
  NSDate *behavioralWashoutEndDate;
  uint64_t v39;
  NSArray *trimesters;
  uint64_t v41;
  HKCategorySample *sample;
  id v44;
  id v45;
  objc_super v46;

  v45 = a4;
  v44 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v46.receiver = self;
  v46.super_class = (Class)HKMCPregnancyModel;
  v25 = -[HKMCPregnancyModel init](&v46, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_state = a3;
    v27 = objc_msgSend(v45, "copy");
    pregnancyStartDate = v26->_pregnancyStartDate;
    v26->_pregnancyStartDate = (NSDate *)v27;

    v29 = objc_msgSend(v44, "copy");
    pregnancyEndDate = v26->_pregnancyEndDate;
    v26->_pregnancyEndDate = (NSDate *)v29;

    v31 = objc_msgSend(v18, "copy");
    estimatedDueDate = v26->_estimatedDueDate;
    v26->_estimatedDueDate = (NSDate *)v31;

    v33 = objc_msgSend(v19, "copy");
    pregnancyDuration = v26->_pregnancyDuration;
    v26->_pregnancyDuration = (NSDateInterval *)v33;

    v35 = objc_msgSend(v20, "copy");
    physiologicalWashoutEndDate = v26->_physiologicalWashoutEndDate;
    v26->_physiologicalWashoutEndDate = (NSDate *)v35;

    v37 = objc_msgSend(v21, "copy");
    behavioralWashoutEndDate = v26->_behavioralWashoutEndDate;
    v26->_behavioralWashoutEndDate = (NSDate *)v37;

    v39 = objc_msgSend(v22, "copy");
    trimesters = v26->_trimesters;
    v26->_trimesters = (NSArray *)v39;

    v41 = objc_msgSend(v23, "copy");
    sample = v26->_sample;
    v26->_sample = (HKCategorySample *)v41;

    objc_storeStrong((id *)&v26->_educationalStepsCompletedDate, a12);
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("State"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pregnancyStartDate, CFSTR("PregnancyStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pregnancyEndDate, CFSTR("PregnancyEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedDueDate, CFSTR("EstimatedDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pregnancyDuration, CFSTR("PregnancyDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_physiologicalWashoutEndDate, CFSTR("PhysiologicalWashoutEnd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_behavioralWashoutEndDate, CFSTR("BehavioralWashoutEnd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trimesters, CFSTR("Trimesters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sample, CFSTR("Sample"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_educationalStepsCompletedDate, CFSTR("EducationalStepsCompletedDate"));

}

- (HKMCPregnancyModel)initWithCoder:(id)a3
{
  id v4;
  HKMCPregnancyModel *v5;
  uint64_t v6;
  NSDate *pregnancyStartDate;
  uint64_t v8;
  NSDate *pregnancyEndDate;
  uint64_t v10;
  NSDate *estimatedDueDate;
  uint64_t v12;
  NSDateInterval *pregnancyDuration;
  uint64_t v14;
  NSDate *physiologicalWashoutEndDate;
  uint64_t v16;
  NSDate *behavioralWashoutEndDate;
  void *v18;
  uint64_t v19;
  NSArray *trimesters;
  uint64_t v21;
  HKCategorySample *sample;
  uint64_t v23;
  NSDate *educationalStepsCompletedDate;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKMCPregnancyModel;
  v5 = -[HKMCPregnancyModel init](&v26, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PregnancyStartDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    pregnancyStartDate = v5->_pregnancyStartDate;
    v5->_pregnancyStartDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PregnancyEndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    pregnancyEndDate = v5->_pregnancyEndDate;
    v5->_pregnancyEndDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EstimatedDueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    estimatedDueDate = v5->_estimatedDueDate;
    v5->_estimatedDueDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PregnancyDuration"));
    v12 = objc_claimAutoreleasedReturnValue();
    pregnancyDuration = v5->_pregnancyDuration;
    v5->_pregnancyDuration = (NSDateInterval *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PhysiologicalWashoutEnd"));
    v14 = objc_claimAutoreleasedReturnValue();
    physiologicalWashoutEndDate = v5->_physiologicalWashoutEndDate;
    v5->_physiologicalWashoutEndDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BehavioralWashoutEnd"));
    v16 = objc_claimAutoreleasedReturnValue();
    behavioralWashoutEndDate = v5->_behavioralWashoutEndDate;
    v5->_behavioralWashoutEndDate = (NSDate *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("Trimesters"));
    v19 = objc_claimAutoreleasedReturnValue();
    trimesters = v5->_trimesters;
    v5->_trimesters = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sample"));
    v21 = objc_claimAutoreleasedReturnValue();
    sample = v5->_sample;
    v5->_sample = (HKCategorySample *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EducationalStepsCompletedDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    educationalStepsCompletedDate = v5->_educationalStepsCompletedDate;
    v5->_educationalStepsCompletedDate = (NSDate *)v23;

  }
  return v5;
}

- (id)description
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *physiologicalWashoutEndDate;
  NSDate *behavioralWashoutEndDate;
  NSDate *educationalStepsCompletedDate;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showSensitiveLogItems");

  if (v4)
  {
    +[HKMCPregnancyModel descriptionFromState:](HKMCPregnancyModel, "descriptionFromState:", self->_state);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E37FD4C0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HKMCPregnancyModel trimesters](self, "trimesters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@, "), v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    v21 = *(_OWORD *)&self->_estimatedDueDate;
    v22 = *(_OWORD *)&self->_pregnancyStartDate;
    physiologicalWashoutEndDate = self->_physiologicalWashoutEndDate;
    behavioralWashoutEndDate = self->_behavioralWashoutEndDate;
    educationalStepsCompletedDate = self->_educationalStepsCompletedDate;
    -[HKSample description](self->_sample, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@:%p state:%@ | startDate:%@ | endDate:%@ | estimatedDueDate:%@ | duration:%@ | physiologicalWashoutEndDate:%@ | behavioralWashoutEndDate:%@ | trimesters:%@ | educationalStepsCompletedDate:%@ | sample:%@ "), v14, self, v5, v22, v21, physiologicalWashoutEndDate, behavioralWashoutEndDate, v6, educationalStepsCompletedDate, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)descriptionFromState:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("none");
  if (a3 == 1)
    v3 = CFSTR("ongoing");
  if (a3 == 2)
    return CFSTR("post-pregnancy");
  else
    return (id)v3;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (BOOL)isEqual:(id)a3
{
  HKMCPregnancyModel *v4;
  HKMCPregnancyModel *v5;
  int64_t v6;
  NSDate *pregnancyStartDate;
  NSDate *v8;
  NSDate *pregnancyEndDate;
  NSDate *v10;
  NSDate *estimatedDueDate;
  NSDate *v12;
  NSDateInterval *pregnancyDuration;
  NSDateInterval *v14;
  NSDate *physiologicalWashoutEndDate;
  NSDate *v16;
  NSDate *behavioralWashoutEndDate;
  NSDate *v18;
  NSArray *trimesters;
  NSArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *v27;
  char v28;
  NSDate *educationalStepsCompletedDate;
  NSDate *v31;

  v4 = (HKMCPregnancyModel *)a3;
  if (self == v4)
  {
    v28 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKMCPregnancyModel state](self, "state");
      if (v6 != -[HKMCPregnancyModel state](v5, "state"))
        goto LABEL_33;
      pregnancyStartDate = self->_pregnancyStartDate;
      v8 = v5->_pregnancyStartDate;
      if (pregnancyStartDate != v8 && (!v8 || !-[NSDate isEqualToDate:](pregnancyStartDate, "isEqualToDate:")))
        goto LABEL_33;
      pregnancyEndDate = self->_pregnancyEndDate;
      v10 = v5->_pregnancyEndDate;
      if (pregnancyEndDate != v10 && (!v10 || !-[NSDate isEqualToDate:](pregnancyEndDate, "isEqualToDate:")))
        goto LABEL_33;
      estimatedDueDate = self->_estimatedDueDate;
      v12 = v5->_estimatedDueDate;
      if (estimatedDueDate != v12 && (!v12 || !-[NSDate isEqualToDate:](estimatedDueDate, "isEqualToDate:")))
        goto LABEL_33;
      pregnancyDuration = self->_pregnancyDuration;
      v14 = v5->_pregnancyDuration;
      if (pregnancyDuration != v14
        && (!v14 || !-[NSDateInterval isEqualToDateInterval:](pregnancyDuration, "isEqualToDateInterval:")))
      {
        goto LABEL_33;
      }
      if (((physiologicalWashoutEndDate = self->_physiologicalWashoutEndDate,
             v16 = v5->_physiologicalWashoutEndDate,
             physiologicalWashoutEndDate == v16)
         || v16 && -[NSDate isEqualToDate:](physiologicalWashoutEndDate, "isEqualToDate:"))
        && ((behavioralWashoutEndDate = self->_behavioralWashoutEndDate,
             v18 = v5->_behavioralWashoutEndDate,
             behavioralWashoutEndDate == v18)
         || v18 && -[NSDate isEqualToDate:](behavioralWashoutEndDate, "isEqualToDate:"))
        && ((trimesters = self->_trimesters, v20 = v5->_trimesters, trimesters == v20)
         || v20 && -[NSArray isEqualToArray:](trimesters, "isEqualToArray:")))
      {
        -[HKObject UUID](self->_sample, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKObject UUID](v5->_sample, "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 == v22)
        {
          educationalStepsCompletedDate = self->_educationalStepsCompletedDate;
          v31 = v5->_educationalStepsCompletedDate;
          v28 = educationalStepsCompletedDate == v31;
          if (educationalStepsCompletedDate != v31 && v31)
            v28 = -[NSDate isEqualToDate:](educationalStepsCompletedDate, "isEqualToDate:");
        }
        else
        {
          -[HKObject UUID](v5->_sample, "UUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[HKObject UUID](self->_sample, "UUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKObject UUID](v5->_sample, "UUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
            {
              v26 = self->_educationalStepsCompletedDate;
              v27 = v5->_educationalStepsCompletedDate;
              v28 = v26 == v27;
              if (v26 != v27 && v27)
                v28 = -[NSDate isEqualToDate:](v26, "isEqualToDate:");
            }
            else
            {
              v28 = 0;
            }

          }
          else
          {
            v28 = 0;
          }

        }
      }
      else
      {
LABEL_33:
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int64_t state;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_trimesters;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v7 ^= objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hash", (_QWORD)v18);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  state = self->_state;
  v10 = -[NSDate hash](self->_pregnancyStartDate, "hash");
  v11 = -[NSDate hash](self->_pregnancyEndDate, "hash");
  v12 = -[NSDate hash](self->_estimatedDueDate, "hash");
  v13 = -[NSDateInterval hash](self->_pregnancyDuration, "hash");
  v14 = -[NSDate hash](self->_physiologicalWashoutEndDate, "hash");
  v15 = -[NSDate hash](self->_behavioralWashoutEndDate, "hash");
  v16 = -[HKObject hash](self->_sample, "hash");
  return state ^ v7 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSDate hash](self->_educationalStepsCompletedDate, "hash");
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)pregnancyStartDate
{
  return self->_pregnancyStartDate;
}

- (NSDate)pregnancyEndDate
{
  return self->_pregnancyEndDate;
}

- (NSDate)estimatedDueDate
{
  return self->_estimatedDueDate;
}

- (NSDateInterval)pregnancyDuration
{
  return self->_pregnancyDuration;
}

- (NSArray)trimesters
{
  return self->_trimesters;
}

- (NSDate)physiologicalWashoutEndDate
{
  return self->_physiologicalWashoutEndDate;
}

- (NSDate)behavioralWashoutEndDate
{
  return self->_behavioralWashoutEndDate;
}

- (HKCategorySample)sample
{
  return self->_sample;
}

- (NSDate)educationalStepsCompletedDate
{
  return self->_educationalStepsCompletedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_educationalStepsCompletedDate, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_behavioralWashoutEndDate, 0);
  objc_storeStrong((id *)&self->_physiologicalWashoutEndDate, 0);
  objc_storeStrong((id *)&self->_trimesters, 0);
  objc_storeStrong((id *)&self->_pregnancyDuration, 0);
  objc_storeStrong((id *)&self->_estimatedDueDate, 0);
  objc_storeStrong((id *)&self->_pregnancyEndDate, 0);
  objc_storeStrong((id *)&self->_pregnancyStartDate, 0);
}

@end

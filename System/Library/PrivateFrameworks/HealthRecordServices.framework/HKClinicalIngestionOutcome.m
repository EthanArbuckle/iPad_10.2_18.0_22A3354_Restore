@implementation HKClinicalIngestionOutcome

- (HKClinicalIngestionOutcome)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalIngestionOutcome)initWithTaskSuccess:(BOOL)a3 taskError:(id)a4 taskRuntime:(double)a5 perAccountOutcomes:(id)a6 analyticsString:(id)a7
{
  id v12;
  id v13;
  id v14;
  HKClinicalIngestionOutcome *v15;
  HKClinicalIngestionOutcome *v16;
  uint64_t v17;
  NSError *taskError;
  uint64_t v19;
  NSNumber *taskRuntime;
  uint64_t v21;
  NSArray *perAccountOutcomes;
  uint64_t v23;
  NSString *analyticsString;
  objc_super v26;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalIngestionOutcome;
  v15 = -[HKClinicalIngestionOutcome init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_taskSuccess = a3;
    v17 = objc_msgSend(v12, "copy");
    taskError = v16->_taskError;
    v16->_taskError = (NSError *)v17;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v19 = objc_claimAutoreleasedReturnValue();
    taskRuntime = v16->_taskRuntime;
    v16->_taskRuntime = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    perAccountOutcomes = v16->_perAccountOutcomes;
    v16->_perAccountOutcomes = (NSArray *)v21;

    v23 = objc_msgSend(v14, "copy");
    analyticsString = v16->_analyticsString;
    v16->_analyticsString = (NSString *)v23;

  }
  return v16;
}

- (unint64_t)hash
{
  _BOOL8 taskSuccess;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  taskSuccess = self->_taskSuccess;
  v4 = -[NSError hash](self->_taskError, "hash") ^ taskSuccess;
  v5 = -[NSNumber hash](self->_taskRuntime, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_perAccountOutcomes, "hash");
  return v6 ^ -[NSString hash](self->_analyticsString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKClinicalIngestionOutcome *v5;
  HKClinicalIngestionOutcome *v6;
  HKClinicalIngestionOutcome *v7;
  _BOOL4 taskSuccess;
  NSError *taskError;
  NSError *v10;
  uint64_t v11;
  NSError *v12;
  void *v13;
  void *v14;
  NSNumber *taskRuntime;
  NSNumber *v16;
  NSNumber *v17;
  void *v18;
  NSArray *perAccountOutcomes;
  NSArray *v20;
  NSArray *v21;
  uint64_t v22;
  NSArray *v23;
  void *v24;
  NSString *analyticsString;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSNumber *v39;
  void *v40;

  v5 = (HKClinicalIngestionOutcome *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (taskSuccess = self->_taskSuccess, taskSuccess != -[HKClinicalIngestionOutcome taskSuccess](v7, "taskSuccess")))
    {
      LOBYTE(v14) = 0;
LABEL_39:

      goto LABEL_40;
    }
    taskError = self->_taskError;
    -[HKClinicalIngestionOutcome taskError](v7, "taskError");
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    if (taskError != v10)
    {
      -[HKClinicalIngestionOutcome taskError](v7, "taskError");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        LOBYTE(v14) = 0;
        goto LABEL_38;
      }
      v3 = (void *)v11;
      v12 = self->_taskError;
      -[HKClinicalIngestionOutcome taskError](v7, "taskError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSError isEqual:](v12, "isEqual:", v13))
      {
        LOBYTE(v14) = 0;
LABEL_37:

        goto LABEL_38;
      }
      v40 = v13;
    }
    taskRuntime = self->_taskRuntime;
    -[HKClinicalIngestionOutcome taskRuntime](v7, "taskRuntime");
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (taskRuntime == v16)
    {
      v39 = taskRuntime;
    }
    else
    {
      -[HKClinicalIngestionOutcome taskRuntime](v7, "taskRuntime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_35;
      v39 = taskRuntime;
      v17 = self->_taskRuntime;
      -[HKClinicalIngestionOutcome taskRuntime](v7, "taskRuntime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSNumber isEqual:](v17, "isEqual:", v18) & 1) == 0)
      {

        LOBYTE(v14) = 0;
        goto LABEL_36;
      }
      v35 = v18;
      v36 = v14;
    }
    perAccountOutcomes = self->_perAccountOutcomes;
    -[HKClinicalIngestionOutcome perAccountOutcomes](v7, "perAccountOutcomes");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (perAccountOutcomes == v20)
    {
      v37 = v3;
      v38 = perAccountOutcomes;
    }
    else
    {
      -[HKClinicalIngestionOutcome perAccountOutcomes](v7, "perAccountOutcomes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_32:

LABEL_33:
        if (v39 != v16)
        {
LABEL_34:

        }
LABEL_35:

LABEL_36:
        v13 = v40;
        if (taskError != v10)
          goto LABEL_37;
LABEL_38:

        goto LABEL_39;
      }
      v38 = perAccountOutcomes;
      v21 = self->_perAccountOutcomes;
      -[HKClinicalIngestionOutcome perAccountOutcomes](v7, "perAccountOutcomes");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = (void *)v22;
      if (!-[NSArray isEqualToArray:](v23, "isEqualToArray:", v22))
      {

        LOBYTE(v14) = 0;
        goto LABEL_33;
      }
      v32 = v24;
      v34 = v14;
      v37 = v3;
    }
    analyticsString = self->_analyticsString;
    -[HKClinicalIngestionOutcome analyticsString](v7, "analyticsString", v32);
    v26 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = analyticsString == (NSString *)v26;
    if (analyticsString == (NSString *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[HKClinicalIngestionOutcome analyticsString](v7, "analyticsString");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        v14 = self->_analyticsString;
        -[HKClinicalIngestionOutcome analyticsString](v7, "analyticsString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v14, "isEqualToString:", v30);

        if (v38 == v20)
        {

LABEL_43:
          v3 = v37;
          if (v39 == v16)
            goto LABEL_35;
          goto LABEL_34;
        }

LABEL_41:
        goto LABEL_43;
      }

    }
    if (v38 == v20)
      goto LABEL_41;

    v3 = v37;
    goto LABEL_32;
  }
  LOBYTE(v14) = 1;
LABEL_40:

  return (char)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalIngestionOutcome)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HKClinicalIngestionOutcome *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TaskSuccess"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TaskError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TaskRuntime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("PerAccountOutcomes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnalyticsString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    self = -[HKClinicalIngestionOutcome initWithTaskSuccess:taskError:taskRuntime:perAccountOutcomes:analyticsString:](self, "initWithTaskSuccess:taskError:taskRuntime:perAccountOutcomes:analyticsString:", v5, v6, v11, v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *taskError;
  NSArray *perAccountOutcomes;
  NSString *analyticsString;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", self->_taskSuccess, CFSTR("TaskSuccess"));
  taskError = self->_taskError;
  if (taskError)
    objc_msgSend(v7, "encodeObject:forKey:", taskError, CFSTR("TaskError"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_taskRuntime, CFSTR("TaskRuntime"));
  perAccountOutcomes = self->_perAccountOutcomes;
  if (perAccountOutcomes)
    objc_msgSend(v7, "encodeObject:forKey:", perAccountOutcomes, CFSTR("PerAccountOutcomes"));
  analyticsString = self->_analyticsString;
  if (analyticsString)
    objc_msgSend(v7, "encodeObject:forKey:", analyticsString, CFSTR("AnalyticsString"));

}

- (BOOL)taskSuccess
{
  return self->_taskSuccess;
}

- (NSNumber)taskRuntime
{
  return self->_taskRuntime;
}

- (NSError)taskError
{
  return self->_taskError;
}

- (NSArray)perAccountOutcomes
{
  return self->_perAccountOutcomes;
}

- (NSString)analyticsString
{
  return self->_analyticsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsString, 0);
  objc_storeStrong((id *)&self->_perAccountOutcomes, 0);
  objc_storeStrong((id *)&self->_taskError, 0);
  objc_storeStrong((id *)&self->_taskRuntime, 0);
}

@end

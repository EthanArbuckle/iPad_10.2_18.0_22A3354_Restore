@implementation HKMedicalDateInterval

+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalDateInterval.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

  }
  v6 = -[HKMedicalDateInterval _initWithStartDate:endDate:]([HKMedicalDateInterval alloc], "_initWithStartDate:endDate:", v5, 0);

  return (HKMedicalDateInterval *)v6;
}

+ (HKMedicalDateInterval)medicalDateIntervalWithEndDate:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalDateInterval.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));

  }
  v6 = -[HKMedicalDateInterval _initWithStartDate:endDate:]([HKMedicalDateInterval alloc], "_initWithStartDate:endDate:", 0, v5);

  return (HKMedicalDateInterval *)v6;
}

+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalDateInterval.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalDateInterval.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));

LABEL_3:
  objc_msgSend(v9, "dateForUTC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateForUTC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hk_isAfterDate:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("%@: endDate must not be before startDate"), objc_opt_class());
    v15 = 0;
  }
  else
  {
    v15 = -[HKMedicalDateInterval _initWithStartDate:endDate:]([HKMedicalDateInterval alloc], "_initWithStartDate:endDate:", v9, v11);
  }

  return (HKMedicalDateInterval *)v15;
}

- (id)_initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  HKMedicalDateInterval *v8;
  uint64_t v9;
  HKMedicalDate *startDate;
  uint64_t v11;
  HKMedicalDate *endDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicalDateInterval;
  v8 = -[HKMedicalDateInterval init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    startDate = v8->_startDate;
    v8->_startDate = (HKMedicalDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    endDate = v8->_endDate;
    v8->_endDate = (HKMedicalDate *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicalDateInterval startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalDateInterval endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: startDate: %@, endDate: %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalDateInterval)initWithCoder:(id)a3
{
  id v4;
  HKMedicalDateInterval *v5;
  uint64_t v6;
  HKMedicalDate *startDate;
  uint64_t v8;
  HKMedicalDate *endDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalDateInterval;
  v5 = -[HKMedicalDateInterval init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (HKMedicalDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (HKMedicalDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKMedicalDateInterval startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[HKMedicalDateInterval endDate](self, "endDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKMedicalDateInterval startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKMedicalDateInterval endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalDateInterval *v4;
  HKMedicalDateInterval *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HKMedicalDateInterval *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKMedicalDateInterval startDate](self, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalDateInterval startDate](v5, "startDate");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedicalDateInterval startDate](v5, "startDate");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKMedicalDateInterval startDate](self, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalDateInterval startDate](v5, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKMedicalDateInterval endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalDateInterval endDate](v5, "endDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKMedicalDateInterval endDate](v5, "endDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKMedicalDateInterval endDate](self, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalDateInterval endDate](v5, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (HKMedicalDate)startDate
{
  return self->_startDate;
}

- (HKMedicalDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

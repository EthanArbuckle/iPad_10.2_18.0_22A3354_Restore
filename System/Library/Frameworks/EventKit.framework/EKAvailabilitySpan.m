@implementation EKAvailabilitySpan

- (EKAvailabilitySpan)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Please use the appropriate designated initializer for this class."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (EKAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5
{
  id v10;
  id v11;
  void *v12;
  EKAvailabilitySpan *v13;
  EKAvailabilitySpan *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAvailabilitySpan.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAvailabilitySpan.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));

LABEL_3:
  if (objc_msgSend(v10, "compare:", v12) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAvailabilitySpan.m"), 23, CFSTR("'startDate' must not be after 'endDate'"));

  }
  v19.receiver = self;
  v19.super_class = (Class)EKAvailabilitySpan;
  v13 = -[EKAvailabilitySpan init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startDate, a3);
    objc_storeStrong((id *)&v14->_endDate, a4);
    v14->_type = a5;
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)EKAvailabilitySpan;
  -[EKAvailabilitySpan description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAvailabilitySpan startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAvailabilitySpan endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptionWithLocale:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EKAvailabilitySpan type](self, "type");
  if (v11 > 7)
    v12 = 0;
  else
    v12 = off_1E47858A0[v11];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] startDate: [%@] endDate: [%@] type: [%@]"), v4, v7, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

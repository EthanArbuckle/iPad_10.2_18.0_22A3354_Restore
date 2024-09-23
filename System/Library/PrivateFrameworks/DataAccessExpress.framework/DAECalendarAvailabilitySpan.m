@implementation DAECalendarAvailabilitySpan

- (DAECalendarAvailabilitySpan)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Please use the appropriate designated initializer for this class."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (DAECalendarAvailabilitySpan)initWithStartDate:(id)a3 endDate:(id)a4 type:(int64_t)a5
{
  id v10;
  id v11;
  void *v12;
  DAECalendarAvailabilitySpan *v13;
  DAECalendarAvailabilitySpan *v14;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAECalendarAvailabilitySpan.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAECalendarAvailabilitySpan.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));

LABEL_3:
  if (objc_msgSend(v10, "compare:", v12) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAECalendarAvailabilitySpan.m"), 21, CFSTR("'startDate' must not be after 'endDate'"));

  }
  v19.receiver = self;
  v19.super_class = (Class)DAECalendarAvailabilitySpan;
  v13 = -[DAECalendarAvailabilitySpan init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startDate, a3);
    objc_storeStrong((id *)&v14->_endDate, a4);
    v14->_type = a5;
  }

  return v14;
}

- (id)description
{
  id v3;
  unint64_t type;
  uint64_t v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  type = self->_type;
  if (type > 6)
    v5 = 0;
  else
    v5 = *((_QWORD *)&off_1E68DBEB8 + type);
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("startDate: [%@] endDate: [%@], type: [%@]"), self->_startDate, self->_endDate, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAECalendarAvailabilitySpan)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  DAECalendarAvailabilitySpan *v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DAECalendarAvailabilitySpan initWithStartDate:endDate:type:](self, "initWithStartDate:endDate:type:", v6, v7, objc_msgSend(v8, "integerValue"));
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;
  id v6;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", self->_type);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

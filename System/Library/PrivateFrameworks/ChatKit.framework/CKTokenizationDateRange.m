@implementation CKTokenizationDateRange

- (CKTokenizationDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  CKTokenizationDateRange *v9;
  CKTokenizationDateRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKTokenizationDateRange;
  v9 = -[CKTokenizationDateRange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (id)serializeToStringArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[CKTokenizationDateParser serializationDateFormatter](CKTokenizationDateParser, "serializationDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_startDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  +[CKTokenizationDateParser serializationDateFormatter](CKTokenizationDateParser, "serializationDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", self->_endDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

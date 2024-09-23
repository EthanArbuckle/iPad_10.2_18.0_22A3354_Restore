@implementation ATXModeEvent

- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4
{
  return -[ATXModeEvent initWithStartDate:endDate:entity:](self, "initWithStartDate:endDate:entity:", a3, a4, 0);
}

- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4 entity:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXModeEvent *v12;
  ATXModeEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeEvent;
  v12 = -[ATXModeEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    objc_storeStrong((id *)&v13->_entity, a5);
  }

  return v13;
}

- (NSString)description
{
  id v3;
  NSDate *startDate;
  NSDate *endDate;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  startDate = self->_startDate;
  endDate = self->_endDate;
  -[ATXModeEntityProtocol identifier](self->_entity, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("startDate: %@, endDate: %@, identifier: %@"), startDate, endDate, v6);

  return (NSString *)v7;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (ATXModeEvent)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  return 0;
}

- (id)serialize
{
  return (id)objc_opt_new();
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));

}

- (ATXModeEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXModeEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notifications();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("startDate"), v4, 1, CFSTR("com.apple.proactive.ATXModeEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_notifications();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("endDate"), v4, 1, CFSTR("com.apple.proactive.ATXModeEvent"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      self = -[ATXModeEvent initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v8, v14);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)jsonRawData
{
  NSDate *endDate;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("startDate");
  v4[1] = CFSTR("endDate");
  endDate = self->_endDate;
  v5[0] = self->_startDate;
  v5[1] = endDate;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXModeEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (ATXModeEntityProtocol)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

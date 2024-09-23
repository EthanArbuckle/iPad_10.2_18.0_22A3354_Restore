@implementation CPLResetReason

- (CPLResetReason)initWithDate:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  CPLResetReason *v8;
  uint64_t v9;
  NSString *reason;
  uint64_t v11;
  NSDate *date;
  void *v13;
  uint64_t v14;
  NSString *uuid;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPLResetReason;
  v8 = -[CPLResetReason init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v11;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v14;

  }
  return v8;
}

- (CPLResetReason)initWithPlist:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CPLResetReason *v9;
  id *p_isa;
  CPLResetReason *v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("date"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13.receiver = self;
          v13.super_class = (Class)CPLResetReason;
          v9 = -[CPLResetReason init](&v13, sel_init);
          p_isa = (id *)&v9->super.isa;
          if (v9)
          {
            objc_storeStrong((id *)&v9->_reason, v6);
            objc_storeStrong(p_isa + 3, v8);
            objc_storeStrong(p_isa + 2, v7);
          }
          self = p_isa;
          v11 = self;
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)asPlist
{
  NSDate *date;
  NSString *uuid;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("reason");
  v5[1] = CFSTR("date");
  date = self->_date;
  uuid = self->_uuid;
  v6[0] = self->_reason;
  v6[1] = date;
  v5[2] = CFSTR("uuid");
  v6[2] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reasonDescriptionWithNow:(id)a3
{
  void *v3;
  NSString *reason;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  reason = self->_reason;
  +[CPLDateFormatter stringForTimeIntervalAgo:now:](CPLDateFormatter, "stringForTimeIntervalAgo:now:", self->_date, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), reason, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CPLResetReason)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  CPLResetReason *v10;
  CPLResetReason *v11;
  id *p_isa;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("u"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPLResetReason;
    v11 = -[CPLResetReason init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_reason, v5);
      objc_storeStrong(p_isa + 3, v6);
      objc_storeStrong(p_isa + 2, v7);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("r"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("u"));

}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)tentative
{
  return self->_tentative;
}

- (void)setTentative:(BOOL)a3
{
  self->_tentative = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

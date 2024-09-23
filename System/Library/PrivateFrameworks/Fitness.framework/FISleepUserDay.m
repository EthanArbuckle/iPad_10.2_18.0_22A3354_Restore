@implementation FISleepUserDay

- (FISleepUserDay)initWithStartOfDay:(id)a3 endOfDay:(id)a4
{
  id v6;
  id v7;
  FISleepUserDay *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FISleepUserDay;
  v8 = -[FISleepUserDay init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FISleepUserDay setCreationDate:](v8, "setCreationDate:", v9);

    -[FISleepUserDay setStartOfDay:](v8, "setStartOfDay:", v6);
    -[FISleepUserDay setEndOfDay:](v8, "setEndOfDay:", v7);
  }

  return v8;
}

- (id)initEmptySleepUserDay
{
  FISleepUserDay *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FISleepUserDay;
  v2 = -[FISleepUserDay init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FISleepUserDay setCreationDate:](v2, "setCreationDate:", v3);

    -[FISleepUserDay setStartOfDay:](v2, "setStartOfDay:", 0);
    -[FISleepUserDay setEndOfDay:](v2, "setEndOfDay:", 0);
  }
  return v2;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[FISleepUserDay startOfDay](self, "startOfDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[FISleepUserDay endOfDay](self, "endOfDay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FISleepUserDay)initWithCoder:(id)a3
{
  id v4;
  FISleepUserDay *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[FISleepUserDay init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FISleepUserDay setCreationDate:](v5, "setCreationDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startOfDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FISleepUserDay setStartOfDay:](v5, "setStartOfDay:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endOfDay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FISleepUserDay setEndOfDay:](v5, "setEndOfDay:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FISleepUserDay creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("creationDate"));

  -[FISleepUserDay startOfDay](self, "startOfDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startOfDay"));

  -[FISleepUserDay endOfDay](self, "endOfDay");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endOfDay"));

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startOfDay
{
  return self->_startOfDay;
}

- (void)setStartOfDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endOfDay
{
  return self->_endOfDay;
}

- (void)setEndOfDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfDay, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end

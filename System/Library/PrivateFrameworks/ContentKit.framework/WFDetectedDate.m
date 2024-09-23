@implementation WFDetectedDate

- (WFDetectedDate)initWithDate:(id)a3 timeIsSignificant:(BOOL)a4
{
  id v8;
  WFDetectedDate *v9;
  WFDetectedDate *v10;
  WFDetectedDate *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDateDetector.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFDetectedDate;
  v9 = -[WFDetectedDate init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    v10->_timeIsSignificant = a4;
    v11 = v10;
  }

  return v10;
}

- (WFDetectedDate)initWithDateCheckingResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WFDetectedDate *v7;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "timeIsSignificant");

  v7 = -[WFDetectedDate initWithDate:timeIsSignificant:](self, "initWithDate:timeIsSignificant:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFDetectedDate date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("date"));

  objc_msgSend(v5, "encodeBool:forKey:", -[WFDetectedDate timeIsSignificant](self, "timeIsSignificant"), CFSTR("timeIsSignificant"));
}

- (WFDetectedDate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WFDetectedDate *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("timeIsSignificant"));

  v7 = -[WFDetectedDate initWithDate:timeIsSignificant:](self, "initWithDate:timeIsSignificant:", v5, v6);
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)timeIsSignificant
{
  return self->_timeIsSignificant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

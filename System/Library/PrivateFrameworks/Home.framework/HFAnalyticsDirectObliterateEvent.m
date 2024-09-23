@implementation HFAnalyticsDirectObliterateEvent

- (HFAnalyticsDirectObliterateEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsDirectObliterateEvent *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsDirectObliterateEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v9, sel_initWithEventType_, 56);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAnalyticsDirectObliterateEvent setError:](v5, "setError:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("problemFlags"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAnalyticsDirectObliterateEvent setProblemFlags:](v5, "setProblemFlags:", v7);

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HFAnalyticsDirectObliterateEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorCode"));

  -[HFAnalyticsDirectObliterateEvent error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorDomain"));

  -[HFAnalyticsDirectObliterateEvent problemFlags](self, "problemFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("problemFlags"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSNumber)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(id)a3
{
  objc_storeStrong((id *)&self->_problemFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemFlags, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end

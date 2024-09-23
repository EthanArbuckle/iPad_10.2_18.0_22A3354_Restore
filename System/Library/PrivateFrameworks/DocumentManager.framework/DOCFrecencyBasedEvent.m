@implementation DOCFrecencyBasedEvent

- (double)frecencyScoreAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  long double v8;
  long double v9;

  v4 = a3;
  -[DOCFrecencyBasedEvent lastUsedDate](self, "lastUsedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  -[DOCFrecencyBasedEvent frecency](self, "frecency");
  v9 = log(v8) + 1.0;
  return exp(v7 / -5184000.0) * v9;
}

- (void)updateFrecencyAtDate:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[DOCFrecencyBasedEvent frecencyScoreAtDate:](self, "frecencyScoreAtDate:", v5);
  -[DOCFrecencyBasedEvent setFrecency:](self, "setFrecency:", v4 + 1.0);
  -[DOCFrecencyBasedEvent setLastUsedDate:](self, "setLastUsedDate:", v5);

}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (double)frecency
{
  return self->_frecency;
}

- (void)setFrecency:(double)a3
{
  self->_frecency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
}

@end

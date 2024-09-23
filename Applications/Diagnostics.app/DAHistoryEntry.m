@implementation DAHistoryEntry

- (DAHistoryEntry)init
{
  return -[DAHistoryEntry initWithTestSuiteName:skipped:](self, "initWithTestSuiteName:skipped:", &stru_10013CDC8, 0);
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  DAHistoryEntry *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = -[DAHistoryEntry initWithTestSuiteName:date:skipped:](self, "initWithTestSuiteName:date:skipped:", v6, v7, v4);

  return v8;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4 results:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  DAHistoryEntry *v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = -[DAHistoryEntry initWithTestSuiteName:date:skipped:results:](self, "initWithTestSuiteName:date:skipped:results:", v9, v10, v5, v8);

  return v11;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5
{
  return -[DAHistoryEntry initWithTestSuiteName:date:skipped:results:](self, "initWithTestSuiteName:date:skipped:results:", a3, a4, a5, 0);
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5 results:(id)a6
{
  id v11;
  id v12;
  id v13;
  DAHistoryEntry *v14;
  DAHistoryEntry *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DAHistoryEntry;
  v14 = -[DAHistoryEntry init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_testSuiteName, a3);
    objc_storeStrong((id *)&v15->_date, a4);
    v15->_skipped = a5;
    objc_storeStrong((id *)&v15->_results, a6);
  }

  return v15;
}

- (DAHistoryEntry)initWithCoder:(id)a3
{
  id v4;
  DAHistoryEntry *v5;
  id v6;
  uint64_t v7;
  NSString *testSuiteName;
  id v9;
  uint64_t v10;
  NSDate *date;
  id v12;
  uint64_t v13;
  ASTSuiteResult *results;

  v4 = a3;
  v5 = -[DAHistoryEntry init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("testSuiteName"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    testSuiteName = v5->_testSuiteName;
    v5->_testSuiteName = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("date"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v5->_skipped = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipped"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(ASTSuiteResult), CFSTR("results"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    results = v5->_results;
    v5->_results = (ASTSuiteResult *)v13;

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry testSuiteName](self, "testSuiteName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("testSuiteName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry date](self, "date"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("date"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DAHistoryEntry skipped](self, "skipped"), CFSTR("skipped"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry results](self, "results"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("results"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_testSuiteName, "copyWithZone:", a3);
  v7 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  v8 = objc_msgSend(v5, "initWithTestSuiteName:date:skipped:", v6, v7, self->_skipped);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry testSuiteName](self, "testSuiteName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry date](self, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("testSuiteName: %@; date: %@; skipped: %d"),
                   v3,
                   v4,
                   -[DAHistoryEntry skipped](self, "skipped")));

  return v5;
}

- (NSString)testSuiteName
{
  return self->_testSuiteName;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (ASTSuiteResult)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_testSuiteName, 0);
}

@end

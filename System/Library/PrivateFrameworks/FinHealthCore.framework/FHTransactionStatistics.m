@implementation FHTransactionStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *aggregateRecords;
  id v5;

  aggregateRecords = self->_aggregateRecords;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", aggregateRecords, CFSTR("aggregateRecords"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_timeWindow, CFSTR("timeWindow"));

}

- (FHTransactionStatistics)initWithCoder:(id)a3
{
  id v4;
  FHTransactionStatistics *v5;
  uint64_t v6;
  NSArray *aggregateRecords;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHTransactionStatistics;
  v5 = -[FHTransactionStatistics init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("aggregateRecords"));
    v6 = objc_claimAutoreleasedReturnValue();
    aggregateRecords = v5->_aggregateRecords;
    v5->_aggregateRecords = (NSArray *)v6;

    v5->_timeWindow = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeWindow"));
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_aggregateRecords, "hash");
  return self->_timeWindow - v3 + 32 * v3 + 961;
}

- (BOOL)isEqual:(id)a3
{
  FHTransactionStatistics *v4;
  FHTransactionStatistics *v5;
  unint64_t timeWindow;
  NSArray *aggregateRecords;
  void *v8;
  char v9;

  v4 = (FHTransactionStatistics *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (timeWindow = self->_timeWindow, timeWindow == -[FHTransactionStatistics timeWindow](v5, "timeWindow")))
  {
    aggregateRecords = self->_aggregateRecords;
    -[FHTransactionStatistics aggregateRecords](v5, "aggregateRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSArray isEqual:](aggregateRecords, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("aggregateRecords"), self->_aggregateRecords);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("timeWindow"), self->_timeWindow);
  return v3;
}

- (FHTransactionStatistics)initWithTransactionAggregateRecords:(id)a3 timeWindow:(unint64_t)a4
{
  id v7;
  FHTransactionStatistics *v8;
  FHTransactionStatistics *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHTransactionStatistics;
  v8 = -[FHTransactionStatistics init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aggregateRecords, a3);
    v9->_timeWindow = a4;
  }

  return v9;
}

- (NSArray)aggregateRecords
{
  return self->_aggregateRecords;
}

- (unint64_t)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateRecords, 0);
}

@end

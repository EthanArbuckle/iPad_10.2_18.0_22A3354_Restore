@implementation _GDSEmissionHistory

- (_GDSEmissionHistory)initWithHistoricalData:(id)a3 fetchedAt:(id)a4
{
  id v7;
  id v8;
  _GDSEmissionHistory *v9;
  _GDSEmissionHistory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GDSEmissionHistory;
  v9 = -[_GDSEmissionHistory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchDate, a4);
    objc_storeStrong((id *)&v10->_historicalMap, a3);
  }

  return v10;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NSDictionary)historicalMap
{
  return self->_historicalMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalMap, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
}

@end

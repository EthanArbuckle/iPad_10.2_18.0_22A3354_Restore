@implementation HMBLocalSQLContextRowQueryTuple

- (HMBLocalSQLContextRowQueryTuple)initWithQueryRow:(unint64_t)a3 data:(id)a4
{
  id v7;
  HMBLocalSQLContextRowQueryTuple *v8;
  HMBLocalSQLContextRowQueryTuple *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextRowQueryTuple;
  v8 = -[HMBLocalSQLContextRowQueryTuple init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_queryRow = a3;
    objc_storeStrong((id *)&v8->_queryData, a4);
  }

  return v9;
}

- (unint64_t)queryRow
{
  return self->_queryRow;
}

- (NSData)queryData
{
  return self->_queryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryData, 0);
}

@end

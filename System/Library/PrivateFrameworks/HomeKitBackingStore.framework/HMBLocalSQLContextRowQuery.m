@implementation HMBLocalSQLContextRowQuery

- (HMBLocalSQLContextRowQuery)initWithRecordRow:(unint64_t)a3 tuples:(id)a4
{
  id v7;
  HMBLocalSQLContextRowQuery *v8;
  HMBLocalSQLContextRowQuery *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextRowQuery;
  v8 = -[HMBLocalSQLContextRowQuery init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_recordRow = a3;
    objc_storeStrong((id *)&v8->_tuples, a4);
  }

  return v9;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (NSDictionary)tuples
{
  return self->_tuples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuples, 0);
}

@end

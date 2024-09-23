@implementation CRRepairReportItem

- (CRRepairReportItem)initWithName:(id)a3
{
  id v5;
  CRRepairReportItem *v6;
  CRRepairReportItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRRepairReportItem;
  v6 = -[CRRepairReportItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

+ (id)itemWithName:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithName_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)withStatus:(int64_t)a3
{
  *((_QWORD *)self + 2) = a3;
  return self;
}

- (id)withError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  return self;
}

- (id)withDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

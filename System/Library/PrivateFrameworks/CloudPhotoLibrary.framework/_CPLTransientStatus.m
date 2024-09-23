@implementation _CPLTransientStatus

- (_CPLTransientStatus)initWithRecord:(id)a3 generation:(unint64_t)a4 date:(id)a5
{
  id v9;
  id v10;
  _CPLTransientStatus *v11;
  _CPLTransientStatus *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CPLTransientStatus;
  v11 = -[_CPLTransientStatus init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_record, a3);
    v12->_generation = a4;
    objc_storeStrong((id *)&v12->_date, a5);
  }

  return v12;
}

- (CPLRecordStatus)status
{
  return -[CPLRecordStatus initWithRecord:generation:]([CPLRecordStatus alloc], "initWithRecord:generation:", self->_record, self->_generation);
}

- (NSDate)date
{
  return self->_date;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end

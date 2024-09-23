@implementation CPLIgnoredRecord

- (CPLIgnoredRecord)initWithRecord:(id)a3 ignoredDate:(id)a4
{
  id v7;
  id v8;
  CPLIgnoredRecord *v9;
  CPLIgnoredRecord *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLIgnoredRecord;
  v9 = -[CPLIgnoredRecord init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_ignoredDate, a4);
  }

  return v10;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (NSDate)ignoredDate
{
  return self->_ignoredDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDate, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end

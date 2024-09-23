@implementation HMBLocalSQLIteratorRowRecord

- (HMBLocalSQLIteratorRowRecord)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 returning:(unint64_t)a5
{
  id v8;
  void *v9;
  HMBLocalSQLIteratorRowRecord *v10;
  void *v11;
  void *v12;
  void *v13;
  HMBLocalSQLIteratorRowRecord *v15;
  SEL v16;
  sqlite3_stmt *v17;
  id *v18;
  objc_super v19;

  v8 = a3;
  objc_msgSend(v8, "selectAllRecordRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HMBLocalSQLIteratorRowRecord;
  v10 = -[HMBSQLQueryIterator initWithStatement:initialSequence:maximumRowsPerSelect:error:](&v19, sel_initWithStatement_initialSequence_maximumRowsPerSelect_error_, v9, &unk_1E8947778, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"), 0);

  if (!v10)
    goto LABEL_4;
  objc_msgSend(v8, "selectAllRecordRows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_numberForKey:", CFSTR("_store_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v10->_zoneRowBindOffset = objc_msgSend(v13, "intValue");
    v10->_zoneRow = a4;
    v10->_returning = a5;

LABEL_4:
    return v10;
  }
  v15 = (HMBLocalSQLIteratorRowRecord *)_HMFPreconditionFailure();
  return (HMBLocalSQLIteratorRowRecord *)-[HMBLocalSQLIteratorRowRecord bindPropertiesToStatement:error:](v15, v16, v17, v18);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  hmbBindIntSQLite3(a3, -[HMBLocalSQLIteratorRowRecord zoneRowBindOffset](self, "zoneRowBindOffset"), -[HMBLocalSQLIteratorRowRecord zoneRow](self, "zoneRow"), a4);
  return 1;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  HMBLocalSQLContextRowRecord *v7;

  v7 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a3, -[HMBLocalSQLIteratorRowRecord returning](self, "returning"));
  *a5 = -[HMBLocalSQLContextRowRecord recordRow](v7, "recordRow");
  return v7;
}

- (unint64_t)returning
{
  return self->_returning;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

@end

@implementation HMBLocalZoneQueryResultRecordColumns

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  HMBLocalSQLContextRowRecord *v7;

  v7 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a3, 2);
  *a5 = -[HMBLocalSQLContextRowRecord recordRow](v7, "recordRow");
  return v7;
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelFromRecord:storageLocation:error:", v8, 2, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

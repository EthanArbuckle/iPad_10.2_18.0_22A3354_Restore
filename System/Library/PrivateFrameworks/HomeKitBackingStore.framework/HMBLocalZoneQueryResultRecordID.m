@implementation HMBLocalZoneQueryResultRecordID

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  sqlite3_int64 v7;

  v7 = sqlite3_column_int64(a3, 0);
  *a5 = v7;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v7, "fetchModelWithRecordRow:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

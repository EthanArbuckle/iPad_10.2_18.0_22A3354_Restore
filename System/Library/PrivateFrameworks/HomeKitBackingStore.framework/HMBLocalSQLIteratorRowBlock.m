@implementation HMBLocalSQLIteratorRowBlock

- (HMBLocalSQLIteratorRowBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4 statement:(id)a5 isAscending:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  HMBLocalSQLIteratorRowBlock *v14;
  void *v15;
  void *v16;
  HMBLocalSQLIteratorRowBlock *v18;
  SEL v19;
  sqlite3_stmt *v20;
  id *v21;
  objc_super v22;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = &unk_1E89476A0;
  if (v6)
    v12 = &unk_1E8947688;
  v13 = v12;
  v22.receiver = self;
  v22.super_class = (Class)HMBLocalSQLIteratorRowBlock;
  v14 = -[HMBSQLQueryIterator initWithStatement:initialSequence:maximumRowsPerSelect:error:](&v22, sel_initWithStatement_initialSequence_maximumRowsPerSelect_error_, v11, v13, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"), 0);
  if (!v14)
    goto LABEL_6;
  objc_msgSend(v11, "arguments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmf_numberForKey:", CFSTR("_store_id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v14->_zoneRowBindOffset = objc_msgSend(v16, "intValue");
    v14->_zoneRow = a4;
    v14->_ascending = v6;

LABEL_6:
    return v14;
  }
  v18 = (HMBLocalSQLIteratorRowBlock *)_HMFPreconditionFailure();
  return (HMBLocalSQLIteratorRowBlock *)-[HMBLocalSQLIteratorRowBlock bindPropertiesToStatement:error:](v18, v19, v20, v21);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  hmbBindIntSQLite3(a3, -[HMBLocalSQLIteratorRowBlock zoneRowBindOffset](self, "zoneRowBindOffset"), -[HMBLocalSQLIteratorRowBlock zoneRow](self, "zoneRow"), a4);
  return 1;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  HMBLocalSQLContextRowBlock *v9;
  sqlite3_int64 v10;
  sqlite3_int64 v11;
  void *v12;
  HMBLocalSQLContextRowBlock *v13;

  v9 = [HMBLocalSQLContextRowBlock alloc];
  v10 = sqlite3_column_int64(a3, 0);
  v11 = sqlite3_column_int64(a3, 1);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMBLocalSQLContextRowBlock initWithBlockRow:type:options:](v9, "initWithBlockRow:type:options:", v10, v11, v12);

  LODWORD(v12) = -[HMBLocalSQLIteratorRowBlock isAscending](self, "isAscending");
  *a5 = -[HMBLocalSQLContextRowBlock blockRow](v13, "blockRow") - (v12 ^ 1);
  return v13;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

@end

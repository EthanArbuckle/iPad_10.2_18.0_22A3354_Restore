@implementation HMBLocalSQLIteratorRowRollbackBlock

- (HMBLocalSQLIteratorRowRollbackBlock)initWithSQLContext:(id)a3 zoneRow:(unint64_t)a4
{
  id v6;
  void *v7;
  HMBLocalSQLIteratorRowRollbackBlock *v8;
  objc_super v10;

  v6 = a3;
  objc_msgSend(v6, "selectReadyRollbackBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HMBLocalSQLIteratorRowRollbackBlock;
  v8 = -[HMBLocalSQLIteratorRowBlock initWithSQLContext:zoneRow:statement:isAscending:](&v10, sel_initWithSQLContext_zoneRow_statement_isAscending_, v6, a4, v7, 0);

  return v8;
}

@end

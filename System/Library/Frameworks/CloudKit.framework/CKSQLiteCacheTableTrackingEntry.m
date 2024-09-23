@implementation CKSQLiteCacheTableTrackingEntry

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)entryCount
{
  return self->_entryCount;
}

- (void)setEntryCount:(id)a3
{
  objc_storeStrong((id *)&self->_entryCount, a3);
}

- (NSNumber)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(id)a3
{
  objc_storeStrong((id *)&self->_dataSize, a3);
}

- (NSDate)oldestExpireDate
{
  return self->_oldestExpireDate;
}

- (void)setOldestExpireDate:(id)a3
{
  objc_storeStrong((id *)&self->_oldestExpireDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestExpireDate, 0);
  objc_storeStrong((id *)&self->_dataSize, 0);
  objc_storeStrong((id *)&self->_entryCount, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end

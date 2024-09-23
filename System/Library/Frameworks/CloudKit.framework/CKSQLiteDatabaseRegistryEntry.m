@implementation CKSQLiteDatabaseRegistryEntry

- (NSNumber)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(id)a3
{
  objc_storeStrong((id *)&self->_databaseID, a3);
}

- (NSData)uniquingKey
{
  return self->_uniquingKey;
}

- (void)setUniquingKey:(id)a3
{
  objc_storeStrong((id *)&self->_uniquingKey, a3);
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (void)setDatabaseDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_databaseDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
  objc_storeStrong((id *)&self->_uniquingKey, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
}

@end

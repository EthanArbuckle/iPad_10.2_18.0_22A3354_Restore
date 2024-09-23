@implementation CKSQLiteTOCTableEntry

- (NSNumber)tableID
{
  return self->_tableID;
}

- (void)setTableID:(id)a3
{
  objc_storeStrong((id *)&self->_tableID, a3);
}

- (NSString)logicalTableName
{
  return self->_logicalTableName;
}

- (void)setLogicalTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dbTableName
{
  return self->_dbTableName;
}

- (void)setDbTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)dbVersion
{
  return self->_dbVersion;
}

- (void)setDbVersion:(id)a3
{
  objc_storeStrong((id *)&self->_dbVersion, a3);
}

- (NSString)creatingClass
{
  return self->_creatingClass;
}

- (void)setCreatingClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)propertyData
{
  return self->_propertyData;
}

- (void)setPropertyData:(id)a3
{
  objc_storeStrong((id *)&self->_propertyData, a3);
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_storeStrong((id *)&self->_creator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_propertyData, 0);
  objc_storeStrong((id *)&self->_creatingClass, 0);
  objc_storeStrong((id *)&self->_dbVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_dbTableName, 0);
  objc_storeStrong((id *)&self->_logicalTableName, 0);
  objc_storeStrong((id *)&self->_tableID, 0);
}

@end

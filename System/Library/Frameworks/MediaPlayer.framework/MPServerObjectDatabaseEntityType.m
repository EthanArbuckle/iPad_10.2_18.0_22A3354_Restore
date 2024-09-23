@implementation MPServerObjectDatabaseEntityType

- (NSString)serverEntityType
{
  return self->_serverEntityType;
}

- (NSString)genericObjectRelationshipKey
{
  return self->_genericObjectRelationshipKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericObjectRelationshipKey, 0);
  objc_storeStrong((id *)&self->_serverEntityType, 0);
}

+ (id)entityTypeWithServerEntityType:(id)a3 genericObjectRelationshipKey:(id)a4
{
  id v5;
  id v6;
  MPServerObjectDatabaseEntityType *v7;
  uint64_t v8;
  NSString *serverEntityType;
  uint64_t v10;
  NSString *genericObjectRelationshipKey;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MPServerObjectDatabaseEntityType);
  v8 = objc_msgSend(v6, "copy");

  serverEntityType = v7->_serverEntityType;
  v7->_serverEntityType = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  genericObjectRelationshipKey = v7->_genericObjectRelationshipKey;
  v7->_genericObjectRelationshipKey = (NSString *)v10;

  return v7;
}

@end

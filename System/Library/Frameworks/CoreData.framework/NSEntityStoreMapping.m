@implementation NSEntityStoreMapping

- (NSEntityStoreMapping)initWithEntity:(id)a3
{
  NSStoreMappingGenerator *v5;
  void *v6;
  uint64_t v7;
  NSEntityStoreMapping *v8;
  NSEntityStoreMapping *v9;
  NSDictionary *propertyMappings;
  NSString *subentityColumn;
  objc_super v13;

  v5 = +[NSStoreMappingGenerator defaultMappingGenerator]();
  v6 = (void *)objc_msgSend(a3, "name");
  if (v5)
    v7 = objc_msgSend(v6, "uppercaseString");
  else
    v7 = 0;
  v13.receiver = self;
  v13.super_class = (Class)NSEntityStoreMapping;
  v8 = -[NSStoreMapping initWithExternalName:](&v13, sel_initWithExternalName_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_entity = (NSEntityDescription *)a3;
    propertyMappings = v8->_propertyMappings;
    if (propertyMappings)
    {

      v9->_propertyMappings = (NSDictionary *)objc_msgSend(0, "copy");
    }
    -[NSEntityStoreMapping setPrimaryKeys:]((uint64_t)v9, 0);
    v9->_isSingleTableEntity = 1;
    subentityColumn = v9->_subentityColumn;
    if (subentityColumn)
    {

      v9->_subentityColumn = (NSString *)objc_msgSend(0, "copy");
    }
    v9->_subentityID = 0;
  }
  return v9;
}

- (uint64_t)setPropertyMappings:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 24);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 24) = result;
    }
  }
  return result;
}

- (void)setPrimaryKeys:(uint64_t)a1
{
  uint64_t v3;

  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      v3 = objc_msgSend(a2, "copy");

      *(_QWORD *)(a1 + 32) = v3;
    }
  }
}

- (void)dealloc
{
  NSString *subentityColumn;
  objc_super v4;

  if (self)
  {
    self->_entity = 0;
    -[NSEntityStoreMapping setPropertyMappings:]((uint64_t)self, 0);
    -[NSEntityStoreMapping setPrimaryKeys:]((uint64_t)self, 0);
    subentityColumn = self->_subentityColumn;
    if (subentityColumn)
    {

      self->_subentityColumn = (NSString *)objc_msgSend(0, "copy");
    }
  }
  else
  {
    -[NSEntityStoreMapping setPropertyMappings:](0, 0);
    -[NSEntityStoreMapping setPrimaryKeys:](0, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSEntityStoreMapping;
  -[NSStoreMapping dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSEntityStoreMapping;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -> %@"), -[NSEntityStoreMapping description](&v3, sel_description), -[NSEntityDescription name](self->_entity, "name"));
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  unsigned int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSEntityStoreMapping;
  v5 = -[NSStoreMapping isEqual:](&v13, sel_isEqual_);
  if (v5)
  {
    v6 = -[NSEntityStoreMapping entity](self, "entity");
    if (v6 == (id)objc_msgSend(a3, "entity")
      || (v5 = objc_msgSend(-[NSEntityStoreMapping entity](self, "entity"), "isEqual:", objc_msgSend(a3, "entity"))) != 0)
    {
      v7 = -[NSEntityStoreMapping propertyMappings](self, "propertyMappings");
      if (v7 == (id)objc_msgSend(a3, "propertyMappings")
        || (v5 = objc_msgSend(-[NSEntityStoreMapping propertyMappings](self, "propertyMappings"), "isEqual:", objc_msgSend(a3, "propertyMappings"))) != 0)
      {
        v8 = -[NSEntityStoreMapping primaryKeys](self, "primaryKeys");
        if (v8 == (id)objc_msgSend(a3, "primaryKeys")
          || (v5 = objc_msgSend(-[NSEntityStoreMapping primaryKeys](self, "primaryKeys"), "isEqual:", objc_msgSend(a3, "primaryKeys"))) != 0)
        {
          v9 = -[NSEntityStoreMapping isSingleTableEntity](self, "isSingleTableEntity");
          if (v9 == objc_msgSend(a3, "isSingleTableEntity"))
          {
            v10 = -[NSEntityStoreMapping subentityColumn](self, "subentityColumn");
            if (v10 == (id)objc_msgSend(a3, "subentityColumn")
              || (v5 = objc_msgSend(-[NSEntityStoreMapping subentityColumn](self, "subentityColumn"), "isEqual:", objc_msgSend(a3, "subentityColumn"))) != 0)
            {
              v11 = -[NSEntityStoreMapping subentityID](self, "subentityID");
              LOBYTE(v5) = v11 == objc_msgSend(a3, "subentityID");
            }
          }
          else
          {
            LOBYTE(v5) = 0;
          }
        }
      }
    }
  }
  return v5;
}

- (id)entity
{
  return self->_entity;
}

- (id)propertyMappings
{
  return self->_propertyMappings;
}

- (id)primaryKeys
{
  return self->_primaryKeys;
}

- (BOOL)isSingleTableEntity
{
  return self->_isSingleTableEntity;
}

- (id)subentityColumn
{
  return self->_subentityColumn;
}

- (unsigned)subentityID
{
  return self->_subentityID;
}

@end

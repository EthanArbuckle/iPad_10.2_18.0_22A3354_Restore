@implementation NSSQLForeignEntityKey

- (id)name
{
  return self->_name;
}

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  NSSQLForeignEntityKey *v6;
  NSSQLForeignEntityKey *v7;
  __CFString *columnName;
  id v9;
  uint64_t v10;
  NSNumber *v11;
  NSNumber *columnValue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NSSQLForeignEntityKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v14, sel_initWithEntity_propertyDescription_, a3, 0);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 4;
    v6->_foreignKey = (NSSQLForeignKey *)objc_msgSend(a4, "foreignKey");
    columnName = (__CFString *)v7->super._columnName;
    if (columnName != CFSTR("Z_ENT"))
    {

      v7->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_ENT"), "copy");
    }
    v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
    if (a3)
      v10 = *((unsigned int *)a3 + 46);
    else
      v10 = 0;
    v11 = (NSNumber *)objc_msgSend(v9, "initWithUnsignedInt:", v10);
    columnValue = v7->_columnValue;
    if (columnValue != v11)
    {

      v7->_columnValue = (NSNumber *)-[NSNumber copy](v11, "copy");
    }

    v7->super.super._sqlType = 1;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_foreignKey = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLForeignEntityKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (NSSQLForeignEntityKey)initWithEntity:(id)a3 foreignKey:(id)a4
{
  NSSQLForeignEntityKey *v6;
  NSSQLForeignEntityKey *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *columnName;
  void *v16;
  NSString *v17;
  NSString *name;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NSSQLForeignEntityKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v20, sel_initWithEntity_propertyDescription_, a3, 0);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 4;
    v6->_foreignKey = (NSSQLForeignKey *)a4;
    v8 = -[NSSQLForeignEntityKey toOneRelationship](v6, "toOneRelationship");
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = objc_msgSend(v8, "destinationEntity");
    if (v10)
      v11 = *(unsigned int *)(v10 + 184);
    else
      v11 = 0;
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@%d_%@"), CFSTR("Z"), v11, objc_msgSend((id)objc_msgSend(v8, "name"), "uppercaseString"));
    if (a3)
      v13 = *((_QWORD *)a3 + 22);
    else
      v13 = 0;
    v14 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v13, v12);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v14)
    {
      v16 = (void *)v14;

      v7->super._columnName = (NSString *)objc_msgSend(v16, "copy");
    }

    v17 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_%@"), v7->super._columnName);
    name = v7->_name;
    if (name != v17)
    {

      v7->_name = (NSString *)-[NSString copy](v17, "copy");
    }

    v7->super.super._sqlType = 1;
  }
  return v7;
}

- (id)toOneRelationship
{
  return (id)objc_msgSend(-[NSSQLForeignEntityKey foreignKey](self, "foreignKey"), "toOneRelationship");
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (NSSQLForeignEntityKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(a4, "name");
  if (a3)
    v7 = (void *)objc_msgSend(*((id *)a3 + 5), "objectForKey:", v6);
  else
    v7 = 0;
  return -[NSSQLForeignEntityKey initWithEntity:foreignKey:](self, "initWithEntity:foreignKey:", a3, objc_msgSend(v7, "foreignKey"));
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignEntityKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

@end

@implementation NSSQLForeignOrderKey

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  NSSQLForeignOrderKey *v5;
  NSSQLForeignOrderKey *v6;
  __CFString *columnName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLForeignOrderKey;
  v5 = -[NSSQLColumn initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_, a3, 0);
  v6 = v5;
  if (v5)
  {
    v5->super.super._propertyType = 10;
    v5->_foreignKey = (NSSQLForeignKey *)objc_msgSend(a4, "foreignKey");
    columnName = (__CFString *)v6->super._columnName;
    if (columnName != CFSTR("Z_ENT"))
    {

      v6->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_ENT"), "copy");
    }
    v6->super.super._sqlType = 1;
  }
  return v6;
}

- (id)name
{
  return self->_name;
}

- (void)dealloc
{
  objc_super v3;

  self->_foreignKey = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLForeignOrderKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignOrderKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

- (NSSQLForeignOrderKey)initWithEntity:(id)a3 foreignKey:(id)a4
{
  NSSQLForeignOrderKey *v6;
  NSSQLForeignOrderKey *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString *columnName;
  void *v13;
  NSString *v14;
  NSString *name;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NSSQLForeignOrderKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v17, sel_initWithEntity_propertyDescription_, a3, 0);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 10;
    v6->_foreignKey = (NSSQLForeignKey *)a4;
    v8 = -[NSSQLForeignOrderKey toOneRelationship](v6, "toOneRelationship");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), CFSTR("Z_FOK"), objc_msgSend((id)objc_msgSend(v8, "name"), "uppercaseString"));
    if (a3)
      v10 = *((_QWORD *)a3 + 22);
    else
      v10 = 0;
    v11 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v10, v9);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v11)
    {
      v13 = (void *)v11;

      v7->super._columnName = (NSString *)objc_msgSend(v13, "copy");
    }

    v14 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_%@"), v7->super._columnName);
    name = v7->_name;
    if (name != v14)
    {

      v7->_name = (NSString *)-[NSString copy](v14, "copy");
    }

    v7->super.super._sqlType = 1;
  }
  return v7;
}

- (id)toOneRelationship
{
  return (id)objc_msgSend(-[NSSQLForeignOrderKey foreignKey](self, "foreignKey"), "toOneRelationship");
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (NSSQLForeignOrderKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(a4, "name");
  if (a3)
    v7 = (void *)objc_msgSend(*((id *)a3 + 5), "objectForKey:", v6);
  else
    v7 = 0;
  return -[NSSQLForeignOrderKey initWithEntity:foreignKey:](self, "initWithEntity:foreignKey:", a3, objc_msgSend(v7, "foreignKey"));
}

@end

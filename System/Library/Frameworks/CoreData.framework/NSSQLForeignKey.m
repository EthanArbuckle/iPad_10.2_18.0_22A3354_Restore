@implementation NSSQLForeignKey

- (id)toOneRelationship
{
  return self->_toOne;
}

- (id)name
{
  return self->_name;
}

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  NSSQLForeignKey *v5;
  NSSQLForeignKey *v6;
  __CFString *columnName;
  __CFString *name;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLForeignKey;
  v5 = -[NSSQLColumn initWithEntity:propertyDescription:](&v10, sel_initWithEntity_propertyDescription_, a3, 0);
  v6 = v5;
  if (v5)
  {
    v5->super.super._propertyType = 3;
    v5->_toOne = (NSSQLToOne *)a4;
    columnName = (__CFString *)v5->super._columnName;
    if (columnName != CFSTR("Z_PK"))
    {

      v6->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_PK"), "copy");
    }
    name = (__CFString *)v6->_name;
    if (name != CFSTR("_pk"))
    {

      v6->_name = (NSString *)objc_msgSend(CFSTR("_pk"), "copy");
    }
    v6->super.super._sqlType = 2;
  }
  return v6;
}

- (NSSQLForeignKey)initWithEntity:(id)a3 toOneRelationship:(id)a4
{
  NSSQLForeignKey *v6;
  NSSQLForeignKey *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *columnName;
  void *v12;
  NSString *v13;
  NSString *name;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NSSQLForeignKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v16, sel_initWithEntity_propertyDescription_, a3, 0);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 3;
    v6->_toOne = (NSSQLToOne *)a4;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("Z"), objc_msgSend((id)objc_msgSend(a4, "name"), "uppercaseString"));
    if (a3)
      v9 = *((_QWORD *)a3 + 22);
    else
      v9 = 0;
    v10 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v9, v8);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v10)
    {
      v12 = (void *)v10;

      v7->super._columnName = (NSString *)objc_msgSend(v12, "copy");
    }

    v13 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_%@"), v7->super._columnName);
    name = v7->_name;
    if (name != v13)
    {

      v7->_name = (NSString *)-[NSString copy](v13, "copy");
    }

    v7->super.super._sqlType = 2;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_toOne = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLForeignKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_toOne = (NSSQLToOne *)objc_msgSend(a3, "toOneRelationship");
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

- (NSSQLForeignKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend(a4, "name");
  if (a3)
    v7 = objc_msgSend(*((id *)a3 + 5), "objectForKey:", v6);
  else
    v7 = 0;
  return -[NSSQLForeignKey initWithEntity:toOneRelationship:](self, "initWithEntity:toOneRelationship:", a3, v7);
}

@end

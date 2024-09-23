@implementation NSSQLRelationship

- (id)name
{
  return self->_name;
}

- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLRelationship *v6;
  NSSQLRelationship *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSQLRelationship;
  v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6->_destinationEntity = (NSSQLEntity *)a3;
    v8 = objc_msgSend(a4, "name");
    name = v7->_name;
    if (name != (NSString *)v8)
    {
      v10 = (void *)v8;

      v7->_name = (NSString *)objc_msgSend(v10, "copy");
    }
  }
  return v7;
}

- (NSSQLRelationship)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLRelationship *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSQLRelationship;
  v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a4, "destinationEntity");
    if (v7)
      v6->_destinationEntity = (NSSQLEntity *)objc_msgSend((id)objc_msgSend(a3, "model"), "entityNamed:", objc_msgSend(v7, "name"));
    v8 = objc_msgSend(a4, "name");
    name = v6->_name;
    if (name != (NSString *)v8)
    {
      v10 = (void *)v8;

      v6->_name = (NSString *)objc_msgSend(v10, "copy");
    }
  }
  return v6;
}

- (void)_setInverseRelationship:(_QWORD *)a1
{
  _QWORD *v3;
  BOOL v4;
  uint64_t v6;
  void *v7;
  NSSQLForeignOrderKey *v8;

  if (a1)
  {
    v3 = (_QWORD *)a1[7];
    v4 = v3 != a2 || v3 == 0;
    if (v4 || v3 != a1)
    {
      a1[7] = a2;
      if (!a1[6])
        a1[6] = objc_msgSend(a2, "sourceEntity");
      v6 = objc_msgSend(a1, "foreignKey");
      v7 = (void *)a1[7];
      if (v7)
        v7 = (void *)objc_msgSend(v7, "propertyDescription");
      if (objc_msgSend(v7, "_isOrdered"))
      {
        if (v6)
        {
          v8 = -[NSSQLForeignOrderKey initWithEntity:foreignKey:]([NSSQLForeignOrderKey alloc], "initWithEntity:foreignKey:", objc_msgSend(a1, "entity"), v6);
          objc_msgSend(a1, "_setForeignOrderKey:", v8);

        }
      }
    }
  }
}

- (id)foreignKey
{
  return 0;
}

- (id)destinationEntity
{
  return self->_destinationEntity;
}

- (void)dealloc
{
  objc_super v3;

  self->_destinationEntity = 0;
  self->_inverse = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLRelationship;
  -[NSSQLProperty dealloc](&v3, sel_dealloc);
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLRelationship;
  -[NSSQLProperty copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
  self->_destinationEntity = (NSSQLEntity *)objc_msgSend(a3, "destinationEntity");
}

- (id)correlationTableName
{
  return 0;
}

@end

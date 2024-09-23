@implementation NSSQLToOne

- (unsigned)slot
{
  return self->super.super._slot;
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (_QWORD)initWithEntity:(uint64_t)a3 propertyDescription:(void *)a4 virtualForToMany:
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  __int16 v16;
  NSSQLForeignKey *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  if (!a1)
    return 0;
  v21.receiver = a1;
  v21.super_class = (Class)NSSQLToOne;
  v6 = objc_msgSendSuper2(&v21, sel_initWithEntity_propertyDescription_, a2, a3);
  if (v6)
  {
    if (a4)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = objc_msgSend(a4, "sourceEntity");
      if (v8)
        v9 = *(unsigned int *)(v8 + 184);
      else
        v9 = 0;
      v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%d%@"), v9, objc_msgSend(a4, "name"));
      v11 = (void *)v6[5];
      if (v11 != v10)
      {

        v6[5] = objc_msgSend(v10, "copy");
      }

      *((_BYTE *)v6 + 88) = 1;
    }
    if (*((_BYTE *)v6 + 88))
    {
      v12 = -1;
    }
    else
    {
      if (a2 && (v13 = *(_QWORD *)(a2 + 24)) != 0)
        v14 = *(void **)(v13 + 104);
      else
        v14 = 0;
      v15 = objc_msgSend(v14, "fastIndexForKnownKey:", objc_msgSend(v6, "name"));
      if (a2)
        v16 = *(_WORD *)(a2 + 192);
      else
        v16 = 0;
      v12 = v15 - v16;
    }
    *((_WORD *)v6 + 14) = v12;
    *((_BYTE *)v6 + 24) = 7;
    v17 = -[NSSQLForeignKey initWithEntity:toOneRelationship:]([NSSQLForeignKey alloc], "initWithEntity:toOneRelationship:", a2, v6);
    v6[8] = v17;
    v18 = objc_msgSend(v6, "destinationEntity");
    if (v18)
    {
      v19 = *(void **)(v18 + 152);
      if (v19)
      {
        if (objc_msgSend(v19, "count"))
          v6[9] = -[NSSQLForeignEntityKey initWithEntity:foreignKey:]([NSSQLForeignEntityKey alloc], "initWithEntity:foreignKey:", a2, v17);
      }
    }
  }
  return v6;
}

- (NSSQLToOne)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:](self, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4
{
  _BYTE *v6;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLToOne;
  v6 = -[NSSQLRelationship initForReadOnlyFetchWithEntity:propertyDescription:](&v10, sel_initForReadOnlyFetchWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6[24] = 7;
    v8 = -[NSSQLForeignKey initForReadOnlyFetchingOfEntity:toOneRelationship:]([NSSQLForeignKey alloc], "initForReadOnlyFetchingOfEntity:toOneRelationship:", a3, v6);
    if (objc_msgSend(a4, "_propertyType") == 4 && v8)
      v8[1] = a4;
    v7[8] = v8;
    v7[9] = -[NSSQLForeignEntityKey initForReadOnlyFetchingOfEntity:toOneRelationship:]([NSSQLForeignEntityKey alloc], "initForReadOnlyFetchingOfEntity:toOneRelationship:", a3, v7);
    v7[10] = -[NSSQLForeignOrderKey initForReadOnlyFetchingOfEntity:toOneRelationship:]([NSSQLForeignOrderKey alloc], "initForReadOnlyFetchingOfEntity:toOneRelationship:", a3, v7);
  }
  return v7;
}

- (void)_setForeignOrderKey:(id)a3
{
  NSSQLForeignOrderKey *foreignOrderKey;

  foreignOrderKey = self->_foreignOrderKey;
  if (foreignOrderKey != a3)
  {

    self->_foreignOrderKey = (NSSQLForeignOrderKey *)a3;
  }
}

- (id)columnName
{
  return (id)objc_msgSend(-[NSSQLToOne foreignKey](self, "foreignKey"), "columnName");
}

- (NSSQLToOne)initWithEntity:(id)a3 inverseToMany:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:](self, (uint64_t)a3, 0, a4);
}

- (void)dealloc
{
  objc_super v3;

  self->_foreignKey = 0;
  self->_foreignEntityKey = 0;

  self->_foreignOrderKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLToOne;
  -[NSSQLRelationship dealloc](&v3, sel_dealloc);
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  NSSQLForeignKey *v5;
  NSSQLForeignKey *foreignKey;
  NSPropertyDescription *v7;
  NSSQLForeignEntityKey *v8;
  NSSQLForeignOrderKey *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLToOne;
  -[NSSQLRelationship copyValuesForReadOnlyFetch:](&v10, sel_copyValuesForReadOnlyFetch_);
  v5 = objc_alloc_init(NSSQLForeignKey);
  self->_foreignKey = v5;
  -[NSSQLForeignKey copyValuesForReadOnlyFetch:](v5, "copyValuesForReadOnlyFetch:", objc_msgSend(a3, "foreignKey"));
  foreignKey = self->_foreignKey;
  v7 = -[NSSQLProperty propertyDescription](self, "propertyDescription");
  if (foreignKey)
    foreignKey->super.super._propertyDescription = v7;
  if (a3)
  {
    if (*((_QWORD *)a3 + 9))
    {
      v8 = objc_alloc_init(NSSQLForeignEntityKey);
      self->_foreignEntityKey = v8;
      -[NSSQLForeignEntityKey copyValuesForReadOnlyFetch:](v8, "copyValuesForReadOnlyFetch:", *((_QWORD *)a3 + 9));
    }
    if (*((_QWORD *)a3 + 10))
    {
      v9 = objc_alloc_init(NSSQLForeignOrderKey);
      self->_foreignOrderKey = v9;
      -[NSSQLForeignOrderKey copyValuesForReadOnlyFetch:](v9, "copyValuesForReadOnlyFetch:", *((_QWORD *)a3 + 10));
    }
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@)>"), NSStringFromClass(v4), -[NSSQLRelationship name](self, "name"), objc_msgSend(-[NSSQLRelationship destinationEntity](self, "destinationEntity"), "name"));
}

@end

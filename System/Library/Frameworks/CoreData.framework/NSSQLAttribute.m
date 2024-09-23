@implementation NSSQLAttribute

- (NSSQLAttribute)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLAttribute *v6;
  NSSQLAttribute *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSQLAttribute;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 1;
    v6->super.super._sqlType = -[NSSQLAttribute _sqlTypeForAttributeType:flags:](objc_msgSend(a4, "attributeType"), objc_msgSend(a4, "storesBinaryDataExternally"));
    if (a4 && objc_msgSend(a4, "superCompositeAttribute"))
    {
      *(_WORD *)&v7->super.super._flags |= 0x20u;
      if (a3)
      {
        v8 = *((_QWORD *)a3 + 3);
        if (v8)
          a3 = *(id *)(v8 + 104);
        else
          a3 = 0;
      }
      v10 = -[NSPropertyDescription _rootName]((__CFString *)a4);
    }
    else
    {
      if (a3)
      {
        v9 = *((_QWORD *)a3 + 3);
        if (v9)
          a3 = *(id *)(v9 + 104);
        else
          a3 = 0;
      }
      v10 = -[NSSQLProperty name](v7, "name");
    }
    v7->super.super._slot = objc_msgSend(a3, "fastIndexForKnownKey:", v10);
    *(_WORD *)&v7->super.super._flags = *(_WORD *)&v7->super.super._flags & 0xFFE7 | (16
                                                                                    * (objc_msgSend(a4, "_propertyType") == 6));
  }
  return v7;
}

- (uint64_t)_sqlTypeForAttributeType:(uint64_t)a1 flags:(uint64_t)a2
{
  uint64_t result;

  result = 1;
  if (a1 <= 599)
  {
    if (a1 > 299)
    {
      switch(a1)
      {
        case 300:
          return 2;
        case 400:
          return 4;
        case 500:
          return 7;
      }
    }
    else if (a1 && (a1 == 100 || a1 == 200))
    {
      return result;
    }
    return 6;
  }
  if (a1 <= 999)
  {
    if (a1 != 600)
    {
      if (a1 != 800)
      {
        if (a1 == 900)
          return 8;
        return 6;
      }
      return result;
    }
    return 7;
  }
  if (a1 > 1199)
  {
    if (a1 != 1200)
    {
      if (a1 == 1800)
        return 15;
      return 6;
    }
    return 12;
  }
  else
  {
    if (a1 != 1000)
    {
      if (a1 == 1100)
        return 11;
      return 6;
    }
    if (a2)
      return 16;
    else
      return 10;
  }
}

- (id)initForReadOnlyFetchWithExpression:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLAttribute;
  v4 = -[NSSQLColumn initForReadOnlyFetching](&v7, sel_initForReadOnlyFetching);
  v5 = v4;
  if (v4)
  {
    v4[24] = 1;
    v4[25] = -[NSSQLAttribute _sqlTypeForAttributeType:flags:](objc_msgSend(a3, "expressionResultType"), 0);
    *((_QWORD *)v5 + 1) = a3;
    *((_WORD *)v5 + 16) &= 0xFFF6u;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSSQLAttribute;
  -[NSSQLColumn dealloc](&v2, sel_dealloc);
}

- (void)addKeyForTriggerOnRelationship:(id)object
{
  void *v4;
  id AssociatedObject;

  if (object)
  {
    if ((*((_WORD *)object + 16) & 8) != 0)
    {
      AssociatedObject = objc_getAssociatedObject(object, &NSSQLAttributeTriggerAssociationKey);
      if (AssociatedObject)
        v4 = AssociatedObject;
      else
        v4 = (void *)NSSet_EmptySet;
    }
    else
    {
      v4 = (void *)NSSet_EmptySet;
    }
    objc_setAssociatedObject(object, &NSSQLAttributeTriggerAssociationKey, (id)objc_msgSend(v4, "setByAddingObject:", objc_msgSend(a2, "name")), (void *)0x301);
  }
}

- (BOOL)isFileBackedFuture
{
  return objc_msgSend(-[NSSQLProperty propertyDescription](self, "propertyDescription"), "isFileBackedFuture");
}

@end

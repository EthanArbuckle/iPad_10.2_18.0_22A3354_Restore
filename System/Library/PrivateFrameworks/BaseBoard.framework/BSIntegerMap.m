@implementation BSIntegerMap

- (void).cxx_destruct
{
  objc_storeStrong(&self->_zeroIndexValue, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

- (id)objectForKey:(int64_t)a3
{
  return BSIntegerMapObjectForKey(self, a3);
}

- (void)enumerateWithBlock:(id)a3
{
  BSIntegerMapEnumerateWithBlock(self, a3);
}

- (BSIntegerMap)initWithCapacity:(unint64_t)a3
{
  void *v4;
  BSIntegerMap *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, a3);
  v5 = (BSIntegerMap *)-[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&self->super.isa, v4, 0);

  return v5;
}

- (BSIntegerMap)init
{
  return -[BSIntegerMap initWithCapacity:](self, "initWithCapacity:", 8);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BSMutableIntegerMap *v5;
  void *v6;
  id *v7;

  v5 = +[BSMutableIntegerMap allocWithZone:](BSMutableIntegerMap, "allocWithZone:");
  v6 = (void *)-[NSMapTable copyWithZone:](self->_mapTable, "copyWithZone:", a3);
  v7 = -[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&v5->super.super.isa, v6, self->_zeroIndexValue);

  return v7;
}

- (id)_initWithMapTable:(void *)a3 zeroIndexValue:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BSIntegerMap;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  BSIntegerMap *v4;
  BSIntegerMap *v5;
  id zeroIndexValue;
  id v7;
  char v8;

  v4 = (BSIntegerMap *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSMapTable isEqual:](self->_mapTable, "isEqual:", v5->_mapTable))
      {
        zeroIndexValue = self->_zeroIndexValue;
        v7 = v5->_zeroIndexValue;
        if (zeroIndexValue == v7)
        {
          v8 = 1;
        }
        else
        {
          v8 = 0;
          if (zeroIndexValue && v7)
            v8 = objc_msgSend(zeroIndexValue, "isEqual:");
        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)enumerateKeysWithBlock:(id)a3
{
  BSIntegerMapEnumerateKeysWithBlock(self, a3);
}

- (BOOL)containsObjectForKey:(int64_t)a3
{
  return BSIntegerMapContainsObjectForKey(self, a3);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMapTable hash](self->_mapTable, "hash");
  return objc_msgSend(self->_zeroIndexValue, "hash") + v3;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

@end

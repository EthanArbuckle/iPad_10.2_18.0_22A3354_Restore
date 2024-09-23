@implementation CalDefaultDictionary

- (CalDefaultDictionary)initWithDefaultClass:(Class)a3
{
  CalDefaultDictionary *v4;
  CalDefaultDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalDefaultDictionary;
  v4 = -[CalDefaultDictionary init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_defaultClass = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v5->_dict;
    v5->_dict = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CalDefaultDictionary _copyWithZone:isDeepCopy:](self, "_copyWithZone:isDeepCopy:", a3, 0);
}

- (id)deepCopy
{
  return -[CalDefaultDictionary _copyWithZone:isDeepCopy:](self, "_copyWithZone:isDeepCopy:", 0, 1);
}

- (id)_copyWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4
{
  _BOOL8 v4;
  CalDefaultDictionary *v7;
  id v8;

  v4 = a4;
  v7 = -[CalDefaultDictionary initWithDefaultClass:](+[CalDefaultDictionary allocWithZone:](CalDefaultDictionary, "allocWithZone:"), "initWithDefaultClass:", self->_defaultClass);
  v8 = -[CalDefaultDictionary _mutableCopyOfFinalDictionaryWithZone:isDeepCopy:](self, "_mutableCopyOfFinalDictionaryWithZone:isDeepCopy:", a3, v4);
  -[CalDefaultDictionary setDictionary:](v7, "setDictionary:", v8);

  return v7;
}

- (id)_mutableCopyOfFinalDictionaryWithZone:(_NSZone *)a3 isDeepCopy:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a4)
  {
    -[CalDefaultDictionary finalDictionary](self, "finalDictionary", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "CalMutableRecursiveCopy");
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a3);
    -[CalDefaultDictionary finalDictionary](self, "finalDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithDictionary:", v5);
  }
  v8 = (void *)v6;

  return v8;
}

- (id)existingObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(self->_defaultClass);
    -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_dict, "removeAllObjects");
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", a3);
}

- (id)keys
{
  return (id)-[NSMutableDictionary allKeys](self->_dict, "allKeys");
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_dict, "count");
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dict, a3);
}

- (id)finalDictionary
{
  return self->_dict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end

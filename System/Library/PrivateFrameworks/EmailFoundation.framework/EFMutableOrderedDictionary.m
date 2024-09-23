@implementation EFMutableOrderedDictionary

- (EFMutableOrderedDictionary)init
{
  id v3;
  id v4;
  EFMutableOrderedDictionary *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7.receiver = self;
  v7.super_class = (Class)EFMutableOrderedDictionary;
  v5 = -[EFOrderedDictionary _initWithOrderedKeys:objectsByKey:](&v7, sel__initWithOrderedKeys_objectsByKey_, v3, v4);

  return v5;
}

- (EFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  void *v5;
  void *v6;
  EFMutableOrderedDictionary *v7;
  objc_super v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  v9.receiver = self;
  v9.super_class = (Class)EFMutableOrderedDictionary;
  v7 = -[EFOrderedDictionary _initWithOrderedKeys:objectsByKey:](&v9, sel__initWithOrderedKeys_objectsByKey_, v5, v6);

  return v7;
}

- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v11.receiver = self;
  v11.super_class = (Class)EFMutableOrderedDictionary;
  v9 = -[EFOrderedDictionary _initWithOrderedKeys:objectsByKey:](&v11, sel__initWithOrderedKeys_objectsByKey_, v7, v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EFOrderedDictionary *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = [EFOrderedDictionary alloc];
  v5 = (void *)-[NSOrderedSet copy](self->super._orderedKeys, "copy");
  v6 = (void *)-[NSDictionary copy](self->super._objectsByKey, "copy");
  v7 = -[EFOrderedDictionary _initWithOrderedKeys:objectsByKey:](v4, "_initWithOrderedKeys:objectsByKey:", v5, v6);

  return v7;
}

- (void)setOrAddObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[NSOrderedSet addObject:](self->super._orderedKeys, "addObject:", v6);
  -[NSDictionary setObject:forKeyedSubscript:](self->super._objectsByKey, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setOrInsertObject:(id)a3 forKey:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  -[NSOrderedSet insertObject:atIndex:](self->super._orderedKeys, "insertObject:atIndex:", v8, a5);
  -[NSDictionary setObject:forKeyedSubscript:](self->super._objectsByKey, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)moveObjectForKey:(id)a3 toIndex:(unint64_t)a4
{
  NSUInteger v5;
  id v6;

  v5 = -[NSOrderedSet indexOfObject:](self->super._orderedKeys, "indexOfObject:", a3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v5);
    -[NSOrderedSet moveObjectsAtIndexes:toIndex:](self->super._orderedKeys, "moveObjectsAtIndexes:toIndex:");

  }
}

- (void)replaceObject:(id)a3 atIndex:(unint64_t)a4
{
  NSDictionary *objectsByKey;
  void *v7;
  id v8;

  v8 = a3;
  if (-[NSOrderedSet count](self->super._orderedKeys, "count") > a4)
  {
    objectsByKey = self->super._objectsByKey;
    -[NSOrderedSet objectAtIndexedSubscript:](self->super._orderedKeys, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](objectsByKey, "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (void)replaceObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[NSOrderedSet containsObject:](self->super._orderedKeys, "containsObject:", v6))
    -[NSDictionary setObject:forKeyedSubscript:](self->super._objectsByKey, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSDictionary *objectsByKey;
  void *v6;

  if (-[NSOrderedSet count](self->super._orderedKeys, "count") > a3)
  {
    objectsByKey = self->super._objectsByKey;
    -[NSOrderedSet objectAtIndexedSubscript:](self->super._orderedKeys, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](objectsByKey, "setObject:forKeyedSubscript:", 0, v6);

    -[NSOrderedSet removeObjectAtIndex:](self->super._orderedKeys, "removeObjectAtIndex:", a3);
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[NSOrderedSet removeObject:](self->super._orderedKeys, "removeObject:");
  -[NSDictionary setObject:forKeyedSubscript:](self->super._objectsByKey, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)removeAllObjects
{
  -[NSOrderedSet removeAllObjects](self->super._orderedKeys, "removeAllObjects");
  -[NSDictionary removeAllObjects](self->super._objectsByKey, "removeAllObjects");
}

@end

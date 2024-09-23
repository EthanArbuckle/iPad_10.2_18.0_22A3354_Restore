@implementation NSMapTable

+ (NSMapTable)alloc
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_self();
  return (NSMapTable *)NSAllocateObject(v2, 0, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  NSDictionary *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(self);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = -[NSMapTable objectForKey:](self, "objectForKey:", v8);
        if (v9)
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v9, v8);
      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }
  return v3;
}

+ (id)mapTableWithWeakToStrongObjects
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 1, 0, 16);
}

+ (NSMapTable)weakToWeakObjectsMapTable
{
  return (NSMapTable *)-[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 5, 5, 16);
}

+ (NSMapTable)strongToWeakObjectsMapTable
{
  return (NSMapTable *)-[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 5, 16);
}

+ (NSMapTable)mapTableWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions
{
  return (NSMapTable *)-[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", keyOptions, valueOptions, 16);
}

+ (NSMapTable)weakToStrongObjectsMapTable
{
  return (NSMapTable *)-[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 5, 0, 16);
}

+ (NSMapTable)strongToStrongObjectsMapTable
{
  return (NSMapTable *)-[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, 16);
}

+ (NSMapTable)allocWithZone:(_NSZone *)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_self();
  return (NSMapTable *)NSAllocateObject(v3, 0, 0);
}

+ (id)mapTableWithStrongToStrongObjects
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, 16);
}

+ (id)mapTableWithStrongToWeakObjects
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 1, 16);
}

+ (id)mapTableWithWeakToWeakObjects
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]([NSConcreteMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 1, 1, 16);
}

- (NSMapTable)initWithCoder:(id)a3
{

  return (NSMapTable *)-[NSConcreteMapTable initWithCoder:]([NSConcreteMapTable alloc], "initWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSMapTable)initWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions capacity:(NSUInteger)initialCapacity
{
  raiseError_0((uint64_t)self, a2);
}

- (NSMapTable)initWithKeyPointerFunctions:(NSPointerFunctions *)keyFunctions valuePointerFunctions:(NSPointerFunctions *)valueFunctions capacity:(NSUInteger)initialCapacity
{
  raiseError_0((uint64_t)self, a2);
}

- (NSMapTable)init
{
  raiseError_0((uint64_t)self, a2);
}

- (id)description
{
  raiseError_0((uint64_t)self, a2);
}

- (void)encodeWithCoder:(id)a3
{
  raiseError_0((uint64_t)self, a2);
}

- (NSUInteger)count
{
  raiseError_0((uint64_t)self, a2);
}

- (unint64_t)__capacity
{
  raiseError_0((uint64_t)self, a2);
}

- (NSEnumerator)keyEnumerator
{
  raiseError_0((uint64_t)self, a2);
}

- (NSEnumerator)objectEnumerator
{
  raiseError_0((uint64_t)self, a2);
}

- (id)copy
{
  raiseError_0((uint64_t)self, a2);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  raiseError_0((uint64_t)self, a2);
}

- (NSPointerFunctions)keyPointerFunctions
{
  raiseError_0((uint64_t)self, a2);
}

- (NSPointerFunctions)valuePointerFunctions
{
  raiseError_0((uint64_t)self, a2);
}

- (id)objectForKey:(id)aKey
{
  raiseError_0((uint64_t)self, a2);
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
  raiseError_0((uint64_t)self, a2);
}

- (void)removeObjectForKey:(id)aKey
{
  raiseError_0((uint64_t)self, a2);
}

- (void)setItem:(const void *)a3 forKey:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (id)allKeys
{
  raiseError_0((uint64_t)self, a2);
}

- (id)allValues
{
  raiseError_0((uint64_t)self, a2);
}

- (void)removeAllItems
{
  raiseError_0((uint64_t)self, a2);
}

- (id)enumerator
{
  raiseError_0((uint64_t)self, a2);
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  raiseError_0((uint64_t)self, a2);
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  raiseError_0((uint64_t)self, a2);
}

- (id)mutableDictionary
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(self);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = -[NSMapTable objectForKey:](self, "objectForKey:", v8);
        if (v9)
          objc_msgSend(v3, "setObject:forKey:", v9, v8);
      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }
  return v3;
}

@end

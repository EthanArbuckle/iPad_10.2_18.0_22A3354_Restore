@implementation ACTrackedSet

- (ACTrackedSet)initWithSet:(id)a3
{
  id v5;
  ACTrackedSet *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("set"));

  }
  v6 = -[ACTrackedSet _initWithEnumerable:count:](self, "_initWithEnumerable:count:", v5, objc_msgSend(v5, "count"));

  return v6;
}

- (id)_initWithEnumerable:(id)a3 count:(unint64_t)a4
{
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  ACTrackedSet *v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerable"));

  }
  if (a4 >> 61 || (v8 = malloc_type_malloc(8 * a4, 0x3BDAE5C7uLL)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing set buffer"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v9 = v8;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v9[v13 + i] = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v13 += i;
    }
    while (v12);
  }

  v16 = -[ACTrackedSet initWithObjects:count:](self, "initWithObjects:count:", v9, a4);
  free(v9);

  return v16;
}

- (ACTrackedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  ACTrackedSet *v6;
  uint64_t v7;
  NSMutableSet *underlyingSet;
  NSMutableDictionary *v9;
  NSMutableDictionary *changesDictionary;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ACTrackedSet;
  v6 = -[ACTrackedSet init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", a3, a4);
    underlyingSet = v6->_underlyingSet;
    v6->_underlyingSet = (NSMutableSet *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    changesDictionary = v6->_changesDictionary;
    v6->_changesDictionary = v9;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesDictionary, 0);
  objc_storeStrong((id *)&self->_underlyingSet, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)set
{
  return objc_alloc_init((Class)a1);
}

+ (ACTrackedSet)setWithSet:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSet:", v4);

  return (ACTrackedSet *)v5;
}

+ (ACTrackedSet)setWithArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:", v4);

  return (ACTrackedSet *)v5;
}

- (ACTrackedSet)init
{
  return -[ACTrackedSet initWithObjects:count:](self, "initWithObjects:count:", 0, 0);
}

- (ACTrackedSet)initWithCoder:(id)a3
{
  id v5;
  ACTrackedSet *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableSet *underlyingSet;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *changesDictionary;
  void *v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder"));

  }
  v18.receiver = self;
  v18.super_class = (Class)ACTrackedSet;
  v6 = -[ACTrackedSet init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "allowedClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("_underlyingSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    underlyingSet = v6->_underlyingSet;
    v6->_underlyingSet = (NSMutableSet *)v11;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("_changesDictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    changesDictionary = v6->_changesDictionary;
    v6->_changesDictionary = (NSMutableDictionary *)v14;

  }
  return v6;
}

- (id)_initWithUnderlyingSet:(id)a3 changesDictionary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ACTrackedSet *v10;
  uint64_t v11;
  NSMutableSet *underlyingSet;
  uint64_t v13;
  NSMutableDictionary *changesDictionary;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingSet"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changesDictionary"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ACTrackedSet;
  v10 = -[ACTrackedSet init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "mutableCopy");
    underlyingSet = v10->_underlyingSet;
    v10->_underlyingSet = (NSMutableSet *)v11;

    v13 = objc_msgSend(v9, "mutableCopy");
    changesDictionary = v10->_changesDictionary;
    v10->_changesDictionary = (NSMutableDictionary *)v13;

  }
  return v10;
}

- (ACTrackedSet)initWithArray:(id)a3
{
  id v5;
  ACTrackedSet *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACTrackedSet.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

  }
  v6 = -[ACTrackedSet _initWithEnumerable:count:](self, "_initWithEnumerable:count:", v5, objc_msgSend(v5, "count"));

  return v6;
}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_underlyingSet, "count");
}

- (id)member:(id)a3
{
  return (id)-[NSMutableSet member:](self->_underlyingSet, "member:", a3);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableSet objectEnumerator](self->_underlyingSet, "objectEnumerator");
}

- (id)allObjects
{
  return (id)-[NSMutableSet allObjects](self->_underlyingSet, "allObjects");
}

- (id)allModifications
{
  return (id)-[NSMutableDictionary copy](self->_changesDictionary, "copy");
}

- (id)anyObject
{
  return (id)-[NSMutableSet anyObject](self->_underlyingSet, "anyObject");
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableSet containsObject:](self->_underlyingSet, "containsObject:", a3);
}

- (BOOL)isEqualToTrackedSet:(id)a3
{
  ACTrackedSet *v4;
  char v5;

  v4 = (ACTrackedSet *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[NSMutableSet isEqualToSet:](self->_underlyingSet, "isEqualToSet:", v4->_underlyingSet))
  {
    v5 = -[NSMutableDictionary isEqualToDictionary:](self->_changesDictionary, "isEqualToDictionary:", v4->_changesDictionary);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[ACTrackedSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableSet enumerateObjectsWithOptions:usingBlock:](self->_underlyingSet, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateModificationsUsingBlock:(id)a3
{
  -[ACTrackedSet enumerateModificationsWithOptions:usingBlock:](self, "enumerateModificationsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateModificationsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_changesDictionary, "enumerateKeysAndObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableSet *underlyingSet;
  id v5;

  underlyingSet = self->_underlyingSet;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", underlyingSet, CFSTR("_underlyingSet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changesDictionary, CFSTR("_changesDictionary"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ACTrackedSet _initWithUnderlyingSet:changesDictionary:](+[ACTrackedSet allocWithZone:](ACTrackedSet, "allocWithZone:", a3), "_initWithUnderlyingSet:changesDictionary:", self->_underlyingSet, self->_changesDictionary);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ACTrackedSet _initWithUnderlyingSet:changesDictionary:](+[ACMutableTrackedSet allocWithZone:](ACMutableTrackedSet, "allocWithZone:", a3), "_initWithUnderlyingSet:changesDictionary:", self->_underlyingSet, self->_changesDictionary);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (changes: %@)"), self->_underlyingSet, self->_changesDictionary);
}

- (BOOL)isEqual:(id)a3
{
  ACTrackedSet *v4;
  BOOL v5;

  v4 = (ACTrackedSet *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ACTrackedSet isEqualToTrackedSet:](self, "isEqualToTrackedSet:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableSet hash](self->_underlyingSet, "hash");
  return -[NSMutableDictionary hash](self->_changesDictionary, "hash") ^ v3;
}

@end

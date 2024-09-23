@implementation FCMapTable

- (id)objectForKey:(id)a3
{
  return -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  objc_class *v7;
  NSString *v8;
  NSString *keyClassName;
  objc_class *v10;
  NSString *v11;
  NSString *valueClassName;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!self->_valueClassName)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyClassName = self->_keyClassName;
    self->_keyClassName = v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    valueClassName = self->_valueClassName;
    self->_valueClassName = v11;

  }
  -[NSMapTable setObject:forKey:](self->_mapTable, "setObject:forKey:", v13, v6);

}

+ (id)strongToWeakObjectsMapTable
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMapTable:", v3);

  return v4;
}

+ (FCMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithMapTable:", v7);

  return (FCMapTable *)v8;
}

- (FCMapTable)initWithMapTable:(id)a3
{
  id v5;
  FCMapTable *v6;
  FCMapTable *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCMapTable;
  v6 = -[FCMapTable init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapTable, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClassName, 0);
  objc_storeStrong((id *)&self->_keyClassName, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMapTable countByEnumeratingWithState:objects:count:](self->_mapTable, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)dealloc
{
  NSString *keyClassName;
  NSObject *v4;
  NSString *valueClassName;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  keyClassName = self->_keyClassName;
  if (keyClassName)
  {
    v4 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      valueClassName = self->_valueClassName;
      *(_DWORD *)buf = 138543618;
      v8 = keyClassName;
      v9 = 2114;
      v10 = valueClassName;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "will deallocate map table with type <%{public}@, %{public}@>", buf, 0x16u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FCMapTable;
  -[FCMapTable dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSMapTable copyWithZone:](self->_mapTable, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithMapTable:", v6);

  return v7;
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_mapTable, "removeObjectForKey:", a3);
}

- (id)dictionaryRepresentation
{
  return -[NSMapTable dictionaryRepresentation](self->_mapTable, "dictionaryRepresentation");
}

- (FCMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  void *v6;
  FCMapTable *v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", a3, a4, a5);
  v7 = -[FCMapTable initWithMapTable:](self, "initWithMapTable:", v6);

  return v7;
}

- (FCMapTable)init
{
  id v3;
  FCMapTable *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v4 = -[FCMapTable initWithMapTable:](self, "initWithMapTable:", v3);

  return v4;
}

- (FCMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  FCMapTable *v12;

  v8 = (objc_class *)MEMORY[0x1E0CB3748];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v10, v9, a5);

  v12 = -[FCMapTable initWithMapTable:](self, "initWithMapTable:", v11);
  return v12;
}

+ (id)strongToStrongObjectsMapTable
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMapTable:", v3);

  return v4;
}

+ (id)weakToStrongObjectsMapTable
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMapTable:", v3);

  return v4;
}

+ (id)weakToWeakObjectsMapTable
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithMapTable:", v3);

  return v4;
}

- (NSPointerFunctions)keyPointerFunctions
{
  return -[NSMapTable keyPointerFunctions](self->_mapTable, "keyPointerFunctions");
}

- (NSPointerFunctions)valuePointerFunctions
{
  return -[NSMapTable valuePointerFunctions](self->_mapTable, "valuePointerFunctions");
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_mapTable, "count");
}

- (id)keyEnumerator
{
  return -[NSMapTable keyEnumerator](self->_mapTable, "keyEnumerator");
}

- (id)objectEnumerator
{
  return -[NSMapTable objectEnumerator](self->_mapTable, "objectEnumerator");
}

- (void)removeAllObjects
{
  -[NSMapTable removeAllObjects](self->_mapTable, "removeAllObjects");
}

- (void)addObjectsFromMapTable:(id)a3
{
  -[NSMapTable fc_addObjectsFromMapTable:](self->_mapTable, "fc_addObjectsFromMapTable:", *((_QWORD *)a3 + 1));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  -[NSMapTable encodeWithCoder:](self->_mapTable, "encodeWithCoder:", a3);
}

- (FCMapTable)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  FCMapTable *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithCoder:", v4);

  v7 = (FCMapTable *)objc_msgSend(v5, "initWithMapTable:", v6);
  return v7;
}

@end

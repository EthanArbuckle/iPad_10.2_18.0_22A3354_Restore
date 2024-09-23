@implementation MSVDefaultDictionary

- (MSVDefaultDictionary)init
{
  return -[MSVDefaultDictionary initWithDefaultValue:](self, "initWithDefaultValue:", &__block_literal_global_2444);
}

- (MSVDefaultDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  MSVDefaultDictionary *v8;
  uint64_t v9;
  NSMutableDictionary *storage;
  id defaultValue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSVDefaultDictionary;
  v8 = -[MSVDefaultDictionary init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:count:", a3, a4, a5);
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v9;

    defaultValue = v8->_defaultValue;
    v8->_defaultValue = &__block_literal_global_30;

  }
  return v8;
}

- (MSVDefaultDictionary)initWithDefaultValue:(id)a3
{
  id v4;
  MSVDefaultDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *storage;
  uint64_t v8;
  id defaultValue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVDefaultDictionary;
  v5 = -[MSVDefaultDictionary init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storage = v5->_storage;
    v5->_storage = v6;

    v8 = MEMORY[0x1A1AFBD28](v4);
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (id)v8;

  }
  return v5;
}

- (MSVDefaultDictionary)initWithCapacity:(unint64_t)a3 defaultValue:(id)a4
{
  id v6;
  MSVDefaultDictionary *v7;
  uint64_t v8;
  NSMutableDictionary *storage;
  uint64_t v10;
  id defaultValue;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSVDefaultDictionary;
  v7 = -[MSVDefaultDictionary init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    storage = v7->_storage;
    v7->_storage = (NSMutableDictionary *)v8;

    v10 = MEMORY[0x1A1AFBD28](v6);
    defaultValue = v7->_defaultValue;
    v7->_defaultValue = (id)v10;

  }
  return v7;
}

- (MSVDefaultDictionary)initWithDictionary:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  MSVDefaultDictionary *v8;
  uint64_t v9;
  NSMutableDictionary *storage;
  uint64_t v11;
  id defaultValue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSVDefaultDictionary;
  v8 = -[MSVDefaultDictionary init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v9;

    v11 = MEMORY[0x1A1AFBD28](v7);
    defaultValue = v8->_defaultValue;
    v8->_defaultValue = (id)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)-[NSMutableDictionary copy](self->_storage, "copy", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  +[MSVDefaultDictionary dictionaryWithDictionary:defaultValue:](MSVDefaultDictionary, "dictionaryWithDictionary:defaultValue:", self->_storage, self->_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_storage, "count");
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_storage, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    (*((void (**)(void))self->_defaultValue + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)setDefaultValue:(id)a3
{
  id v4;
  void *v5;
  id defaultValue;
  id v7;

  v4 = a3;
  if (!v4)
    v4 = &__block_literal_global_32;
  v7 = v4;
  v5 = (void *)MEMORY[0x1A1AFBD28]();
  defaultValue = self->_defaultValue;
  self->_defaultValue = v5;

}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->_storage, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_storage, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_storage, "removeObjectForKey:", a3);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

uint64_t __40__MSVDefaultDictionary_setDefaultValue___block_invoke()
{
  return 0;
}

uint64_t __54__MSVDefaultDictionary_initWithObjects_forKeys_count___block_invoke()
{
  return 0;
}

uint64_t __28__MSVDefaultDictionary_init__block_invoke()
{
  return 0;
}

+ (id)dictionaryWithDefaultValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDefaultValue:", v4);

  return v5;
}

+ (id)dictionaryWithCapacity:(unint64_t)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:defaultValue:", a3, v6);

  return v7;
}

+ (id)dictionaryWithDictionary:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:defaultValue:", v7, v6);

  return v8;
}

@end

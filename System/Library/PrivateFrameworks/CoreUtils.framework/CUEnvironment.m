@implementation CUEnvironment

- (id)description
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF((uint64_t)"%@: %##@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  CUEnvironment *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_objects, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  CUEnvironment *v7;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *objects;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = v11;
  if (v11 && !v7->_objects)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objects = v7->_objects;
    v7->_objects = v9;

    v8 = v11;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_objects, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end

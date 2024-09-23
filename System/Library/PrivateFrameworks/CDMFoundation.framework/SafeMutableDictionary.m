@implementation SafeMutableDictionary

- (SafeMutableDictionary)init
{
  SafeMutableDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SafeMutableDictionary;
  v2 = -[SafeMutableDictionary init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dictionary = v2->dictionary;
    v2->dictionary = v3;

  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self->dictionary;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->dictionary, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->dictionary;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->dictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dictionary, 0);
}

@end

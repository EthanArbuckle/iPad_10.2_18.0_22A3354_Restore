@implementation FCSetValueDictionary

- (id)description
{
  void *v2;
  void *v3;

  -[FCSetValueDictionary backingDictionary](self, "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCSetValueDictionary)init
{
  FCSetValueDictionary *v2;
  uint64_t v3;
  NSMutableDictionary *backingDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCSetValueDictionary;
  v2 = -[FCSetValueDictionary init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCSetValueDictionary *v4;
  void *v5;
  void *v6;

  v4 = -[FCSetValueDictionary init](+[FCSetValueDictionary allocWithZone:](FCSetValueDictionary, "allocWithZone:", a3), "init");
  -[FCSetValueDictionary backingDictionary](v4, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSetValueDictionary backingDictionary](self, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  return v4;
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[FCSetValueDictionary _setForKey:](self, "_setForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)addObjects:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[FCSetValueDictionary _setForKey:](self, "_setForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v6);

}

- (void)removeObjectsForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCSetValueDictionary backingDictionary](self, "backingDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[FCSetValueDictionary backingDictionary](self, "backingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_setForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCSetValueDictionary backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v4);
  }

  return v6;
}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (void)setBackingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_backingDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end

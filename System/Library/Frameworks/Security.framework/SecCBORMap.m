@implementation SecCBORMap

- (int)fieldType
{
  return 5;
}

- (SecCBORMap)init
{
  SecCBORMap *v2;
  uint64_t v3;
  NSMapTable *m_data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SecCBORMap;
  v2 = -[SecCBORMap init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    m_data = v2->m_data;
    v2->m_data = (NSMapTable *)v3;

  }
  return v2;
}

- (void)setKey:(id)a3 value:(id)a4
{
  -[NSMapTable setObject:forKey:](self->m_data, "setObject:forKey:", a4, a3);
}

- (id)getSortedKeys
{
  void *v2;
  void *v3;

  NSAllMapTableKeys(self->m_data);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_11335);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentation
{
  return -[NSMapTable dictionaryRepresentation](self->m_data, "dictionaryRepresentation");
}

- (void)write:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[SecCBORMap getSortedKeys](self, "getSortedKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecCBORValue encodeStartItems:output:](self, "encodeStartItems:output:", -[NSMapTable count](self->m_data, "count"), v11);
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0;
    do
    {
      v9 = v8;
      -[NSMapTable objectForKey:](self->m_data, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "write:", v11);
      objc_msgSend(v8, "write:", v11);
      objc_msgSend(v5, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    while (v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_data, 0);
}

uint64_t __27__SecCBORMap_getSortedKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "fieldType");
  v7 = objc_msgSend(v5, "fieldType");
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = objc_msgSend(v4, "compare:", v5);
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

@end

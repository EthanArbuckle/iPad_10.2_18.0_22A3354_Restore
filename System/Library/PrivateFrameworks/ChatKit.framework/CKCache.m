@implementation CKCache

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKCache;
  -[CKCache dealloc](&v4, sel_dealloc);
}

- (CKCache)init
{
  CKCache *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKCache;
  v2 = -[CKCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKCache setDictionary:](v2, "setDictionary:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_removeAllObjects, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_removeAllObjects, *MEMORY[0x1E0CEB298], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_removeAllObjects, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKCache dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[CKCache dictionary](self, "dictionary");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (void)removeAllObjects
{
  id v2;

  -[CKCache dictionary](self, "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end

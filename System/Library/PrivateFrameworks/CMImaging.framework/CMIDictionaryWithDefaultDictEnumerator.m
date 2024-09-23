@implementation CMIDictionaryWithDefaultDictEnumerator

- (CMIDictionaryWithDefaultDictEnumerator)initWithMainDict:(id)a3 defaultDict:(id)a4
{
  id v7;
  id v8;
  CMIDictionaryWithDefaultDictEnumerator *v9;
  CMIDictionaryWithDefaultDictEnumerator *v10;
  uint64_t v11;
  NSEnumerator *mainDictEnumerator;
  uint64_t v13;
  NSEnumerator *defaultDictEnumerator;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CMIDictionaryWithDefaultDictEnumerator;
  v9 = -[CMIDictionaryWithDefaultDictEnumerator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainDict, a3);
    objc_msgSend(v7, "keyEnumerator");
    v11 = objc_claimAutoreleasedReturnValue();
    mainDictEnumerator = v10->_mainDictEnumerator;
    v10->_mainDictEnumerator = (NSEnumerator *)v11;

    objc_msgSend(v8, "keyEnumerator");
    v13 = objc_claimAutoreleasedReturnValue();
    defaultDictEnumerator = v10->_defaultDictEnumerator;
    v10->_defaultDictEnumerator = (NSEnumerator *)v13;

  }
  return v10;
}

- (id)nextObject
{
  void *v3;
  void *v5;
  uint64_t v6;

  -[NSEnumerator nextObject](self->_mainDictEnumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSEnumerator nextObject](self->_defaultDictEnumerator, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      do
      {
        -[NSDictionary objectForKey:](self->_mainDict, "objectForKey:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          break;
        -[NSEnumerator nextObject](self->_defaultDictEnumerator, "nextObject");
        v6 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v6;
      }
      while (v6);
    }
  }
  return v3;
}

- (NSDictionary)mainDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSEnumerator)mainDictEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 16, 1);
}

- (NSEnumerator)defaultDictEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDictEnumerator, 0);
  objc_storeStrong((id *)&self->_mainDictEnumerator, 0);
  objc_storeStrong((id *)&self->_mainDict, 0);
}

@end

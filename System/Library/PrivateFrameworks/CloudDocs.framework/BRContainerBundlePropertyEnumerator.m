@implementation BRContainerBundlePropertyEnumerator

- (BRContainerBundlePropertyEnumerator)initWithContainerPlist:(id)a3 propertyKey:(id)a4 valuesOfClass:(Class)a5
{
  id v9;
  id v10;
  BRContainerBundlePropertyEnumerator *v11;
  BRContainerBundlePropertyEnumerator *v12;
  BRContainerBundleIdentifiersEnumerator *v13;
  NSEnumerator *enumerator;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRContainerBundlePropertyEnumerator;
  v11 = -[BRContainerBundlePropertyEnumerator init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_plist, a3);
    v13 = -[BRContainerBundleIdentifiersEnumerator initWithContainerPlist:]([BRContainerBundleIdentifiersEnumerator alloc], "initWithContainerPlist:", v9);
    enumerator = v12->_enumerator;
    v12->_enumerator = &v13->super;

    objc_storeStrong((id *)&v12->_propertyKey, a4);
    v12->_valueClass = a5;
  }

  return v12;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[NSEnumerator nextObject](self->_enumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      -[NSDictionary objectForKey:](self->_plist, "objectForKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", self->_propertyKey);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          goto LABEL_8;
        }

      }
      -[NSEnumerator nextObject](self->_enumerator, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    while (v6);
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

@end

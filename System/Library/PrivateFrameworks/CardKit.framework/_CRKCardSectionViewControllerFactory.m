@implementation _CRKCardSectionViewControllerFactory

- (_CRKCardSectionViewControllerFactory)init
{
  _CRKCardSectionViewControllerFactory *v2;
  _CRKCardSectionViewControllerRegistry *v3;
  _CRKCardSectionViewControllerRegistry *registry;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CRKCardSectionViewControllerFactory;
  v2 = -[_CRKCardSectionViewControllerFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CRKCardSectionViewControllerRegistry);
    registry = v2->_registry;
    v2->_registry = v3;

  }
  return v2;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_1);
  return (id)_sharedInstance_sStaticFactory;
}

+ (void)registerCardSectionViewControllerClass:(Class)a3
{
  id v4;

  objc_msgSend(a1, "_sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_registerCardSectionViewControllerClass:", a3);

}

- (void)_registerCardSectionViewControllerClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[objc_class cardSectionClasses](a3, "cardSectionClasses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_CRKCardSectionViewControllerRegistry registerCardSectionViewControllerClass:forCardSectionClass:](self->_registry, "registerCardSectionViewControllerClass:forCardSectionClass:", a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (id)cardSectionViewControllerForCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cardSectionViewControllerForCardSection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  id v4;
  _CRKCardSectionViewControllerRegistry *registry;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  registry = self->_registry;
  v6 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "backingCardSection"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = (void *)objc_opt_class();

  }
  else
  {
    v9 = (void *)objc_opt_class();
  }
  v10 = objc_retainAutorelease(v9);

  v11 = (void *)objc_msgSend(objc_alloc(-[_CRKCardSectionViewControllerRegistry cardSectionViewControllerClassForCardSectionClass:](registry, "cardSectionViewControllerClassForCardSectionClass:", v10)), "_initWithCardSection:", v6);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

@end

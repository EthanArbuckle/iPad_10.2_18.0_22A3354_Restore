@implementation _CRKCardSectionViewControllerRegistry

- (_CRKCardSectionViewControllerRegistry)init
{
  _CRKCardSectionViewControllerRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cardSectionViewControllerClassNameForCardSectionClassName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CRKCardSectionViewControllerRegistry;
  v2 = -[_CRKCardSectionViewControllerRegistry init](&v6, sel_init);
  if (v2)
  {
    CRLogInitIfNeeded();
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cardSectionViewControllerClassNameForCardSectionClassName = v2->_cardSectionViewControllerClassNameForCardSectionClassName;
    v2->_cardSectionViewControllerClassNameForCardSectionClassName = v3;

  }
  return v2;
}

- (void)registerCardSectionViewControllerClass:(Class)a3 forCardSectionClass:(Class)a4
{
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *cardSectionViewControllerClassNameForCardSectionClassName;
  void *v13;
  void *v14;
  os_log_t v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE15490];
  v8 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    NSStringFromClass(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_218FCB000, v9, OS_LOG_TYPE_INFO, "Registering card section view controller class %@ for card section class %@", (uint8_t *)&v22, 0x16u);

  }
  cardSectionViewControllerClassNameForCardSectionClassName = self->_cardSectionViewControllerClassNameForCardSectionClassName;
  NSStringFromClass(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cardSectionViewControllerClassNameForCardSectionClassName, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v19 = v15;
      NSStringFromClass(a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v20;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v21;
      _os_log_error_impl(&dword_218FCB000, v19, OS_LOG_TYPE_ERROR, "Overwriting existing card section view controller class with new card section view controller class in registry\n    Card section class: %@\n    Existing CSVC class: %@\n    New CSVC class: %@", (uint8_t *)&v22, 0x20u);

    }
  }
  v16 = self->_cardSectionViewControllerClassNameForCardSectionClassName;
  NSStringFromClass(a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v18);

}

- (Class)cardSectionViewControllerClassForCardSectionClass:(Class)a3
{
  NSMutableDictionary *cardSectionViewControllerClassNameForCardSectionClassName;
  void *v5;
  NSString *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  int v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  cardSectionViewControllerClassNameForCardSectionClassName = self->_cardSectionViewControllerClassNameForCardSectionClassName;
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cardSectionViewControllerClassNameForCardSectionClassName, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x24BE15490];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      NSStringFromClass(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_218FCB000, v9, OS_LOG_TYPE_DEFAULT, "Found card section view controller for card section\n    Card section: %@\n    CSVC: %@", (uint8_t *)&v16, 0x16u);

    }
    v11 = NSClassFromString(v6);
  }
  else
  {
    if (v8)
    {
      v12 = v7;
      NSStringFromClass(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_218FCB000, v12, OS_LOG_TYPE_DEFAULT, "Defaulting to base class view controller for card section\n    Card section: %@", (uint8_t *)&v16, 0xCu);

    }
    v11 = (void *)objc_opt_class();
  }
  v14 = v11;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionViewControllerClassNameForCardSectionClassName, 0);
}

@end

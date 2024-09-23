@implementation HUViewControllerRegistry

+ (id)sharedInstance
{
  if (_MergedGlobals_627 != -1)
    dispatch_once(&_MergedGlobals_627, &__block_literal_global_3_0);
  return (id)qword_1ED580B60;
}

- (void)registerViewControllerClass:(Class)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HUViewControllerRegistry viewControllerClassesByIdentifier](self, "viewControllerClassesByIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v6);

}

- (NSMutableDictionary)viewControllerClassesByIdentifier
{
  return self->_viewControllerClassesByIdentifier;
}

void __42__HUViewControllerRegistry_sharedInstance__block_invoke_2()
{
  HUViewControllerRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(HUViewControllerRegistry);
  v1 = (void *)qword_1ED580B60;
  qword_1ED580B60 = (uint64_t)v0;

}

- (HUViewControllerRegistry)init
{
  HUViewControllerRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *viewControllerClassesByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUViewControllerRegistry;
  v2 = -[HUViewControllerRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    viewControllerClassesByIdentifier = v2->_viewControllerClassesByIdentifier;
    v2->_viewControllerClassesByIdentifier = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (Class)viewControllerClassForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUViewControllerRegistry viewControllerClassesByIdentifier](self, "viewControllerClassesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClassesByIdentifier, 0);
}

@end

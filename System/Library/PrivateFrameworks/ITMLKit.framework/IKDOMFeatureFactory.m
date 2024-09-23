@implementation IKDOMFeatureFactory

+ (void)initialize
{
  id v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)sClassMap_0;
    sClassMap_0 = (uint64_t)v3;

    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("Player"));
    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("MenuBarDocument"));
    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("Keyboard"));
    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("leftNavigationDocument"));
    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("rightNavigationDocument"));
    objc_msgSend(a1, "registerClass:forFeatureName:", objc_opt_class(), CFSTR("Browser"));
  }
}

+ (void)registerClass:(Class)a3 forFeatureName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "length");
    v6 = v8;
    if (v7)
    {
      objc_msgSend((id)sClassMap_0, "setObject:forKey:", a3, v8);
      v6 = v8;
    }
  }

}

+ (id)featureForName:(id)a3 withDOMNode:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)(id)objc_msgSend((id)sClassMap_0, "objectForKey:", v5);
  if (v7)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithDOMNode:featureName:", v6, v5);
  else
    v8 = 0;

  return v8;
}

@end

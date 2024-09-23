@implementation IKCSSTypeInfo

+ (id)getTypeInfoForPropertyName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)sCSSTypeInfoProperties;
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)registerStyle:(id)a3 type:(unint64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  IKCSSDeclarationTypeInfo *v9;

  v5 = registerStyle_type__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&registerStyle_type__onceToken, &__block_literal_global_9);
  v9 = -[IKCSSDeclarationTypeInfo initWithType:name:]([IKCSSDeclarationTypeInfo alloc], "initWithType:name:", a4, v6);
  v7 = (void *)sCSSTypeInfoProperties;
  objc_msgSend(v6, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKey:", v9, v8);
}

void __36__IKCSSTypeInfo_registerStyle_type___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)sCSSTypeInfoProperties;
  sCSSTypeInfoProperties = (uint64_t)v0;

}

+ (void)unregisterStyles
{
  objc_msgSend((id)sCSSTypeInfoProperties, "removeAllObjects");
}

@end

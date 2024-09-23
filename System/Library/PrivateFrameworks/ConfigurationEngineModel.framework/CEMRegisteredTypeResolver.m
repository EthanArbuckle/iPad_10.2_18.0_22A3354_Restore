@implementation CEMRegisteredTypeResolver

+ (Class)registeredClassWithIdentifier:(id)a3
{
  id v3;
  NSString *v4;
  NSString *v5;
  objc_class *v6;

  v3 = a3;
  if (registeredClassWithIdentifier__onceToken != -1)
    dispatch_once(&registeredClassWithIdentifier__onceToken, &__block_literal_global_34);
  objc_msgSend((id)registeredClassWithIdentifier__mappings, "objectForKeyedSubscript:", v3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (NSString *)NSClassFromString(v4);
  v6 = v4;

  return v6;
}

void __59__CEMRegisteredTypeResolver_registeredClassWithIdentifier___block_invoke()
{
  void *v0;

  v0 = (void *)registeredClassWithIdentifier__mappings;
  registeredClassWithIdentifier__mappings = (uint64_t)&unk_24C69DA00;

}

@end

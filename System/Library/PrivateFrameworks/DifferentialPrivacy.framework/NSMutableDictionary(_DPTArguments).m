@implementation NSMutableDictionary(_DPTArguments)

- (void)dp_addStringForKey:()_DPTArguments
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v5, v6);

}

- (void)dp_addBoolForKey:()_DPTArguments
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, v5);

}

@end

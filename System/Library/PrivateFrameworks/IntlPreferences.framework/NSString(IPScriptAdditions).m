@implementation NSString(IPScriptAdditions)

- (id)localeIdentifierWithUpdatedScript:()IPScriptAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "componentsFromLocaleIdentifier:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C99820]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

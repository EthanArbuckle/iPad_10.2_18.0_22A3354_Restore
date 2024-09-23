@implementation CalPersonNameComponentsFormatter

+ (id)personNameComponentsFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kCalThreadLocalPersonNameComponentsFormatterKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("kCalThreadLocalPersonNameComponentsFormatterKey"));

  }
  objc_msgSend(v6, "personNameComponentsFromString:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

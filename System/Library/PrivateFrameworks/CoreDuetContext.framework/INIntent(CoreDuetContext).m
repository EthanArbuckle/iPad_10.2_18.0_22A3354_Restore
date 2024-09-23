@implementation INIntent(CoreDuetContext)

- (id)contextMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries intentClassKey](_CDContextQueries, "intentClassKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    +[_CDContextQueries intentTypeKey](_CDContextQueries, "intentTypeKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v8);

  }
  objc_msgSend(a1, "verb");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "verb");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    +[_CDContextQueries intentVerbKey](_CDContextQueries, "intentVerbKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v12);

  }
  return v2;
}

@end

@implementation NSDictionary(CRKAdditions)

- (id)crk_keyValueObservingOldObject
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x24BDD0E80];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)crk_keyValueObservingNewObject
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x24BDD0E70];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)crk_dictionaryByAddingEntriesFromDictionary:()CRKAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end

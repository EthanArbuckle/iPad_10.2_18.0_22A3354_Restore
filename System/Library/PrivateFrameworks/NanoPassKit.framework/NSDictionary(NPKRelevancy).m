@implementation NSDictionary(NPKRelevancy)

+ (id)npkRelevancyTupleWithUniqueID:()NPKRelevancy relevantText:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE6F5B0]);
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE6F5A8]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)npkRelevancyUniqueID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE6F5B0]);
}

- (uint64_t)npkRelevancyRelevantText
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x24BE6F5A8]);
}

@end

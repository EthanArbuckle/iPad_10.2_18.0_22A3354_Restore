@implementation NSMutableDictionary(HFItemAdditions)

- (void)hf_setMinimumDisplayPriority:()HFItemAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &unk_1EA7CD5B8;
  v7 = objc_msgSend(v5, "integerValue");

  if (v7 <= a3)
    v8 = a3;
  else
    v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, CFSTR("priority"));

}

@end

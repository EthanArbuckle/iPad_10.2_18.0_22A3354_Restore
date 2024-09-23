@implementation NSDictionary(CATIDSAdditions)

- (id)cat_uuidForKey:()CATIDSAdditions
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

@end

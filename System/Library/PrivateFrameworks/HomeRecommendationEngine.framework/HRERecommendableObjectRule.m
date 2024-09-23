@implementation HRERecommendableObjectRule

- (BOOL)passesWithHomeObjects:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HRERule.m"), 23, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HRERecommendableObjectRule passesWithHomeObjects:]", objc_opt_class());

  return 0;
}

+ (id)_types:(id)a3 notMatchedByObjects:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HRERecommendableObjectRule__types_notMatchedByObjects___block_invoke;
  v9[3] = &unk_24F2177B8;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

uint64_t __57__HRERecommendableObjectRule__types_notMatchedByObjects___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  void *v6;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hre_matchingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *a3 = result == 0;
  return result;
}

@end

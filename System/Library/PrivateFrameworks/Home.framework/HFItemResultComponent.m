@implementation HFItemResultComponent

- (NSDictionary)results
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemResultComponent.m"), 15, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemResultComponent results]", objc_opt_class());

  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

+ (id)combinedResultsForComponents:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__HFItemResultComponent_combinedResultsForComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a3, "componentPriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "componentPriority");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)componentPriority
{
  return self->_componentPriority;
}

@end

@implementation _HKListUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5808]);

  if (v5)
  {
    objc_msgSend(a1, "simplePredicate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKListUserDomainConceptComparisonFilter+HealthDaemon.m"), 25, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__CFString)propertyForKeyPath
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5808]);

  if (v5)
  {
    v6 = CFSTR("list_type");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKListUserDomainConceptComparisonFilter+HealthDaemon.m"), 34, CFSTR("Unreachable code has been executed"));

    v6 = &stru_1E6D11BB8;
  }
  return v6;
}

@end

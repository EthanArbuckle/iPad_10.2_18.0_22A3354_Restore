@implementation _HKUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;

  v5 = a3;
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB58C0]);

  if (v7)
  {
    v8 = v5;
    if (a1)
    {
      v9 = (void *)MEMORY[0x1E0CB6D38];
      objc_msgSend(a1, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "semanticIdentifierFromSemanticIdentifierString:profile:", v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v8, "daemon");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userDomainConceptEntityRegistry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "typeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "userDomainConceptEntityClassForTypeIdentifier:", v14);

        objc_msgSend(v15, "predicateMatchingSemanticIdentifier:", v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB58C8]);

    if (v17)
    {
      if (a1)
      {
        v18 = objc_msgSend(a1, "operatorType");
        objc_msgSend(a1, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18 == 10)
          HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifiers(v19);
        else
          HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "keyPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CB58D0]);

      if (v22)
      {
        objc_msgSend(a1, "simplePredicate");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKUserDomainConceptComparisonFilter+HealthDaemon.m"), 35, CFSTR("Unreachable code has been executed"));

        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v23;
}

- (__CFString)propertyForKeyPath
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB58D0]);

  if (v5)
  {
    v6 = CFSTR("uuid");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKUserDomainConceptComparisonFilter+HealthDaemon.m"), 44, CFSTR("Unreachable code has been executed"));

    v6 = &stru_1E6D11BB8;
  }
  return v6;
}

@end

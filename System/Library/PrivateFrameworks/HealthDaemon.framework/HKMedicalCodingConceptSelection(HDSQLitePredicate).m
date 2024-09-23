@implementation HKMedicalCodingConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ontologyConceptManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "coding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codingSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeIdentifierForCodingSystem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB62F0]);
    v10 = objc_msgSend(v8, "longLongValue");
    objc_msgSend(a1, "coding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "code");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithAttribute:operatorType:value:", v10, 4, v12);

    objc_msgSend(v13, "predicateWithProfile:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "coding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "codingSystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = a1;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@ received no attribute identifier for %{public}@, will return 'false' predicate", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end

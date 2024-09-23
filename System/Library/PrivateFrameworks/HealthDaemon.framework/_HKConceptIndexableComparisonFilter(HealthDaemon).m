@implementation _HKConceptIndexableComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D298A0]);
  objc_msgSend(v2, "setEntityClass:", objc_opt_class());
  if (a1)
  {
    if (objc_msgSend(a1, "operatorType") == 4)
    {
      objc_msgSend(a1, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HDConceptIndexEntityPredicateForConceptIdentifier(v3, v5);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(a1, "operatorType") != 10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__conceptIndexPredicate, a1, CFSTR("_HKConceptIndexableComparisonFilter+HealthDaemon.m"), 42, CFSTR("Unreachable code has been executed"));

        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(a1, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "keyPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      HDConceptIndexEntityPredicateForConceptIdentifiers(v3, v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_8:
  objc_msgSend(v2, "setPredicate:", a1);

  v7 = (void *)MEMORY[0x1E0D29838];
  v11 = CFSTR("object_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("data_id"), 7, v2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

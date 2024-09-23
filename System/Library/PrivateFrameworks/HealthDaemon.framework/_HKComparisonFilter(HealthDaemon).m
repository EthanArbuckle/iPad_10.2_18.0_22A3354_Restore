@implementation _HKComparisonFilter(HealthDaemon)

- (id)simplePredicate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v3 = a1;
  v4 = objc_msgSend(a1, "operatorType");
  switch(v4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      if (v3)
      {
        v5 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(v3, "propertyForKeyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "operatorType");
        objc_msgSend(v5, "predicateWithProperty:value:comparisonType:", v6, v7, HDSQLiteComparisonTypeForPredicateOperator());
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 6:
    case 10:
      if (v3)
      {
        v10 = (void *)MEMORY[0x1E0D29848];
        objc_msgSend(v3, "propertyForKeyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containsPredicateWithProperty:values:", v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 7:
      if (v3)
      {
        v11 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(v3, "propertyForKeyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicateWithProperty:likePattern:", v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 8:
      if (v3)
      {
        v12 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(v3, "propertyForKeyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateWithProperty:beginsWithString:", v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 9:
      if (v3)
      {
        v13 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(v3, "propertyForKeyPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithProperty:endsWithString:", v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    default:
      if (v4 == 99)
      {
        if (v3)
        {
          v9 = (void *)MEMORY[0x1E0D29838];
          objc_msgSend(v3, "propertyForKeyPath");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "predicateWithProperty:containsString:", v6, v7);
          v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v3 = (void *)v8;

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("HKFilter+HealthDaemon.m"), 130, CFSTR("Unreachable code has been executed"));

        objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v3;
}

- (uint64_t)propertyForKeyPath
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

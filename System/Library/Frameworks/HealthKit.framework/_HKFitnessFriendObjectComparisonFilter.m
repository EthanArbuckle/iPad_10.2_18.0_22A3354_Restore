@implementation _HKFitnessFriendObjectComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("friend_uuid"));
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("friend_uuid")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendObjectComparisonFilter.m"), 34, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  void *v9;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("friend_uuid")))
    return a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKFitnessFriendObjectComparisonFilter.m"), 43, CFSTR("Unreachable code has been executed"));

  return 0;
}

@end

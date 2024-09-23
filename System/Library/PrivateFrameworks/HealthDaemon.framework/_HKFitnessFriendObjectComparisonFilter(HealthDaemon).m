@implementation _HKFitnessFriendObjectComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;

  v3 = a1;
  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB57F8]);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = a2;
    v14 = v3;
    v15 = 22;
LABEL_8:
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m"), v15, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3)
  {
    if (objc_msgSend(v3, "operatorType") == 4)
    {
      objc_msgSend(v3, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForFriendUUID, v3, CFSTR("_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m"), 29, CFSTR("Friend UUID should be NSData"));

      }
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      v3 = (void *)v10;
LABEL_22:

      return v3;
    }
    if (objc_msgSend(v3, "operatorType") == 5)
    {
      objc_msgSend(v3, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForFriendUUID, v3, CFSTR("_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m"), 34, CFSTR("Friend UUID should be NSData"));

      }
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v18);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if (objc_msgSend(v3, "operatorType") == 10)
    {
      objc_msgSend(v3, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v3, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
LABEL_18:
          objc_msgSend(v3, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v23 = objc_opt_isKindOfClass();
          objc_msgSend(v3, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v24;
          if ((v23 & 1) == 0)
          {
            objc_msgSend(v24, "allObjects");
            v25 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v25;
          }

          objc_msgSend(v8, "hk_map:", &__block_literal_global_126);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v9);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForFriendUUID, v3, CFSTR("_HKFitnessFriendObjectComparisonFilter+HealthDaemon.m"), 42, CFSTR("Friend UUID should be NSArray or NSSet"));
      }

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = sel__predicateForFriendUUID;
    v14 = v3;
    v15 = 51;
    goto LABEL_8;
  }
  return v3;
}

@end

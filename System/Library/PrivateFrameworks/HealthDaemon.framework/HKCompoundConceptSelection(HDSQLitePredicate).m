@implementation HKCompoundConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  objc_msgSend(a1, "selections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__HKCompoundConceptSelection_HDSQLitePredicate__predicateWithProfile___block_invoke;
  v16[3] = &unk_1E6D0EF58;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v6, "hk_map:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "operationType");
  if (v9 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (void *)v13;
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCompoundConceptSelection+HDSQLitePredicate.m"), 35, CFSTR("Unreachable code has been executed"));

    v12 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "negatedPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v12;
}

@end

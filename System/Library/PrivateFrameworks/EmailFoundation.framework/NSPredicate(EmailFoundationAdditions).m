@implementation NSPredicate(EmailFoundationAdditions)

- (uint64_t)ef_matchesEverything
{
  return objc_msgSend(a1, "evaluateWithObject:", 0);
}

+ (uint64_t)ef_matchEverythingPredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

+ (id)ef_andCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:
{
  objc_msgSend(a1, "_ef_compoundPredicateForOptionalPredicate:second:isAnd:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ef_compoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:isAnd:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3528];
    if (a5)
    {
      v17[0] = v7;
      v17[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16[0] = v7;
      v16[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "orPredicateWithSubpredicates:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (v7)
      v13 = v7;
    else
      v13 = v8;
    v12 = v13;
  }

  return v12;
}

+ (id)ef_andCompoundPredicateWithSubpredicates:()EmailFoundationAdditions
{
  objc_msgSend(a1, "_ef_compoundPredicateWithSubpredicates:isAnd:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ef_orCompoundPredicateWithSubpredicates:()EmailFoundationAdditions
{
  objc_msgSend(a1, "_ef_compoundPredicateWithSubpredicates:isAnd:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_ef_compoundPredicateWithSubpredicates:()EmailFoundationAdditions isAnd:
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
      else
        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  return 0;
}

- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions
{
  return objc_msgSend(a3, "isEqual:", a1);
}

- (uint64_t)ef_matchesNothing
{
  return objc_msgSend(a1, "evaluateWithObject:", 0) ^ 1;
}

+ (uint64_t)ef_matchNothingPredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

+ (id)ef_orCompoundPredicateForOptionalPredicate:()EmailFoundationAdditions second:
{
  objc_msgSend(a1, "_ef_compoundPredicateForOptionalPredicate:second:isAnd:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

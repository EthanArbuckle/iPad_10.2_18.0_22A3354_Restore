@implementation NSComparisonPredicate(EmailFoundationAdditions)

- (uint64_t)ef_matchesEverything
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

- (uint64_t)ef_matchesNothing
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

- (id)ef_publicDescription
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a1, "comparisonPredicateModifier") == 1)
  {
    v2 = CFSTR("ALL ");
  }
  else if (objc_msgSend(a1, "comparisonPredicateModifier") == 2)
  {
    v2 = CFSTR("ANY ");
  }
  else
  {
    v2 = &stru_1E62A84D8;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "leftExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  describableObjectForExpression(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateOperator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  describableObjectForExpression(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@ %@ %@"), v2, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  id v4;
  id v5;
  uint64_t (**v6)(void *, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NSComparisonPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke;
  aBlock[3] = &unk_1E62A6670;
  v5 = v4;
  v12 = v5;
  v6 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6[2](v6, v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(a1, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6[2](v6, v9);

  }
  return v8;
}

@end

@implementation NSPredicate(MediaGroupsDaemon)

- (uint64_t)mg_requiresCurrentDevice
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_0);
}

- (uint64_t)mg_containsCurrentDevice
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "predicateFormat");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("$CURRENT_"));

  return v2;
}

- (uint64_t)mg_restrictedToContainment
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_2);
}

- (BOOL)mg_containsContainment
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\ASUBQUERY\\(\\$CONTAINMENT_MAP\\[.+?\\], \\$container, identifier IN \\$container\\)\\[SIZE\\] > 0\\z"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) == 1;

  return v4;
}

- (uint64_t)mg_evaluateConstraint:()MediaGroupsDaemon
{
  uint64_t (**v4)(id, void *);
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = v4[2](v4, a1);
    goto LABEL_12;
  }
  v5 = a1;
  v6 = objc_msgSend(v5, "compoundPredicateType");
  objc_msgSend(v5, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v10 = v6 == 2;
  while (1)
  {
    v11 = v8;
    objc_msgSend(v7, "objectAtIndex:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v8, "mg_evaluateConstraint:", v4);
    if (v6 != 2)
      break;
    if ((v12 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_11;
    }
LABEL_7:
    if (++v9 >= (unint64_t)objc_msgSend(v7, "count"))
      goto LABEL_11;
  }
  if ((v12 & 1) == 0)
    goto LABEL_7;
  v10 = 1;
LABEL_11:

LABEL_12:
  return v10;
}

@end

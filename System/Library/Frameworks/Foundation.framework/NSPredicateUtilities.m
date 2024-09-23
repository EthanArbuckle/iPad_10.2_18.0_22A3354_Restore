@implementation NSPredicateUtilities

uint64_t __65___NSPredicateUtilities__compoundPredicateClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  qword_1ECD0A2F8 = result;
  return result;
}

uint64_t __58___NSPredicateUtilities__expressionClassesForSecureCoding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  result = objc_msgSend(v14, "initWithObjects:", v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_lookUpClass("NSFetchRequestExpression"), 0);
  qword_1ECD0A308 = result;
  return result;
}

uint64_t __56___NSPredicateUtilities__operatorClassesForSecureCoding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  id v11;

  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  result = objc_msgSend(v11, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  qword_1ECD0A328 = result;
  return result;
}

uint64_t __66___NSPredicateUtilities__extendedExpressionClassesForSecureCoding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  result = objc_msgSend(v15, "initWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_lookUpClass("NSFetchRequestExpression"), 0);
  qword_1ECD0A318 = result;
  return result;
}

uint64_t __61___NSPredicateUtilities__constantValueClassesForSecureCoding__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v0 = (uint64_t)objc_lookUpClass("CLLocation");
  v1 = (uint64_t)objc_lookUpClass("NSXPCStoreManagedObjectArchivingToken");
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v10 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  if (!v0)
  {
    v0 = objc_opt_class();
    if (v1)
      goto LABEL_3;
LABEL_5:
    v1 = objc_opt_class();
    goto LABEL_3;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  result = objc_msgSend(v16, "initWithObjects:", v15, v14, v13, v12, v11, v10, v2, v3, v4, v5, v6, v7, v8, v0, v1, 0);
  qword_1ECD0A338 = result;
  return result;
}

uint64_t __57___NSPredicateUtilities__predicateClassesForSecureCoding__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  _MergedGlobals_133 = result;
  return result;
}

@end

@implementation MUIMailboxFiltersFormatter

- (id)_stringForFilters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "ef_map:", &__block_literal_global_23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __48__MUIMailboxFiltersFormatter__stringForFilters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "ef_all:", &__block_literal_global_3_0))
  {
    -[MUIMailboxFiltersFormatter _stringForFilters:](self, "_stringForFilters:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__MUIMailboxFiltersFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

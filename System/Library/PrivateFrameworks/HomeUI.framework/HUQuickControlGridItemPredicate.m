@implementation HUQuickControlGridItemPredicate

- (id)matchingControlItemsForControlItems:(id)a3
{
  id v3;
  int v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_1);
  if ((unint64_t)objc_msgSend(v3, "count") > 1
    || v4 && objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v5 = v3;
  }
  else
  {
    v5 = (id)objc_opt_new();
  }
  v6 = v5;

  return v6;
}

uint64_t __71__HUQuickControlGridItemPredicate_matchingControlItemsForControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)maximumNumberOfMatches
{
  return 1;
}

@end

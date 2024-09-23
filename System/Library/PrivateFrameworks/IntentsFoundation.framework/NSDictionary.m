@implementation NSDictionary

BOOL __66__NSDictionary_IntentsFoundation__if_dictionaryWithNonEmptyValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v3, "length")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "allKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "count") != 0;

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

@end

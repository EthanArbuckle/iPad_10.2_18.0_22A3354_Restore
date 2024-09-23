@implementation NSArray(_NBAdditions)

- (id)nb_safeObjectAtIndex:()_NBAdditions class:
{
  void *v5;
  id v6;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  return v6;
}

- (uint64_t)nb_safeStringAtIndex:()_NBAdditions
{
  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, objc_opt_class());
}

- (uint64_t)nb_safeNumberAtIndex:()_NBAdditions
{
  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, objc_opt_class());
}

- (uint64_t)nb_safeArrayAtIndex:()_NBAdditions
{
  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, objc_opt_class());
}

- (uint64_t)nb_safeDataAtIndex:()_NBAdditions
{
  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, objc_opt_class());
}

@end

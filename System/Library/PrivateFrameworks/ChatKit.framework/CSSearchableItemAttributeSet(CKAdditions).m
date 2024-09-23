@implementation CSSearchableItemAttributeSet(CKAdditions)

- (id)__ck_itemContentCreationDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "__ck_privateMutableAttributesDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("kMDItemContentCreationDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)__ck_spotlightItemSnippet
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "__ck_privateMutableAttributesDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CA68B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)__ck_privateMutableAttributesDictionary
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:", sel_mutableAttributes);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end

@implementation IgnorableArticles

void __IgnorableArticles_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  ML3LocalizedSortingDetailsDictionary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKey:", CFSTR("InsignificantSortPrefixes"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)IgnorableArticles_articles;
    IgnorableArticles_articles = v1;

    v0 = v3;
  }
  if (!IgnorableArticles_articles)
  {
    IgnorableArticles_articles = (uint64_t)&unk_1E5BA89A0;
    v0 = v3;
  }

}

@end

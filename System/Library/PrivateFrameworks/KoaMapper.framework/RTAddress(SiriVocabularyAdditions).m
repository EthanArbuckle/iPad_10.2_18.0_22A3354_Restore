@implementation RTAddress(SiriVocabularyAdditions)

- (id)siriVocabularySpatialNames
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "thoroughfare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(a1, "subLocality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "addObject:", v4);
  objc_msgSend(a1, "locality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(a1, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v2, "addObject:", v6);

  return v2;
}

@end

@implementation NMAPIRecentRadioStationsResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NMAPISectionResult *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NMAPIArrayWithObject(v8, CFSTR("data"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:]([NMAPISectionResult alloc], "initWithSectionIdentifier:sectionDictionary:itemsArray:", CFSTR("Recently Played"), &unk_24DD2C788, v9);
    objc_msgSend(v7, "addObject:", v10);

    v11 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

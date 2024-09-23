@implementation NMAPIItemListResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NMAPISectionResult *v10;
  NMAPISectionResult *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NMAPIArrayWithObject(v8, CFSTR("data"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [NMAPISectionResult alloc];
    v11 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v10, "initWithSectionIdentifier:sectionDictionary:itemsArray:", CFSTR("Empty Section"), MEMORY[0x24BDBD1B8], v9);
    objc_msgSend(v7, "addObject:", v11);

    v12 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end

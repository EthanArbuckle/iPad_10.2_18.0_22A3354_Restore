@implementation NMAPIMultiplexResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NMAPISectionResult *v12;
  void *v13;
  NMAPISectionResult *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("results.target"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NMAPIDictionaryWithObject(v8, CFSTR("target"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIStringWithObject(v10, CFSTR("type"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [NMAPISectionResult alloc];
      v17[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v12, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v11, v9, v13);
      objc_msgSend(v7, "addObject:", v14);

      v15 = (void *)objc_msgSend(v7, "copy");
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end

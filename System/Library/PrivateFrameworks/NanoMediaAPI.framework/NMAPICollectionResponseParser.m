@implementation NMAPICollectionResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NMAPISectionResult *v19;
  void *v20;
  NMAPISectionResult *v21;
  void *v22;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NMAPIArrayWithObject(v8, CFSTR("data"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    NMAPIDictionaryInSingleObjectArray(v9, CFSTR("section"), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("id"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NMAPIStringWithObject(v12, CFSTR("sectionIdentifier"), a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v11, "valueForKeyPath:", CFSTR("relationships.tracks"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NMAPIDictionaryWithObject(v14, CFSTR("tracks"), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NMAPIArrayWithObject(v16, CFSTR("tracksData"), a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = (void *)objc_msgSend(v11, "mutableCopy");
            objc_msgSend(v18, "removeObjectForKey:", CFSTR("tracks"));
            v19 = [NMAPISectionResult alloc];
            v20 = (void *)objc_msgSend(v18, "copy");
            v21 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v19, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v13, v20, v17);
            objc_msgSend(v7, "addObject:", v21);

            v22 = (void *)objc_msgSend(v7, "copy");
          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end

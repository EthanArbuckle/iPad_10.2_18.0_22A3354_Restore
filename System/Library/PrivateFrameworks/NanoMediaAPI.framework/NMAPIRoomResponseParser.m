@implementation NMAPIRoomResponseParser

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
  NMAPISectionResult *v17;
  void *v18;
  NMAPISectionResult *v19;
  void *v20;

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
        objc_msgSend(v11, "valueForKeyPath:", CFSTR("relationships.contents.data"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NMAPIArrayWithObject(v14, CFSTR("items"), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v16, "removeObjectForKey:", CFSTR("relationships"));
          v17 = [NMAPISectionResult alloc];
          v18 = (void *)objc_msgSend(v16, "copy");
          v19 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v17, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v13, v18, v15);
          objc_msgSend(v7, "addObject:", v19);

          v20 = (void *)objc_msgSend(v7, "copy");
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end

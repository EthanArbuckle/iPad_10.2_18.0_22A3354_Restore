@implementation NMAPISearchResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NMAPISectionResult *v19;
  const __CFString *v20;
  void *v21;
  NMAPISectionResult *v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "objectForKey:", CFSTR("results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NMAPIDictionaryWithObject(v6, CFSTR("results"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("meta.results.order"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIArrayWithObject(v8, CFSTR("resultsOrder"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v9;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v29)
      {
        v28 = *(_QWORD *)v32;
        v10 = CFSTR("data");
        v25 = v9;
        v26 = v5;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(obj);
            NMAPIStringWithObject(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v11), CFSTR("resultKey"), a4);
            v12 = objc_claimAutoreleasedReturnValue();
            if (!v12)
              goto LABEL_18;
            v13 = (void *)v12;
            objc_msgSend(v7, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            NMAPIDictionaryWithObject(v14, CFSTR("section"), a4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {

LABEL_18:
              v23 = 0;
              v9 = v25;
              v5 = v26;
              goto LABEL_19;
            }
            objc_msgSend(v15, "objectForKey:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            NMAPIArrayWithObject(v16, CFSTR("items"), a4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = (void *)objc_msgSend(v15, "mutableCopy");
              objc_msgSend(v18, "removeObjectForKey:", v10);
              v19 = [NMAPISectionResult alloc];
              v20 = v10;
              v21 = (void *)objc_msgSend(v18, "copy");
              v22 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v19, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v13, v21, v17);
              objc_msgSend(v30, "addObject:", v22);

              v10 = v20;
            }

            ++v11;
          }
          while (v29 != v11);
          v9 = v25;
          v5 = v26;
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v29)
            continue;
          break;
        }
      }

      v23 = (void *)objc_msgSend(v30, "copy");
    }
    else
    {
      v23 = 0;
    }
LABEL_19:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end

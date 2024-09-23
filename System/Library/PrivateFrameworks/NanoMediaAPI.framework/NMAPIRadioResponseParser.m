@implementation NMAPIRadioResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
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
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NMAPISectionResult *v29;
  void *v30;
  NMAPISectionResult *v31;
  void *v32;
  void *v33;
  void *v34;
  NMAPISectionResult *v35;
  void *v36;
  NMAPISectionResult *v37;
  void *v38;
  void *v39;
  NMAPISectionResult *v40;
  uint64_t v41;
  NSObject *v42;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id obj;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  NMAPIRadioResponseParser *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "objectForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NMAPIArrayWithObject(v8, CFSTR("data"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    NMAPIDictionaryInSingleObjectArray(v9, CFSTR("radioGrouping"), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NMAPIStringWithObject(v12, CFSTR("type"), a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("groupings")) & 1) != 0)
      {
        objc_msgSend(v11, "valueForKeyPath:", CFSTR("relationships.tabs.data"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NMAPIArrayWithObject(v14, CFSTR("tabs"), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NMAPIDictionaryWithObject(v16, CFSTR("tabsDictionary"), a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v17;
          if (v17)
          {
            v48 = v17;
            objc_msgSend(v17, "valueForKeyPath:", CFSTR("relationships.children.data"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            NMAPIArrayWithObject(v19, CFSTR("sectionsArray"), a4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = v17;
            if (v17)
            {
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v47 = v17;
              obj = v17;
              v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
              if (v52)
              {
                v50 = v13;
                v51 = *(_QWORD *)v55;
                v45 = v11;
                v46 = v6;
                v53 = v7;
                v44 = v15;
                while (2)
                {
                  for (i = 0; i != v52; ++i)
                  {
                    if (*(_QWORD *)v55 != v51)
                      objc_enumerationMutation(obj);
                    NMAPIDictionaryWithObject(*(void **)(*((_QWORD *)&v54 + 1) + 8 * i), CFSTR("section"), a4);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v22)
                      goto LABEL_36;
                    v23 = v22;
                    objc_msgSend(v22, "objectForKey:", CFSTR("id"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    NMAPIStringWithObject(v24, CFSTR("sectionIdentifier"), a4);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v25)
                    {

LABEL_36:
                      v17 = 0;
                      v11 = v45;
                      v6 = v46;
                      v7 = v53;
                      v15 = v44;
                      goto LABEL_37;
                    }
                    objc_msgSend(v23, "valueForKeyPath:", CFSTR("relationships.children.data"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    NMAPIOptionalArrayWithObject(v26, CFSTR("AppleRadio"), a4);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v27)
                    {
                      v28 = (void *)objc_msgSend(v23, "mutableCopy");
                      objc_msgSend(v28, "removeObjectForKey:", CFSTR("relationships"));
                      v29 = [NMAPISectionResult alloc];
                      v30 = (void *)objc_msgSend(v28, "copy");
                      v31 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v29, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v25, v30, v27);
                      objc_msgSend(v53, "addObject:", v31);

                    }
                    objc_msgSend(v23, "valueForKeyPath:", CFSTR("relationships.contents.data"), v44, v45, v46);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    NMAPIOptionalArrayWithObject(v32, CFSTR("FeaturedStations"), a4);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v33)
                    {
                      v34 = (void *)objc_msgSend(v23, "mutableCopy");
                      objc_msgSend(v34, "removeObjectForKey:", CFSTR("relationships"));
                      v35 = [NMAPISectionResult alloc];
                      v36 = (void *)objc_msgSend(v34, "copy");
                      v37 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v35, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v25, v36, v33);
                      objc_msgSend(v53, "addObject:", v37);

                    }
                    objc_msgSend(v23, "valueForKeyPath:", CFSTR("attributes.links"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    NMAPIOptionalArrayWithObject(v38, CFSTR("GenreLinks"), a4);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v39)
                    {
                      v40 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:]([NMAPISectionResult alloc], "initWithSectionIdentifier:sectionDictionary:itemsArray:", v25, v23, v39);
                      objc_msgSend(v53, "addObject:", v40);

                    }
                    v13 = v50;
                  }
                  v11 = v45;
                  v6 = v46;
                  v7 = v53;
                  v15 = v44;
                  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
                  if (v52)
                    continue;
                  break;
                }
              }

              v41 = objc_msgSend(v7, "count");
              if (a4 && !v41)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              v17 = (void *)objc_msgSend(v7, "copy");
LABEL_37:
              v20 = v47;
            }

            v18 = v48;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        NMLogForCategory(9);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v60 = self;
          v61 = 2112;
          v62 = v13;
          _os_log_impl(&dword_21A803000, v42, OS_LOG_TYPE_DEFAULT, "[NMAPIResponseParser] Invalid response for request (%@) due to unexpected type: %@", buf, 0x16u);
        }

        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end

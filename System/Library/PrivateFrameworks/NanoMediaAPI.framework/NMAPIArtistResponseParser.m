@implementation NMAPIArtistResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
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
  NMAPISectionResult *v18;
  NMAPISectionResult *v19;
  NMAPISectionResult *v20;
  void *v21;
  NMAPISectionResult *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NMAPISectionResult *v38;
  void *v39;
  NMAPISectionResult *v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id obj;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "objectForKey:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NMAPIArrayWithObject(v7, CFSTR("data"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    NMAPIDictionaryInSingleObjectArray(v8, CFSTR("section"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v21 = 0;
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIStringWithObject(v11, CFSTR("sectionIdentifier"), a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v21 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v47 = v8;
    objc_msgSend(v10, "valueForKeyPath:", CFSTR("relationships.default-playable-content"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIOptionalDictionaryWithObject(v13, CFSTR("defaultPlayableContent"), a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v14;
    if (v14)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("data"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NMAPIArrayWithObject(v15, CFSTR("defaultPlayableContentData"), a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v21 = 0;
LABEL_33:

        v8 = v47;
        goto LABEL_34;
      }
      v17 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("default-playable-content"));
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("views"));
      v18 = [NMAPISectionResult alloc];
      v19 = (NMAPISectionResult *)objc_msgSend(v17, "copy");
      v20 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v18, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v12, v19, v16);
      objc_msgSend(v6, "addObject:", v20);

    }
    else
    {
      v16 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v16, "removeObjectForKey:", CFSTR("views"));
      v22 = [NMAPISectionResult alloc];
      v17 = (void *)objc_msgSend(v16, "copy");
      v19 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v22, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v12, v17, MEMORY[0x24BDBD1A8]);
      objc_msgSend(v6, "addObject:", v19);
    }

    objc_msgSend(v10, "objectForKey:", CFSTR("views"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NMAPIDictionaryWithObject(v23, CFSTR("views"), a4);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v24;
    if (v24)
    {
      objc_msgSend(v10, "valueForKeyPath:", CFSTR("meta.views.order"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NMAPIArrayWithObject(v26, CFSTR("viewsOrder"), a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        obj = v27;
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v52;
          v44 = v5;
          v45 = v6;
          v42 = v27;
          v43 = v12;
          while (2)
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v52 != v50)
                objc_enumerationMutation(obj);
              objc_msgSend(v25, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              NMAPIDictionaryWithObject(v29, CFSTR("view"), a4);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
                goto LABEL_30;
              objc_msgSend(v30, "objectForKey:", CFSTR("data"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              NMAPIArrayWithObject(v31, CFSTR("viewItems"), a4);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v32)
                goto LABEL_29;
              if (objc_msgSend(v32, "count"))
              {
                objc_msgSend(v30, "valueForKeyPath:", CFSTR("attributes.title"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                NMAPIStringWithObject(v33, CFSTR("viewTitle"), a4);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v34)
                {
LABEL_29:

LABEL_30:
                  v21 = 0;
                  v5 = v44;
                  v6 = v45;
                  v27 = v42;
                  v12 = v43;
                  goto LABEL_31;
                }
                v35 = (void *)objc_msgSend(v30, "mutableCopy");
                objc_msgSend(v35, "removeObjectForKey:", CFSTR("data"));
                v36 = v10;
                v37 = v25;
                v38 = [NMAPISectionResult alloc];
                v39 = (void *)objc_msgSend(v35, "copy");
                v40 = -[NMAPISectionResult initWithSectionIdentifier:sectionDictionary:itemsArray:](v38, "initWithSectionIdentifier:sectionDictionary:itemsArray:", v34, v39, v32);
                objc_msgSend(v45, "addObject:", v40);

                v25 = v37;
                v10 = v36;

              }
            }
            v5 = v44;
            v6 = v45;
            v27 = v42;
            v12 = v43;
            v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
            if (v49)
              continue;
            break;
          }
        }

        v21 = (void *)objc_msgSend(v6, "copy");
      }
      else
      {
        v21 = 0;
      }
LABEL_31:

    }
    else
    {
      v21 = 0;
    }

    goto LABEL_33;
  }
  v21 = 0;
LABEL_36:

  return v21;
}

@end

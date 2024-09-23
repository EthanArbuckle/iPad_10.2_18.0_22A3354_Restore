@implementation SUUIStorePageDataConsumer

- (SUUIStorePageDataConsumer)init
{
  SUUIStorePageDataConsumer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIStorePageDataConsumer;
  v2 = -[SUUIStorePageDataConsumer init](&v4, sel_init);
  if (v2)
    v2->_storePageClass = (Class)objc_opt_class();
  return v2;
}

- (id)storePageWithDictionary:(id)a3
{
  return -[SUUIStorePageDataConsumer storePageWithDictionary:response:](self, "storePageWithDictionary:response:", a3, 0);
}

- (id)storePageWithDictionary:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SUUIUber *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  SUUIUber *v28;
  uint64_t v29;
  uint64_t v30;
  SUUIStorePageDataConsumer *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SUUIMediaComponent *v39;
  void *v40;
  SUUIEditorialComponent *v41;
  void *v42;
  id v43;
  id v44;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  SUUIUber *v51;
  _QWORD v52[4];
  id v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(-[SUUIStorePageDataConsumer storePageClass](self, "storePageClass"));
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPageURL:", v9);

  objc_msgSend(v6, "objectForKey:", CFSTR("pageType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setPageType:", v10);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (SUUIStorePageTypeIsProductPage(v11))
  {
    +[SSVURLDataConsumer consumer](SUUIProductPageDataConsumer, "consumer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "productPageWithDictionary:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDefaultPageFragment:", SUUIProductPageFragmentWithURL(v14));

      objc_msgSend(v8, "setProductPage:", v13);
      goto LABEL_50;
    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("pageTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setTitle:", v15);
  -[SUUIStorePageDataConsumer _backgroundArtworkWithDictionary:](self, "_backgroundArtworkWithDictionary:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v8, "setBackgroundArtwork:", v16);
  v49 = v16;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithStorePlatformData:", v6);
  objc_msgSend(v8, "setMetricsConfiguration:", v18);
  SSVGetMetricsPageDescriptionWithPlatformDictionary();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetricsPageDescription:", v19);

  objc_msgSend(v6, "objectForKey:", CFSTR("uber"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v20, "count")
    && (v21 = -[SUUIUber initWithUberDictionary:]([SUUIUber alloc], "initWithUberDictionary:", v20)) != 0)
  {
    v51 = v21;
    objc_msgSend(v8, "setUber:");
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("artist"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v50 = v7;
  v47 = v22;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v11)
    {
      v11 = CFSTR("artist");
      objc_msgSend(v8, "setPageType:", v11);
    }
    objc_msgSend(v22, "objectForKey:", CFSTR("name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "setTitle:", v23);
  }
  else
  {
    v23 = v20;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("storePlatfromData"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("storePlatformData"));
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  objc_opt_class();
  v48 = (void *)v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("storePlatformPrewarmDataKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v10;
    else
      v26 = 0;
    v28 = v51;
    v29 = objc_opt_class();
    SUUIStorePageItemsWithStorePlatformDictionary(v24, v26, v29);
    v27 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
    v10 = v23;
    v28 = v51;
  }
  if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("grouping")))
  {
    if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("room")))
    {
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("multiroom")))
      {
        -[SUUIStorePageDataConsumer _multiRoomComponentsForDictionary:items:](self, "_multiRoomComponentsForDictionary:items:", v6, v27);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("artist")))
      {
        -[SUUIStorePageDataConsumer _artistPageComponentsForDictionary:items:](self, "_artistPageComponentsForDictionary:items:", v6, v27);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("bannerRoom")))
      {
        -[SUUIStorePageDataConsumer _bannerRoomComponentsForDictionary:items:](self, "_bannerRoomComponentsForDictionary:items:", v6, v27);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("custom")))
      {
        -[SUUIStorePageDataConsumer _customPageComponentsForDictionary:items:](self, "_customPageComponentsForDictionary:items:", v6, v27);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("trailerRoom")))
      {
        v31 = self;
        v32 = v6;
        v33 = v27;
        v34 = 5;
        goto LABEL_34;
      }
      if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("search-doc-type")))
      {
        v35 = 0;
        goto LABEL_44;
      }
    }
    v31 = self;
    v32 = v6;
    v33 = v27;
    v34 = 0;
LABEL_34:
    -[SUUIStorePageDataConsumer _roomComponentsForDictionary:items:gridType:](v31, "_roomComponentsForDictionary:items:gridType:", v32, v33, v34);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  -[SUUIStorePageDataConsumer _groupingPageComponentsForDictionary:items:](self, "_groupingPageComponentsForDictionary:items:", v6, v27);
  v30 = objc_claimAutoreleasedReturnValue();
LABEL_43:
  v35 = (void *)v30;
LABEL_44:
  -[SUUIUber artworkProvider](v28, "artworkProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v11;
  v37 = (void *)v27;
  if (objc_msgSend(v36, "hasArtwork"))
  {
    v38 = 1;
    v39 = -[SUUIMediaComponent initWithArtworkProvider:appearance:]([SUUIMediaComponent alloc], "initWithArtworkProvider:appearance:", v36, 1);
    objc_msgSend(v35, "insertObject:atIndex:", v39, 0);

  }
  else
  {
    v38 = 0;
  }
  -[SUUIUber text](v28, "text");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "length"))
  {
    v41 = -[SUUIEditorialComponent initWithUberText:]([SUUIEditorialComponent alloc], "initWithUberText:", v40);
    objc_msgSend(v35, "insertObject:atIndex:", v41, v38);

  }
  objc_msgSend(v8, "setPageComponents:", v35);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", CFSTR("pageTitle"), CFSTR("pageType"), CFSTR("backgroundImage"), CFSTR("uber"), CFSTR("storePlatformData"), CFSTR("storePlatformPrewarmDataKey"), CFSTR("blocks"), CFSTR("contents"), CFSTR("children"), CFSTR("fcStructure"), CFSTR("charts"), CFSTR("genreId"), CFSTR("omnitureMetrics"), CFSTR("mediaType"), CFSTR("unAvailableContentIds"), CFSTR("allCategoriesLink"), CFSTR("metrics"),
                  CFSTR("metrics_base"),
                  CFSTR("metricsBase"),
                  CFSTR("mt"),
                  CFSTR("gratisIdentifiers"),
                  0);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __62__SUUIStorePageDataConsumer_storePageWithDictionary_response___block_invoke;
  v52[3] = &unk_2511FB6D8;
  v53 = v42;
  v54 = v8;
  v43 = v42;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v52);

  v13 = v49;
  v7 = v50;
  v11 = v46;
LABEL_50:

  v44 = v8;
  return v44;
}

void __62__SUUIStorePageDataConsumer_storePageWithDictionary_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setValue:forPageKey:", v5, v6);

}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  SUUIStorePage *v15;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v14 = 0;
    v15 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  objc_msgSend(v9, "allHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v12 || (objc_msgSend(v10, "MIMEType"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && objc_msgSend(v12, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_alloc_init(SUUIStorePage);
    -[SUUIStorePage setITMLData:](v15, "setITMLData:", v8);
    -[SUUIStorePage setITMLResponse:](v15, "setITMLResponse:", v10);
    -[SUUIStorePage setPageType:](v15, "setPageType:", CFSTR("itml"));
    v14 = 0;
  }
  else
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    objc_opt_class();
    v15 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUUIStorePageDataConsumer storePageWithDictionary:response:](self, "storePageWithDictionary:response:", v13, v10);
      v15 = (SUUIStorePage *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (a5)
  {
LABEL_12:
    if (!v15)
      *a5 = objc_retainAutorelease(v14);
  }
LABEL_14:

  return v15;
}

- (id)_artistPageComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  SUUISwooshPageComponent *v15;
  void *v16;
  SUUIGridComponent *v17;
  SUUIGridComponent *v18;
  SUUISwooshPageComponent *v19;
  SUUIGridComponent *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageDataConsumer _customPageComponentsForDictionary:items:](self, "_customPageComponentsForDictionary:items:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  objc_msgSend(v6, "objectForKey:", CFSTR("contentData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v6);
    objc_msgSend(v11, "setItems:", v7);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("iPadSoftware"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "setComponentDictionary:", v14);
        v15 = -[SUUISwooshPageComponent initWithFeaturedContentContext:kind:]([SUUISwooshPageComponent alloc], "initWithFeaturedContentContext:kind:", v11, 260);
        objc_msgSend(v8, "addObject:", v15);

      }
      objc_msgSend(v10, "objectForKey:", CFSTR("mobileSoftwareBundles"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "setComponentDictionary:", v16);
        v17 = -[SUUIGridComponent initWithFeaturedContentContext:kind:]([SUUIGridComponent alloc], "initWithFeaturedContentContext:kind:", v11, 0);
        objc_msgSend(v8, "addObject:", v17);

      }
      objc_msgSend(v10, "objectForKey:", CFSTR("iPhoneSoftware"));
      v18 = (SUUIGridComponent *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "setComponentDictionary:", v18);
        v19 = -[SUUISwooshPageComponent initWithFeaturedContentContext:kind:]([SUUISwooshPageComponent alloc], "initWithFeaturedContentContext:kind:", v11, 260);
        objc_msgSend(v8, "addObject:", v19);

      }
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("iPhoneSoftware"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "setComponentDictionary:", v14);
        v20 = -[SUUIGridComponent initWithFeaturedContentContext:kind:]([SUUIGridComponent alloc], "initWithFeaturedContentContext:kind:", v11, 0);
        objc_msgSend(v8, "addObject:", v20);

      }
      objc_msgSend(v10, "objectForKey:", CFSTR("mobileSoftwareBundles"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      objc_msgSend(v11, "setComponentDictionary:", v16);
      v18 = -[SUUIGridComponent initWithFeaturedContentContext:kind:]([SUUIGridComponent alloc], "initWithFeaturedContentContext:kind:", v11, 0);
      objc_msgSend(v8, "addObject:", v18);
    }

LABEL_16:
  }

  return v8;
}

- (id)_backgroundArtworkWithDictionary:(id)a3
{
  id v3;
  void *v4;
  SUUIArtwork *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("backgroundImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v4);
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("blocks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v15 = v4;
        v16 = v6;
        v10 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "objectForKey:", CFSTR("type"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend(v13, "isEqualToString:", CFSTR("page")))
              {
                objc_msgSend(v12, "objectForKey:", CFSTR("backgroundImage"));
                v4 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v5 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v4);
                else
                  v5 = 0;
                v6 = v16;

                goto LABEL_22;
              }

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            continue;
          break;
        }
        v5 = 0;
        v4 = v15;
        v6 = v16;
      }
      else
      {
        v5 = 0;
      }
LABEL_22:

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_bannerRoomComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  SUUIBrickItem *v20;
  SUUIGridComponent *v21;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageDataConsumer _customPageComponentsForDictionary:items:](self, "_customPageComponentsForDictionary:items:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  objc_msgSend(v6, "objectForKey:", CFSTR("contents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v6);
    v25 = v6;
    objc_msgSend(v11, "setComponentDictionary:", v6);
    v24 = v7;
    objc_msgSend(v11, "setItems:", v7);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v19, "setComponentDictionary:", v18);
            v20 = -[SUUIBrickItem initWithBannerRoomContext:]([SUUIBrickItem alloc], "initWithBannerRoomContext:", v19);
            if (v20)
              objc_msgSend(v12, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    v21 = -[SUUIGridComponent initWithBrickItems:]([SUUIGridComponent alloc], "initWithBrickItems:", v12);
    objc_msgSend(v8, "addObject:", v21);

    v6 = v25;
    v7 = v24;
    v10 = v23;
  }

  return v8;
}

- (id)_customPageComponentsForDictionary:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "objectForKey:", CFSTR("customBlocks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v7;
  if ((isKindOfClass & 1) != 0
    || (objc_msgSend(v5, "objectForKey:", CFSTR("children")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = v5,
        !v10))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("blocks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v7;
    v23 = v5;
    v11 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v5);
    objc_msgSend(v11, "setItems:", v6);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v10;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("type"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "setComponentDictionary:", v17);
              v19 = -[SUUIStorePageDataConsumer _newCustomPageComponentForBlockType:context:](self, "_newCustomPageComponentForBlockType:context:", v18, v11);
              if (v19)
                objc_msgSend(v24, "addObject:", v19);

            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v5 = v23;
    v10 = v21;
    v7 = v22;
  }

  return v24;
}

- (id)_groupingPageComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  SUUIStorePageDataConsumer *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  SUUIDividerPageComponent *v25;
  SUUIAccountButtonsComponent *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v6);
  objc_msgSend(v9, "setItems:", v7);
  objc_msgSend(v6, "objectForKey:", CFSTR("fcStructure"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v7;
    v31 = v6;
    v29 = v10;
    objc_msgSend(v10, "objectForKey:", CFSTR("model"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v28, 0);
    v12 = objc_msgSend(v11, "count");
    if (v12 >= 1)
    {
      v13 = v12;
      for (i = 0; i < v13; ++i)
      {
        objc_msgSend(v11, "objectAtIndex:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("fcKind"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v9, "setComponentDictionary:", v15),
                (v17 = -[SUUIStorePageDataConsumer _newFeaturedContentComponentForKind:context:](self, "_newFeaturedContentComponentForKind:context:", objc_msgSend(v16, "integerValue"), v9)) != 0))
          {
            v18 = v17;
            objc_msgSend(v8, "addObject:", v17);
          }
          else
          {
            objc_msgSend(v15, "objectForKey:", CFSTR("children"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = self;
              v20 = v9;
              v21 = v8;
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", i + 1, objc_msgSend(v18, "count"));
              objc_msgSend(v11, "insertObjects:atIndexes:", v18, v22);
              v13 = objc_msgSend(v11, "count");

              v8 = v21;
              v9 = v20;
              self = v19;
            }
          }

        }
      }
    }

    v7 = v30;
    v6 = v31;
    v10 = v29;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("subtitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("isAgeBandGrouping"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v24, "BOOLValue"))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ageBandGroupingTitle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = -[SUUIDividerPageComponent initWithDividerTitle:]([SUUIDividerPageComponent alloc], "initWithDividerTitle:", v23);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __72__SUUIStorePageDataConsumer__groupingPageComponentsForDictionary_items___block_invoke;
    v32[3] = &unk_2511FB700;
    v32[4] = &v33;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v8, "insertObject:atIndex:", v25, v34[3]);
    _Block_object_dispose(&v33, 8);

  }
  objc_msgSend(v9, "setComponentDictionary:", v6);
  v26 = -[SUUIAccountButtonsComponent initWithFeaturedContentContext:kind:]([SUUIAccountButtonsComponent alloc], "initWithFeaturedContentContext:kind:", v9, 0);
  objc_msgSend(v8, "addObject:", v26);

  return v8;
}

uint64_t __72__SUUIStorePageDataConsumer__groupingPageComponentsForDictionary_items___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "componentType");
  if (result != 6 && result != 13)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_multiRoomComponentsForDictionary:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  SUUISwooshPageComponent *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIStorePageDataConsumer _customPageComponentsForDictionary:items:](self, "_customPageComponentsForDictionary:items:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  objc_msgSend(v6, "objectForKey:", CFSTR("segments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v6;
    v11 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v6);
    objc_msgSend(v11, "setItems:", v7);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "setComponentDictionary:", v17);
            v18 = -[SUUISwooshPageComponent initWithRoomContext:]([SUUISwooshPageComponent alloc], "initWithRoomContext:", v11);
            objc_msgSend(v8, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v6 = v20;
  }

  return v8;
}

- (id)_newCustomPageComponentForBlockType:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = a4;
  v6 = SUUIPageComponentTypeForBlockType(a3);
  v7 = (objc_class *)SUUIPageComponentClassForComponentType(v6);
  if (v7)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithCustomPageContext:", v5);
  else
    v8 = 0;

  return v8;
}

- (id)_newFeaturedContentComponentForKind:(int64_t)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = a4;
  v6 = SUUIPageComponentTypeForFeaturedContentKind(a3);
  v7 = (objc_class *)SUUIPageComponentClassForComponentType(v6);
  if (v7)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithFeaturedContentContext:kind:", v5, a3);
  else
    v8 = 0;

  return v8;
}

- (id)_newPageComponentContextWithDictionary:(id)a3
{
  id v3;
  SUUIPageComponentContext *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(SUUIPageComponentContext);
  objc_msgSend(v3, "objectForKey:", CFSTR("storePlatformProfilesMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUUIPageComponentContext setPlatformKeyProfileOverrides:](v4, "setPlatformKeyProfileOverrides:", v5);
  objc_msgSend(v3, "objectForKey:", CFSTR("unAvailableContentIds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUUIPageComponentContext setUnavailableItemIdentifiers:](v4, "setUnavailableItemIdentifiers:", v6);

  return v4;
}

- (id)_roomComponentsForDictionary:(id)a3 items:(id)a4 gridType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SUUIMenuPageComponent *v13;
  id v14;
  SUUIGridComponent *v15;
  SUUIGridComponent *v16;
  void *v17;
  void *v18;
  SUUIMenuPageComponent *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIStorePageDataConsumer _customPageComponentsForDictionary:items:](self, "_customPageComponentsForDictionary:items:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v11);
  objc_msgSend(v8, "objectForKey:", CFSTR("sortData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = -[SUUIMenuPageComponent initWithRoomSortData:]([SUUIMenuPageComponent alloc], "initWithRoomSortData:", v12);
  else
    v13 = 0;
  v14 = -[SUUIStorePageDataConsumer _newPageComponentContextWithDictionary:](self, "_newPageComponentContextWithDictionary:", v8);
  objc_msgSend(v14, "setComponentDictionary:", v8);
  objc_msgSend(v14, "setItems:", v9);
  v15 = -[SUUIGridComponent initWithRoomContext:gridType:]([SUUIGridComponent alloc], "initWithRoomContext:gridType:", v14, a5);
  v16 = v15;
  if (v15)
  {
    if (v13)
    {
      v21[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIMenuPageComponent _setChildComponents:forIndex:](v13, "_setChildComponents:forIndex:", v17, -[SUUIMenuPageComponent defaultSelectedIndex](v13, "defaultSelectedIndex"));

      v18 = v10;
      v19 = v13;
    }
    else
    {
      v18 = v10;
      v19 = (SUUIMenuPageComponent *)v16;
    }
    objc_msgSend(v18, "addObject:", v19);
  }

  return v10;
}

- (Class)storePageClass
{
  return self->_storePageClass;
}

- (void)setStorePageClass:(Class)a3
{
  self->_storePageClass = a3;
}

@end

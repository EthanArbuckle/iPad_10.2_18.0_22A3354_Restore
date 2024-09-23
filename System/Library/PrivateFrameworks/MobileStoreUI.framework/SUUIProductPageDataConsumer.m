@implementation SUUIProductPageDataConsumer

- (id)productPageWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SUUIReleaseNote *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SUUIInAppPurchase *v20;
  void *v21;
  SUUIProductPageProductInfo *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  SUUIPageComponentContext *v28;
  SUUISwooshPageComponent *v29;
  SUUISwooshPageComponent *v30;
  void *v31;
  SUUIReviewConfiguration *v32;
  void *v33;
  void *v34;
  void *v35;
  SUUIUber *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SUUIProductPage *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v42 = objc_alloc_init(SUUIProductPage);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__31;
  v56 = __Block_byref_object_dispose__31;
  v57 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("storePlatformPrewarmDataKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("storePlatformData"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v40, "objectForKey:", v41), (v39 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v40, "objectForKey:", CFSTR("product"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(v40, "objectForKey:", CFSTR("product-dv-product"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v39, "objectForKey:", CFSTR("results"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __57__SUUIProductPageDataConsumer_productPageWithDictionary___block_invoke;
      v51[3] = &unk_2511F7A40;
      v51[4] = &v52;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v51);
    }

  }
  if (v53[5])
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("versionHistory"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      +[SUUIReleaseNote dateFormatter](SUUIReleaseNote, "dateFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v7 = v38;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v48;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v48 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v10);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = -[SUUIReleaseNote initWithReleaseNoteDictionary:dateFormatter:]([SUUIReleaseNote alloc], "initWithReleaseNoteDictionary:dateFormatter:", v11, v6);
              if (v12)
                objc_msgSend(v5, "addObject:", v12);

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        }
        while (v8);
      }

      objc_msgSend((id)v53[5], "_setVersionHistory:", v5);
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("topInAppPurchases"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v44;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[SUUIInAppPurchase initWithInAppPurchaseDictionary:]([SUUIInAppPurchase alloc], "initWithInAppPurchaseDictionary:", v19);
              if (v20)
                objc_msgSend(v14, "addObject:", v20);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
        }
        while (v16);
      }

      objc_msgSend((id)v53[5], "_setInAppPurchases:", v14);
    }
    -[SUUIProductPage setItem:](v42, "setItem:", v53[5]);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("infoSection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = -[SUUIProductPageProductInfo initWithInfoSectionDictionaries:]([SUUIProductPageProductInfo alloc], "initWithInfoSectionDictionaries:", v21);
    if (-[SUUIProductPageProductInfo numberOfEntries](v22, "numberOfEntries") >= 1)
      -[SUUIProductPage setProductInformation:](v42, "setProductInformation:", v22);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("customersAlsoBought"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("moreByThisDeveloper"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v26 = objc_opt_class();
    SUUIStorePageItemsWithStorePlatformDictionary(v40, v41, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(SUUIPageComponentContext);
    -[SUUIPageComponentContext setItems:](v28, "setItems:", v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUUIPageComponentContext setComponentDictionary:](v28, "setComponentDictionary:", v24);
      v29 = -[SUUISwooshPageComponent initWithRelatedContentContext:]([SUUISwooshPageComponent alloc], "initWithRelatedContentContext:", v28);
      objc_msgSend(v25, "addObject:", v29);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUUIPageComponentContext setComponentDictionary:](v28, "setComponentDictionary:", v23);
      v30 = -[SUUISwooshPageComponent initWithRelatedContentContext:]([SUUISwooshPageComponent alloc], "initWithRelatedContentContext:", v28);
      objc_msgSend(v25, "addObject:", v30);

    }
    -[SUUIProductPage setRelatedContentSwooshes:](v42, "setRelatedContentSwooshes:", v25);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("reviewsUrlsData"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = -[SUUIReviewConfiguration initWithConfigurationDictionary:]([SUUIReviewConfiguration alloc], "initWithConfigurationDictionary:", v31);
    -[SUUIProductPage setReviewConfiguration:](v42, "setReviewConfiguration:", v32);

  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithStorePlatformData:", v3);
  -[SUUIProductPage setMetricsConfiguration:](v42, "setMetricsConfiguration:", v33);
  SSVGetMetricsPageDescriptionWithPlatformDictionary();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPage setMetricsPageDescription:](v42, "setMetricsPageDescription:", v34);

  objc_msgSend(v3, "objectForKey:", CFSTR("uber"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = -[SUUIUber initWithUberDictionary:]([SUUIUber alloc], "initWithUberDictionary:", v35);
    -[SUUIProductPage setUber:](v42, "setUber:", v36);

  }
  _Block_object_dispose(&v52, 8);

  return v42;
}

void __57__SUUIProductPageDataConsumer_productPageWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  SUUIProductPageItem *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SUUIProductPageItem initWithLookupDictionary:]([SUUIProductPageItem alloc], "initWithLookupDictionary:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;

}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SUUIProductPage *v14;
  void *v15;
  uint64_t v16;
  id v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 || (objc_msgSend(v9, "MIMEType"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend(v11, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = objc_alloc_init(SUUIProductPage);
      -[SUUIProductPage setITMLData:](v14, "setITMLData:", v8);
      -[SUUIProductPage setITMLResponse:](v14, "setITMLResponse:", v9);
      v13 = 0;
      if (!a5)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[SUUIProductPageDataConsumer productPageWithDictionary:](self, "productPageWithDictionary:", v12),
        v14 = (SUUIProductPage *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "URL"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SUUIProductPage setPageURL:](v14, "setPageURL:", v15),
        v15,
        !v14))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("text/html")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 1, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v13 = (id)v16;
    }
    else
    {
      v14 = 0;
    }
  }

  if (a5)
  {
LABEL_12:
    if (!v14)
      *a5 = objc_retainAutorelease(v13);
  }
LABEL_14:

  return v14;
}

@end

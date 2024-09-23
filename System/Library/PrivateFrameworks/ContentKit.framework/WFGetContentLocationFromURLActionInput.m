@implementation WFGetContentLocationFromURLActionInput

void __WFGetContentLocationFromURLActionInput_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  void (*v8)(void);
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  if (a4)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_3:
    v8();
    goto LABEL_25;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_3;
  }
  v29 = a1;
  objc_msgSend(v7, "if_map:", &__block_literal_global_23275);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v10;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v7);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applicationsAvailableForOpeningURL:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "correspondingApplicationRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v21);

        }
      }
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count")
    && (unint64_t)objc_msgSend(v11, "count") < 2
    && !objc_msgSend(v11, "containsObject:", *MEMORY[0x24BEC1748]))
  {
    v25 = objc_alloc(MEMORY[0x24BDD9BD0]);
    objc_msgSend(v11, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v25, "initWithBundleIdentifier:", v26);

    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resolvedAppMatchingDescriptor:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFURLContentLocation locationWithURLs:error:](WFURLContentLocation, "locationWithURLs:error:", v22, &v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v24 = v30;
  if (!v23)
  {
    if (objc_msgSend(v7, "count"))
    {
      +[WFContentLocation webpagesLocation](WFAppContentLocation, "webpagesLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(v29 + 32) + 16))();

LABEL_25:
}

id __WFGetContentLocationFromURLActionInput_block_invoke_2(uint64_t a1, void *a2)
{
  return WFAppTransportSecuredURL(a2);
}

@end

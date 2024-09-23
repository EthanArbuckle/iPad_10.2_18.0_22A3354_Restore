@implementation WFGetEpisodesForPodcastAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8BB6D8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

}

- (void)getPodcastEpisodesWithIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__48868;
  v12[4] = __Block_byref_object_dispose__48869;
  v13 = 0;
  v7 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__WFGetEpisodesForPodcastAction_getPodcastEpisodesWithIdentifiers_withCompletion___block_invoke;
  v9[3] = &unk_24F8BB700;
  v8 = v6;
  v10 = v8;
  v11 = v12;
  objc_msgSend(v7, "lookupMediaType:withIdentifiers:withCompletion:", 301, v5, v9);

  _Block_object_dispose(v12, 8);
}

void __82__WFGetEpisodesForPodcastAction_getPodcastEpisodesWithIdentifiers_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v11;

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v8;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(a2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_24F8BB6B0;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "lookupMediaType:withIdentifiers:withCompletion:", 300, v6, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v27 = v5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relationships"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    WFEnforceClass(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("id"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
    }

    v24 = objc_msgSend(v17, "count");
    v25 = *(void **)(a1 + 32);
    if (v24)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
      v28[3] = &unk_24F8BB6B0;
      v28[4] = v25;
      objc_msgSend(v25, "getPodcastEpisodesWithIdentifiers:withCompletion:", v17, v28);
    }
    else
    {
      objc_msgSend(v25, "finishRunningWithError:", 0);
    }
    v5 = v27;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end

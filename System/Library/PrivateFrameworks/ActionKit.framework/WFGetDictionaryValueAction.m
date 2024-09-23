@implementation WFGetDictionaryValueAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WFGetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (void)setOutputWithValue:(id)a3 preferredDictionaryType:(id)a4 contentAttributionSet:(id)a5
{
  void *v6;
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
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE194D8], "itemsWithPropertyListObject:preferredDictionaryType:attributionSet:", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          -[WFGetDictionaryValueAction output](self, "output");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addItem:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

void __57__WFGetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGetDictionaryValueType"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("All Values")))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v9, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v12)
      {
        v13 = v12;
        v47 = v6;
        v48 = v10;
        v46 = v9;
        v14 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v56 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            v17 = *(void **)(a1 + 32);
            objc_msgSend(v8, "preferredFileType", v46, v47);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "attributionSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setOutputWithValue:preferredDictionaryType:contentAttributionSet:", v16, v18, v19);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        }
        while (v13);
LABEL_20:
        v9 = v46;
        v6 = v47;
LABEL_21:
        v10 = v48;
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("All Keys")))
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v9, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v20)
      {
        v21 = v20;
        v47 = v6;
        v48 = v10;
        v46 = v9;
        v22 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v52 != v22)
              objc_enumerationMutation(v11);
            v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
            v25 = *(void **)(a1 + 32);
            objc_msgSend(v8, "preferredFileType", v46, v47);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "attributionSet");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setOutputWithValue:preferredDictionaryType:contentAttributionSet:", v24, v26, v27);

          }
          v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v21);
        goto LABEL_20;
      }
LABEL_22:

LABEL_23:
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
LABEL_24:

      goto LABEL_25;
    }
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Value")))
      goto LABEL_23;
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFDictionaryKey"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length")
      || (objc_msgSend(v9, "objectForKey:", v11),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v28,
          v28))
    {
      objc_msgSend(v9, "objectForKey:", v11);
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)v29;
        v48 = v10;
        v31 = v9;
        v32 = v6;
        v33 = 0;
LABEL_33:
        v34 = *(void **)(a1 + 32);
        objc_msgSend(v8, "preferredFileType");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributionSet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setOutputWithValue:preferredDictionaryType:contentAttributionSet:", v30, v35, v36);

        v6 = v32;
        v9 = v31;
        goto LABEL_21;
      }
      v50 = 0;
      objc_msgSend(MEMORY[0x24BE19548], "evaluateKeyPath:onObject:error:", v11, v9, &v50);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v50;
      if (v30)
      {
        v48 = v10;
        v31 = v9;
        v32 = v6;
        goto LABEL_33;
      }
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v33);

    }
    else
    {
      v49 = *(void **)(a1 + 32);
      v37 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BEC4270];
      v59[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No Key Provided"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v39;
      v59[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No key was provided to the Get Dictionary Value action."));
      v40 = v6;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v41;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v42 = v10;
      v43 = v9;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 5, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "finishRunningWithError:", v45);

      v9 = v43;
      v10 = v42;

      v6 = v40;
    }

    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
LABEL_25:

}

@end

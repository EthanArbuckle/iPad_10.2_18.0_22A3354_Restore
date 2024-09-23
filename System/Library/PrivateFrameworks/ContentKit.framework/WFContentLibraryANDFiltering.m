@implementation WFContentLibraryANDFiltering

+ (void)getItemsMatchingPredicate:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(v8, "subpredicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "count"))
      {
        objc_msgSend(a1, "getItemsMatchingComparisonPredicates:resultHandler:", MEMORY[0x24BDBD1A8], v7);
        goto LABEL_20;
      }
      if (objc_msgSend(v8, "compoundPredicateType") == 1)
      {
        if (objc_msgSend(v9, "count") == 1)
        {
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "getItemsMatchingPredicate:resultHandler:", v10, v7);

LABEL_20:
          goto LABEL_21;
        }
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          v19 = v8;
          v11 = v9;
          v12 = (void *)objc_opt_new();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v21;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v13);
                WFCollapseANDCompoundPredicatesInsidePredicate(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v17));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObjectsFromArray:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            }
            while (v15);
          }

          objc_msgSend(a1, "getItemsMatchingComparisonPredicates:resultHandler:", v12, v7);
          v8 = v19;
          goto LABEL_20;
        }
      }
      else if (objc_msgSend(v8, "compoundPredicateType") == 2)
      {
        objc_msgSend(a1, "performCustomFilteringUsingORComparisonPredicates:resultHandler:", v9, v7);
        goto LABEL_20;
      }

    }
    v7[2](v7, 0);
    goto LABEL_24;
  }
  v24 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getItemsMatchingComparisonPredicates:resultHandler:", v8, v7);
LABEL_21:

LABEL_24:
}

+ (void)performCustomFilteringUsingORComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__15630;
  v13[4] = __Block_byref_object_dispose__15631;
  v14 = (id)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke;
  v12[3] = &unk_24C4E09E8;
  v12[4] = v13;
  v12[5] = a1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_3;
  v9[3] = &unk_24C4E0A10;
  v8 = v7;
  v10 = v8;
  v11 = v13;
  objc_msgSend(v6, "if_enumerateAsynchronouslyInSequence:completionHandler:", v12, v9);

  _Block_object_dispose(v13, 8);
}

+ (void)getItemsMatchingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  SEL v12;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke;
  v9[3] = &unk_24C4E0AA0;
  v10 = v7;
  v11 = a1;
  v12 = a2;
  v8 = v7;
  objc_msgSend(a1, "performCustomFilteringUsingComparisonPredicates:resultHandler:", a3, v9);

}

+ (Class)objectClass
{
  return 0;
}

+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

void __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  WFContentQuery *v9;
  void *v10;
  void *v11;
  WFContentQuery *v12;
  void (*v13)(void);
  _QWORD v14[4];
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v13();
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  objc_msgSend(v5, "if_map:", &__block_literal_global_15618);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [WFContentQuery alloc];
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentCompoundPredicate andPredicateWithSubpredicates:](WFContentCompoundPredicate, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFContentQuery initWithPredicate:](v9, "initWithPredicate:", v11);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_3;
  v14[3] = &unk_24C4E0A78;
  v15 = *(id *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 40);
  -[WFContentQuery runWithObjects:completionHandler:](v12, "runWithObjects:completionHandler:", v8, v14);

LABEL_7:
}

void __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_4;
  v4[3] = &__block_descriptor_48_e26__24__0__WFContentItem_8Q16l;
  v5 = *(_OWORD *)(a1 + 40);
  objc_msgSend(a2, "if_map:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

id __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForClass:", objc_msgSend(v3, "objectClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("WFContentLibraryFiltering.m"), 97, CFSTR("WFContentLibraryFiltering: item did not have an object of the expected class"));

  }
  return v5;
}

WFContentItem *__83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", a2);
}

void __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_2;
  v12[3] = &unk_24C4E09C0;
  v15 = a5;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v8;
  v14 = v9;
  v11 = v8;
  objc_msgSend(v10, "getItemsMatchingPredicate:resultHandler:", a2, v12);

}

void __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", a2);
  }
  else
  {
    **(_BYTE **)(a1 + 48) = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

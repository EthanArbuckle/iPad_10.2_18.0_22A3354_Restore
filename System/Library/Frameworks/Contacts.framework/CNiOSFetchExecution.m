@implementation CNiOSFetchExecution

+ (void)_extractContacts:(id *)a3 matchInfo:(id *)a4 fromBlockResults:(id)a5 containsNestedResults:(BOOL)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ABPropertyID v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  int v18;
  const void *v19;
  void *v20;
  CFTypeRef v21;
  const void *v22;
  unint64_t v23;
  id *location;
  void *context;
  id obj;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = (void *)MEMORY[0x19400675C]();
  if (v9)
  {
    context = v10;
    if (!a6)
    {
      v35[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v11;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v9;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v31;
      v14 = *MEMORY[0x1E0CF6090];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v16, "count"))
          {
            v17 = 1;
            v18 = 2;
            do
            {
              v19 = (const void *)objc_msgSend(v16, "objectAtIndex:", v17 - 1);
              objc_msgSend(v12, "addObject:", v19);
              if (a4)
              {
                objc_msgSend(v16, "objectAtIndex:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20 != v13)
                {
                  v21 = ABRecordCopyValue(v19, v14);
                  if (v21)
                  {
                    v22 = v21;
                    objc_msgSend(v29, "setObject:forKey:", v20, v21);
                    CFRelease(v22);
                  }
                }

              }
              v23 = v18 & 0xFFFFFFFE;
              v18 += 2;
              ++v17;
            }
            while (objc_msgSend(v16, "count") > v23);
          }
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v28);
    }

    if (a4)
      objc_storeStrong(a4, v29);
    if (location)
      objc_storeStrong(location, v12);

    v10 = context;
  }
  objc_autoreleasePoolPop(v10);
}

+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 options:(unint64_t)a5 addressBook:(void *)a6 progressiveResults:(id)a7 completion:(id)a8 environment:(id)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v15 = a7;
  v16 = a8;
  +[_CNABPredicateObservable observableWithPredicates:sortOrdering:options:addressBook:environment:]((uint64_t)_CNABPredicateObservable, a3, a4, a5, (uint64_t)a6, a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D13AF0];
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke;
  v32[3] = &unk_1E29FD610;
  v33 = v15;
  v34 = a1;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_2;
  v30[3] = &unk_1E29F9F70;
  v31 = v16;
  v25 = v19;
  v26 = 3221225472;
  v27 = __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_3;
  v28 = &unk_1E29F9A30;
  v29 = v31;
  v20 = v31;
  v21 = v15;
  objc_msgSend(v18, "observerWithResultBlock:completionBlock:failureBlock:", v32, v30, &v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subscribe:", v22, v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = 0;
    v4 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_extractContacts:matchInfo:fromBlockResults:containsNestedResults:", &v4, &v3, a2, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __125__CNiOSFetchExecution_contactsMatchingPredicates_sortOrdering_options_addressBook_progressiveResults_completion_environment___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)contactsMatchingPredicates:(id)a3 sortOrdering:(unsigned int)a4 matchInfos:(id *)a5 options:(unint64_t)a6 addressBook:(void *)a7 environment:(id)a8 error:(id *)a9
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  ABPropertyID v23;
  uint64_t i;
  void *v25;
  const void *v26;
  void *v27;
  void *v28;
  CFTypeRef v29;
  const void *v30;
  void *v32;
  id v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  +[_CNABPredicateObservable observableWithPredicates:sortOrdering:options:addressBook:environment:]((uint64_t)_CNABPredicateObservable, a3, a4, a6, (uint64_t)a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v12 = (void *)MEMORY[0x1E0D13AF0];
  objc_msgSend(v11, "completionHandlerAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "observerWithCompletionHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v10, "subscribe:", v14);

  objc_msgSend(v11, "future");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "result:", a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v11;
    v34 = v10;
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v32 = v17;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = *MEMORY[0x1E0CF6090];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v26 = (const void *)objc_msgSend(v25, "objectAtIndex:", 0, v32);
          objc_msgSend(v18, "addObject:", v26);
          if (a5)
          {
            objc_msgSend(v25, "objectAtIndex:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27 != v28)
            {
              v29 = ABRecordCopyValue(v26, v23);
              if (v29)
              {
                v30 = v29;
                objc_msgSend(v35, "setObject:forKey:", v27, v29);
                CFRelease(v30);
              }
            }

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v35);

    v11 = v33;
    v10 = v34;
    v17 = v32;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end

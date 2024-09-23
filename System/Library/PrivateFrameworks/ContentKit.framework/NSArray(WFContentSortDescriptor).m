@implementation NSArray(WFContentSortDescriptor)

- (uint64_t)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor completionHandler:
{
  return objc_msgSend(a1, "sortedArrayUsingContentSortDescriptors:propertySubstitutor:completionHandler:", a3, 0, a4);
}

- (void)sortedArrayUsingContentSortDescriptors:()WFContentSortDescriptor propertySubstitutor:completionHandler:
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void (**v10)(id, void *);
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  id v36;
  void (**v37)(id, void *);
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  void *v44;
  void *v45;
  _QWORD block[4];
  id v47;
  id v48;
  void (**v49)(id, void *);
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v8, "count"))
    {
      +[WFContentSortDescriptor randomSortDescriptor](WFContentSortDescriptor, "randomSortDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "containsObject:", v11);

      if (v12)
      {
        v13 = (void *)objc_msgSend(a1, "mutableCopy");
        if ((unint64_t)objc_msgSend(a1, "count") >= 2)
        {
          v14 = objc_msgSend(a1, "count");
          v15 = v14 - 1;
          if (v14 != 1)
          {
            do
            {
              objc_msgSend(v13, "exchangeObjectAtIndex:withObjectAtIndex:", v15, arc4random_uniform(v15 + 1));
              --v15;
            }
            while (v15);
          }
        }
        v16 = (void *)objc_msgSend(v13, "copy");
        v10[2](v10, v16);

      }
      v37 = v10;
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      obj = a1;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v65 != v19)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v21, CFSTR("object"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKey:", v22, v21);

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v18);
      }

      v44 = (void *)objc_opt_new();
      v23 = dispatch_group_create();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v38 = v8;
      v39 = v8;
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v41)
      {
        v40 = *(_QWORD *)v61;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v61 != v40)
              objc_enumerationMutation(v39);
            v43 = v24;
            v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v24);
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v26 = obj;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v57;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v57 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
                  dispatch_group_enter(v23);
                  objc_msgSend(v25, "property");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v9)
                  {
                    v9[2](v9, v31, v32);
                    v33 = objc_claimAutoreleasedReturnValue();

                    v32 = (void *)v33;
                  }
                  v50[0] = MEMORY[0x24BDAC760];
                  v50[1] = 3221225472;
                  v50[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke;
                  v50[3] = &unk_24C4E27D8;
                  v51 = v32;
                  v52 = v44;
                  v53 = v45;
                  v54 = v31;
                  v55 = v23;
                  v34 = v32;
                  objc_msgSend(v34, "getValueForObject:completionHandler:", v31, v50);

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
              }
              while (v28);
            }

            v24 = v43 + 1;
          }
          while (v43 + 1 != v41);
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v41);
      }

      dispatch_get_global_queue(0, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __113__NSArray_WFContentSortDescriptor__sortedArrayUsingContentSortDescriptors_propertySubstitutor_completionHandler___block_invoke_69;
      block[3] = &unk_24C4E2DD0;
      v47 = v45;
      v48 = v39;
      v10 = v37;
      v49 = v37;
      v36 = v45;
      dispatch_group_notify(v23, v35, block);

      v8 = v38;
    }
    else
    {
      v10[2](v10, a1);
    }
  }

}

@end

@implementation NATreeNode(HFAccessorySettingsAdditions)

- (id)hf_sortedAccessorySettingsChildren
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "childNodes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_226_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_nodeWithKeyPath:()HFAccessorySettingsAdditions
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAccessorySettingsEntity.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  objc_msgSend(a1, "representedObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v5);

  if (v8)
  {
    v9 = a1;
  }
  else
  {
    v25 = v6;
    v26 = v5;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v11);
          if (!v9)
          {

            goto LABEL_20;
          }
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("root")))
          {
            v18 = CFSTR("root");
            v19 = v14;
            v14 = v18;
          }
          else
          {
            -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR(".%@"), v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "childNodes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __63__NATreeNode_HFAccessorySettingsAdditions__hf_nodeWithKeyPath___block_invoke;
            v27[3] = &unk_1EA73F948;
            v14 = v20;
            v28 = v14;
            objc_msgSend(v21, "na_firstObjectPassingTest:", v27);
            v22 = objc_claimAutoreleasedReturnValue();

            v19 = v28;
            v9 = (id)v22;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v14 = 0;
    }

    v9 = v9;
LABEL_20:

    v6 = v25;
    v5 = v26;
  }

  return v9;
}

@end

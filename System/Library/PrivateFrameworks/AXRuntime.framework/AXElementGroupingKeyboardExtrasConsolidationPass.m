@implementation AXElementGroupingKeyboardExtrasConsolidationPass

- (BOOL)shouldTransformGroup:(id)a3 forGrouper:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isKeyboardContainer"))
    goto LABEL_15;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGroup") & 1) == 0)
  {

    goto LABEL_15;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canBeReplacedByChildren");

  if (!v7)
    goto LABEL_16;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
LABEL_15:
    LOBYTE(v7) = 0;
    goto LABEL_16;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  LOBYTE(v7) = 1;
  objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count", 0) - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v7 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isGroup");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
    LOBYTE(v7) = v7 ^ 1;
  }

LABEL_16:
  return v7 & 1;
}

- (id)transformGroup:(id)a3 forGrouper:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isKeyboardContainer") & 1) == 0 || (unint64_t)objc_msgSend(v4, "count") <= 1)
    goto LABEL_21;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGroup") & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canBeReplacedByChildren");

  if ((v7 & 1) == 0)
  {
LABEL_21:
    v20 = v4;
    goto LABEL_22;
  }
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count", 0) - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  objc_msgSend(v4, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v8, v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setGroupTraits:", objc_msgSend(v4, "groupTraits"));
  objc_msgSend(v20, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v4, "userDefinedScanningBehaviorTraits"));
  objc_msgSend(v4, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIdentifier:", v21);

LABEL_22:
  return v20;
}

@end

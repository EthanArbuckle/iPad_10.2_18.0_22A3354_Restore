@implementation AXElementGroupPruner

- (id)_prunedGroupable:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isGroup");
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v7, "firstChild");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isGroup"))
      {
        v10 = objc_msgSend(v9, "groupTraits");
        v11 = objc_msgSend(v7, "groupTraits");
        v12 = objc_msgSend(v9, "userDefinedScanningBehaviorTraits");
        v13 = objc_msgSend(v7, "userDefinedScanningBehaviorTraits");
        -[AXElementGroupPruner _prunedGroupable:](self, "_prunedGroupable:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isGroup"))
        {
          v14 = v11 | v10;
          objc_msgSend(v9, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setLabel:", v15);

          objc_msgSend(v9, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setIdentifier:", v16);

          objc_msgSend(v8, "setGroupTraits:", v14);
          objc_msgSend(v8, "setUserDefinedScanningBehaviorTraits:", v13 | v12);
        }
      }
      else
      {
        -[AXElementGroupPruner _prunedGroupable:](self, "_prunedGroupable:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = v7;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            -[AXElementGroupPruner _prunedGroupable:](self, "_prunedGroupable:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21), (_QWORD)v26);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v9, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v19);
      }

      objc_msgSend(v17, "label");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXElementGroup groupWithElements:label:](AXElementGroup, "groupWithElements:label:", v9, v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setGroupTraits:", objc_msgSend(v17, "groupTraits"));
      objc_msgSend(v8, "setUserDefinedScanningBehaviorTraits:", objc_msgSend(v17, "userDefinedScanningBehaviorTraits"));
      objc_msgSend(v17, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIdentifier:", v24);

    }
  }

  return v8;
}

- (id)pruneRootGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "elementCommunity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElementGroupPruner _prunedGroupable:](self, "_prunedGroupable:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isGroup"))
  {
    v7 = v6;

LABEL_5:
    v4 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v4, "setElementCommunity:", v5);

  return v4;
}

@end

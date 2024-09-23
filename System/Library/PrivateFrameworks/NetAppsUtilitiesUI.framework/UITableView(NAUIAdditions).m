@implementation UITableView(NAUIAdditions)

- (void)naui_applyGroupedItemDiff:()NAUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "groupOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    objc_msgSend(v4, "itemOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      goto LABEL_31;
  }
  objc_msgSend(a1, "beginUpdates");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v4, "groupOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        switch(objc_msgSend(v13, "type"))
        {
          case 0:
            v14 = (void *)MEMORY[0x24BDD15E0];
            objc_msgSend(v13, "fromIndex");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "reloadSections:withRowAnimation:", v16, 100);
            goto LABEL_14;
          case 1:
            v18 = (void *)MEMORY[0x24BDD15E0];
            objc_msgSend(v13, "toIndex");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "insertSections:withRowAnimation:", v16, 100);
            goto LABEL_14;
          case 2:
            v17 = (void *)MEMORY[0x24BDD15E0];
            objc_msgSend(v13, "fromIndex");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "indexSetWithIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "deleteSections:withRowAnimation:", v16, 100);
            goto LABEL_14;
          case 3:
            objc_msgSend(v13, "fromIndex");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v15, "unsignedIntegerValue");
            objc_msgSend(v13, "toIndex");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "moveSection:toSection:", v19, objc_msgSend(v16, "unsignedIntegerValue"));
LABEL_14:

            break;
          default:
            continue;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v10);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "itemOperations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        switch(objc_msgSend(v25, "type"))
        {
          case 0:
            objc_msgSend(v25, "toIndexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:", v27, 100);
            goto LABEL_27;
          case 1:
            objc_msgSend(v25, "toIndexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:", v27, 100);
            goto LABEL_27;
          case 2:
            objc_msgSend(v25, "fromIndexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:", v27, 100);
            goto LABEL_27;
          case 3:
            objc_msgSend(v25, "fromIndexPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "toIndexPath");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "moveRowAtIndexPath:toIndexPath:", v26, v27);
LABEL_27:

            break;
          default:
            continue;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v22);
  }

  objc_msgSend(a1, "endUpdates");
LABEL_31:

}

@end

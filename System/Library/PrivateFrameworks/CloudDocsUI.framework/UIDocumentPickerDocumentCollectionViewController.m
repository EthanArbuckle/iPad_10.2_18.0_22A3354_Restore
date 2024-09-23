@implementation UIDocumentPickerDocumentCollectionViewController

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("_UIDocumentPickerModelModifiedThumbnail"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "reloadItem:", 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BDF80E0], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cellForItemAtIndexPath:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "modelObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v15, "row"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "item");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 == v19)
          objc_msgSend(v17, "reloadItem:", 0);
        else
          objc_msgSend(v17, "setItem:", v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

}

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "setModelObjects:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BDF80D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertItemsAtIndexPaths:", v3);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BDF80D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteItemsAtIndexPaths:", v5);

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BDF80E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_3;
  v7[3] = &unk_24E43B328;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveItemAtIndexPath:toIndexPath:", v6, v5);

}

void __79___UIDocumentPickerDocumentCollectionViewController_performAction_forRow_view___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetSwipedRowWithCompletion:", 0);

}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction:forRow:view:", 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction:forRow:view:", 4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction:forRow:view:", 5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetSwipedRowWithCompletion:", 0);

}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "performAction:forRow:view:", 1, *(_QWORD *)(a1 + 32), a3);
}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_showMoreOptionsForRow:view:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "performAction:forRow:view:", 0, *(_QWORD *)(a1 + 32), a3);
}

void __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serviceViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldShowAction:", a3))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "isActionApplicableForItem:", a3);

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDF6CB8];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke_2;
      v12[3] = &unk_24E43B3C8;
      v9 = *(void **)(a1 + 40);
      v10 = *(void **)(a1 + 48);
      v12[4] = *(_QWORD *)(a1 + 32);
      v14 = a3;
      v13 = v9;
      objc_msgSend(v8, "actionWithTitle:style:handler:", v5, 0, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }
  else
  {

  }
}

void __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serviceViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:item:view:completion:", v2, v3, v4, 0);

}

@end

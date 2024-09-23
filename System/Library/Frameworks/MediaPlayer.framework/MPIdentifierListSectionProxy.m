@implementation MPIdentifierListSectionProxy

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
    (*(void (**)(void))(a1[7] + 16))();
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 24), "objectAtIndexedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  if (a4)
  {
    v10 = (void *)a1[6];
    objc_msgSend(*(id *)(a1[5] + 24), "objectAtIndexedSubscript:", a2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a2 < a2 + a3)
  {
    v6 = a2;
    do
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v7);

      ++v6;
      --a3;
    }
    while (a3);
  }
  v8 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v8, "itemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = *(void **)(a1 + 32);
    if (a2 == v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "insertItemsAtTail:", v13);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertItems:afterItem:", v13, v12);

    }
  }
  else
  {
    objc_msgSend(v8, "insertItemsAtHead:", v13);
  }

}

void __62___MPIdentifierListSectionProxy_applyChanges_itemLookupBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7 == v9)
    objc_msgSend(v8, "moveItemToHead:", v6);
  else
    objc_msgSend(v8, "moveItem:afterItem:", v6, v9);

}

@end

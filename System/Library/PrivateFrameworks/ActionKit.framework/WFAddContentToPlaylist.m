@implementation WFAddContentToPlaylist

void __WFAddContentToPlaylist_block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a2;
  if (a4)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __WFAddContentToPlaylist_block_invoke_2;
    v19[3] = &unk_24F8B3AF8;
    v20 = a1[5];
    v21 = v8;
    v22 = v7;
    v23 = a1[6];
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __WFAddContentToPlaylist_block_invoke_16;
    v13[3] = &unk_24F8B3B48;
    v14 = v22;
    v15 = a1[4];
    v18 = a1[7];
    v16 = a1[5];
    v17 = v21;
    v11 = v21;
    v12 = v22;
    objc_msgSend(v9, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v13);

  }
}

void __WFAddContentToPlaylist_block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void (**v23)(_QWORD);
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __WFAddContentToPlaylist_block_invoke_3;
    v30[3] = &unk_24F8B3A08;
    v31 = a1[4];
    v32 = a1[5];
    v33 = a1[6];
    v35 = v7;
    v34 = a1[7];
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v9 = (void *)getMPMediaItemClass_softClass_17548;
    v40 = getMPMediaItemClass_softClass_17548;
    if (!getMPMediaItemClass_softClass_17548)
    {
      v36[0] = v8;
      v36[1] = 3221225472;
      v36[2] = __getMPMediaItemClass_block_invoke_17549;
      v36[3] = &unk_24F8BB430;
      v36[4] = &v37;
      __getMPMediaItemClass_block_invoke_17549((uint64_t)v36);
      v9 = (void *)v38[3];
    }
    v10 = &v31;
    v11 = &v32;
    v12 = &v33;
    v13 = &v35;
    v14 = &v34;
    v15 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v37, 8);
    objc_msgSend(v6, "getObjectRepresentations:forClass:", v30, v15);
  }
  else
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __WFAddContentToPlaylist_block_invoke_7;
    aBlock[3] = &unk_24F8B3AA8;
    v10 = &v25;
    v25 = v6;
    v11 = &v29;
    v16 = v7;
    v29 = v16;
    v12 = &v26;
    v26 = a1[4];
    v13 = &v27;
    v27 = a1[6];
    v14 = &v28;
    v28 = a1[7];
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (a1[4] && objc_msgSend(a1[5], "count"))
    {
      v19 = a1[4];
      v18 = a1[5];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __WFAddContentToPlaylist_block_invoke_15;
      v20[3] = &unk_24F8B3AD0;
      v21 = v18;
      v22 = v16;
      v23 = v17;
      objc_msgSend(v19, "appendItems:completion:", v21, v20);

    }
    else
    {
      v17[2](v17);
    }

  }
}

void __WFAddContentToPlaylist_block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __WFAddContentToPlaylist_block_invoke_17;
  aBlock[3] = &unk_24F8B3B20;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 64);
  v6 = _Block_copy(aBlock);
  if (!v4 && *(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v8 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __WFAddContentToPlaylist_block_invoke_18;
    v9[3] = &unk_24F8B6920;
    v10 = v7;
    v11 = v6;
    objc_msgSend(v8, "appendItems:completion:", v10, v9);

  }
  else
  {
    (*((void (**)(void *, id))v6 + 2))(v6, v4);
  }

}

void __WFAddContentToPlaylist_block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __WFAddContentToPlaylist_block_invoke_18(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    getMPErrorDomain();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v7, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

void __WFAddContentToPlaylist_block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *(void **)(a1 + 40);
    v5 = a2;
    objc_msgSend(v4, "addObjectsFromArray:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __WFAddContentToPlaylist_block_invoke_4;
    v10[3] = &unk_24F8B39B8;
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __WFAddContentToPlaylist_block_invoke_6;
    v8[3] = &unk_24F8B39E0;
    v9 = *(id *)(a1 + 64);
    v7 = a2;
    objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v10, v8);

  }
}

void __WFAddContentToPlaylist_block_invoke_7(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __WFAddContentToPlaylist_block_invoke_8;
  v3[3] = &unk_24F8B3A80;
  v7 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "getObjectRepresentations:forClass:", v3, objc_opt_class());

}

void __WFAddContentToPlaylist_block_invoke_15(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)MEMORY[0x24BDD1540];
    getMPErrorDomain();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v7, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

void __WFAddContentToPlaylist_block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = MEMORY[0x24BDAC760];
    if (v10)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __WFAddContentToPlaylist_block_invoke_9;
      v20[3] = &unk_24F8B3A58;
      v21 = v10;
      v22 = *(id *)(a1 + 40);
      v18[0] = v11;
      v18[1] = 3221225472;
      v18[2] = __WFAddContentToPlaylist_block_invoke_11;
      v18[3] = &unk_24F8B39E0;
      v19 = *(id *)(a1 + 56);
      objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v20, v18);

      v12 = v21;
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __WFAddContentToPlaylist_block_invoke_12;
      v15[3] = &unk_24F8B3A58;
      v16 = *(id *)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __WFAddContentToPlaylist_block_invoke_14;
      v13[3] = &unk_24F8B39E0;
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v15, v13);

      v12 = v16;
    }

  }
}

void __WFAddContentToPlaylist_block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v6 = a2;
  v7 = a4;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "count");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __WFAddContentToPlaylist_block_invoke_10;
  v12[3] = &unk_24F8B3A30;
  objc_copyWeak(v15, &location);
  v15[1] = v8;
  v13 = *(id *)(a1 + 40);
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "addItemWithProductID:completionHandler:", v10, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

uint64_t __WFAddContentToPlaylist_block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __WFAddContentToPlaylist_block_invoke_12(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __WFAddContentToPlaylist_block_invoke_13;
  v10[3] = &unk_24F8BABC0;
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v9 = v6;
  objc_msgSend(v7, "addItemWithProductID:completionHandler:", v8, v10);

}

uint64_t __WFAddContentToPlaylist_block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __WFAddContentToPlaylist_block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObjectsFromArray:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __WFAddContentToPlaylist_block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v5 = (void *)getMPMediaPropertyPredicateClass_softClass_17555;
  v34 = getMPMediaPropertyPredicateClass_softClass_17555;
  if (!getMPMediaPropertyPredicateClass_softClass_17555)
  {
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = (uint64_t)__getMPMediaPropertyPredicateClass_block_invoke_17556;
    v29 = &unk_24F8BB430;
    v30 = &v31;
    __getMPMediaPropertyPredicateClass_block_invoke_17556((uint64_t)&v26);
    v5 = (void *)v32[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(WeakRetained, "persistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = (uint64_t)&v26;
  v28 = 0x2020000000;
  v8 = (_QWORD *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr_17558;
  v29 = (void *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr_17558;
  if (!getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr_17558)
  {
    v9 = MediaPlayerLibrary_17536();
    v8 = dlsym(v9, "MPMediaPlaylistPropertyPersistentID");
    *(_QWORD *)(v27 + 24) = v8;
    getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr_17558 = (uint64_t)v8;
  }
  _Block_object_dispose(&v26, 8);
  if (v8)
  {
    objc_msgSend(v6, "predicateWithValue:forProperty:", v7, *v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v11 = (void *)getMPMediaQueryClass_softClass_17561;
    v34 = getMPMediaQueryClass_softClass_17561;
    if (!getMPMediaQueryClass_softClass_17561)
    {
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = (uint64_t)__getMPMediaQueryClass_block_invoke_17562;
      v29 = &unk_24F8BB430;
      v30 = &v31;
      __getMPMediaQueryClass_block_invoke_17562((uint64_t)&v26);
      v11 = (void *)v32[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v31, 8);
    v13 = [v12 alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFilterPredicates:", v14);

    objc_msgSend(v15, "setGroupingType:", 6);
    objc_msgSend(v15, "collections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v17, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") - *(_QWORD *)(a1 + 56);

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v17, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subarrayWithRange:", v18, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v23);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaPlaylistPropertyPersistentID(void)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFAddToPlaylistAction.m"), 25, CFSTR("%s"), dlerror(), v26);

    __break(1u);
  }
}

void __WFAddContentToPlaylist_block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "playbackStoreID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __WFAddContentToPlaylist_block_invoke_5;
  v10[3] = &unk_24F8BABC0;
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v9 = v6;
  objc_msgSend(v7, "addItemWithProductID:completionHandler:", v8, v10);

}

uint64_t __WFAddContentToPlaylist_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __WFAddContentToPlaylist_block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObjectsFromArray:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

@implementation ML3MusicLibrary

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_2;
  v11[3] = &unk_24C364E20;
  v7 = *(_QWORD *)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v12 = v5;
  v8 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    BuildContainers(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
}

uint64_t __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_5(uint64_t result, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
    a2 = 1;
  *(_BYTE *)(v2 + 24) = a2;
  return result;
}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_6(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_7;
  block[3] = &unk_24C364F00;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = v2;
      v6 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v5;
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "responseData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __49__ML3MusicLibrary_HSAdditions__executeUpdateSQL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "executeUpdate:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = a1[5];
    objc_msgSend(v3, "error");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v10);
  }
  else
  {
    objc_msgSend(v3, "responseData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke_2;
    v11[3] = &unk_24C364DA8;
    v11[4] = a1[4];
    v12 = v7;
    v8 = v7;
    +[HSResponseDataParser enumerateItemsInResponseData:usingHandler:](HSResponseDataParser, "enumerateItemsInResponseData:usingHandler:", v6, v11);
    v9 = (void *)objc_msgSend(MEMORY[0x24BE6B1A0], "newWithPersistentID:inLibrary:", a1[6], a1[4]);
    objc_msgSend(v9, "setTracksWithPersistentIDs:notify:", v8, 0);
    (*(void (**)(void))(a1[5] + 16))();

  }
}

void __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unsigned __int8 *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = a3;
    v5 = *MEMORY[0x24BE6B140];
    v6 = (_QWORD *)(a2 + 16);
    do
    {
      if (*((_DWORD *)v6 - 4) == 1835624804)
      {
        v7 = -1;
        v8 = (unsigned __int8 *)*(v6 - 1);
        switch(*v6)
        {
          case 1:
            v7 = *v8;
            break;
          case 2:
            v7 = __rev16(*(unsigned __int16 *)v8);
            break;
          case 4:
            v7 = bswap32(*(_DWORD *)v8);
            break;
          case 8:
            v7 = (((unint64_t)*v8 << 56) | ((unint64_t)v8[1] << 48) | ((unint64_t)v8[2] << 40) | ((unint64_t)v8[3] << 32) | ((unint64_t)v8[4] << 24) | ((unint64_t)v8[5] << 16) | ((unint64_t)v8[6] << 8))
               + v8[7];
            break;
          default:
            break;
        }
        v9 = (void *)MEMORY[0x24BE6B1F8];
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInt64:", v5, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "anyInLibrary:predicate:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
      }
      v6 += 4;
      --v3;
    }
    while (v3);
  }
}

uint64_t __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke(uint64_t result, float a2)
{
  if (*(_QWORD *)(result + 32))
  {
    *(float *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(result + 40)
                                                                                          + 8)
                                                                              + 24)
                                                                   + a2;
    return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(result + 32) + 16))(*(_QWORD *)(result + 32), *(float *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
  }
  return result;
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_3;
  v11[3] = &unk_24C364E20;
  v7 = *(_QWORD *)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v12 = v5;
  v8 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "executeQuery:", CFSTR("SELECT 1 FROM item LIMIT 1"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "hasAtLeastOneRow");

}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || (objc_msgSend(*(id *)(a1 + 32), "updateOrderingLanguagesForCurrentLanguage"),
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1065353216;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "responseCode") == 200
      && (objc_msgSend(*(id *)(a1 + 32), "error"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v2,
          !v2))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "responseData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BDD1540]);
        v4 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", *MEMORY[0x24BE6B168], 0, 0);
      }
      v6 = v4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end

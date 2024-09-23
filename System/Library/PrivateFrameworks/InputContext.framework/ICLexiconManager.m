@implementation ICLexiconManager

void __42___ICLexiconManager__actuallyLoadLexicons__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  _DWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WeakRetained[43] | 4) == 4)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "doLoadLexicon");
    WeakRetained = v2;
  }

}

void __34___ICLexiconManager_loadLexicons___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "wordLexiconImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "phraseLexiconImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __35___ICLexiconManager_unloadLexicons__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    switch(objc_msgSend(*(id *)(a1 + 32), "contactLoadState"))
    {
      case 1u:
      case 3u:
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.1);
        objc_msgSend(WeakRetained, "unloadLexicons");
        break;
      case 2u:
      case 4u:
        objc_msgSend(WeakRetained[18], "removeAllObjects");
        objc_msgSend(WeakRetained, "changeContactLoadingState:", 0);
        break;
      default:
        break;
    }
    switch(objc_msgSend(*(id *)(a1 + 32), "namedEntityLoadState"))
    {
      case 1u:
      case 3u:
        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.1);
        objc_msgSend(WeakRetained, "unloadLexicons");
        break;
      case 2u:
      case 4u:
        objc_msgSend(WeakRetained[24], "removeAllEntities");
        objc_msgSend(WeakRetained, "changeNamedEntityLoadingState:", 0);
        break;
      default:
        break;
    }
  }

}

void __40___ICLexiconManager_addContactObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 19);
    v7 = WeakRetained;
    v5 = (void *)MEMORY[0x2276AC454](*(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "addObject:", v5);

    v6 = objc_msgSend(*(id *)(a1 + 32), "contactLoadState");
    if (v6 == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_6;
    }
    v3 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "doLoadLexicon");
LABEL_6:
      v3 = v7;
    }
  }

}

void __43___ICLexiconManager_removeContactObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[19];
    v5 = WeakRetained;
    v4 = (void *)MEMORY[0x2276AC454](*(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "removeObject:", v4);

    WeakRetained = v5;
  }

}

void __52___ICLexiconManager_addNamedEntitiesUpdateObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[20];
    v5 = WeakRetained;
    v4 = (void *)MEMORY[0x2276AC454](*(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "addObject:", v4);

    WeakRetained = v5;
  }

}

void __55___ICLexiconManager_removeNamedEntitiesUpdateObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[20];
    v5 = WeakRetained;
    v4 = (void *)MEMORY[0x2276AC454](*(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "removeObject:", v4);

    WeakRetained = v5;
  }

}

void __39___ICLexiconManager_resetNamedEntities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  __int16 v5[8];

  _ICPersNamedEntityOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, " Named Entities: resetNamedEntities", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[24], "removeAllEntities");

}

void __39___ICLexiconManager_setupNamedEntities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _ICPersNamedEntityOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: setupNamedEntities", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "changeNamedEntityLoadingState:", 1);

}

void __39___ICLexiconManager_handleNamedEntity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;

  _ICPersNamedEntityOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39___ICLexiconManager_handleNamedEntity___block_invoke_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[24], "addEntity:isDurable:", *(_QWORD *)(a1 + 32), 1);

}

void __42___ICLexiconManager_completeNamedEntities__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _ICPersNamedEntityOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(WeakRetained[24], "durableEntitiesAdded");
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: Reloading recents and processing %lu named entities entities", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained[24], "reloadRecents");
    objc_msgSend(WeakRetained, "changeNamedEntityLoadingState:", 2);
    objc_msgSend(WeakRetained, "_notifyNamedEntitiesUpdateObservers");
  }
  _ICPersNamedEntityOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_22716D000, v4, OS_LOG_TYPE_DEFAULT, "Named Entities: completeNamedEntities", (uint8_t *)&v5, 2u);
  }

}

void __45___ICLexiconManager_setupRecentNamedEntities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  _ICPersNamedEntityOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: setupRecentNamedEntities", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "changeNamedEntityLoadingState:", 3);

}

void __45___ICLexiconManager_handleRecentNamedEntity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;

  _ICPersNamedEntityOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45___ICLexiconManager_handleRecentNamedEntity___block_invoke_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[24], "addEntity:isDurable:", *(_QWORD *)(a1 + 32), 0);

}

void __48___ICLexiconManager_completeRecentNamedEntities__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _ICPersNamedEntityOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(WeakRetained[24], "recentEntitiesAdded");
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "Named Entities: processing %lu recent named entities entities", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "changeNamedEntityLoadingState:", 2);
    objc_msgSend(WeakRetained, "_notifyNamedEntitiesUpdateObservers");
  }
  _ICPersNamedEntityOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_22716D000, v4, OS_LOG_TYPE_DEFAULT, "Named Entities: completeNamedEntities", (uint8_t *)&v5, 2u);
  }

}

void __34___ICLexiconManager_setupContacts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  __int16 v5[8];

  _ICPersContactOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "Contacts: setupContacts", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[18], "removeAllObjects");

}

void __35___ICLexiconManager_handleContact___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  _ICPersContactOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35___ICLexiconManager_handleContact___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "addContact:", *(_QWORD *)(a1 + 32));

}

void __37___ICLexiconManager_completeContacts__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "changeContactLoadingState:", 2);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _ICPersContactOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(WeakRetained[18], "count");
      v5 = objc_msgSend(WeakRetained[19], "count");
      *(_DWORD *)buf = 134218240;
      v18 = v4;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_22716D000, v3, OS_LOG_TYPE_DEFAULT, "Contacts: sending %lu contacts to %lu observers", buf, 0x16u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = WeakRetained[19];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  _ICPersContactOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22716D000, v11, OS_LOG_TYPE_DEFAULT, "Contacts: completeContacts", buf, 2u);
  }

}

void __40___ICLexiconManager_setupRecentContacts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _DWORD *WeakRetained;
  _DWORD *v4;
  uint8_t v5[16];

  _ICPersContactOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_DEFAULT, "setupRecentContacts", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "contactLoadState") != 4)
      objc_msgSend(v4, "changeContactLoadingState:", 3);
    v4[42] = 0;
  }

}

void __41___ICLexiconManager_handleRecentContact___block_invoke(id *a1)
{
  int v2;
  _DWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && objc_msgSend(a1[4], "contactLoadState") != 4
    && objc_msgSend(a1[4], "contactLoadState"))
  {
    v2 = objc_msgSend(a1[5], "changeType");
    if (v2 != 1)
    {
      if (v2 != 2)
      {
        if (v2 == 3)
          objc_msgSend(a1[4], "removeContact:", a1[5]);
        goto LABEL_10;
      }
      objc_msgSend(a1[4], "removeContact:", a1[5]);
    }
    objc_msgSend(a1[4], "addContact:", a1[5]);
LABEL_10:
    ++WeakRetained[42];
  }

}

void __43___ICLexiconManager_completeRecentContacts__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "contactLoadState") != 4
    && objc_msgSend(*(id *)(a1 + 32), "contactLoadState"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "changeContactLoadingState:", 2);
      _ICPersContactOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *((_DWORD *)v3 + 42);
        v6 = objc_msgSend(*((id *)v3 + 19), "count");
        *(_DWORD *)buf = 67109376;
        v19 = v5;
        v20 = 2048;
        v21 = v6;
        _os_log_impl(&dword_22716D000, v4, OS_LOG_TYPE_DEFAULT, "Contacts: %d changes received, if > 0, notifying %lu observers", buf, 0x12u);
      }

      if (*((int *)v3 + 42) >= 1)
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v7 = *((id *)v3 + 19);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v14;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v7);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v9);
        }

      }
    }

  }
  _ICPersContactOSLogFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22716D000, v12, OS_LOG_TYPE_DEFAULT, "completeRecentContacts", buf, 2u);
  }

}

void __41___ICLexiconManager_printLexiconToNSLog___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (const void *)LXEntryCopyString();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  CFRelease(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", CFSTR(" "));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __32___ICLexiconManager_countWords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", &stru_24EF71F58);
}

uint64_t __36___ICLexiconManager_getContactCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __41___ICLexiconManager_debugEntityLoadState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 176);
  return result;
}

void __39___ICLexiconManager_handleNamedEntity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_22716D000, v0, v1, "Named Entities: handleNamedEntity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __45___ICLexiconManager_handleRecentNamedEntity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_22716D000, v0, v1, "Named Entities: handleRecentNamedEntity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __35___ICLexiconManager_handleContact___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_22716D000, v0, v1, "Contacts: handleContact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

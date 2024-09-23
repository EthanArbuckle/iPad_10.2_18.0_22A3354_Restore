@implementation WKWebExtensionRegisteredScriptsSQLiteStore

id __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("id"));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v8, (id *)(a1 + 48));
  v4 = v8;
  if (v8)
  {
    if (objc_msgSend(v3, "length"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v4);
      objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_3;
      v6[3] = &unk_1E34AAD98;
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(id *)(a1 + 40);
      objc_msgSend(v4, "addScripts:completionHandler:", v5, v6);

    }
    CFRelease(v4);
  }

}

uint64_t __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke(id *a1)
{
  _QWORD *v1;
  char v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  _QWORD *v21;
  id obja;
  id obj;
  _QWORD block[4];
  __CFString *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v33, a1 + 6);
  v1 = v33;
  if (v33)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v33);
    v32 = 0;
    v21 = v1;
    v2 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", &v32, 0);
    v20 = (__CFString *)v32;

    if ((v2 & 1) != 0)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v1);
      v19 = *(void **)(objc_claimAutoreleasedReturnValue() + 24);
      v3 = (void *)MEMORY[0x1E0CB3940];
      obja = a1[4];
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obja, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v3;
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      v34 = 0u;
      obj = obja;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v35 != v6)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v9);

          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
        }
        while (v5);
      }

      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringWithFormat:", CFSTR("DELETE FROM registered_scripts WHERE key in (%@)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v19, 0, v11);

      if (v12 != 101)
      {
        v13 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v21);
          objc_claimAutoreleasedReturnValue();
          v17 = v21[1];
          *(_DWORD *)buf = 138477827;
          v39 = v17;
          _os_log_error_impl(&dword_196BCC000, v13, OS_LOG_TYPE_ERROR, "Failed to delete scripts for extension %{private}@.", buf, 0xCu);

        }
        v20 = CFSTR("Failed to delete scripts from registered content scripts storage.");
      }
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v21);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_deleteDatabaseIfEmpty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_10;
      block[3] = &unk_1E34AAE90;
      v28 = a1[5];
      v15 = v20;
      v26 = v15;
      v27 = v14;
      v16 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_2;
      v29[3] = &unk_1E34AAE68;
      v31 = a1[5];
      v15 = v20;
      v30 = v15;
      dispatch_async(MEMORY[0x1E0C80D38], v29);

      v16 = v31;
    }

    if (v33)
      CFRelease(v33);
  }
}

uint64_t __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  v4 = 32;
  if (!v3)
    v4 = 40;
  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + v4));
}

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("persistAcrossSessions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  WTF::dynamic_objc_cast<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

void __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_2(id *a1)
{
  id v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id *v16;
  _QWORD block[6];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[6];
  id v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v25, a1 + 6);
  v2 = v25;
  if (v25)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v25);
    v24 = 0;
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:", &v24);
    v4 = v24;

    if ((v3 & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = a1[4];
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v20;
        do
        {
          v8 = 0;
          v9 = v4;
          do
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
            v11 = v25;
            WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v25);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v11[3];
            v18 = v9;
            objc_msgSend(v13, "_insertScript:inDatabase:errorMessage:", v10, v14, &v18);
            v4 = v18;

            ++v8;
            v9 = v4;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v6);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_4;
      block[3] = &unk_1E34AAE68;
      block[5] = a1[5];
      v15 = v4;
      block[4] = v15;
      v16 = (id *)block;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_3;
      v23[3] = &unk_1E34AAE68;
      v23[5] = a1[5];
      v15 = v4;
      v23[4] = v15;
      v16 = (id *)v23;
    }
    dispatch_async(MEMORY[0x1E0C80D38], v16);

    if (v25)
      CFRelease(v25);
  }
}

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v12, (id *)(a1 + 40));
  v2 = v12;
  WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v12);
  v11 = 0;
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_getScriptsWithOutErrorMessage:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E34AAE90;
  v10 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v4;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  if (v2)
    CFRelease(v2);

}

uint64_t __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

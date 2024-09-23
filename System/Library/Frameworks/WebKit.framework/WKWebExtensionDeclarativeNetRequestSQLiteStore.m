@implementation WKWebExtensionDeclarativeNetRequestSQLiteStore

void __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  v3 = a2;
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v8, (id *)(a1 + 48));
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
      v6[2] = __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke_2;
      v6[3] = &unk_1E34AAD98;
      v5 = *(_QWORD *)(a1 + 32);
      v7 = *(id *)(a1 + 40);
      objc_msgSend(v4, "addRules:completionHandler:", v5, v6);

    }
    CFRelease(v4);
  }

}

uint64_t __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke(id *a1)
{
  id v1;
  char v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id obj;
  id obja;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD block[4];
  id v57;
  id v58;
  id v59;
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v60, a1 + 6);
  v1 = v60;
  if (v60)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v60);
    v59 = 0;
    obj = v1;
    v2 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:", &v59);
    v3 = v59;

    if ((v2 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_2;
      block[3] = &unk_1E34AAE68;
      v58 = a1[5];
      v27 = v3;
      v57 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v4 = v58;
LABEL_35:

      if (v60)
        CFRelease(v60);
      return;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v5 = a1[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v7)
            objc_enumerationMutation(v5);
          WebKit::objectForKey<NSNumber>(*(void **)(*((_QWORD *)&v52 + 1) + 8 * i), (uint64_t)CFSTR("id"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v6);
    }

    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10[3];
    v12 = (void *)MEMORY[0x1E0CB3940];
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v10);
    v13 = *(_QWORD *)(objc_claimAutoreleasedReturnValue() + 56);
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("SELECT id FROM %@ WHERE id in (%@)"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WebKit::SQLiteDatabaseFetch<>(v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "int64AtIndex:", 0));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v22);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v17, "count") == 1)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
      v24 = *(_QWORD *)(objc_claimAutoreleasedReturnValue() + 48);
      objc_msgSend(v17, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to add %@ rules. Rule %@ does not have a unique ID."), v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v17, "count") < 2)
      {
LABEL_23:
        if (objc_msgSend(v3, "length"))
        {
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_3;
          v47[3] = &unk_1E34AAE68;
          v47[5] = a1[5];
          v27 = v3;
          v47[4] = v27;
          v31 = (id *)v47;
        }
        else
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          obja = a1[4];
          v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
          if (v32)
          {
            v33 = *(_QWORD *)v44;
LABEL_27:
            v34 = 0;
            v35 = v3;
            while (1)
            {
              if (*(_QWORD *)v44 != v33)
                objc_enumerationMutation(obja);
              v36 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v34);
              v37 = v60;
              WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v60);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v38);
              objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_insertRule:inDatabase:", v36, v37[3]);
              v3 = (id)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v3, "length"))
                break;
              ++v34;
              v35 = v3;
              if (v32 == v34)
              {
                v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
                if (v32)
                  goto LABEL_27;
                break;
              }
            }
          }

          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_4;
          v42[3] = &unk_1E34AAE68;
          v42[5] = a1[5];
          v27 = v3;
          v42[4] = v27;
          v31 = (id *)v42;
        }
        dispatch_async(MEMORY[0x1E0C80D38], v31);

        goto LABEL_35;
      }
      v28 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
      v29 = *(_QWORD *)(objc_claimAutoreleasedReturnValue() + 48);
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Failed to add %@ rules. Some rules do not have unique IDs (%@)."), v29, v25);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v26;

    v3 = v30;
    goto LABEL_23;
  }
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke(id *a1)
{
  _QWORD *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v26, a1 + 6);
  v2 = v26;
  if (v26)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v26);
    v25 = 0;
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_openDatabaseIfNecessaryReturningErrorMessage:createIfNecessary:", &v25, 0);
    v4 = v25;

    if ((v3 & 1) != 0)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)v2[3];
      v7 = (void *)MEMORY[0x1E0CB3940];
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      objc_claimAutoreleasedReturnValue();
      v8 = v2[7];
      objc_msgSend(a1[4], "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE id in (%@)"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v10);

      if ((_DWORD)v6 != 101)
      {
        v11 = (id)qword_1ECE710C8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          objc_claimAutoreleasedReturnValue();
          v17 = v2[1];
          *(_DWORD *)buf = 138477827;
          v28 = v17;
          _os_log_error_impl(&dword_196BCC000, v11, OS_LOG_TYPE_ERROR, "Failed to delete rules for extension %{private}@.", buf, 0xCu);

        }
        v12 = (void *)MEMORY[0x1E0CB3940];
        WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to delete rules from %@ rules storage."), v2[6]);
        v13 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v13;
      }
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_deleteDatabaseIfEmpty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_23;
      block[3] = &unk_1E34AAE90;
      v21 = a1[5];
      v15 = v4;
      v19 = v15;
      v20 = v14;
      v16 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_2;
      v22[3] = &unk_1E34AAE68;
      v24 = a1[5];
      v15 = v4;
      v23 = v15;
      dispatch_async(MEMORY[0x1E0C80D38], v22);

      v16 = v24;
    }

    if (v26)
      CFRelease(v26);
  }
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_23(uint64_t a1)
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

void __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v13, (id *)(a1 + 40));
  v2 = v13;
  if (v13)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v13);
    v12 = 0;
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_getRulesWithOutErrorMessage:", &v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E34AAE90;
    v5 = *(id *)(a1 + 32);
    v10 = v4;
    v11 = v5;
    v9 = v3;
    v6 = v4;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    CFRelease(v2);
  }
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

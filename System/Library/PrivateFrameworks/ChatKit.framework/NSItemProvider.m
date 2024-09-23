@implementation NSItemProvider

uint64_t __80__NSItemProvider_MapUtils____ck_itemProviderForAppleMapsCoordinateURL_vCardURL___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__ck_loadDataForAppleMapVCard__sUnarchiveClasses;
  __ck_loadDataForAppleMapVCard__sUnarchiveClasses = v2;

}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Loading data for location from NSItemProvider failed with error: %@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", __ck_loadDataForAppleMapVCard__sUnarchiveClasses, v5, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    v10 = v9;
    if (!v8 || v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Unexpected nil unarchiving location info with error: %@", buf, 0xCu);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.messages.mapvcard"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v11, "dataWithContentsOfURL:options:error:", v12, 1, &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;

      if (!v13 || v10)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v10;
            _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Unable to archive vCardData with error: %@", buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_50;
        block[3] = &unk_1E274CF30;
        v20 = *(id *)(a1 + 32);
        v18 = v13;
        v19 = v8;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }

  }
}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("com.apple.messages.mapvcard.name"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v1, v3, 0);

}

@end

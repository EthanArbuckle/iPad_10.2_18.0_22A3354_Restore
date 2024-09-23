@implementation NSItemProvider(MapUtils)

+ (id)__ck_itemProviderForAppleMapsCoordinateURL:()MapUtils vCardURL:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v26;
    v10 = v9;
    if (!v8 || v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Unexpected nil loading vCard data with error: %@", buf, 0xCu);
        }

      }
      v18 = 0;
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v7);
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LOCATION_FILE_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSuggestedName:", v13);

      v27[0] = CFSTR("com.apple.messages.mapvcard.name");
      objc_msgSend(v7, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v14;
      v28[1] = v7;
      v27[1] = CFSTR("com.apple.messages.mapvcard");
      v27[2] = CFSTR("com.apple.messages.maputi");
      v28[2] = CFSTR("com.apple.messages.maputi");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      v10 = v17;
      if (!v16 || v17)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Unexpected nil archiving vCard data with error: %@", buf, 0xCu);
          }

        }
        v18 = 0;
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __80__NSItemProvider_MapUtils____ck_itemProviderForAppleMapsCoordinateURL_vCardURL___block_invoke;
        v23[3] = &unk_1E274B9C8;
        v24 = v16;
        objc_msgSend(v11, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.messages.maputi"), 0, v23);
        v18 = v11;

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Unexpected nil parameter", buf, 2u);
      }

    }
    v18 = 0;
  }

  return v18;
}

- (void)__ck_loadDataForAppleMapVCard:()MapUtils
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (__ck_loadDataForAppleMapVCard__onceToken != -1)
    dispatch_once(&__ck_loadDataForAppleMapVCard__onceToken, &__block_literal_global_68);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_2;
  v7[3] = &unk_1E274F9C0;
  v8 = v4;
  v5 = v4;
  v6 = (id)objc_msgSend(a1, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.messages.maputi"), v7);

}

@end

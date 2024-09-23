@implementation MapsSuggestionsRealContactsConnector

- (id)store
{
  if (a1)
  {
    if (qword_1ED22EE70 != -1)
      dispatch_once(&qword_1ED22EE70, &__block_literal_global);
    a1 = (id)_MergedGlobals_24;
  }
  return a1;
}

void __45__MapsSuggestionsRealContactsConnector_store__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v0;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)startListeningForChanges
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_receivedNotification_, *MEMORY[0x1E0C96878], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_receivedNotification_, MapsContactsAuthorizationGrantedNotification, 0);

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsRealContactsConnector.m";
      v9 = 1026;
      v10 = 53;
      v11 = 2082;
      v12 = "-[MapsSuggestionsRealContactsConnector startListeningForChanges]";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)stopListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MapsSuggestionsRealContactsConnector store](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", a3, a4);
}

- (void)receivedNotification:(id)a3
{
  id v4;
  NSObject *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  int v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "name");
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Received notification: %@", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C96878]);

      if ((v10 & 1) != 0)
      {
        -[NSObject contactsDidUpdate](WeakRetained, "contactsDidUpdate");
      }
      else
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "name");
          v13 = (char *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v13;
          _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Got unknown notification: %@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
    else
    {
      v11 = v6;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 136446722;
        v15 = "MapsSuggestionsRealContactsConnector.m";
        v16 = 1026;
        v17 = 88;
        v18 = 2082;
        v19 = "-[MapsSuggestionsRealContactsConnector receivedNotification:]";
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
      }

      WeakRetained = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      v16 = 1024;
      v17 = 86;
      v18 = 2082;
      v19 = "-[MapsSuggestionsRealContactsConnector receivedNotification:]";
      v20 = 2082;
      v21 = "nil == (notification)";
      _os_log_impl(&dword_1A427D000, WeakRetained, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a notification", (uint8_t *)&v14, 0x26u);
    }
  }

}

- (id)contactForIdentifier:(id)a3
{
  return -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, a3, 0);
}

- (id)_contactForIdentifier:(void *)a3 usingRequest:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  id v29;
  _QWORD v30[9];
  _BYTE v31[40];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
LABEL_14:
    v23 = 0;
    goto LABEL_17;
  }
  if (!v5)
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v31 = 136446978;
      *(_QWORD *)&v31[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 110;
      *(_WORD *)&v31[18] = 2082;
      *(_QWORD *)&v31[20] = "-[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:]";
      *(_WORD *)&v31[28] = 2082;
      *(_QWORD *)&v31[30] = "nil == (identifier)";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier", v31, 0x26u);
    }

    goto LABEL_14;
  }
  *(_QWORD *)v31 = 0;
  *(_QWORD *)&v31[8] = v31;
  *(_QWORD *)&v31[16] = 0x3032000000;
  *(_QWORD *)&v31[24] = __Block_byref_object_copy__0;
  *(_QWORD *)&v31[32] = __Block_byref_object_dispose__0;
  v32 = 0;
  v8 = v6;
  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C97210]);
    v10 = *MEMORY[0x1E0C966C0];
    v30[0] = *MEMORY[0x1E0C966D0];
    v30[1] = v10;
    v11 = *MEMORY[0x1E0C96790];
    v30[2] = *MEMORY[0x1E0C967F0];
    v30[3] = v11;
    v12 = *MEMORY[0x1E0C96780];
    v30[4] = *MEMORY[0x1E0C96798];
    v30[5] = v12;
    v13 = *MEMORY[0x1E0C967C0];
    v30[6] = *MEMORY[0x1E0C967A0];
    v30[7] = v13;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[8] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "initWithKeysToFetch:", v15);

  }
  v16 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForContactsMatchingPhoneNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v18);

  if (objc_msgSend(v5, "containsString:", CFSTR("@")))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v19);

  }
  objc_msgSend(v8, "setSortOrder:", 1);
  -[MapsSuggestionsRealContactsConnector store](a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__MapsSuggestionsRealContactsConnector__contactForIdentifier_usingRequest___block_invoke;
  v26[3] = &unk_1E4BCDD60;
  v26[4] = v31;
  objc_msgSend(v20, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v27, v26);
  v21 = v27;

  if (v21)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "Error fetching contact names %@", buf, 0xCu);
    }

    v23 = 0;
  }
  else
  {
    v23 = *(id *)(*(_QWORD *)&v31[8] + 40);
  }

  _Block_object_dispose(v31, 8);
LABEL_17:

  return v23;
}

void __75__MapsSuggestionsRealContactsConnector__contactForIdentifier_usingRequest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }
  *a3 = 1;

}

- (id)imageDataForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C97210]);
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C96708], *MEMORY[0x1E0C96890], *MEMORY[0x1E0C96700]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithKeysToFetch:", v7);

    -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (objc_msgSend(v9, "imageDataAvailable"))
    {
      objc_msgSend(v9, "thumbnailImageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(v9, "imageData");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v13;

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealContactsConnector.m";
      v18 = 1024;
      v19 = 151;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRealContactsConnector imageDataForIdentifier:]";
      v22 = 2082;
      v23 = "nil == (identifier)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier", buf, 0x26u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)dataForContactWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v25;
  _BYTE buf[24];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C97210]);
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v6;
    objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C96790];
    *(_QWORD *)&buf[8] = v7;
    *(_QWORD *)&buf[16] = v8;
    v9 = *MEMORY[0x1E0C96780];
    v27 = *MEMORY[0x1E0C966D0];
    v28 = v9;
    v10 = *MEMORY[0x1E0C96798];
    v29 = *MEMORY[0x1E0C966C0];
    v30 = v10;
    v11 = *MEMORY[0x1E0C967D8];
    v31 = *MEMORY[0x1E0C967A0];
    v32 = v11;
    v12 = *MEMORY[0x1E0C967D0];
    v33 = *MEMORY[0x1E0C967E0];
    v34 = v12;
    v13 = *MEMORY[0x1E0C96898];
    v35 = *MEMORY[0x1E0C967B8];
    v36 = v13;
    v14 = *MEMORY[0x1E0C966A8];
    v37 = *MEMORY[0x1E0C967C0];
    v38 = v14;
    v15 = *MEMORY[0x1E0C968A0];
    v39 = *MEMORY[0x1E0C967F0];
    v40 = v15;
    v16 = *MEMORY[0x1E0C96708];
    v41 = *MEMORY[0x1E0C96700];
    v42 = v16;
    v43 = *MEMORY[0x1E0C96890];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v17);

  -[MapsSuggestionsRealContactsConnector _contactForIdentifier:usingRequest:](self, v4, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    GEOFindOrCreateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, "Error serializing CNContact with identifier: %@. Error: %@", buf, 0x16u);
    }

  }
  return v20;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

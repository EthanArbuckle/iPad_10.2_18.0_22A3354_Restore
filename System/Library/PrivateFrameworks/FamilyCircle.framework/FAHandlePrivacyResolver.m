@implementation FAHandlePrivacyResolver

+ (id)getFamilyCircle
{
  FAFetchFamilyCircleRequest *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v2 = objc_alloc_init(FAFetchFamilyCircleRequest);
  -[FAFetchFamilyCircleRequest setCachePolicy:](v2, "setCachePolicy:", 0);
  v7 = 0;
  -[FAFetchFamilyCircleRequest fetchFamilyCircleWithError:](v2, "fetchFamilyCircleWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[FAHandlePrivacyResolver getFamilyCircle].cold.1((uint64_t)v4, v5);

  }
  return v3;
}

+ (id)privacySafeInvitees:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 1)
  {
    v7 = v6 + 1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", (v7 - 2));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v8);
      v10 = v9;
      if (!v9
        || (objc_msgSend(v9, "fullyQualifiedDigits"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        objc_msgSend(v4, "addObject:", v8);
        objc_msgSend(v5, "removeObjectAtIndex:", (v7 - 2));
      }

      --v7;
    }
    while (v7 > 1);
  }
  if (objc_msgSend(v5, "count"))
  {
    +[FAHandlePrivacyResolver getFamilyCircle](FAHandlePrivacyResolver, "getFamilyCircle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v26 = v5;
      v27 = v3;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = v5;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v12, "memberForPhoneNumber:", v18, v26, v27);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "appleID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v20, "appleID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v22);

                _FALogSystem();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v20, "appleID");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v33 = v18;
                  v34 = 2112;
                  v35 = v24;
                  _os_log_impl(&dword_1CAEBA000, v23, OS_LOG_TYPE_DEFAULT, "Replaced %@ with %@ in invitee list", buf, 0x16u);

                }
              }
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v15);
      }

      v5 = v26;
      v3 = v27;
    }

  }
  return v4;
}

+ (void)getFamilyCircle
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_ERROR, "FAFetchFamilyCircleRequest failed %@", (uint8_t *)&v2, 0xCu);
}

@end

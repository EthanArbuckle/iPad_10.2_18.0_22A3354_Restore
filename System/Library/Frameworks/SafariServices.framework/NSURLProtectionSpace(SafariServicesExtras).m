@implementation NSURLProtectionSpace(SafariServicesExtras)

- (id)_sf_highLevelDomainAndPort
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld"), v6, objc_msgSend(a1, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sf_identities
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  CFAbsoluteTime Current;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _BYTE *v21;
  CFAbsoluteTime v22;
  CFTypeRef result;
  uint8_t v24[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE buf[24];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    result = 0;
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setValue:forKey:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v2, "setValue:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
    objc_msgSend(v2, "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7028]);
    objc_msgSend(v2, "setValue:forKey:", CFSTR("com.apple.identities"), *MEMORY[0x1E0CD6898]);
    if (SecItemCopyMatching((CFDictionaryRef)v2, &result))
    {
      v3 = 0;
    }
    else
    {
      v4 = (void *)result;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "distinguishedNames");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = WBS_LOG_CHANNEL_PREFIXClientAuthentication();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          v8 = objc_msgSend(v4, "count");
          v9 = objc_msgSend(v5, "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v9;
          _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Unfiltered identities count: %lu, distinguished names count: %lu", buf, 0x16u);

        }
        if (v5)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v29 = 0;
          Current = CFAbsoluteTimeGetCurrent();
          v16 = MEMORY[0x1E0C809B0];
          v17 = 3221225472;
          v18 = __60__NSURLProtectionSpace_SafariServicesExtras___sf_identities__block_invoke;
          v19 = &unk_1E4AC7E98;
          v22 = Current;
          v20 = v5;
          v21 = buf;
          objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)WBS_LOG_CHANNEL_PREFIXClientAuthentication();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_msgSend(v11, "count", v16, v17, v18, v19);
            v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
            *(_DWORD *)v24 = 134218240;
            v25 = v13;
            v26 = 2048;
            v27 = v14;
            _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Filtered identities count: %lu, expired count: %lu", v24, 0x16u);
          }

          if (objc_msgSend(v11, "count"))
            v3 = v11;
          else
            v3 = 0;

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v3 = v4;
        }

      }
      else
      {
        v3 = 0;
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_sf_canAuthenticate
{
  void *v2;
  _BOOL8 v3;
  void *v5;
  NSObject *v6;

  objc_msgSend(a1, "authenticationMethod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B38]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B48]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B50]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B40]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B58]) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B30]))
  {
    objc_msgSend(a1, "_sf_identities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C92B68]) & 1) == 0)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NSURLProtectionSpace(SafariServicesExtras) _sf_canAuthenticate].cold.1((uint64_t)v2, v6);
    }
    v3 = 0;
  }

  return v3;
}

- (void)_sf_canAuthenticate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Tried to authenticate with unsupported authentication method: %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation NSMutableURLRequest(iTunes)

- (void)fam_addiTunesHeadersWithAccount:()iTunes
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ams_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v8, CFSTR("X-iTunes-DSID"));

    }
    objc_msgSend(v5, "ams_cookies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3670], "requestHeaderFieldsWithCookies:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, &v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (v11)
      {
        objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(a1, "setValue:forHTTPHeaderField:", v13, CFSTR("X-iTunes-LoggedIn-Data"));
      }
      else
      {
        _FALogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v12;
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_1CAEBA000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't serialize iTunes cookies with error: %@, cookies: %@", buf, 0x16u);
        }
      }

    }
    objc_msgSend(v5, "username");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v14, CFSTR("X-iTunes-AppleId"));
    v15 = (void *)MEMORY[0x1E0CFDCA8];
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userAgentForProcessInfo:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v17, CFSTR("X-iTunes-User-Agent"));

  }
}

@end

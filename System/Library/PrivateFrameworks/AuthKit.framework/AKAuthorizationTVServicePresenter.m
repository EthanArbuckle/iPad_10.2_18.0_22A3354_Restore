@implementation AKAuthorizationTVServicePresenter

- (int64_t)typeOfMessage:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAuthorizationTVServicePresenter _typeFromString:](self, "_typeFromString:", v4);

  return v5;
}

- (id)buildDidTapNotificationMessage
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("type");
  -[AKAuthorizationTVServicePresenter _stringForType:](self, "_stringForType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildDidStartServerAuthorizationMessage
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("type");
  -[AKAuthorizationTVServicePresenter _stringForType:](self, "_stringForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildFetchAppIconMessage
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("type");
  -[AKAuthorizationTVServicePresenter _stringForType:](self, "_stringForType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildFetchAppIconReplyWithImageData:(id)a3 imageScale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = CFSTR("type");
  -[AKAuthorizationTVServicePresenter _stringForType:](self, "_stringForType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6 && v7)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("IconData"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("IconScale"));
  }
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (int64_t)_typeFromString:(id)a3
{
  void *v3;
  int64_t v4;

  -[AKAuthorizationTVServicePresenter _filterDeprecatedType:](self, "_filterDeprecatedType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DidTapNotification")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DidStartServerAuthorization")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FetchAppIcon")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FetchAppIconReply")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E2E5EF60[a3 - 1];
}

- (id)_filterDeprecatedType:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StartProgressAnimation")) & 1) != 0)
    v4 = CFSTR("DidTapNotification");
  else
    v4 = (__CFString *)v3;

  return v4;
}

@end

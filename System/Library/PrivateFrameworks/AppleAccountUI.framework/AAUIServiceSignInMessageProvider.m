@implementation AAUIServiceSignInMessageProvider

+ (id)messageForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "splitSignIn"))
  {
    objc_msgSend(v4, "serviceTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_messageStringForSplitSignInWithServiceTypes:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0CFCF38];

    if (v7 == v8)
    {
      objc_msgSend(a1, "_messageStringForAMPService:", objc_msgSend(v4, "ampServiceType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_messageStringForService:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

LABEL_7:
  return v9;
}

+ (id)_messageStringForSplitSignInWithServiceTypes:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_msgSend(a3, "containsObject:", *MEMORY[0x1E0CFCF38]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("SIGN_IN_SUBTITLE_SPLIT_STORE");
  else
    v6 = CFSTR("SIGN_IN_SUBTITLE_SPLIT_ICLOUD");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_messageStringForService:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Setting default subtitle.", v20, 2u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CFCF18]))
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Setting iCloud subtitle.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SIGN_IN_SUBTITLE_ICLOUD");
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF30]))
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Setting iMessage subtitle.", v18, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SIGN_IN_SUBTITLE_IMESSAGE");
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF20]))
  {
    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Setting FaceTime subtitle.", v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SIGN_IN_SUBTITLE_FACETIME");
    goto LABEL_21;
  }
  v12 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFCF28]);
  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[AAUIServiceSignInMessageProvider _messageStringForService:].cold.1((uint64_t)v4, v9);
LABEL_8:

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SIGN_IN_SUBTITLE");
    goto LABEL_21;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Setting GameCenter subtitle.", v16, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("SIGN_IN_SUBTITLE_GAMECENTER");
LABEL_21:
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_messageStringForAMPService:(unint64_t)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  switch(a3)
  {
    case 0uLL:
      _AAUILogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Setting App Store subtitle.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_STORE");
      goto LABEL_23;
    case 1uLL:
      _AAUILogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Setting Apple TV subtitle.", v20, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_TV");
      goto LABEL_23;
    case 2uLL:
      _AAUILogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Setting Apple Music subtitle.", v19, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_MUSIC");
      goto LABEL_23;
    case 3uLL:
      _AAUILogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Setting Apple Podcasts subtitle.", v18, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_PODCASTS");
      goto LABEL_23;
    case 4uLL:
      _AAUILogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Setting Apple Books subtitle.", v17, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_BOOKS");
      goto LABEL_23;
    case 5uLL:
      _AAUILogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "Setting Apple News subtitle.", v16, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_NEWS");
      goto LABEL_23;
    case 6uLL:
      _AAUILogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Setting Apple Fitness+ subtitle.", v15, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("SIGN_IN_SUBTITLE_FITNESS");
LABEL_23:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1EA2E2A18, CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (void)_messageStringForService:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Invalid service type (%{private}@) provided, please file a radar!", (uint8_t *)&v2, 0xCu);
}

@end

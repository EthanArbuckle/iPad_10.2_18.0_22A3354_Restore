@implementation AASignInWithAppleManagementUIRequest

- (id)urlString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "siwaManagementURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)urlRequest
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  objc_super v8;

  v3 = -[AASignInWithAppleManagementUIRequest _isPasswordAppInstalled](self, "_isPasswordAppInstalled");
  v8.receiver = self;
  v8.super_class = (Class)AASignInWithAppleManagementUIRequest;
  -[AAAppleIDSettingsRequest urlRequest](&v8, sel_urlRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = kAATrueString;
  if (!v3)
    v6 = kAAFalseString;
  objc_msgSend(v5, "addValue:forHTTPHeaderField:", *v6, CFSTR("X-Apple-I-PAI"));
  return v5;
}

- (BOOL)_isPasswordAppInstalled
{
  void *v2;
  id v3;
  NSObject *v4;
  char v5;
  void *v6;
  id v8;

  v8 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Passwords"), 1, &v8);
  v3 = v8;
  if (v2)
  {
    objc_msgSend(v2, "applicationState");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isInstalled](v4, "isInstalled") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v2, "applicationState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isPlaceholder");

    }
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[AASignInWithAppleManagementUIRequest _isPasswordAppInstalled].cold.1((uint64_t)v3, v4);
    v5 = 0;
  }

  return v5;
}

- (void)_isPasswordAppInstalled
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("com.apple.Passwords");
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "Error creating appRecord for %@. %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation ASTConnectionUtilities

+ (BOOL)didEncounterNetworkDisconnectionError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "code") == -1009
      || objc_msgSend(v4, "code") == -1005
      || objc_msgSend(v4, "code") == -1004
      || objc_msgSend(v4, "code") == -1001;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isValidResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      isKindOfClass = objc_msgSend(v5, "isEqualToString:", CFSTR("NoError"));
    else
      isKindOfClass = 0;

  }
  else
  {
    isKindOfClass = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("response"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F975FC8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_msgSend(v8, "containsObject:", v7);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suites"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("diagnosticEventId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("archived"));
  v21 = objc_claimAutoreleasedReturnValue();
  v11 = (v21 != 0) | isKindOfClass;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("messages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("images"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v12 && v13 && v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();
    }
    else
    {
      v11 = 0;
    }
  }
  v16 = (void *)v9;
  v23 = v4;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("suiteName"), v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("components"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17 && v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11 & 1;
}

+ (BOOL)relaxTimeouts
{
  void *v2;
  char v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("RelaxTimeouts"), CFSTR("com.apple.AppleServiceToolkit"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)getServerLoggingSelection
{
  if (getServerLoggingSelection_onceToken != -1)
    dispatch_once(&getServerLoggingSelection_onceToken, &__block_literal_global_2);
  if (getServerLoggingSelection_selection)
    return (id)getServerLoggingSelection_selection;
  else
    return &unk_24F975FE0;
}

void __51__ASTConnectionUtilities_getServerLoggingSelection__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  v0 = CFPreferencesCopyAppValue(CFSTR("ServerLogging"), CFSTR("com.apple.AppleServiceToolkit"));
  v1 = (void *)getServerLoggingSelection_selection;
  getServerLoggingSelection_selection = (uint64_t)v0;

}

+ (id)MD5HeaderValueForTask:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AST-file-MD5"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AST-file-MD5"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Etag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Etag"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isGzipEnabled
{
  if (isGzipEnabled_onceToken != -1)
    dispatch_once(&isGzipEnabled_onceToken, &__block_literal_global_29);
  return isGzipEnabled_gzipEnabled;
}

uint64_t __39__ASTConnectionUtilities_isGzipEnabled__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("GZIPEnabled"), CFSTR("com.apple.AppleServiceToolkit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 0;
  v2 = !v1;
  isGzipEnabled_gzipEnabled = v2;
  return result;
}

+ (BOOL)useChunkedTransferEncoding
{
  if (useChunkedTransferEncoding_onceToken != -1)
    dispatch_once(&useChunkedTransferEncoding_onceToken, &__block_literal_global_30);
  return useChunkedTransferEncoding__useChunkedTransferEncoding;
}

uint64_t __52__ASTConnectionUtilities_useChunkedTransferEncoding__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("UseChunkedTransferEncoding"), CFSTR("com.apple.AppleServiceToolkit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 0;
  v2 = !v1;
  useChunkedTransferEncoding__useChunkedTransferEncoding = v2;
  return result;
}

+ (unint64_t)allowCellularSizeThreshold
{
  if (allowCellularSizeThreshold_onceToken != -1)
    dispatch_once(&allowCellularSizeThreshold_onceToken, &__block_literal_global_31);
  return allowCellularSizeThreshold__allowCellularSizeThreshold;
}

CFIndex __52__ASTConnectionUtilities_allowCellularSizeThreshold__block_invoke()
{
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  allowCellularSizeThreshold__allowCellularSizeThreshold = -1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("AllowCellularData"), CFSTR("com.apple.AppleServiceToolkit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((result & 0x8000000000000000) == 0)
      allowCellularSizeThreshold__allowCellularSizeThreshold = result;
  }
  return result;
}

+ (BOOL)trustIsValidWithProtectionSpace:(id)a3 rootOfTrust:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __SecTrust *v8;
  void *v9;
  const void *AppleAST2Service;
  OSStatus v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFErrorRef v37;
  NSObject *v38;
  NSObject *v39;
  uint8_t v41[8];
  CFErrorRef error;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    ASTLogHandleForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.5(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "serverTrust");
  if (!v7)
  {
LABEL_9:
    ASTLogHandleForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.4(v20, v21, v22, v23, v24, v25, v26, v27);

    v8 = 0;
    v28 = 0;
LABEL_13:
    ASTLogHandleForCategory(1);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);

    v11 = 0;
    if (!v28)
      goto LABEL_20;
    goto LABEL_16;
  }
  v8 = (__SecTrust *)v7;
  if (a4 - 4 > 0xFFFFFFFFFFFFFFFDLL
    || (objc_msgSend(v6, "host"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        AppleAST2Service = (const void *)SecPolicyCreateAppleAST2Service(),
        v9,
        !AppleAST2Service))
  {
    v28 = 1;
    goto LABEL_13;
  }
  v11 = SecTrustSetPolicies(v8, AppleAST2Service);
  CFRelease(AppleAST2Service);
LABEL_16:
  if (!v11)
  {
    error = 0;
    LODWORD(v8) = SecTrustEvaluateWithError(v8, &error);
    v37 = error;
    ASTLogHandleForCategory(1);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if ((_DWORD)v8)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_22D91B000, v39, OS_LOG_TYPE_DEFAULT, "SecTrust cert is trusted", v41, 2u);
      }
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.1((uint64_t)v37, v39);
    }

    goto LABEL_26;
  }
LABEL_20:
  ASTLogHandleForCategory(1);
  v8 = (__SecTrust *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.2(v11, v8);

  LOBYTE(v8) = 0;
LABEL_26:

  return (char)v8;
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a1 rootOfTrust:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22D91B000, a2, OS_LOG_TYPE_ERROR, "SecTrust cert is not trusted: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)trustIsValidWithProtectionSpace:(int)a1 rootOfTrust:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22D91B000, a2, OS_LOG_TYPE_ERROR, "SecTrustSetAnchorCertificates failed: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "No policy.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "No server trust.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "No protection space.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end

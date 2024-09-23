@implementation MSNTTR

+ (id)sharedInstance
{
  id v2;

  if (os_variant_allows_internal_security_policies())
  {
    if (sharedInstance_onceToken != -1)
      dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
    v2 = (id)sharedInstance_ttr;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __24__MSNTTR_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_ttr;
  sharedInstance_ttr = v0;

}

- (void)beginTTRWithTitle:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MSNTTR beginTTRWithTitle:date:](self, "beginTTRWithTitle:date:", v5, v6);

}

- (void)beginTTRWithTitle:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  MSNTTR *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
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
  MSNTTR *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((os_variant_allows_internal_security_policies() & 1) == 0)
  {
    qword_1EFE381E8 = (uint64_t)"TTR instance should not exist on customer build.";
    MSNLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MSNTTR beginTTRWithTitle:date:].cold.2(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_21:

    abort();
  }
  +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
  v8 = (MSNTTR *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    qword_1EFE381E8 = (uint64_t)"MSNTTR is a singleton.";
    MSNLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MSNTTR beginTTRWithTitle:date:].cold.1(v29, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_21;
  }
  v9 = -[MSNTTR TTRInProgress](self, "TTRInProgress");
  MSNLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D416F000, v10, OS_LOG_TYPE_INFO, "Suppressing TTR due to TTR already in progress.", buf, 2u);
    }
  }
  else
  {
    v44 = self;
    v46 = v7;
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v48 = v6;
      _os_log_impl(&dword_1D416F000, v10, OS_LOG_TYPE_INFO, "Attemting TTR: %@", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v12);

    -[NSObject removeCharactersInString:](v10, "removeCharactersInString:", CFSTR("&"));
    v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v13, "setDateFormat:", CFSTR("HH:mm:ss"));
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimeZone:", v14);

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("MediaSafetyNet"), "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("all"), "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("1066524"), "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "stringFromDate:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v16;
    objc_msgSend(v21, "stringWithFormat:", CFSTR("The mic or camera was unexpectedly used on the home/lock screen. Describe what you were doing, especially whether you were intentionally recording. Say what apps you were using and whether you noticed any indicators (such as double-height status bar or pill). The recorded device state was:\n\n%@\n\nThe event occurred at: %@"), v16, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&ComponentName=%@&ComponentVersion=%@&Reproducibility=Not%%20Applicable&ComponentID=%@&Classification=Crash/Hang/Data%%20Loss&Description=%@"), v17, v18, v19, v20, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSNTTR setUrl:](v44, "setUrl:", v26);

    MSNLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v25;
      _os_log_impl(&dword_1D416F000, v27, OS_LOG_TYPE_INFO, "TTR: %@", buf, 0xCu);
    }

    if (g_uiState == 1)
    {
      MSNLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v7 = v46;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D416F000, v28, OS_LOG_TYPE_INFO, "Delaying TTR due to lockscreen.", buf, 2u);
      }

      -[MSNTTR setPendedTTR:](v44, "setPendedTTR:", 1);
    }
    else
    {
      -[MSNTTR continueTTR](v44, "continueTTR");
      v7 = v46;
    }

    v6 = v45;
  }

}

- (BOOL)TTRInProgress
{
  void *v2;
  BOOL v3;

  -[MSNTTR url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)continueTTR
{
  OUTLINED_FUNCTION_0(&dword_1D416F000, a1, a3, "Couldn't create runloop source", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleCallback:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  -[MSNTTR url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSNTTR setUrl:](self, "setUrl:", 0);
  CFPreferencesSetAppValue(CFSTR("MediaSafetyNetWaitingTTR"), 0, CFSTR("com.apple.mediaserverd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mediaserverd"));
  if (a3 == 1)
  {
    MSNLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D416F000, v8, OS_LOG_TYPE_INFO, "User cancelled TTR.", buf, 2u);
    }

  }
  else if (a3 == 2)
  {
    MSNLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D416F000, v6, OS_LOG_TYPE_INFO, "User cancelled TTR and suppressed forever.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31536000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("MediaSafetyNetLastTTR"), v7, CFSTR("com.apple.mediaserverd"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.mediaserverd"));
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __25__MSNTTR_handleCallback___block_invoke;
    v9[3] = &unk_1E9775FA8;
    v9[4] = self;
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __25__MSNTTR_handleCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTTR:", *(_QWORD *)(a1 + 40));
}

- (void)completeTTR:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 buf;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MSNLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D416F000, v4, OS_LOG_TYPE_INFO, "Completing TTR: %@.", (uint8_t *)&buf, 0xCu);
  }

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v5 = (void *)getLSApplicationWorkspaceClass_softClass;
  v11 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v13 = __getLSApplicationWorkspaceClass_block_invoke;
    v14 = &unk_1E9776098;
    v15 = &v8;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v9[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v6, "defaultWorkspace", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:configuration:completionHandler:", v3, 0, &__block_literal_global_42_0);

}

void __22__MSNTTR_completeTTR___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  MSNLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __22__MSNTTR_completeTTR___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1D416F000, v7, OS_LOG_TYPE_INFO, "TTR done: %@.", (uint8_t *)&v14, 0xCu);
  }

}

- (BOOL)pendedTTR
{
  return self->_pendedTTR;
}

- (void)setPendedTTR:(BOOL)a3
{
  self->_pendedTTR = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)beginTTRWithTitle:(uint64_t)a3 date:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)beginTTRWithTitle:(uint64_t)a3 date:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (uint64_t)continueTTR
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[MSNTTR continueTTR].cold.3(v0);
}

void __22__MSNTTR_completeTTR___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a2, a3, "TTR error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

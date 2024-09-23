@implementation AXMAudioSession

- (AXMAudioSession)init
{
  AXMAudioSession *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AXMAudioSession *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location;
  id v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)AXMAudioSession;
  v2 = -[AXMAudioSession init](&v46, sel_init);
  if (!v2)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMAudioSession setNotificationObserverTokens:](v2, "setNotificationObserverTokens:", v3);

  objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMAudioSession setSession:](v2, "setSession:", v4);

  -[AXMAudioSession session](v2, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C89690];
  v45 = 0;
  objc_msgSend(v5, "setCategory:withOptions:error:", v6, 1, &v45);
  v7 = v45;

  if (!v7)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMAudioSession notificationObserverTokens](v2, "notificationObserverTokens");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0C896F0];
    v19 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __23__AXMAudioSession_init__block_invoke;
    v42[3] = &unk_1E625D400;
    objc_copyWeak(&v43, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v18, 0, 0, v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    -[AXMAudioSession notificationObserverTokens](v2, "notificationObserverTokens");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0C89870];
    v40[0] = v19;
    v40[1] = 3221225472;
    v40[2] = __23__AXMAudioSession_init__block_invoke_2;
    v40[3] = &unk_1E625D400;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v22, 0, 0, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v23);

    -[AXMAudioSession notificationObserverTokens](v2, "notificationObserverTokens");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0C89730];
    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __23__AXMAudioSession_init__block_invoke_3;
    v38[3] = &unk_1E625D400;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v25, 0, 0, v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

    -[AXMAudioSession notificationObserverTokens](v2, "notificationObserverTokens");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0C89738];
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __23__AXMAudioSession_init__block_invoke_4;
    v36[3] = &unk_1E625D400;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v28, 0, 0, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v29);

    -[AXMAudioSession notificationObserverTokens](v2, "notificationObserverTokens");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0C89890];
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __23__AXMAudioSession_init__block_invoke_5;
    v34[3] = &unk_1E625D400;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v31, 0, 0, v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&location);
LABEL_7:
    v15 = v2;
    goto LABEL_8;
  }
  AXMediaLogOutput();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AXMAudioSession init].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  v15 = 0;
LABEL_8:

  return v15;
}

void __23__AXMAudioSession_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C89718]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C89700]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSessionInterrupted:options:", v6, v9);

}

void __23__AXMAudioSession_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C89880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C89878]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRouteChanged:previousRoute:", v6, v9);

}

void __23__AXMAudioSession_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMediaServicesLost");

}

void __23__AXMAudioSession_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMediaServicesReset");

}

void __23__AXMAudioSession_init__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89898]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSilenceSecondaryAudio:", v5);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXMAudioSession notificationObserverTokens](self, "notificationObserverTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)AXMAudioSession;
  -[AXMAudioSession dealloc](&v9, sel_dealloc);
}

- (BOOL)deactivateSessionWithError:(id *)a3
{
  void *v4;
  id v5;
  id v7;

  -[AXMAudioSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "setActive:error:", 0, &v7);
  v5 = v7;

  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v5 == 0;
}

- (BOOL)activateSessionWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;

  -[AXMAudioSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C89690];
  v19 = 0;
  objc_msgSend(v5, "setCategory:withOptions:error:", v6, 1, &v19);
  v7 = v19;

  if (v7
    || (-[AXMAudioSession session](self, "session"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = 0,
        v9 = 1,
        objc_msgSend(v8, "setActive:error:", 1, &v18),
        v7 = v18,
        v8,
        v7))
  {
    AXMediaLogOutput();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXMAudioSession activateSessionWithError:].cold.1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v9;
}

- (void)_handleSessionInterrupted:(unint64_t)a3 options:(unint64_t)a4
{
  NSObject *v6;

  AXMediaLogOutput();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXMAudioSession _handleSessionInterrupted:options:].cold.1(a4, a3, v6);

}

- (id)_stringForRouteChangeReason:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("Unknown");
  else
    return off_1E625D420[a3 - 1];
}

- (void)_handleRouteChanged:(unint64_t)a3 previousRoute:(id)a4
{
  NSObject *v6;

  AXMediaLogOutput();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXMAudioSession _handleRouteChanged:previousRoute:].cold.1(self, a3, v6);

}

- (void)_handleMediaServicesLost
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "Media services lost", a5, a6, a7, a8, 0);
}

- (void)_handleMediaServicesReset
{
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, a1, a3, "Media services reset", a5, a6, a7, a8, 0);
}

- (void)_handleSilenceSecondaryAudio:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;

  AXMediaLogOutput();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXMAudioSession _handleSilenceSecondaryAudio:].cold.1(a3, v4, v5);

}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSMutableArray)notificationObserverTokens
{
  return self->_notificationObserverTokens;
}

- (void)setNotificationObserverTokens:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObserverTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserverTokens, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Failed to set session category with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)activateSessionWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error updating audio session: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSessionInterrupted:(os_log_t)log options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("Ended");
  if (a2 == 1)
    v3 = CFSTR("Began");
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a1 != 0;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "Session interruption (%@). Resume? %d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleRouteChanged:(NSObject *)a3 previousRoute:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stringForRouteChangeReason:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a3, v5, "Route Changed. Reason: %@", (uint8_t *)&v6);

}

- (void)_handleSilenceSecondaryAudio:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("Ended");
  if (a1 == 1)
    v3 = CFSTR("Began");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1B0E3B000, a2, a3, "Should silence secondary audio (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end

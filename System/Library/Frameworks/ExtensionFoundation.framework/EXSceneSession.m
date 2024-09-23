@implementation EXSceneSession

void __45___EXSceneSession_shouldAcceptXPCConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45___EXSceneSession_shouldAcceptXPCConnection___block_invoke_cold_1();

  _EXSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "signpost") && os_signpost_enabled(v3))
  {
    v4 = v3;
    v5 = objc_msgSend(WeakRetained, "signpost");
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_190C25000, v4, OS_SIGNPOST_EVENT, v6, "extensionkit-lifecycle", "XPC connection invalidate", v11, 2u);
      }
    }

  }
  objc_msgSend(WeakRetained, "sceneConnectionListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  objc_msgSend(WeakRetained, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[_EXSceneSessionManager sharedInstance](_EXSceneSessionManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeSessionForIdentifier:", v10);

  }
}

void __56___EXSceneSession_connectSceneSessionWithRequest_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __45___EXSceneSession_shouldAcceptXPCConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "XPC interface invalidated for session '%{public}@'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end

@implementation SFSafariViewControllerPrewarmingSession

void __73___SFSafariViewControllerPrewarmingSession__sharedSessionCreateIfNeeded___block_invoke()
{
  _SFSafariViewControllerPrewarmingSession *v0;
  void *v1;

  v0 = objc_alloc_init(_SFSafariViewControllerPrewarmingSession);
  v1 = (void *)_sharedSessionCreateIfNeeded__sharedSession;
  _sharedSessionCreateIfNeeded__sharedSession = (uint64_t)v0;

}

uint64_t __69___SFSafariViewControllerPrewarmingSession_tokenWithIDDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_hasValidTokens");
  if ((result & 1) == 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPrewarming();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "All tokens are invalidated, disconnecting from service", v4, 2u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_disconnectFromService");
  }
  return result;
}

uint64_t __56___SFSafariViewControllerPrewarmingSession__validTokens__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

void __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTarget:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPrewarming();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke_cold_1(v11, v7);
  }

}

void __98___SFSafariViewControllerPrewarmingSession_remoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resume");

}

void __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to get remote view controller with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end

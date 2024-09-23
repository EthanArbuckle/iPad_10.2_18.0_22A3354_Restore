@implementation IDSService

void __44__IDSService_MSPExtras___msp_currentAccount__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  MSPGetSharedTripLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "loginID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_msp_validityDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218755;
    v16 = a3 + 1;
    v17 = 2048;
    v18 = v10;
    v19 = 2113;
    v20 = v11;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_INFO, "Checking account %lu/%lu: %{private}@ (%{public}@)...", (uint8_t *)&v15, 0x2Au);

  }
  if (objc_msgSend(v8, "accountType") == 1
    && objc_msgSend(v8, "isActive")
    && objc_msgSend(v8, "canSend"))
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = a3 + 1;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_INFO, "- account %lu is eligible for trip sharing", (uint8_t *)&v15, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    MSPGetSharedTripLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "- account is NOT eligible for trip sharing", (uint8_t *)&v15, 2u);
    }

  }
}

@end

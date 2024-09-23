@implementation CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand

void ___CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  _BYTE v14[22];
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0D87FE8];
  v7 = a2;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithErrorCode:", *MEMORY[0x1E0D88EA0]);
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D4CA58]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = &stru_1E3A37708;
    *(_DWORD *)v14 = 136315650;
    *(_QWORD *)&v14[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke";
    *(_WORD *)&v14[12] = 2112;
    if (v5)
      v12 = v5;
    *(_QWORD *)&v14[14] = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s kMRMediaRemoteNowPlayingInfoIsAlwaysLive = %@ %@", v14, 0x20u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)&v14[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke";
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s Reporting SAMPExceededSkipLimitErrorCode instead, because media is always live", v14, 0xCu);
    }
    objc_msgSend(v9, "setErrorCode:", *MEMORY[0x1E0D88DE8], *(_OWORD *)v14);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

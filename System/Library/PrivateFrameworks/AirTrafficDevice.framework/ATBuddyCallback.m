@implementation ATBuddyCallback

void ___ATBuddyCallback_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0DDC050], "sharedSecurityInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ATBuddyCallback_block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performBlockAfterFirstUnlock:", v3);

}

void ___ATBuddyCallback_block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_currentHostType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iTunes"));

  objc_msgSend(v1, "syncSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryiTunesSync();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v3;
    v9 = 1024;
    v10 = v4 != 0;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "Handling Buddy Finished Notification, hostIsITunes=%{BOOL}u, haveSyncSession=%{BOOL}u", (uint8_t *)v8, 0xEu);
  }

  if (v4)
    v6 = v3;
  else
    v6 = 0;
  if (v6 == 1)
  {
    +[ATRestoreManager sharedManager](ATRestoreManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restoreSessionActiveWithCompletion:", &__block_literal_global_390);

  }
}

void ___ATBuddyCallback_block_invoke_388(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    ATDisplaySyncAlert();
}

@end

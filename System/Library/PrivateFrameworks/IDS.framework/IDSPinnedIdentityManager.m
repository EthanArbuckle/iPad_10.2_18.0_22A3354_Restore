@implementation IDSPinnedIdentityManager

- (void)fetchIdentityForPinningWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSPinnedIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Client requested identity for pinning.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19075B770;
  v6[3] = &unk_1E2C61F38;
  v7 = v3;
  v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v6);

}

- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSPinnedIdentity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Client requested to pin identity {identityBlob: %@}", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19075B93C;
  v10[3] = &unk_1E2C61618;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v10);

}

- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D34D40], "IDSPinnedIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Client requested all pinned identities", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19075BAA8;
  v6[3] = &unk_1E2C61F38;
  v7 = v3;
  v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v6);

}

- (void)clearAllPinnedIdentities
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0D34D40], "IDSPinnedIdentity");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1906E0000, v2, OS_LOG_TYPE_DEFAULT, "Client requested to clear all pinned identities", v3, 2u);
  }

  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", &unk_1E2C5F2D0);
}

@end

@implementation BRCSharingCopyWebAuthTokenOperation

- (BRCSharingCopyWebAuthTokenOperation)initWithSyncContext:(id)a3 ckContainerID:(id)a4 sessionContext:(id)a5
{
  id v9;
  BRCSharingCopyWebAuthTokenOperation *v10;
  BRCSharingCopyWebAuthTokenOperation *v11;
  void *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCSharingCopyWebAuthTokenOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v14, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/copy-web-auth-token"), a3, a5);
  v11 = v10;
  if (v10)
  {
    -[_BRCOperation setNonDiscretionary:](v10, "setNonDiscretionary:", 1);
    objc_storeStrong((id *)&v11->_ckContainerID, a4);
    objc_msgSend(MEMORY[0x1E0C94F88], "br_sharingMisc");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v11, "setGroup:", v12);

  }
  return v11;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/copy-web-auth-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C94E78]);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setConfiguration:", v4);

  objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", self->_ckContainerID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContainer:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BRCSharingCopyWebAuthTokenOperation_main__block_invoke;
  v7[3] = &unk_1E87640E8;
  v7[4] = self;
  objc_msgSend(v3, "setFetchWebAuthTokenCompletionBlock:", v7);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v3);

}

void __43__BRCSharingCopyWebAuthTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] failed fetching webauth token for %@: %@%@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v5, v6);

}

- (NSString)ckContainerID
{
  return self->_ckContainerID;
}

- (void)setCkContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_ckContainerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainerID, 0);
}

@end

@implementation MessageListFetchHelper

void __29__MessageListFetchHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (MessageListFetchHelper)initWithFetchController:(id)a3 mailboxes:(id)a4
{
  id v7;
  id v8;
  MessageListFetchHelper *v9;
  MessageListFetchHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListFetchHelper;
  v9 = -[MessageListFetchHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[MessageListFetchHelper setMailboxes:](v9, "setMailboxes:", v8);
    objc_storeStrong((id *)&v10->_fetchController, a3);
  }

  return v10;
}

- (void)setMailboxes:(id)a3
{
  NSArray *v4;
  NSArray *mailboxes;
  NSArray *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_mailboxes, "isEqualToArray:"))
  {
    objc_msgSend(v8, "ef_filter:", &__block_literal_global_3);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mailboxes = self->_mailboxes;
    self->_mailboxes = v4;
    v6 = v4;

    v7 = -[NSArray count](v6, "count");
    self->_mailboxesNeedFetching = v7 != 0;
  }

}

uint64_t __39__MessageListFetchHelper_setMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartMailbox") ^ 1;
}

- (BOOL)fetchMailboxesIsUserInitiated:(BOOL)a3
{
  _BOOL4 v3;
  BOOL *p_mailboxesNeedFetching;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  unsigned int *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v15;
  _BOOL4 mailboxesNeedFetching;
  int v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  p_mailboxesNeedFetching = &self->_mailboxesNeedFetching;
  if (!self->_mailboxesNeedFetching && !a3)
  {
    +[MessageListFetchHelper log](MessageListFetchHelper, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[MessageListFetchHelper fetchMailboxesIsUserInitiated:].cold.2((unsigned __int8 *)p_mailboxesNeedFetching, v6);
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  self->_mailboxesNeedFetching = 0;
  -[MessageListFetchHelper mailboxes](self, "mailboxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  +[MessageListFetchHelper log](MessageListFetchHelper, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!v8)
  {
    if (v9)
      -[MessageListFetchHelper fetchMailboxesIsUserInitiated:].cold.1(v6);
    goto LABEL_13;
  }
  if (v9)
  {
    -[MessageListFetchHelper fetchController](self, "fetchController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    mailboxesNeedFetching = self->_mailboxesNeedFetching;
    v17 = 134218496;
    v18 = v15;
    v19 = 1024;
    v20 = mailboxesNeedFetching;
    v21 = 1024;
    v22 = v3;
    _os_log_debug_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEBUG, "Fetching (%p). _mailboxesNeedFetching: %{BOOL}d, userInitiated: %{BOOL}d", (uint8_t *)&v17, 0x18u);

  }
  v10 = (unsigned int *)MEMORY[0x1E0D1DC20];
  if (!v3)
    v10 = (unsigned int *)MEMORY[0x1E0D1DC18];
  v11 = *v10;
  -[MessageListFetchHelper fetchController](self, "fetchController");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MessageListFetchHelper mailboxes](self, "mailboxes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject performFetchOfType:mailboxes:](v6, "performFetchOfType:mailboxes:", v11, v12);

  v13 = 1;
LABEL_14:

  return v13;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (EMFetchController)fetchController
{
  return self->_fetchController;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MessageListFetchHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (OS_os_log *)(id)log_log_3;
}

- (void)setFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (void)fetchMailboxesIsUserInitiated:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D5522000, log, OS_LOG_TYPE_DEBUG, "No mailboxes.", v1, 2u);
}

- (void)fetchMailboxesIsUserInitiated:(unsigned __int8 *)a1 .cold.2(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = 0;
  _os_log_debug_impl(&dword_1D5522000, a2, OS_LOG_TYPE_DEBUG, "Not fetching. _mailboxesNeedFetching: %{BOOL}d, userInitiated: %{BOOL}d", (uint8_t *)v3, 0xEu);
}

@end

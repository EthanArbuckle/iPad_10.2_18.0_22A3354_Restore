@implementation DASharedCalendarContext

- (DASharedCalendarContext)initWithCalendarID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  DASharedCalendarContext *v16;
  DASharedCalendarContext *v17;
  uint64_t v18;
  id completionBlock;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
    -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:].cold.1();
  if (!v12)
    -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:].cold.2();
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)DASharedCalendarContext;
  v16 = -[DASharedCalendarContext init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_calendarID, a3);
    objc_storeStrong((id *)&v17->_accountID, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    v18 = objc_msgSend(v15, "copy");
    completionBlock = v17->_completionBlock;
    v17->_completionBlock = (id)v18;

  }
  return v17;
}

- (void)finishedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *calendarID;
  NSString *accountID;
  NSObject *v8;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    calendarID = self->_calendarID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    v16 = calendarID;
    v17 = 2112;
    v18 = accountID;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Share of calendar ID %@ for account %@ completed.", buf, 0x16u);
  }

  if (!v4 && -[DASharedCalendarContext shouldSyncCalendar](self, "shouldSyncCalendar"))
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__DASharedCalendarContext_finishedWithError___block_invoke;
    block[3] = &unk_1E7B9C908;
    block[4] = self;
    dispatch_async(v8, block);

  }
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v10 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__DASharedCalendarContext_finishedWithError___block_invoke_2;
    v12[3] = &unk_1E7B9C8E0;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v11, v12);

  }
}

void __45__DASharedCalendarContext_finishedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  +[CDDADConnection sharedConnection](CDDADConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 4, 1);

}

uint64_t __45__DASharedCalendarContext_finishedWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (NSString)calendarID
{
  return self->_calendarID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)shouldSyncCalendar
{
  return self->_shouldSyncCalendar;
}

- (void)setShouldSyncCalendar:(BOOL)a3
{
  self->_shouldSyncCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_calendarID, 0);
}

- (void)initWithCalendarID:accountID:queue:completionBlock:.cold.1()
{
  __assert_rtn("-[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]", "CDDADConnection.m", 248, "calendarID");
}

- (void)initWithCalendarID:accountID:queue:completionBlock:.cold.2()
{
  __assert_rtn("-[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]", "CDDADConnection.m", 249, "accountID");
}

@end

@implementation ESSharedCalendarContext

- (ESSharedCalendarContext)initWithCalendarID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  ESSharedCalendarContext *v16;
  ESSharedCalendarContext *v17;
  uint64_t v18;
  id completionBlock;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
    -[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:].cold.1();
  if (!v12)
    -[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:].cold.2();
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)ESSharedCalendarContext;
  v16 = -[ESSharedCalendarContext init](&v21, sel_init);
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
  os_log_type_t v6;
  NSString *calendarID;
  NSString *accountID;
  NSObject *v9;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    calendarID = self->_calendarID;
    accountID = self->_accountID;
    *(_DWORD *)buf = 138412546;
    v17 = calendarID;
    v18 = 2112;
    v19 = accountID;
    _os_log_impl(&dword_224A56000, v5, v6, "Share of calendar ID %@ for account %@ completed.", buf, 0x16u);
  }

  if (!v4 && -[ESSharedCalendarContext shouldSyncCalendar](self, "shouldSyncCalendar"))
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__ESSharedCalendarContext_finishedWithError___block_invoke;
    block[3] = &unk_24ECAB018;
    block[4] = self;
    dispatch_async(v9, block);

  }
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v11 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v11 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__ESSharedCalendarContext_finishedWithError___block_invoke_2;
    v13[3] = &unk_24ECAAFF0;
    v13[4] = self;
    v14 = v4;
    dispatch_async(v12, v13);

  }
}

void __45__ESSharedCalendarContext_finishedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  +[ESDConnection sharedConnection](ESDConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 4, 1);

}

uint64_t __45__ESSharedCalendarContext_finishedWithError___block_invoke_2(uint64_t a1)
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
  __assert_rtn("-[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]", "ESDConnection.m", 248, "calendarID");
}

- (void)initWithCalendarID:accountID:queue:completionBlock:.cold.2()
{
  __assert_rtn("-[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]", "ESDConnection.m", 249, "accountID");
}

@end

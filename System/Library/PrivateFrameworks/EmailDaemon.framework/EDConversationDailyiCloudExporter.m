@implementation EDConversationDailyiCloudExporter

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EDConversationDailyiCloudExporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_22 != -1)
    dispatch_once(&log_onceToken_22, block);
  return (OS_os_log *)(id)log_log_22;
}

void __40__EDConversationDailyiCloudExporter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_22;
  log_log_22 = (uint64_t)v1;

}

- (EDConversationDailyiCloudExporter)initWithDelegate:(id)a3 conversationManager:(id)a4
{
  id v7;
  id v8;
  EDConversationDailyiCloudExporter *v9;
  EDConversationDailyiCloudExporter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDConversationDailyiCloudExporter;
  v9 = -[EDConversationDailyiCloudExporter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_conversationManager, a4);
  }

  return v10;
}

- (void)run
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  -[EDConversationDailyiCloudExporter delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "previousSyncAnchorForDailyExport");

  -[EDConversationDailyiCloudExporter delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "currentSyncAnchorForDailyExport");

  -[EDConversationDailyiCloudExporter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flaggedConversationsChangedBetweenStartAnchor:endAnchor:", v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[EDConversationDailyiCloudExporter conversationManager](self, "conversationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDailyExportForChangedConversations:", v10);

  }
  -[EDConversationDailyiCloudExporter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNewPreviousSyncAnchorForDailyExport:", v4);

}

- (EDConversationDailyCloudExporterDelegate)delegate
{
  return self->_delegate;
}

- (EDUbiquitousConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end

@implementation FDWalletMessagingProvider

- (FDWalletMessagingProvider)init
{
  FDWalletMessagingProvider *v2;
  uint64_t v3;
  _TtC13FinanceDaemon23WalletMessagingProvider *wrappedProvider;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FDWalletMessagingProvider;
  v2 = -[FDWalletMessagingProvider init](&v7, sel_init);
  if (v2)
  {
    +[WalletMessagingProvider makeProvider](_TtC13FinanceDaemon23WalletMessagingProvider, "makeProvider");
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedProvider = v2->_wrappedProvider;
    v2->_wrappedProvider = (_TtC13FinanceDaemon23WalletMessagingProvider *)v3;

    if (!v2->_wrappedProvider)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Notifications");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FDWalletMessagingProvider init].cold.1(v5);

    }
  }
  return v2;
}

- (void)processMessagesWithCompletionHandler:(id)a3
{
  id v4;
  _TtC13FinanceDaemon23WalletMessagingProvider *wrappedProvider;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  wrappedProvider = self->_wrappedProvider;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FDWalletMessagingProvider_processMessagesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E8C68C78;
  v8 = v4;
  v6 = v4;
  -[WalletMessagingProvider processMessagesWithCompletionHandler:](wrappedProvider, "processMessagesWithCompletionHandler:", v7);

}

uint64_t __66__FDWalletMessagingProvider_processMessagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  return -[WalletMessagingProvider applicationMessageSink:createContentForMessageWithRegistration:](self->_wrappedProvider, "applicationMessageSink:createContentForMessageWithRegistration:", a3, a4);
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  -[WalletMessagingProvider applicationMessageSink:removedMessageWithRegistration:](self->_wrappedProvider, "applicationMessageSink:removedMessageWithRegistration:", a3, a4);
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  -[WalletMessagingProvider applicationMessageSink:tappedMessageWithRegistration:](self->_wrappedProvider, "applicationMessageSink:tappedMessageWithRegistration:", a3, a4);
}

- (void)connectApplicationMessageSink:(id)a3
{
  -[WalletMessagingProvider connectApplicationMessageSink:](self->_wrappedProvider, "connectApplicationMessageSink:", a3);
}

- (_TtC13FinanceDaemon23WalletMessagingProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)setWrappedProvider:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedProvider, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF3C3000, log, OS_LOG_TYPE_ERROR, "Error initializing WalletMessagingProvider", v1, 2u);
}

@end

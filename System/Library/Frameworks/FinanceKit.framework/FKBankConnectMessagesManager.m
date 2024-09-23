@implementation FKBankConnectMessagesManager

- (FKBankConnectMessagesManager)init
{
  FKBankConnectMessagesManager *v2;
  uint64_t v3;
  _TtC10FinanceKit26BankConnectMessagesManager *messagesManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectMessagesManager;
  v2 = -[FKBankConnectMessagesManager init](&v6, sel_init);
  if (v2)
  {
    +[BankConnectMessagesManager makeManager](_TtC10FinanceKit26BankConnectMessagesManager, "makeManager");
    v3 = objc_claimAutoreleasedReturnValue();
    messagesManager = v2->_messagesManager;
    v2->_messagesManager = (_TtC10FinanceKit26BankConnectMessagesManager *)v3;

  }
  return v2;
}

- (void)resetMessagesForFPANIdentifier:(id)a3
{
  -[BankConnectMessagesManager resetMessagesForFPANIdentifier:](self->_messagesManager, "resetMessagesForFPANIdentifier:", a3);
}

- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5
{
  -[BankConnectMessagesManager setIsDismissed:forPassMessage:withFPANIdentifier:](self->_messagesManager, "setIsDismissed:forPassMessage:withFPANIdentifier:", a3, a4, a5);
}

- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5
{
  -[BankConnectMessagesManager setIsDismissed:forAccountMessage:withAccountIdentifier:](self->_messagesManager, "setIsDismissed:forAccountMessage:withAccountIdentifier:", a3, a4, a5);
}

- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4
{
  return -[BankConnectMessagesManager isPassMessageDismissed:forFPANIdentifier:](self->_messagesManager, "isPassMessageDismissed:forFPANIdentifier:", a3, a4);
}

- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4
{
  return -[BankConnectMessagesManager isAccountMessageDismissed:forAccountIdentifier:](self->_messagesManager, "isAccountMessageDismissed:forAccountIdentifier:", a3, a4);
}

- (id)shouldDisplayBackgroundRefreshConfirmationMessageForFQAID:(id)a3
{
  _TtC10FinanceKit26BankConnectMessagesManager *messagesManager;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  FKBackgroundRefreshConfirmationPromptToken *v8;
  void *v9;
  void *v10;
  void *v11;
  FKBackgroundRefreshConfirmationPromptToken *v12;
  FKBackgroundRefreshConfirmationPromptDecision *v13;

  messagesManager = self->_messagesManager;
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BankConnectMessagesManager shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:now:](messagesManager, "shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:now:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [FKBackgroundRefreshConfirmationPromptToken alloc];
  objc_msgSend(v7, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fqaid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FKBackgroundRefreshConfirmationPromptToken initWithFullyQualifiedAccountIdentifier:sequenceNumber:](v8, "initWithFullyQualifiedAccountIdentifier:sequenceNumber:", v10, objc_msgSend(v11, "sequenceNumber"));

  v13 = -[FKBackgroundRefreshConfirmationPromptDecision initWithShouldShowPrompt:token:]([FKBackgroundRefreshConfirmationPromptDecision alloc], "initWithShouldShowPrompt:token:", objc_msgSend(v7, "shouldShowPrompt"), v12);
  return v13;
}

- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3
{
  id v4;
  BackgroundRefreshConfirmationPromptToken *v5;
  void *v6;
  uint64_t v7;
  BackgroundRefreshConfirmationPromptToken *v8;

  v4 = a3;
  v5 = [BackgroundRefreshConfirmationPromptToken alloc];
  objc_msgSend(v4, "fqaid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "sequenceNumber");

  v8 = -[BackgroundRefreshConfirmationPromptToken initWithFullyQualifiedAccountIdentifier:sequenceNumber:](v5, "initWithFullyQualifiedAccountIdentifier:sequenceNumber:", v6, v7);
  -[BankConnectMessagesManager dismissBackgroundRefreshConfirmationMessageWithToken:](self->_messagesManager, "dismissBackgroundRefreshConfirmationMessageWithToken:", v8);

}

- (_TtC10FinanceKit26BankConnectMessagesManager)messagesManager
{
  return self->_messagesManager;
}

- (void)setMessagesManager:(id)a3
{
  objc_storeStrong((id *)&self->_messagesManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesManager, 0);
}

@end

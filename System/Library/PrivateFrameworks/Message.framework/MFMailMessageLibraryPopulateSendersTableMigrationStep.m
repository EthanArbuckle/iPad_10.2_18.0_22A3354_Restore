@implementation MFMailMessageLibraryPopulateSendersTableMigrationStep

+ (int)runWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  v3 = a3;
  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = objc_msgSend(MEMORY[0x1E0D1EB90], "runWithConnection:sentMailboxURLs:contactStore:", v3, v5, v6) ^ 1;

  return v7;
}

id __75__MFMailMessageLibraryPopulateSendersTableMigrationStep_runWithConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mailboxUidOfType:createIfNeeded:", 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

@implementation ICNotesCrossProcessChangeCoordinator

- (ICNotesCrossProcessChangeCoordinator)initWithSourceCoordinator:(id)a3 destinationContext:(id)a4
{
  id v7;
  id v8;
  ICNotesCrossProcessChangeCoordinator *v9;
  ICNotesCrossProcessChangeCoordinator *v10;
  uint64_t v11;
  NSObject *accountsNotificationsObserver;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICNotesCrossProcessChangeCoordinator;
  v9 = -[ICNotesCrossProcessChangeCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7)
      objc_storeStrong((id *)&v9->_sourceCoordinator, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_destinationContext, a4);
      -[ICNotesCrossProcessChangeCoordinator registerForAccountNotifications](v10, "registerForAccountNotifications");
      v11 = objc_claimAutoreleasedReturnValue();
      accountsNotificationsObserver = v10->_accountsNotificationsObserver;
      v10->_accountsNotificationsObserver = v11;

    }
  }

  return v10;
}

- (id)registerForAccountNotifications
{
  return -[ICNotesCrossProcessChangeCoordinator registerForCrossProcessNotificationName:block:](self, "registerForCrossProcessNotificationName:block:", CFSTR("ICNotesCrossProcessAccountsDidChangeNotification"), &__block_literal_global_4);
}

- (id)registerForCrossProcessNotificationName:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICNotesCrossProcessChangeCoordinator registerForCrossProcessNotificationName:block:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke;
  v20[3] = &unk_1E76C7A18;
  v21 = v5;
  v22 = v6;
  v16 = v6;
  v17 = v5;
  objc_msgSend(v14, "addObserverForName:object:suspensionBehavior:queue:usingBlock:", v17, 0, 4, v15, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)registerForCrossProcessNotificationName:(uint64_t)a3 block:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Registering for cross-process notifications: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (id)registerForEditorExtensionDidSaveNotificationWithBlock:(id)a3
{
  return -[ICNotesCrossProcessChangeCoordinator registerForCrossProcessNotificationName:block:](self, "registerForCrossProcessNotificationName:block:", CFSTR("ICEditorExtensionDidSaveNotification"), a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ICNotesCrossProcessChangeCoordinator;
  -[ICNotesCrossProcessChangeCoordinator dealloc](&v5, sel_dealloc);
}

- (void)postCrossProcessNotificationName:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICNotesCrossProcessChangeCoordinator postCrossProcessNotificationName:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "processIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:deliverImmediately:", v3, v15, 0, 1);

}

void __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");

  if (v4 != v6)
  {
    v7 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)removeCrossProcessNotificationObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB35B0];
    v4 = a3;
    objc_msgSend(v3, "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v4);

  }
}

void __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;

  if (+[ICAccount clearAccountForAppleCloudKitTable](ICAccount, "clearAccountForAppleCloudKitTable"))
  {
    v0 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke_cold_1(v0);

  }
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cleanupAdditionalPersistentStores");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICAccountsDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D640D0], 0);

}

- (void)postAccountDidChangeNotification
{
  -[ICNotesCrossProcessChangeCoordinator postCrossProcessNotificationName:](self, "postCrossProcessNotificationName:", CFSTR("ICNotesCrossProcessAccountsDidChangeNotification"));
}

- (void)postEditorExtensionDidSaveNotification
{
  -[ICNotesCrossProcessChangeCoordinator postCrossProcessNotificationName:](self, "postCrossProcessNotificationName:", CFSTR("ICEditorExtensionDidSaveNotification"));
}

- (NSPersistentStoreCoordinator)sourceCoordinator
{
  return self->_sourceCoordinator;
}

- (void)setSourceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCoordinator, a3);
}

- (NSManagedObjectContext)destinationContext
{
  return self->_destinationContext;
}

- (void)setDestinationContext:(id)a3
{
  objc_storeStrong((id *)&self->_destinationContext, a3);
}

- (NSObject)accountsNotificationsObserver
{
  return self->_accountsNotificationsObserver;
}

- (void)setAccountsNotificationsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountsNotificationsObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsNotificationsObserver, 0);
  objc_storeStrong((id *)&self->_destinationContext, 0);
  objc_storeStrong((id *)&self->_sourceCoordinator, 0);
}

- (void)postCrossProcessNotificationName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Sending cross process notification: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __86__ICNotesCrossProcessChangeCoordinator_registerForCrossProcessNotificationName_block___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Handling cross-process notification: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __71__ICNotesCrossProcessChangeCoordinator_registerForAccountNotifications__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Released the cached CloudKit account", v1, 2u);
}

@end

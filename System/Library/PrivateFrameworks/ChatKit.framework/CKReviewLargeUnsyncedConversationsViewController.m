@implementation CKReviewLargeUnsyncedConversationsViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKReviewLargeUnsyncedConversationsViewController daemonConnection](self, "daemonConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CKReviewLargeUnsyncedConversationsViewController setDaemonConnection:](self, "setDaemonConnection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKReviewLargeUnsyncedConversationsViewController;
  -[CKAbstractReviewViewController dealloc](&v4, sel_dealloc);
}

- (id)navigationBarTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONS"), &stru_1E276D870, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableViewCellReuseIdentifier
{
  return CFSTR("Conversation");
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (void)reloadModelData
{
  -[CKReviewLargeUnsyncedConversationsViewController setConversations:](self, "setConversations:", 0);
}

- (unint64_t)numberOfModelObjects
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    return v5;
  }
  else
  {
    -[CKReviewLargeUnsyncedConversationsViewController _populateConversationsIfNeeded](self, "_populateConversationsIfNeeded");
    return 1;
  }
}

- (id)modelObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKReviewLargeUnsyncedConversationsViewController _populateConversationsIfNeeded](self, "_populateConversationsIfNeeded");
    +[CKStorageLoadingCell reuseIdentifier](CKStorageLoadingCell, "reuseIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)deleteModelObjectAndUnderlyingData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remove");

  -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByExcludingObjectsInArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKReviewLargeUnsyncedConversationsViewController setConversations:](self, "setConversations:", v8);

}

- (void)didSelectModelObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("chat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesURLWithChat:orHandles:withMessageText:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__CKReviewLargeUnsyncedConversationsViewController_didSelectModelObjectAtIndex___block_invoke;
  v11[3] = &unk_1E274A1B8;
  v11[4] = self;
  objc_msgSend(v10, "openURL:withCompletionHandler:", v9, v11);

}

void __80__CKReviewLargeUnsyncedConversationsViewController_didSelectModelObjectAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 0);

}

- (void)_populateConversationsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[CKReviewLargeUnsyncedConversationsViewController conversations](self, "conversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CKReviewLargeUnsyncedConversationsViewController daemonConnection](self, "daemonConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "multiplexedConnectionWithLabel:capabilities:context:", v7, 4485383, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKReviewLargeUnsyncedConversationsViewController setDaemonConnection:](self, "setDaemonConnection:", v8);

    }
    -[CKReviewLargeUnsyncedConversationsViewController daemonConnection](self, "daemonConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke;
    v10[3] = &unk_1E274A208;
    v10[4] = self;
    objc_msgSend(v9, "connectWithCompletion:", v10);

  }
}

void __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke_2;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E0C80D38], block);
}

void __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if (v4)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Loading synced conversations", buf, 2u);
        }

      }
      v6 = 2;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke_45;
  v12[3] = &unk_1E274A1E0;
  v13 = v2;
  v9 = v2;
  objc_msgSend(v8, "enumerateAllChatsAndAttachmentSizesWithOptions:usingBlock:", v6, v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setConversations:", v10);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

void __82__CKReviewLargeUnsyncedConversationsViewController__populateConversationsIfNeeded__block_invoke_45(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = *(void **)(a1 + 32);
  v14[0] = CFSTR("chat");
  v14[1] = CFSTR("size");
  v15[0] = a2;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a2;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  v13 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v13 >= 0x14)
    *a5 = 1;
}

- (NSArray)conversations
{
  return self->_conversations;
}

- (void)setConversations:(id)a3
{
  objc_storeStrong((id *)&self->_conversations, a3);
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
}

@end
